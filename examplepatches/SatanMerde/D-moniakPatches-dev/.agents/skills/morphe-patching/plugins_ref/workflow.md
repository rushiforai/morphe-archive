# Morphe Workflow Reference

## Pipeline

```text
RECON → DECOMPILE → HUNT → APPROVE DESIGN → WRITE → VALIDATE
```

Optional explicit stages follow validation: device testing and Git/GitHub submission.

## Artifact contract

```text
analysis/<app>/
├── apk/                         # Preserved copy of original APK/container
├── notes/
│   ├── morphe-workflow.json     # Machine-readable stage state
│   ├── morphe-workflow.md       # Human summary
│   ├── recon.md
│   └── <target-type>.md
├── decompiled/                  # jadx output
├── smali/                       # One directory per DEX
└── builds/                      # New patched artifacts and reports
```

The configured patch repository may be inside or outside the Claude project. Never assume its directory or package namespace.

## Evidence rules

- A stage completes only after its required artifacts and successful command evidence exist.
- Java is explanatory; smali is authoritative for fingerprints.
- Build success proves compilation only. `list-patches` proves registration. Local application proves compatibility and fingerprint matching.
- Persist failures and blocked prerequisites; never skip them silently.
- Reconcile state with files before resuming.

## Handoffs

- Build errors → patch writer.
- Fingerprint/match errors → target hunter.
- Missing source/smali → decompiler.
- Missing identity/input → recon.
- Device and remote Git actions → explicit user-only skills.
