package anxyis.morphe.patches.alightmotion

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.math.max

val amzNoPopupPatch = bytecodePatch(
    name = "After Motion Z+ Popup Suppression (Complete Suite)",
    description = "Eliminates all startup, update, signature verification, and modded-by popups in After Motion Z+ (v5.0.272 / v5.0.273).",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_AMZ_MOTIOO, Constants.COMPATIBILITY_AMZ_MOTION)

    extendWith("extensions/classes.dex")

    execute {
        // 1. PairIP SignatureCheck: verifySignatureMatches -> return true (1)
        val sigMethod = SignatureMatchesFingerprint.methodOrNull
        if (sigMethod != null) {
            val mutableClass = mutableClassDefBy(SignatureMatchesFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "verifySignatureMatches" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                // const/4 v0, 1; return v0
                val insList = listOf(
                    ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                    ImmutableInstruction11x(Opcode.RETURN, 0)
                )
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    oldMethod.accessFlags and 0x0100.inv(),
                    oldMethod.annotations,
                    oldMethod.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        2,
                        insList,
                        null,
                        null
                    )
                ).toMutable()
                mutableClass.methods.add(newMethod)
            }
        }

        // 2. M1: Updates Required Popup (fq.ab -> return-void)
        val fqMethod = FqAbFingerprint.methodOrNull
        if (fqMethod != null) {
            val mutableClass = mutableClassDefBy(FqAbFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "ab" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val paramCount = oldMethod.parameters.size + (if ((oldMethod.accessFlags and 0x0008) == 0) 1 else 0)
                val registerCount = max(paramCount, 8)
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    oldMethod.accessFlags and 0x0100.inv(),
                    oldMethod.annotations,
                    oldMethod.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        registerCount,
                        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        null,
                        null
                    )
                ).toMutable()
                mutableClass.methods.add(newMethod)
            }
        }

        // 3. Anti-Exit: System.exit -> return-void
        val exitMethod = SystemExitFingerprint.methodOrNull
        if (exitMethod != null) {
            val mutableClass = mutableClassDefBy(SystemExitFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "n" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    oldMethod.accessFlags and 0x0100.inv(),
                    oldMethod.annotations,
                    oldMethod.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        8,
                        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        null,
                        null
                    )
                ).toMutable()
                mutableClass.methods.add(newMethod)
            }
        }

        // 4. Anti-Exit: Process.killProcess -> return-void
        val killMethod = KillProcessFingerprint.methodOrNull
        if (killMethod != null) {
            val mutableClass = mutableClassDefBy(KillProcessFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "bb" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    oldMethod.accessFlags and 0x0100.inv(),
                    oldMethod.annotations,
                    oldMethod.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        8,
                        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        null,
                        null
                    )
                ).toMutable()
                mutableClass.methods.add(newMethod)
            }
        }

        // 5. M4: Injects PopupDismisser into AlightMotionApplication.onCreate
        val appMethod = AlightMotionAppFingerprint.methodOrNull
        if (appMethod != null) {
            val mutableClass = mutableClassDefBy(AlightMotionAppFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "onCreate" }
            if (oldMethod != null) {
                val oldImpl = oldMethod.implementation
                if (oldImpl != null) {
                    val insList = mutableListOf<Instruction>()
                    val hookInst = ImmutableInstruction35c(
                        Opcode.INVOKE_STATIC,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        ImmutableMethodReference(
                            "Lcom/alightcreative/app/motion/persist/PopupDismisser;",
                            "onStart",
                            listOf(),
                            "V"
                        )
                    )
                    insList.add(hookInst)
                    for (inst in oldImpl.instructions) {
                        insList.add(inst)
                    }
                    val regCount = oldImpl.registerCount
                    mutableClass.methods.remove(oldMethod)
                    mutableClass.methods.add(
                        ImmutableMethod(
                            oldMethod.definingClass,
                            oldMethod.name,
                            oldMethod.parameters,
                            oldMethod.returnType,
                            oldMethod.accessFlags,
                            oldMethod.annotations,
                            oldMethod.hiddenApiRestrictions,
                            ImmutableMethodImplementation(
                                regCount,
                                insList,
                                oldImpl.tryBlocks,
                                null
                            )
                        ).toMutable()
                    )
                }
            }
        }
    }
}
