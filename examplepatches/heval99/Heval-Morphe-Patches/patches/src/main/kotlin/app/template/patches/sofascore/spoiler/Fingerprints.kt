package app.template.patches.sofascore.spoiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Sofascore's push receiver: FCMListenerService keeps its name (it is a manifest service) and the
// method is the FirebaseMessagingService override, so both names are stable. It parses the data
// key "notification" (JSON) and posts the notification, the widget refresh and the TTS readout.
internal object FcmMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/firebase/push/FCMListenerService;",
    name = "onMessageReceived",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/messaging/RemoteMessage;"),
)

// The Compose match row model (26.11.09: ji7): toString is generated from the data class, so its
// constant starts with the class's source name. Its only constructor is the hook site; the model's
// field types (RowText, EventTeamLine) are read from that constructor, never named here.
internal object EventRowModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("EventRowModel(eventId=", StringComparisonType.STARTS_WITH)),
)

// The match page header's base class (26.11.09: gr1, a FrameLayout with one subclass per sport
// family): its Kotlin property setter setResultView keeps its name, and the class declares the
// abstract setEvent(Event) every header implements. The result view holds the score.
internal object MatchHeaderResultViewSetterFingerprint : Fingerprint(
    name = "setResultView",
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;"),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/widget/FrameLayout;" && classDef.methods.any {
            it.name == "setEvent" && it.returnType == "V" && AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/sofascore/model/mvvm/model/Event;")
        } && classDef.methods.any { it.name == "getResultView" && it.returnType == "Landroid/view/ViewGroup;" && it.parameterTypes.isEmpty() }
    },
)

// The Details tab's period points graph (26.11.09: szo.l(Event, List)V): it groups the kept
// EventGraphPoint model by period and reads each period's score by name. Model calls only.
internal object PeriodPointsGraphFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/sofascore/model/mvvm/model/Event;", "Ljava/util/List;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/sofascore/model/newNetwork/EventGraphPoint;", name = "getPeriod"),
        methodCall(name = "getScoreByPeriodName"),
        methodCall(definingClass = "Lcom/sofascore/model/newNetwork/EventGraphPoint;", name = "getSequence"),
    ),
)

// The mapper that builds EventRowModel from an Event (26.11.09: mi7.m(IILjava/lang/Object;)Object).
// Its shape plus three kept model calls make it unique; the only other EventRowModel constructor
// caller copies a finished row and has a different shape.
internal object EventRowModelMapperFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("I", "I", "Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/sofascore/model/mvvm/model/Event;", name = "getHomeTeamSeed\$default"),
        methodCall(definingClass = "Lcom/sofascore/model/mvvm/model/Event;", name = "getStreamContentGeoRestrictions"),
        methodCall(definingClass = "Lcom/sofascore/model/mvvm/model/FootballEvent;", name = "isVarInProgress\$default"),
    ),
)
