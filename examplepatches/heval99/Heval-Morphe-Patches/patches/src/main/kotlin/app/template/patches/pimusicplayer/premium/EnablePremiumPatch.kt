package app.template.patches.pimusicplayer.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PIMUSICPLAYER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Premium state is a static boolean flag plus a purchase list in an R8-obfuscated
 * holder class (`v7/g` on 3.2.0.0): `a()` returns list-size == 5, `b()` returns
 * flag && a(), and ~20 call sites read the flag field directly. The remove_ads /
 * combo SKUs set the flag through `c(Z)`, and a temp-ad-free resetter clears it
 * when the trial timestamp expires.
 *
 * Nothing here pins obfuscated names. The flag field is resolved dynamically:
 * the unique "AD_FREE" literal lives in the ad-state reporter, whose
 * sget-boolean reveals the field. `b()` is the no-arg static boolean reading
 * that field; `a()` is the no-arg static boolean it calls. The resetter is the
 * no-arg void method in the class owning the "checkAndDisableTempAdFree" log.
 * Every lookup fails loudly if the shape ever changes.
 */
private const val AD_FREE_LITERAL = "AD_FREE"
private const val RESETTER_LOG = "checkAndDisableTempAdFree() :: start"

private fun BytecodePatchContext.reporterMethod(): MutableMethod {
    val reporterClass = classDefByStrings(AD_FREE_LITERAL).singleOrNull()
        ?.let { mutableClassDefBy(it) }
        ?: error("Pi ad-state reporter class not found (literal '$AD_FREE_LITERAL')")
    return reporterClass.methods.firstOrNull { method ->
        method.implementation != null &&
            method.implementation!!.instructions.any { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == AD_FREE_LITERAL
            }
    } ?: error("Pi ad-state reporter method not found in ${reporterClass.type}")
}

private fun flagFieldOf(reporter: MutableMethod): FieldReference {
    val field = reporter.implementation!!.instructions
        .filter { it.opcode == Opcode.SGET_BOOLEAN }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference) }
        .singleOrNull()
        ?: error("Pi premium flag field not found (expected one sget-boolean)")
    return field
}

private fun BytecodePatchContext.flagClass(field: FieldReference): MutableClass =
    mutableClassDefByOrNull(field.definingClass)
        ?: error("Pi premium flag class not found (${field.definingClass})")

private fun MutableClass.noArgStaticBoolean(predicate: (MutableMethod) -> Boolean): MutableMethod =
    methods.firstOrNull { method ->
        method.returnType == "Z" && method.implementation != null &&
            method.parameterTypes.isEmpty() && predicate(method)
    } ?: error("Pi premium check not found in $type")

private fun MutableMethod.callsNoArgStaticBoolean(owner: String): MethodReference? =
    implementation!!.instructions
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
        .firstOrNull { ref ->
            ref.definingClass == owner && ref.returnType == "Z" &&
                ref.parameterTypes.isEmpty()
        }

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Pi Music Player Premium (ad-free) by forcing the local " +
        "purchase-state checks to true."
) {
    compatibleWith(COMPATIBILITY_PIMUSICPLAYER)

    execute {
        val flag = flagFieldOf(reporterMethod())
        val holder = flagClass(flag)

        // b(): the no-arg static boolean reading the flag field.
        val combined = holder.noArgStaticBoolean { method ->
            method.implementation!!.instructions.any { instruction ->
                instruction.opcode == Opcode.SGET_BOOLEAN &&
                    (((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                        ?.let { it.definingClass == flag.definingClass && it.name == flag.name } == true)
            }
        }

        // a(): the no-arg static boolean b() delegates to.
        val ref = combined.callsNoArgStaticBoolean(holder.type)
            ?: error("Pi purchase-list check not found (no static boolean call in ${holder.type})")
        val listCheck = holder.methods.firstOrNull { method ->
            method.name == ref.name && method.returnType == "Z" &&
                method.implementation != null && method.parameterTypes.isEmpty()
        } ?: error("Pi purchase-list check ${holder.type}.${ref.name}() not found")

        combined.returnEarly(true)
        listCheck.returnEarly(true)

        // Temp-ad-free resetter: neutering it keeps the seeded flag true, the same
        // reason EasyNotes patches consumers instead of writers.
        val resetterClass = classDefByStrings(RESETTER_LOG).singleOrNull()
            ?.let { mutableClassDefBy(it) }
            ?: error("Pi temp-ad-free resetter class not found (literal '$RESETTER_LOG')")
        val resetter = resetterClass.methods.firstOrNull { method ->
            method.name != "<init>" && method.name != "<clinit>" &&
                method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.implementation!!.instructions.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == RESETTER_LOG
                }
        } ?: error("Pi temp-ad-free resetter not found in ${resetterClass.type}")

        resetter.returnEarly()

        // Seed the flag true at class init so the ~20 direct field reads see
        // premium from the first access.
        val clinit = holder.methods.firstOrNull { it.name == "<clinit>" }
            ?: error("Pi premium holder <clinit> not found in ${holder.type}")
        val insertAt = clinit.implementation!!.instructions.count() - 1
        clinit.addInstructions(
            insertAt,
            "const/4 v0, 0x1\n" +
                "sput-boolean v0, ${flag.definingClass}->${flag.name}:Z",
        )
    }
}
