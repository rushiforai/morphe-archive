# Translation and source caches

## Identity and bounds

| Property | Translation plans | Source captions |
| --- | --- | --- |
| Implementation | `RebuildCache`, restored through controller | `SourceCaptionCache`, parsed through `RawCaptionSource` |
| Directory | caption-events-r2.12; identity-block.json | deepseek-source-captions; key.source + key.type |
| Identity | Protocol, source-coverage-v2 policy, language/settings/effective prompt, target/presentation, source words/times/precision; authored cue contract/partition when applicable | source-caption-v3-layout-identity plus track descriptor semantics; reference- prefix for timing references |
| Limits | 256000 B per entry, 256 JSON entries / 64 MiB; latest modified first, no TTL | 16 MiB per body, 180 bodies / 80 MiB, 24h; hit touches timestamps |

Translation identity intentionally excludes key/profile ID when semantic inputs match. Credentials and live request authority remain Session-scoped. Cache keys are not tenant namespaces or signatures authenticating caption meaning.

The coverage-policy salt isolates old falsely expanded full plans; it does not migrate or clear source cache/settings/keys. First translation after a namespace change may require paid retranslation when the user runs the product. Old files remain subject to ordinary existing eviction.

## Reads and writes

Translation read bounds size, parses against the exact current source block and applies current review/layout validation. Partial or actionable-risk output is not restored as a complete hit. Damaged/mismatched JSON can be deleted individually; review rejection can be a miss without deletion. A miss does not bypass request budgets or allow source-text fallback.

Preparation serializes and fsyncs a unique temp file. Commit uses atomic replacement without pre-deleting the old target. Write-order ordinals stop an older candidate replacing a newer committed result. Callers still require a Publication permit; a prepared file alone grants nothing.

Source get rejects missing/expired/empty/oversized bodies. A missing MIME type can use octet-stream because `CaptionDocument` detects actual JSON3/XML/VTT/SRT. A body must parse to nonempty cues; invalid bodies are removed individually and refetched under normal source-network limits. Not every parseable but semantically wrong body is detectable.

Source staging occurs outside COMMIT_LOCK. Under that lock, save old type, atomically publish new type then body; restore type if body publication fails. Reads/removes use the same lock. A second real IO failure during recovery can require invalidating that key. Unsupported ATOMIC_MOVE abandons the cache write; it does not fall back to pre-delete/rename. Network success is not converted to failure merely because optional cache persistence failed.

## Clear and stale work

Controller clear first revokes live work, drains admitted permits in the background, clears both caches and restarts only under matching publicationEpoch. Cleanup queue rejection/failure is reported safely on the main thread. Raw `RebuildCache.clear` is not a standalone session-revocation API.

Source clear advances EPOCH under COMMIT_LOCK. Queued/staged puts recheck the captured epoch and cannot revive cleared old-epoch work. A known narrower window remains: a consumer can pass checkActive before clear, then call put after clear and capture the new epoch. Reusable source bytes can arrive late; independent current/generation/display guards still forbid stale visible output. There is no claim of complete source-cache quiescence.

## Verification and limits

`M5iRebuildCacheTest`, `M5iSourceCacheFailureTest`, `PublicationLifecycleTest`, `D7CachePolicyTest`, `RepairAdmissionTest` and `ReintegratedApplicationTest` cover real file replacement, bounded fixture HTTP, stale admission and recovery. `prepare` and strict `read` have different contracts; a test must not assume every preparable intermediate is restorable as complete.

The source body/type pair is consistent within the process, not a cross-file power-loss transaction. Hardware/disk-full/ACL failures, cross-process access, every interleaving and billing are not certified. For configuration/credential recovery see [configuration](CONFIG-CREDENTIAL-CONTRACT.md).
