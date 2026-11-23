Compile-only stubs for the Morphe settings classes, used only by `scripts/build-local.sh`. The Gradle build compiles against the real `app.morphe:morphe-extensions-library` instead.
They are never packaged: at runtime the classes come from the official Morphe `shared` extension.
Signatures match morphe-patches 2.3.0 (`extensions/shared.mpe`).
