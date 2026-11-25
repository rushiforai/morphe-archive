# Contributing to the Wikipedia patches

The Wikipedia app is open source ([wikimedia/apps-android-wikipedia](https://github.com/wikimedia/apps-android-wikipedia),
release tags `r/<version>`), so read the source of the patched version first. Its release build keeps class and
method names, but R8 still inlines and merges small helpers: `Prefs` and `PrefsIoUtil` are folded into other
classes, `SurveyDialog` and the Test Kitchen metrics client are spread over unrelated ones. That is why some
patches find their method by a string, and why "already shown" checks are handled by setting the preference at
start (`shared/Prefs.kt`) instead of patching each check.

There is no anti-tamper and no account is needed. The universal APKM on APKMirror has x86_64 libraries:
`python .github/scripts/check_app.py wikipedia <wikipedia.apkm> --cli <morphe-cli.jar> --install --expect-screen`
patches it with every patch and starts it on a phone or emulator, as the emulator test does.

To see a fundraising campaign on a phone, turn on the developer settings (Settings, About the Wikipedia app, tap
the logo seven times), set GeoIP Country Override to a country with a running campaign in
`https://donate.wikimedia.org/wiki/MediaWiki:AppsCampaignConfig.json?action=raw`, and open an article after
leaving one.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
