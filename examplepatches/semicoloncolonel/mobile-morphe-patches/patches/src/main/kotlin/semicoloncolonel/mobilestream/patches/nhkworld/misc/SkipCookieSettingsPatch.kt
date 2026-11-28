package semicoloncolonel.mobilestream.patches.nhkworld.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nhkworld.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod

// NHK WORLD-JAPAN 9.0.2 asks about cookies on the first launch, and again
// whenever its policy changes. The screen offers Accept all, Reject all, and
// Customize. Its two settings:
//   - Analytics: Adobe Analytics, and a cookie set on NHK's site.
//   - Functional: whether the app keeps its own settings. With it off, the
//     app deletes the saved language, closed caption language, and playback
//     speed, keeps them only until it closes, and asks again each time.
//
// This patch answers the screen with Reject all as soon as it loads, so
// analytics stay off and the choice is saved as it is when the button is
// tapped. It then treats the functional setting as on, so the app keeps its
// settings. The functional setting only decides whether the app saves them on
// the phone. The Cookie Settings page in Settings still works.

private const val FUNCTIONAL_COOKIE = "FunctionalCookie"

// The policy screen's insets listener reads this view by name.
internal object PolicyFragmentFingerprint : Fingerprint(
    strings = listOf("buttonArea"),
)

private fun Method.hasString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

@Suppress("unused")
val skipCookieSettingsPatch = bytecodePatch(
    name = "Skip cookie settings",
    description = "Rejects analytics cookies without showing the cookie screen, and keeps your language and " +
        "caption settings, which the app otherwise forgets each time it closes.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val fragment = PolicyFragmentFingerprint.classDef
        val type = fragment.type

        // Each button's handler is static, takes (fragment, View), and stores the
        // answer with one (ZZ)V call: Reject all passes false twice.
        val reject = fragment.methods.singleOrNull { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.map { it.toString() } == listOf(type, "Landroid/view/View;") &&
                method.implementation?.instructions?.let { code ->
                    val list = code.toList()
                    list.indices.any { i ->
                        val ref = (list[i] as? ReferenceInstruction)?.reference as? MethodReference
                        ref != null && ref.parameterTypes.map { it.toString() } == listOf("Z", "Z") &&
                            ref.returnType == "V" &&
                            (list.getOrNull(i - 1) as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                            list[i - 1].opcode == Opcode.CONST_4
                    }
                } == true
        } ?: throw PatchException("Reject all handler not found")

        // The method that fills in the screen's text sets five click listeners.
        val show = fragment.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.implementation?.instructions?.count {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setOnClickListener"
                } == 5
        } ?: throw PatchException("Policy screen setup not found")

        val showMethod = mutableClassDefBy(type).methods.first {
            it.name == show.name && it.parameterTypes == show.parameterTypes && it.returnType == show.returnType
        }
        val returns = showMethod.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        if (returns.isEmpty()) throw PatchException("Policy screen setup has no return")
        returns.asReversed().forEach { (index, _) ->
            showMethod.addInstructions(
                index,
                """
                    const/4 v0, 0x0
                    invoke-static {p0, v0}, $type->${reject.name}(${type}Landroid/view/View;)V
                """.trimIndent(),
            )
        }

        // The screen saves the answer by loading a page on NHK's site, and any
        // error while it loads, even for one image, fails the whole answer with
        // "Due to a technical issue, your request was not approved". In 9.0.2
        // this happens to Accept and Decline in the unpatched app as well. The
        // app keeps the answer itself, so these errors are ignored.
        val clients = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(type.removeSuffix(";") + "$") &&
                classDef.superclass == "Landroid/webkit/WebViewClient;"
            ) clients += classDef.type
        }
        var ignored = 0
        clients.forEach { client ->
            mutableClassDefBy(client).methods
                .filter { it.name == "onReceivedError" || it.name == "onReceivedHttpError" }
                .forEach {
                    it.addInstructions(0, "return-void")
                    ignored++
                }
        }
        if (ignored == 0) throw PatchException("Policy page error handlers not found")

        // Reads of the functional setting return true, and saves of it store true,
        // so the app keeps its settings and never deletes them.
        val reads = forEachMatchingMethod(
            classFilter = { true },
            methodFilter = { it.returnType == "Z" && it.hasString(FUNCTIONAL_COOKIE) },
        ) { it.addInstructions(0, "const/4 v0, 0x1\nreturn v0") }
        val saves = forEachMatchingMethod(
            classFilter = { true },
            methodFilter = {
                it.returnType == "V" && it.parameterTypes.lastOrNull()?.toString() == "Z" && it.hasString(FUNCTIONAL_COOKIE)
            },
        ) { method ->
            // The flag is the last parameter: p1 in both the instance and the static saves.
            val flag = method.parameterTypes.size - if (AccessFlags.STATIC.isSet(method.accessFlags)) 1 else 0
            method.addInstructions(0, "const/4 p$flag, 0x1")
        }
        if (reads == 0 || saves == 0) throw PatchException("Functional cookie setting not found ($reads reads, $saves saves)")
    }
}
