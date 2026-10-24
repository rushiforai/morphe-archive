package app.lchanc3.patches.jptt.image

import app.lchanc3.patches.jptt.shared.Constants.ARTICLE_URL_TASK_CLASS
import app.lchanc3.patches.jptt.shared.Constants.PICTURE_VIEW_CLASS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import com.android.tools.smali.dexlib2.Opcode

internal const val RESIZE_OPTIONS_CLASS = "Lcom/facebook/imagepipeline/common/ResizeOptions;"
internal const val SUBSAMPLING_VIEW_CLASS = "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;"

/**
 * `ArticleUrlAsyncTask.doInBackground(String...)`, which turns a link found in an
 * article into the URL the preview and the full size viewer load. The bridge
 * method the generic superclass declares takes `Object[]`, so the parameter and
 * return types are what tell the two apart.
 */
internal object ArticleUrlDoInBackgroundFingerprint : Fingerprint(
    definingClass = ARTICLE_URL_TASK_CLASS,
    name = "doInBackground",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf("[Ljava/lang/String;"),
)

/**
 * `onFinalImageSet()` of the listener `PictureView.showPicture()` gives the
 * controller of an article's picture, called once Fresco has put the image up.
 * An anonymous class, so it is found by the interface method it implements.
 */
internal object PictureShownFingerprint : Fingerprint(
    name = "onFinalImageSet",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/facebook/imagepipeline/image/ImageInfo;",
        "Landroid/graphics/drawable/Animatable;",
    ),
    custom = { _, classDef -> classDef.type.startsWith(PICTURE_VIEW_CLASS.removeSuffix(";") + "\$") },
)

/**
 * `PictureView.showPicture(int, int, int, boolean)`, which loads an article's
 * picture with a `new ResizeOptions(width, height)` the size of its view.
 */
internal object ShowPictureFingerprint : Fingerprint(
    definingClass = PICTURE_VIEW_CLASS,
    name = "showPicture",
    returnType = "V",
    parameters = listOf("I", "I", "I", "Z"),
    filters = listOf(
        newInstance(RESIZE_OPTIONS_CLASS),
        methodCall(
            definingClass = RESIZE_OPTIONS_CLASS,
            name = "<init>",
            parameters = listOf("I", "I"),
            location = MatchAfterImmediately(),
        ),
    ),
)

/**
 * `PhotoActivity.PhotoPagerAdapter.loadWithSubSamplingView()`, which sets up
 * the full size viewer for one picture.
 */
internal object LoadWithSubSamplingViewFingerprint : Fingerprint(
    definingClass = "Lcom/joshua/jptt/ui/PhotoActivity\$PhotoPagerAdapter;",
    name = "loadWithSubSamplingView",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = SUBSAMPLING_VIEW_CLASS,
            name = "setRegionDecoderClass",
        ),
    ),
)

/**
 * `FrescoRegionDecoder.decodeRegion(Rect, int)`, which decodes one tile of the
 * full size viewer in RGB_565.
 */
internal object DecodeRegionFingerprint : Fingerprint(
    definingClass = "Lcom/joshua/jptt/ui/FrescoRegionDecoder;",
    name = "decodeRegion",
    returnType = "Landroid/graphics/Bitmap;",
    filters = listOf(
        fieldAccess(
            definingClass = "Landroid/graphics/Bitmap\$Config;",
            name = "RGB_565",
            opcode = Opcode.SGET_OBJECT,
        ),
    ),
)
