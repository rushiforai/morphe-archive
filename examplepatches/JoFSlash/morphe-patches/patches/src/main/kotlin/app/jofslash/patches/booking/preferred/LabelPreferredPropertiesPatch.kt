package app.jofslash.patches.booking.preferred

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/PreferredLabel;"
private const val PROPERTY_TITLE = "Lcom/booking/propertycomponents/title/compose/PropertyTitleKt;"
private const val PROPERTY_CARD = "Lcom/booking/propertycard/ui/PropertyCardKt;"
private const val BUI_ICON = "Lcom/booking/bui/compose/icon/BuiIcon_androidKt;"

/** Index of the call that draws the badge's icon, BuiIcon(modifier, icon, size, color, description, composer, ...). */
private fun MutableMethod.badgeIconCall(): Pair<Int, Int> {
    val instructions = implementation!!.instructions.toList()
    val index = instructions.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
                ((insn as ReferenceInstruction).reference as MethodReference).let {
                    it.definingClass == BUI_ICON && it.name.startsWith("BuiIcon") &&
                            it.parameterTypes.getOrNull(5)?.toString() == "Landroidx/compose/runtime/Composer;"
                }
    }
    if (index < 0) throw PatchException("Couldn't find the badge icon in $definingClass->$name")
    // The composer is the sixth argument.
    val composer = (instructions[index] as RegisterRangeInstruction).startRegister + 5
    return index to composer
}

@Suppress("unused")
val labelPreferredPropertiesPatch = bytecodePatch(
    name = "Label Preferred properties",
    description = "Adds \"pays higher commission\" next to the Preferred and Preferred Plus badges in " +
            "search results, on property cards and on the property page. Properties get the badge by " +
            "paying Booking.com a higher commission; it isn't a quality rating.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(sabaJsonFilterPatch)

    execute {
        // Search results are a server-driven page: a label is added after the badge icon in its
        // JSON, and the meaning to the card's screen reader text.
        enableSabaJsonFilter("labelPreferred")

        // The badges on the property page (by the property's name) and on the app's own property
        // cards (the map): Booking's outlined badge with the label is drawn right after the icon,
        // with the same composer, so it sits next to the icon in the row of badges.
        listOf("PreferredBadge" to "preferredBadge", "PreferredPlusBadge" to "preferredPlusBadge")
            .forEach { (badge, extension) ->
                val method = methodOf(PROPERTY_TITLE, badge)
                val (index, composer) = method.badgeIconCall()
                method.addInstruction(
                    index + 1,
                    "invoke-static { v$composer }, $EXTENSION_CLASS->$extension(Ljava/lang/Object;)V"
                )
            }
        methodOf(PROPERTY_CARD, "PreferredBadge").let { method ->
            val (index, composer) = method.badgeIconCall()
            // p0 is the card's Property.PreferredType.
            method.addInstruction(
                index + 1,
                "invoke-static { v$composer, p0 }, $EXTENSION_CLASS->cardBadge(Ljava/lang/Object;Ljava/lang/Object;)V"
            )
        }
    }
}
