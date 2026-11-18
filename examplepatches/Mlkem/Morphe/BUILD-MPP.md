# Build the collection

Use JDK 21, the checked-in Gradle wrapper, and GitHub Packages read credentials.

```sh
./gradlew :patches:buildAndroid :patches:generatePatchesList --no-daemon
python3 scripts/verify_bundle.py
```

The generated `.mpp` is in `patches/build/libs`. The complete compiled patch catalog
is `patches-list.json`. See README for installing the remote beta source.
