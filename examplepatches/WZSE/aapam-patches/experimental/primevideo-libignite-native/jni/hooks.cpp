// hooks.cpp — JNI_OnLoad bootstrap for the Prime Video in-process ad strip.
//
// Strategy (see got_hook.h for the full rationale): hook libignite's *import
// slots* (PLT/GOT) for memcpy / memmove / __memcpy_chk / __memmove_chk. Each
// proxy runs pvfilter::strip_remote_items() on the SOURCE buffer (before the
// real copy proceeds) then calls through to the real libc function. This
// mirrors the verified Frida bench (cmod-strip2.js mutates `src` in onEnter
// before the wrapped call runs) — see remote_strip.h for the strip logic and
// its safety invariant (never touch a truncated array).
//
// Why GOT and not an inline libc hook: libignite reaches memcpy through an
// IFUNC that resolves to __memcpy_a55 on this Cortex-A55. Hooking a libc body
// means (a) guessing which of ~7 implementations the resolver picked — last
// session we watched memmove_a15, which the ad buffer never touches, so
// blanked=0 — and (b) rewriting code every thread runs, a plausible cause of
// the playback-start SIGSEGV. A GOT slot swap has neither problem.

#include <jni.h>
#include <android/log.h>
#include <atomic>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <dlfcn.h>
#include <pthread.h>
#include <unistd.h>

#include "ad_response.h"
#include "got_hook.h"
#include "remote_strip.h"

#define TAG "PVNativeHook"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,  TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,  TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

namespace {

constexpr const char* kIgnite = "libignite.so";

// DRY-RUN CONTROL: build with -DPV_DRY_RUN=1 to make the strip parse + count
// exactly as normal but perform NO writes. Used to test whether our in-place
// edits (not our presence) cause the intermittent PRS "bad content encoding"
// (CURL 61) failure — hypothesis: we blank inside zlib's inflate window and
// break the gzip CRC. If dry-run eliminates the failure, the writes are the
// cause.
#ifndef PV_DRY_RUN
#define PV_DRY_RUN 0
#endif
constexpr bool kApplyWrites = (PV_DRY_RUN == 0);

// Same size gate as the verified bench's CModule scan: cheap enough to run on
// every copy, wide enough to cover real intraTitlePlaylist buffers (~40-68KB
// observed) with headroom.
constexpr size_t kMinScanLen = 512;
// 6.23.23 schedules were about 65 KB and arrived complete. 6.24.5 schedules are
// several times larger: a session showed marker=12 complete=2 trunc=10 with
// max_n=261637, sitting just under the old 262144 gate. Anything above the gate
// was dropped before it could be examined, so the schedule never reached the
// code in a usable state. Raised to match the response scan limit.
constexpr size_t kMaxScanLen = 1048576;
constexpr size_t kObservedGvaCopySite = 0xaea9cf;  // Diagnostic only; never a behavior gate.

// Maximum payload bytes per log line. logcat silently truncates long messages:
// a 3000-byte chunk arrived as ~975 bytes, so a 65 KB schedule dump lost two
// thirds of its content. Measured maximum on this device was 978 bytes, so keep
// a margin for the tag, timestamp, and the field prefix.
constexpr size_t kLogChunk = 800;

std::atomic<uint64_t> g_calls_total{0};
std::atomic<uint64_t> g_calls_in_gate{0};
std::atomic<uint64_t> g_marker_found{0};
std::atomic<uint64_t> g_complete{0};
std::atomic<uint64_t> g_truncated{0};
std::atomic<uint64_t> g_trunc_remotes{0};  // complete Remote items seen inside truncated chunks
std::atomic<uint64_t> g_modified{0};
std::atomic<uint64_t> g_remote_blanked{0};
std::atomic<uint64_t> g_max_n{0};

// Self-stamp oracle counters. Emit a stable, greppable marker whenever the hook
// actually removes ads, plus a periodic summary — so an autotest can validate PV
// ad removal from logcat (PV's MediaSession is unreliable; see
// docs/AUTONOMOUS_APP_TESTING.md). Autotest ORACLE_RE matches "PVKILL"/"PVOBS".
std::atomic<uint64_t> g_pvkill_movie{0};  // Remote ad items blanked (movies, PATH 1)
std::atomic<uint64_t> g_pvkill_tv{0};     // ad entries emptied (TV regolith, PATH 2)
std::atomic<uint64_t> g_remote_dump_id{0};
std::atomic<uint64_t> g_response_dump_id{0};
std::atomic<uint64_t> g_response_skipped{0};
std::atomic<uint64_t> g_trunc_ads_blanked{0};
std::atomic<uint64_t> g_session_corrupted{0};
std::atomic<uint64_t> g_oversize_schedule{0};
std::atomic<uint64_t> g_schedule_dumped{0};
std::atomic<size_t> g_last_dumped_n{0};
std::atomic<uint64_t> g_source_attempted{0};
std::atomic<uint64_t> g_source_emptied{0};

// Per-entry-point counters — tells us which copy door carries the PRS buffer.
std::atomic<uint64_t> g_n_memcpy{0};
std::atomic<uint64_t> g_n_memmove{0};
std::atomic<uint64_t> g_n_memcpy_chk{0};
std::atomic<uint64_t> g_n_memmove_chk{0};
// Control: libignite's malloc import. If this floods while the copy counters
// tick, the GOT mechanism is proven to fire on real traffic.
std::atomic<uint64_t> g_malloc_calls{0};

// Saved originals (the real libc functions, resolved as libignite's slot held
// them). Proxies call through these — never a re-hooked path, so no recursion.
using memcpy_fn      = void* (*)(void*, const void*, size_t);
using memchk_fn      = void* (*)(void*, const void*, size_t, size_t);
using malloc_fn      = void* (*)(size_t);
memcpy_fn g_real_memcpy   = nullptr;
memcpy_fn g_real_memmove  = nullptr;
memchk_fn g_real_memcpy_chk  = nullptr;
memchk_fn g_real_memmove_chk = nullptr;
malloc_fn g_real_malloc   = nullptr;

// Log the caller (the code that invoked memcpy) as libignite+offset, so we can
// tell zlib's decompression copies apart from the app's final-buffer copy.
void log_caller(const char* what, const void* caller, size_t n, int remotes) {
    Dl_info di;
    if (caller && dladdr(caller, &di) && di.dli_fbase) {
        LOGI("CALLER %s: libignite+0x%zx n=%zu remotes=%d",
             what, (size_t)((uintptr_t)caller - (uintptr_t)di.dli_fbase), n, remotes);
    } else {
        LOGI("CALLER %s: %p (no dladdr) n=%zu remotes=%d", what, caller, n, remotes);
    }
}

// A copy of exactly a power-of-two size >= 4096 is a zlib/libcurl DECOMPRESSION
// CHUNK (CHUNK=16384, 4096, etc.), not the app's assembled PRS body. Editing
// those mid-decompression corrupts the gzip stream -> CURL 61 -> "Something went
// wrong" (verified on-device 2026-07-24: every corrupting copy was n=4096/16384;
// every safe/effective one was an odd-sized assembled body). Real JSON bodies
// are effectively never an exact power of two, so skipping these loses nothing
// but the corruption.
// Single source of truth lives in ad_response.cpp so the host test enforces it.
inline bool is_decompress_chunk(size_t n) {
    return pvfilter::is_decompress_chunk(n);
}

std::atomic<uint64_t> g_skipped_chunk{0};

#ifndef PV_RESPONSE_DIAG
#define PV_RESPONSE_DIAG 0
#endif

#ifndef PV_MUTATE_CONFIRMED_GVA_SOURCE
#define PV_MUTATE_CONFIRMED_GVA_SOURCE 0
#endif

// One-shot dump of a complete intraTitlePlaylist payload, for offline analysis
// of where the scrub-bar markers actually come from.
#ifndef PV_SCHEDULE_DUMP
#define PV_SCHEDULE_DUMP 0
#endif

// Remove the ad entries that closed before the cut in a truncated response.
#ifndef PV_BLANK_TRUNCATED_ADS
#define PV_BLANK_TRUNCATED_ADS 0
#endif

// Stop a break resolving by corrupting its session id in the schedule.
#ifndef PV_CORRUPT_GVA_SESSION
#define PV_CORRUPT_GVA_SESSION 0
#endif

size_t library_offset(const void* caller) {
    Dl_info di;
    if (caller && dladdr(caller, &di) && di.dli_fbase)
        return static_cast<size_t>(
            reinterpret_cast<uintptr_t>(caller) - reinterpret_cast<uintptr_t>(di.dli_fbase));
    return 0;
}

#if PV_RESPONSE_DIAG
uint64_t hash_bytes(const char* buf, size_t n) {
    uint64_t hash = 1469598103934665603ULL;
    for (size_t i = 0; i < n; ++i) {
        hash ^= static_cast<unsigned char>(buf[i]);
        hash *= 1099511628211ULL;
    }
    return hash;
}

size_t caller_offset(const void* caller) {
    return library_offset(caller);
}

void log_response_chunks(uint64_t id, const char* buf, size_t start, size_t end) {
    size_t length = end - start;
    size_t parts = (length + kLogChunk - 1) / kLogChunk;
    for (size_t part = 0; part < parts; ++part) {
        size_t offset = start + part * kLogChunk;
        size_t count = end - offset < kLogChunk ? end - offset : kLogChunk;
        LOGI("PVRESPONSE_FULL id=%llu part=%zu/%zu offset=%zu data=%.*s",
             (unsigned long long)id, part + 1, parts, offset,
             static_cast<int>(count), buf + offset);
    }
}
#endif

// NOTE — the JS "count-gate" approach (rewriting resolveWithAdBreaks' `0===t.length`
// guard in the downloaded QuickJS player) was prototyped and REJECTED for shipping:
// that class lives in the gzip'd player bundle, and editing its buffer — source OR
// destination — corrupts the in-flight decompression -> CURLE_BAD_CONTENT_ENCODING
// (61) and a bundle refetch storm at startup (confirmed on-device 2026-07-30). It
// also provided no measurable ad removal beyond PV_EMPTY_REGOLITH below, which does
// the work cleanly on the ad-decision RESPONSE (post-validation) rather than the
// bundle. TV ads are handled entirely by PATH 2.

// ── TV: empty the regolith getVideoAds RESPONSE `playlist` array ──────────────
// The dominant SGAI ad path (AdBreakManager.resolveAndInsert) builds every ad
// period from the resolved regolith response `e.playlist`. Wire format (verified
// on-device, decompressed plaintext, ~4.5KB, single buffer):
//   {"description":{"adDeliverySessionId":"..._PBP_EXPL_...","adMarkerId":"PRE_ROLL"},
//    "playlist":[{…ad…},{…ad…}],"measurement":{…}}
// Blanking the array interior to spaces (same length, matched-bracket, string-aware)
// makes e.playlist.length===0 consistently, so the app runs its OWN designed clean
// empty-break path: no periods built, insertBefore([])/insertAfter([]) no-op,
// sendEmptyAdBreakTrackingEvents, and unblockXpPlaylistIndex(a+0) unblocks the
// CORRECT index -> NO ghost period. dst-side (post-decompress -> no CRC-61); only
// acts on a COMPLETE array (matching ']' present); skips pow2 chunks.
#ifndef PV_EMPTY_REGOLITH
#define PV_EMPTY_REGOLITH 0
#endif
#if PV_EMPTY_REGOLITH
std::atomic<uint64_t> g_rego_emptied{0};
std::atomic<uint64_t> g_rego_seen{0};
// Matching-bracket scanning and the strict schema test now live in
// ad_response.cpp so the exact shipping logic is exercised by a host test
// against real captured payloads. This wrapper adds logging and counters only.
bool maybe_empty_regolith(void* vbuf, size_t n, const void* caller, const char* entry) {
    char* buf = static_cast<char*>(vbuf);
    const bool is_dst = (entry != nullptr && std::strstr(entry, "dst") != nullptr);
    (void)is_dst;

#if PV_RESPONSE_DIAG
    // Dry-run first so the pre-mutation payload can be logged exactly as the
    // app would have parsed it.
    pvfilter::AdResponseResult probe = pvfilter::empty_ad_playlist(buf, n, /*apply=*/false);
    if (!probe.matched) return false;
    g_rego_seen.fetch_add(1, std::memory_order_relaxed);
    if (!probe.modified) {
        // A response larger than one copy arrives with its playlist cut in the
        // middle. We refuse to edit it, so those ads survive. Dump the payload
        // so the exact bytes can be replayed on the host (see test/replay.cpp)
        // and a partial strategy can be designed against real data.
        uint64_t skip_id = g_response_skipped.fetch_add(1, std::memory_order_relaxed);
        if (probe.reason == pvfilter::AdResponseReason::TruncatedPlaylist) {
            pvfilter::TruncatedPlaylistInfo t =
                pvfilter::scan_truncated_playlist(buf, n, probe.playlist_open);
            LOGW("PVRESPONSE_SKIP id=%llu entry=%s caller=libignite+0x%zx n=%zu reason=%s "
                 "open=%zu completeEntries=%d lastCompleteEnd=%zu cut=%zu",
                 (unsigned long long)skip_id, entry, caller_offset(caller), n,
                 pvfilter::to_string(probe.reason), probe.playlist_open,
                 t.complete_entries, t.last_complete_end, t.cut_offset);
            if (skip_id < 2) log_response_chunks(1000 + skip_id, buf, 0, n);
#if PV_BLANK_TRUNCATED_ADS
            // A large response is stream-parsed as it arrives, so a complete
            // buffer never reaches us. Remove the entries that did close, and
            // never touch the cut one. Destination side only: editing a source
            // mid-stream can corrupt the gzip CRC (see the note below).
            if (is_dst && kApplyWrites) {
                int blanked = pvfilter::blank_truncated_ad_entries(buf, n, true);
                if (blanked > 0) {
                    g_trunc_ads_blanked.fetch_add(static_cast<uint64_t>(blanked),
                                                  std::memory_order_relaxed);
                    g_pvkill_tv.fetch_add(static_cast<uint64_t>(blanked),
                                          std::memory_order_relaxed);
                    LOGI("PVKILL path=tv-truncated ads=%d n=%zu", blanked, n);
                }
            }
#endif
        } else {
            LOGI("PVRESPONSE_SKIP id=%llu entry=%s caller=libignite+0x%zx n=%zu reason=%s",
                 (unsigned long long)skip_id, entry, caller_offset(caller), n,
                 pvfilter::to_string(probe.reason));
        }
        return false;
    }

    uint64_t id = g_response_dump_id.fetch_add(1, std::memory_order_relaxed);
    uint64_t hash = hash_bytes(buf, n);
    size_t json_start = 0;
    while (json_start < n && (buf[json_start] == ' ' || buf[json_start] == '\t' ||
                              buf[json_start] == '\r' || buf[json_start] == '\n'))
        ++json_start;
    size_t json_end = n;
    if (json_start < n && buf[json_start] == '{') {
        size_t matched = pvfilter::json_match_bracket(buf, n, json_start);
        if (matched != static_cast<size_t>(-1)) json_end = matched + 1;
    }
    size_t callsite = caller_offset(caller);
    LOGI("PVRESPONSE id=%llu entry=%s caller=libignite+0x%zx knownSite=%s n=%zu hash=%016llx "
         "json=%zu..%zu playlist=%zu..%zu ads=%d",
         (unsigned long long)id, entry, callsite,
         callsite == kObservedGvaCopySite ? "yes" : "no", n,
         (unsigned long long)hash, json_start, json_end,
         probe.playlist_open, probe.playlist_close, probe.ads);
    log_response_chunks(id, buf, json_start, json_end);
#endif

    pvfilter::AdResponseResult r = pvfilter::empty_ad_playlist(buf, n, kApplyWrites);
#if !PV_RESPONSE_DIAG
    if (r.matched) g_rego_seen.fetch_add(1, std::memory_order_relaxed);
#endif
    if (!r.modified) return false;

#if PV_RESPONSE_DIAG
    bool empty = true;
    for (size_t i = r.playlist_open + 1; i < r.playlist_close; ++i) {
        if (buf[i] != ' ') { empty = false; break; }
    }
    size_t context_start = r.playlist_open > 96 ? r.playlist_open - 96 : 0;
    size_t context_end = r.playlist_close + 160 < n ? r.playlist_close + 160 : n;
    LOGI("PVRESPONSE_AFTER id=%llu empty=%s context=%.*s",
         (unsigned long long)id, empty ? "yes" : "no",
         static_cast<int>(context_end - context_start), buf + context_start);
#endif

    uint64_t c = g_rego_emptied.fetch_add(1, std::memory_order_relaxed);
    if (c < 40)
        LOGI("[rego] emptied playlist (~%d ad(s), interior %zu bytes blanked) n=%zu",
             r.ads, r.playlist_close - r.playlist_open - 1, n);
    g_pvkill_tv.fetch_add(static_cast<uint64_t>(r.ads), std::memory_order_relaxed);
    LOGI("PVKILL path=tv ads=%d n=%zu", r.ads, n);   // self-stamp (oracle)
    return true;
}
#else
inline bool maybe_empty_regolith(void*, size_t, const void*, const char*) { return false; }
#endif

void maybe_strip(const void* src, size_t n, const void* caller, const char* entry) {
    g_calls_total.fetch_add(1, std::memory_order_relaxed);
    if (src == nullptr) return;

    // Report a buffer that carries a schedule but is refused by the size gate.
    // Without this, an oversized schedule is indistinguishable from no schedule
    // at all, which is exactly how the 6.24.5 regression stayed invisible.
    if (n > kMaxScanLen) {
        const char* p = static_cast<const char*>(src);
        if (n < (64u << 20) && pvfilter::contains_marker(p, n)) {
            uint64_t over = g_oversize_schedule.fetch_add(1, std::memory_order_relaxed);
            if (over < 8) LOGW("PVOVERSIZE schedule rejected by size gate n=%zu limit=%zu",
                               n, kMaxScanLen);
        }
        return;
    }
    if (n < kMinScanLen) return;
    if (is_decompress_chunk(n)) { g_skipped_chunk.fetch_add(1, std::memory_order_relaxed); return; }
    maybe_empty_regolith(const_cast<void*>(src), n, caller, entry);   // TV response (dst-side)
    g_calls_in_gate.fetch_add(1, std::memory_order_relaxed);

    uint64_t prev_max = g_max_n.load(std::memory_order_relaxed);
    if (n > prev_max) g_max_n.store(n, std::memory_order_relaxed);

    char* const buf = const_cast<char*>(static_cast<const char*>(src));
    pvfilter::RemoteStripResult r =
        pvfilter::strip_remote_items(buf, n,
                                     /*blank_truncated_complete=*/false,
                                     /*apply=*/false);

    // Temporary private diagnostic. Dump complete Remote objects before the
    // production pass mutates the buffer. Split long objects to stay below
    // Android's per-line log limit. The object ID and part number permit exact
    // reconstruction from logcat.
    for (int i = 0; i < r.remote_diag_count; ++i) {
        size_t start = r.remote_start[i];
        size_t end = r.remote_end[i];
        if (end <= start || end > n) continue;
        uint64_t id = g_remote_dump_id.fetch_add(1, std::memory_order_relaxed);
        size_t parts = (end - start + kLogChunk - 1) / kLogChunk;
        for (size_t part = 0; part < parts; ++part) {
            size_t offset = start + part * kLogChunk;
            size_t count = end - offset < kLogChunk ? end - offset : kLogChunk;
            LOGI("PVREMOTE_FULL id=%llu index=%d part=%zu/%zu data=%.*s",
                 (unsigned long long)id, i, part + 1, parts,
                 static_cast<int>(count), buf + offset);
        }
    }

    // One-shot full schedule dump. The scrub-bar markers are drawn even when no
    // ad response is ever resolved, so the marker data must live in this PRS
    // payload. Two edits to shouldShowOnScrubBar had no effect, and we have only
    // ever inspected the Remote objects, never the surrounding document. Dump it
    // once so the marker source can be found offline instead of guessed at.
#if PV_SCHEDULE_DUMP
    // Dump up to two DISTINCT ad-bearing schedules per process.
    //
    // A single one-shot token was fragile: if the dump fired before logcat
    // started, its output was lost for the whole process lifetime and the
    // capture looked empty. Two dumps survive a mid-session capture start.
    //
    // The same schedule is copied several times with a one-byte size jitter
    // (65135 / 65136 / 65135 observed), so a near-equal size counts as the same
    // payload and does not consume a slot.
    if (r.found_marker && r.complete && r.remote_diag_count > 0 &&
        g_schedule_dumped.load(std::memory_order_relaxed) < 2) {
        size_t last = g_last_dumped_n.load(std::memory_order_relaxed);
        bool same_payload = (last != 0) && (n + 4 >= last) && (n <= last + 4);
        if (!same_payload) {
            g_last_dumped_n.store(n, std::memory_order_relaxed);
            uint64_t dump_id = g_schedule_dumped.fetch_add(1, std::memory_order_relaxed);
            size_t parts = (n + kLogChunk - 1) / kLogChunk;
            LOGI("PVSCHEDULE_FULL_BEGIN id=%llu n=%zu parts=%zu remotes=%d items=%d",
                 (unsigned long long)dump_id, n, parts, r.remote_diag_count, r.total_items);
            for (size_t part = 0; part < parts; ++part) {
                size_t offset = part * kLogChunk;
                size_t count = n - offset < kLogChunk ? n - offset : kLogChunk;
                LOGI("PVSCHEDULE_FULL id=%llu part=%zu/%zu offset=%zu data=%.*s",
                     (unsigned long long)dump_id, part + 1, parts, offset,
                     static_cast<int>(count), buf + offset);
            }
            LOGI("PVSCHEDULE_FULL_END id=%llu n=%zu", (unsigned long long)dump_id, n);
        }
    }
#endif

    if (kApplyWrites) {
        r = pvfilter::strip_remote_items(buf, n,
                                         /*blank_truncated_complete=*/false,
                                         /*apply=*/true);
    }

#if PV_CORRUPT_GVA_SESSION
    // Second, independent layer. The response-emptying path can only act on
    // buffers it actually sees, which is how the truncated 42 KB response leaked
    // ads. Corrupting the session id in the schedule stops the break resolving
    // at all, and does not depend on ever seeing the response.
    //
    // The literal getVideoAds is deliberately preserved, so PV_SKIP_GVA_REMOTES
    // still recognises and protects the break on later copies. Emptying the URL
    // array instead destroys that marker and makes our own code delete the
    // entry, shifting array indices — measured in the host harness.
    //
    // maybe_strip only ever receives a copy destination, so this never touches a
    // source buffer mid-decompression.
    if (kApplyWrites && r.found_marker && r.complete) {
        int corrupted = pvfilter::corrupt_remote_resolver_session(buf, n, true);
        if (corrupted > 0) {
            g_session_corrupted.fetch_add(static_cast<uint64_t>(corrupted),
                                          std::memory_order_relaxed);
            LOGI("PVSESSION corrupted=%d/%d n=%zu", corrupted, r.gva_skipped, n);
        }
    }
#endif

    if (!r.found_marker) return;
    g_marker_found.fetch_add(1, std::memory_order_relaxed);

    if (!r.complete) {
        // Truncated chunk copy — by design we do NOT touch it (the safety
        // invariant that avoided black screens in the bench). Diagnostic: if
        // complete Remote items exist before the cut, ads are present in a
        // chunk we skip (truncated-parse-race evidence).
        g_truncated.fetch_add(1, std::memory_order_relaxed);
        if (r.trunc_remote_blanked > 0) {
            g_trunc_remotes.fetch_add(static_cast<uint64_t>(r.trunc_remote_blanked),
                                      std::memory_order_relaxed);
            LOGI("TRUNCATED array: blanked %d/%d COMPLETE Remote item(s) before cut, "
                 "left truncated tail untouched (n=%zu)",
                 r.trunc_remote_blanked, r.trunc_complete_items, n);
            log_caller("TRUNC", caller, n, r.trunc_remote_blanked);
        } else {
            LOGI("marker found but array TRUNCATED (not touched) n=%zu", n);
        }
        return;
    }
    g_complete.fetch_add(1, std::memory_order_relaxed);

    if (r.gva_skipped > 0)
        LOGI("PVSKIP path=movie gvaRemotesLeftForPath2=%d n=%zu", r.gva_skipped, n);

    for (int i = 0; i < r.remote_diag_count; ++i)
        LOGI("PVREMOTE index=%d keys=%s getVideoAds=%s iadPath=%s",
             i, r.remote_keys[i],
             r.remote_has_get_video_ads[i] ? "yes" : "no",
             r.remote_has_iad_path[i] ? "yes" : "no");

    if (r.modified) {
        g_modified.fetch_add(1, std::memory_order_relaxed);
        g_remote_blanked.fetch_add(static_cast<uint64_t>(r.remote_items), std::memory_order_relaxed);
        LOGI("neutralized %d/%d Remote item(s) in complete array (n=%zu)",
             r.remote_items, r.total_items, n);
        g_pvkill_movie.fetch_add(static_cast<uint64_t>(r.remote_items), std::memory_order_relaxed);
        LOGI("PVKILL path=movie blanked=%d/%d n=%zu", r.remote_items, r.total_items, n);  // self-stamp (oracle)
        log_caller("COMPLETE", caller, n, r.remote_items);
    } else {
        LOGI("marker found, array complete, 0 Remote items (n=%zu total=%d)", n, r.total_items);
    }
}

// IMPORTANT: we strip the DESTINATION *after* the real copy, never the source
// before it. The PRS body reaches us through libcurl's gzip decompression; the
// decompressed bytes are the buffer libcurl computes the gzip CRC32 over.
// Editing the SOURCE of a copy can be editing that CRC-checked buffer mid-
// stream -> CURLE_BAD_CONTENT_ENCODING (61) -> "Something went wrong" (verified
// on-device 2026-07-24, clean A/B: writes-to-src ON = intermittent CURL 61,
// dry-run = 0 errors). Editing the DESTINATION leaves the source pristine for
// the CRC while still blanking the copy the app goes on to parse.
void* proxy_memcpy(void* dst, const void* src, size_t n) {
    g_n_memcpy.fetch_add(1, std::memory_order_relaxed);
    const void* caller = __builtin_return_address(0);
    void* ret = g_real_memcpy(dst, src, n);
    maybe_strip(dst, n, caller, "memcpy-dst");
#if PV_MUTATE_CONFIRMED_GVA_SOURCE
    bool changed = maybe_empty_regolith(const_cast<void*>(src), n, caller, "memcpy-src");
    if (changed) {
        g_source_attempted.fetch_add(1, std::memory_order_relaxed);
        g_source_emptied.fetch_add(1, std::memory_order_relaxed);
        size_t callsite = library_offset(caller);
        LOGI("PVSOURCE caller=libignite+0x%zx knownSite=%s n=%zu changed=yes",
             callsite, callsite == kObservedGvaCopySite ? "yes" : "no", n);
    }
#endif
    return ret;
}
void* proxy_memmove(void* dst, const void* src, size_t n) {
    g_n_memmove.fetch_add(1, std::memory_order_relaxed);
    void* ret = g_real_memmove(dst, src, n);
    maybe_strip(dst, n, __builtin_return_address(0), "memmove");
    return ret;
}
// __memcpy_chk(dst, src, count, dst_len): first three args match memcpy.
void* proxy_memcpy_chk(void* dst, const void* src, size_t n, size_t dst_len) {
    g_n_memcpy_chk.fetch_add(1, std::memory_order_relaxed);
    void* ret = g_real_memcpy_chk(dst, src, n, dst_len);
    maybe_strip(dst, n, __builtin_return_address(0), "__memcpy_chk");
    return ret;
}
void* proxy_memmove_chk(void* dst, const void* src, size_t n, size_t dst_len) {
    g_n_memmove_chk.fetch_add(1, std::memory_order_relaxed);
    void* ret = g_real_memmove_chk(dst, src, n, dst_len);
    maybe_strip(dst, n, __builtin_return_address(0), "__memmove_chk");
    return ret;
}
void* proxy_malloc(size_t n) {
    g_malloc_calls.fetch_add(1, std::memory_order_relaxed);
    return g_real_malloc(n);
}

// Try to install all copy-import hooks once. Returns the number of the four
// copy entry points successfully hooked (0 if libignite isn't mapped yet).
int try_install_once() {
    int ok = 0;
    if (g_real_memcpy == nullptr)
        ok += pvgot::hook_import(kIgnite, "memcpy", (void*)proxy_memcpy, (void**)&g_real_memcpy) ? 1 : 0;
    else ok++;
    if (g_real_memmove == nullptr)
        ok += pvgot::hook_import(kIgnite, "memmove", (void*)proxy_memmove, (void**)&g_real_memmove) ? 1 : 0;
    else ok++;
    if (g_real_memcpy_chk == nullptr)
        ok += pvgot::hook_import(kIgnite, "__memcpy_chk", (void*)proxy_memcpy_chk, (void**)&g_real_memcpy_chk) ? 1 : 0;
    else ok++;
    if (g_real_memmove_chk == nullptr)
        ok += pvgot::hook_import(kIgnite, "__memmove_chk", (void*)proxy_memmove_chk, (void**)&g_real_memmove_chk) ? 1 : 0;
    else ok++;
    return ok;
}

// Worker: libignite.so is NOT mapped at Application.onCreate (it loads with the
// media/player subsystem, well before any PRS ad fetch). Poll until it appears,
// install the GOT hooks once, then fall through to the heartbeat loop. Polling
// dl_iterate_phdr twice a second is negligible and stops as soon as we hook.
void* worker_thread(void*) {
    constexpr int kMaxAttempts = 2400;  // ~20 min at 500ms; generous safety cap
    constexpr int kRequiredImports = 4;

    // All four copy imports must be hooked. Accepting a partial install and
    // stopping was a real defect: libignite resolves its relocations while we
    // poll, so a poll that lands mid-resolution can hook some slots and miss
    // others. A missing memcpy hook makes every getVideoAds ad-decision
    // response invisible, because that response travels through memcpy.
    // Observed on-device: cpy=0 while mov and cpy_chk climbed into the
    // hundreds of thousands, and every ad played. try_install_once() skips
    // slots that are already hooked, so retrying is idempotent.
    int ok = 0;
    bool warned_partial = false;
    for (int i = 0; i < kMaxAttempts; i++) {
        ok = try_install_once();
        if (ok >= kRequiredImports) {
            // Best-effort control probe once libignite is present.
            pvgot::hook_import(kIgnite, "malloc", (void*)proxy_malloc, (void**)&g_real_malloc);
            LOGI("worker: libignite present, %d/4 copy imports hooked after %d attempt(s)", ok, i + 1);
            break;
        }
        if (ok > 0 && !warned_partial) {
            warned_partial = true;
            pvgot::hook_import(kIgnite, "malloc", (void*)proxy_malloc, (void**)&g_real_malloc);
            LOGW("worker: PARTIAL install %d/4 on attempt %d — retrying for the remainder",
                 ok, i + 1);
        }
        usleep(500 * 1000);
    }
    if (ok == 0) {
        LOGE("worker: libignite never appeared within cap — strip will not run");
        return nullptr;
    }
    if (ok < kRequiredImports)
        LOGE("worker: only %d/4 copy imports hooked — ad filtering is UNRELIABLE", ok);

    for (;;) {
        sleep(5);
        // Keep repairing a partial install. A missing hook silently disables a
        // whole ad path, so never stop trying to complete it.
        if (ok < kRequiredImports) {
            int now = try_install_once();
            if (now > ok) {
                LOGW("worker: recovered copy imports %d/4 -> %d/4", ok, now);
                ok = now;
            }
        }
        LOGI("PVHOOKS memcpy=%s memmove=%s memcpy_chk=%s memmove_chk=%s installed=%d/4",
             g_real_memcpy      ? "on" : "OFF",
             g_real_memmove     ? "on" : "OFF",
             g_real_memcpy_chk  ? "on" : "OFF",
             g_real_memmove_chk ? "on" : "OFF",
             ok);
        LOGI("[hb] skipchunk=%llu malloc=%llu | cpy=%llu mov=%llu cpy_chk=%llu mov_chk=%llu | "
             "total=%llu in_gate=%llu max_n=%llu marker=%llu complete=%llu "
             "trunc=%llu trunc_rem=%llu modified=%llu blanked=%llu",
             (unsigned long long)g_skipped_chunk.load(std::memory_order_relaxed),
             (unsigned long long)g_malloc_calls.load(std::memory_order_relaxed),
             (unsigned long long)g_n_memcpy.load(std::memory_order_relaxed),
             (unsigned long long)g_n_memmove.load(std::memory_order_relaxed),
             (unsigned long long)g_n_memcpy_chk.load(std::memory_order_relaxed),
             (unsigned long long)g_n_memmove_chk.load(std::memory_order_relaxed),
             (unsigned long long)g_calls_total.load(std::memory_order_relaxed),
             (unsigned long long)g_calls_in_gate.load(std::memory_order_relaxed),
             (unsigned long long)g_max_n.load(std::memory_order_relaxed),
             (unsigned long long)g_marker_found.load(std::memory_order_relaxed),
             (unsigned long long)g_complete.load(std::memory_order_relaxed),
             (unsigned long long)g_truncated.load(std::memory_order_relaxed),
             (unsigned long long)g_trunc_remotes.load(std::memory_order_relaxed),
             (unsigned long long)g_modified.load(std::memory_order_relaxed),
             (unsigned long long)g_remote_blanked.load(std::memory_order_relaxed));
        // Self-stamp summary (oracle): total ads removed since load, both paths.
        LOGI("PVOBS movieBlanked=%llu tvEmptied=%llu",
             (unsigned long long)g_pvkill_movie.load(std::memory_order_relaxed),
             (unsigned long long)g_pvkill_tv.load(std::memory_order_relaxed));
        LOGI("PVSOURCEOBS attempted=%llu emptied=%llu",
             (unsigned long long)g_source_attempted.load(std::memory_order_relaxed),
             (unsigned long long)g_source_emptied.load(std::memory_order_relaxed));
        LOGI("PVSESSIONOBS breaksCorrupted=%llu",
             (unsigned long long)g_session_corrupted.load(std::memory_order_relaxed));
        LOGI("PVSKIPOBS adResponsesSkipped=%llu",
             (unsigned long long)g_response_skipped.load(std::memory_order_relaxed));
    }
    return nullptr;
}

void install_hooks() {
    // libignite isn't mapped yet at onCreate, so defer to a worker that polls
    // for it, installs the GOT hooks, then heartbeats.
    pthread_t tid;
    pthread_create(&tid, nullptr, worker_thread, nullptr);
    pthread_detach(tid);
}

}  // namespace

extern "C" JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* /*vm*/, void* /*reserved*/) {
    LOGI("JNI_OnLoad: pvhook loaded (GOT import hook on libignite memcpy/memmove) — writes=%s",
         kApplyWrites ? "ON" : "DRY-RUN(no writes)");
    install_hooks();
    return JNI_VERSION_1_6;
}
