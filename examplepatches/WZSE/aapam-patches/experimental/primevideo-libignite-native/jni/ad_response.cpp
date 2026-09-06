#include "ad_response.h"

#include <cstring>

namespace pvfilter {
namespace {

// Portable substring search. The shipping build previously used bionic memmem,
// which is unavailable on non-Android hosts and blocked host testing.
size_t find_bytes(const char* buf, size_t n, const char* needle) {
    const size_t nlen = std::strlen(needle);
    if (nlen == 0 || nlen > n) return static_cast<size_t>(-1);
    const size_t last = n - nlen;
    for (size_t i = 0; i <= last; ++i) {
        if (std::memcmp(buf + i, needle, nlen) == 0) return i;
    }
    return static_cast<size_t>(-1);
}

constexpr char kPlaylistKey[] = "\"playlist\":[";
// Index of '[' relative to the start of the key.
constexpr size_t kPlaylistBracketOffset = sizeof(kPlaylistKey) - 2;

} // namespace

bool is_decompress_chunk(size_t n) {
    return n >= 4096 && (n & (n - 1)) == 0;
}

size_t json_match_bracket(const char* buf, size_t n, size_t open) {
    int depth = 0;
    bool in_str = false, esc = false;
    for (size_t i = open; i < n; ++i) {
        char c = buf[i];
        if (in_str) {
            if (esc) esc = false;
            else if (c == '\\') esc = true;
            else if (c == '"') in_str = false;
            continue;
        }
        if (c == '"') { in_str = true; }
        else if (c == '[' || c == '{') { ++depth; }
        else if (c == ']' || c == '}') { if (--depth == 0) return i; }
    }
    return static_cast<size_t>(-1);
}

AdResponseResult empty_ad_playlist(char* buf, size_t len, bool apply) {
    AdResponseResult result;

    if (buf == nullptr || len < kMinResponseLen) {
        result.reason = AdResponseReason::TooSmall;
        return result;
    }
    if (len > kMaxResponseLen) {
        result.reason = AdResponseReason::TooLarge;
        return result;
    }
    if (is_decompress_chunk(len)) {
        result.reason = AdResponseReason::DecompressChunk;
        return result;
    }

    const size_t pl = find_bytes(buf, len, kPlaylistKey);
    if (pl == static_cast<size_t>(-1)) {
        result.reason = AdResponseReason::NoPlaylistKey;
        return result;
    }
    if (find_bytes(buf, len, "adDeliverySessionId") == static_cast<size_t>(-1)) {
        result.reason = AdResponseReason::NoSessionId;
        return result;
    }
    if (find_bytes(buf, len, "\"measurement\"") == static_cast<size_t>(-1)) {
        result.reason = AdResponseReason::NoMeasurement;
        return result;
    }
    // A PRS schedule also carries a playlist-shaped array. Never treat it as an
    // ad-decision response; the schedule is handled by remote_strip.
    if (find_bytes(buf, len, "intraTitlePlaylist") != static_cast<size_t>(-1)) {
        result.reason = AdResponseReason::IsSchedule;
        return result;
    }

    result.matched = true;

    const size_t open = pl + kPlaylistBracketOffset;
    result.playlist_open = open;   // set before the completeness test so a
                                   // truncated array can still be scanned
    const size_t close = json_match_bracket(buf, len, open);
    if (close == static_cast<size_t>(-1)) {
        result.reason = AdResponseReason::TruncatedPlaylist;
        return result;   // truncated array — leave untouched
    }
    result.playlist_close = close;

    if (close <= open + 1) {
        result.reason = AdResponseReason::AlreadyEmpty;
        return result;
    }

    int ads = 1;
    int depth = 0;
    bool in_str = false, esc = false;
    for (size_t i = open; i < close; ++i) {
        char c = buf[i];
        if (in_str) {
            if (esc) esc = false;
            else if (c == '\\') esc = true;
            else if (c == '"') in_str = false;
            continue;
        }
        if (c == '"') in_str = true;
        else if (c == '[' || c == '{') ++depth;
        else if (c == ']' || c == '}') --depth;
        else if (c == ',' && depth == 1) ++ads;
    }
    result.ads = ads;

    if (apply) {
        for (size_t i = open + 1; i < close; ++i) buf[i] = ' ';   // same length
    }
    result.modified = true;
    result.reason = AdResponseReason::Emptied;
    return result;
}

TruncatedPlaylistInfo scan_truncated_playlist(const char* buf, size_t len, size_t open) {
    TruncatedPlaylistInfo info;
    if (buf == nullptr || open >= len || buf[open] != '[') return info;
    info.valid = true;
    info.cut_offset = len;

    size_t i = open + 1;
    while (i < len && (buf[i] == ' ' || buf[i] == '\t' || buf[i] == '\r' || buf[i] == '\n')) ++i;
    if (i >= len) return info;
    if (buf[i] == ']') { info.cut_offset = i; return info; }   // empty, not truncated

    info.first_entry = i;

    while (i < len) {
        if (buf[i] != '{') break;                 // not an object entry
        const size_t end = json_match_bracket(buf, len, i);
        if (end == static_cast<size_t>(-1)) {     // this entry is the cut one
            info.cut_offset = i;
            break;
        }
        ++info.complete_entries;
        info.last_complete_end = end;

        i = end + 1;
        while (i < len && (buf[i] == ' ' || buf[i] == '\t' || buf[i] == '\r' || buf[i] == '\n')) ++i;
        if (i >= len) { info.cut_offset = len; break; }
        if (buf[i] == ',') {
            ++i;
            while (i < len && (buf[i] == ' ' || buf[i] == '\t' || buf[i] == '\r' || buf[i] == '\n')) ++i;
            if (i >= len) { info.cut_offset = len; break; }
            continue;
        }
        info.cut_offset = i;   // ']' would mean not truncated; anything else stops the scan
        break;
    }
    return info;
}

int blank_truncated_ad_entries(char* buf, size_t len, bool apply) {
    // Re-run the strict schema test in dry-run form. Only a payload that is a
    // genuine ad-decision response with an unclosed playlist qualifies.
    AdResponseResult r = empty_ad_playlist(buf, len, /*apply=*/false);
    if (!r.matched || r.reason != AdResponseReason::TruncatedPlaylist) return 0;

    TruncatedPlaylistInfo t = scan_truncated_playlist(buf, len, r.playlist_open);
    if (!t.valid || t.complete_entries <= 0) return 0;
    if (t.cut_offset <= t.first_entry || t.cut_offset > len) return 0;

    if (apply) {
        // Blank every complete entry and the commas between them, stopping at
        // the entry that was cut. That entry is left exactly as received.
        for (size_t i = t.first_entry; i < t.cut_offset; ++i) buf[i] = ' ';
    }
    return t.complete_entries;
}

const char* to_string(AdResponseReason reason) {
    switch (reason) {
        case AdResponseReason::Emptied:           return "emptied";
        case AdResponseReason::AlreadyEmpty:      return "already-empty";
        case AdResponseReason::TooSmall:          return "too-small";
        case AdResponseReason::TooLarge:          return "too-large";
        case AdResponseReason::DecompressChunk:   return "decompress-chunk";
        case AdResponseReason::NoPlaylistKey:     return "no-playlist-key";
        case AdResponseReason::NoSessionId:       return "no-adDeliverySessionId";
        case AdResponseReason::NoMeasurement:     return "no-measurement";
        case AdResponseReason::IsSchedule:        return "is-schedule";
        case AdResponseReason::TruncatedPlaylist: return "truncated-playlist";
    }
    return "unknown";
}

} // namespace pvfilter
