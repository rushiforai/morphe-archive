# Security Policy

This policy covers the Anghami Plus Patches bundle itself: the patch sources, the build configuration and the release artifacts published from this repository. It does not cover the Anghami application, its servers, or third-party services.

---

## Supported versions

| Version | Supported |
| :--- | :--- |
| **v1.3.x** (latest release) | ✅ Actively maintained |
| **< v1.3.0** | ❌ No longer supported |

Only the latest release of the patch bundle receives security fixes. If you are on an older version, update first and check whether the problem still occurs.

---

## Reporting a vulnerability

If you find a security problem, for example code in a patch that could harm a user's device or data, a flaw in the release or build pipeline, or a way to make a patched build behave unexpectedly:

1. **Do not open a public issue.** Public reports give other people time to abuse the problem before it can be fixed.
2. Report it privately through the repository's [security advisories](https://github.com/Kero309x/anghamiplus-patches/security/advisories/new), or by email to **keroslayer56@gmail.com** if you cannot use GitHub.
3. Include as much of the following as you can:
   * the affected version of the patch bundle;
   * the patch or file involved;
   * a clear description of the impact;
   * step-by-step instructions to reproduce it, with logs or a proof of concept where possible;
   * any suggested fix or mitigation.

Please keep the report confidential until a fix has been released. Credit is given in the release notes if you would like it.

---

## What we will do

The maintainer will acknowledge your report, confirm the affected versions, and work on a fix in a private branch. A patched release is published as soon as the fix is ready, together with a short advisory describing the impact and the versions affected. Please allow a reasonable amount of time before disclosing anything publicly; this is a volunteer-maintained project, so timelines are best effort rather than guaranteed.

---

## Out of scope

The following are not handled as security vulnerabilities here:

* Requests to bypass, defeat or work around server-side entitlement, licensing or DRM systems.
* Problems that exist in the unpatched Anghami application, or in its backend services.
* Issues that only affect a build you modified yourself, or that come from an APK patched by somebody else.
