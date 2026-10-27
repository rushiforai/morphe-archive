package app.template.patches.onefootball.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val COMPONENT_MODEL = "Lcom/onefootball/experience/core/model/ComponentModel;"
private const val ADS_PROTO = "Lcom/onefootball/experience/component/ads/generated/Ads\$"

// The feed's ad slots are server-driven "experience" components. Each component's protobuf
// properties go to a ComponentParser.parse(identifier, position, parent, properties) that returns
// the item model; ComponentParserRegistry drops the component when the parser returns null. The
// two ad parsers are pinned by shape plus the generated protobuf class they decode (its
// parseFrom parameter type belongs to the obfuscated protobuf runtime, so it is not pinned).
private val PARSE_PARAMETERS = listOf(
    "Ljava/lang/String;",
    "I",
    COMPONENT_MODEL,
    "Lcom/google/protobuf/Any;",
)

// The "ad" component: drawn as the "Ad Break" skeleton card until a GMA load fills it.
object AdComponentParseFingerprint : Fingerprint(
    returnType = COMPONENT_MODEL,
    parameters = PARSE_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = "${ADS_PROTO}AdComponentProperties;", name = "parseFrom"),
    ),
)

// The placeholder variant of the ad component, parsed the same way.
object PlaceholderAdComponentParseFingerprint : Fingerprint(
    returnType = COMPONENT_MODEL,
    parameters = PARSE_PARAMETERS,
    filters = listOf(
        methodCall(definingClass = "${ADS_PROTO}PlaceholderAdComponentProperties;", name = "parseFrom"),
    ),
)

private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"

// The Flutter feeds ask the native side for each ad slot over the method channel: getAdData
// (GAM) and getOMPAdData (OMP). Each call has one handler, handle(MethodCall, Result)V, that
// compares call.method with its name; the string is unique in the dex.
object GetAdDataHandleFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(METHOD_CALL, RESULT),
    strings = listOf(string("getAdData", StringComparisonType.CONTAINS)),
)

object GetOmpAdDataHandleFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(METHOD_CALL, RESULT),
    strings = listOf(string("getOMPAdData", StringComparisonType.CONTAINS)),
)
