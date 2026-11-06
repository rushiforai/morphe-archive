# Protected-app research and optional developer builds

Research continues from the supplied APKs and retained artifacts. Source maps and developer test builds are unavailable; neither is a prerequisite for further artifact analysis.

The current deployable-patch limitations are:

| App | Inspected version | Current blocker |
| --- | --- | --- |
| TEUIDA | 1.23.0 | Unchanged app content crashes in Pairip after re-signing. |
| Pimsleur | 8.1 | Unchanged app content crashes in Pairip after re-signing. |
| Kanji Study | See its [artifact report](kanji-study-research.md) | Required methods are protected asset records; the loader binds authenticated data to the original signing and DEX inputs. |

## Research from existing artifacts

- TEUIDA and Pimsleur: reuse the recovered generated fields and SDK mappings to identify which application behaviors remain VM-routed. Trace local feature-state consumers and outgoing account/purchase logic in the shipped app code.
- Pimsleur: follow the recovered Hermes selectors into concrete feature consumers and distinguish local UI gates from content supplied by the server.
- Kanji Study: use the recovered protected records, secondary DEX and member mappings to trace preference names, local feature consumers and the active Google account/token path.

Completed follow-up traces connect Pimsleur's local selector to constructed progress metadata and distinguish its original lesson-media construction, download checks and playback filters. TEUIDA's traces cover analytics, gift/trial presentation and independent subscription/restore response gates. Kanji Study's traces connect six product preferences to local consumers and resolve its account-result, token-request and promotional-notification paths. The app reports retain exact evidence and distinguish constructed values from observed network behavior.

Recovered data and static branch traces establish research coverage. A working modified APK still requires successful loader integration and startup validation.

## Optional developer inputs

The developers can shorten runtime integration work by supplying a diagnostic build supporting their approved test signer, or an ordinary test build with the relevant application code available outside the release protection layer. Purchase validation, account authentication and backend entitlement behavior should match the intended test environment.

Useful inputs are:

- The APK or complete APK split set, package name, version and supported Android versions.
- The developer-approved test-signing procedure or protected-code restoration mappings, if available.
- Free and entitled test-account fixtures and expected download or feature responses.
- A way to trigger a test push notification and exercise billing in the developer's test environment.

For each supplied build, first establish an unmodified startup baseline, then verify that re-signing unchanged application content works. Only then adapt version-specific patch fingerprints and test each patch independently before combining them.

For TEUIDA and Pimsleur, recovered generated-field initializers remain private candidates; they do not restore the separate VM-routed application methods. For Kanji Study, recovered protected records establish inspection coverage, not a working modified APK. Neither finding is a substitute for a successful startup check.

Existing artifact identities, controlled startup results and unresolved work are in [validation](validation.md), [TEUIDA](teuida-research.md), [Pimsleur](pimsleur-research.md) and [Kanji Study](kanji-study-research.md).
