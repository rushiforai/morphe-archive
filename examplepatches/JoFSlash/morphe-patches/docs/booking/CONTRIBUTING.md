# Contributing to the Booking.com patches

Booking.com is a Compose app whose search results and home screen come from Booking.com's servers; see
[Patches in detail](docs/booking/patches.md) for how each patch works.
`python .github/scripts/check_app.py booking <apkm> --cli <morphe-cli.jar> --install --expect-screen` patches
an APKM with every Booking.com patch and starts it on a phone or emulator, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
