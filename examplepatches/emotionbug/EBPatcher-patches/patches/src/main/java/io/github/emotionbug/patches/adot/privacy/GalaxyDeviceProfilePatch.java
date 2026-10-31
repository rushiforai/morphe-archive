package io.github.emotionbug.patches.adot.privacy;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;
import java.util.Set;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

/**
 * Opt-in, read-site-only metadata profile for A. 14.4.0 (14409).
 * These are chosen compatibility constants, not captured Galaxy firmware facts.
 * This is NOT a complete stock identity: hardware, device, product, fingerprint,
 * build ID/type, OS versions, unique IDs and capability decisions remain original.
 * In particular DataTransport's fingerprint and Crashlytics' product/build fields
 * can still identify the original device. Never advertise this as anonymization.
 */
public final class GalaxyDeviceProfilePatch {
    public static final String ID = "adot.device.galaxy-profile";
    public static final String MODEL = "SM-S911N";
    public static final String MANUFACTURER = "samsung";
    public static final String BRAND = "samsung";
    private static final String BUILD = "Landroid/os/Build;";
    private static final String STRING = "Ljava/lang/String;";

    private GalaxyDeviceProfilePatch() {}

    /** Add these recipes only when the user explicitly enables the profile. */
    public static List<MethodPatch> create() {
        return List.of(
            // First-party HTTP headers and Berry metadata, including creative WebView headers.
            recipe("classes2.dex", "Lgoo;->d()Ljava/util/HashMap;", site(54, 3, "MODEL")),
            recipe("classes2.dex", "Lvq;->d()Ljava/util/HashMap;", site(40, 3, "MODEL")),
            recipe("classes.dex", "Lbo2;->b(Lorg/json/JSONObject;)V", site(58, 3, "MODEL")),
            recipe("classes.dex", "Llzr;->z(Ljava/lang/String;Lcom/skt/prod/comm/lib/tadbear/model/WebViewCreative;Ljava/lang/String;)Ljava/util/HashMap;", site(38, 3, "MODEL")),
            recipe("classes.dex", "Ln9e;->j(ILjava/lang/String;Lbo2;)Lkotlin/Unit;", site(227, 6, "MODEL")),
            // DataTransport retains genuine OS/build and paired hardware fields explicitly.
            recipe("classes.dex", "Lcv5;->a(Le52;)Le52;",
                site(16, 2, "MODEL"), site(19, 2, "HARDWARE"), site(22, 2, "DEVICE"),
                site(25, 2, "PRODUCT"), site(28, 2, "ID"), site(31, 2, "MANUFACTURER"), site(34, 2, "FINGERPRINT")),
            // AppsFlyer metadata collectors; do not change vendor-based advertising-ID providers.
            recipe("classes.dex", "Lcom/appsflyer/internal/AFg1oSDK;->AFLoggerLogLevel(Ljava/util/Map;)V",
                site(27, 1, "BRAND"), site(30, 1, "DEVICE"), site(33, 1, "PRODUCT"), site(41, 1, "MODEL"), site(44, 1, "TYPE")),
            recipe("classes.dex", "Lcom/appsflyer/internal/AFd1sSDK;->registerClient()Ljava/util/Map;",
                site(15, 2, "MODEL"), site(37, 2, "BRAND")),
            recipe("classes.dex", "Lcom/appsflyer/internal/AFd1wSDK;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
                site(21, 3, "BRAND"), site(25, 3, "MODEL")),
            recipe("classes.dex", "Lcom/appsflyer/internal/AFe1fSDK;->AFLogger(Ljava/lang/String;)Lcom/appsflyer/internal/AFd1pSDK;", site(52, 1, "MODEL")),
            recipe("classes.dex", "Lcom/appsflyer/internal/AFf1qSDK;->force(Lcom/appsflyer/internal/AFh1pSDK;)V",
                site(5, 1, "MODEL"), site(27, 1, "BRAND")),
            // Crashlytics settings, Java session metadata and native-session JSON metadata.
            recipe("classes2.dex", "Llz1;->k0(Lucc;)Ljava/lang/Object;", site(384, 6, "MANUFACTURER"), site(390, 12, "MODEL")),
            recipe("classes2.dex", "Lu98;->c(Ljava/lang/String;Ljava/lang/Boolean;)V",
                site(70, 14, "CPU_ABI"), site(92, 7, "MODEL"), site(103, 8, "MANUFACTURER"), site(104, 15, "PRODUCT")),
            recipe("classes2.dex", "Lxb8;->f(Ljava/lang/String;Lj62;)V",
                site(1, 1, "MODEL"), site(7, 8, "MANUFACTURER"), site(8, 9, "PRODUCT")),
            // Both OAuth form suppliers and the shared account User-Agent constructor.
            recipe("classes2.dex", "Lsy1;->a(Lsy1;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V",
                site(49, 10, "MANUFACTURER"), site(51, 9, "MODEL")),
            recipe("classes3.dex", "Lgz1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
                site(89, 6, "MANUFACTURER"), site(91, 5, "MODEL")),
            recipe("classes2.dex", "Le60;->invoke()Ljava/lang/Object;",
                site(248, 12, "MANUFACTURER"), site(249, 7, "MODEL")),
            recipe("classes3.dex", "Lofo;->b(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/HashMap;)I", site(91, 11, "MODEL")),
            recipe("classes3.dex", "Lmoq;->e()Lorg/json/JSONObject;", site(44, 4, "MODEL")),
            // OCB window.__APP_INFO exposure; no claim this JSON is uploaded.
            recipe("classes3.dex", "Lekh;->f(Lujh;Lh58;)Ljava/lang/Object;", site(85, 11, "MODEL"))
        );
    }

    private record Site(int index, int register, String field) {}
    private static Site site(int index, int register, String field) {
        return new Site(index, register, field);
    }
    private static MethodPatch recipe(String dex, String methodId, Site... sites) {
        return new MethodPatch() {
            @Override public String dexEntry() { return dex; }
            @Override public Set<String> methods() { return Set.of(methodId); }
            @Override public MethodImplementation implementation(Method method) {
                if (!methodId.equals(id(method)) || method.getImplementation() == null) {
                    throw new IllegalArgumentException("Unexpected Galaxy profile method: " + id(method));
                }
                // Check the complete Build-source sequence before modifying anything. Index,
                // register, opcode and exact field/type must all match the inspected release.
                int index = 0;
                int found = 0;
                for (var instruction : method.getImplementation().getInstructions()) {
                    if (instruction instanceof ReferenceInstruction reference
                            && reference.getReference() instanceof FieldReference field
                            && BUILD.equals(field.getDefiningClass())) {
                        if (found >= sites.length) throw unexpected(methodId, index);
                        var expected = sites[found++];
                        if (index != expected.index || instruction.getOpcode() != Opcode.SGET_OBJECT
                                || !(instruction instanceof OneRegisterInstruction register)
                                || register.getRegisterA() != expected.register
                                || !expected.field.equals(field.getName()) || !STRING.equals(field.getType())) {
                            throw unexpected(methodId, index);
                        }
                    }
                    index++;
                }
                if (found != sites.length) throw unexpected(methodId, index);
                var body = new MutableMethodImplementation(method.getImplementation());
                for (var site : sites) {
                    String value = switch (site.field) {
                        case "MODEL" -> MODEL;
                        case "MANUFACTURER" -> MANUFACTURER;
                        case "BRAND" -> BRAND;
                        default -> null;
                    };
                    if (value != null) {
                        // Jumbo avoids any dependence on the rebuilt DEX string-pool index.
                        // MutableMethodImplementation relocates branches/tries/debug labels.
                        body.replaceInstruction(site.index, new BuilderInstruction31c(
                            Opcode.CONST_STRING_JUMBO, site.register, new ImmutableStringReference(value)));
                    }
                }
                return body;
            }
        };
    }
    private static IllegalStateException unexpected(String methodId, int index) {
        return new IllegalStateException("Unexpected Galaxy metadata Build source at " + methodId + " instruction " + index);
    }
}
