# Navigate360 Student Patch Specifications

## Overview

This document describes telemetry-removal patches for **Navigate360 Student** (`com.eab.se`) version `26.19.22`.

| Patch Name | Type | Default | Description |
|---|---|---|---|
| [Remove Tracking and Telemetry](#remove-tracking-and-telemetry) | `bytecodePatch` | `true` | Disables the native Gainsight PX SDK and its Cordova bridge. |
| [Remove Web Telemetry](#remove-web-telemetry) | `rawResourcePatch` | `true` | Removes Sentry reporting and neutralizes the embedded Gainsight JavaScript layers. |

---

## Remove Tracking and Telemetry

### Motivation

The native Gainsight PX Cordova plugin initializes behavioral analytics before the WebView is used. It configures session/lifecycle tracking, screen views, tap events, engagement delivery, identity, and custom events. This patch removes each executable native path while leaving the rest of the Cordova host untouched.

### Injection Points

| Class descriptor | Methods | Replacement |
|---|---|---|
| `Lcom/native360/gainsight/GainsightPlugin;` | `pluginInitialize()V`, `onStart()V`, `onNewIntent(Landroid/content/Intent;)V`, `handleGainsightIntent(Landroid/content/Intent;)V`, `initializeNativeSDK(Ljava/lang/String;)V` | `return-void` |
| `Lcom/native360/gainsight/GainsightPlugin;` | `attachNativeBridge()Z`, `loadBridgeScript(Ljava/lang/String;)Z`, `execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z` | `const/4 v0, 0x0; return v0` |
| `Lcom/gainsight/px/mobile/GainsightPX;` | `attachToWebView`, `loadScript`, `setSingletonInstance`, `enterEditingMode`, `enableEngagements`, `custom`, `screen`, `identify`, `flush` void overloads | `return-void` |
| `Lcom/gainsight/px/mobile/GainsightPX$Builder;` | `build()Lcom/gainsight/px/mobile/GainsightPX;` | `const/4 v0, 0x0; return-object v0` |

Patch-time validation requires every target class and method group to exist. A changed target APK fails with `PatchException` instead of emitting a partially patched APK.

---

## Remove Web Telemetry

### Motivation

Cordova assets independently start Sentry Browser reporting and expose Gainsight web APIs. Native bytecode neutralization alone does not remove these static initialization paths, so this raw-resource patch removes the Sentry boot sequence and converts Gainsight calls to local no-ops.

### Asset Changes

| Asset | Change |
|---|---|
| `assets/www/index.html` | Removes the `Reporting-Endpoints` Sentry group, the CSP `report-to sentry-csp` directive, the `./bin/sentry.js` script include, and the Sentry initialization/lifecycle breadcrumb block. |
| `assets/bundle.js` | Replaces the Gainsight `sendMessage` and `startEngine` export implementations with no-ops. |
| `assets/www/plugins/cordova-gainsight/www/gainsight.js` | Replaces `attach`, `getDiagnostics`, and `getApiKey` Cordova calls with resolved inert responses; no call reaches `cordova/exec`. |

Each replacement is exact and mandatory. A missing expected asset sequence causes `PatchException`, preserving the target-version guard.

### Verification

1. Build with `./gradlew :patches:buildAndroid clean --no-daemon`.
2. Run `./gradlew generatePatchesList`; verify both entries are registered for `com.eab.se` version `26.19.22`.
3. Apply the bundle to the Navigate360 APKM and verify compatibility succeeds.
4. Inspect the output: no Sentry script/init block or Sentry CSP endpoint remains, the Gainsight Cordova module's `attach`, `getDiagnostics`, and `getApiKey` methods return resolved inert promises without invoking `promiseExec`, and the listed native methods return immediately.
5. On device, exercise normal navigation and push registration. Confirm no requests target `esp-mobile.aptrinsic.com` or `sentry.devops.eab.com`.
