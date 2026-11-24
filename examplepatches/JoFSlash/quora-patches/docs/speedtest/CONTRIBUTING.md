# Contributing to the Speedtest patches

Speedtest is an R8'd app whose own packages keep their names (classes and methods are renamed), so
patches hook the named managers (the ads, Appvestor, CellRebel and review managers) and fail loudly when one
is gone. It ships as a single arm64 APK on APKMirror:
`python .github/scripts/check_app.py speedtest <speedtest.apk> --cli <morphe-cli.jar> --install --expect-screen`
patches it with every Speedtest patch and starts it on a phone or emulator, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
