package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode

/** The bar's constructor that takes a style attribute; the shorter ones chain into it. */
private val bottomNavFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/foldable/FoldableBottomNav;") && method.name == "<init>" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I")
    },
)

/**
 * `MainActivity` tells every page how much room the bottom bar takes (its height), and the pages pad and clip their
 * content to leave it free. Under the glass bar the pages get no such room, so their content runs on behind it.
 */
private val homeInsetsFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type.endsWith("MainActivity\$onCreate\$homeInsets\$1;") && method.parameterTypes.isEmpty() &&
            method.returnType.endsWith("/Insets;")
    },
)

/** A taller bar: the space above and below the icon and label grows, which centers them in the capsule. */
private val taller = resourcePatch {
    execute {
        document("res/values/dimens.xml").use { dimens ->
            val nodes = dimens.getElementsByTagName("dimen")
            var found = false
            for (i in 0 until nodes.length) {
                val node = nodes.item(i)
                if (node.attributes.getNamedItem("name").nodeValue == "m3_comp_nav_bar_item_vertical_container_between_space") {
                    node.textContent = "14.0dp"
                    found = true
                }
            }
            if (!found) throw PatchException("m3_comp_nav_bar_item_vertical_container_between_space not found")
        }
    }
}

@Suppress("unused")
val glassNavigationBarPatch = bytecodePatch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. Slide a finger along it to switch tabs. Liquid Glass blurs what's behind it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(taller, settingsRowsPatch)

    execute {
        val insets = homeInsetsFingerprint.method
        if (insets.implementation!!.registerCount < 3) throw PatchException("No free registers in the insets getter")
        insets.addInstructions(
            0,
            """
                new-instance v0, ${insets.returnType}
                const/4 v1, 0x0
                invoke-direct { v0, v1, v1, v1, v1 }, ${insets.returnType}-><init>(IIII)V
                return-object v0
            """,
        )

        val constructor = bottomNavFingerprint.method
        val returns = constructor.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("The bottom bar's constructor has no return")
        // From the last return up, so the earlier indexes stay valid. p0 is only read.
        returns.reversed().forEach {
            constructor.addInstructions(it, "invoke-static { p0 }, Lapp/fakh/extension/jira/GlassNavigationBar;->install(Landroid/view/View;)V")
        }
    }
}
