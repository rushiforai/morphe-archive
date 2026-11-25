# Telemetry & Analytics Removal Patches for Masareef

This directory contains comprehensive patches to remove all telemetry, analytics, and tracking from the Masareef app.

## 📊 What Data Collection is Blocked

### Firebase Services (Google)
- ✅ Firebase Analytics
- ✅ Firebase Crashlytics
- ✅ Firebase Performance Monitoring
- ✅ Firebase Cloud Messaging Analytics
- ✅ Firebase Sessions Tracking

### Google Services
- ✅ Google Analytics (GMS Measurement)
- ✅ Google Ads Tracking
- ✅ Advertising ID Collection
- ✅ AdServices Attribution

### Facebook/Meta Services
- ✅ Facebook App Events
- ✅ Facebook Analytics
- ✅ Facebook Audience Network Ads Tracking

## 🔧 Available Patches

### Master Patch
- **`DisableAllTelemetryPatch`**: Applies all telemetry removal patches at once (recommended)

### Individual Firebase Patches
- **`DeactivateFirebaseAnalyticsPatch`**: Disables Firebase Analytics data collection
- **`DeactivateFirebasePerfPatch`**: Disables performance monitoring
- **`DeactivateFirebaseCrashlyticsPatch`**: Disables crash reporting
- **`DisableFirebaseMessagingAnalyticsPatch`**: Disables FCM analytics
- **`DisableFirebaseSessionsPatch`**: Disables session tracking

### Individual Google Patches
- **`RemoveGoogleAnalyticsPatch`**: Removes Google Analytics services
- **`RemoveAppMeasurementPatch`**: Removes App Measurement services
- **`RemoveAdvertisingIdPatch`**: Removes advertising ID permission
- **`RemoveAdsServicesPatch`**: Removes AdServices config
- **`DisableGoogleAdsTrackingPatch`**: Disables AdMob tracking

### Individual Facebook Patches
- **`DisableFacebookAnalyticsPatch`**: Disables Facebook App Events
- **`DisableFacebookAdsPatch`**: Disables Facebook Audience Network
- **`RemoveFacebookServicesPatch`**: Removes Facebook SDK services

## 🚀 Usage

### Option 1: Apply All (Recommended)
Enable the **"Disable All Telemetry"** patch when patching the app. This will apply all privacy patches.

### Option 2: Selective Patching
Enable only the specific patches you need if you want granular control.

## 🛡️ What Gets Removed

### From AndroidManifest.xml
- Analytics broadcast receivers
- Measurement services  
- Crashlytics services
- Advertising ID permissions
- AdServices permissions
- Facebook SDK services

### From Code (Bytecode)
- Analytics logging methods
- Event tracking methods
- Ad impression tracking
- Crash reporting
- Performance monitoring
- Session tracking

## 📝 Implementation Details

The patches work in two ways:

1. **Resource Patches**: Modify `AndroidManifest.xml` to:
   - Remove service and receiver declarations
   - Remove tracking permissions
   - Add deactivation metadata flags

2. **Bytecode Patches**: Modify app code to:
   - Return early from tracking methods
   - Return `false` for tracking enable checks
   - Prevent initialization of analytics SDKs

## ⚠️ Notes

- These patches are based on analysis of version **2.5.2** of the Masareef app
- All patches use the package name `com.appsqueue.masareef`
- The patches are conservative and safe - they only block data collection, not app functionality
- No user-facing features are affected

## 🔍 Verification

After patching, verify that telemetry is disabled by:
1. Installing the patched APK
2. Using network monitoring tools (e.g., Charles Proxy, mitmproxy)
3. Checking for absence of connections to:
   - `*.google-analytics.com`
   - `*.googleapis.com/analytics`
   - `*.facebook.com/analytics`
   - `*.crashlytics.com`

## 📚 Credits

These patches were created by analyzing and adapting code from:
- [jkennethcarino/adobo](https://github.com/jkennethcarino/adobo) - Privacy patches for ReVanced
- [hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) - Various app patches
- [binarymend/morphe-patches](https://github.com/binarymend/morphe-patches) - Morphe framework patches
