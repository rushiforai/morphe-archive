package app.revanced.patches.rif.links

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.revanced.patches.rif.shared.classes
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/ShareLinks;"
private const val MAIN_ACTIVITY = "Lcom/andrewshu/android/reddit/MainActivity;"

// The parameter types of ShareLinks.route/intercept: rif's own types are passed as Object.
private val STUB_PARAMS = listOf(
    "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Object;", "Ljava/lang/String;",
    "Ljava/lang/String;", "Z", "Ljava/lang/Object;", "Ljava/lang/Object;",
    "Landroid/content/Context;", "Ljava/lang/Object;",
)

private fun ClassDef.constStrings(): Set<String> =
    methods.flatMap { m ->
        m.implementation?.instructions
            ?.filter { it.opcode == Opcode.CONST_STRING }
            ?.map { (it as ReferenceInstruction).reference.toString() }
            .orEmpty()
    }.toSet()

// rif's link router (free l3.g.q / Platinum m3.g.q): public static
// q(String url, String, NoOpenType, String, String, boolean, WhitelistStatus,
//   FragmentManager, Context, BackStackSource) -> void. Every link tap in rif ends here. Matched by
// shape, in the class holding both "ACTION_COPY_URL" and "com.android.browser.application_id"
// (a pair unique to the router class in both builds).
internal val linkRouterFingerprint = fingerprint {
    custom { method, classDef ->
        AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "V" &&
            method.parameterTypes.size == 10 &&
            method.parameterTypes[0].toString() == "Ljava/lang/String;" &&
            method.parameterTypes[7].toString() == "Landroidx/fragment/app/FragmentManager;" &&
            method.parameterTypes[8].toString() == "Landroid/content/Context;" &&
            classDef.constStrings().let {
                "com.andrewshu.android.reddit.ACTION_COPY_URL" in it &&
                    "com.android.browser.application_id" in it
            }
    }
}

// MainActivity.l1()V (same name in both builds): dispatches the VIEW intent to a fragment.
private val mainActivityIntentFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == MAIN_ACTIVITY &&
            method.name == "l1" &&
            method.returnType == "V" &&
            method.parameterTypes.isEmpty() &&
            method.implementation?.instructions?.any {
                it.opcode == Opcode.CONST_STRING &&
                    (it as ReferenceInstruction).reference.toString() == "reddit url type %s"
            } == true
    }
}

@Suppress("unused")
val fixShareLinksPatch = bytecodePatch(
    name = "Fix share links",
    description = "Opens Reddit share links (reddit.com/r/…/s/…) directly in rif instead of bouncing " +
        "through the browser, and fixes reddit.com/media image links.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    // A widget can hand the router a null Context; the extension falls back to the app's.
    dependsOn(revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Hook 1: the router. A share link is resolved in the background and the router is
        // called again with the permalink.
        val router = linkRouterFingerprint.method
        val routerTypes = router.parameterTypes.map { it.toString() }
        requireScratchRegister(router)
        router.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p9 }, $EXTENSION->intercept(${STUB_PARAMS.joinToString("")})Z
                move-result v0
                if-eqz v0, :orig
                return-void
                :orig
                nop
            """,
        )

        // ShareLinks.route is an empty stub with the router's parameters as Objects; make it
        // cast them to the router's real types and call it (types differ per build).
        val stub = proxy(classes.first { it.type == EXTENSION }).mutableClass.methods
            .firstOrNull { it.name == "route" } ?: throw PatchException("ShareLinks.route not found")
        val casts = routerTypes.indices
            .filter { routerTypes[it] != STUB_PARAMS[it] }
            .joinToString("\n") { "check-cast p$it, ${routerTypes[it]}" }
        stub.addInstructions(
            0,
            """
                $casts
                invoke-static/range { p0 .. p9 }, ${router.definingClass}->${router.name}(${routerTypes.joinToString("")})V
            """,
        )

        // Hook 2: a share link opened from another app (VIEW intent) would otherwise start a
        // MainActivity that opens the in-app browser, which starts a second one.
        val dispatch = mainActivityIntentFingerprint.method
        requireScratchRegister(dispatch)
        dispatch.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION->interceptIntent(Landroid/app/Activity;)Z
                move-result v0
                if-eqz v0, :go
                return-void
                :go
                nop
            """,
        )
    }
}
