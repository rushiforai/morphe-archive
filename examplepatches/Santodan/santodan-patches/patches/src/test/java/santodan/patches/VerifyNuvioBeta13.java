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

/** Checks beta.13 hooks on original DEX, including the extension reflection contracts. */
public final class VerifyNuvioBeta13 {
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
        if (!NuvioLayout.LATEST.equals(version)) throw new AssertionError("This verifier targets beta.13 only");
        NuvioRemainingEpisodesPatch.validateTarget("com.nuvio.tv", version);
        for (String[] invalid : new String[][]{{"wrong.package", version}, {"com.nuvio.tv", "1.1.0-beta.1399"}, {"com.nuvio.tv", "1.1.0-beta.2"}, {"com.nuvio.tv", "1.1.0-beta.4"}, {"com.nuvio.tv", "1.1.0-beta.5"}, {"com.nuvio.tv", "1.1.0-beta.6"}}) {
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
        field("Lya/v3;", "i1", "Lkotlinx/coroutines/Job;");
        field("Lba/pd;", "a", "Lba/ic;");
        field("Lba/ic;", "T", "Z");
        method("Lc/j;", "getFullyDrawnReporter", 0);
        field("Lc/m;", "c", "Ljava/lang/Object;");
        field("Lc/m;", "f", "Z");
        field("Lc/m;", "g", "Ljava/util/ArrayList;");
        if (owner("Lc/j;").getMethods().stream().filter(m -> m.getName().equals("getFullyDrawnReporter"))
                .noneMatch(m -> m.getReturnType().equals("Lc/m;")))
            throw new AssertionError("Home presentation reporter return type changed");
        System.out.println("PASS: original beta.13 fully-drawn reporter and deferred startup contracts");
        String repository = "Lba/yf;";
        String provider = "Lq9/z;";
        NuvioProviderLayout runtime = NuvioProviderLayout.forRepository(
            repository.substring(1, repository.length() - 1).replace('/', '.'));
        if (!provider.equals("L" + runtime.providerInterface.replace('.', '/') + ";"))
            throw new AssertionError("Runtime provider interface differs from patch layout");
        progressFlow("Lba/pd;", runtime.allProgressMethod);
        method(provider, runtime.allProgressMethod, 0);
        {
            boolean rejected = false;
            try { progressFlow("Lba/pd;", "p"); }
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
            String rowOwner = "Lgb/hd;";
            method(rowOwner, "a", 18);
            method(rowOwner, "j", 11);
            String playbackRows = "Lgb/jc;";
            method(playbackRows, "b", 9);
            method(playbackRows, "c", 9);
            method(playbackRows, "j", 14);
            method("Ld2/z;", "<init>", 1);
            field("Lh3/s0;", "a", "Lh3/i0;");
            field("Lh3/i0;", "b", "J");
            String picker = "Lgb/qd;";
            method(picker, "<init>", 6);
            for (String alignment : List.of("a", "b", "c", "d", "e", "f", "g", "h", "i"))
                field("Lw1/b;", alignment, "Lw1/i;");
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
        String model = "Lya/j9;";
        for (String name : List.of("a", "c")) field(model, name, "Ljava/lang/String;");
        for (String name : List.of("h", "i")) field(model, name, "I");
        for (String name : List.of("x", "y")) field(model, name, "Ljava/lang/Integer;");
        field("Lna/w0;", "l", "Ljava/lang/String;");
        method("Lgb/hd;", "m", 13);
        method("Ly5/h2;", "b", 19);
        method("Lg1/h;", "s", 1);
        for (String type : List.of("Ljb/x0;",
                "Ly5/j2;", "Ljb/l0;",
                "Lna/p1;", "Lw1/n;", "Ld2/i0;")) owner(type);
        {
            field("Lw1/b;", "h", "Lw1/i;");
            method("Ld0/v;", "a", 2);
            field("Ld0/v;", "a", "Ld0/v;");
        }
        String composerType = "Lg1/k0;";
        method(composerType, "d0", 1);
        method(composerType, "p", 1);
        System.out.println("PASS: isolated badge composition group start/end contracts");
        System.out.println("PASS: reflection contracts for " + version);
        {
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
            verifyMergeHooks();
            NuvioNativeSyncBanner.hookRoot(owner("Lq8/l;"));
            NuvioNativeSyncBanner.hookBanner(owner("Lnb/a;"));
            NuvioMergedProgressPatch.hookNavigation(owner("Lq8/l;"));
            NuvioMergedProgressPatch.hookActivity(owner("Lcom/nuvio/tv/MainActivity;"));
            NuvioMergedProgressPatch.hookPlaybackScrobblers(owner("Lq9/h0;"));
            NuvioMergedProgressPatch.hookLocalProgressWrites(owner(repository));
            field("Lm5/y;", "F", "Lkotlinx/coroutines/flow/SharedFlow;");
            field("Lm5/m;", "d", "Lm5/g0;");
            field("Lm5/g0;", "i", "Ljava/lang/String;");
            method("Lq9/s0;", "a", 0);
            method("Lgb/me;", "a", 11);
            method("Lgb/me;", "d", 6);
            method("Lgb/hd;", "j", 11);
            method("Lgb/hd;", "g", 12);
            method("Lgb/hd;", "d", 7);
            method("Lgb/hd;", "e", 5);
            method("Lgb/me;", "b", 6);
            method("Lgb/qd;", "<init>", 6);
            method("Lna/f2;", "B", 19);
            method("Ld0/b;", "a", 6);
            method("Ld0/q;", "a", 3);
            method("Landroidx/compose/foundation/layout/b;", "f", 2);
            method("Landroidx/compose/foundation/layout/b;", "h", 2);
            method("Lk0/g;", "b", 1);
            field("Ljb/x0;", "a", "Lg1/c3;");
            field("Ljb/e;", "h", "J");
            field("Ljb/e;", "e", "J");
            NuvioRemainingEpisodesPatch.hookCard(owner("Lna/w0;"), "Lc7/a;",
                "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;", "prepareProviderBadge", "renderProviderBadge");
            field("Lna/w0;", "r", "Lcom/nuvio/tv/domain/model/WatchProgress;");
            String nextCard = "Lya/f0;";
            field("Lna/w0;", "s", nextCard);
            field("Lya/e0;", "a", "Lya/j9;");
            field("Lw1/b;", "i", "Lw1/i;");
            field("Lu2/l;", "b", "Lu2/b1;");
            method("Lgb/cj;", "b", 15);
            method("Landroidx/compose/foundation/layout/b;", "n", 2);
            method("Ld0/b;", "u", 2);
            method("Lx/m;", "g", 3);
            System.out.println("PASS: merged provider badge identity, image, size, and bottom-right alignment contracts");
            hook("hookInlinedCutoff", owner("Lya/y4;"));
            hook("hookInlinedCutoff", owner("Lgb/s8;"));
            NuvioMergedProgressPatch.hookBadgeCacheHit(owner("Lba/u2;"));
            NuvioMergedProgressPatch.hookBadgeGroupProgress(owner("Lya/k5;"));
            field("Lya/v3;", "X0", "Ljava/util/Set;");
            field("Lya/v3;", "u", "Lcom/nuvio/tv/data/local/wc;");
            field("Lcom/nuvio/tv/data/local/wc;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lcom/nuvio/tv/data/local/wc;", "g", "Ljava/util/Map;");
            System.out.println("PASS: unchanged-ID badge retry and incremental metadata publication hooks");
        } else hook("hookMergedProviderPolicies", owner(repository));
        hook("hookInlinedNextUpSeedPolicy", owner("Lya/k5;"));
        hook("hookMergedProvider", owner("Lba/ce;"));
        hook("hookEffectiveSource", owner("Lob/a;"));
        hook("hookWatchProgressEnum", owner("Lcom/nuvio/tv/data/local/dc;"));
        if (!newer) hook("hookWatchProgressPicker", new Class<?>[]{MutableClass.class, String.class, String.class},
            owner("Lgb/d3;"), "W0", "Lgb/lj;");
        else {
            NuvioMergedProgressPatch.hookSettingsStore(owner("Lq9/a1;"));
            field("Lq8/e;", "T3", "Lbc/c;");
            verifyProviderBinding(owner("Lq8/f;"), "T3", "Lq9/a1;");
            verifyProviderBinding(owner("Lq8/f;"), "g3", "Lba/q5;");
            verifyProviderBinding(owner("Lq8/d;"), "B", "Lg9/f;");
            NuvioMergedProgressPatch.hookSettingsComponent(owner("Lq8/e;"));
            verifyComponentRegistration(owner("Lq8/e;"));
        }
        hook("hookWatchProgressSelection", owner("Lgb/fb;"));
        hook("hookWatchProgressSummary", new Class<?>[]{MutableClass.class, String.class},
            owner("Lgb/qi;"), "B");
        NuvioRemainingEpisodesPatch.hookNextUpModel(owner(model));
        NuvioRemainingEpisodesPatch.hookEpisodeSets(owner("Lya/k5;"),
            "Lya/v3;");
        if (newer) verifyRemainingAiredMap(owner("Lya/k5;"));

        NuvioRemainingEpisodesPatch.hookCard(owner("Lna/w0;"),
            "Lc7/a;");
        System.out.println("PASS: remaining-episode hooks");
        {
            NuvioAiringSeriesPatch.hookNextUpModel(owner(model));
            NuvioAiringSeriesPatch.hookUpcomingSplit(owner("Lya/k5;"));
            verifyAiringSplitCall(owner("Lya/k5;"));
            NuvioAiringSeriesPatch.hookCard(owner("Lna/w0;"), "Lc7/a;");
            NuvioAiringSeriesPatch.hookWide(owner("Lna/p1;"));
            System.out.println("PASS: standalone airing-series hooks");
            field("Lna/b2;", "g", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            field("Lna/o0;", "h", "Lcom/nuvio/tv/domain/model/MetaPreview;");
            for (String getter : List.of("getApiType", "getImdbId", "getId", "getReleased", "getReleaseInfo"))
                method("Lcom/nuvio/tv/domain/model/MetaPreview;", getter, 0);
            for (String type : NuvioFinaleDatesPatch.itemOwners()) NuvioFinaleDatesPatch.hookItems(owner(type));
            NuvioFinaleDatesPatch.hookCard(owner("Lna/b2;"));
            NuvioFinaleDatesPatch.hookCard(owner("Lna/o0;"));
            for (String type : List.of("Lna/b2;", "Lna/o0;", "Lna/c2;", "Lna/p0;"))
                NuvioFinaleDatesPatch.hookContext(owner(type));
            System.out.println("PASS: library and collection finale-date hooks");
            for (String type : NuvioFinaleDatesPatch.itemOwners()) NuvioFinaleDatesPatch.hookItems(owner(type), NuvioMovieReleaseDatesPatch.EXTENSION);
            NuvioFinaleDatesPatch.hookCard(owner("Lna/b2;"), NuvioMovieReleaseDatesPatch.EXTENSION);
            NuvioFinaleDatesPatch.hookCard(owner("Lna/o0;"), NuvioMovieReleaseDatesPatch.EXTENSION);
            for (String type : List.of("Lna/b2;", "Lna/o0;", "Lna/c2;", "Lna/p0;"))
                NuvioFinaleDatesPatch.hookContext(owner(type), NuvioMovieReleaseDatesPatch.EXTENSION);
            System.out.println("PASS: movie release hooks coexist with series finale hooks");
            method("Lf0/i;", "q", 4);
            method("Lq1/t;", "<init>", 3);
            method("Lgb/me;", "a", 11);
            method("Lgb/me;", "e", 6);
            String streamRepository = "Lba/q5;";
            method(streamRepository, "l", 10);
            field(streamRepository, "e", "Lg9/f;");
            field(streamRepository, "l", "Lkotlinx/coroutines/flow/MutableStateFlow;");
            field("Lq8/e;", "g3", "Lbc/c;");
            field("Lq8/e;", "B", "Lbc/c;");
            field("Lg9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lb9/r;", "a", "Ljava/lang/Object;");
            method("Lcom/nuvio/tv/domain/model/AddonStreams;", "getStreams", 0);
            String detailModel = "Lxa/n7;";
            method(detailModel, "u", 0);
            field(detailModel, "G", "Lkotlinx/coroutines/flow/StateFlow;");
            String detailState = "Lxa/e6;";
            field(detailState, "b", "Lcom/nuvio/tv/domain/model/Meta;");
            field(detailState, "h", "Lcom/nuvio/tv/domain/model/NextToWatch;");
            field(detailState, "f", "Ljava/util/List;");
            method("Lxa/n0;", "C", 3);
            for (String getter : List.of("getNextVideoId", "getNextSeason", "getNextEpisode", "getWatchProgress"))
                method("Lcom/nuvio/tv/domain/model/NextToWatch;", getter, 0);
            for (String getter : List.of("getId", "getSeason", "getEpisode"))
                method("Lcom/nuvio/tv/domain/model/Video;", getter, 0);
            field("Lna/w0;", "r", "Lcom/nuvio/tv/domain/model/WatchProgress;");
            field("Lna/w0;", "s", "Lya/f0;");
            NuvioStreamPreloadPatch.hookComponent(owner("Lq8/e;"));
            NuvioStreamPreloadPatch.hookContinueWatching(owner("Lna/w0;"));
            NuvioStreamPreloadPatch.hookDetails(owner(detailModel));
            String playerModel = "Lbb/vl;";
            String playerController = "Lbb/lc;";
            String playerState = "Lbb/sl;";
            String nextInfo = "Lbb/m4;";
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
            for (String name : List.of("g", "F0", "m1")) field(playerState, name, "Ljava/lang/String;");
            field(playerState, "y1", nextInfo);
            field(playerState, "d", "Lbb/aa;");
            field(nextInfo, "a", "Ljava/lang/String;");
            field(nextInfo, "g", "Ljava/lang/String;");
            field(nextInfo, "h", "Z");
            field(nextInfo, "i", "Ljava/lang/Boolean;");
            field(nextInfo, "b", "I");
            field(nextInfo, "c", "I");
            String pluginSearch = "Lba/g5;";
            field(pluginSearch, "j", streamRepository);
            for (String name : List.of("k", "l")) field(pluginSearch, name, "Ljava/lang/String;");
            for (String name : List.of("m", "n")) field(pluginSearch, name, "Ljava/lang/Integer;");
            NuvioStreamPreloadPatch.hookPlayer(owner(playerModel));
            NuvioStreamPreloadPatch.hookNextEpisodePluginPause(owner(pluginSearch));
            String nextTransition = "Lbb/og;";
            method("Lbb/xg;", "G", 3);
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
            try { NuvioStreamPreloadPatch.hookContinueWatching(owner("Lna/w0;")); }
            catch (IllegalStateException expected) { duplicateStreamHookRejected = true; }
            if (!duplicateStreamHookRejected) throw new AssertionError("Duplicate stream hook accepted");
            System.out.println("PASS: stream preload hooks, native cache/profile contracts, and duplicate rejection");
            field("Lq9/a1;", "k", "Lkotlinx/coroutines/flow/StateFlow;");
            field("Lq9/a1;", "j", "Lg9/f;");
            field("Lg9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;");
            method("Lq9/a1;", "f", 2);
            NuvioSettingsMenuPatch.hookLayoutList(owner("Lbb/sh;"));
            verifyMenuRelocation(owner("Lbb/sh;"), owner("Lgb/jc;"));
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
        var metadata = new MutableClass(owner("Lcom/nuvio/tv/domain/model/MetaPreview;"));
        NuvioSettingsMenuPatch.hookPreviewMovie(metadata);
        boolean duplicateArtworkRejected = false;
        try { NuvioSettingsMenuPatch.hookPreviewMovie(metadata); }
        catch (IllegalStateException expected) { duplicateArtworkRejected = true; }
        if (!duplicateArtworkRejected) throw new AssertionError("Duplicate preview artwork capture accepted");
        used.removeIf(candidate -> candidate.getType().equals(metadata.getType()));
        classes.put(metadata.getType(), metadata);
        used.add(metadata);
        var swatch = new MutableClass(owner("Lgb/jc;"));
        var originalSwatch = owner("Lgb/jc;").getMethods().stream().filter(m -> m.toString().equals(software.santodan.nuvio.NuvioNative.REF_DATE_COLOR_SWATCH)).findFirst().orElseThrow();
        int swatchRegisters = originalSwatch.getImplementation().getRegisterCount();
        int swatchInstructions = NuvioAiringSeriesPatch.instructions(originalSwatch).size();
        NuvioSettingsMenuPatch.hookDateColorSwatch(swatch);
        NuvioSettingsMenuPatch.hookDateColorOpacity(swatch);
        boolean duplicateOpacityRejected = false;
        try { NuvioSettingsMenuPatch.hookDateColorOpacity(swatch); }
        catch (IllegalStateException expected) { duplicateOpacityRejected = true; }
        if (!duplicateOpacityRejected) throw new AssertionError("Duplicate opacity hook accepted");
        var patchedSwatch = swatch.getMethods().stream().filter(m -> m.toString().equals(software.santodan.nuvio.NuvioNative.REF_DATE_COLOR_SWATCH)).findFirst().orElseThrow();
        if (patchedSwatch.getImplementation().getRegisterCount() != swatchRegisters ||
            NuvioAiringSeriesPatch.instructions(patchedSwatch).size() != swatchInstructions + 9)
            throw new AssertionError("Swatch hook changed registers or native layout");
        boolean duplicateSwatchRejected = false;
        try { NuvioSettingsMenuPatch.hookDateColorSwatch(swatch); }
        catch (IllegalStateException expected) { duplicateSwatchRejected = true; }
        if (!duplicateSwatchRejected) throw new AssertionError("Duplicate swatch hook accepted");
        rejectParameter(owner("Lgb/jc;"), "a", 0, "I", NuvioSettingsMenuPatch::hookDateColorSwatch);
        // Keep the hooked class in the real DEX write/reload below.
        used.removeIf(candidate -> candidate.getType().equals("Lgb/jc;"));
        classes.put("Lgb/jc;", swatch);
        used.add(swatch);
        var preview = new MutableClass(owner("Lgb/x0;"));
        NuvioSettingsMenuPatch.hookDateEditorPreview(preview);
        boolean duplicatePreviewRejected = false;
        try { NuvioSettingsMenuPatch.hookDateEditorPreview(preview); }
        catch (IllegalStateException expected) { duplicatePreviewRejected = true; }
        if (!duplicatePreviewRejected) throw new AssertionError("Duplicate label preview hook accepted");
        rejectParameter(owner("Lgb/x0;"), "c", 0, "J", NuvioSettingsMenuPatch::hookDateEditorPreview);
        used.removeIf(candidate -> candidate.getType().equals("Lgb/x0;"));
        classes.put("Lgb/x0;", preview);
        used.add(preview);
        var saveLabel = new MutableClass(owner("Lgb/i0;"));
        NuvioSettingsMenuPatch.hookDateEditorApply(saveLabel);
        boolean duplicateApplyRejected = false;
        try { NuvioSettingsMenuPatch.hookDateEditorApply(saveLabel); }
        catch (IllegalStateException expected) { duplicateApplyRejected = true; }
        if (!duplicateApplyRejected) throw new AssertionError("Duplicate editor Apply hook accepted");
        used.removeIf(candidate -> candidate.getType().equals("Lgb/i0;"));
        classes.put("Lgb/i0;", saveLabel);
        used.add(saveLabel);
        for (String reference : NuvioSettingsMenuPatch.DATE_COLOR_APIS)
            NuvioSettingsMenuPatch.validateDateColorApi(owner(reference.substring(0, reference.indexOf("->"))), reference);
        rejectParameter(owner("Lgb/x0;"), "a", 1, "I", candidate ->
            NuvioSettingsMenuPatch.validateDateColorApi(candidate, software.santodan.nuvio.NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG));
        verifyGlyph(software.santodan.nuvio.NuvioNative.REF_ICON_MEDIA_P, "Filled.Info");
        verifyGlyph(software.santodan.nuvio.NuvioNative.REF_ICON_MEDIA_Q, "Rounded.PlayArrow");
        verifyGlyph(software.santodan.nuvio.NuvioNative.REF_ICON_PARTY_Q, "Rounded.Groups");
        verifyGlyph(software.santodan.nuvio.NuvioNative.REF_ICON_PARTY_O, "Filled.BugReport");
        if (!software.santodan.nuvio.NuvioNative.REF_ICON_PARTY_D.equals("Lk8/k;->g:Lj2/e;"))
            throw new AssertionError("Caption cache must remain separate from native party/play caches");
        var factory = owner("Lg1/h;");
        var streams = owner("Lba/q5;");
        var details = owner("Lxa/n0;");
        NuvioStreamPreloadPatch.validateDetailResolver(details);
        rejectParameter(details, "C", 0, "I", NuvioStreamPreloadPatch::validateDetailResolver);
        NuvioSettingsMenuPatch.validateStateFactory(factory);
        NuvioStreamPreloadPatch.validateSearch(streams);
        // Same arity is insufficient: these model the exact failures from device logs.
        rejectParameter(factory, "s", 0, "J", NuvioSettingsMenuPatch::validateStateFactory);
        rejectParameter(streams, "l", 4, "Lkotlin/coroutines/jvm/internal/ContinuationImpl;", NuvioStreamPreloadPatch::validateSearch);
        System.out.println("PASS: exact beta13 state/search signatures; same-arity long and continuation substitutes rejected");
    }

    private static void verifyGlyph(String reference, String label) {
        MutableClass type = owner(reference.substring(0, reference.indexOf("->")));
        Method method = type.getMethods().stream().filter(m -> m.toString().equals(reference)).findFirst().orElseThrow();
        for (Instruction instruction : method.getImplementation().getInstructions())
            if (instruction.getOpcode() == com.android.tools.smali.dexlib2.Opcode.CONST_STRING &&
                instruction instanceof ReferenceInstruction &&
                ((ReferenceInstruction) instruction).getReference().toString().equals(label)) return;
        throw new AssertionError("Wrong native glyph for " + reference + ": expected " + label);
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
        for (String name : List.of("C", "D", "A", "B")) {
            String expected = "L" + software.santodan.extension.nuviomerged.NuvioLocalWriteContinuation
                .nativeState(name).replace('.', '/') + ";";
            Method nativeMethod = owner("Lcom/nuvio/tv/data/local/cc;").getMethods().stream()
                .filter(m -> m.getName().equals(name)).findFirst().orElseThrow();
            boolean matched = false;
            for (Instruction instruction : nativeMethod.getImplementation().getInstructions()) {
                if (instruction.getOpcode() == com.android.tools.smali.dexlib2.Opcode.INSTANCE_OF &&
                    instruction instanceof ReferenceInstruction &&
                    ((ReferenceInstruction) instruction).getReference().toString().equals(expected)) matched = true;
            }
            if (!matched) throw new AssertionError("Local overlay resume binding differs from original beta.13: " + name);
        }
        for (String name : List.of("C", "D", "A", "B"))
            verifyMergeHook("Lcom/nuvio/tv/data/local/cc;", NuvioMergedProgressPatch::hookLocalOverlay, name);
        for (String name : List.of("p", "q"))
            verifyMergeHook("Lcom/nuvio/tv/data/local/sc;", NuvioMergedProgressPatch::hookLocalOverlay, name);
        verifyMergeHook("Lya/v3;", NuvioMergedProgressPatch::hookHomePipeline, "b");
        verifyMergeHook("Lq8/l;", NuvioNativeSyncBanner::hookRoot, "invoke");
        verifyMergeHook("Lnb/a;", NuvioNativeSyncBanner::hookBanner, "b");
        verifyMergeHook("Lq8/l;", NuvioMergedProgressPatch::hookNavigation, "invoke");
        verifyMergeHook("Lq9/h0;", NuvioMergedProgressPatch::hookPlaybackScrobblers, "a");
        verifyMergeHook("Lba/yf;", NuvioMergedProgressPatch::hookLocalProgressWrites, "G");
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
        if (type.equals("Lnb/a;")) {
            var banner = NuvioRemainingEpisodesPatch.unique(installed, "b", 10);
            var code = NuvioRemainingEpisodesPatch.instructions(banner);
            int state = NuvioAnchors.parameter(banner, 0), flag = NuvioAnchors.parameter(banner, 2);
            if (state != 64 || flag != 66 ||
                ((com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) code.get(0)).getStartRegister() != state ||
                ((com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction) code.get(1)).getStartRegister() != flag ||
                ((com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction) code.get(2)).getRegisterA() != flag)
                throw new AssertionError("Banner state/boolean hooks must read native parameters, not uninitialized locals");
        }
        rejectMergeHook(apply, installed);
    }
    private static void rejectMergeHook(java.util.function.Consumer<MutableClass> apply, MutableClass target) {
        try { apply.accept(target); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid or duplicate merge hook accepted: " + target.getType());
    }

    private static void verifyProviderBinding(MutableClass provider, String field, String expectedType) {
        for (Method method : provider.getMethods()) {
            if (method.getImplementation() == null) continue;
            List<Instruction> instructions = new ArrayList<>();
            method.getImplementation().getInstructions().forEach(instructions::add);
            for (int i = 0; i + 4 < instructions.size(); i++) {
                if (!(instructions.get(i) instanceof ReferenceInstruction)) continue;
                if (!((ReferenceInstruction) instructions.get(i)).getReference().toString().equals("Lq8/e;->" + field + ":Lbc/c;")) continue;
                if (!NuvioPlaybackButtonsPatch.reference(instructions.get(i + 1)).equals("Lbc/c;->get()Ljava/lang/Object;") ||
                    instructions.get(i + 2).getOpcode() != com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT) continue;
                int cast = instructions.get(i + 3).getOpcode() == com.android.tools.smali.dexlib2.Opcode.MOVE_OBJECT ? i + 4 : i + 3;
                if (instructions.get(cast).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST &&
                    NuvioPlaybackButtonsPatch.reference(instructions.get(cast)).equals(expectedType)) return;
            }
        }
        throw new AssertionError("Native Hilt binding changed: " + field + " -> " + expectedType);
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
            if (!"D".equals(method.getName()) || method.getParameterTypes().size() != 2) continue;
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
                if (reference instanceof FieldReference && "Lya/v3;".equals(((FieldReference) reference).getDefiningClass())
                    && "T0".equals(((FieldReference) reference).getName())) return;
            }
        }
        throw new AssertionError("Remaining hook does not read beta4's aired-episode map T0");
    }

}
