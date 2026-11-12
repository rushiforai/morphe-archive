# Using universal patches

Universal patches are offered for many apps, but that does **not** mean every
patch will work with every app or version. This guide describes the options in
the v2.2.2 bundle; earlier versions may have different options.

## Before you patch

1. Start with a clean copy of the app and save any important app data.
2. Enable only the patches you need. Read each description and its options.
3. Patch one app at a time, launch it, and test its important features. Check
   the patch log for skipped operations or zero matches.
4. If something breaks, patch the original APK again with fewer patches or
   different options. A reinstall may be needed; back up data first.

Some universal patches use best-effort bytecode matching, so a successful patch
run does not guarantee every target was found. Do not enable both **Allow
screenshots & screen recording** and **Block screenshots & screen recording**:
they have opposing goals. Neither can guarantee how every screen behaves.

## Remove dangerous permissions

This patch removes permission **declarations** from the app manifest. It does
not change system settings, remove permissions declared by other apps, or block
all forms of tracking. Removing a declaration may disable features or cause an
app to crash. The patch itself is off by default.

When you enable it, **all category switches start on** (aggressive, as previously
selected). For a less disruptive setup, turn off categories the app needs before
patching. For example, keep Camera for QR scanning, Microphone for voice calls,
Storage & media for file access, Nearby devices for Bluetooth pairing, and
Notifications for alerts. Keep Location, SMS, Contacts, Phone or Accounts if
the app needs them. The **AdServices permissions** switch covers names beginning
with `android.permission.ACCESS_ADSERVICES_`.

### Fine-tuning

- **Permissions to keep**: protects the listed names even when a category,
  the extra list or AdServices would otherwise remove them.
- **Extra permissions to remove**: adds names to the chosen categories.
- **Advanced: exact removal list**: for existing configurations or a custom
  base list. When non-empty, it replaces the category selections; the separate
  AdServices switch still applies (matching v2.2.1's behavior). Extra and keep
  lists still apply. Leave it blank to use the category switches. A saved legacy
  list can therefore make category switches appear ineffective: clear it if
  you want to use the switches.

The effective result is **categories or advanced list**, plus **extra** and
optionally **AdServices**, minus **keep**. A blank or separator-only advanced
list uses the categories. To remove only specific names, enter them in the
advanced list and turn off AdServices unless you also want it removed.

All three lists accept comma, semicolon, or newline separators; extra whitespace,
empty entries, and trailing separators are fine. Use full permission names for
custom permissions. Standard Android names can be shortened, and `AD_ID` is a
shortcut for `com.google.android.gms.permission.AD_ID`:

```text
CAMERA, POST_NOTIFICATIONS; android.permission.READ_CONTACTS
com.example.permission.CUSTOM
```

For example, leave the Camera category on but put `CAMERA` in **Permissions to
keep** to preserve that permission while removing other enabled categories.
Invalid names and space-separated names are rejected; separate each name with a
comma, semicolon or newline. Permission names are case-sensitive.

Only direct `<uses-permission>`, `<uses-permission-sdk-23>` and
`<uses-permission-sdk-m>` children of the manifest are changed. The log reports
how many declarations were removed and previews their names. Zero can simply
mean the app did not declare any selected permissions. It does not prove the app
is private or that a particular feature will work.

### Compatibility

The existing option keys, aggressive switch defaults, and `permissionsToRemove`
legacy override are preserved. A blank legacy list falls back to categories.
In v2.2.1, AdServices was removed even with a custom legacy list; the new switch
can explicitly disable that behavior. The keep list always takes precedence.
After changing options, patch a fresh original APK rather than assuming a
previously patched APK will regain removed declarations.

## v2.2.10 re-cut #4 universal changes

### Removed universal patches

- **Change package name (clone app)** — use the official Morphe **Clone app**
  patch instead.
- **Force not debuggable** — release APKs are already non-debuggable.
- **Lock down exported components** — too likely to break explicit intents.

### Hidden dependency patches

**Spoof app signature** and **Spoof install source** are no longer listed in the
universal section because official Morphe provides equivalent patches. Their
implementations remain available to app-specific patches that depend on them.
Use the official Morphe patches if you need them as standalone universal
patches.

### WebView hardening

The three separate WebView patches are replaced by **WebView hardening** with
individual switches:

- block mixed content
- disable local file access
- remove JavaScript bridges
- block media autoplay
- disable geolocation
- block third-party cookies
- block JavaScript popups

All switches start on. Turn off the ones that break a web login or legacy web
flow.

### New opt-in patches

- **Block advertising & device IDs** — empty advertising ID, limited ad
  tracking and empty Android ID reads.
- **Block in-app update & review prompts** — reports no Play Core update and
  removes update/review flows when safe. Best effort.
- **Block crash-reporting SDKs** — removes Sentry, Crashlytics, Bugsnag,
  Datadog, New Relic and AppCenter reporting calls. Best effort.
- **Force offline mode (simulate no network)** — makes connectivity APIs report
  no active network. This is a simulation, not a firewall; sockets and HTTP
  clients that ignore connectivity state can still reach the network.
- **Block Play Billing purchase prompts** — removes Play Billing purchase-flow
  calls when their result is unused. It does **not** unlock paid features or
  fake purchases, and flows that consume the returned `BillingResult` are
  skipped.

These patches are heuristic and opt-in. They are not a guarantee of privacy,
offline enforcement or purchase protection.
