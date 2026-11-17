# E3 — Adblock Subsystem Trace (MoE panel, 2026-11-16)

Agent: general-purpose (glm-5.3). Mandate: trace selected-but-missing list
resolution at startup; adjudicate PD.9 vs AB; DoH check.

## Verdict
PD.9 (39 selected, 27 missing) is TOLERATED by stock code end-to-end.
The crash mechanism is the AB patch set's violation of the content-hash
invariant. v13 should keep PD.1/PD.7/PD.9 and revert AB.1-4.

## Lifecycle (with smali citations, v12-classes3 tree)
- Combiner qs4.k (qs4.smali:10-231): iterates manifest entries only;
  selected-ids-not-in-manifest silently ignored. CUSTOM mode (ordinal 2,
  a7j.smali:22-42) only changes the enabled predicate.
- DB registry ni3 (pi3.a coroutine): upserts active_block_lists; no file IO.
- Resolver k9d (k9d.smali:34-1013): hashes EVERY files-dir file via a
  MessageDigest digesting stream (115-261); lists assets
  (AssetManager.list, IOException->empty, graceful); partitions
  enabled/disabled; pairs enabled entries with available sources BY
  COMPUTED CONTENT HASH; v3 = enabled - resolved = missing set (606).
- Dispatch aj3 -> cj3.a(Uri) (cj3.smali:113-325): null base -> return
  (116); groups missing by hash; pending-set dedup (h - i) suppresses
  only CONCURRENT duplicates; lj3.a per group on a background scope.
- Trigger: WelcomeActivity lifecycle-START warm-up collector (tzn.smali:
  81-128) instantiates the graph; all work async; nothing blocks startup.
- Fetch failure: 3 retries (vtp.Q, backoff 1s..10s) -> f32 -> wx failure
  branch -> f9d.a LOGS "Fetch error: <url>" and returns. Log-and-continue.

## The crash mechanism (confirmed by the gating analyst)
k9d pairs by CONTENT hash, so AB.4's file (name = manifest hash, content
= maintainer bytes) can never pair: deleted as stale + entry missing again
-> re-download every resolve pass (each launch re-evaluates the pipeline).
AB.3's full-body RAM buffering (raw + gzip) adds an OOM-escape window
(only IOExceptions caught by vtp.Q). Either mechanism kills during the
first-launch fetch storm (~27 concurrent maintainer fetches).

## DoH check (PD.5/PD.6)
Mode 1 = CLOUDFLARE preset with built-in template
(https://opera.cloudflare-dns.com/dns-query); custom template only used in
mode 3. Consumer au1.smali:1432-1490 covers all four ordinals. Cannot
crash from a missing server URL.

## Could not determine
Native/engine-side consumer of the available set; v11's exact crash frame
(empty-manifest path is fully defensive in the v12 tree); re-resolve
cadence (Room invalidation driven).
