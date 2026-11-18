package id.ikuradachi.patches.crunchyroll.player.quality

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal const val QUALITY_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/QualityHelper;"
internal const val DOWNLOAD_QUALITY_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/DownloadQualityHelper;"
internal const val MANUAL_QUALITY_DATA_CLASS =
    "Lid/ikuradachi/extension/crunchyroll/quality/ManualQualityData;"
internal const val MANUAL_QUALITY_BRIDGE_CLASS =
    "Lid/ikuradachi/extension/crunchyroll/quality/ManualQualityBridge;"

object HighestVideoQualityToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("HighestVideoQuality")),
)

object HeightVideoQualityToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("HeightVideoQuality(width=")),
)

object AdStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("AdState(isActive="),
        opcode(Opcode.IGET_BOOLEAN),
    ),
)

object FormatToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("Format("),
        opcode(Opcode.IGET),
        string(", ["),
        opcode(Opcode.IGET),
        opcode(Opcode.IGET),
    ),
)

object HighestVideoQualityDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("HighestVideoQualityData")),
)

object ModerateVideoQualityDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("ModerateVideoQualityData")),
)

object DataSaverVideoQualityDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("DataSaverVideoQualityData")),
)

object QualityTrackSelectorConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L", "Z"),
    filters = listOf(
        string("playerState"),
        string("settingsValuesState"),
    ),
)

fun createQualitySnapFingerprint(
    qualitySelectorType: String,
    videoQualityBaseType: String,
) = Fingerprint(
    returnType = videoQualityBaseType,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(videoQualityBaseType),
    custom = { _, classDef -> classDef.type == qualitySelectorType },
)

fun createQualityApplyFingerprint(qualitySelectorType: String) = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("\$this\$set"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("I", "I"),
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = emptyList(),
            location = InstructionLocation.MatchAfterWithin(3),
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            returnType = "V",
            parameters = listOf("L"),
            location = InstructionLocation.MatchAfterWithin(4),
        ),
    ),
    custom = { _, classDef -> classDef.type == qualitySelectorType },
)

fun createOnTracksChangedFingerprint(highestQualityType: String) = Fingerprint(
    name = "onTracksChanged",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        string("tracks"),
        opcode(Opcode.NEW_ARRAY),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = highestQualityType),
    ),
)

fun createQualitiesCurrentMapperFingerprint(
    videoQualityBaseType: String,
    highestDataType: String,
    moderateDataType: String,
    dataSaverDataType: String,
) = Fingerprint(
    name = "emit",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "L"),
    filters = listOf(
        checkCast(videoQualityBaseType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = moderateDataType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = dataSaverDataType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = highestDataType),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.none { instr ->
            instr.opcode == Opcode.CHECK_CAST &&
                (instr as? ReferenceInstruction)?.reference?.toString() == "Ljava/util/List;"
        } == true
    },
)

fun createQualitiesListMapperFingerprint(
    videoQualityBaseType: String,
    highestDataType: String,
    moderateDataType: String,
    dataSaverDataType: String,
) = Fingerprint(
    name = "emit",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;", "L"),
    filters = listOf(
        checkCast("Ljava/util/List;"),
        checkCast(videoQualityBaseType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = moderateDataType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = dataSaverDataType),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = highestDataType),
    ),
)

object CustomRadioGroupBindOptionsFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/util/List;", "Ljava/lang/Integer;"),
    filters = listOf(
        string("options"),
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getString",
            parameters = listOf("I"),
        ),
    ),
    custom = { _, classDef -> classDef.superclass == "Landroid/widget/RadioGroup;" },
)

fun createUpdateQualitySummaryFingerprint(
    preferredQualityDataBaseType: String,
    titleFieldName: String,
) = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(preferredQualityDataBaseType),
    filters = listOf(
        string("videoQuality"),
        checkCast("Lcom/ellation/crunchyroll/settings/SelectableTitlePreference;"),
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = preferredQualityDataBaseType,
            name = titleFieldName,
            type = "I",
        ),
        methodCall(name = "getString", parameters = listOf("I")),
    ),
)

fun createComposeQualityItemFingerprint(
    preferredQualityDataBaseType: String,
    titleFieldName: String,
) = Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
    ),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = preferredQualityDataBaseType,
            name = titleFieldName,
            type = "I",
        ),
        methodCall(
            returnType = "Ljava/lang/String;",
            parameters = listOf("L", "I"),
            location = InstructionLocation.MatchAfterWithin(2),
        ),
    ),
)

fun createComposeQualitySummaryFingerprint(
    preferredQualityDataBaseType: String,
    titleFieldName: String,
) = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = preferredQualityDataBaseType),
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = preferredQualityDataBaseType,
            name = titleFieldName,
            type = "I",
            location = InstructionLocation.MatchAfterWithin(3),
        ),
        methodCall(
            returnType = "Ljava/lang/String;",
            parameters = listOf("L", "I"),
            location = InstructionLocation.MatchAfterWithin(2),
        ),
    ),
)

object DownloadQualityPropertyCtorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(string("preferredSyncQuality")),
)

fun createDownloadQualityPropertyHighClinitFingerprint(downloadQualityPropType: String) = Fingerprint(
    name = "<clinit>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    filters = listOf(
        string("high"),
        methodCall(
            opcode = Opcode.INVOKE_DIRECT,
            definingClass = downloadQualityPropType,
            name = "<init>",
            parameters = listOf("Ljava/lang/String;"),
        ),
    ),
    custom = { _, classDef -> classDef.superclass == downloadQualityPropType },
)

fun createSyncQualityHighOptionClinitFingerprint(highPropType: String) = Fingerprint(
    name = "<clinit>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = highPropType, type = highPropType),
        literal(1280),
        literal(720),
        opcode(Opcode.INVOKE_DIRECT_RANGE),
    ),
)

object SyncQualityStoreConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Landroid/content/Context;", "L", "L"),
    filters = listOf(
        string("context"),
        string("sync_quality_store"),
    ),
)

fun createSyncQualityStoreReadFingerprint(
    storeClassType: String,
    syncQualityInterfaceType: String,
) = Fingerprint(
    returnType = syncQualityInterfaceType,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(string("sync_quality_value_")),
    custom = { _, classDef -> classDef.type == storeClassType },
)

fun createDownloadHelperBuilderFingerprint(
    syncQualityStoreType: String,
    readSyncQualityMethodName: String,
) = Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/ellation/crunchyroll/api/cms/model/streams/Stream;",
            name = "getUrl",
            returnType = "Ljava/lang/String;",
        ),
        methodCall(definingClass = syncQualityStoreType, name = readSyncQualityMethodName),
        methodCall(definingClass = syncQualityStoreType, name = readSyncQualityMethodName),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("I", "I"),
            location = InstructionLocation.MatchAfterWithin(5),
        ),
        methodCall(definingClass = syncQualityStoreType, name = readSyncQualityMethodName),
        methodCall(definingClass = syncQualityStoreType, name = readSyncQualityMethodName),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf("I", "I"),
            location = InstructionLocation.MatchAfterWithin(5),
        ),
        string("internalContext"),
    ),
)

object DownloadHelperOnPreparedFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        string("getMappedTrackInfo(...)"),
        string("getTrackGroups(...)"),
        string("customCacheKey must be null for type: %s"),
    ),
)
