/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/timelinefilter/Fingerprints.kt
 */
package app.morphe.patches.tumblr.timelinefilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// This is the constructor of the PostsResponse class.
// The same applies here as with the TimelineConstructorFingerprint.
internal object PostsResponseConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.CONSTRUCTOR, AccessFlags.PUBLIC),
    custom = { method, classDef ->
        classDef.endsWith("/PostsResponse;") && method.parameters.size == 4
    },
)

// This is the constructor of the Timeline class.
// It receives the List<TimelineObject> as an argument with a @Json annotation, so this should be the first time
// that the List<TimelineObject> is exposed in non-library code.
internal object TimelineConstructorFingerprint : Fingerprint(
    strings = listOf("timelineObjectsList"),
    custom = { method, classDef ->
        classDef.endsWith("/Timeline;") &&
            method.parameters.isNotEmpty() &&
            method.parameters[0].type == "Ljava/util/List;"
    },
)

// This fingerprints the extension TimelineFilterPatch.filterTimeline method.
// The opcode fingerprint is searching for
//   if ("BLOCKED_OBJECT_DUMMY".equals(elementType)) iterator.remove();
internal object TimelineFilterExtensionFingerprint : Fingerprint(
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST_STRING, // "BLOCKED_OBJECT_DUMMY"
        Opcode.INVOKE_VIRTUAL, // HashSet.add(^)
    ),
    strings = listOf("BLOCKED_OBJECT_DUMMY"),
    custom = { _, classDef ->
        classDef.endsWith("/TimelineFilterPatch;")
    },
)

