package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.*;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Preserve the original connector/callback, route its explicit package to our own UID. */
public final class EmbeddedRecorderPatch implements MethodPatch {
    public static final String ID = "adot.recording.embedded-shizuku";
    public static final String TARGET = "Lkho;-><clinit>()V";
    private static final String ORIGINAL = "c3506144907639e75212cdbd6e56a4d0a75aace83f857651ca761259be168286";
    public EmbeddedRecorderPatch() {}
    @Override public String dexEntry() { return "classes2.dex"; }
    @Override public Set<String> methods() { return Set.of(TARGET); }
    @Override public MethodImplementation implementation(Method method) {
        if (!TARGET.equals(id(method)) || method.getImplementation() == null
                || !ORIGINAL.equals(SummaryBytecodeGuard.fingerprint(method)))
            throw new IllegalStateException("Unsupported or already patched recorder identity initializer");
        MethodImplementationBuilder b = new MethodImplementationBuilder(1);
        b.addInstruction(string(0, "com.skt.prod.dialer"));
        b.addInstruction(new BuilderInstruction21c(Opcode.SPUT_OBJECT, 0, field("Lkho;", "a", "Ljava/lang/String;")));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC, 0, 0, method("Lts1;", "j", List.of(), "Lq2j;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        b.addInstruction(invoke(Opcode.INVOKE_STATIC, 1, 0,
            method("Lio/github/emotionbug/patches/runtime/RecorderIdentity;", "certificate",
                List.of("Landroid/content/Context;"), "Ljava/lang/String;")));
        b.addInstruction(new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        b.addInstruction(new BuilderInstruction21c(Opcode.SPUT_OBJECT, 0, field("Lkho;", "b", "Ljava/lang/String;")));
        b.addInstruction(string(0, "com.skt.prod.dialer.action.CONNECT"));
        b.addInstruction(new BuilderInstruction21c(Opcode.SPUT_OBJECT, 0, field("Lkho;", "c", "Ljava/lang/String;")));
        b.addInstruction(new BuilderInstruction10x(Opcode.RETURN_VOID));
        return b.getMethodImplementation();
    }
}
