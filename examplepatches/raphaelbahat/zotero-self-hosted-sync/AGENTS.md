# Working in this repository

## The flow, in one line

A push to `main` is a release. There is no `dev` branch and no pull request: the `Release` workflow
merges nothing and waits for nobody — semantic-release reads the commit types on `main`, publishes a
version, and commits the version bump back to `main` with the repository token.

## How work lands

**Every new fix, feature or patch gets its own branch. `main` takes merges, not commits.** When the
work is finished, merge the branch into `main` — a merge commit, never a squash, because
semantic-release reads the commit types the branch brings with it. That merge is what releases, so
the conventional commit types on the branch decide the version.

```sh
git switch -c fix/<what>        # or feat/, ci/, docs/ — one branch per piece of work
# … commit as you go, with conventional messages …
git switch main && git pull
git merge --no-ff fix/<what>    # never squash: the commit types decide the version
git push origin main            # this is the release
git branch -d fix/<what>        # and the branch on the remote, if you pushed one
```

## Before you push

**Pull before regenerating and committing `README.md` or `patches-list.json`.** The release workflow
writes both — the version line in the generated patches section, and the `version` field in the list.
Committing your own regenerated copies first guarantees a conflict on those files, and then the pull
that would have prevented it fails too, leaving the branch half-merged.

Both files are generated, so resolve that kind of conflict by taking the release's copy and
regenerating, not by hand:

```sh
git checkout --theirs -- patches-list.json    # the released version wins
./gradlew generatePatchesList
python3 .github/scripts/generate_patches_readme.py \
    raphaelbahat/zotero-self-hosted-sync main patches-list.json README.md
```

`README.md` is only *partly* generated: everything outside the `<!-- PATCHES_START -->` /
`<!-- PATCHES_END -->` markers is hand-written and survives regeneration. So keep yours (`--ours`) and
let the generator rewrite the block inside the markers.

## Commit types decide the version

`fix:` → patch, `feat:` → minor. Everything else (`docs:`, `chore:`, `ci:` …) releases nothing and
runs the compile check instead. Pick the type by what reaches users: a change to a patch's
*description* ships inside the bundle the Morphe Manager shows, so it wants a release, while a change
to this file does not.

## Deliberate, not oversights

- **`main` is unprotected.** A protected `main` would reject the release workflow's own push.
- **`.releaserc` lists only `main`.** The prerelease branch it used to carry went when `dev` did; the
  backmerge plugin that kept the two in step went with it.
- **Every temporary patch has an exit condition.** The upstream reports they wait on are linked from
  the README's workaround notice, and ADR-0005 records why.
