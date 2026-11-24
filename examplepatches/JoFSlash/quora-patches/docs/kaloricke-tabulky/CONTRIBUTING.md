# Contributing to the Kalorické Tabulky patches

Kalorické Tabulky is a Kotlin app whose own classes keep their names (only its libraries are renamed), so
patches find code by class and method name; a changed app fails loudly instead of being patched halfway.
It isn't on APKMirror: `python .github/scripts/check_app.py kaloricke-tabulky <app.apks> --cli <morphe-cli.jar>
--install --expect-screen` patches the split APKs Google Play installs (zipped into an .apks) and starts the
app, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
