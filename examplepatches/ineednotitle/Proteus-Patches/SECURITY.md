# Security Policy

## Supported versions

Security fixes are applied to the latest published release. Pre-releases are
supported on a best-effort basis until superseded.

## Reporting a vulnerability

**Do not open a public issue for a security problem.**

Use GitHub's private vulnerability reporting:

<https://github.com/ineednotitle/Proteus-Patches/security/advisories/new>

Include:

- A description of the issue and its impact
- Affected patch, file or release
- Reproduction steps or a minimal proof of concept
- The app and Android versions involved
- Any suggested mitigation

Please allow time for investigation before public disclosure. Reports are
acknowledged on a best-effort basis; this is a volunteer project without a paid
security team.

## Scope

In scope:

- Patch bundle code, extension helpers and verification scripts in this repository
- Patch logic that introduces unintended data exposure, code execution or
  integrity-check bypass outside its documented purpose
- Release or CI configuration weaknesses affecting published artifacts

Out of scope:

- Vulnerabilities in third-party apps, Morphe Manager or Android itself
- Issues caused by enabling documented risky patches against the warnings
- Modified APKs distributed by third parties

## Safe harbor

Good-faith research that follows this policy will not be treated as hostile.
Do not access, modify or exfiltrate other users' data while testing.
