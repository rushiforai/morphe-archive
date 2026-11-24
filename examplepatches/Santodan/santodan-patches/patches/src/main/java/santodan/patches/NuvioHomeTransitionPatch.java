package santodan.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import software.santodan.nuvio.NuvioNative;
import java.util.*;

/** 1.1.1 staged Home publications; never modifies the authoritative final publication. */
final class NuvioHomeTransitionPatch {
    static final String INITIAL = "Lya/y4;", PARTIAL = "Lya/x4;";
    static final String EXT = "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;";
    static final Map<String, String> HASHES = Map.of(
        INITIAL, "74799e31fb8d68511f47d41d4535543dfcb85a99362c5cbe6395d2ea609e7c12",
        PARTIAL, "4910a93d7bf3e2216de266858636510528c05e51dd92fd524a210d18ba0748a0");
    static final List<String> FIELDS = List.of(NuvioNative.REF_HOME_TRANSITION_OWNER,
        NuvioNative.REF_HOME_STATE_FLOW, NuvioNative.REF_HOME_VISIBLE_ITEMS, NuvioNative.REF_HOME_UPCOMING_ITEMS,
        NuvioNative.REF_HOME_PROGRESS_RECORD, NuvioNative.REF_HOME_NEXT_INFO,
        NuvioNative.REF_HOME_NEXT_ID, NuvioNative.REF_HOME_NEXT_TYPE);

    static void install(BytecodePatchContext context) {
        NuvioLocalHomePatch.validate(context);
        for (String reference : FIELDS) {
            String type = reference.substring(0, reference.indexOf("->"));
            boolean found = false;
            for (var field : context.classDefBy(type).getFields())
                if (field.toString().equals(reference) && (field.getAccessFlags() & 8) == 0) found = true;
            if (!found)
                throw new IllegalStateException("Home transition field changed: " + reference);
        }
        var split = NuvioRemainingEpisodesPatch.unique(new MutableClass(context.classDefBy("Lya/k5;")), "D", 2);
        if (!split.toString().equals(NuvioNative.REF_HOME_SPLIT) || (split.getAccessFlags() & 8) == 0)
            throw new IllegalStateException("Home transition split signature changed");
        var initial = context.mutableClassDefBy(INITIAL);
        var partial = context.mutableClassDefBy(PARTIAL);
        validate(initial); validate(partial);
        hook(initial); hook(partial);
    }

    static MutableMethod validate(MutableClass owner) {
        var method = NuvioRemainingEpisodesPatch.unique(owner, "invokeSuspend", 1);
        if (!HASHES.containsKey(owner.getType()) || !method.getParameterTypes().equals(List.of("Ljava/lang/Object;")) ||
            !method.getReturnType().equals("Ljava/lang/Object;") || (method.getAccessFlags() & 8) != 0 ||
            method.getImplementation() == null || !NuvioPlaybackButtonsPatch.fingerprint(method).equals(HASHES.get(owner.getType())))
            throw new IllegalStateException("Home transition changed or already patched: " + owner.getType());
        var code = NuvioRemainingEpisodesPatch.instructions(method);
        var splits = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++)
            if (NuvioPlaybackButtonsPatch.reference(code.get(i)).equals(NuvioNative.REF_HOME_SPLIT)) splits.add(i);
        boolean initial = owner.getType().equals(INITIAL);
        if (splits.size() != (initial ? 2 : 1) || splits.get(0) != (initial ? 1681 : 297))
            throw new IllegalStateException("Home transition publication anchors changed");
        var call = (FiveRegisterInstruction) code.get(splits.get(0));
        if (call.getRegisterCount() != 2 || call.getRegisterC() != (initial ? 3 : 0) ||
            call.getRegisterD() != (initial ? 14 : 3))
            throw new IllegalStateException("Home transition publication registers changed");
        return method;
    }

    static void hook(MutableClass owner) {
        var method = validate(owner);
        boolean initial = owner.getType().equals(INITIAL);
        int at = initial ? 1681 : 297, list = initial ? 3 : 0, receiver = initial ? 9 : 4;
        method.getImplementation().addInstruction(at, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
            2, receiver, list, 0, 0, 0, new ImmutableMethodReference(EXT,
                initial ? "retainInitialContinueWatching" : "retainPartialContinueWatching",
                List.of("Ljava/lang/Object;", "Ljava/util/List;"), "Ljava/util/List;")));
        method.getImplementation().addInstruction(at + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, list));
        if (initial) method.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(method), 1, new ImmutableMethodReference(EXT,
                "captureHomeSnapshot", List.of("Ljava/lang/Object;"), "V")));
    }
}
