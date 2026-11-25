package patches.waze

import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import java.security.MessageDigest

internal data class WazeWarningContract(val registers: Int, val count: Int, val flags: Int, val hash: String)

internal const val WAZE_SEGMENT_ROOT = "Lcom/waze/insights_infra/InsightsInfraNativeManager;->c(Lcom/waze/jni/protos/insights_infra/SegmentInsightUpdate;)V"
/** Exactly Average speed zone bar's existing single entry observer, when that patch runs first. */
internal const val WAZE_SEGMENT_ZONE_BAR_HASH = "ccb4455b0197dc4213b0f776e50ffdc686dee2c5ed7c9ba94be89f5d70e282f3"

internal val wazeWarningClassAbi = setOf("Lcom/waze/alerters/b/i;", "Lcom/waze/alerters/b/a;", "Lcom/waze/alerters/b/b;", "Lcom/waze/alerters/a/i;")

/** Abstract selector ABI has no body to hash; its declared descriptors/flags remain exact. */
internal fun validateWazeWarningClassAbi(classes: Map<String, ClassDef>) {
    check(classes.keys == wazeWarningClassAbi) { "Missing Waze warning selector ABI" }
    val state = classes.getValue("Lcom/waze/alerters/b/i;").fields.single { it.name == "b" }
    check(state.type == "Lcom/waze/alerters/a/ab;" && state.accessFlags == 18) { "Changed Waze native zone state field" }
    val queue = classes.getValue("Lcom/waze/alerters/a/i;")
    val remove = queue.methods.single { it.name == "b" }
    check(queue.accessFlags == 1537 && remove.toString() == "Lcom/waze/alerters/a/i;->b(Lcom/waze/j;)V" && remove.accessFlags == 1025 && remove.implementation == null) { "Changed Waze zone queue ABI" }
    val append = queue.methods.single { it.name == "c" }
    check(append.toString() == "Lcom/waze/alerters/a/i;->c(Lcom/waze/alerters/a/c;)Z" && append.accessFlags == 1025 && append.implementation == null) { "Changed Waze zone queue insertion ABI" }
    mapOf("Lcom/waze/alerters/b/a;" to "Lcom/waze/alerters/b/b;",
        "Lcom/waze/alerters/b/b;" to "Lkotlinx/coroutines/b/cc;").forEach { (owner, result) ->
        val cls = classes.getValue(owner)
        val method = cls.methods.single { it.name == "a" }
        check(cls.accessFlags == 1537 && method.toString() == "$owner->a()$result" &&
            method.accessFlags == 1025 && method.implementation == null) { "Changed Waze native selector ABI $owner" }
    }
}

/** Waze 5.26.90.901 supplied original base SHA-256 b1504af4bcbe50325195774a891f50f7189cdef7ad38ee67a2f5b7af00f29e4d.
 * Waze 5.27.0.1 original base SHA-256 0a66289f3db3ad575ef76ea2bac88724ed49ec8afa6f2147955d93e992750397
 * matches this complete guarded method set and selector ABI without changing any fingerprints.
 * Pin native decision roots, transitive zone callbacks, public adapter getters and raw enum mappings.
 * Every original body is validated before any broadcast or warning mutation. */
internal val wazeWarningContracts = mapOf(
    "Lcom/waze/AlerterController\$Alerter\$Subtype;-><clinit>()V" to WazeWarningContract(16, 647, 65544, "ba7f75bef887879b44eb93921e6e9995ab092999a44a60f8507406a8fb1539f7"),
    "Lcom/waze/AlerterController\$Alerter\$Subtype;->getOfType()Lcom/waze/AlerterController\$Alerter\$Type;" to WazeWarningContract(1, 2, 17, "aa6b4c9087fb50bbb5d5bce2ad1324cee69b6e50cf3ec39a212e5d10602411a8"),
    "Lcom/waze/AlerterController\$Alerter\$Subtype;->getValueInAlerter()I" to WazeWarningContract(1, 2, 17, "8ea575337bf10bd5ad185d7d932f55903e2600ef8aa6e6a440de6670603cc9f0"),
    "Lcom/waze/AlerterController\$Alerter\$Subtype;->values()[Lcom/waze/AlerterController\$Alerter\$Subtype;" to WazeWarningContract(1, 5, 9, "7339012049d62525783900e84ab621db436970b8a45b53de347c75486f2c188a"),
    "Lcom/waze/AlerterController\$Alerter\$SubtypeTrait;-><clinit>()V" to WazeWarningContract(5, 35, 65544, "df7781a92546941cc844187e0bfc27a9722090ca97463365c534e7f676dfcb77"),
    "Lcom/waze/AlerterController\$Alerter\$SubtypeTrait;->getValueForStats()J" to WazeWarningContract(3, 2, 17, "852c5c1cbfce0f5d7643523c52fcac4d66b0b964bf77139842a4ad1d2d96f703"),
    "Lcom/waze/AlerterController\$Alerter\$SubtypeTrait;->values()[Lcom/waze/AlerterController\$Alerter\$SubtypeTrait;" to WazeWarningContract(1, 5, 9, "571fc88042fb87df808dbc4116fe5aad6aeab6b769fc4b48093919dc2747b2ec"),
    "Lcom/waze/AlerterController\$Alerter\$Type;-><clinit>()V" to WazeWarningContract(5, 194, 65544, "955f9050bf90650e93e21187391854fddabbcef4fdbb850c39f60b7910e9abeb"),
    "Lcom/waze/AlerterController\$Alerter\$Type;->getValueForStats()J" to WazeWarningContract(3, 2, 17, "22c6e02983335d3d4ac3ddffd287e77334b52b41d0a75d8c26066ebf518d0b9a"),
    "Lcom/waze/AlerterController\$Alerter\$Type;->values()[Lcom/waze/AlerterController\$Alerter\$Type;" to WazeWarningContract(1, 5, 9, "5d0bd7d77d6107294b9af66b2ede5a16f5c32d1cea3159622c7a3437fd1f2175"),
    "Lcom/waze/alerters/AlerterNativeManager;->b(Lcom/waze/jni/protos/alerters/NativeAlertRepositoryUpdate;)V" to WazeWarningContract(3, 5, 17, "1849b5c2d741eab32397c82f6db8285f92918c4bbde1b30aa84adf62457f91e3"),
    "Lcom/waze/alerters/AlerterNativeManagerBase;->h(Lcom/waze/jni/protos/alerters/AlerterId;)V" to WazeWarningContract(5, 9, 17, "464d3e39678eaf382e22742bed99a2ffe1142b47eca9a91c6d26686312533e9b"),
    "Lcom/waze/alerters/AlerterNativeManagerBase;->i()V" to WazeWarningContract(3, 7, 17, "178421c88911e7cf64e10d6d377687d6d96f86d44d55745ea9565d5fc79c3f26"),
    "Lcom/waze/alerters/a/ab;-><clinit>()V" to WazeWarningContract(4, 24, 65544, "8c60c4c2a10c66ad5b622ed817e692425a2614862d17795e40de1c5f1f53c4b4"),
    "Lcom/waze/alerters/a/m;->f(Lcom/waze/j;)V" to WazeWarningContract(3, 9, 17, "d66bd53f13381f9ae7d39bec28204e6305032aabb4f47d3047900e818db4690c"),
    "Lcom/waze/alerters/a/m;->g()V" to WazeWarningContract(1, 4, 17, "878557add0e204867661b72031e94eb2865cb717d91c2a14a0edb5185a39139a"),
    "Lcom/waze/alerters/b/i;->a()Lcom/waze/j;" to WazeWarningContract(1, 2, 17, "5c519d98fdd84ea2d4e9bb257ddc830ae9357edbb9ac3a71725e9e65e7cbf1dc"),
    "Lcom/waze/alerters/b/i;->k()V" to WazeWarningContract(3, 21, 17, "c37190ff57b56d03c8473de178f8462ce59dd4e6e012e936981bde230a2b6b43"),
    "Lcom/waze/insights_infra/InsightsInfraNativeManager;->a()Lkotlinx/coroutines/b/bm;" to WazeWarningContract(1, 2, 17, "9e6b05aa204cc29be9c4da415ba7fafc444931241e67b1c8e9ab6d936587601b"),
    "Lcom/waze/insights_infra/NotificationInsightsNativeManager;->a(Lcom/waze/jni/protos/insights_infra/Notification;)V" to WazeWarningContract(4, 8, 17, "6737f765dbdc07a50733d5b7af0dbd50e2d4f6159c296318e1c000f4cdc179c3"),
    "Lcom/waze/insights_infra/NotificationInsightsNativeManager;->b(Lcom/waze/jni/protos/insights_infra/NotificationId;)V" to WazeWarningContract(3, 5, 17, "2093ab4b882860618af87e91fbd27f18d237264f21e4d97fad361886590d003e"),
    "Lcom/waze/j;->a()Ljava/lang/String;" to WazeWarningContract(1, 2, 17, "3724d44d7f2493886826e6db2c177db94cd58ce8e6834b280a81299043c9cc1d"),
    "Lcom/waze/j;->b()Ljava/lang/String;" to WazeWarningContract(1, 2, 17, "137556fa8439b9a166016dace2d438ac528d1f3975ff47fe42371c48848031e4"),
    "Lcom/waze/j;->c()Ljava/lang/String;" to WazeWarningContract(1, 2, 17, "f2035716ed99bf9152e5ab728fdc8021860c26a238d64bcc5fa2c3a3d142310f"),
    "Lcom/waze/jni/protos/InsightPriority;->getPreemptive()Z" to WazeWarningContract(1, 2, 1, "cc01b4f66bafe4902db7393c328571b603642f742a4cf779af36ff173d344bdd"),
    "Lcom/waze/jni/protos/InsightPriority;->getValue()I" to WazeWarningContract(1, 2, 1, "02765581fc834df33d01ec9450bb2ce68594e1dde57771fa050d2dbf4e26c2d1"),
    "Lcom/waze/jni/protos/Position\$IntPosition;->getLatitude()I" to WazeWarningContract(1, 2, 1, "ab05497d5f5b72ed9120101fbe900dd0a05a52aadc2416503be4ee95d3ff9e4a"),
    "Lcom/waze/jni/protos/Position\$IntPosition;->getLongitude()I" to WazeWarningContract(1, 2, 1, "7d7f2864bd5b5fbf53e27b990bb351e74e11f5f4ecee4257b8fac774bbda95b3"),
    "Lcom/waze/jni/protos/alerters/AlertValidationResult;->getDistanceMeters()I" to WazeWarningContract(1, 2, 1, "8436477723a30fde7f14c1e02bb90233ccc4a5a028165bccead1f8d69022a5b5"),
    "Lcom/waze/jni/protos/alerters/AlertValidationResult;->getIsValid()Z" to WazeWarningContract(1, 2, 1, "d017cb829d0283cd46e90597bc181f7718739f8013151de3a4b774973611e285"),
    "Lcom/waze/jni/protos/alerters/AlertValidationResult;->getTimeToAlertSec()I" to WazeWarningContract(1, 2, 1, "b90710b298af099c6135ba91839cd59f2e7614bd73fbc3265fa6520adfd1d2e2"),
    "Lcom/waze/jni/protos/alerters/AlertValidationResult;->hasDistanceMeters()Z" to WazeWarningContract(2, 6, 1, "5977fa5a78fda30a446c52efd03f7ee117632de2ad4a5fe488ec5c0285b1dfab"),
    "Lcom/waze/jni/protos/alerters/AlertValidationResult;->hasTimeToAlertSec()Z" to WazeWarningContract(1, 7, 1, "1e3458db927820f97783a4854c3ff728c894ed32c8c8f7d5954c7fa666047eef"),
    "Lcom/waze/jni/protos/alerters/AlerterId;->getProviderId()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "12f38b481afbd0a3230c3c0fe33560ee8013530a6ed048fa230840243574e93f"),
    "Lcom/waze/jni/protos/alerters/AlerterId;->getUniqueId()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "55e5092659daeaaf8beaf176f403c8fd5b70749f5c993d7c211df55cf890c5c4"),
    "Lcom/waze/jni/protos/alerters/AlerterId;->getUuid()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "beec238a746a83718650b37cf695092292928cc0e140451332c4b2c9ded726c7"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getCloseDistanceSameAlertsCappingEnabled()Z" to WazeWarningContract(1, 2, 1, "c701a55f33a80ad38bc0463350df4d787d67d9cf39816dca8ed033fec579d5ad"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getDescription()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "c1c23109b74395dff8bceeb5186ba851f695723cef45af11976121f9b75fb42e"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getDistanceString()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "eafaded9900e0153a2bef4e2418196b6917bce2c3aecccdd3cb8752bd334bc37"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getIsApproachingWithValidation()Z" to WazeWarningContract(1, 2, 1, "9e8cd185cdc4602eb581ef620bb2be43e53c297827986283c52b208a6756d441"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getPosition()Lcom/waze/jni/protos/Position\$IntPosition;" to WazeWarningContract(1, 5, 1, "fce2b5e5d56c30af2bc76c6b8d216bbb82b55e711da60bc178a56987cea0c64b"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getRequireDistanceInRange()Z" to WazeWarningContract(1, 2, 1, "7fa35acaece6c5b3605bcd05477f01e6e7a298572e72656005e0a317dec94ebc"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getSilentActivation()Lcom/waze/jni/protos/alerters/SilentActivation;" to WazeWarningContract(1, 6, 1, "2ff505584b73ab61ec4df78eaab400bc3d20bff83c955f6ca21695bf7b27b7ac"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getSubType()I" to WazeWarningContract(1, 2, 1, "936b117b8a788eff7f08ea1408c0b8702e1d6665cfd9364520c718daf9164d6c"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getSubtypeTrait()J" to WazeWarningContract(3, 2, 1, "0209e040fc92f6d1a3153e65dd1a22356bc324363be14cf5524f339f162df0d6"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getTitle()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "0a38009d592b72e42eca24aab100f620399f24d635f52a19068ba75b57ad1bdd"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getTitleWithDistance()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "72ad266041ac527faecaa509556bf1f649c0d597a38e52e82f444d2a20235bb1"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getType()Lcom/waze/jni/protos/alerters/AlerterType;" to WazeWarningContract(1, 6, 1, "bc953f0c877beced5c3f096c8c629ca710a43196fa454a103839dc85b022176d"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getTypeValue()I" to WazeWarningContract(1, 2, 1, "7bb4d3eb8f9764ae9bb2a096c51c05592000b0c30ce91dc58edd70d1b83f1dfd"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->getValidationResult()Lcom/waze/jni/protos/alerters/AlertValidationResult;" to WazeWarningContract(1, 5, 1, "5e16b5fe264ad2b5880086f9840785962c125a304283d9375d1e0d1f6bd213bf"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->hasPosition()Z" to WazeWarningContract(2, 8, 1, "2773dae8595222ca21e2c0501b51286d600e9a28c0b5597ab484e9b0fb2df1e7"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->hasSilentActivation()Z" to WazeWarningContract(2, 8, 1, "8550cbb92a87bd53e6c2af4ee879d16f68652c94af1a3ff2af5f60b1e7388627"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->hasSubType()Z" to WazeWarningContract(2, 8, 1, "e65729c6fd9816979d3027d029ce049c5164137155e36aa092da05deb7e736d6"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->hasSubtypeTrait()Z" to WazeWarningContract(2, 8, 1, "6c2abda9fde973584e5272ea4b6bb669622ffcec34727a747b9bd4a5cf6ac988"),
    "Lcom/waze/jni/protos/alerters/AlerterInfo;->hasValidationResult()Z" to WazeWarningContract(2, 8, 1, "b24566bea03300a34c6106b41226698ba7a90c0f49ffbae6e6f64bf81840360d"),
    "Lcom/waze/jni/protos/alerters/AlerterType;-><clinit>()V" to WazeWarningContract(6, 140, 65544, "f106145b0ec30f53b9c7ec731537ed56ec8003685509d65dd79d8e54b6be90f9"),
    "Lcom/waze/jni/protos/alerters/AlerterType;->getNumber()I" to WazeWarningContract(2, 7, 17, "d66c0686133225e7350e07e805801ec32c22882de60422fa22f0641f06e5a6e1"),
    "Lcom/waze/jni/protos/alerters/AlerterType;->values()[Lcom/waze/jni/protos/alerters/AlerterType;" to WazeWarningContract(1, 5, 9, "9248829960350a1d6f3a95c917a5d68de2b106a041a72c38af349a75cdcac4db"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getAbortImmediatelyOnRemoval()Z" to WazeWarningContract(1, 2, 1, "3bc57f582281f7e1fda7169ef81cf0901aa80fbaa38404acc02c6a8e102e2494"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getAlertId()Lcom/waze/jni/protos/alerters/AlerterId;" to WazeWarningContract(1, 5, 1, "c0eef54c2abe9e884cd5053be524c6b76da0d41b95af2562556399f078540b52"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getInfo()Lcom/waze/jni/protos/alerters/AlerterInfo;" to WazeWarningContract(1, 5, 1, "c9b2ecd830087bc8afe6bcd263fe05ea4ff8030cdadfbe05896c9fd478db280d"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getInsightPriority()Lcom/waze/jni/protos/InsightPriority;" to WazeWarningContract(1, 5, 1, "b25edcea51e6e881c500ddb98f2a6eb7e0e6d16883b340c806d83fcf6941ea34"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getTriggerDistanceMeters()I" to WazeWarningContract(1, 2, 1, "4627ff79196741ee6675401217a3fc244dfe39dcab6a255712c81f0768da4a52"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->getZoneAlertData()Lcom/waze/jni/protos/alerters/ZoneAlertData;" to WazeWarningContract(1, 5, 1, "810db4beb376a3b2f8884bfd8a1908896f9adefc39338797a81b20b4958eb6f9"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->hasAlertId()Z" to WazeWarningContract(2, 6, 1, "8dfd270d4e9cac1d943f619a0f567b2450eda6266969ca240502ed6d8296f65e"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->hasInfo()Z" to WazeWarningContract(1, 7, 1, "c7a71453c360418e3435a961a764f17ac6152ee62e21c96ceee74ea559453f86"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->hasInsightPriority()Z" to WazeWarningContract(1, 7, 1, "f05116ad828d319855cf5de3cd166e4d6de4fcace09321d9bdd190274d9d59ea"),
    "Lcom/waze/jni/protos/alerters/NativeAlertDescriptor;->hasZoneAlertData()Z" to WazeWarningContract(1, 7, 1, "2b6a10af5ad693386ee5444b964b94001134b0a7931d46a9b2b7583aa1ee38a7"),
    "Lcom/waze/jni/protos/alerters/NativeAlertRepositoryUpdate;->getDescriptorsList()Ljava/util/List;" to WazeWarningContract(1, 2, 1, "2fec4aae79899cbee11b353c04e3e6ed58fa015f8fbdd494a5dc7e83050d1588"),
    "Lcom/waze/jni/protos/alerters/SilentActivation;-><clinit>()V" to WazeWarningContract(4, 28, 65544, "ae9ed8f8a174ee34af6d292c29b3e63346514d5d1973f502e6720104377795db"),
    "Lcom/waze/jni/protos/alerters/SilentActivation;->getNumber()I" to WazeWarningContract(2, 7, 17, "387675244d5522f9d3c6b04e8fa960fdf37c5e25220eee5e8cf6211a4ea10f41"),
    "Lcom/waze/jni/protos/alerters/SilentActivation;->values()[Lcom/waze/jni/protos/alerters/SilentActivation;" to WazeWarningContract(1, 5, 9, "2fc04d0e446190ae6b3a08e61a9cedee202fcba769049a1ecaa4a82b52fdb00c"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData\$State;-><clinit>()V" to WazeWarningContract(4, 28, 65544, "5958bf57a18781c4858b61415ab0aa0ed9a532d8b95bd6dfde6279cdd77c7759"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData\$State;->getNumber()I" to WazeWarningContract(2, 7, 17, "ed5ebfdb9cc47f8749d04f71c6b233cebd40500588f69ad5d206dfd34ccf7792"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData\$State;->values()[Lcom/waze/jni/protos/alerters/ZoneAlertData\$State;" to WazeWarningContract(1, 5, 9, "85f87d76e43b8394499a7f9b9b1ba2fc7a3cbcd2b52a0e8f2d396dc52bc61be5"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData;->getState()Lcom/waze/jni/protos/alerters/ZoneAlertData\$State;" to WazeWarningContract(1, 6, 1, "d1fba897a2500bf8e4577fed13078bb18c2bbc1224d2a3372d4b921dc94c547e"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData;->getStateValue()I" to WazeWarningContract(1, 2, 1, "b1bef959d11818edcfc27c8c5061157df7301ccc7310af242b32d9d8e4e6f512"),
    "Lcom/waze/jni/protos/alerters/ZoneAlertData;->getZonePercent()I" to WazeWarningContract(1, 2, 1, "e0a290f348f95165ddaf11e6f1feca01a94b1e2778c4e28bd20676bb0520063f"),
    "Lcom/waze/jni/protos/insights_infra/Feature;-><clinit>()V" to WazeWarningContract(4, 23, 65544, "5bf74db05cca857b74565bc94b52e631c656c07128320dd543fe405b65850d29"),
    "Lcom/waze/jni/protos/insights_infra/Feature;->getNumber()I" to WazeWarningContract(2, 7, 17, "a4a1c74ca94c83ac26914cd39d281bed5a20fff3bcd6fab5aa83f162f725d4a5"),
    "Lcom/waze/jni/protos/insights_infra/Feature;->values()[Lcom/waze/jni/protos/insights_infra/Feature;" to WazeWarningContract(1, 5, 9, "e520ab6d862416e67d7e1e76e72cf0056698bdc41a38ed02460c21e919136a5d"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getBody()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "f8be3073c10614ae4f79a5077cdb20935e9c78d2e8e346a61f5cd29595f520bf"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getId()Lcom/waze/jni/protos/insights_infra/NotificationId;" to WazeWarningContract(1, 5, 1, "2ef3b587013b49c7a9df4f10ade8aa26ed2fd16b1145300cb8d7ed15cedc7f88"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getInCarBodyVariantsList()Ljava/util/List;" to WazeWarningContract(1, 2, 1, "18ab64a75109e67cf956b53959250eb87c3bf6e64aa127f0ccba5313b0b72aca"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getInCarTitleVariantsList()Ljava/util/List;" to WazeWarningContract(1, 2, 1, "bd6f906cbe2b0b52cae62712222000c18ec6ef49e893a899e3fa8f0ee4510b94"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getPriority()I" to WazeWarningContract(1, 2, 1, "085e93ae5278028ee4c03f3d892eadb587f5fec9ac211296ac736858c67f11e2"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getTimeoutMs()J" to WazeWarningContract(3, 2, 1, "ea4faef356992fd4a5ed993055c60d825c02cd019bdaa213a0865222c5a7dd0f"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->getTitle()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "2bf90d13e18a9c35ccc80565860801bfc30630781190868b09d9531210ed5ae8"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->hasId()Z" to WazeWarningContract(2, 6, 1, "5b8abc8e800e775cc76dc049162fa19cd9e27d0267b9c444403a05736b2719d3"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->hasPriority()Z" to WazeWarningContract(1, 7, 1, "68767a5ba828b2c9d9972d098c7cec7183d4dd036c0224803535cfbd5a9d4c39"),
    "Lcom/waze/jni/protos/insights_infra/Notification;->hasTimeoutMs()Z" to WazeWarningContract(1, 7, 1, "763be2fd85665dfcf7d918482522dd92eb63b80a36720f66752c90abdc79d904"),
    "Lcom/waze/jni/protos/insights_infra/NotificationId;->getFeature()Lcom/waze/jni/protos/insights_infra/Feature;" to WazeWarningContract(1, 6, 1, "9ebc977c7db61a4d7b10f8ccb15f865625ac68cd92662226374d457026c6ffbe"),
    "Lcom/waze/jni/protos/insights_infra/NotificationId;->getFeatureValue()I" to WazeWarningContract(1, 2, 1, "786e507950c4b1c1267a7fac501730042bf34eaae8b82cf24b13e204f2bfdc3d"),
    "Lcom/waze/jni/protos/insights_infra/NotificationId;->getId()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "e399ae093060a40a10f1af2b6c57d6459a9f951369f2fd40129fb39bc759d7e9"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getAlerterType()Lcom/waze/jni/protos/alerters/AlerterType;" to WazeWarningContract(1, 6, 1, "8421ce1a9c9cb89dcbebfa780fdf840c66b398a5765fe918d023957d1480835d"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getAlerterTypeValue()I" to WazeWarningContract(1, 2, 1, "c882fca80a717a1137b0b96c876dc74524963834c2ea0ac8a95f3ce39227ccbf"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getFamiliar()Z" to WazeWarningContract(1, 2, 1, "584e8c1b797d605b2db9fd718318ad6b32fdeca4c482564cc49cfe8640e43af2"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getId()J" to WazeWarningContract(3, 2, 1, "b822c5b2d19e8ac4a74dd53dcd5df474fa31511f485ad3ccac9a229303ce1ca2"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getSubtype()I" to WazeWarningContract(1, 2, 1, "b51fc17c0099f111b5f25e1e20f78cbff4dc60fd0742cb7b6d1deab3efb95a4c"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$AlertInfo;->getUuid()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "cb1c635a563b0f9186a5dad0d8b9e17cb32a72d3673c6b6e293c18c6773394de"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Id;->getSegmentId()Ljava/lang/String;" to WazeWarningContract(1, 2, 1, "f268f680bf0b90452b6452ef054173e27d153f0acbd15fcaadc23836aae13693"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Id;->getSegmentType()Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Type;" to WazeWarningContract(1, 6, 1, "ed6053f3bbad4aad4aea28ae07f920ca12ee6bc7991761f6c929be70f15634c8"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Id;->getSegmentTypeValue()I" to WazeWarningContract(1, 2, 1, "ee075f5a5403844a0045a2292a31bec766c506af3eff9acf0e20f12e41cd96c2"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$PositionRelativeToSegment;-><clinit>()V" to WazeWarningContract(4, 23, 65544, "893b8dc4525c248b6dbd890f58e3517b07f8dd4cee2fe432f7beab64cea5db53"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$PositionRelativeToSegment;->getNumber()I" to WazeWarningContract(2, 7, 17, "a3c9aedfe940c58bd317848da1f81f78a45814ec4331d0c9ea268a34e4b3ad88"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$PositionRelativeToSegment;->values()[Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$PositionRelativeToSegment;" to WazeWarningContract(1, 5, 9, "e480ca55a548027b3ea0b259024d248c58cd10b8c5cdced0209db8f19c7bc8fa"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Type;-><clinit>()V" to WazeWarningContract(4, 58, 65544, "0d0b975fe56a826589c13ce45d45336ad60be7b06ff1519eede9ba1b648b9a1c"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Type;->getNumber()I" to WazeWarningContract(2, 7, 17, "1e6b5828d763e01b3ea6e34c695f36259a48f8835dd18565319d0b0c2b156e3e"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Type;->values()[Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Type;" to WazeWarningContract(1, 5, 9, "09118087eaedf3559b31c8d3a76abfedba1268ccb076a7e4b2533a267c194df0"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getId()Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$Id;" to WazeWarningContract(1, 5, 1, "3bf6a1c218aeb0558053efcf1b9c493be58f1d466c4e41d0aa12627746ff8c6c"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getPositionRelativeToSegment()Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo\$PositionRelativeToSegment;" to WazeWarningContract(1, 6, 1, "4e84c30dd7345adf52cdc5862082538448dbc8dd9c42487d0c9bb84a4275af45"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getPositionRelativeToSegmentValue()I" to WazeWarningContract(1, 2, 1, "d3e110085aefc36343cdae787eb17c43ee139c588064068b102f58fd1123f4cb"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getPriority()Lcom/waze/jni/protos/InsightPriority;" to WazeWarningContract(1, 5, 1, "c3b3e4c305cb09d557bccbfcf24996ddb93b54ee498ea28e50a6e82985f75622"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getRemainingDistanceMeters()I" to WazeWarningContract(1, 2, 1, "ce7950145e71b2b4455d5dc38064fcee1baac77f63a484deb112e016ec369da3"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getRemainingDurationSeconds()I" to WazeWarningContract(1, 2, 1, "ef78b5c64fc101e4d170d569c282452cafe1562b5b8a1e22cd844b1611ae3088"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->getSourceAlertInfosList()Ljava/util/List;" to WazeWarningContract(1, 2, 1, "9c8095a872b98fdfcd780aef5cf7bcd5f87e227c289d1271ac1d67d37e89ba6c"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->hasId()Z" to WazeWarningContract(1, 7, 1, "9bdd59fcb4d863699bc9229e2277d9755eb2551232c5acbc90fedd7da7ad3c2c"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->hasPriority()Z" to WazeWarningContract(1, 7, 1, "87cc0b97fc865f2b48086adbc278f0ffedeae7c5910b2e884b1cd640fab3185a"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightInfo;->hasRemainingDurationSeconds()Z" to WazeWarningContract(2, 6, 1, "32875f47bc304bfc43af14c679d320be39b0f4332ca9e17a4853e8c007504972"),
    "Lcom/waze/jni/protos/insights_infra/SegmentInsightUpdate;->getInfoList()Ljava/util/List;" to WazeWarningContract(1, 2, 1, "b8954bbc4478f3b2095cab4e834a6669926dcd3ec8cf2e6e2f0da783c98d85dc"),
    "Lcom/waze/insights_infra/InsightsInfraNativeManager;->c(Lcom/waze/jni/protos/insights_infra/SegmentInsightUpdate;)V" to WazeWarningContract(3, 5, 17, "6851bca3b8cb9f0cb436dc56230e805a382d0c6fbeba8dfe1299c9226aab5682"),
    "Lcom/waze/NativeManager;->getInstance()Lcom/waze/NativeManager;" to WazeWarningContract(1, 5, 9, "1fe5ed2dc2fbda82b2c59eb1dd4b46df1db9d0b4c1a8ce12b0bc4ebf7cb1e075"),
    "Lcom/waze/NativeManager;->getLocale()Ljava/util/Locale;" to WazeWarningContract(4, 47, 1, "39b33b9ad1625b03fc4851a353d747b04828946ed6c5827679fc62e438bbc7c8"),
    "Lcom/waze/alerters/b/i;->i()V" to WazeWarningContract(1, 1, 17, "e3048e9287e27d266e29057b4db257dd107ecf925d9e05e55b38c65159cd8b07"),
    "Lkotlinx/coroutines/a/ab;->l(Ljava/lang/Class;)Ljava/lang/Object;" to WazeWarningContract(2, 6, 25, "499c8c8b834ca3ce3002df03eeacba1f05cf2f4dbef35b32a8cc605f2f405414"),
    "Lcom/waze/alerters/b/j;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;" to WazeWarningContract(8, 170, 17, "fa86d832f03bab0699af75d157a3dbb8778b430c9ef430f76f12a7059835b958"),
    "Lcom/waze/alerters/b/o;->d(Lcom/waze/alerters/b/o;Lcom/waze/alerters/b/h;)Lcom/waze/alerters/b/h;" to WazeWarningContract(14, 84, 4121, "9865a60869044ebcb03b61367eca647702652c3dbeebc42556acc28509c6f20e"),
    "Lcom/waze/alerters/a/aa;->b(Lcom/waze/j;)V" to WazeWarningContract(8, 42, 17, "4a6af478a468e2d1fcd6fd260a9f79f4199895357335914b2686a3e972378728"),
    "Lcom/waze/car_lib/WazeCarAppService;->onCreate()V" to WazeWarningContract(6, 87, 17, "8492ba8de006cee955ebd711841c12946aa1c714a0b987eeb8002a2498018e24"),
    "Lcom/waze/car_lib/WazeCarAppService;->onDestroy()V" to WazeWarningContract(3, 6, 17, "c9a507fde973ff6e0df9d7400cae9e1ef12cbc93488f0a365b026d1d90eee388"),
)

internal fun validateWazeWarningMethods(methods: Map<String, Method>) {
    check(methods.keys == wazeWarningContracts.keys) { "Missing or unexpected Waze warning ABI" }
    wazeWarningContracts.forEach { (signature, contract) ->
        val method = methods.getValue(signature)
        val body = method.implementation
        val hash = if (body == null) "" else wazeWarningFingerprint(method)
        val count = body?.instructions?.count()
        val original = count == contract.count && hash == contract.hash
        val selectedZoneBar = signature == WAZE_SEGMENT_ROOT && count == contract.count + 1 && hash == WAZE_SEGMENT_ZONE_BAR_HASH
        check(method.toString() == signature && method.accessFlags == contract.flags && body != null &&
            body.registerCount == contract.registers && (original || selectedZoneBar)) {
            "Changed or already patched Waze warning ABI $signature"
        }
    }
}

/** Hash the complete original operand stream, payloads and exception ranges. */
internal fun wazeWarningFingerprint(method: Method): String {

    val body=method.implementation?:error("Missing Waze warning body $method")
    val text=buildString{
        append(body.registerCount)
        body.instructions.forEach{i->
            append('|').append(i.opcode).append(':').append((i as? ReferenceInstruction)?.reference?.toString().orEmpty())
            if(i is RegisterRangeInstruction)append('r').append(i.startRegister).append(',').append(i.registerCount)
            if(i is OneRegisterInstruction)append('a').append(i.registerA)
            if(i is TwoRegisterInstruction)append('b').append(i.registerB)
            if(i is ThreeRegisterInstruction)append('c').append(i.registerC)
            if(i is FiveRegisterInstruction)append('f').append(i.registerCount).append(',').append(i.registerC).append(',').append(i.registerD).append(',').append(i.registerE).append(',').append(i.registerF).append(',').append(i.registerG)
            if(i is WideLiteralInstruction)append('l').append(i.wideLiteral)
            if(i is OffsetInstruction)append('o').append(i.codeOffset)
            if(i is SwitchPayload)i.switchElements.forEach{append('s').append(it.key).append(',').append(it.offset)}
            if(i is ArrayPayload){append('w').append(i.elementWidth);i.arrayElements.forEach{append('v').append(it.toLong())}}
        }
        body.tryBlocks.forEach{block->
            append("|try:").append(block.startCodeAddress).append(',').append(block.codeUnitCount)
            block.exceptionHandlers.forEach{append('|').append(it.exceptionType).append('@').append(it.handlerCodeAddress)}
        }
    }
    return MessageDigest.getInstance("SHA-256").digest(text.toByteArray(Charsets.UTF_8)).joinToString(""){"%02x".format(it.toInt() and 255)}
}
