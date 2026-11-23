package app.jofslash.patches.booking.urgency

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.fieldGettersOf
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val HOTEL = "Lcom/booking/common/data/Hotel;"
private const val BASE_HOTEL_BLOCK = "Lcom/booking/common/data/BaseHotelBlock;"
private const val BLOCK = "Lcom/booking/common/data/Block;"
private const val ROOM = "Lcom/booking/common/data/Room;"
private const val ONLY_X_LEFT = "Lcom/booking/accommodation/roomselection/services/model/api/OnlyXLeft;"
private const val WISHLIST_HOTEL = "Lcom/booking/wishlist/domain/model/accommodation/Hotel;"
private const val JACKPOT = "Lcom/booking/roomselectionservices/util/RoomListCopyUtilityKt;"
private const val PROPERTY_CARD = "Lcom/booking/propertycard/ui/PropertyCardKt;"
private const val WISHLIST_CARD =
    "Lcom/booking/wishlist/ui/composable/cards/accommodation/WishlistPropertyCardContentComposableKt;"

@Suppress("unused")
val hideUrgencyMessagesPatch = bytecodePatch(
    name = "Hide urgency messages",
    description = "Hides messages that push you to book quickly, such as \"We have 2 left at this price\", " +
            "\"Only 1 room left\", \"Rare find\" and \"Last booked 2 hours ago\". Useful facts, such as free " +
            "cancellation or sold out, stay.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(sabaJsonFilterPatch)

    execute {
        // Search results are a server-driven page: the red "We have 3 left at this price" line of
        // each card (a red bui.Label or bui.ComposedLabel, with its red dot) is taken out of its JSON,
        // and out of the card's screen reader text.
        enableSabaJsonFilter("hideUrgency")

        // Property data the app gets from Booking. Each getter (by the field it reads) answers
        // "no message".
        listOf(
            // "Only 2 left at this price on our site" ("urgency_message") on property and map cards.
            HOTEL to "urgencyMessage",
            // "Last booked 2 hours ago" under sold out properties.
            HOTEL to "last_reservation_text",
            // "Rare find: this place is usually fully booked" on the property page.
            BASE_HOTEL_BLOCK to "rareFindStatus",
            // Urgency line on wishlist property cards.
            WISHLIST_HOTEL to "urgencyMessage",
            // "Only 1 left" ("only_x_left_message") on room and rate rows.
            BLOCK to "onlyXLeftMessage",
            ROOM to "onlyXLeftMessage",
        ).forEach { (classType, field) ->
            fieldGettersOf(classType, field).forEach { it.returnEarly() }
        }

        // "Our last room!" style copy shown after picking a room.
        methodOf(JACKPOT, "getJackPotMessage").returnEarly()

        // The "only x left" copies per room for the room list and the selected room.
        listOf("getRoomListCopies", "getPostSelectCopies").forEach { name ->
            methodOf(ONLY_X_LEFT, name).addInstructions(
                0,
                """
                    invoke-static { }, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
                    move-result-object v0
                    return-object v0
                """
            )
        }

        // The composables that draw the messages, in case a message still reaches them another way.
        // They emit nothing when they return before touching the composer.
        methodOf(PROPERTY_CARD, "UrgencyMessage").returnEarly()
        methodOf(PROPERTY_CARD, "LastReservationMessage").returnEarly()
        methodOf(WISHLIST_CARD, "WishlistPropertyCardUrgencyMessageComposable").returnEarly()
    }
}
