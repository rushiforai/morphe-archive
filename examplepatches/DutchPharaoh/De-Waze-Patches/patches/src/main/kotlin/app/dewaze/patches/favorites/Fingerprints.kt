package app.dewaze.patches.favorites

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

/**
 * Constructor of the main map controller (com.waze.map.b.ay in 5.27.4.900).
 * Shared by the phone map and the Android Auto map.
 */
internal object MainMapControllerConstructorFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("filteredEventsFactory", "primaryMapConfiguration"),
)

/**
 * Main map content resolver (com.waze.map.b.c.a in 5.27.4.900): turns MainMapContent into the
 * MapContentRequest that is drawn. Waze adds its own selection marker and closure preview here.
 */
internal object MainMapContentResolverFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        fieldAccess(name = "ROAD_CLOSED"),
        methodCall(
            definingClass = "Lcom/waze/jni/protos/map/EventsOnRoute\$Builder;",
            name = "setIsSelected",
        ),
    ),
)
