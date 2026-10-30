# Repository assets and local storage

The maintainer's checkout is `E:\Projects\DeepSeek morphe-ai-caption-translator`. Project writes stay on E:. Shared tools, Codex/application/session storage and OS-managed files on C: are outside this repository and outside cleanup.

## What belongs where

| Area | Role / retention |
| --- | --- |
| patches | Kotlin patch definitions, typed host bindings and resources; runs at patch time, not as the phone translation engine |
| caption-contracts, caption-shared, translation-core | Runtime contracts/values, parsing/planning/provider/cache/controller; actual Gradle dependencies |
| application-host, infrastructure, presentation, ui | Runtime source areas compiled together into the extension; not four independent Gradle modules |
| extensions/extension | Extension build, real Android/Robolectric tests and resources; raw MPE embedded in MPP |
| ui-preview | Standalone UI fixture/stubs; staged copies under work are generated and not extra production implementations |
| localization + patches resources | Canonical translation data and checked generated fourteen-locale XML; both have live generation/runtime consumers |
| translation-core/upstream + docs/core-provenance.json | Fixed .java.txt snapshots plus current adaptation hashes/protocol guard inputs; not compiled and not generic historical clutter |
| Retired UI preservation inventory | Old path/hash list only counted existing paths; it did not verify those hashes. Archived with its ineffective counter; actual localization/layout/package checks remain |
| tools/workspace, tools, .github, Gradle/npm locks | Current development, verification and publication inputs; node_modules/build/cache content is not source |
| docs and root docs/licences | Current user/developer knowledge, source attribution, changelog and legal obligations; old execution diaries are archived |
| work/toolchain, work/gradle-home | Installed tools and reusable dependencies; keep, do not repeatedly copy into new task directories |
| work/test-temp, work/temp, .tmp | Test/scratch work. Completed native extraction and compiler output are regenerable; unique source probes/raw inputs must be distinguished before removal |
| build | Generated builds plus valuable release/candidate/rollback bytes. Keep named deliveries, clean reproducible intermediates only after checking evidence requirements |
| validation/runs, .verification | Private evidence, diagnostics, state mirror and indexed recovery archives; ignored, excluded from public source |
| YouTube | Private original host APK inputs; not source or public release assets |
| .git | Shared committed history/tags/object database; not repeated current production code and not inside release packages |

Historical 1.3.5 MPPs now live in `.verification/release-archive/1.3.5/` with exact-byte/path mapping in the governance run. They are not ordinary public source inputs. Their original copies are also recoverable from Git/entry archive. The duplicate loose root diagnostic was removed only after matching the retained frozen private original.

## Read sizes correctly

Production size counts runtime Java once and patch-time Kotlin separately; preview stubs, staged UI copies, tests, snapshots, disassembly, XML and cached dependencies are separate. Physical line count includes comments/formatting. Long methods expanded by formatting can add lines while removing logic; compare source/token/behavior changes as well.

Local disk size includes original APKs, full patched APK evidence, old test extraction and tools. It is not the source size or final MPP size. File-length inventories count logical bytes, not allocated filesystem blocks; junction/symlink targets are not traversed. Do not call archived bytes deleted or count moving files within this checkout as disk savings.

## Prevent another accumulation

Current state has one owner: [PROJECT-STATE](PROJECT-STATE.md). Keep build instructions in [DEVELOPMENT](DEVELOPMENT.md), source contracts in [ARCHITECTURE](ARCHITECTURE.md), and routine criteria in [MAINTAINING](MAINTAINING.md). A completed task does not require a new durable roadmap/prompt/review trilogy.

Keep exact proof for unresolved defects and real release/rollback deliveries. Git and Releases cover committed history; unique uncommitted material has one indexed archive. Historical reports can be extracted individually through [history](history/README.md), without restoring the whole old tree or executing its scripts. Recount only after material changes, not to create another cleanup target.

After successful composition and artifact/audit preservation, Patcher-created session-*/patcher and session-*/workspace are derived extraction, not historical deliveries. They may be removed after checking the retained complete APK and absence of failure evidence. Do not repeatedly snapshot these directories; preserve the input/selection/recipe/logs, resulting APK and identity. Failed or unidentified sessions require individual review.
