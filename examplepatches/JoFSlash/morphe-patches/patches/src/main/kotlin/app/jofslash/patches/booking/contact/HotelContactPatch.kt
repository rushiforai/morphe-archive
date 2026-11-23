package app.jofslash.patches.booking.contact

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.callFromPropertyPageConstructor
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/booking/HotelContact;"

/** Turns the property page's data (PropertyPageInfoQuery) into the app's PropertyInfoQueryResult. */
private const val PROPERTY_INFO_RESULT = "Lcom/booking/hotelinfo/data/PropertyInfoQueryResultKt;"
private const val PROPERTY_DETAILS = "Lcom/booking/apollo/generated/PropertyPageInfoQuery\$PropertyDetails;"

@Suppress("unused")
val hotelContactPatch = bytecodePatch(
    name = "Hotel contact",
    description = "Adds a Contact button to the property page with the property's address, Open in " +
            "Maps and Copy address, and the phone number and email the property gives Booking.com " +
            "for EU consumer law (shown when Booking.com sends them).",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        callFromPropertyPageConstructor("$EXTENSION_CLASS->onPropertyPage(Landroid/app/Activity;)V")

        // The trader details (legal information) come with the property page's data; the
        // extension keeps them for the Contact tab.
        val toDto = methodOf(PROPERTY_INFO_RESULT, "toDto", listOf(PROPERTY_DETAILS))
        val instructions = toDto.implementation!!.instructions.toList()
        instructions.indices.reversed().filter { instructions[it].opcode == Opcode.RETURN_OBJECT }.forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            toDto.addInstruction(index, "invoke-static { v$register }, $EXTENSION_CLASS->onPropertyInfo(Ljava/lang/Object;)V")
        }
    }
}
