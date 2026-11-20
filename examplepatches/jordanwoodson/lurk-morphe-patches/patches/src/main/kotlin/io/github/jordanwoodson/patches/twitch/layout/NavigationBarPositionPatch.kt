package io.github.jordanwoodson.patches.twitch.layout

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import org.w3c.dom.Element

private const val LANDING = "res/layout/viewer_landing.xml"

/** A copy of the main screen's layout with the navigation bar at the top; TwitchLayout looks it up by name. */
private const val LANDING_TOP = "res/layout/lurk_viewer_landing_top.xml"

private const val GROUP = "viewer_landing_bottom_navigation_group"
private const val RATING = "rating_banner_container"
private const val CONTENT = "fragment_container"

/**
 * Writes [LANDING_TOP]: the bar's group anchored to the top, the fragment container below it and the rating
 * banner at the bottom. The group is tagged so TwitchLayout knows the bottom inset is the screen's to pad.
 */
private val navigationBarLayoutPatch = resourcePatch {
    execute {
        get(LANDING_TOP).writeText(get(LANDING).readText())
        document(LANDING_TOP).use { doc ->
            val views = mutableMapOf<String, Element>()
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                val id = element.getAttribute("android:id").substringAfter('/')
                if (id.isNotEmpty()) views[id] = element
            }
            fun view(id: String) = views[id] ?: throw PatchException("Twitch: viewer_landing has no $id")
            fun Element.constrain(attribute: String, expected: String?, value: String?) {
                val name = "app:layout_constraint$attribute"
                val current = getAttribute(name).ifEmpty { null }
                if (current?.substringAfter('/') != expected?.substringAfter('/')) {
                    throw PatchException("Twitch: viewer_landing ${getAttribute("android:id")} $name is $current")
                }
                if (value == null) removeAttribute(name) else setAttribute(name, value)
            }
            view(CONTENT).apply {
                constrain("Top_toTopOf", "parent", null)
                constrain("Top_toBottomOf", null, "@id/$GROUP")
            }
            view(RATING).constrain("Bottom_toTopOf", "@id/$GROUP", null)
            view(RATING).constrain("Bottom_toBottomOf", null, "parent")
            view(GROUP).apply {
                constrain("Top_toBottomOf", "@id/$RATING", null)
                constrain("Bottom_toBottomOf", "parent", null)
                constrain("Top_toTopOf", null, "parent")
                setAttribute("android:tag", "lurk_top")
            }
        }
    }
}

@Suppress("unused")
val navigationBarPositionPatch = bytecodePatch(
    name = "Navigation bar position",
    description = "Adds a choice that moves Twitch's bottom navigation bar to the top of the screen and/or hides " +
        "its labels, leaving only the icons, and switches that hide its Create, Browse and Activity buttons. " +
        "Twitch's own layout stays until another choice is made in Lurk settings.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, navigationBarLayoutPatch)
    execute {
        // The layout the main screen inflates, swapped for the top copy while the bar is at the top.
        LandingInflateFingerprint.twitchMatch("main screen layout inflation").method.apply {
            val layout = resourceId(ResourceType.LAYOUT, "viewer_landing")
            val code = implementation!!.instructions
            val index = code.indices.singleOrNull {
                code[it].opcode == Opcode.CONST && (code[it] as NarrowLiteralInstruction).wideLiteral == layout
            } ?: throw PatchException("Twitch: no single viewer_landing constant")
            val register = (code[index] as OneRegisterInstruction).registerA
            val inflate = code[index + 1]
            val reference = (inflate as? ReferenceInstruction)?.reference as? MethodReference
            if (reference?.name != "inflate" || (inflate as FiveRegisterInstruction).registerD != register) {
                throw PatchException("Twitch: viewer_landing isn't inflated right after its constant")
            }
            addInstructions(index + 1, """
                invoke-static/range { v$register .. v$register }, $LAYOUT_CLASS->landingLayout(I)I
                move-result v$register
            """)
        }

        // The insets listener ends by giving the bar's group its bottom margin; then the group is in p0.
        LandingInsetsFingerprint.twitchMatch("main screen insets listener").method.apply {
            val code = implementation!!.instructions
            val set = code.indices.singleOrNull {
                ((code[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setLayoutParams"
            } ?: throw PatchException("Twitch: insets listener sets more than one layout")
            val group = (code[set] as FiveRegisterInstruction).registerC
            val read = code[set - 1]
            if (read.opcode != Opcode.IGET_OBJECT || (read as OneRegisterInstruction).registerA != group ||
                ((read as ReferenceInstruction).reference as FieldReference).type != "Landroid/widget/FrameLayout;" ||
                code[set + 1].opcode != Opcode.SGET_OBJECT) {
                throw PatchException("Twitch: unexpected insets listener")
            }
            addInstructions(set + 1, """
                invoke-static/range { v$group .. v$group }, $LAYOUT_CLASS->landingInsets(Landroid/view/View;)V
            """)
        }

        twitchSettings.add(ChoiceSetting("navigation_bar", "Navigation bar",
            "Where the main screen's navigation bar sits, and whether its icons have labels.",
            Section.INTERFACE, "0",
            listOf("Bottom" to "0", "Bottom, icons only" to "1", "Top" to "2", "Top, icons only" to "3"),
            restart = true))
        twitchSettings.add(
            SwitchSetting("nav_hide_create", "Hide Create button", "The round + button in the middle of the navigation bar.",
                Section.INTERFACE, default = false, restart = true),
            SwitchSetting("nav_hide_browse", "Hide Browse button", "Browse in the navigation bar.",
                Section.INTERFACE, default = false, restart = true),
            SwitchSetting("nav_hide_activity", "Hide Activity button", "Activity (notifications) in the navigation bar.",
                Section.INTERFACE, default = false, restart = true),
        )
    }
}
