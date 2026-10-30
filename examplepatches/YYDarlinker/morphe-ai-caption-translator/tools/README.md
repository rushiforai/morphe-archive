# Current development tools

Start with [workspace/dev.cmd](workspace/dev.cmd) for daily Gradle work and [workspace/verify-full.cmd](workspace/verify-full.cmd) for one final candidate. Setup is in [DEVELOPMENT](../docs/DEVELOPMENT.md); verification strength and retention are in [MAINTAINING](../docs/MAINTAINING.md).

| Tool | Actual consumer / purpose |
| --- | --- |
| verify_current.py + verification.init.gradle | Canonical full source/test/candidate validation and same-invocation receipts; rejects stale deleted-test classes |
| verify_integration.py | Build/full validation: source dependencies, fixed provenance/protocol/ABI, compiled and package boundaries |
| record_core_provenance.py | Refresh/check intentional adaptation hashes; never rewrites pinned upstream snapshots |
| check_localization.py / generate_localization.py | CI/daily validation and reproducible fourteen-locale XML from localization inputs |
| scan_delivery_credentials.py | Full delivery evidence/package scanning |
| test_verification.py / test_workspace.py | Failure/identity/output and actual Windows frontend contracts; not application quality certification |
| workspace/ | Process setup, canonical daily/full frontends and init; successful Test tasks discard their own native-runtime extraction |
| Verify.ps1 / Enter-Workspace.ps1 | Small supported compatibility aliases exercised by the frontend tests |

The unused standalone Invoke-Gradle and implicit user-Maven-copy helper were retired. Old N scripts, reports and recovered disassembly can be individually recovered through [history](../docs/history/README.md). Active N/R/M-named JUnit classes/fixtures remain when they protect current behavior.
