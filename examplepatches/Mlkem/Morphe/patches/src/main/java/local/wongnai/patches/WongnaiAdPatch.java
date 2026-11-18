package local.wongnai.patches;

import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.BytecodePatchBuilder;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.FormFactor;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.BytecodeUtilsKt;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/** Version-specific ad request blocking for the user's Wongnai APK. */
public final class WongnaiAdPatch {
    private static final String PACKAGE = "com.wongnai.android";
    private static final String VERSION = "12.11.0";
    private static final String PHOTO_MODEL = "Lcom/wongnai/android/legacy/photo2/model/UiPhotoAds;";
    // Owner, method, static/instance, then the exact parameter types.
    private static final String[][] LOADERS = {
        {"Ld4/d;", "a", "instance", "Ld4/e;"},
        {"Ld4/i;", "b", "instance", "Ld4/e;"},
        {"Le4/b;", "e", "instance", "Le4/a;"},
        {"Lk4/H0;", "b", "instance", "Lk4/F0;"},
        {"Ln4/a;", "b", "static", "Landroid/content/Context;", "Ljava/lang/String;", "Ld4/e;", "Ln4/b;"}
    };
    private static final String[] PHOTO_ENTRY = {"Lpf/e;", "k", "instance", PHOTO_MODEL};
    private static final String[] PHOTO_FALLBACK = {"Lpf/e;", "l", "instance", PHOTO_MODEL, "Z"};
    private static final Logger LOG = Logger.getLogger(WongnaiAdPatch.class.getName());
    private static final BytecodePatch PATCH = PatchKt.bytecodePatch(
        "Disable Wongnai Google ads",
        "Stops the identified Google banner, native and interstitial ad loaders in Wongnai 12.11.0, and uses its existing photo-ad fallback.",
        true,
        new Function1<BytecodePatchBuilder, Unit>() {
            @Override public Unit invoke(BytecodePatchBuilder builder) {
                builder.compatibleWith(new Compatibility(
                    PACKAGE, "Wongnai", null, ApkFileType.XAPK, (Integer) null,
                    null,
                    Collections.singletonList(new AppTarget(VERSION, null, false, null, null)),
                    FormFactor.MOBILE
                ));
                builder.execute(new Function1<BytecodePatchContext, Unit>() {
                    @Override public Unit invoke(BytecodePatchContext context) {
                        patch(context);
                        return Unit.INSTANCE;
                    }
                });
                return Unit.INSTANCE;
            }
        }
    );

    private WongnaiAdPatch() {}

    /** Public static zero-argument patch getters are supported by Morphe. */
    public static BytecodePatch getWongnaiPatch() { return PATCH; }

    private static void patch(BytecodePatchContext context) {
        if (!PACKAGE.equals(context.getPackageMetadata().getPackageName()) ||
            !VERSION.equals(context.getPackageMetadata().getVersionName())) {
            throw new IllegalStateException("Requires Wongnai " + VERSION + " (" + PACKAGE + ").");
        }

        // Resolve every required method before making any edits; fail closed.
        List<Method> methods = new ArrayList<Method>();
        for (String[] target : LOADERS) methods.add(requireMethod(context, target));
        Method photoEntry = requireMethod(context, PHOTO_ENTRY);
        requireMethod(context, PHOTO_FALLBACK);
        int registers = photoEntry.getImplementation().getRegisterCount();
        if (registers < 3 || registers > 16) {
            throw new IllegalStateException("Unexpected register layout in photo fallback entry.");
        }

        for (int i = 0; i < methods.size(); i++) {
            BytecodeUtilsKt.returnEarly(BytecodeUtilsKt.getMutableMethod(context, methods.get(i)));
            LOG.info("[Wongnai] Disabled " + descriptor(LOADERS[i]));
        }
        InstructionExtensions.INSTANCE.addInstructions(
            BytecodeUtilsKt.getMutableMethod(context, photoEntry), 0,
            "const/4 v0, 0x0\n" +
            "invoke-virtual {p0, p1, v0}, " + descriptor(PHOTO_FALLBACK) + "\n" +
            "return-void"
        );
        LOG.info("[Wongnai] Photo ad entry now calls the app's existing failure fallback.");
        LOG.info("[Wongnai] Verified and changed all 6 required methods.");
    }

    private static Method requireMethod(BytecodePatchContext context, String[] target) {
        ClassDef cls = context.classDefByOrNull(target[0]);
        Method found = null;
        List<String> expected = Arrays.asList(Arrays.copyOfRange(target, 3, target.length));
        if (cls != null) {
            for (Method method : cls.getMethods()) {
                List<String> actual = new ArrayList<String>();
                for (CharSequence type : method.getParameterTypes()) actual.add(type.toString());
                if (target[1].equals(method.getName()) && "V".equals(method.getReturnType()) && expected.equals(actual)) {
                    boolean isStatic = (method.getAccessFlags() & 0x8) != 0;
                    if (found != null || method.getImplementation() == null ||
                        isStatic != "static".equals(target[2])) {
                        throw new IllegalStateException("Unexpected target: " + descriptor(target));
                    }
                    found = method;
                }
            }
        }
        if (found == null) throw new IllegalStateException("Required method not found: " + descriptor(target));
        return found;
    }

    private static String descriptor(String[] target) {
        StringBuilder s = new StringBuilder(target[0]).append("->").append(target[1]).append('(');
        for (int i = 3; i < target.length; i++) s.append(target[i]);
        return s.append(")V").toString();
    }
}
