package duskdream

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/** MicroG RE's package prefix. Play services refuses re-signed apps; MicroG RE accepts them. */
private const val VENDOR = "app.revanced"

private fun String.toVendor() = replace("com.google", VENDOR)

private val STRINGS: Map<String, String> = buildMap {
    put("com.google", VENDOR)
    put("com.google.android.gms", "$VENDOR.android.gms")
    (GMS_PERMISSIONS + GMS_ACTIONS + GMS_AUTHORITIES).forEach { put(it, it.toVendor()) }
}

private fun renamed(string: String): String? = STRINGS[string] ?: GMS_AUTHORITIES
    .firstOrNull { string.startsWith("content://$it") }
    ?.let { string.replace("content://$it", "content://${it.toVendor()}") }

/** Tells MicroG RE which identity the re-signed app has, as Morphe's YouTube patches do. */
internal fun microGManifestPatch(packageName: String, stockSignatureSha1: String) = resourcePatch {
    execute {
        val manifest = get("AndroidManifest.xml")
        val text = manifest.readText()
        val close = text.lastIndexOf("</application>")
        if (close < 0) throw PatchException("AndroidManifest.xml has no application tag")
        val metadata = listOf(
            "$VENDOR.android.gms.SPOOFED_PACKAGE_NAME" to packageName,
            "$VENDOR.android.gms.SPOOFED_PACKAGE_SIGNATURE" to stockSignatureSha1,
        ).joinToString("") { (name, value) -> "<meta-data android:name=\"$name\" android:value=\"$value\"/>" }
        manifest.writeText(
            (text.substring(0, close) + metadata + text.substring(close))
                .replace("com.google.android.c2dm", "$VENDOR.android.c2dm")
        )
    }
}

/**
 * Points every Play services name in the code at MicroG RE. The client library's own availability
 * check also verifies Play services' signature, which MicroG RE's can't satisfy, so it reports success.
 */
internal fun BytecodePatchContext.useMicroG(markedCheck: Boolean = true) {
    val targets = ArrayList<ClassDef>()
    val availability = ArrayList<ClassDef>()
    classDefForEach { cls ->
        if (cls.type.startsWith(EXT)) return@classDefForEach
        var hit = false
        var checks = false
        cls.methods.forEach { m ->
            m.implementation?.instructions?.forEach { i ->
                if (i.opcode == Opcode.CONST_STRING || i.opcode == Opcode.CONST_STRING_JUMBO) {
                    val s = ((i as ReferenceInstruction).reference as StringReference).string
                    if (renamed(s) != null) hit = true
                    if (s == AVAILABILITY_MARK) checks = true
                }
            }
        }
        if (hit) targets.add(cls)
        if (checks) availability.add(cls)
    }

    var strings = 0
    targets.forEach { def ->
        mutableClassDefBy(def).methods.forEach methods@{ m ->
            val impl = m.implementation ?: return@methods
            impl.instructions.toList().forEachIndexed { index, i ->
                if (i.opcode != Opcode.CONST_STRING && i.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                val s = ((i as ReferenceInstruction).reference as StringReference).string
                val to = renamed(s) ?: return@forEachIndexed
                val register = (i as OneRegisterInstruction).registerA
                val reference = ImmutableStringReference(to)
                impl.replaceInstruction(
                    index,
                    if (i.opcode == Opcode.CONST_STRING) BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                    else BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                )
                strings++
            }
        }
    }

    var checks = 0
    availability.forEach { def ->
        mutableClassDefBy(def).methods
            .filter { m ->
                m.returnType == "I" && m.implementation?.instructions?.any { i ->
                    (i as? ReferenceInstruction)?.reference.let { (it as? StringReference)?.string == AVAILABILITY_MARK }
                } == true
            }
            .forEach { m ->
                m.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
                checks++
            }
    }
    if (markedCheck && checks == 0) throw PatchException("Play services availability check not found")
    println("DuskDream: MicroG RE: $strings strings, $checks availability checks")
}

private const val AVAILABILITY_MARK = "Google Play services signature invalid."

