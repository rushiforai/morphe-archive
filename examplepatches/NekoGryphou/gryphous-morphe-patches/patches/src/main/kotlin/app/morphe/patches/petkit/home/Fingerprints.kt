package app.morphe.patches.petkit.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Both cached and refreshed home cards reach this method before either card
 * layout is updated. HOME_CARD_VIRTUAL_AREA is the card whose layout contains
 * @string/Explore ("Explorer" in French) and the virtual device grid in 13.10.1.
 */
internal object HomeCardListFingerprint : Fingerprint(
    definingClass = "Lcom/petkit/android/activities/home/HomePageFragment;",
    name = "refreshCardList",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(smali = "Ljava/util/List;->size()I"),
        methodCall(
            smali = "Lcom/petkit/android/activities/home/adapter/model/NewHomeCardData;->getType()Ljava/lang/String;",
        ),
        string("HOME_CARD_VIRTUAL_AREA"),
    ),
)
