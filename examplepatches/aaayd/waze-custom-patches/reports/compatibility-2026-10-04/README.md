# Compatibility results: 4 October 2026

The same patch implementation was tested locally against ten authentic ARM64 Waze packages uploaded in 2026. Dates are APKMirror upload dates.

| Waze | Upload | Before | After | APK checks |
| --- | --- | --- | --- | --- |
| 5.15.5.0 | 2026-01-15 | 0/8 | 7/8 | PASS |
| 5.16.2.0 | 2026-02-20 | 0/8 | 7/8 | PASS |
| 5.17.1.0 | 2026-03-12 | 0/8 | 7/8 | PASS |
| 5.18.5.0 | 2026-04-15 | 2/8 | 8/8 | PASS |
| 5.19.0.2 | 2026-05-21 | 5/8 | 8/8 | PASS |
| 5.20.0.2 | 2026-06-19 | 5/8 | 8/8 | PASS |
| 5.21.0.0 | 2026-07-01 | 5/8 | 8/8 | PASS |
| 5.22.1.1 | 2026-08-18 | 7/8 | 8/8 | PASS |
| 5.23.90.900 | 2026-09-11 | 8/8 | 8/8 | PASS |
| 5.24.90.901 | 2026-10-02 | 8/8 | 8/8 | PASS |

**7/10 versions pass all eight patches**, compared with 2/10 before these changes.

January to March pass the seven other patches. Their native renderer constructs report strings inline, so icon sizing is deliberately rejected. The partial diagnostic APKs were not installed or published.

The tests verify original package signatures, patch execution, APK reconstruction, inserted hooks, runtime bindings and native output hashes. They do not prove device behaviour, map appearance or Android Auto alert timing.

For diagnostic coverage, unsupported version-list entries were bypassed after checking the authentic inputs. This does not expand the Morphe release compatibility list: it advertises the latest version and the full-support fixtures in `ci/compatibility_fixtures.json`.

The release bundle has the same executable patch and extension code as the matrix bundle, with updated version metadata. The final native discovery produced identical verified output hashes for every supported test renderer.

Additional tests cover eight renamed classes and twenty renamed methods, rejection of ambiguous live targets, moved registers, normal/range calls, primitive/boxed booleans, optional palette fields and malformed tables. All 256 option combinations and 65 settings compositions are checked.

[Machine-readable results and original package hashes](results.json).
