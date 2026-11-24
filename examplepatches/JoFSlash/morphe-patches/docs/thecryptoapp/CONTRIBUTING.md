# Contributing to the The Crypto App patches

The Crypto App is an R8'd app with a PairIP license check (Java only, no native VM or signature
check), which the patches turn off so the app starts at all. Ads are hidden through the app's own new-user
ad-free window, found by its remote-config key. The price alerts, chart and portfolio are our own screens in
`extensions/thecryptoapp` (plain Views, no host-app classes). It ships as an APKM bundle on APKMirror; take
the one with arm64-v8a and x86_64 libraries:
`python .github/scripts/check_app.py thecryptoapp <thecryptoapp.apkm> --cli <morphe-cli.jar> --install --expect-screen`
patches it with every patch and starts it on a phone or emulator, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
