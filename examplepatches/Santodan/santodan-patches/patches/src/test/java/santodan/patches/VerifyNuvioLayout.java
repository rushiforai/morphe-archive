package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import software.santodan.extension.nuviomerged.NuvioProviderLayout;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/** Checks every hook on real local DEX inputs, plus reflection-only runtime contracts. */
public final class VerifyNuvioLayout {
    private static final Map<String, MutableClass> classes = new HashMap<>();
    private static final Set<ClassDef> used = new HashSet<>();
    private static MutableClass owner(String type) {
        MutableClass result = classes.get(type);
        if (result == null) throw new AssertionError("Missing class: " + type);
        used.add(result);
        return result;
    }
    private static void method(String type, String name, int count) {
        long matches = owner(type).getMethods().stream().filter(m -> m.getName().equals(name)
            && m.getParameterTypes().size() == count).count();
        if (matches != 1) throw new AssertionError("Ambiguous/missing runtime method: " + type + "->" + name);
    }
    private static void field(String type, String name, String expected) {
        for (Field f : owner(type).getFields())
            if (f.getName().equals(name) && f.getType().equals(expected)) return;
        throw new AssertionError("Missing runtime field: " + type + "->" + name + ":" + expected);
    }

    private static void progressFlow(String provider, String accessor) {
        for (Method method : owner(provider).getMethods()) {
            if (!accessor.equals(method.getName()) || !method.getParameterTypes().isEmpty()) continue;
            for (var ins : method.getImplementation().getInstructions()) {
                if (!(ins instanceof ReferenceInstruction)) continue;
                var reference = ((ReferenceInstruction) ins).getReference();
                if (reference instanceof FieldReference) {
                    FieldReference field = (FieldReference) reference;
                    // In both real Trakt implementations, f is the progress-list flow;
                    // beta4 q instead returns g, the Boolean remote-loaded StateFlow.
                    if ("f".equals(field.getName()) && "Lkotlinx/coroutines/flow/Flow;".equals(field.getType())) return;
                }
            }
        }
        throw new AssertionError("Accessor does not carry Trakt progress lists: " + provider + "->" + accessor);
    }
    private static void hook(String name, Class<?>[] types, Object... args) throws Exception {
        java.lang.reflect.Method method = NuvioMergedProgressPatch.class.getDeclaredMethod(name, types);
        method.setAccessible(true);
        try { method.invoke(null, args); }
        catch (InvocationTargetException error) { throw new AssertionError(name, error.getCause()); }
        System.out.println("PASS: " + name);
    }
    private static void hook(String name, MutableClass target) throws Exception {
        hook(name, new Class<?>[]{MutableClass.class}, target);
    }
    public static void main(String[] args) throws Exception {
        String version = args[0];
        boolean newer = NuvioLayout.beta4(version);
        File[] inputs = new File(args[1]).listFiles((dir, name) -> name.matches("classes.*\\.dex"));
        if (inputs == null || inputs.length == 0) throw new AssertionError("No local DEX inputs");
        for (File input : inputs) try (InputStream in = new BufferedInputStream(new FileInputStream(input))) {
            for (ClassDef c : DexBackedDexFile.fromInputStream(null, in).getClasses())
                classes.put(c.getType(), new MutableClass(c));
        }
        String repository = NuvioLayout.type(version, "Lja/md;");
        String provider = NuvioLayout.type(version, "Lca/a0;");
        NuvioProviderLayout runtime = NuvioProviderLayout.forRepository(
            repository.substring(1, repository.length() - 1).replace('/', '.'));
        if (!provider.equals("L" + runtime.providerInterface.replace('.', '/') + ";"))
            throw new AssertionError("Runtime provider interface differs from patch layout");
        progressFlow(newer ? "Lv9/ib;" : "Lja/tb;", runtime.allProgressMethod);
        method(provider, runtime.allProgressMethod, 0);
        if (newer) {
            boolean rejected = false;
            try { progressFlow("Lv9/ib;", "q"); }
            catch (AssertionError expected) { rejected = true; }
            if (!rejected) throw new AssertionError("Boolean remote-loaded flow accepted as progress");
        }
        System.out.println("PASS: runtime uses progress lists and rejects beta4's Boolean flow");
        String registry = NuvioLayout.type(version, "Lca/b0;");
        field(repository, "k", registry);
        String localStore = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("a")) localStore = f.getType();
        field(localStore, "q", "Lkotlinx/coroutines/flow/Flow;");
        for (String accessor : List.of("a", "b", "f", "q")) method(provider, accessor, 0);
        for (String accessor : List.of("d", "j")) method(provider, accessor, 0);
        method(provider, "g", 1);
        method(provider, runtime.siblingsMethod, 1);
        String watchedStore = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("e")) watchedStore = f.getType();
        field(watchedStore, runtime.localWatchedField, "Lkotlinx/coroutines/flow/Flow;");
        String profileType = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("j")) profileType = f.getType();
        field(profileType, "f", "Lkotlinx/coroutines/flow/StateFlow;");
        String watchedModel = "Lcom/nuvio/tv/domain/model/WatchedItem;";
        method(watchedModel, "<init>", 11);
        for (String getter : List.of("getContentId", "getContentType", "getTitle", "getSeason",
            "getEpisode", "getWatchedAt", "getPoster", "getReleaseInfo", "getTrackingProviderId",
            "getTrackingProviderItemId", "getTrackingSourceUrl")) method(watchedModel, getter, 0);
        System.out.println("PASS: profile cache key and watched-item serialization contracts");
        method(registry, "b", 0);
        String model = newer ? "Lla/aa;" : "Lza/s8;";
        for (String name : List.of("a", "c")) field(model, name, "Ljava/lang/String;");
        for (String name : List.of("h", "i")) field(model, name, "I");
        for (String name : List.of("x", "y")) field(model, name, "Ljava/lang/Integer;");
        field(newer ? "Lba/e2;" : "Lpa/q0;", "r", "Ljava/lang/String;");
        method(newer ? "Lsa/eb;" : "Lfb/h3;", newer ? "m" : "t", newer ? 13 : 7);
        method(newer ? "Lx5/g2;" : "Lx5/i2;", "b", 19);
        method(newer ? "Lg1/j;" : "Lg1/h;", newer ? "r" : "s", 1);
        for (String type : List.of(newer ? "Lva/x0;" : "Lib/x0;",
                newer ? "Lx5/i2;" : "Lx5/k2;", newer ? "Lva/l0;" : "Lib/l0;",
                newer ? "Lba/d3;" : "Lpa/g1;", "Lw1/n;", "Ld2/g0;")) owner(type);
        if (newer) {
            field("Lw1/b;", "h", "Lw1/i;");
            method("Le0/v;", "a", 2);
            field("Le0/v;", "a", "Le0/v;");
        }
        System.out.println("PASS: reflection contracts for " + version);
        if (newer) {
            method("Lw1/v;", "<init>", 1);
            method("Lw1/q;", "d", 1);
            boolean zIndex = false;
            for (Method m : owner("Lw1/v;").getMethods()) if ("toString".equals(m.getName()))
                for (var i : m.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction
                    && ((ReferenceInstruction)i).getReference().toString().contains("ZIndexElement(zIndex=")) zIndex = true;
            if (!zIndex) throw new AssertionError("Badge overlay modifier is not ZIndexElement");
        }
        hook("hookRepository", owner(repository));
        if (newer) {
            hook("hookInlinedCutoff", owner("Lla/h5;"));
            hook("hookInlinedCutoff", owner("Lla/w1;"));
            NuvioMergedProgressPatch.hookBadgeCacheHit(owner("Lla/e5;"));
            NuvioMergedProgressPatch.hookBadgeGroupProgress(owner("Lla/t5;"));
            field("Lla/z3;", "V0", "Ljava/util/Set;");
            field("Lla/z3;", "u", "Lcom/nuvio/tv/data/local/vc;");
            field("Lcom/nuvio/tv/data/local/vc;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lcom/nuvio/tv/data/local/vc;", "g", "Ljava/util/Map;");
            System.out.println("PASS: unchanged-ID badge retry and incremental metadata publication hooks");
        } else hook("hookMergedProviderPolicies", owner(repository));
        hook("hookInlinedNextUpSeedPolicy", owner(NuvioLayout.type(version, "Lza/z4;")));
        hook("hookMergedProvider", owner(NuvioLayout.type(version, "Lja/cc;")));
        hook("hookEffectiveSource", owner(NuvioLayout.type(version, "La/a;")));
        hook("hookWatchProgressEnum", owner(NuvioLayout.type(version, "Lcom/nuvio/tv/data/local/rb;")));
        if (!newer) hook("hookWatchProgressPicker", new Class<?>[]{MutableClass.class, String.class, String.class},
            owner("Lfb/h3;"), "W0", "Lfb/sj;");
        else {
            NuvioMergedProgressPatch.hookSettingsStore(owner("Lo9/a1;"));
            field("Lp8/e;", "w3", "Lnb/c;");
            verifyCoordinatorProvider(owner("Lp8/f;"));
            NuvioMergedProgressPatch.hookSettingsComponent(owner("Lp8/e;"));
            verifyComponentRegistration(owner("Lp8/e;"));
        }
        hook("hookWatchProgressSelection", owner(NuvioLayout.type(version, "Lfb/c2;")));
        hook("hookWatchProgressSummary", new Class<?>[]{MutableClass.class, String.class},
            owner(NuvioLayout.type(version, "Lfb/lj;")), newer ? "g1" : "W0");
        NuvioRemainingEpisodesPatch.hookNextUpModel(owner(model));
        NuvioRemainingEpisodesPatch.hookEpisodeSets(owner(NuvioLayout.type(version, "Lza/z4;")),
            newer ? "Lla/z3;" : "Lza/k3;");
        if (newer) verifyRemainingAiredMap(owner("Lla/t5;"));
        if (!newer) NuvioRemainingEpisodesPatch.hookSettings(owner("Lfb/t6;"), 0x7f1106a7);
        NuvioRemainingEpisodesPatch.hookCard(owner(newer ? "Lba/e2;" : "Lpa/q0;"),
            newer ? "Lc7/a;" : "Lfb/jk;");
        System.out.println("PASS: remaining-episode hooks");
        if (newer) {
            NuvioAiringSeriesPatch.hookNextUpModel(owner(model));
            NuvioAiringSeriesPatch.hookUpcomingSplit(owner("Lla/t5;"));
            verifyAiringSplitCall(owner("Lla/t5;"));
            NuvioAiringSeriesPatch.hookCard(owner("Lba/e2;"), "Lc7/a;");
            NuvioAiringSeriesPatch.hookWide(owner("Lba/d3;"));
            System.out.println("PASS: standalone airing-series hooks");
            field("Lba/n3;", "m", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            field("Lba/q1;", "o", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            for (String getter : List.of("getApiType", "getImdbId", "getId"))
                method("Lcom/nuvio/tv/domain/model/MetaPreview;", getter, 0);
            NuvioFinaleDatesPatch.hookItems(owner("Lba/i1;"));
            NuvioFinaleDatesPatch.hookCard(owner("Lba/n3;"));
            NuvioFinaleDatesPatch.hookCard(owner("Lba/q1;"));
            for (String type : List.of("Lba/n3;", "Lba/q1;", "Lba/o3;", "Lba/s1;"))
                NuvioFinaleDatesPatch.hookContext(owner(type));
            System.out.println("PASS: library and collection finale-date hooks");
            method("Lg0/i;", "q", 4);
            method("Lq1/s;", "<init>", 3);
            method("Lsa/kc;", "a", 11);
            field("Lo9/a1;", "k", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lo9/a1;", "j", "Le9/f;");
            field("Le9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            method("Lo9/a1;", "f", 2);
            NuvioSettingsMenuPatch.hookLayoutList(owner("Lja/n;"));
            verifyMenuRelocation(owner("Lja/n;"), owner("Lsa/o3;"));
            System.out.println("PASS: shared native Layout submenu and merged settings persistence contracts");
        }

        File output = new File(args[2]);
        output.getParentFile().mkdirs();
        DexPool.writeTo(output.getPath(), new ImmutableDexFile(Opcodes.getDefault(), used));
        try (InputStream in = new BufferedInputStream(new FileInputStream(output))) {
            DexBackedDexFile reloaded = DexBackedDexFile.fromInputStream(null, in);
            if (reloaded.getClasses().size() != used.size()) throw new AssertionError("DEX round trip changed class count");
        }
        System.out.println("PASS: modified DEX writes and reloads");
    }

    private static void verifyCoordinatorProvider(MutableClass provider) {
        for (Method method : provider.getMethods()) {
            if (!method.getName().equals("get")) continue;
            List<Instruction> instructions = new ArrayList<>();
            method.getImplementation().getInstructions().forEach(instructions::add);
            for (int i = 0; i + 4 < instructions.size(); i++) {
                if (!(instructions.get(i) instanceof ReferenceInstruction)) continue;
                if (!((ReferenceInstruction) instructions.get(i)).getReference().toString().equals("Lp8/e;->w3:Lnb/c;")) continue;
                if (instructions.get(i + 4) instanceof ReferenceInstruction &&
                    ((ReferenceInstruction) instructions.get(i + 4)).getReference().toString().equals("Lo9/a1;")) return;
            }
        }
        throw new AssertionError("Native tracking settings no longer resolve the w3 coordinator provider");
    }

    private static void verifyComponentRegistration(MutableClass component) {
        int calls = 0;
        for (Method method : component.getMethods()) {
            if (!method.getName().equals("<init>")) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (!(instruction instanceof ReferenceInstruction) || !((ReferenceInstruction) instruction).getReference()
                    .toString().contains("->registerSettingsComponent(")) continue;
                com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction call =
                    (com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) instruction;
                if (call.getStartRegister() != method.getImplementation().getRegisterCount() - 2 || call.getRegisterCount() != 1)
                    throw new AssertionError("Settings component registration uses the wrong receiver");
                calls++;
            }
        }
        if (calls != 1) throw new AssertionError("Settings component was not registered exactly once");
    }

    private static void verifyMenuRelocation(MutableClass list, MutableClass settings) {
        int menus = 0;
        for (Method method : list.getMethods()) {
            if (method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions())
                if (NuvioAiringSeriesPatch.calls(instruction, NuvioSettingsMenuPatch.EXTENSION, "addMenu")) menus++;
        }
        if (menus != 1) throw new AssertionError("Shared Layout menu was not installed exactly once");
        for (Method method : settings.getMethods()) {
            if (method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (!(instruction instanceof ReferenceInstruction)) continue;
                String reference = ((ReferenceInstruction) instruction).getReference().toString();
                if (reference.contains("software/santodan/extension/") && reference.contains("renderSettings"))
                    throw new AssertionError("Patch setting remains in its original section");
            }
        }
    }

    private static void verifyAiringSplitCall(MutableClass owner) {
        for (Method method : owner.getMethods()) {
            if (!"E".equals(method.getName()) || method.getParameterTypes().size() != 2) continue;
            for (var instruction : method.getImplementation().getInstructions()) {
                if (!(instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction)
                    || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (!(reference instanceof com.android.tools.smali.dexlib2.iface.reference.MethodReference)) continue;
                var called = (com.android.tools.smali.dexlib2.iface.reference.MethodReference) reference;
                if (!called.getDefiningClass().contains("NuvioAiringSeries") || !"effectiveHasAired".equals(called.getName())) continue;
                var invoke = (com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction) instruction;
                if (called.getParameterTypes().size() != 1
                    || !"Ljava/lang/Object;".contentEquals(called.getParameterTypes().get(0)))
                    throw new AssertionError("Airing split bridge descriptor has unsafe register types");
                System.out.println("PASS: airing split bridge consumes the model before v"
                    + invoke.getRegisterC() + " is overwritten with the boolean result");
                return;
            }
        }
        throw new AssertionError("Airing split bridge call not found");
    }

    private static void verifyRemainingAiredMap(MutableClass owner) {
        for (Method method : owner.getMethods()) {
            if (!"g".equals(method.getName()) || method.getParameterTypes().size() != 2) continue;
            Instruction first = method.getImplementation().getInstructions().iterator().next();
            if (first instanceof ReferenceInstruction) {
                Object reference = ((ReferenceInstruction) first).getReference();
                if (reference instanceof FieldReference && "Lla/z3;".equals(((FieldReference) reference).getDefiningClass())
                    && "T0".equals(((FieldReference) reference).getName())) return;
            }
        }
        throw new AssertionError("Remaining hook does not read beta4's aired-episode map T0");
    }

}
