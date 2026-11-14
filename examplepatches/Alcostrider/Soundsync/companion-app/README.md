# SoundSync app

Holds the video delay and when to apply it, for apps patched with "Android Auto audio sync".
Package `app.soundsync.settings`, no permissions.

Built by the release workflow with `ci-build.sh` (Android SDK tools, no Gradle). It is signed with
the key in the `SOUNDSYNC_KEYSTORE_B64` / `SOUNDSYNC_KEYSTORE_PASSWORD` repository secrets
(alias `soundsync`). Keep a copy of that key: updates of the app must be signed with it.
