package app.template.patches.fotmob.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// The app-message model of the "rate FotMob" prompt keeps its name.
internal const val RATING_APP_MESSAGE = "Lcom/fotmob/android/feature/appmessage/model/RatingAppMessage;"

// The suspend method that decides whether to show the rating prompt (239: u20.a(Continuation)Object).
// It is the only method that constructs a RatingAppMessage; its caller treats a null result as
// "no message". The continuation parameter is R8-renamed, so only its object shape is pinned.
internal object RatingAppMessageFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(
            definingClass = RATING_APP_MESSAGE,
            name = "<init>",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "V",
        ),
    ),
)
