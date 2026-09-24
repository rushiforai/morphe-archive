# Contributing

Create changes on a feature branch and target `dev` with the pull request.
Use conventional commit messages such as `fix:`, `feat:`, or `perf:` because
release versions and notes are generated from commit history.

Before opening a pull request, run:

```sh
./gradlew :patches:buildAndroid generatePatchesList --no-daemon
```

Do not edit `patches-list.json`, `patches-bundle.json`, or generated release
notes manually as part of ordinary patch changes.
