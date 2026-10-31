package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Same-width calls in the completed-summary publisher, not global NotificationManager interception. */
public final class NativeSummaryNotificationPatch implements MethodPatch {
    public static final String PUBLISH = "Lteq;->y(Lbi3;Lh58;)Ljava/lang/Object;";
    public static final String HOOK = "Lio/github/emotionbug/patches/runtime/SummaryNotifications;";
    private static final String ORIGINAL = "bc120cd4438373588bc350f1f16ab83dabad248d683c9913ea447de80e2cf628";
    private static final Map<String, String> CONTRACTS = Map.of(
            "Lpls;->N(Lsqc;Landroid/content/Intent;)V", "1db9c65a0151ebde3c24d784486a27bd2fdedc81c402412b2a40d8ea4b4e59eb",
            "Lcom/skt/prod/dialer/business/notification/z0;->k(Lcom/skt/prod/dialer/business/notification/n0;Ljava/lang/Integer;Lkotlin/jvm/functions/Function1;)Z",
            "7fff8aa2425f1fe60f96180721932f5df1e6f960528686e8b2c9bb033ab6cb8c");
    @Override public String dexEntry() { return "classes2.dex"; }
    @Override public Set<String> methods() { return Set.of(PUBLISH); }

    public static void validate(Function<String, ? extends ClassDef> classes) {
        CONTRACTS.forEach((descriptor, expected) -> {
            ClassDef owner = classes.apply(descriptor.substring(0, descriptor.indexOf("->")));
            Method found = null;
            if (owner != null) for (Method candidate : owner.getMethods()) if (descriptor.equals(id(candidate))) {
                if (found != null) throw unsupported(descriptor);
                found = candidate;
            }
            if (found == null || !expected.equals(SummaryBytecodeGuard.fingerprint(found))) throw unsupported(descriptor);
        });
    }

    @Override public MethodImplementation implementation(Method target) {
        if (!PUBLISH.equals(id(target)) || !ORIGINAL.equals(SummaryBytecodeGuard.fingerprint(target))) throw unsupported(id(target));
        MutableMethodImplementation body = new MutableMethodImplementation(target.getImplementation());
        replace(body, 0x3c7, "Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;",
                "pendingIntent", List.of("Landroid/content/Context;", "I", "Landroid/content/Intent;", "I"), "Landroid/app/PendingIntent;");
        replace(body, 0x413, "Lcom/skt/prod/dialer/business/notification/z0;->k(Lcom/skt/prod/dialer/business/notification/n0;Ljava/lang/Integer;Lkotlin/jvm/functions/Function1;)Z",
                "publishNative", List.of("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Integer;", "Ljava/lang/Object;"), "Z");
        return body;
    }

    private static void replace(MutableMethodImplementation body, int address, String original, String name, List<String> parameters, String result) {
        int index = 0, offset = 0;
        while (offset < address) offset += body.getInstructions().get(index++).getCodeUnits();
        var instruction = body.getInstructions().get(index);
        if (offset != address || !(instruction instanceof FiveRegisterInstruction registers) || registers.getRegisterCount() != 4
                || !(instruction instanceof ReferenceInstruction reference) || !(reference.getReference() instanceof MethodReference called)
                || !original.equals(id(called))) throw unsupported(original);
        body.replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 4,
                registers.getRegisterC(), registers.getRegisterD(), registers.getRegisterE(), registers.getRegisterF(), 0,
                method(HOOK, name, parameters, result)));
    }
    private static IllegalStateException unsupported(String descriptor) {
        return new IllegalStateException("Unsupported or already patched native summary notification contract: " + descriptor);
    }
}
