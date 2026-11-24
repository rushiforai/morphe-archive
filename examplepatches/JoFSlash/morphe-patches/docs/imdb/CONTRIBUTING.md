# Contributing to the IMDb patches

IMDb keeps its own class and method names (`com.imdb.*`), so the patches hook them by name and fail loudly
when one is gone. Its own "Sponsored" ads come from the GraphQL `DisplayAdsForApp` query; the patches answer
it the way the IMDbPro build does, with no ads. It ships as a single APK on APKPure:
`python .github/scripts/check_app.py imdb <imdb.apk> --cli <morphe-cli.jar> --install --expect-screen` patches it
with every patch and starts it on a phone or emulator, as the emulator test does.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
