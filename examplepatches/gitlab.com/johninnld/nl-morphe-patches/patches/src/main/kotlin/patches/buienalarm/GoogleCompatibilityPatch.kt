/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/61
 * See LICENSE and NOTICE for GPLv3 Section 7 terms.
 *
 * Adapted for Buienalarm patches (2026-10-26): exact verified app targets,
 * unique input-certificate validation, ranged invokes, and bounded call count.
 */
package patches.buienalarm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.security.MessageDigest
import java.util.Base64
import org.w3c.dom.Element

private const val HELPER = "Lpatches/buienalarm/extension/SignatureCompatibility;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"

private val communityMapsKey = resourcePatch {
    dependsOn(originalInput)
    execute {
        val key = CommunityMapsKey.value
        check(Regex("AIza[0-9A-Za-z_-]{35}").matches(key)) { "Missing authorized community Maps key" }
        document("res/values/strings.xml").use { doc ->
            val nodes = doc.getElementsByTagName("string")
            val strings = (0 until nodes.length).map { nodes.item(it) as Element }
            val maps = strings.single { it.getAttribute("name") == "google_maps_android_api_key" }
            val firebase = strings.single { it.getAttribute("name") == "google_api_key" }
            val originalFirebaseKey = firebase.textContent
            maps.textContent = key
            check(firebase.textContent == originalFirebaseKey) { "Firebase key must remain unchanged" }
        }
    }
}

@Suppress("unused")
val googleCompatibility = bytecodePatch(
    name = "Fix Google services",
    description = "Preserves the original app certificate for Firebase and supplies the authorized community key for Google Maps.",
) {
    compatibleWith(buienalarm)
    dependsOn(originalInput, communityMapsKey)
    extendWith("extensions/signature.mpe")

    execute {
        val certificates = packageMetadata.signingCertificates.values.flatten()
            .distinctBy { Base64.getEncoder().encodeToString(it.encoded) }
        check(certificates.size == 1) { "Expected one original app certificate; use the original APK set" }
        val certificate = certificates.single()
        val fingerprint = MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(fingerprint in buienalarm.signatures.orEmpty()) { "Unrecognized original signing certificate: $fingerprint" }
        val encoded = Base64.getEncoder().encodeToString(certificate.encoded)
        mutableClassDefBy(HELPER).methods.single { it.name == "getOriginalCertificate" }.apply {
            check(implementation!!.registerCount >= 1)
            addInstructions(0, "const-string v0, \"$encoded\"\nreturn-object v0")
        }

        fun MethodReference.isPackageLookup() = definingClass == PACKAGE_MANAGER && name == "getPackageInfo" &&
            returnType == "Landroid/content/pm/PackageInfo;" && parameterTypes.map { it.toString() } in listOf(
                listOf("Ljava/lang/String;", "I"),
                listOf("Ljava/lang/String;", "Landroid/content/pm/PackageManager\$PackageInfoFlags;"),
            )

        val classes = mutableListOf<ClassDef>()
        classDefForEach { cls ->
            // D8 outlines newer framework APIs into synthetic classes beside the
            // extension. Those calls must keep reaching the real PackageManager.
            if (cls.type.startsWith("Lpatches/buienalarm/extension/")) return@classDefForEach
            if (cls.methods.any { method -> method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.isPackageLookup() == true
                } == true }) classes += cls
        }

        var replaced = 0
        classes.forEach { cls ->
            mutableClassDefBy(cls).methods.forEach { method ->
                method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
                    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (call?.isPackageLookup() != true) return@forEachIndexed
                    val descriptor = "$HELPER->getPackageInfo($PACKAGE_MANAGER${call.parameterTypes.joinToString("")})${call.returnType}"
                    val smali = when {
                        instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction is FiveRegisterInstruction -> {
                            val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                                instruction.registerF, instruction.registerG).take(instruction.registerCount)
                            "invoke-static {${registers.joinToString { "v$it" }}}, $descriptor"
                        }
                        instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE && instruction is RegisterRangeInstruction -> {
                            val last = instruction.startRegister + instruction.registerCount - 1
                            "invoke-static/range {v${instruction.startRegister} .. v$last}, $descriptor"
                        }
                        else -> error("Unexpected PackageManager call opcode ${instruction.opcode}")
                    }
                    method.replaceInstruction(index, smali)
                    replaced++
                }
            }
        }
        check(replaced == 50) { "Expected 50 bundled package lookups for 4.32.0, found $replaced" }
    }
}
