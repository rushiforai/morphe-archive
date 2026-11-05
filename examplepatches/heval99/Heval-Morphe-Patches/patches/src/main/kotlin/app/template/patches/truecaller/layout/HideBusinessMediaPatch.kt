package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.overrideFeatureToggle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FEATURE = "truecaller.hide_business_media"

internal const val BRAND_MEDIA_HELPER = "morpheBrandMedia"

private const val CONTACT_TYPE = "Lcom/truecaller/enterpriseinfo/api/model/ContactType;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

// A Heval Controls feature: every step below applies only while it is on. Each business contact
// screen is built from a fresh model, so a change shows on the next one opened.
@Suppress("unused")
val hideBusinessMediaPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide business media",
        description = "Hides brand images, videos and campaign cards on business contacts.",
        category = TruecallerControlsCategory.CONTACTS,
    ),
    default = false,
) {
    // Validate both hook sites before the first edit.
    // The six fields are the constructor's leading parameters; 26.43.5 appended a contactId (Long),
    // so later parameters are allowed. brandMedia stays p6.
    val modelClass = BusinessDetailsModelToStringFingerprint.classDef
    val constructors = modelClass.methods.filter { method ->
        method.name == "<init>" && method.implementation != null &&
            method.parameterTypes.map(CharSequence::toString).take(6) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", CONTACT_TYPE,
                "Ljava/lang/String;", ARRAY_LIST,
            )
    }
    val constructor = constructors.singleOrNull()
        ?: throw PatchException("${modelClass.type} has ${constructors.size} (String, String, String, ContactType, String, ArrayList, ...) constructors, expected one")
    if (modelClass.methods.any { it.name == BRAND_MEDIA_HELPER }) throw PatchException("${modelClass.type} already has $BRAND_MEDIA_HELPER")
    val screen = BusinessDetailsScreenFingerprint.method
    if (screen.parameterTypes[1].toString() != modelClass.type) {
        throw PatchException("BusinessDetailsScreen takes ${screen.parameterTypes[1]}, not ${modelClass.type}")
    }

    // 1. Brand images: every BusinessDetailsModel is built with an empty brandMedia list. Its
    // readers (the screen, its carousel items, the media-shown analytics) all check isEmpty or
    // iterate by size, so nothing is laid out or reported. The constructor has no local register
    // for a gate (only this and the six parameters), so a new static helper on the model class
    // holds it: morpheBrandMedia(list) returns a new empty ArrayList while the feature is on and
    // the list it was given otherwise. v0 is its local, p0 = v1 the list.
    val helper = ImmutableMethod(
        modelClass.type,
        BRAND_MEDIA_HELPER,
        listOf(ImmutableMethodParameter(ARRAY_LIST, null, null)),
        ARRAY_LIST,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(2),
    ).toMutable().apply {
        addInstructionsChecked(0, "return-object p0")
        addHevalGate(FEATURE) { v ->
            """
                new-instance $v, $ARRAY_LIST
                invoke-direct/range {$v .. $v}, $ARRAY_LIST-><init>()V
                return-object $v
            """
        }
    }
    modelClass.methods.add(helper)
    // p6 is the brandMedia parameter; /range reaches it whatever the register count. A static call
    // with no `this` is valid before the super constructor call.
    constructor.addInstructionsChecked(
        0,
        """
            invoke-static/range {p6 .. p6}, ${modelClass.type}->$BRAND_MEDIA_HELPER($ARRAY_LIST)$ARRAY_LIST
            move-result-object p6
        """,
    )

    // 2. Promo video: the screen's nullable video thumbnail slot (Function2, p4) is cleared on
    // entry. With no brand images and no video the screen skips the carousel and keeps its
    // usual padding above the description. The recompose lambda passes p4 back in, which is
    // cleared again. The gate's patched path falls through into the stock code.
    // const/16 takes any register below v256 (p4 is v40 in 26.40.5); 0 is null for an object.
    screen.addHevalGate(FEATURE) { "const/16 p4, 0x0" }

    // 3. Verified business campaign cards. Each surface ORs its own toggle with the master one,
    // so all of them are overridden in the toggle resolver:
    // - "featureBizVerifiedCampaigns" (master): in-call, after-call (ACS) and PACS gates.
    // - "featureBizVerifiedCampaignForOutgoingCalls": outgoing-call screens, checked when the
    //   master is off.
    // - "featureBizVerifiedCampaignInRevampedInCallUi": the revamped in-call screen.
    // - "featureBizVerifiedCampaignsCarouselACS": the after-call campaign carousel.
    // - "featureBizVerifiedCampaignsDetailsView", "featureBizVerifiedCampaignsCarouselDetailsView"
    //   and "featureBizVerifiedCampaignsDV3": the details view campaign card and carousel
    //   widgets and their fetches.
    // Message ID campaigns (featureBizVerifiedCampaignsMID*) are left alone.
    for (key in listOf(
        "featureBizVerifiedCampaigns",
        "featureBizVerifiedCampaignForOutgoingCalls",
        "featureBizVerifiedCampaignInRevampedInCallUi",
        "featureBizVerifiedCampaignsCarouselACS",
        "featureBizVerifiedCampaignsDetailsView",
        "featureBizVerifiedCampaignsCarouselDetailsView",
        "featureBizVerifiedCampaignsDV3",
    )) {
        overrideFeatureToggle(key, false, FEATURE)
    }
}
