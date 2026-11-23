package app.jofslash.patches.booking.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

internal const val PRICE_RECORDER = "Lapp/jofslash/extension/booking/PriceRecorder;"
private const val HOTEL = "Lcom/booking/common/data/Hotel;"

// Called when the property page has loaded the hotel again, for example for new dates.
internal object OnHotelUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/booking/property/facet/PropertyPageViewModelImpl;",
    name = "onHotelUpdate",
    returnType = "V",
    parameters = listOf(HOTEL, "Lcom/booking/hotelinfo/data/propertyinfo/HotelPageTracking\$Reason;"),
)

// Turns a hotel into a property card on the search results map, once per card.
internal object PropertyCardToDataFingerprint : Fingerprint(
    definingClass = "Lcom/booking/propertycard/model/PropertyCardMappersKt;",
    name = "toData",
    parameters = listOf(HOTEL, "Lcom/booking/propertycard/model/AccommodationSearchConfig;"),
)

/**
 * Saves the hotel prices the app shows (property page and search map cards) in the price database
 * on the phone, for Check crossed-out prices.
 */
internal val priceRecordingPatch = bytecodePatch {
    extendWith("extensions/booking.mpe")

    execute {
        callFromPropertyPageConstructor("$PRICE_RECORDER->onPropertyPageRecord(Landroid/app/Activity;)V")

        OnHotelUpdateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $PRICE_RECORDER->onHotelUpdate(Ljava/lang/Object;)V"
        )
        PropertyCardToDataFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $PRICE_RECORDER->onSearchCard(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
    }
}
