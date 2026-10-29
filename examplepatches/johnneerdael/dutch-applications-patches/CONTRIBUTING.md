# Contributing

Work on `dev`. Use `feat:`, `fix:` or `chore:` commit messages. The template's semantic-release workflow builds prereleases on `dev` and stable releases on `main`; do not manually edit generated patch lists, changelogs or releases.

Keep patches restricted to verified Buienalarm versions. Match stable method references or resource keys, derive obfuscated names/registers, and fail when a match is missing or ambiguous. Keep ad suppression separate from subscription state.

Build with `./gradlew buildAndroid`, `python3 scripts/build.py` when using a local `.pat`. Run `python3 scripts/validate.py /path/to/original.apk` before submitting changes. Document device/runtime checks separately from static inspection.

Open issues and pull requests at https://github.com/johnneerdael/dutch-applications-patches. Include logs and the exact input version. Keep APKs, PATs, signing keys, private app data and downloaded tooling out of Git.
