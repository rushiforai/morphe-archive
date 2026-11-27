# Security policy

## Reporting a problem

Please don't open a public issue for security problems (for example, a
leaked key, a way to make the patch apply to the wrong app build, or text
leaking out of password fields). Report them privately instead: Security tab
> Report a vulnerability
(https://github.com/muhib-karim/Rambler-Bangla/security/advisories/new).

## Scope

- The patcher, extension source, and CI workflows in this repository.
- Password and other sensitive input fields are meant to pass through
  untouched. Any case where conversion runs in one is a security bug.

This repository distributes no APKs. Builds from elsewhere are out of scope.
