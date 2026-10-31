# Security policy

## Reporting a vulnerability

Use the private vulnerability advisory form of this repository. That opens a thread that only the
maintainer can read, so an issue stays private until a fix exists.

Include the build version, the host package you used, the steps that reproduce the problem, and
what an attacker gains. A clipboard history bug matters most when it lets another app read the
stored clips, so say which entry points are involved: the content provider, the settings screen,
the export, or the build pipeline.

## Scope

| In scope | Out of scope |
| :--- | :--- |
| The runtime extension in `extensions/extension` | Gboard itself and the code it ships |
| The patches in `patches/` | The Morphe patcher and the Morphe Manager app |
| The build scripts in `scripts/` | Bugs in the upstream PixelBoard project |
| The release workflow in `.github/workflows/` | Vulnerabilities in the Android platform |

The project ships a patched keyboard. A signed build of Gboard runs with the privileges of a
keyboard, so a signing key leak, an unverified download, or a way to read the clipboard history
from another app are all in scope.

## Handling

The maintainer confirms the report, reproduces it, and ships a fix in the next release. Reports
get a credit line in the release notes unless the reporter asks otherwise.

## What the project already does

- External access to the clipboard history is off by default.
- The content provider only answers callers that hold the signature permission that the installed
  build declares, or that present the access token.
- The access token is 128 random bits, compared in constant time, masked on screen, and copied to
  the clipboard as a sensitive clip.
- The settings screen blocks screen capture and screen recording.
- Every read of the history is logged with the package name of the caller.
- Signing keys and their passwords stay out of the repository, and each project uses its own key.
- Every build input is pinned to a commit and checked against a sha256 digest.
- The release workflow runs with read only permissions, writes only on a tag, and pins each action
  to a commit.
- The release assets are built by the workflow and carry a build provenance attestation, so the
  digest can be checked against the tag that produced it.

The remaining limits are listed under [Security](README.md#security) in the README. The most
important one: the history is stored in a plain SQLite database without encryption and without
expiry.
