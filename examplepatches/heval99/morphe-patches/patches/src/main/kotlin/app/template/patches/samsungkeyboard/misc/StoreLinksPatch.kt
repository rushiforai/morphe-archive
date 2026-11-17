package app.template.patches.samsungkeyboard.misc

import app.template.patches.shared.samsung.EXTENSION_CLASS_PREFIX

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val SYSTEM_ACCESS = "Lapp/template/extension/samsungkeyboard/SystemAccess;"
private const val STORE_SCHEME = "samsungapps://"
private val START_ACTIVITY_OWNERS = setOf("Landroid/content/Context;", "Landroid/content/ContextWrapper;", "Landroid/app/Activity;")

/**
 * Galaxy Store links (samsungapps://...) are opened with a bare startActivity, which throws ActivityNotFoundException on
 * a phone without Galaxy Store and would crash the keyboard (found statically). In every method that builds such a link, a startActivity that no
 * try block covers goes through SystemAccess.startActivitySafely, which opens nothing when the store is absent.
 */
internal val storeLinksPatch = bytecodePatch(
    description = "Stops Galaxy Store links from crashing the keyboard where there is no Galaxy Store.",
) {
    extendWith(SAMSUNG_KEYBOARD_EXTENSION)

    execute {
        /** Indexes of startActivity calls in a method that builds a samsungapps:// link and have no try block over them. */
        fun unguarded(m: Method): List<Int> {
            val impl = m.implementation ?: return emptyList()
            val code = impl.instructions.toList()
            if (code.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(STORE_SCHEME) == true }) {
                return emptyList()
            }
            var address = 0
            val found = mutableListOf<Int>()
            code.forEachIndexed { index, insn ->
                val r = (insn as? ReferenceInstruction)?.reference as? MethodReference
                if (insn.opcode == Opcode.INVOKE_VIRTUAL && r != null && r.name == "startActivity" &&
                    r.definingClass in START_ACTIVITY_OWNERS && r.returnType == "V" &&
                    r.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Intent;") &&
                    impl.tryBlocks.none { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }
                ) found += index
                address += insn.codeUnits
            }
            return found
        }

        // The sticker store button is the site that matters: fail loudly if it is gone or already guarded.
        val sticker = StickerStoreClickFingerprint.method
        if (unguarded(sticker).isEmpty()) throw PatchException("the sticker store click has no unguarded startActivity")

        val sites = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_CLASS_PREFIX)) return@classDefForEach
            classDef.methods.filter { unguarded(it).isNotEmpty() }.forEach { sites += classDef.type to it }
        }
        var guarded = 0
        for ((type, method) in sites) {
            val mutableMethod = mutableClassDefBy(type).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }
            for (index in unguarded(mutableMethod)) {
                val insn = mutableMethod.implementation!!.instructions.toList()[index] as FiveRegisterInstruction
                // Context.startActivity(Intent) is {context, intent}: two 4-bit registers, so no width problem.
                mutableMethod.replaceInstruction(
                    index,
                    "invoke-static { v${insn.registerC}, v${insn.registerD} }, " +
                        "$SYSTEM_ACCESS->startActivitySafely(Landroid/content/Context;Landroid/content/Intent;)V",
                )
                guarded++
            }
            java.util.logging.Logger.getLogger("SamsungKeyboard")
                .info("Store links: guarded startActivity in $type->${method.name}")
        }
        if (guarded == 0) throw PatchException("no unguarded Galaxy Store startActivity found")
    }
}
