Chrome Morphe 0.4.0 for Chrome 153.0.8010.53 (801005304), ARM64.

- Replace **Open in Incognito by default** with **Remember last browsing mode**. Leaving Chrome in regular mode reopens regular mode; leaving it in Incognito reopens Incognito.
- Full-browser HTTP(S) links from other apps use the same remembered mode. Embedded Custom Tabs retain their usual behavior and do not change the saved full-browser choice.
- Preserve the old toggle's enabled/disabled choice on upgrade. Mode recording waits for Chrome to finish restoring tabs. Native Incognito availability checks, authentication and private-tab lifetime remain in force.

In Morphe Manager, select **Chrome customization**. Keep **MicroG sign-in** and **Android autofill** selected if you already use them, and use the same signing key when updating. Android autofill remains available only in regular tabs; account and password-provider behavior are unchanged by this update.

Device acceptance is limited to Galaxy S26 / Android 16 / 4 KB pages. Releases contain patches, not Chrome or MicroG APKs. See docs/TESTING.md for the device results and repeatable fixtures.
