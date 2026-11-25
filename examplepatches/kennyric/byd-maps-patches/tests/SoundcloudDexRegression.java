import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Inspect emitted DEX, including independently disabled patches and preserved configuration refresh. */
class SoundcloudDexRegression {
    static final String ROOT = "Lcom/soundcloud/android/";
    static final Map<String, ClassDef> classes = new HashMap<>();
    static Method method(String owner, String name, String... parameters) {
        List<Method> matches = new ArrayList<>();
        for (Method m : classes.get(ROOT + owner + ";").getMethods())
            if (m.getName().equals(name) && m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(parameters)))
                matches.add(m);
        if (matches.size() != 1) throw new AssertionError(owner + "->" + name + ": " + matches.size());
        return matches.get(0);
    }
    static List<? extends Instruction> code(Method method) {
        List<Instruction> result = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    static void check(boolean ok, String label) { if (!ok) throw new AssertionError(label); }
    static void returnsVoid(Method method, boolean enabled) {
        check((code(method).get(0).getOpcode() == Opcode.RETURN_VOID) == enabled, method.toString());
    }
    static void returnsField(Method method, String field, boolean enabled) {
        var instructions = code(method);
        boolean patched = instructions.get(0) instanceof ReferenceInstruction ref &&
            ref.getReference() instanceof FieldReference f && f.getName().equals(field) &&
            instructions.get(1).getOpcode() == Opcode.RETURN_OBJECT;
        check(patched == enabled, method + " field " + field);
    }
    static void falseParameter(Method method, int parameter, boolean enabled) {
        var first = code(method).get(0);
        int words = method.getParameterTypes().stream().mapToInt(t -> t.equals("J") || t.equals("D") ? 2 : 1).sum() + 1;
        int register = method.getImplementation().getRegisterCount() - words + parameter;
        boolean patched = first.getOpcode() == Opcode.CONST_4 &&
            ((OneRegisterInstruction) first).getRegisterA() == register &&
            ((NarrowLiteralInstruction) first).getNarrowLiteral() == 0;
        check(patched == enabled, method + " false p" + parameter);
    }
    public static void main(String[] args) throws Exception {
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses())
            classes.put(c.getType(), c);
        var names = Set.of(Arrays.copyOfRange(args, 1, args.length));
        boolean analytics = names.contains("Disable analytics"), consent = names.contains("Disable consent popup"), go = names.contains("Enable SoundCloud Go");
        boolean home = names.contains("Home in Android Auto");
        boolean devices = names.contains("Ignore device limit");
        returnsVoid(method("analytics/base/TrackingHandler", "handleMessage", "Landroid/os/Message;"), false);
        var tracking = code(method("analytics/base/TrackingHandler", "a", "Landroid/os/Message;"));
        boolean blocked = tracking.get(0).getOpcode() == Opcode.IGET &&
            tracking.get(1).getOpcode() == Opcode.CONST &&
            ((NarrowLiteralInstruction) tracking.get(1)).getNarrowLiteral() == -559038737 &&
            tracking.get(2).getOpcode() == Opcode.IF_EQ && tracking.get(3).getOpcode() == Opcode.RETURN_VOID;
        check(blocked == analytics, "analytics events blocked while shutdown falls through");
        var provider = method("privacy/consent/main/PrivacyConsentControllerModule$Companion", "a",
            ROOT + "privacy/legislation/LegislationOperations;", "Ldagger/Lazy;");
        var first = code(provider).get(0);
        check((first.getOpcode() == Opcode.SGET_OBJECT && code(provider).get(1).getOpcode() == Opcode.RETURN_OBJECT) == consent, "consent provider");
        if (consent) {
            FieldReference f = (FieldReference) ((ReferenceInstruction) first).getReference();
            check(f.getType().equals(ROOT + "privacy/consent/base/NoopPrivacyConsentController;"), "real no-op singleton");
            check(classes.get(f.getDefiningClass()).getFields().iterator().hasNext(), "singleton owner exists");
        }
        returnsField(method("configuration/features/DefaultFeatureOperations", "getCurrentTier"), "HIGH", go);
        returnsField(method("configuration/features/DefaultFeatureOperations", "getCurrentConsumerPlan"), "GO_PLUS", go);
        returnsField(method("configuration/data/ConfigurationSettingsStorage", "b"), "HIGH", go);
        returnsField(method("upsell/UpsellVisibilityController", "mapToPlan", ROOT + "upsell/ApiMobileUpsellApplianceGraph;"), "INSTANCE", go);
        var plan = code(method("configuration/plans/UserConsumerPlan", "<init>", "Ljava/lang/String;", "Z", "Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;"));
        if (go) for (int i = 0; i < 3; i++)
            check(((StringReference) ((ReferenceInstruction) plan.get(i)).getReference()).getString().equals(
                List.of("high_tier", "go-plus", "SoundCloud Go").get(i)), "plan construction " + i);
        else check(plan.get(0).getOpcode() != Opcode.CONST_STRING, "original plan construction");
        for (String name : List.of("getShouldRequestAds", "isMonetizableAdGeo")) {
            var instructions = code(method("configuration/features/DefaultFeatureOperations", name));
            check((instructions.get(0).getOpcode() == Opcode.CONST_4 && instructions.get(1).getOpcode() == Opcode.RETURN) == go, name);
            if (go) check(((NarrowLiteralInstruction) instructions.get(0)).getNarrowLiteral() == 0, name + " false");
        }
        String ads = "ads/display/data/config/";
        falseParameter(method(ads + "AdPlacementConfiguration", "<init>", "Z", ROOT + ads + "GamConfiguration;", ROOT + ads + "AditudeConfiguration;"), 1, go);
        falseParameter(method(ads + "AdPlacementConfiguration", "<init>", "I", "Z", ROOT + ads + "GamConfiguration;", ROOT + ads + "AditudeConfiguration;"), 2, go);
        for (String type : List.of("Offboarding", "Onboarding"))
            returnsVoid(method("configuration/DefaultConfigurationUpdatesLifecycleObserver", type.equals("Offboarding") ? "c" : "d",
                ROOT + "payments/plantransitions/pub/PlanInTransition$Fan;", ROOT + "payments/plantransitions/pub/TransitionType$" + type + ";", "J", "J", "Ljava/lang/String;"), go);
        returnsVoid(method("configuration/DefaultConfigurationUpdatesLifecycleObserver", "a"), false);
        returnsVoid(method("configuration/DefaultConfigurationUpdatesLifecycleObserver", "b"), false);

        // The three /configuration feature switches forced through the extension helper.
        var feature = method("configuration/plans/Feature", "<init>", "Ljava/lang/String;", "Z", "Ljava/util/List;");
        var forced = code(feature).get(0);
        boolean forces = forced.getOpcode() == Opcode.INVOKE_STATIC &&
            ((ReferenceInstruction) forced).getReference() instanceof MethodReference forcedReference &&
            forcedReference.getDefiningClass().equals("Lnl/johninnl/soundcloud/GoPlus;") &&
            forcedReference.getName().equals("feature");
        check(forces == go, "Go feature switches forced through the extension helper");
        if (go) {
            // The constructor has no local registers: the helper takes p1/p2 and move-result writes p2 back.
            var call = (Instruction35c) forced;
            int words = 4; // this + String + Z + List
            int p1 = feature.getImplementation().getRegisterCount() - words + 1;
            check(call.getRegisterC() == p1 && call.getRegisterD() == p1 + 1, "helper reads the name and enabled parameters");
            var result = code(feature).get(1);
            check(result.getOpcode() == Opcode.MOVE_RESULT && ((OneRegisterInstruction) result).getRegisterA() == p1 + 1,
                "helper result stored back into the enabled parameter");
        }
        check(classes.containsKey("Lnl/johninnl/soundcloud/GoPlus;") == (go || home), "extension merged with its patches");

        // The device limit's two gates read the /configuration device-management state only
        // through the three predicates; each early-returns false with the patch.
        for (String predicate : List.of("isUnauthorized", "isRecoverableBlock", "isUnrecoverableBlock")) {
            var gate = code(method("foundation/domain/configuration/DeviceManagement", predicate));
            check((gate.get(0).getOpcode() == Opcode.CONST_4 &&
                ((NarrowLiteralInstruction) gate.get(0)).getNarrowLiteral() == 0 &&
                gate.get(1).getOpcode() == Opcode.RETURN) == devices, "device gate " + predicate);
        }
        // The sign-in registration handshake returns Optional.empty() instead of running.
        var registration = code(method("onboarding/auth/DefaultSignInOperations", "b", "Z",
            ROOT + "api/oauth/Token;"));
        boolean skips = registration.get(0).getOpcode() == Opcode.INVOKE_STATIC &&
            ((ReferenceInstruction) registration.get(0)).getReference() instanceof MethodReference skipped &&
            skipped.getDefiningClass().equals("Lcom/soundcloud/java/optional/Optional;") &&
            skipped.getName().equals("a") &&
            registration.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT &&
            registration.get(2).getOpcode() == Opcode.RETURN_OBJECT;
        check(skips == devices, "sign-in registration handshake skipped");
        System.out.println("PASS emitted DEX: " + names);
    }
}
