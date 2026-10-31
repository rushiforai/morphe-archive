#include "remote_strip.h"

#include <cstring>
#include <string.h>   // memmem (bionic)

// ISSUE #14 RESTART FIX toggle. When 1, Remote ad items that resolve via
// getVideoAds are LEFT IN PLACE (not blanked) so the app resolves them and the
// geometry-safe PATH 2 (maybe_empty_regolith) empties the resolved response —
// the app's designed clean empty-break path — instead of PATH 1 structurally
// removing them, which leaves PeriodTailor a ~ad-length gap it fills with
// non-existent media -> content resets to start (see hooks.cpp / memory notes).
#ifndef PV_SKIP_GVA_REMOTES
#define PV_SKIP_GVA_REMOTES 0
#endif

#ifndef PV_REMOTE_DIAG
#define PV_REMOTE_DIAG 0
#endif

namespace pvfilter {

namespace {

constexpr char kMarker[] = "\"intraTitlePlaylist\":[";
constexpr size_t kMarkerLen = sizeof(kMarker) - 1; // exclude trailing NUL
constexpr size_t kTrunc = static_cast<size_t>(-1);
constexpr size_t kMaxElems = 128; // real PRS playlists are a handful of items; bail safe if exceeded

bool is_ws(char c) { return c == ' ' || c == '\t' || c == '\n' || c == '\r'; }

size_t skip_ws(const char* s, size_t len, size_t i) {
    while (i < len && is_ws(s[i])) ++i;
    return i;
}

// Returns the index just past the value starting at s[i], or kTrunc if the
// value's end (closing quote/brace/bracket) is not present within [0,len).
// Direct port of cmod-strip2.js's scanVal.
size_t scan_val(const char* s, size_t len, size_t i) {
    if (i >= len) return kTrunc;
    char c = s[i];

    if (c == '"') {
        ++i;
        while (i < len) {
            if (s[i] == '\\') { i += 2; continue; }
            if (s[i] == '"') return i + 1;
            ++i;
        }
        return kTrunc;
    }
    if (c == '{' || c == '[') {
        char open = c, close = (c == '{') ? '}' : ']';
        int depth = 0;
        while (i < len) {
            char d = s[i];
            if (d == '"') {
                size_t j = scan_val(s, len, i);
                if (j == kTrunc) return kTrunc;
                i = j;
                continue;
            }
            if (d == open) { ++depth; ++i; }
            else if (d == close) { --depth; ++i; if (depth == 0) return i; }
            else ++i;
        }
        return kTrunc;
    }
    // number / true / false / null: run to the next structural delimiter.
    // Running off the end of the buffer without hitting one is truncation.
    while (i < len && s[i] != ',' && s[i] != '}' && s[i] != ']' && !is_ws(s[i])) ++i;
    if (i >= len) return kTrunc;
    return i;
}

// Anywhere-in-range check for "type":"Remote" (mirrors the JS regex
// /"type"\s*:\s*"Remote"/ applied to the element's substring: keep scanning
// past a literal "type" occurrence that isn't actually followed by the key's
// colon+value, since it could be a coincidental substring elsewhere).
bool is_remote_type(const char* s, size_t start, size_t end) {
    constexpr char key[] = "\"type\"";
    constexpr size_t keylen = sizeof(key) - 1;
    constexpr char val[] = "\"Remote\"";
    constexpr size_t vallen = sizeof(val) - 1;
    if (end < start + keylen) return false;
    for (size_t p = start; p + keylen <= end; ++p) {
        if (memcmp(s + p, key, keylen) != 0) continue;
        size_t q = skip_ws(s, end, p + keylen);
        if (q < end && s[q] == ':') {
            q = skip_ws(s, end, q + 1);
            if (q + vallen <= end && memcmp(s + q, val, vallen) == 0) return true;
        }
    }
    return false;
}

bool contains_bytes(const char* s, size_t start, size_t end,
                    const char* needle, size_t needle_len) {
    if (end < start || needle_len > end - start) return false;
    for (size_t p = start; p + needle_len <= end; ++p) {
        if (memcmp(s + p, needle, needle_len) == 0) return true;
    }
    return false;
}

// Copy top-level object key names into a comma-separated summary. Values are
// skipped and never copied, so logs cannot expose URLs, IDs, or tokens.
void collect_key_names(const char* s, size_t start, size_t end, char* out, size_t out_len) {
    if (out_len == 0) return;
    out[0] = '\0';
    if (start >= end || s[start] != '{') return;
    size_t i = skip_ws(s, end, start + 1);
    size_t used = 0;
    while (i < end && s[i] != '}') {
        if (s[i] != '"') return;
        size_t key_end = scan_val(s, end, i);
        if (key_end == kTrunc || key_end < i + 2) return;
        size_t colon = skip_ws(s, end, key_end);
        if (colon >= end || s[colon] != ':') return;

        if (used > 0 && used + 1 < out_len) out[used++] = ',';
        for (size_t p = i + 1; p + 1 < key_end && used + 1 < out_len; ++p) {
            char c = s[p];
            out[used++] = (c >= 0x20 && c <= 0x7e && c != ',') ? c : '?';
        }
        out[used] = '\0';

        size_t value = skip_ws(s, end, colon + 1);
        size_t value_end = scan_val(s, end, value);
        if (value_end == kTrunc) return;
        i = skip_ws(s, end, value_end);
        if (i < end && s[i] == ',') i = skip_ws(s, end, i + 1);
        else if (i < end && s[i] != '}') return;
    }
}

struct Elem {
    size_t start = 0, end = 0;
    bool is_remote = false;
    bool has_comma = false;
    size_t comma_pos = 0;
};

struct ParseResult {
    size_t rb = 0;
    size_t elem_count = 0;
    Elem elems[kMaxElems];
};

// Parses the array starting at s[lb] ('['). Returns false (untouched-safe) if
// the array is truncated, malformed, or has more than kMaxElems elements.
// Direct port of cmod-strip2.js's parseComplete.
bool parse_complete(const char* s, size_t len, size_t lb, ParseResult& out) {
    if (lb >= len || s[lb] != '[') return false;
    size_t i = skip_ws(s, len, lb + 1);
    out.elem_count = 0;
    while (i < len) {
        if (s[i] == ']') { out.rb = i; return true; }
        if (out.elem_count >= kMaxElems) return false;

        size_t es = i;
        size_t ee = scan_val(s, len, i);
        if (ee == kTrunc) return false;

        Elem& el = out.elems[out.elem_count];
        el.start = es;
        el.end = ee;
        el.is_remote = is_remote_type(s, es, ee);
        el.has_comma = false;
        ++out.elem_count;

        i = skip_ws(s, len, ee);
        if (i < len && s[i] == ',') {
            el.has_comma = true;
            el.comma_pos = i;
            i = skip_ws(s, len, i + 1);
        } else if (i < len && s[i] == ']') {
            out.rb = i;
            return true;
        } else {
            return false; // unexpected char, or ran off the end -> unsafe
        }
    }
    return false; // ran off the end without ']' -> truncated
}

} // namespace

bool find_intra_title_playlist(const char* buf, size_t len, size_t* out_marker_pos) {
    if (!buf || len < kMarkerLen) return false;

    // HOT PATH. Once the real (IFUNC-resolved) memcpy is hooked this runs on
    // every copy in the size gate, so a memcmp() at every byte offset is far
    // too slow (ANR risk on 256KB buffers). Mirror the verified Frida bench's
    // CModule find_marker instead: use memchr to jump between candidate '"'
    // bytes, then a 3-byte anchor test ("in" + 'T' at +6) before paying for
    // the full compare. Semantics are identical to the naive scan.
    const char* const last = buf + len - kMarkerLen;  // last valid start offset
    const char* p = buf;
    while (p <= last) {
        const char* q = static_cast<const char*>(
            memchr(p, '"', static_cast<size_t>(last - p) + 1));
        if (q == nullptr) return false;
        // Safe: q <= last, and kMarkerLen (22) > 6, so q[1..6] are in bounds.
        if (q[1] == 'i' && q[2] == 'n' && q[6] == 'T' &&
            memcmp(q, kMarker, kMarkerLen) == 0) {
            if (out_marker_pos) *out_marker_pos = static_cast<size_t>(q - buf);
            return true;
        }
        p = q + 1;
    }
    return false;
}

// Blank a single (fully-closed) element in place with spaces, taking an adjacent
// comma with it so the surrounding array stays structurally valid. Same length
// in, same length out. `prev_has_comma` is whether the preceding element carried
// a trailing comma (used only for the last-element-in-a-complete-array case).
void blank_elem(char* buf, const Elem& el, bool prev_has_comma, size_t prev_comma_pos) {
    size_t rs, re;
    if (el.has_comma) {
        rs = el.start;
        re = el.comma_pos + 1;
    } else if (prev_has_comma) {
        rs = prev_comma_pos;
        re = el.end;
    } else {
        rs = el.start;
        re = el.end;
    }
    if (re > rs) memset(buf + rs, ' ', re - rs);
}

RemoteStripResult strip_remote_items(char* buf, size_t len, bool blank_truncated_complete,
                                     bool apply) {
    RemoteStripResult result;

    size_t marker_pos;
    if (!find_intra_title_playlist(buf, len, &marker_pos)) return result;
    result.found_marker = true;

    size_t lb = marker_pos + kMarkerLen - 1; // marker ends in ":[" -> last char is '['
    ParseResult pr;
    if (!parse_complete(buf, len, lb, pr)) {
        // Truncated/malformed: the trailing element was cut mid-body and is NEVER
        // touched. The elements parse_complete recorded before it bailed are all
        // fully-closed. Count complete Remotes among them (diagnostic), and — if
        // enabled — blank them: they are whole {...} objects each followed by a
        // comma, so a same-length space-fill keeps the JSON structurally valid.
        for (size_t k = 0; k < pr.elem_count; ++k) {
            if (!pr.elems[k].is_remote) continue;
            ++result.trunc_complete_remotes;
            if (blank_truncated_complete) {
                // In a truncated array every recorded element is comma-followed,
                // so blank_elem takes the element + its trailing comma.
                if (apply) blank_elem(buf, pr.elems[k], false, 0);
                ++result.trunc_remote_blanked;
            }
        }
        result.trunc_complete_items = static_cast<int>(pr.elem_count);
        if (result.trunc_remote_blanked > 0) result.trunc_modified = true;
        return result; // complete stays false
    }

    result.complete = true;
    result.total_items = static_cast<int>(pr.elem_count);

    int remote_count = 0;
    for (size_t k = 0; k < pr.elem_count; ++k) {
        if (pr.elems[k].is_remote) ++remote_count;
    }
    if (remote_count == 0) return result;

    int blanked_count = 0;
    for (size_t k = 0; k < pr.elem_count; ++k) {
        const Elem& el = pr.elems[k];
        if (!el.is_remote) continue;
#if PV_REMOTE_DIAG
        if (result.remote_diag_count < RemoteStripResult::kMaxRemoteDiagnostics) {
            int d = result.remote_diag_count++;
            collect_key_names(buf, el.start, el.end, result.remote_keys[d],
                              RemoteStripResult::kRemoteKeySummarySize);
            result.remote_has_get_video_ads[d] =
                contains_bytes(buf, el.start, el.end, "getVideoAds", 11);
            result.remote_has_iad_path[d] =
                contains_bytes(buf, el.start, el.end, "/iad_", 5);
            result.remote_start[d] = el.start;
            result.remote_end[d] = el.end;
        }
#endif
#if PV_SKIP_GVA_REMOTES
        // getVideoAds-resolved Remote: leave in place for PATH 2 to empty the
        // resolved response (geometry-safe). Removing it here desyncs PeriodTailor.
        if (contains_bytes(buf, el.start, el.end, "getVideoAds", 11)) {
            ++result.gva_skipped;
            continue;
        }
#endif
        bool prev_comma = (k > 0 && pr.elems[k - 1].has_comma);
        size_t prev_pos = (k > 0) ? pr.elems[k - 1].comma_pos : 0;
        if (apply) blank_elem(buf, el, prev_comma, prev_pos);
        ++blanked_count;
    }

    if (blanked_count > 0) {
        result.modified = true;
        result.remote_items = blanked_count;
    }
    return result;
}

int empty_remote_resolver_urls(char* buf, size_t len, bool apply) {
    if (buf == nullptr || len == 0) return 0;
    size_t marker_pos = 0;
    if (!find_intra_title_playlist(buf, len, &marker_pos)) return 0;
    ParseResult pr;
    if (!parse_complete(buf, len, marker_pos + kMarkerLen - 1, pr)) return 0;

    constexpr char kKey[] = "\"urlsInPriorityOrder\"";
    constexpr size_t kKeyLen = sizeof(kKey) - 1;

    int changed = 0;
    for (size_t k = 0; k < pr.elem_count; ++k) {
        const Elem& el = pr.elems[k];
        if (!el.is_remote) continue;
        if (!contains_bytes(buf, el.start, el.end, "getVideoAds", 11)) continue;

        for (size_t p = el.start; p + kKeyLen <= el.end; ++p) {
            if (memcmp(buf + p, kKey, kKeyLen) != 0) continue;
            size_t q = skip_ws(buf, el.end, p + kKeyLen);
            if (q >= el.end || buf[q] != ':') break;
            q = skip_ws(buf, el.end, q + 1);
            if (q >= el.end || buf[q] != '[') break;
            size_t close = scan_val(buf, el.end, q);
            if (close == kTrunc || close <= q + 1) break;
            if (apply) memset(buf + q + 1, ' ', close - q - 2);
            ++changed;
            break;
        }
    }
    return changed;
}

int corrupt_remote_resolver_session(char* buf, size_t len, bool apply) {
    if (buf == nullptr || len == 0) return 0;
    size_t marker_pos = 0;
    if (!find_intra_title_playlist(buf, len, &marker_pos)) return 0;
    ParseResult pr;
    if (!parse_complete(buf, len, marker_pos + kMarkerLen - 1, pr)) return 0;

    constexpr char kKey[] = "adDeliverySessionId=";
    constexpr size_t kKeyLen = sizeof(kKey) - 1;

    int changed = 0;
    for (size_t k = 0; k < pr.elem_count; ++k) {
        const Elem& el = pr.elems[k];
        if (!el.is_remote) continue;
        if (!contains_bytes(buf, el.start, el.end, "getVideoAds", 11)) continue;

        bool touched = false;
        for (size_t p = el.start; p + kKeyLen <= el.end; ++p) {
            if (memcmp(buf + p, kKey, kKeyLen) != 0) continue;
            size_t v = p + kKeyLen;
            // The value runs to the next query separator or the closing quote.
            size_t e = v;
            while (e < el.end && buf[e] != '&' && buf[e] != '"') ++e;
            if (e <= v) { p = v; continue; }
            if (apply) {
                // Same length, URL-safe, obviously synthetic, and never a real
                // session. Deterministic so repeated copies stay identical.
                for (size_t i = v; i < e; ++i) buf[i] = "0123456789abcdef"[(i - v) & 0xF];
            }
            touched = true;
            p = e;
        }

        if (touched) {
            // Bound the cost of the failed resolution. A rejected session should
            // fail fast, but do not rely on that: clamp the retry budget too.
            // Both edits keep the byte count identical. JSON permits whitespace
            // after the colon, so " 250" is a legal same-width replacement for
            // "1750" (a leading zero would not be).
            constexpr char kTimeout[]    = "\"timeoutInMs\":1750";
            constexpr char kTimeoutFast[] = "\"timeoutInMs\": 250";
            constexpr size_t kTimeoutLen = sizeof(kTimeout) - 1;
            for (size_t p = el.start; p + kTimeoutLen <= el.end; ++p) {
                if (memcmp(buf + p, kTimeout, kTimeoutLen) != 0) continue;
                if (apply) memcpy(buf + p, kTimeoutFast, kTimeoutLen);
                break;
            }
            constexpr char kAttempts[]     = "\"maxAttemptsPerUrl\":2";
            constexpr char kAttemptsOnce[] = "\"maxAttemptsPerUrl\":1";
            constexpr size_t kAttemptsLen = sizeof(kAttempts) - 1;
            for (size_t p = el.start; p + kAttemptsLen <= el.end; ++p) {
                if (memcmp(buf + p, kAttempts, kAttemptsLen) != 0) continue;
                if (apply) memcpy(buf + p, kAttemptsOnce, kAttemptsLen);
                break;
            }
            ++changed;
        }
    }
    return changed;
}

bool contains_marker(const char* buf, size_t len) {
    if (buf == nullptr || len == 0) return false;
    size_t pos = 0;
    return find_intra_title_playlist(buf, len, &pos);
}

} // namespace pvfilter