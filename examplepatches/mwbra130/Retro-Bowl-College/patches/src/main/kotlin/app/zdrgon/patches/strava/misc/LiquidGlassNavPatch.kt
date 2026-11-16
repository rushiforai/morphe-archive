package app.zdrgon.patches.strava.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val GLASS_CLASS = "Lapp/template/extension/strava/GlassNav;"
private const val STRAVA_EXTENSION = "extensions/strava.mpe"

private const val BOTTOM_NAV_ACTIVITY_CLASS =
    "Lcom/strava/view/bottomnavigation/BottomNavigationActivity;"
private const val NAV_CONTROLLER_CLASS =
    "Lcom/strava/view/bottomnavigation/a;"
private const val METHOD_SUFFIX = "\$original"

/**
 * Liquid Glass bottom navigation.
 *
 * Strava's main screen carries two bottom bars in the same slot of
 * activity_bottom_navigation.xml — the classic Material
 * BottomNavigationView (@id/bottom_navigation) and a ComposeView
 * (@id/bottom_navigation_compose_view) — and a feature flag in the
 * nav controller (bottomnavigation/a.b(), a lazy Boolean) picks which
 * one is shown. The Compose bar paints its own opaque background, so
 * it cannot be glassed from the outside.
 *
 * This patch therefore:
 *
 * 1. Forces the classic bar: a.b() is the Compose-bar flag — it
 *    returns FALSE from its first instruction (the same prepend-and-
 *    return idiom as the password login patch). Verified against the
 *    486.11 dex: BottomNavigationActivity.onCreate only binds the
 *    classic BottomNavigationView into the nav controller on the
 *    b()==false path; b()==true selects the ComposeView bar. (The
 *    first builds forced true — the Compose bar — and changed
 *    nothing.) The classic path is fully wired (menu, listeners,
 *    tints), not dead code. Trade-off: Compose-bar-only behavior
 *    (the expandable Record create menu) is lost.
 *
 * 2. Wraps BottomNavigationActivity.onCreate (rename-and-clone, the
 *    pattern the old settings patch used, including the move-object/
 *    from16 copies its 22-register frame requires) and calls the
 *    extension's GlassNav.apply() after the original, which restyles
 *    the visible bar as a floating translucent pill and
 *    re-constrains the content container so pages scroll underneath
 *    it — the YouTube / YouTube Music / Proton VPN look.
 */
@Suppress("unused")
val liquidGlassNavPatch = bytecodePatch(
    name = "Liquid Glass navigation",
    description = "Turns Strava's bottom bar into a floating Liquid Glass pill: detached " +
        "from the screen edges, live blurred backdrop with a translucent tint, content " +
        "scrolling underneath it, like the current YouTube and Proton VPN bars. " +
        "Tweak it under Extra Settings at the top of Strava's Settings screen " +
        "(on/off, floating vs docked, blur, tint opacity). Uses Strava's classic " +
        "bottom bar to make the effect possible.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    extendWith(STRAVA_EXTENSION)

    execute {
        // 1. Force the classic BottomNavigationView path.
        val controller = mutableClassDefBy(
            classDefBy(NAV_CONTROLLER_CLASS),
        )
        val switch = controller.methods.first { method ->
            method.name == "b" &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty()
        }
        switch.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // 2. Wrap BottomNavigationActivity.onCreate -> GlassNav.apply().
        // onCreate has 22 registers, so its parameter registers are
        // v20/v21. invoke-virtual/invoke-static (format 35c) can only
        // encode registers up to v15, and the assembler silently drops
        // instructions that name p0/p1 here. Copy the parameters into
        // low registers with move-object/from16 first, then call
        // through them.
        wrapMethod(
            classType = BOTTOM_NAV_ACTIVITY_CLASS,
            methodName = "onCreate",
            parameterTypes = listOf("Landroid/os/Bundle;"),
            returnType = "V",
        ) { originalReference ->
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                invoke-virtual {v0, v1}, $originalReference
                invoke-static {v0}, $GLASS_CLASS->apply(Landroid/app/Activity;)V
                return-void
            """.trimIndent()
        }

    }
}

/**
 * Renames the target method to `<name>$original` and installs a
 * same-signature replacement whose body is produced by [body] from the
 * reference to the renamed original. The replacement body is expected
 * to call the original and return; anything after the return is dead
 * code copied from the original implementation and never executes.
 */
private fun BytecodePatchContext.wrapMethod(
    classType: String,
    methodName: String,
    parameterTypes: List<String>,
    returnType: String,
    body: (originalReference: String) -> String,
) {
    val classDef = classDefBy(classType)
    val mutableClass = mutableClassDefBy(classDef)

    val original = mutableClass.methods.first { method ->
        method.name == methodName &&
            method.returnType == returnType &&
            method.parameterTypes == parameterTypes
    }

    if (!mutableClass.virtualMethods.remove(original)) {
        throw PatchException("$classType->$methodName is not a virtual method")
    }

    val originalReference = "$classType->$methodName$METHOD_SUFFIX" +
        "(${parameterTypes.joinToString("")})$returnType"

    val clone = ImmutableMethod.of(original).toMutable()
    mutableClass.virtualMethods += clone

    clone.addInstructions(0, body(originalReference))

    original.name += METHOD_SUFFIX
    mutableClass.virtualMethods += original
}
