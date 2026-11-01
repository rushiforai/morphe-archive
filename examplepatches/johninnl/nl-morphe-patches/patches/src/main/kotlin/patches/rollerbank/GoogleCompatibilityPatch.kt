/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches-library/pull/61
 * See LICENSE and NOTICE for GPLv3 Section 7 terms.
 *
 * Adapted for Rollerbank 4.5.3.1: original input certificate, package-scoped
 * SDK identity compatibility and the user-authorized community Maps key.
 */
package patches.rollerbank

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
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
import patches.buienalarm.CommunityMapsKey

private const val HELPER = "Lpatches/buienalarm/extension/SignatureCompatibility;"
private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"

private val communityMapsKey = resourcePatch {
    dependsOn(originalInput)
    execute {
        val key = CommunityMapsKey.value
        check(Regex("AIza[0-9A-Za-z_-]{35}").matches(key))
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("meta-data")
            val maps = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("android:name") == "com.google.android.geo.API_KEY" }
            check(maps.getAttribute("android:value") == "@string/google_api_key")
            maps.setAttributeNS("http://schemas.android.com/apk/res/android", "android:value", key)
        }
    }
}

@Suppress("unused")
val googleCompatibility = bytecodePatch(
    name = "Fix Google services",
    description = "Preserves the original public app certificate in Google SDK requests and uses the authorized community Maps key. Keeps the original Firebase and Places configuration.",
) {
    compatibleWith(rollerbank)
    dependsOn(originalInput, communityMapsKey)
    extendWith("extensions/signature.mpe")

    execute {
        val certificates = packageMetadata.signingCertificates.values.flatten()
            .distinctBy { Base64.getEncoder().encodeToString(it.encoded) }
        check(certificates.size == 1) { "Expected one original app certificate; use the original APK set" }
        val certificate = certificates.single()
        val fingerprint = MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(fingerprint in rollerbank.signatures.orEmpty()) { "Unrecognized original signing certificate: $fingerprint" }
        val encoded = Base64.getEncoder().encodeToString(certificate.encoded)
        mutableClassDefBy(HELPER).methods.single { it.name == "getOriginalCertificate" }.apply {
            check(implementation!!.registerCount >= 1)
            addInstructions(0, "const-string v0, \"$encoded\"\nreturn-object v0")
        }

        val helper = mutableClassDefBy(HELPER)
        val packageValue = helper.fields.single { it.name == "PACKAGE_NAME" }.initialValue as MutableStringEncodedValue
        check(packageValue.value == "org.yoki.android.buienalarm")
        packageValue.value = "com.dennisk.rollerbank"
        val identity = helper.methods.single { it.name == "originalIdentity" }
        val packageLiterals = identity.implementation!!.instructions.withIndex().filter {
            ((it.value as? ReferenceInstruction)?.reference as? StringReference)?.string == "org.yoki.android.buienalarm"
        }.toList()
        check(packageLiterals.size == 1) { "Package-scoped compatibility helper changed" }
        packageLiterals.forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            identity.replaceInstruction(index, "const-string v$register, \"com.dennisk.rollerbank\"")
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
        check(replaced == 48) { "Expected 48 Rollerbank 4.5.3.1 package lookups, found $replaced" }
    }
}
