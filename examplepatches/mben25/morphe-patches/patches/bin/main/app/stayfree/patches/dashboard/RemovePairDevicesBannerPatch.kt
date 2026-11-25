package app.stayfree.patches.dashboard

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val LAZY_LIST_ITEM = "Lcom/burockgames/timeclocker/common/data/LazyListItem;"

@Suppress("unused")
val removePairDevicesBannerPatch = bytecodePatch(
    name = "Remove pair devices banner",
    description = "Removes the \"Tap to pair your devices for the best StayFree experience!\" " +
        "banner from the dashboard and the \"Cross Platform is here\" sheet it opens " +
        "(Google login on each device, \"Share Download Links\").",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // Static `sget-object` sites of a field, across the whole app. Matches are collected
        // first and patched afterwards: classDefForEach walks the immutable classes.
        fun sitesOf(field: FieldReference): List<Pair<ClassDef, Method>> = buildList {
            classDefForEach { classDef ->
                classDef.methods.forEach { method ->
                    val reads = method.implementation?.instructions?.any {
                        it.opcode == Opcode.SGET_OBJECT &&
                            ((it as ReferenceInstruction).reference as FieldReference).let { ref ->
                                ref.definingClass == field.definingClass && ref.name == field.name &&
                                    ref.type == field.type
                            }
                    } ?: false
                    if (reads) add(classDef to method)
                }
            }
        }

        fun List<Instruction>.indicesOfRead(field: FieldReference) = indices.filter { index ->
            this[index].opcode == Opcode.SGET_OBJECT &&
                ((this[index] as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == field.definingClass && it.name == field.name
                }
        }

        // 1. The banner. The dashboard list is rebuilt by a `(LazyListBuilder) -> Unit` lambda
        //    (`sz4.invoke` in 20.16.1, inlined twice into `dk5` by jadx) which, when sync is
        //    possible but no device group exists (`hd8.m()`: `deviceGroupKey` is empty), does
        //        sget-object v0, va7->j:LazyListItem
        //        move-object v7, p1
        //        check-cast v7, Lnda;
        //        invoke-virtual {v7, v0}, Lnda;->a(LazyListItem)V
        //    Dropping only the `add` call leaves the branch otherwise intact (it already ends in a
        //    plain `goto`), so the list just has one item fewer — no empty slot or extra spacing,
        //    which nopping the item's composable would leave behind.
        val bannerItem = DashboardListItemsFingerprint.method.implementation!!.instructions.toList().let { clinit ->
            // `const-string vS, "idWarningItem1"` → `invoke-virtual {vP, vS}, IdProvider.invoke`
            // → `move-result-object vH` (the id holder) → … → `invoke-direct {vI, vH, vC},
            // LazyListItem.<init>(IdHolder, uj4)` → `sput-object vI, va7->j`.
            val idString = clinit.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "idWarningItem1"
            }
            val idHolder = clinit.subList(idString, clinit.size).firstOrNull { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                ?.let { (it as OneRegisterInstruction).registerA }
                ?: throw PatchException("idWarningItem1 holder not found")
            val constructor = (idString until clinit.size).firstOrNull { index ->
                val instruction = clinit[index]
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).definingClass == LAZY_LIST_ITEM &&
                    (instruction as FiveRegisterInstruction).registerD == idHolder
            } ?: throw PatchException("Pair devices banner item not found")
            val store = clinit[constructor + 1]
            if (store.opcode != Opcode.SPUT_OBJECT) throw PatchException("Pair devices banner field not found")
            (store as ReferenceInstruction).reference as FieldReference
        }

        val bannerSites = sitesOf(bannerItem)
        if (bannerSites.isEmpty()) throw PatchException("Pair devices banner is never added")
        bannerSites.forEach { (classDef, method) ->
            val mutableMethod = mutableClassDefBy(classDef).methods.first { MethodUtil.methodSignaturesMatch(it, method) }
            val instructions = mutableMethod.implementation!!.instructions.toList()
            instructions.indicesOfRead(bannerItem).forEach { read ->
                val itemRegister = (instructions[read] as OneRegisterInstruction).registerA
                // The first call after the read that takes the item: the list's `add`.
                val add = (read + 1 until instructions.size).firstOrNull { index ->
                    val instruction = instructions[index]
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(LAZY_LIST_ITEM)
                        } &&
                        (instruction as FiveRegisterInstruction).registerD == itemRegister
                } ?: throw PatchException("Pair devices banner add call not found")
                mutableMethod.replaceInstruction(add, "nop")
            }
        }

        // 2. The sheet. Its destination object is the only static field of its own type; the
        //    app opens it by handing it to the navigator lambda:
        //        sget-object vA, ib9->g:Lib9;
        //        invoke-interface {vNav, vContext, vA}, Lsj4;->invoke(Object, Object)Object
        //    from the banner's click (`nn0` case 10) and from the "Sync across devices" switch
        //    when no device group exists (`gt1` → `iv1`). Dropping the call makes both do
        //    nothing; the switch can't sync without a paired device anyway. The nav graph's
        //    `ib9.g.a.getRoute()` registration reads the field without such a call and stays,
        //    so the route is still known but nothing navigates to it.
        val sheetClass = ConnectDevicesInfoSheetFingerprint.classDef
        val sheet = sheetClass.fields.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.type == sheetClass.type
        } ?: throw PatchException("Connect devices sheet destination not found")

        var opened = 0
        sitesOf(sheet).forEach { (classDef, method) ->
            val mutableMethod = mutableClassDefBy(classDef).methods.first { MethodUtil.methodSignaturesMatch(it, method) }
            val instructions = mutableMethod.implementation!!.instructions.toList()
            instructions.indicesOfRead(sheet).forEach { read ->
                val call = instructions.getOrNull(read + 1) ?: return@forEach
                if (call.opcode != Opcode.INVOKE_INTERFACE) return@forEach
                val reference = (call as ReferenceInstruction).reference as MethodReference
                if (reference.name != "invoke" || reference.parameterTypes.size != 2 ||
                    (call as FiveRegisterInstruction).registerE != (instructions[read] as OneRegisterInstruction).registerA
                ) return@forEach
                instructions.getOrNull(read + 2)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                    ?.let { mutableMethod.replaceInstruction(read + 2, "nop") }
                mutableMethod.replaceInstruction(read + 1, "nop")
                opened++
            }
        }
        if (opened == 0) throw PatchException("Connect devices sheet is never opened")
    }
}
