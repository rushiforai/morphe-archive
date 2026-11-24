package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import software.santodan.nuvio.NuvioNative;
import java.util.*;

/** Original 1.1.1 ABI for the incremental local Home projector. */
final class NuvioLocalHomePatch {
    static final List<String> FIELDS = List.of(NuvioNative.REF_LOCAL_HOME_SNAPSHOT, NuvioNative.REF_LOCAL_HOME_STAGE_LABEL,
        NuvioNative.REF_LOCAL_HOME_DISMISSED, NuvioNative.REF_LOCAL_HOME_UNAIRED, NuvioNative.REF_LOCAL_HOME_SORT,
        NuvioNative.REF_LOCAL_HOME_META, NuvioNative.REF_LOCAL_HOME_FINISHED, NuvioNative.REF_LOCAL_HOME_FINISHED_FLOW);
    static final Map<String, String> METHODS = Map.of(
        NuvioNative.REF_LOCAL_HOME_DEBUG_INIT, "82ff8f67030d8415965959b86dc1c3fc0f2d412f1497bc380f4dc4427334f33e",
        NuvioNative.REF_LOCAL_HOME_RESOLVE, "8a438927f5a0075cd69f8e8867a8ac4eb77d8c8e28c3a12cac81311e7ef91bf8",
        NuvioNative.REF_LOCAL_HOME_SORT_ITEMS, "b00905160bbd8809694c6120b8c08c5a31fc5592ccf49e0673da7e2bda7c6b5f",
        NuvioNative.REF_LOCAL_HOME_STATE_COPY, "6517ccb4003e9b583a8e44363c374feae80ebf92975414fee26f70d31604381c",
        NuvioNative.REF_LOCAL_HOME_PROGRESS_INIT, "13101d9a4281e765d18f1ead9175eafef1c2f22cb1f31e3af47c716cd04ddd0e");
    static void validate(BytecodePatchContext context) {
        for (String ref : FIELDS) {
            boolean found = false;
            for (var f : context.classDefBy(ref.substring(0, ref.indexOf("->"))).getFields())
                if (f.toString().equals(ref) && (f.getAccessFlags() & 8) == 0) found = true;
            if (!found) throw new IllegalStateException("Local Home field changed: " + ref);
        }
        METHODS.forEach((ref, hash) -> {
            var owner = new MutableClass(context.classDefBy(ref.substring(0, ref.indexOf("->"))));
            var candidates = owner.getMethods().stream().filter(m -> m.toString().equals(ref)).toArray(MutableMethod[]::new);
            if (candidates.length != 1 || candidates[0].getImplementation() == null || !NuvioPlaybackButtonsPatch.fingerprint(candidates[0]).equals(hash) ||
                ((candidates[0].getAccessFlags() & 8) != 0) == ref.contains("-><init>"))
                throw new IllegalStateException("Local Home method changed: " + ref);
        });
    }
}
