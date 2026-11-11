# v1.10.2-dev.8 corrective build

- The shipped v1.10.2-dev.7 MPP retained a stale 1.10.1 user-visible version despite its newer manifest.
- Compile PatchVersion237 and ModernShorts as an authoritative two-class DEX override and merge with recovered+development helper DEX.
- Fail assembly when the actual helper DEX lacks the exact development version.
- Fail post-build if the shipped MPP manifest, byte-identical payloads, runtime strings or required development classes differ from expected.
- Retain all dev.7 functionality; Android real-device end-to-end tests remain unperformed.
- No formal release, main branch or tag updates, or Issue closure.
