package com.github.xtapped.patches.tetrd

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.w3c.dom.Element

private val TETRD_COMPATIBILITY = Compatibility(
    name = "Tetrd",
    packageName = "com.robskie.tether",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "1.3.2")
    )
)

private object ProEntitlementFingerprint : Fingerprint(
    accessFlags = listOf(
        AccessFlags.PUBLIC,
        AccessFlags.STATIC,
        AccessFlags.FINAL
    ),
    returnType = "Z",
    parameters = listOf("L", "Ljava/util/ArrayList;"),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/ArrayList;",
            name = "size",
            parameters = emptyList(),
            returnType = "I"
        ),
        methodCall(
            definingClass = "Ljava/util/ArrayList;",
            name = "get",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;"
        ),
        methodCall(
            definingClass = "Ljava/lang/Enum;",
            name = "ordinal",
            parameters = emptyList(),
            returnType = "I"
        ),
        methodCall(
            definingClass = "Ljava/lang/Enum;",
            name = "ordinal",
            parameters = emptyList(),
            returnType = "I"
        )
    )
)

private fun shopButtonCall() = methodCall(
    parameters = listOf("L", "L", "Z", "L", "L", "L", "L", "L", "L", "I"),
    returnType = "V"
)

private object ShopFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;"
    ),
    filters = listOf(
        literal(0x7f110136),
        shopButtonCall(),
        literal(0x7f110107),
        literal(0x7f110108),
        shopButtonCall(),
        literal(0x7f11012c),
        literal(0x7f11012d),
        shopButtonCall()
    )
)

private val unlockProResourcesPatch = resourcePatch {
    execute {
        var patched = false

        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")

            for (index in 0 until strings.length) {
                val element = strings.item(index) as? Element ?: continue
                if (element.getAttribute("name") != "buy") continue

                element.textContent = "Patched"
                patched = true
            }
        }

        if (!patched) {
            throw PatchException("Could not find the buy string resource")
        }
    }
}

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro tethering and disables purchase actions in the shop.",
    default = true
) {
    compatibleWith(TETRD_COMPATIBILITY)

    dependsOn(unlockProResourcesPatch)

    execute {
        ProEntitlementFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        listOf(7, 4, 1).forEach { matchIndex ->
            val match = ShopFingerprint.instructionMatches[matchIndex]
            val call = match.instruction as? RegisterRangeInstruction
                ?: throw PatchException("Shop buy button call is not a range invoke")
            val enabledRegister = call.startRegister + 2

            ShopFingerprint.method.addInstruction(
                match.index,
                "const/16 v$enabledRegister, 0x0"
            )
        }
    }
}
