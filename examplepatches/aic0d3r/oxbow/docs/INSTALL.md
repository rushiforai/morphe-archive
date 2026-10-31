# Installation Guide

Oxbow is a fork of [Feurstagram](https://github.com/jean-voila/FeurStagram) by Jean Herail (GPL-3.0).

## Option 1: Download a prebuilt APK

Go to the [latest GitHub release](https://github.com/aic0d3r/oxbow/releases/latest) and download one of the APK files.

### oxbow.apk (classic)

Replaces your current Instagram app: it keeps Instagram's original package ID, so uninstall the official app first.

### oxbow-clone.apk (clone)

Uses a different package ID, so it installs alongside the official Instagram app.

## Option 2: Patch it yourself with Morphe Manager

Install [Morphe Manager](https://morphe.software), add the source `github.com/aic0d3r/oxbow`
(or open <https://morphe.software/add-source?github=aic0d3r/oxbow&name=Oxbow&app=com.instagram.android>),
then patch an Instagram `.apkm` bundle. No prebuilt APK is downloaded; updates arrive through the Manager.

## Option 3: Build it yourself

If you prefer not to trust a prebuilt APK, follow the [build-from-source guide](BUILD_FROM_SOURCE.md).

## Recommended installation flow

1. Choose oxbow.apk or oxbow-clone.apk.
2. Download the APK from the official GitHub releases page.
3. Check the release notes for the supported Instagram version (currently 453.0.0.55.79).
4. Install the APK on your Android device.
5. Log in through Instagram as usual.
6. Long-press the Home tab to open Oxbow settings.
7. Report issues on GitHub if something does not work.

## Troubleshooting

### Android blocks the installation

Enable installation from unknown sources for your browser or file manager.

### The app does not install

Check whether you are installing the classic APK over an incompatible Instagram version.

If you want to keep official Instagram installed, use the clone APK instead.

### A feature is broken

Check the latest issues and releases. Instagram updates may break patches.

### You lose app data after reinstalling

For builds you sign yourself, Android treats a different signing key as a different trusted installer. Reinstall with the same keystore to preserve existing app data, or uninstall the previous build first.
