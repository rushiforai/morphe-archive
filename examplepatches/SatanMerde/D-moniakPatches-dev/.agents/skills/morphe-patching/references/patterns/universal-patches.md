# Universal Patches — App-Agnostic Techniques

Patches that work on ANY app, not tied to specific packages. From revanced-patches and community repos.

## Screenshot & Screen Capture

### Remove Screenshot Restriction
Removes FLAG_SECURE from windows so screenshots work:
```kotlin
// Find all Window.addFlags/setFlags calls and clear the SECURE flag
// FLAG_SECURE = 0x2000, so AND with ~0x2001 to clear it
transformInstructionsPatch(
    filterMap = { _, _, instruction, index ->
        // Find iput to WindowManager.LayoutParams.flags
        if (instruction.opcode == Opcode.IPUT) {
            val field = (instruction as Instruction22c).reference as FieldReference
            if (field.definingClass == "Landroid/view/WindowManager\$LayoutParams;" &&
                field.name == "flags") return index
        }
        null
    },
    transform = { method, index ->
        val register = (instruction as Instruction22c).registerA
        method.addInstructions(index, "and-int/lit16 v$register, v$register, -0x2001")
    }
)
```

### Prevent Screenshot Detection
Remove `registerScreenCaptureCallback` calls so app can't detect screenshots:
```kotlin
// Simply remove the invoke-virtual calls to register/unregister callbacks
transformInstructionsPatch(
    filterMap = { _, _, instruction, index ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return null
        val ref = instruction.getReference<MethodReference>() ?: return null
        if (ref.name == "registerScreenCaptureCallback" || ref.name == "unregisterScreenCaptureCallback")
            return index
        null
    },
    transform = { method, index -> method.removeInstruction(index) }
)
```

## Hide ADB / Developer Settings

Intercept `Settings.Global.getInt()` calls to hide ADB enabled status:
```kotlin
// Replace Settings.Global.getInt() with extension that returns 0 for ADB settings
transformInstructionsPatch(
    filterMap = { _, _, instruction, index ->
        if (instruction.opcode == Opcode.INVOKE_STATIC) {
            val ref = instruction.getReference<MethodReference>()
            if (ref?.definingClass == "Landroid/provider/Settings\$Global;" && ref.name == "getInt")
                return Triple(instruction, index, ref.parameterTypes)
        }
        null
    },
    transform = { method, (instruction, index, params) ->
        method.replaceInstruction(index,
            "invoke-static { registers }, Lext;->getInt(${params.joinToString("")})I")
    }
)
```

## Hide Mock Location

Prevent apps from detecting mock/fake GPS:
```kotlin
// Replace Location.isMock() and Location.isFromMockProvider() to return false
transformInstructionsPatch(
    filterMap = { _, _, instruction, index ->
        val ref = instruction.getReference<MethodReference>()
        if (ref?.name == "isMock" || ref?.name == "isFromMockProvider") return instruction to index
        null
    },
    transform = { method, (instruction, index) ->
        method.replaceInstruction(index + 1, "const/4 v${instruction.registerC}, 0x0")
    }
)
```

## Override Certificate Pinning (Network Security Config)

Create a network_security_config.xml that trusts user certificates:
```kotlin
resourcePatch {
    dependsOn(enableAndroidDebuggingPatch)
    execute {
        // Add networkSecurityConfig to manifest
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            app.setAttribute("android:networkSecurityConfig", "@xml/network_security_config")
        }

        // Create the config file
        File(get("res/xml"), "network_security_config.xml").writeText("""
            <?xml version="1.0" encoding="utf-8"?>
            <network-security-config>
                <base-config cleartextTrafficPermitted="true">
                    <trust-anchors>
                        <certificates src="system" />
                        <certificates src="user" overridePins="true" />
                    </trust-anchors>
                </base-config>
            </network-security-config>
        """)
    }
}
```

## Disable Play Integrity

Intercept `Context.bindService()` to prevent Play Integrity service binding:
```kotlin
// Replace bindService calls with extension that blocks Play Integrity
transformInstructionsPatch(
    filterMap = { _, _, instruction, index ->
        val ref = instruction.getReference<MethodReference>()
        if (ref?.definingClass == "Landroid/content/Context;" && ref.name == "bindService")
            return Triple(instruction, index, ref.parameterTypes)
        null
    },
    transform = { method, (instruction, index, params) ->
        method.replaceInstruction(index,
            "invoke-static { regs }, Lext;->bindService(Landroid/content/Context;${params})Z")
    }
)
```

## Disable Sentry Telemetry

Add manifest meta-data to disable Sentry:
```kotlin
resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getNode("application") as Element
            app.addMetaData("io.sentry.enabled", "false")
            app.addMetaData("io.sentry.dsn", "")
        }
    }
}
```

## Hook Package Manager (KakaoTalk)

Replace `appComponentFactory` in manifest to intercept package manager calls:
```kotlin
resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            app.setAttribute("android:appComponentFactory",
                "app.revanced.extension.kakaotalk.spoofer.RevancedAppComponentFactory")
        }
        // Copy original signature file into APK
        val sig = classLoader.getResourceAsStream("kakaotalk/app.revanced.sig.orig")!!.readAllBytes()
        File(get("."), "app.revanced.sig.orig").writeBytes(sig)
    }
}
```

## Other Universal Patches

| Patch | What it does |
|-------|-------------|
| **Change package name** | Rename app package in manifest |
| **Hide app icon** | Change LAUNCHER category to DEFAULT |
| **Export all activities** | Set `exported=true` on all activities |
| **Change data directory** | Redirect app data storage |
| **Spoof build info** | Fake Build.MODEL, Build.MANUFACTURER, etc. |
| **Spoof SIM country** | Fake SIM card country code |
| **Spoof WiFi** | Fake WiFi connection info |
| **Change version code** | Modify app version code |
| **Add shared user ID** | Share data between apps |
| **Predictive back gesture** | Enable/disable Android 14+ back gesture |
| **Custom certificates** | Trust custom CA certificates for specific domains |

## Key Pattern: transformInstructionsPatch

Most universal patches use `transformInstructionsPatch` to find and replace method calls across ALL classes:

```kotlin
transformInstructionsPatch(
    filterMap = { classDef, method, instruction, index ->
        // Return non-null to mark this instruction for transformation
        // Return null to skip
    },
    transform = { mutableMethod, matchData ->
        // Modify the matched instruction
    }
)
```

This scans every instruction in every method in every class — powerful but use carefully (performance).
