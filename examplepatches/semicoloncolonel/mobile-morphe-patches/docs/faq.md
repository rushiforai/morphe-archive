# Frequently asked questions

Most problems with versions and build numbers come from the APK file, not from the patches. Before you report one, check where your APK came from and compare it with [Supported apps](apps.md).

## Before you report a problem

These steps solve many problems, and the Bug report form asks you to confirm each one. A report that skips them, or that does not show what is wrong, may be closed without a fix. To report a security problem, skip these steps and follow the [security policy](../SECURITY.md).

1. **Update the patches.** In Morphe Manager, update this source under Sources, then patch the app again. Only the latest release receives fixes.
2. **Check the app version and version code.** Compare both with [Supported apps](apps.md), and get the APK from a source this page recommends. [Where should I get the APK?](#where-should-i-get-the-apk) explains which.
3. **Start from a fresh copy.** Uninstall the patched app, install the app again from Google Play or Aurora Store, and patch the new copy.
4. **Turn off ad blockers, DNS filters, and VPNs.** AdGuard, Control D, NextDNS, Pi-hole, Private DNS, and VPNs can stop video, sign-in, or loading on their own. Try again with them off.
5. **Try only the default patches.** Patch again with only the patches Morphe Manager selects by default. If the problem goes away, add the other patches back one at a time to find the one that causes it, and name it in your report.
6. **Try the unpatched app.** If the problem also happens in the official app, the patches do not cause it, and the app's developer can fix it.

If the problem continues, [report it](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new?template=1-bug-report.yml) with a screenshot, a video, or a crash log, and the details the form asks for. I maintain these patches as a volunteer, so clear and complete reports are what make a fix possible. Please give as much detail as you can, even if you cannot answer every question, and remove or cover any private information, such as your email address, account name, phone number, or location first.

## Morphe Manager says my version or build is not supported

1. When you select the APK, Morphe Manager shows its version and its version code (the build number). Compare both with the app's row in [Supported apps](apps.md).
2. If the version matches but the version code does not, the file is a build for another kind of device, such as an Android TV, a Fire TV, or a Fire tablet. The next question explains this.
3. Get the app from Google Play or Aurora Store, then patch the installed copy. [Where to get the APK](#where-should-i-get-the-apk) explains how.

If the version and version code both match and Morphe Manager still does not accept the file, please [report it](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose) and say where the APK came from.

## Why does my version code have an extra digit?

Some apps publish several builds of the same version, one for each kind of device. The builds share a version name but have different version codes. For example, Disney+ 26.20.0+rc3-2026.11.02 had these builds:

| Build | Version code | Where to get it |
|-------|--------------|-----------------|
| Phone | `179366219` | Google Play or Aurora Store |
| Android TV and Fire TV | `1793662190` | APKMirror |

The patches accept only the builds listed in [Supported apps](apps.md). The Disney+ Android TV build, for example, crashes on a phone.

## Where should I get the APK?

**Google Play or Aurora Store.** These serve the version that Google Play currently gives phones. Install the app, open Morphe Manager, select the app, and tap "Use installed app" to patch the installed copy. [Aurora Store](https://auroraoss.com/) can download the app without a Google account.

**APKMirror.** Do not assume the newest file on APKMirror is the right one. It can be a build for another device, or it can be missing the newest phone build. Download the `.apkm` bundle unless [Supported apps](apps.md) says to use the `.apk`. A single `.apk` from a split app is missing the files with its native code, and the patched app can close as soon as it opens.

**APKPure and other download tools.** For apps with phone and Android TV builds, APKPure sometimes offers only the Android TV build. Tools that pick the newest file can also choose a build for another device, because those builds can have a higher version code. Check the version code before you patch it.

## APKMirror does not have the version in Supported apps

APKMirror can be days behind Google Play, and it sometimes has only the Android TV build of a new version. Get the app from Google Play or Aurora Store instead. Supported apps often lists an older version too, which APKMirror is more likely to have.

## A patch fails on an app that "Use installed app" picked up

Morphe Manager treats an installed app as unpatched unless Morphe Manager installed it. If the installed copy was patched some other way, Morphe Manager patches it a second time, and some patches fail. Uninstall the app, install it again from Google Play, and patch the new copy.

## How is this different from an app that streams content from other sources?

These patches work on the official apps you already install, and you still need your own subscription. They remove ads, skip promos, and improve the experience on content you already pay for. They do not unlock paid content, and they are not a source for movies or shows.

An app like that streams the content itself. It pulls movies and shows from third-party sources rather than from the official app and your account, which is a separate choice with its own trade-offs and is outside what this project does. Patching the app you already use is also simpler for many people. You keep the app you know and trust, and you do not have to learn a new tool or rely on third-party sources. This project is for people who keep their subscriptions and want the official apps to behave better.

## Why does adding this source load patches for apps I did not choose?

A source and a bundle are the same thing. This source is one bundle that holds every patch in the project, so adding it from an app's page still adds the whole bundle. You do not have to be in a bundle section to add one. The app page is a doorway into that single bundle, filtered to the app you opened, which is why the same source appears under every app it covers.

Your app's patches are in the list. They sit alongside the patches for every other app the project supports, and the others do nothing on an app they were not written for. When you patch an app, Morphe Manager applies only the patches that match it and leaves the rest inactive. A patch is tied to its own app. "Auto-skip" is written for Apple TV, so it runs only on Apple TV, and patching a different app never triggers it.

To see which patches apply to a given app, open that app's row in [Supported apps](apps.md).

## What do the labels on an issue mean?

Labels show what an issue is about and how far it has come.

| Label | Meaning |
|-------|---------|
| `bug` | A patch fails, or a patched app does not work as described. |
| `app version` | Morphe Manager does not accept an app version or build. |
| `enhancement` | A request to improve a working patch, or for a new app or patch. |
| `question` | A question or an idea. |
| `incomplete` | Required details are missing. The label is removed when the issue is edited to include them, and the issue closes after 7 days without an update. |
| `untargeted version` | The reported app version or build is not supported. The issue closes after 7 days without an update. |
| `waiting for reporter` | I asked a question and am waiting for the answer. |
| `may reopen` | Closed for now. If you have new details, comment on the issue within 7 days, and I will reopen it. After 7 days without a comment, the label is removed. |
| `confirmed` | I reproduced the problem, and the patches cause it. |
| `planned` | Accepted, and planned for a future release. |
| `in development` | I am working on it now. |
| `testing on dev` | The change is in a dev pre-release. Please comment with how it works on your device. |
| `released` | The fix or feature is in a main release. |
| `upstream` | The app, Morphe Manager, or another tool causes the problem, not the patches. |
| `not patchable` | The app blocks patched copies, for example with Play Integrity or App Check. |
| `out of scope` | Outside what the project does, such as paywalls, paid content, or a post that is not about these patches. |
| `duplicate` | Another issue already covers this. |
| `wontfix` | This will not be changed. |
