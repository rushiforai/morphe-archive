# Development tools

See [development setup](../docs/DEVELOPMENT.md) for prerequisites.

| Entry | Purpose |
| --- | --- |
| [workspace/dev.cmd](workspace/dev.cmd) | Daily localization and Gradle checks |
| [workspace/verify-full.cmd](workspace/verify-full.cmd) | Full Windows candidate verification |
| [verify_current.py](verify_current.py) | Shared validation entry, test receipts and frozen artifacts |
| [verify_integration.py](verify_integration.py) | Source, compiled and package boundaries |
| [check_localization.py](check_localization.py) and [generate_localization.py](generate_localization.py) | Validate and generate all 14 resource sets |
| [test_verification.py](test_verification.py) and [test_workspace.py](test_workspace.py) | Verification and Windows launcher contracts |
| [scan_delivery_credentials.py](scan_delivery_credentials.py) | Scan delivery files and archives for known credential values |
