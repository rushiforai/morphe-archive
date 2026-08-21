package anxyis.morphe.patches.alightmotion

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.math.max

val amzNoPopupPatch = bytecodePatch(
    name = "After Motion Z+ Popup Suppression (Complete Suite)",
    description = "Eliminates all startup, update, and modded-by popups in After Motion Z+ (v5.0.272 / v5.0.273).",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_AMZ_MOTIOO, Constants.COMPATIBILITY_AMZ_MOTION)

    extendWith("extensions/classes.dex")

    execute {
        // 1. M1: Updates Required Popup (fq.ab -> return-void)
        val fqMethod = FqAbFingerprint.methodOrNull
        if (fqMethod != null) {
            val mutableClass = mutableClassDefBy(FqAbFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "ab" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val paramCount = oldMethod.parameters.size + (if ((oldMethod.accessFlags and 0x0008) == 0) 1 else 0)
                val registerCount = max(paramCount, 8)
                val cleanFlags = oldMethod.accessFlags and 0x0100.inv() // Clear ACC_NATIVE
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    cleanFlags,
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

        // 2. M8: Modded by Satriyaid Dialog (zzw.xyz -> return-void)
        val zzwMethod = ZzwXyzFingerprint.methodOrNull
        if (zzwMethod != null) {
            val mutableClass = mutableClassDefBy(ZzwXyzFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "xyz" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val isStatic = (oldMethod.accessFlags and 0x0008) != 0
                val pCount = oldMethod.parameters.size + (if (isStatic) 0 else 1)
                val regCount = max(pCount, 8)
                val cleanFlags = oldMethod.accessFlags and 0x0100.inv() // Clear ACC_NATIVE
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    cleanFlags,
                    oldMethod.annotations,
                    oldMethod.hiddenApiRestrictions,
                    ImmutableMethodImplementation(
                        regCount,
                        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                        null,
                        null
                    )
                ).toMutable()
                mutableClass.methods.add(newMethod)
            }
        }

        // 3. M7: Project Wizard (zzzb.vbd -> return-void)
        val zzzbMethod = ZzzbVbdFingerprint.methodOrNull
        if (zzzbMethod != null) {
            val mutableClass = mutableClassDefBy(ZzzbVbdFingerprint.classDef)
            val vbd = mutableClass.methods.firstOrNull { it.name == "vbd" }
            if (vbd != null) {
                mutableClass.methods.remove(vbd)
                val pCount = vbd.parameters.size + (if ((vbd.accessFlags and 0x0008) != 0) 0 else 1)
                val regCount = max(pCount, 8)
                val cleanFlags = vbd.accessFlags and 0x0100.inv() // Clear ACC_NATIVE
                mutableClass.methods.add(
                    ImmutableMethod(
                        vbd.definingClass,
                        vbd.name,
                        vbd.parameters,
                        vbd.returnType,
                        cleanFlags,
                        vbd.annotations,
                        vbd.hiddenApiRestrictions,
                        ImmutableMethodImplementation(
                            regCount,
                            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),
                            null,
                            null
                        )
                    ).toMutable()
                )
            }
        }

        // 4. Anti-Exit: System.exit -> return-void
        val exitMethod = SystemExitFingerprint.methodOrNull
        if (exitMethod != null) {
            val mutableClass = mutableClassDefBy(SystemExitFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "n" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val cleanFlags = oldMethod.accessFlags and 0x0100.inv()
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    cleanFlags,
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

        // 5. Anti-Exit: Process.killProcess -> return-void
        val killMethod = KillProcessFingerprint.methodOrNull
        if (killMethod != null) {
            val mutableClass = mutableClassDefBy(KillProcessFingerprint.classDef)
            val oldMethod = mutableClass.methods.firstOrNull { it.name == "bb" }
            if (oldMethod != null) {
                mutableClass.methods.remove(oldMethod)
                val cleanFlags = oldMethod.accessFlags and 0x0100.inv()
                val newMethod = ImmutableMethod(
                    oldMethod.definingClass,
                    oldMethod.name,
                    oldMethod.parameters,
                    oldMethod.returnType,
                    cleanFlags,
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

        // 6. M4: Injects PopupDismisser into AlightMotionApplication.onCreate
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
