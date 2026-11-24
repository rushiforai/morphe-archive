# Contributing to the Listonic patches

Listonic is a heavily R8'd Kotlin app. Its own ad layer (`com.listonic.adcompanion`), triggers, update and
consent libraries keep their names, so most patches hook those by name; the rest find renamed classes
through text they keep and fail loudly when it is gone. It isn't on APKMirror:
`python .github/scripts/check_app.py listonic <app.apks> --cli <morphe-cli.jar> --install --expect-screen`
patches the split APKs (zipped into an .apks, or an XAPK) and starts the app, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
