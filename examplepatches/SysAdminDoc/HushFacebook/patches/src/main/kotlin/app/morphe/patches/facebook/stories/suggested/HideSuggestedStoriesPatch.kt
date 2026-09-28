/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.suggested

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.media.taptoplay.isEnumNaming
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val PATCH = "Hide suggested stories"

/** The extension class that filters the tray's buckets, its injection point and the stubs this patch fills. */
internal const val SUGGESTED_STORIES = "$EXTENSION_PACKAGE/stories/SuggestedStories;"
internal const val KEPT_BUCKETS = "$SUGGESTED_STORIES->keptBuckets(Ljava/util/List;)Ljava/lang/Object;"
internal const val IS_BUCKET_STUB = "isBucket"
internal const val SUGGESTED_STUB = "suggested"
internal const val LABEL_STUB = "label"
internal const val COPY_STUB = "immutableCopy"

/** What the patch found. See SuggestedStoryAnchors.kt for what each is on 577 and 580. */
internal class TrayBuckets(
    /** The tray data class's one constructor, and which of its parameters is the bucket list. */
    val constructor: Method,
    val list: Int,
    /** The bucket interface, and its method answering the suggested flag. */
    val bucket: String,
    val flag: String,
    /** Facebook's static helper answering a bucket's first label, and the label enum. */
    val labelHelper: Method,
    val label: String,
)

/**
 * Takes the Stories Facebook suggests out of the Stories tray. The hook goes first in the one
 * constructor of the tray data, which every answer of the tray's fetch goes through, and hands the
 * bucket list to the extension. What comes back is the same list, or an ImmutableList without the
 * buckets Facebook marks as suggested, the way the tray's own card decides to say "Suggested":
 * the bucket's is_story_bucket_suggested flag, or SUGGESTED as its first label. Everything else in
 * the list stays, and so does everything else the tray draws.
 */
@Suppress("unused")
val hideSuggestedStoriesPatch = bytecodePatch(
    name = "Hide suggested stories",
    description = "Removes the stories Facebook suggests from people and Pages you don't follow, the ones " +
        "marked Suggested in the Stories tray. Your friends' stories, the Pages you follow and Create story stay.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val tray = trayBuckets()
        fillBucketStubs(tray)
        mutableClassDefBy(tray.constructor.definingClass).methods
            .single { it.name == "<init>" }
            .keepOnlyUnsuggestedBuckets(tray.list)
        enableStatus("suggestedStories")
    }
}

/**
 * The tray data's constructor, its bucket list, the bucket interface with its flag and Facebook's
 * label helper, held to the evidence the filter rests on: one post-processing method builds the
 * tray data through its one constructor, which keeps its one ImmutableList in a field; the classic
 * tray's receiver takes the tray data and reads that field; of the flags it asks each bucket, one
 * is answered by the interface's tree class with is_story_bucket_suggested; one enum names the
 * labels and one static helper answers it for that interface. Each has to be public for the
 * extension's stubs to reach it.
 */
internal fun BytecodePatchContext.trayBuckets(): TrayBuckets {
    val posts = classDefByStrings(POST_PROCESS_RESULT, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { classDef -> classDef.methods.filter(::isPostProcess) }
    val post = posts.singleOrPatchException("$PATCH: the tray fetch's post-processing holding \"$POST_PROCESS_RESULT\"")

    val data = classDefBy(post.returnType)
    val constructor = data.methods.filter { it.name == "<init>" }
        .singleOrPatchException("$PATCH: the one constructor of the tray data ${data.type}")
    val list = listParameters(constructor)
        .singleOrPatchException("$PATCH: the one ImmutableList ${data.type}'s constructor takes")
    if (!constructs(post, constructor)) {
        throw PatchException("$PATCH: ${post.definingClass}->${post.name} doesn't build its ${data.type} through its constructor")
    }
    val field = listField(constructor, list)
        ?: throw PatchException("$PATCH: ${data.type}'s constructor doesn't keep its bucket list in one field of its own")

    val receivers = classDefByStrings(OPTIMISTIC_RECEIVES, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        .flatMap { classDef ->
            classDef.methods.filter { method ->
                data.type in method.parameterTypes.map { it.toString() } && holdsString(method, OPTIMISTIC_RECEIVES)
            }
        }
    val receiver = receivers.singleOrPatchException("$PATCH: the tray receiver holding \"$OPTIMISTIC_RECEIVES\" and taking ${data.type}")
    if (!readsField(receiver, field)) {
        throw PatchException("$PATCH: ${receiver.definingClass}->${receiver.name} doesn't read ${data.type}->${field.name}, the bucket list")
    }
    val calls = interfaceFlagCalls(receiver)
    val interfaces = calls.map { it.definingClass }.toSet()

    val labels = classDefByStrings(LABEL_NAMES.first(), StringComparisonType.EQUALS)
        .filter { isEnumNaming(it, LABEL_NAMES) }
    val label = labels.singleOrPatchException("$PATCH: the bucket label enum naming ${LABEL_NAMES.joinToString()}")

    val flagged = mutableSetOf<String>()
    val helpers = mutableListOf<Method>()
    classDefForEach { classDef ->
        for (call in calls) {
            if (call.definingClass in classDef.interfaces &&
                classDef.methods.any { it.name == call.name && isTreeFlagReader(it, SUGGESTED_FLAG_FIELD) }
            ) {
                flagged += "${call.definingClass}->${call.name}"
            }
        }
        classDef.methods.filterTo(helpers) { isLabelHelper(it, interfaces, label.type) }
    }
    val flag: MethodReference = calls.filter { "${it.definingClass}->${it.name}" in flagged }
        .singleOrPatchException("$PATCH: the flag the tray receiver asks a bucket that a tree class answers with $SUGGESTED_FLAG_FIELD")
    val helper = helpers.filter { it.parameterTypes.single().toString() == flag.definingClass }
        .singleOrPatchException("$PATCH: the static helper answering ${label.type} for a ${flag.definingClass}")

    requirePublic(classDefBy(flag.definingClass), "the bucket interface")
    requirePublic(classDefBy(helper.definingClass), "the class of the label helper")
    if (!AccessFlags.PUBLIC.isSet(helper.accessFlags)) {
        throw PatchException("$PATCH: ${helper.definingClass}->${helper.name}, the label helper, isn't public")
    }
    val copy = classDefBy(IMMUTABLE_LIST).methods.any {
        it.name == "copyOf" && it.returnType == IMMUTABLE_LIST && AccessFlags.STATIC.isSet(it.accessFlags) &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/util/Collection;")
    }
    if (!copy) throw PatchException("$PATCH: ImmutableList has no public static copyOf(Collection) to rebuild a tray with")

    return TrayBuckets(constructor, list, flag.definingClass, flag.name, helper, label.type)
}

private fun requirePublic(classDef: ClassDef, what: String) {
    if (!AccessFlags.PUBLIC.isSet(classDef.accessFlags)) {
        throw PatchException("$PATCH: ${classDef.type}, $what, isn't public, so the extension can't reach it")
    }
}

/**
 * Fills the extension's four stubs: whether an item is a bucket, its suggested flag, its first
 * label, and an ImmutableList of what's kept. Each uses only its parameter register, so the stub's
 * own register count doesn't matter.
 */
internal fun BytecodePatchContext.fillBucketStubs(tray: TrayBuckets) {
    val filter = mutableClassDefBy(SUGGESTED_STORIES)
    fun stub(name: String, returnType: String, parameter: String) = filter.methods.singleOrNull {
        it.name == name && it.returnType == returnType && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map { type -> type.toString() } == listOf(parameter)
    } ?: throw PatchException("$SUGGESTED_STORIES has no static $returnType $name($parameter)")

    val helper = tray.labelHelper
    stub(IS_BUCKET_STUB, "Z", "Ljava/lang/Object;").addInstructions(
        0,
        """
            instance-of p0, p0, ${tray.bucket}
            return p0
        """,
    )
    stub(SUGGESTED_STUB, "Ljava/lang/Object;", "Ljava/lang/Object;").addInstructions(
        0,
        """
            check-cast p0, ${tray.bucket}
            invoke-interface { p0 }, ${tray.bucket}->${tray.flag}()Z
            move-result p0
            invoke-static { p0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object p0
            return-object p0
        """,
    )
    stub(LABEL_STUB, "Ljava/lang/Object;", "Ljava/lang/Object;").addInstructions(
        0,
        """
            check-cast p0, ${tray.bucket}
            invoke-static { p0 }, ${helper.definingClass}->${helper.name}(${tray.bucket})${tray.label}
            move-result-object p0
            return-object p0
        """,
    )
    stub(COPY_STUB, "Ljava/lang/Object;", "Ljava/util/List;").addInstructions(
        0,
        """
            invoke-static { p0 }, $IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST
            move-result-object p0
            return-object p0
        """,
    )
}

/**
 * First in the tray data's constructor, before anything reads the bucket list: the list goes to
 * the extension and its answer, the same list or a filtered copy, takes the list's place. The range
 * form names any register, and the cast holds the answer to the type the constructor stores.
 */
internal fun MutableMethod.keepOnlyUnsuggestedBuckets(list: Int) {
    val register = parameterRegisterNumber(list)
    if (register > 255) {
        throw PatchException("$PATCH: $definingClass's bucket list is in v$register, past what move-result-object can name")
    }
    addInstructions(
        0,
        """
            invoke-static/range { v$register .. v$register }, $KEPT_BUCKETS
            move-result-object v$register
            check-cast v$register, $IMMUTABLE_LIST
        """,
    )
}
