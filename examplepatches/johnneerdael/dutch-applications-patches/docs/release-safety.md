# Release notes and Morphe updates

Morphe Manager determines app update badges from the source's changelog. A new
bundle version alone does not mean every app needs repatching. Repeated old
bullets and unscoped quoted patch names can incorrectly advertise updates.

The release generator compares stable releases with the previous stable tag and
dev releases with the previous dev tag, even when semantic-release selects a
newer stable baseline to calculate the next version. It uses each app's
Compatibility name as its note scope. Promotions that produce no source delta
on the receiving channel do not advertise the same app controls again. Stable-to-dev
backmerges preserve the dev changelog instead of importing stable promotion notes;
Morphe can read stable history separately when it needs it.

For shared-code changes, declare additional affected apps in the commit body:

```text
fix(shared): preserve the callback result

Release-Apps: Nieuwsblad, DS Nieuws
```

Use exact Compatibility names. The trailer is also useful when a change needs
an explicit app scope. Changes in an app's own source directory are scoped
automatically. Keep infrastructure notes scoped to `release`, `build`, `ci`,
`deps` or `General`; unscoped conventional commits become `General`.

The Release notes guards pull-request check runs rollover regressions, previews
the candidate notes, and validates the commit range and changed app scopes.
The same verification is a mandatory semantic-release `verifyRelease` hook,
before building or publishing assets. It rejects historical commits, missing
changed-app scopes, unknown app names, unchanged-app scopes and dev versions
that are older than stable. Shared-code-only effects require explicit app names;
the declaration remains a review responsibility and is not runtime evidence.

Run locally from the repository root after committing candidate source changes:

```sh
node --test tests/test_release_branding.cjs tests/test_release_backmerge.cjs
RELEASE_CHANNEL=main node .github/scripts/preview_release_notes.cjs
RELEASE_CHANNEL=dev node .github/scripts/preview_release_notes.cjs
```

The preview is saved to `build/release-safety/notes-preview.md` and uploaded by
the pull-request check. Release metadata, version numbers and the generated
changelog remain owned by semantic-release.
