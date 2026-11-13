# Small Repos — Niche Patterns

Patterns from smaller community repos (Gboard, PokeCardex, Transit, Call Blacklist, iPoji).

## Override Specific Numeric Limit (PokeCardex)

Change a hardcoded limit by returning a different constant:

```kotlin
// Change scan limit from 30 to 50
IncreaseScanLimitFingerprint.method.addInstructions(0, """
    const/16 v0, 0x32
    return v0
""")
```

## Replace Move-Result After Method Call (Transit)

Override a method's return value at the call site instead of in the method itself:

```kotlin
val premiumKeyIndex = method.indexOfFirstStringInstructionOrThrow("activate_royale_subscription")
val moveResultIndex = method.indexOfFirstInstructionOrThrow(premiumKeyIndex, Opcode.MOVE_RESULT)
val resultRegister = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

// Replace the move-result with a constant — method still runs but result is overridden
method.replaceInstruction(moveResultIndex, "const/4 v$resultRegister, 0x1")
```

**Key technique:** Override at the CALL SITE, not in the target method. Useful when you can't modify the target method (e.g., it's in a library).

## Replace Google Maps API Key (Transit)

Swap API keys in AndroidManifest.xml for re-signed APKs:

```kotlin
val apiKey by stringOption(key = "mapsApiKey", title = "Google Maps API key", required = false)

resourcePatch {
    execute {
        document("AndroidManifest.xml").use { dom ->
            val metaDataNodes = dom.getElementsByTagName("meta-data")
            for (i in 0 until metaDataNodes.length) {
                val node = metaDataNodes.item(i)
                if (node.attributes.getNamedItem("android:name")?.nodeValue == "com.google.android.maps.v2.API_KEY") {
                    node.attributes.getNamedItem("android:value")?.nodeValue = apiKey
                    break
                }
            }
        }
    }
}
```

## Complete Method Replacement — Multiple Methods (Call Blacklist)

Replace entire method bodies for multiple methods in a class:

```kotlin
// Replace multiple methods in same class
val mutableClass = fingerprint.match(gatekeeperClass).classDef
val methodNames = listOf("f", "g", "h")

for (method in mutableClass.methods) {
    if (method.name in methodNames && method.returnType == "Z") {
        if (method.implementation == null) continue
        method.removeInstructions(0, method.instructions.count())
        method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
```

## RevenueCat EntitlementInfo.isActive() — Single Point Bypass (iPoji)

One fingerprint that unlocks everything by targeting the deepest check:

```kotlin
// Force EntitlementInfo.isActive() to return true
// This single patch covers the ENTIRE subscription pipeline:
// 1. EntitlementInfos constructor filters on isActive() → all entitlements now "active"
// 2. EntitlementInfoMapperKt.map() reads isActive() → Flutter receives isActive=true
// 3. Flutter code checking any entitlement sees active status
// 4. Ads gated by entitlement check are also suppressed

EntitlementIsActiveFingerprint.match(entitlementClass).method
    .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
```

**Key insight:** Find the DEEPEST check in the call chain. One patch at `isActive()` cascades through the entire app.

## Gboard — Deep XML Resource Manipulation

Modify keyboard layout XML resources with complex DOM operations:

```kotlin
resourcePatch {
    finalize {
        // Modify keyboard template XML
        document("res/xml/xml_0x7f17117a.xml").use { templateDoc ->
            val template = templateDoc.findSoftkeyTemplate(TEMPLATE_ID)
            ensureTemplateAction(template, type = "SLIDE_UP", data = "\$slideup_data\$")
            ensureTemplateAction(template, type = "SLIDE_DOWN", data = "\$press_data\$")
        }

        // Modify keyboard keys XML
        document("res/xml/xml_0x7f171179.xml").use { keysDoc ->
            keysDoc.findSoftkeyList(TEMPLATE_ID)
                .childElements("softkey")
                .forEach { key ->
                    // Add slide attributes from long_press_data
                    splitNonBlankTokens(key.getAttribute("long_press_data"))
                        .getOrNull(2)
                        ?.let { key.setAttribute("slideup_data", it) }
                }
        }
    }
}
```

**Key technique:** Use `finalize` block for resource patches that need to run after other patches. Complex DOM manipulation with custom helper functions.

## Gboard — String Resource Override for Feature Flags

Override string resources that act as feature flags:

```kotlin
document("res/values/strings.xml").use { doc ->
    doc.getElementsByTagName("string").elements()
        .firstOrNull { it.getAttribute("name") == "string_0x7f140378" }
        ?.let { it.textContent = "enable_voice_in_chinese=true" }
}
```

**Key technique:** Some apps use string resources as configuration flags — changing the string value enables features.

## Key Takeaways

1. **Override at call site** — replace `move-result` instead of modifying target method
2. **Deepest check bypass** — find the lowest-level check, one patch cascades everywhere
3. **API key replacement** — swap manifest meta-data for re-signed APKs
4. **Bulk method replacement** — iterate methods by name and replace all
5. **String-as-config** — some apps use string resources as feature flags
6. **Finalize for resources** — use `finalize` block when resource patches depend on other patches
7. **Numeric limit override** — `const/16` for values > 7, `const/4` for -8 to 7
