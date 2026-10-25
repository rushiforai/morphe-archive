package app.template.patches.pimusicplayer.premium

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_PIMUSICPLAYER
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Premium (ad-free) state is a static boolean flag in an R8-obfuscated holder class (`v7/g` on
 * 3.2.0.0) next to the list of owned background-pack ids (`X`, filled with "1".."5" by the
 * all-packs purchase): `a()` returns list-size == 5 (all background packs owned), `b()` returns
 * flag && a() (the combo pack), and 32 reads in 25 classes use the flag field directly; those
 * reads are the real gates. The flag has two writers: the cold-start prefs loader (called from
 * MyApplication.onCreate) stores the "isAdFree" preference into it, and the setter `c(Z)` used by
 * the remove_ads / combo purchases, the rewarded temporary ad-free grant and the temp-ad-free
 * resetter, which clears it when the trial timestamp expires.
 *
 * Nothing here pins obfuscated names. The flag field is resolved dynamically:
 * the unique "AD_FREE" literal lives in the ad-state reporter, whose
 * sget-boolean reveals the field. `b()` is the no-arg static boolean reading
 * that field; `a()` is the no-arg static boolean it calls. The resetter is the
 * no-arg void method in the class owning the "checkAndDisableTempAdFree" log.
 * The writers are every `sput-boolean` to the field anywhere in the app; the prefs
 * loader's is the one fed by the "isAdFree" preference read.
 * Every lookup fails loudly if the shape ever changes.
 */
private const val AD_FREE_LITERAL = "AD_FREE"
private const val RESETTER_LOG = "checkAndDisableTempAdFree() :: start"
private const val PREFS_KEY = "isAdFree"

private fun Instruction.isWriteOf(flag: FieldReference): Boolean {
    if (opcode != Opcode.SPUT_BOOLEAN) return false
    val field = (this as ReferenceInstruction).reference as FieldReference
    return field.definingClass == flag.definingClass && field.name == flag.name && field.type == "Z"
}

/**
 * Whether the write at [index] stores the result of a "isAdFree" preference read: the
 * instruction before it is the move-result of [register] and the key is loaded just before.
 */
private fun MutableMethod.storesPrefsFlag(index: Int, register: Int): Boolean {
    val moveResult = instructions.getOrNull(index - 1)
    if (moveResult?.opcode != Opcode.MOVE_RESULT ||
        (moveResult as OneRegisterInstruction).registerA != register
    ) return false
    return (maxOf(0, index - 5) until index - 1).any {
        ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == PREFS_KEY
    }
}

/**
 * Makes every store to [flag] store true: `sput-boolean vX, flag` becomes `const vX, 0x1` +
 * `sput-boolean vX, flag`. The const replaces the sput in place, so it keeps the sput's labels
 * and a branch that jumped to the store still runs it; the re-added sput sits right after it,
 * in the same try range. vX keeps true afterwards, which only matches the forced premium state.
 * Requires the prefs loader's write and at least [MIN_WRITES] writes overall. Returns the count.
 */
private fun BytecodePatchContext.forceFlagWrites(flag: FieldReference): Int {
    val owners = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.isWriteOf(flag) } == true
            }
        ) owners += classDef.type
    }

    var writes = 0
    var prefsWrite = false
    for (owner in owners) {
        for (method in mutableClassDefBy(owner).methods) {
            if (method.implementation == null) continue
            val indices = method.instructions.withIndex()
                .filter { it.value.isWriteOf(flag) }
                .map { it.index }
            // Back to front, so earlier indices stay valid.
            for (index in indices.asReversed()) {
                val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                if (method.storesPrefsFlag(index, register)) prefsWrite = true
                method.addInstructionChecked(
                    index + 1,
                    "sput-boolean v$register, ${flag.definingClass}->${flag.name}:Z",
                )
                val const = if (register < 16) "const/4" else "const/16"
                method.replaceInstruction(index, "$const v$register, 0x1")
                writes++
            }
        }
    }
    if (!prefsWrite) error("Pi premium flag: no write of the \"$PREFS_KEY\" preference to ${flag.name}")
    if (writes < MIN_WRITES) error("Pi premium flag: only $writes writes to ${flag.name} (expected >= $MIN_WRITES)")
    return writes
}

// The prefs loader and the c(Z) setter on 3.2.0.0.
private const val MIN_WRITES = 2

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
    description = "Unlocks premium features."
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

        // Every write to the flag stores true. The cold-start prefs loader (run from
        // MyApplication.onCreate) used to overwrite the seed below with the stored "isAdFree"
        // false on every launch, and c(Z) could clear it again; the 32 direct reads are the
        // real gates, so the field itself has to stay true.
        forceFlagWrites(flag)

        // Temp-ad-free resetter: on expiry it calls c(false), persists ad-free off and resets
        // the trial timestamp. Neutering it keeps the stored state from being cleared too.
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

        // Seed the flag true at class init so the direct field reads see premium even
        // before the prefs loader runs. Added after forceFlagWrites, so it is not doubled.
        val clinit = holder.methods.firstOrNull { it.name == "<clinit>" }
            ?: error("Pi premium holder <clinit> not found in ${holder.type}")
        val insertAt = clinit.implementation!!.instructions.count() - 1
        clinit.requireNoBranchTargetAt(insertAt, "Pi premium flag seed")
        clinit.addInstructionsChecked(
            insertAt,
            "const/4 v0, 0x1\n" +
                "sput-boolean v0, ${flag.definingClass}->${flag.name}:Z",
        )
    }
}
