package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.util.*;

/** Structural check of the guest callback hook against Reddit's real DEX files. */
public final class VerifyRedditGuestMode {
    public static void main(String[] args) throws Exception {
        ClassDef found = null, credentialPicker = null;
        for (String path : args) try (InputStream input = new BufferedInputStream(new FileInputStream(path))) {
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, input);
            for (ClassDef candidate : dex.getClasses())
                if (RedditGuestModePatch.VIEW_MODEL.equals(candidate.getType())) found = candidate;
                else if (RedditGuestModePatch.CREDENTIAL_PICKER.equals(candidate.getType())) credentialPicker = candidate;
        }
        if (found == null) throw new AssertionError("WelcomeV2ViewModel not found");
        MutableMethod constructor = RedditGuestModePatch.findConstructor(new MutableClass(found));
        int before = RedditContentFilterPatch.instructions(constructor).size();
        RedditGuestModePatch.hookGuestCallback(constructor);
        List<Instruction> after = RedditContentFilterPatch.instructions(constructor);
        if (after.size() != before + 1) throw new AssertionError("Expected one injected instruction");
        int calls = 0;
        for (Instruction instruction : after) {
            if (instruction.getOpcode() != Opcode.INVOKE_STATIC || !(instruction instanceof ReferenceInstruction)) continue;
            Object reference = ((ReferenceInstruction) instruction).getReference();
            if (reference instanceof MethodReference) {
                MethodReference method = (MethodReference) reference;
                if (RedditGuestModePatch.EXTENSION.equals(method.getDefiningClass())
                    && "schedule".equals(method.getName())) calls++;
            }
        }
        if (calls != 1) throw new AssertionError("Expected exactly one native guest callback invocation; found " + calls);
        if (credentialPicker == null) throw new AssertionError("Startup credential picker not found");
        MutableClass picker = new MutableClass(credentialPicker);
        RedditGuestModePatch.suppressCredentialPicker(picker);
        MutableMethod invokeSuspend = picker.getMethods().stream()
            .filter(m -> "invokeSuspend".equals(m.getName())).findFirst().orElseThrow();
        List<Instruction> suppressed = RedditContentFilterPatch.instructions(invokeSuspend);
        if (suppressed.size() != 2 || suppressed.get(0).getOpcode() != Opcode.SGET_OBJECT
            || suppressed.get(1).getOpcode() != Opcode.RETURN_OBJECT)
            throw new AssertionError("Credential picker was not replaced with a no-op");
        System.out.println("PASS: Reddit anonymous-session hook and credential-picker suppression");
    }
}
