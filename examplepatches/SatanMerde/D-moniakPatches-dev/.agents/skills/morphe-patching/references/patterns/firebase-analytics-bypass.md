# Firebase & Analytics Bypass Patterns

How to disable Firebase services, analytics, and telemetry at different levels.

## Firebase Analytics — Manifest Deactivation

Simplest approach — add meta-data to AndroidManifest.xml:

```kotlin
resourcePatch(name = "Deactivate Firebase Analytics") {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val metaData = doc.createElement("meta-data").apply {
                setAttribute("android:name", "firebase_analytics_collection_deactivated")
                setAttribute("android:value", "true")
            }
            app.appendChild(metaData)
        }
    }
}
```

Other useful meta-data flags:
```xml
<meta-data android:name="firebase_analytics_collection_deactivated" android:value="true"/>
<meta-data android:name="firebase_crashlytics_collection_enabled" android:value="false"/>
<meta-data android:name="firebase_performance_collection_deactivated" android:value="true"/>
<meta-data android:name="google_analytics_adid_collection_enabled" android:value="false"/>
```

## Firebase Certificate Hash Spoofing

Firebase Installations validates the app's certificate hash. After re-signing, this breaks.

```kotlin
// Spoof the SHA-1 hash used by Firebase
val certificateHash = "original_sha1_hash_40_hex_chars"
baseSpoofAndroidCertPatch { certificateHash }
```

## Remove Google Analytics Components

Remove analytics-related broadcast receivers and services from manifest:

```kotlin
resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            // Remove AppMeasurementReceiver
            removeComponent(doc, "receiver", "com.google.android.gms.measurement")
            // Remove AppMeasurementService
            removeComponent(doc, "service", "com.google.android.gms.measurement")
            // Remove AnalyticsReceiver
            removeComponent(doc, "receiver", "com.google.firebase.analytics")
        }
    }
}
```

## Remove Advertising ID

Prevent apps from reading the Google Advertising ID:

```kotlin
// Find and disable AdvertisingIdClient.getAdvertisingIdInfo()
classDefBy("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;")
    .methods.first { it.name == "getAdvertisingIdInfo" }
    .toMutable().returnEarly(null)
```

## Spoof Advertising ID

Return a random/zeroed advertising ID:

```kotlin
SpoofAdvertisingIdFingerprint.method.returnEarly("00000000-0000-0000-0000-000000000000")
```

## Crashlytics Disable

```kotlin
// Option 1: Manifest flag
metaData("firebase_crashlytics_collection_enabled" to "false")

// Option 2: Bytecode — disable at init
classDefBy("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
    .methods.first { it.name == "getInstance" }
    .toMutable().returnEarly(null)
```

## Firebase Performance Disable

```kotlin
metaData("firebase_performance_collection_deactivated" to "true")
```

## Signature Verification Spoof (adobo — most advanced)

Complete signature spoofing system with extension:

```kotlin
spoofSignatureVerificationPatch = bytecodePatch {
    extendWith("extensions/all/detection/signature/pms.mpe")
    dependsOn(packageNamePatch, encodeCertificatePatch, replaceSubApplicationPatch)

    execute {
        // 1. Replace package name in static constructor
        StaticConstructorFingerprint.method.replaceInstruction(
            packageNameIndex, "const-string v0, \"$packageName\""
        )

        // 2. Replace signature in static constructor
        StaticConstructorFingerprint.method.replaceInstruction(
            signatureIndex, "const-string v1, \"$signature\""
        )

        // 3. Make ALL Application subclasses extend the spoof class
        classDefForEach { classDef ->
            if (classDef.superclass == "Landroid/app/Application;") {
                mutableClassDefBy(classDef).setSuperClass(signatureHookAppClass.type)
            }
        }
    }
}
```

**Key insight:** By making all Application subclasses extend the spoof class, the signature hook runs before ANY app code, including third-party SDKs.

## Telemetry Blocking by Tag (Pinterest pattern)

Block specific analytics tasks by their tag names:

```kotlin
val tagsToBlock = listOf(
    "TAG_CRASH_REPORTING",
    "TAG_APPSFLYER_INIT",
    "TAG_FIREBASE_ANALYTICS_INIT",
    "TAG_GOOGLE_ENGAGE_INIT",
    "TAG_ADS_GMA_MANAGER_INIT",
    "TAG_TRACKING_REQUESTS",
    "TAG_RUM_REPORTING",
)

// Generate conditional return-void for each tag
val smali = buildString {
    append("iget-object v1, p0, $taskClass->tag:$tagType;\n")
    tagsToBlock.forEachIndexed { i, tag ->
        append("sget-object v0, $tagType->$tag:$tagType;\n")
        append("if-ne v1, v0, :next_$i\n")
        append("return-void\n")
        append(":next_$i\n")
    }
    append("nop\n")
}
method.addInstructions(0, smali)
```

## Decision Guide

```
What Firebase/analytics service to disable?
├── Firebase Analytics → Manifest meta-data flag (simplest)
├── Crashlytics → Manifest flag or bytecode disable
├── Performance Monitoring → Manifest flag
├── Advertising ID → Spoof to zeros or random
├── Certificate hash → Spoof SHA-1 for Firebase Installations
├── Signature verification → Application class replacement (deepest)
├── Multiple analytics tags → Generate conditional blocks
└── All Google analytics → Remove components from manifest
```
