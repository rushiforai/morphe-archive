package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import software.santodan.extension.nuviomerged.NuvioProviderLayout;
import software.santodan.extension.nuviomerged.NuvioMergePolicy;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/** Checks beta.8 hooks on original DEX, including the extension reflection contracts. */
public final class VerifyNuvioBeta8 {
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
        verifyMergeNavigation();
        String version = args[0];
        if (!NuvioLayout.BETA8.equals(version)) throw new AssertionError("This verifier targets beta.8 only");
        NuvioRemainingEpisodesPatch.validateTarget("com.nuvio.tv", version);
        for (String[] invalid : new String[][]{{"wrong.package", version}, {"com.nuvio.tv", "1.1.0-beta.999"}, {"com.nuvio.tv", "1.1.0-beta.2"}, {"com.nuvio.tv", "1.1.0-beta.4"}, {"com.nuvio.tv", "1.1.0-beta.5"}, {"com.nuvio.tv", "1.1.0-beta.6"}}) {
            boolean rejected = false;
            try { NuvioRemainingEpisodesPatch.validateTarget(invalid[0], invalid[1]); }
            catch (IllegalStateException expected) { rejected = true; }
            if (!rejected) throw new AssertionError("Invalid patch execution target accepted");
        }
        NuvioLayout.use(version);
        System.out.println("PASS: remaining-episode execution accepts supported targets and rejects invalid targets");
        boolean newer = NuvioLayout.modern(version);
        File[] inputs = new File(args[1]).listFiles((dir, name) -> name.matches("classes.*\\.dex"));
        if (inputs == null || inputs.length == 0) throw new AssertionError("No local DEX inputs");
        for (File input : inputs) try (InputStream in = new BufferedInputStream(new FileInputStream(input))) {
            for (ClassDef c : DexBackedDexFile.fromInputStream(null, in).getClasses())
                classes.put(c.getType(), new MutableClass(c));
        }
        verifyRuntimeSignatures();
        field("Lxa/s3;", "i1", "Lkotlinx/coroutines/Job;");
        field("Lba/pc;", "a", "Lba/jb;");
        field("Lba/jb;", "T", "Z");
        method("Lc/j;", "getFullyDrawnReporter", 0);
        field("Lc/m;", "c", "Ljava/lang/Object;");
        field("Lc/m;", "f", "Z");
        field("Lc/m;", "g", "Ljava/util/ArrayList;");
        if (owner("Lc/j;").getMethods().stream().filter(m -> m.getName().equals("getFullyDrawnReporter"))
                .noneMatch(m -> m.getReturnType().equals("Lc/m;")))
            throw new AssertionError("Home presentation reporter return type changed");
        System.out.println("PASS: original beta.8 fully-drawn reporter and deferred startup contracts");
        String repository = "Lba/re;";
        String provider = "Lq9/z;";
        NuvioProviderLayout runtime = NuvioProviderLayout.forRepository(
            repository.substring(1, repository.length() - 1).replace('/', '.'));
        if (!provider.equals("L" + runtime.providerInterface.replace('.', '/') + ";"))
            throw new AssertionError("Runtime provider interface differs from patch layout");
        progressFlow("Lba/pc;", runtime.allProgressMethod);
        method(provider, runtime.allProgressMethod, 0);
        {
            boolean rejected = false;
            try { progressFlow("Lba/pc;", "p"); }
            catch (AssertionError expected) { rejected = true; }
            if (!rejected) throw new AssertionError("Boolean remote-loaded flow accepted as progress");
        }
        System.out.println("PASS: runtime uses progress lists and rejects beta4's Boolean flow");
        String registry = "Lq9/a0;";
        field(repository, "k", registry);
        String localStore = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("a")) localStore = f.getType();
        field(localStore, "q", "Lkotlinx/coroutines/flow/Flow;");
        for (String accessor : List.of("a", "b", "f", "q")) method(provider, accessor, 0);
        for (String accessor : List.of("d", "j")) method(provider, accessor, 0);
        method(provider, "g", 1);
        method(provider, runtime.siblingsMethod, 1);
        {
            String rowOwner = "Lfb/nd;";
            method(rowOwner, "a", 18);
            method(rowOwner, "j", 11);
            String playbackRows = "Lfb/mc;";
            method(playbackRows, "b", 9);
            method(playbackRows, "c", 9);
            method(playbackRows, "h", 14);
            method("Le2/z;", "<init>", 1);
            field("Li3/r0;", "a", "Li3/h0;");
            field("Li3/h0;", "b", "J");
            String picker = "Lfb/wd;";
            method(picker, "<init>", 6);
            for (String alignment : List.of("a", "b", "c", "d", "e", "f", "g", "h", "i"))
                field("Lx1/b;", alignment, "Lx1/i;");
            System.out.println("PASS: native date-label settings, pickers and nine alignments");
        }
        method(provider, runtime.refreshMethod, 2);
        var refresh = owner(provider).getMethods().stream()
            .filter(m -> m.getName().equals(runtime.refreshMethod) && m.getParameterTypes().size() == 2)
            .findFirst().orElseThrow();
        String refreshIntent = refresh.getParameterTypes().get(0).toString();
        owner(refreshIntent);
        if (!refresh.getParameterTypes().get(1).equals("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"))
            throw new AssertionError("Native refresh continuation changed");
        System.out.println("PASS: native provider refresh contract");
        String watchedStore = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("e")) watchedStore = f.getType();
        field(watchedStore, runtime.localWatchedField, "Lkotlinx/coroutines/flow/Flow;");
        String profileType = null;
        for (Field f : owner(repository).getFields()) if (f.getName().equals("j")) profileType = f.getType();
        field(profileType, "f", "Lkotlinx/coroutines/flow/StateFlow;");
        String watchedModel = "Lcom/nuvio/tv/domain/model/WatchedItem;";
        method("Lcom/nuvio/tv/domain/model/WatchProgress;", "isCompleted$default", 4);
        method("Lcom/nuvio/tv/domain/model/WatchProgress;", "<init>", 26);
        field("Lcom/nuvio/tv/domain/model/WatchProgress;", "SOURCE_REMOTE_HISTORY", "Ljava/lang/String;");
        method(watchedModel, "<init>", 11);
        for (String getter : List.of("getContentId", "getContentType", "getTitle", "getSeason",
            "getEpisode", "getWatchedAt", "getPoster", "getReleaseInfo", "getTrackingProviderId",
            "getTrackingProviderItemId", "getTrackingSourceUrl")) method(watchedModel, getter, 0);
        System.out.println("PASS: profile cache key and watched-item serialization contracts");
        method(registry, "b", 0);
        String model = "Lxa/i9;";
        for (String name : List.of("a", "c")) field(model, name, "Ljava/lang/String;");
        for (String name : List.of("h", "i")) field(model, name, "I");
        for (String name : List.of("x", "y")) field(model, name, "Ljava/lang/Integer;");
        field("Lma/s0;", "r", "Ljava/lang/String;");
        method("Lfb/nd;", "m", 13);
        method("Ly5/e2;", "b", 19);
        method("Lh1/h;", "t", 1);
        for (String type : List.of("Lib/x0;",
                "Ly5/g2;", "Lib/l0;",
                "Lma/j1;", "Lx1/n;", "Le2/g0;")) owner(type);
        {
            field("Lx1/b;", "h", "Lx1/i;");
            method("Le0/v;", "a", 2);
            field("Le0/v;", "a", "Le0/v;");
        }
        String composerType = "Lh1/k0;";
        method(composerType, "d0", 1);
        method(composerType, "p", 1);
        System.out.println("PASS: isolated badge composition group start/end contracts");
        System.out.println("PASS: reflection contracts for " + version);
        {
            method("Lx1/v;", "<init>", 1);
            method("Lx1/q;", "d", 1);
            boolean zIndex = false;
            for (Method m : owner("Lx1/v;").getMethods()) if ("toString".equals(m.getName()))
                for (var i : m.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction
                    && ((ReferenceInstruction)i).getReference().toString().contains("ZIndexElement(zIndex=")) zIndex = true;
            if (!zIndex) throw new AssertionError("Badge overlay modifier is not ZIndexElement");
        }
        hook("hookRepository", owner(repository));
        if (newer) {
            verifyMergeHooks();
            NuvioNativeSyncBanner.hookRoot(owner("Lq8/l;"));
            NuvioNativeSyncBanner.hookBanner(owner("Lmb/a;"));
            NuvioMergedProgressPatch.hookNavigation(owner("Lq8/l;"));
            NuvioMergedProgressPatch.hookActivity(owner("Lcom/nuvio/tv/MainActivity;"));
            NuvioMergedProgressPatch.hookPlaybackScrobblers(owner("Lq9/h0;"));
            NuvioMergedProgressPatch.hookLocalProgressWrites(owner(repository));
            field("Lm5/y;", "F", "Lkotlinx/coroutines/flow/SharedFlow;");
            field("Lm5/m;", "e", "Lm5/g0;");
            field("Lm5/g0;", "o", "Ljava/lang/String;");
            method("Lq9/s0;", "a", 0);
            method("Lfb/ve;", "a", 11);
            method("Lfb/ve;", "d", 6);
            method("Lfb/nd;", "j", 11);
            method("Lfb/nd;", "g", 12);
            method("Lfb/nd;", "d", 7);
            method("Lfb/nd;", "e", 5);
            method("Lfb/ve;", "b", 6);
            method("Lfb/wd;", "<init>", 6);
            method("Lma/y1;", "z", 19);
            method("Le0/b;", "a", 6);
            method("Le0/q;", "a", 3);
            method("Landroidx/compose/foundation/layout/b;", "f", 2);
            method("Landroidx/compose/foundation/layout/b;", "h", 2);
            method("Ll0/g;", "b", 1);
            field("Lib/x0;", "a", "Lh1/c3;");
            field("Lib/e;", "h", "J");
            field("Lib/e;", "e", "J");
            NuvioRemainingEpisodesPatch.hookCard(owner("Lma/s0;"), "Lc7/a;",
                "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;", "prepareProviderBadge", "renderProviderBadge");
            field("Lma/s0;", "x", "Lcom/nuvio/tv/domain/model/WatchProgress;");
            String nextCard = "Lxa/f0;";
            field("Lma/s0;", "y", nextCard);
            field("Lxa/e0;", "a", "Lxa/i9;");
            field("Lx1/b;", "i", "Lx1/i;");
            field("Lv2/l;", "b", "Lv2/b1;");
            method("Lg0/t;", "b", 15);
            method("Landroidx/compose/foundation/layout/b;", "n", 2);
            method("Le0/b;", "u", 2);
            method("Ly/m;", "g", 3);
            System.out.println("PASS: merged provider badge identity, image, size, and bottom-right alignment contracts");
            hook("hookInlinedCutoff", owner("Lxa/v4;"));
            hook("hookInlinedCutoff", owner("Lfb/z8;"));
            NuvioMergedProgressPatch.hookBadgeCacheHit(owner("Lba/d2;"));
            NuvioMergedProgressPatch.hookBadgeGroupProgress(owner("Lxa/h5;"));
            field("Lxa/s3;", "X0", "Ljava/util/Set;");
            field("Lxa/s3;", "u", "Lcom/nuvio/tv/data/local/qc;");
            field("Lcom/nuvio/tv/data/local/qc;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lcom/nuvio/tv/data/local/qc;", "g", "Ljava/util/Map;");
            System.out.println("PASS: unchanged-ID badge retry and incremental metadata publication hooks");
        } else hook("hookMergedProviderPolicies", owner(repository));
        hook("hookInlinedNextUpSeedPolicy", owner("Lxa/h5;"));
        hook("hookMergedProvider", owner("Lba/ad;"));
        hook("hookEffectiveSource", owner("Ln5/w;"));
        hook("hookWatchProgressEnum", owner("Lcom/nuvio/tv/data/local/wb;"));
        if (!newer) hook("hookWatchProgressPicker", new Class<?>[]{MutableClass.class, String.class, String.class},
            owner("Lfb/h3;"), "W0", "Lfb/sj;");
        else {
            NuvioMergedProgressPatch.hookSettingsStore(owner("Lq9/a1;"));
            field("Lq8/e;", "R3", "Lac/c;");
            verifyCoordinatorProvider(owner("Lq8/f;"));
            NuvioMergedProgressPatch.hookSettingsComponent(owner("Lq8/e;"));
            verifyComponentRegistration(owner("Lq8/e;"));
        }
        hook("hookWatchProgressSelection", owner("Lfb/ec;"));
        hook("hookWatchProgressSummary", new Class<?>[]{MutableClass.class, String.class},
            owner("Lfb/yi;"), "z");
        NuvioRemainingEpisodesPatch.hookNextUpModel(owner(model));
        NuvioRemainingEpisodesPatch.hookEpisodeSets(owner("Lxa/h5;"),
            "Lxa/s3;");
        if (newer) verifyRemainingAiredMap(owner("Lxa/h5;"));

        NuvioRemainingEpisodesPatch.hookCard(owner("Lma/s0;"),
            "Lc7/a;");
        System.out.println("PASS: remaining-episode hooks");
        {
            NuvioAiringSeriesPatch.hookNextUpModel(owner(model));
            NuvioAiringSeriesPatch.hookUpcomingSplit(owner("Lxa/h5;"));
            verifyAiringSplitCall(owner("Lxa/h5;"));
            NuvioAiringSeriesPatch.hookCard(owner("Lma/s0;"), "Lc7/a;");
            NuvioAiringSeriesPatch.hookWide(owner("Lma/j1;"));
            System.out.println("PASS: standalone airing-series hooks");
            field("Lma/u1;", "m", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            field("Lma/k0;", "o", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            for (String getter : List.of("getApiType", "getImdbId", "getId", "getReleased", "getReleaseInfo"))
                method("Lcom/nuvio/tv/domain/model/MetaPreview;", getter, 0);
            for (String type : NuvioFinaleDatesPatch.itemOwners()) NuvioFinaleDatesPatch.hookItems(owner(type));
            NuvioFinaleDatesPatch.hookCard(owner("Lma/u1;"));
            NuvioFinaleDatesPatch.hookCard(owner("Lma/k0;"));
            for (String type : List.of("Lma/u1;", "Lma/k0;", "Lma/v1;", "Lma/l0;"))
                NuvioFinaleDatesPatch.hookContext(owner(type));
            System.out.println("PASS: library and collection finale-date hooks");
            for (String type : NuvioFinaleDatesPatch.itemOwners()) NuvioFinaleDatesPatch.hookItems(owner(type), NuvioMovieReleaseDatesPatch.EXTENSION);
            NuvioFinaleDatesPatch.hookCard(owner("Lma/u1;"), NuvioMovieReleaseDatesPatch.EXTENSION);
            NuvioFinaleDatesPatch.hookCard(owner("Lma/k0;"), NuvioMovieReleaseDatesPatch.EXTENSION);
            for (String type : List.of("Lma/u1;", "Lma/k0;", "Lma/v1;", "Lma/l0;"))
                NuvioFinaleDatesPatch.hookContext(owner(type), NuvioMovieReleaseDatesPatch.EXTENSION);
            System.out.println("PASS: movie release hooks coexist with series finale hooks");
            method("Lg0/j;", "q", 4);
            method("Lr1/s;", "<init>", 3);
            method("Lfb/ve;", "a", 11);
            method("Lfb/ve;", "e", 6);
            String streamRepository = "Lba/a5;";
            method(streamRepository, "l", 5);
            field(streamRepository, "e", "Lg9/f;");
            field(streamRepository, "l", "Lkotlinx/coroutines/flow/MutableStateFlow;");
            field("Lq8/e;", "e3", "Lac/c;");
            field("Lq8/e;", "B", "Lac/c;");
            field("Lg9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lb9/l;", "a", "Ljava/lang/Object;");
            method("Lcom/nuvio/tv/domain/model/AddonStreams;", "getStreams", 0);
            String detailModel = "Lwa/q7;";
            method(detailModel, "u", 0);
            field(detailModel, "G", "Lkotlinx/coroutines/flow/StateFlow;");
            String detailState = "Lwa/h6;";
            field(detailState, "b", "Lcom/nuvio/tv/domain/model/Meta;");
            field(detailState, "h", "Lcom/nuvio/tv/domain/model/NextToWatch;");
            field(detailState, "f", "Ljava/util/List;");
            method("Lwa/p0;", "C", 3);
            for (String getter : List.of("getNextVideoId", "getNextSeason", "getNextEpisode", "getWatchProgress"))
                method("Lcom/nuvio/tv/domain/model/NextToWatch;", getter, 0);
            for (String getter : List.of("getId", "getSeason", "getEpisode"))
                method("Lcom/nuvio/tv/domain/model/Video;", getter, 0);
            field("Lma/s0;", "x", "Lcom/nuvio/tv/domain/model/WatchProgress;");
            field("Lma/s0;", "y", "Lxa/f0;");
            NuvioStreamPreloadPatch.hookComponent(owner("Lq8/e;"));
            NuvioStreamPreloadPatch.hookContinueWatching(owner("Lma/s0;"));
            NuvioStreamPreloadPatch.hookDetails(owner(detailModel));
            String playerModel = "Lab/qm;";
            String playerController = "Lab/mc;";
            String playerState = "Lab/nm;";
            String nextInfo = "Lab/s4;";
            field(playerModel, "Y", playerController);
            NuvioStreamPreloadPatch.validatePlayerState(owner(playerModel));
            MutableClass wrongState = new MutableClass(owner(playerModel));
            wrongState.getMethods().removeIf(m -> m.getName().equals("e") && m.getParameterTypes().isEmpty());
            boolean missingStateRejected = false;
            try { NuvioStreamPreloadPatch.validatePlayerState(wrongState); }
            catch (IllegalStateException expected) { missingStateRejected = true; }
            if (!missingStateRejected) throw new AssertionError("Missing player state accepted with void f() present");
            field(playerController, "F0", "Lkotlinx/coroutines/flow/StateFlow;");
            for (String name : List.of("a", "b", "c")) field(playerState, name, "Z");
            for (String name : List.of("g", "C0", "j1")) field(playerState, name, "Ljava/lang/String;");
            field(playerState, "v1", nextInfo);
            field(playerState, "d", "Lab/x9;");
            field(nextInfo, "a", "Ljava/lang/String;");
            field(nextInfo, "g", "Ljava/lang/String;");
            field(nextInfo, "h", "Z");
            field(nextInfo, "i", "Ljava/lang/Boolean;");
            field(nextInfo, "b", "I");
            field(nextInfo, "c", "I");
            String pluginSearch = "Lba/q4;";
            field(pluginSearch, "o", streamRepository);
            for (String name : List.of("p", "q")) field(pluginSearch, name, "Ljava/lang/String;");
            for (String name : List.of("r", "s")) field(pluginSearch, name, "Ljava/lang/Integer;");
            NuvioStreamPreloadPatch.hookPlayer(owner(playerModel));
            NuvioStreamPreloadPatch.hookNextEpisodePluginPause(owner(pluginSearch));
            String nextTransition = "Lab/xg;";
            method("Lab/fh;", "E", 3);
            NuvioStreamPreloadPatch.hookNextEpisodePicker(owner(nextTransition));
            for (Runnable duplicate : List.<Runnable>of(
                    () -> NuvioStreamPreloadPatch.hookPlayer(owner(playerModel)),
                    () -> NuvioStreamPreloadPatch.hookNextEpisodePluginPause(owner(pluginSearch)),
                    () -> NuvioStreamPreloadPatch.hookNextEpisodePicker(owner(nextTransition)))) {
                boolean rejected = false;
                try { duplicate.run(); } catch (IllegalStateException expected) { rejected = true; }
                if (!rejected) throw new AssertionError("Duplicate next-episode hook accepted");
            }
            System.out.println("PASS: next-episode player hooks, playback-state contracts and scoped local-scraper pause hook");
            boolean duplicateStreamHookRejected = false;
            try { NuvioStreamPreloadPatch.hookContinueWatching(owner("Lma/s0;")); }
            catch (IllegalStateException expected) { duplicateStreamHookRejected = true; }
            if (!duplicateStreamHookRejected) throw new AssertionError("Duplicate stream hook accepted");
            System.out.println("PASS: stream preload hooks, native cache/profile contracts, and duplicate rejection");
            field("Lq9/a1;", "k", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lq9/a1;", "j", "Lg9/f;");
            field("Lg9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            method("Lq9/a1;", "f", 2);
            NuvioSettingsMenuPatch.hookLayoutList(owner("Lab/tr;"));
            verifyMenuRelocation(owner("Lab/tr;"), owner("Lfb/mc;"));
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

    private static void verifyRuntimeSignatures() {
        var factory = owner("Lh1/h;");
        var streams = owner("Lba/a5;");
        var details = owner("Lwa/p0;");
        NuvioStreamPreloadPatch.validateDetailResolver(details);
        rejectParameter(details, "D", 0, "I", NuvioStreamPreloadPatch::validateDetailResolver);
        NuvioSettingsMenuPatch.validateStateFactory(factory);
        NuvioStreamPreloadPatch.validateSearch(streams);
        // Same arity is insufficient: these model the exact failures from device logs.
        rejectParameter(factory, "t", 0, "J", NuvioSettingsMenuPatch::validateStateFactory);
        rejectParameter(streams, "l", 4, "Lkotlin/coroutines/jvm/internal/ContinuationImpl;", NuvioStreamPreloadPatch::validateSearch);
        System.out.println("PASS: exact beta8 state/search signatures; same-arity long and continuation substitutes rejected");
    }
    private static void rejectParameter(MutableClass original, String name, int index, String type,
                                        java.util.function.Consumer<MutableClass> validate) {
        var changed = new MutableClass(original);
        var method = changed.getMethods().stream().filter(m -> m.getName().equals(name)).findFirst().orElseThrow();
        var parameters = new ArrayList<com.android.tools.smali.dexlib2.iface.MethodParameter>(method.getParameters());
        parameters.set(index, new com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(type, Set.of(), null));
        changed.getMethods().remove(method);
        changed.getMethods().add(new app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            new com.android.tools.smali.dexlib2.immutable.ImmutableMethod(original.getType(), name, parameters,
                method.getReturnType(), method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), method.getImplementation())));
        try { validate.accept(changed); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Same-arity incompatible native parameter was accepted: " + name);
    }

    private static void verifyMergeNavigation() {
        NuvioMergePolicy policy = new NuvioMergePolicy();
        if (policy.allowed(false) || policy.allowed(true)) throw new AssertionError("Unknown startup route permitted");
        if (!policy.navigate("home") || !policy.allowed(false)) throw new AssertionError("Home startup blocked");
        long home = policy.revision();
        if (policy.navigate("home") || !policy.current(home, false)) throw new AssertionError("Recomposition retriggers sync");
        policy.navigate("player/{streamUrl}/{title}");
        if (policy.allowed(false) || policy.allowed(true) || policy.current(home, false)) throw new AssertionError("Playback permits merge or stale publication");
        policy.navigate("stream/{videoId}");
        if (policy.allowed(false)) throw new AssertionError("Returning to stream picker starts automatic merge");
        policy.navigate("settings/layout");
        if (policy.allowed(false) || !policy.allowed(true)) throw new AssertionError("Manual sync cannot run in settings");
        long manual = policy.revision();
        policy.foreground(false);
        if (policy.current(manual, true) || policy.allowed(true)) throw new AssertionError("Background/external player permits merge");
        policy.foreground(true);
        if (!policy.allowed(true) || policy.allowed(false)) throw new AssertionError("Settings resume starts automatic merge");
        if (!policy.navigate("home") || !policy.allowed(false)) throw new AssertionError("Home return cannot sync");
        ArrayList<String> connected = new ArrayList<>(List.of("TRAKT", "SIMKL", "MDBLIST"));
        for (String main : List.of("NUVIO_SYNC", "TRAKT", "SIMKL", "MDBLIST")) {
            List<String> expected = main.equals("NUVIO_SYNC") ? List.of() : List.of(main);
            if (!NuvioMergePolicy.scrobblers(connected, true, main, value -> value).equals(expected))
                throw new AssertionError("Playback writes escaped main tracker " + main);
            if (NuvioMergePolicy.scrobblers(connected, false, main, value -> value) != connected)
                throw new AssertionError("Disabled patch changes native dispatcher");
            if (NuvioMergePolicy.syncLocal(true, true, main) != main.equals("NUVIO_SYNC") ||
                !NuvioMergePolicy.syncLocal(true, false, main) || NuvioMergePolicy.syncLocal(false, false, main))
                throw new AssertionError("Nuvio Sync write gating changed native requested state");
        }
        if (connected.size() != 3 || !NuvioMergePolicy.scrobblers(new ArrayList<String>(), true, "TRAKT", value -> value).isEmpty())
            throw new AssertionError("Main routing mutates authentication input or invents a disconnected service");
        System.out.println("PASS: Home/startup gate, manual settings sync, playback/background deferral and stale-publication rejection");
    }

    private static void verifyMergeHooks() {
        for (String name : List.of("C", "D", "A", "B"))
            verifyMergeHook("Lcom/nuvio/tv/data/local/vb;", NuvioMergedProgressPatch::hookLocalOverlay, name);
        for (String name : List.of("p", "q"))
            verifyMergeHook("Lcom/nuvio/tv/data/local/mc;", NuvioMergedProgressPatch::hookLocalOverlay, name);
        verifyMergeHook("Lxa/s3;", NuvioMergedProgressPatch::hookHomePipeline, "b");
        verifyMergeHook("Lq8/l;", NuvioNativeSyncBanner::hookRoot, "invoke");
        verifyMergeHook("Lmb/a;", NuvioNativeSyncBanner::hookBanner, "b");
        verifyMergeHook("Lq8/l;", NuvioMergedProgressPatch::hookNavigation, "invoke");
        verifyMergeHook("Lq9/h0;", NuvioMergedProgressPatch::hookPlaybackScrobblers, "a");
        verifyMergeHook("Lba/re;", NuvioMergedProgressPatch::hookLocalProgressWrites, "E");
        verifyMergeHook("Lcom/nuvio/tv/MainActivity;", NuvioMergedProgressPatch::hookActivity, "onResume");
        System.out.println("PASS: merge navigation, lifecycle, scrobbler and local-write hooks reject missing, ambiguous, changed and already-patched inputs");
    }

    private static void verifyMergeHook(String type, java.util.function.Consumer<MutableClass> apply, String name) {
        MutableClass original = owner(type);
        MutableClass missing = new MutableClass(original);
        missing.getMethods().removeIf(m -> m.getName().equals(name));
        rejectMergeHook(apply, missing);
        MutableClass changed = new MutableClass(original);
        changed.getMethods().stream().filter(m -> m.getName().equals(name)).forEach(m -> {
            if (m.getImplementation() != null) {
                var implementation = m.getImplementation();
                for (int i = implementation.getInstructions().size() - 1; i >= 0; i--)
                    implementation.replaceInstruction(i, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(com.android.tools.smali.dexlib2.Opcode.NOP));
            }
        });
        rejectMergeHook(apply, changed);
        MutableClass ambiguous = new MutableClass(original);
        var target = original.getMethods().stream().filter(m -> m.getName().equals(name)).findFirst().orElseThrow();
        ambiguous.getMethods().add(new app.morphe.patcher.util.proxy.mutableTypes.MutableMethod(
            new com.android.tools.smali.dexlib2.immutable.ImmutableMethod(type, target.getName(), target.getParameters(),
                target.getReturnType().equals("V") ? "Ljava/lang/Object;" : "V", target.getAccessFlags(),
                target.getAnnotations(), target.getHiddenApiRestrictions(), target.getImplementation())));
        rejectMergeHook(apply, ambiguous);
        MutableClass installed = new MutableClass(original);
        apply.accept(installed);
        rejectMergeHook(apply, installed);
    }
    private static void rejectMergeHook(java.util.function.Consumer<MutableClass> apply, MutableClass target) {
        try { apply.accept(target); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid or duplicate merge hook accepted: " + target.getType());
    }

    private static void verifyCoordinatorProvider(MutableClass provider) {
        for (Method method : provider.getMethods()) {
            if (!method.getName().equals("get")) continue;
            List<Instruction> instructions = new ArrayList<>();
            method.getImplementation().getInstructions().forEach(instructions::add);
            for (int i = 0; i + 4 < instructions.size(); i++) {
                if (!(instructions.get(i) instanceof ReferenceInstruction)) continue;
                if (!((ReferenceInstruction) instructions.get(i)).getReference().toString().equals("Lq8/e;->R3:Lac/c;")) continue;
                if (instructions.get(i + 4) instanceof ReferenceInstruction &&
                    ((ReferenceInstruction) instructions.get(i + 4)).getReference().toString().equals("Lq9/a1;")) return;
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
                if (reference instanceof FieldReference && "Lxa/s3;".equals(((FieldReference) reference).getDefiningClass())
                    && "T0".equals(((FieldReference) reference).getName())) return;
            }
        }
        throw new AssertionError("Remaining hook does not read beta4's aired-episode map T0");
    }

}
