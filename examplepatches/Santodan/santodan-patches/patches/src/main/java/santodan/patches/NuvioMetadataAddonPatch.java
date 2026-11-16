package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import java.util.*;
import java.util.function.Function;
import kotlin.Unit;
import software.santodan.nuvio.NuvioNative;

/** Exact 1.1.0 hooks; native repositories retain HTTP, cancellation and fallback behavior. */
public final class NuvioMetadataAddonPatch {
    static final String EXT = "Lsoftware/santodan/extension/nuviometadata/NuvioMetadataAddon;";
    static final String SETTINGS = "Lsoftware/santodan/extension/nuviometadata/NuvioMetadataSettings;";
    static final String FLOW = "Lkotlinx/coroutines/flow/Flow;";
    static final String OBJECT = "Ljava/lang/Object;", STRING = "Ljava/lang/String;";
    static final String CW = "Lya/d5;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;";
    static final String ENRICHMENT = "Lya/p4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;";
    static final String CLASSIC = "Lna/p1;->g(Lya/f0;ZZ)Ljava/lang/String;";
    static final String CARD = "Lya/p7;->a(Lya/f0;ZLcom/nuvio/tv/domain/model/DetailImdbRatingsVisibility;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lya/m6;";
    static final Map<String, String> HASHES = Map.of(
        NuvioNative.REF_METADATA_INIT, "76394768c0fa86d59f0bdcb4de5b77a261af810cf7e686f9a9118077b3d95138",
        NuvioNative.REF_METADATA_LIBRARY_CARD, "800b82d66ce710038da4de9a390f4594172e54bc0367c98d22ab3d1edb3f62c4",
        ENRICHMENT, "80e409ed0717433e6ec34cfeaf42c8100adae668ff3f543beb87033038af0d06",
        CLASSIC, "64899fdbddda1f66194a9dd797e97291c8b0c13319a7857100c4071ec0a1be4d",
        NuvioNative.REF_METADATA_FACADE, "a8429dcee3af379548ef8be729b7501bd802456a11b92e6469e9ae360b28f838",
        NuvioNative.REF_METADATA_ADDONS, "2952127e0c55179a3b39135f198204045b770f938deee0e26a73cf2827cfffc7",
        CW, "b3446b9ab411f6b2b33445c0dac82dd76c5d29585f4f121b2ad3b81affaa0a50",
        CARD, "3556c96c5485eeea4241b36cc755f4de822b073c17655a02301bea680e9a3a3a");
    public static BytecodePatch getNuvioMetadataAddonPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Metadata add-on selection",
            "Choose a per-profile metadata add-on, with independent options for Continue Watching and library poster artwork.", false, builder -> {
                builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget("1.1.0", null, false, null, null)), FormFactor.TV, false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(() -> NuvioStreamPreloadPatch.extension("nuvio-metadata-addon"));
                builder.execute(context -> {
                    if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                        !"1.1.0".equals(context.getPackageMetadata().getVersionName())) throw new IllegalStateException("Metadata selection requires original NuvioTV 1.1.0");
                    Function<String, MutableClass> classes = type -> context.mutableClassDefBy(type);
                    validate(classes);
                    install(classes);
                    register(classes.apply(NuvioNative.HILT_COMPONENT_TYPE));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    static String owner(String ref) { return ref.substring(0, ref.indexOf("->")); }
    static MutableMethod method(Function<String, MutableClass> classes, String ref) {
        return classes.apply(owner(ref)).getMethods().stream().filter(m -> m.toString().equals(ref))
            .reduce((a,b) -> { throw new IllegalStateException("Ambiguous metadata method: " + ref); })
            .orElseThrow(() -> new IllegalStateException("Missing metadata method: " + ref));
    }
    static void validate(Function<String, MutableClass> classes) {
        HASHES.forEach((ref, hash) -> {
            MutableMethod m = method(classes, ref);
            if (ref.equals(NuvioNative.REF_METADATA_LIBRARY_CARD)) m = undecoratedLibraryCard(m);
            String tries = ref.equals(ENRICHMENT) ? "29:3[null:36,]57:3[null:36,]128:248[null:338,]382:2[null:36,]389:254[null:338,]648:2[null:36,]652:4[null:338,]660:6[null:338,]" : "";
            if (m.getImplementation() == null || !NuvioPreferredAddonPatch.tryLayout(m).equals(tries) || !NuvioPlaybackButtonsPatch.fingerprint(m).equals(hash))
                throw new IllegalStateException("Metadata hook changed or already patched: " + ref);
        });
        Map.of(NuvioNative.REF_METADATA_LIBRARY_EFFECT, "adb4b310718021a56658b8056f34f49b9a020c08999d00ae5dd167fb454af73b",
            "Lg1/w0;->b()V", "2f004eaf60fb8a8d392243cac0e032da2c8243fcc83baf026b998d15ae851f33",
            "Lg1/w0;->c()V", "2f004eaf60fb8a8d392243cac0e032da2c8243fcc83baf026b998d15ae851f33").forEach((ref, hash) -> {
                if (!NuvioPlaybackButtonsPatch.fingerprint(method(classes, ref)).equals(hash)) throw new IllegalStateException("Native library effect lifecycle changed: " + ref);
            });
        for (String ref : List.of(NuvioNative.REF_COMPOSER_D0, NuvioNative.REF_COMPOSER_P)) method(classes, ref);
        if (classes.apply(owner(NuvioNative.REF_METADATA_LIBRARY_PREVIEW)).getFields().stream().noneMatch(f -> f.toString().equals(NuvioNative.REF_METADATA_LIBRARY_PREVIEW)))
            throw new IllegalStateException("Library preview binding changed");
        for (String name : List.of("getId", "getApiType"))
            NuvioPreferredAddonPatch.contract(classes::apply, "Lcom/nuvio/tv/domain/model/MetaPreview;", name, List.of(), STRING, false);
        for (String ref : List.of(NuvioNative.REF_METADATA_INIT, NuvioNative.REF_METADATA_ALL,
                NuvioNative.REF_METADATA_PRIMARY, NuvioNative.REF_METADATA_CARD, NuvioNative.REF_METADATA_HERO))
            if ((method(classes, ref).getAccessFlags() & 8) != 0) throw new IllegalStateException("Native metadata instance contract changed: " + ref);
        // Runtime clone fields and presentation constructor/field order are fixed by the original ABI.
        for (String ref : List.of(NuvioNative.REF_METADATA_INIT, NuvioNative.REF_METADATA_CARD, NuvioNative.REF_METADATA_HERO)) {
            var constructor = method(classes, ref);
            int index = 0;
            for (var ins : constructor.getImplementation().getInstructions()) {
                if (!(ins instanceof ReferenceInstruction) || !(((ReferenceInstruction) ins).getReference() instanceof com.android.tools.smali.dexlib2.iface.reference.FieldReference)
                    || !ins.getOpcode().name().startsWith("IPUT")) continue;
                var f = (com.android.tools.smali.dexlib2.iface.reference.FieldReference) ((ReferenceInstruction) ins).getReference();
                if (!f.getDefiningClass().equals(owner(ref))) continue;
                if (!f.getName().equals(String.valueOf((char)('a' + index++)))) throw new IllegalStateException("Metadata constructor field order changed: " + ref);
            }
            if (index != constructor.getParameterTypes().size() && !ref.equals(NuvioNative.REF_METADATA_INIT)) throw new IllegalStateException("Metadata constructor fields changed");
        }
        NuvioPreferredAddonPatch.validateContracts(classes::apply);
        for (String name : List.of("getPoster", "getLandscapePoster", "getBackground", "getLogo"))
            NuvioPreferredAddonPatch.contract(classes::apply, "Lcom/nuvio/tv/domain/model/Meta;", name, List.of(), STRING, false);
        for (String name : List.of("getContentId", "getContentType"))
            NuvioPreferredAddonPatch.contract(classes::apply, "Lcom/nuvio/tv/domain/model/WatchProgress;", name, List.of(), STRING, false);
        NuvioPreferredAddonPatch.field(classes::apply, "Lb9/r;", "a", OBJECT);
        NuvioPreferredAddonPatch.field(classes::apply, "Lya/i9;", "g", "Lya/f0;");
        NuvioPreferredAddonPatch.field(classes::apply, "Lya/d0;", "a", "Lcom/nuvio/tv/domain/model/WatchProgress;");
        NuvioPreferredAddonPatch.field(classes::apply, "Lya/e0;", "a", NuvioNative.HOME_ITEM_TYPE);
        for (String name : List.of("a", "b")) NuvioPreferredAddonPatch.field(classes::apply, NuvioNative.HOME_ITEM_TYPE, name, STRING);
    }
    /** Date badges may already have added their proven, independent post-image callbacks. */
    static MutableMethod undecoratedLibraryCard(MutableMethod method) {
        MutableMethod copy = new MutableMethod(method);
        var code = NuvioRemainingEpisodesPatch.instructions(copy);
        for (int i = code.size() - 1; i >= 0; i--) {
            String ref = NuvioPlaybackButtonsPatch.reference(code.get(i));
            if (!(ref.startsWith("Lsoftware/santodan/extension/nuviofinale/NuvioFinaleDates;->") ||
                  ref.startsWith("Lsoftware/santodan/extension/nuviomovierelease/NuvioMovieReleaseDates;->"))) continue;
            if (!(ref.endsWith("->prepareBadge(Ljava/lang/Object;)V") || ref.endsWith("->renderPreparedBadge(Ljava/lang/Object;)V")) ||
                !(code.get(i) instanceof RegisterRangeInstruction) || ((RegisterRangeInstruction) code.get(i)).getRegisterCount() != 1)
                throw new IllegalStateException("Unknown library decorator");
            copy.getImplementation().removeInstruction(i);
        }
        return copy;
    }
    static ImmutableMethodReference extension(String name, List<String> args, String result) { return new ImmutableMethodReference(EXT, name, args, result); }
    static void replaceInvoke(MutableMethod method, int at, String name, List<String> args) {
        var ins = NuvioRemainingEpisodesPatch.instructions(method).get(at);
        var ref = extension(name, args, FLOW);
        if (ins instanceof FiveRegisterInstruction) {
            var f = (FiveRegisterInstruction) ins; method.getImplementation().replaceInstruction(at,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, f.getRegisterCount(), f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG(), ref)); }
        else if (ins instanceof RegisterRangeInstruction) {
            var r = (RegisterRangeInstruction) ins; method.getImplementation().replaceInstruction(at,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, r.getStartRegister(), r.getRegisterCount(), ref)); }
        else throw new IllegalStateException("Unsupported metadata invoke");
    }
    static void install(Function<String, MutableClass> classes) {
        var repositoryInit = method(classes, NuvioNative.REF_METADATA_INIT);
        var initCode = NuvioRemainingEpisodesPatch.instructions(repositoryInit);
        int initReturn = NuvioAnchors.unique(initCode, i -> initCode.get(i).getOpcode() == Opcode.RETURN_VOID, "native metadata repository initialization");
        repositoryInit.getImplementation().addInstruction(initReturn, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(repositoryInit), 1, extension("registerRepository", List.of(OBJECT), "V")));
        var library = method(classes, NuvioNative.REF_METADATA_LIBRARY_CARD);
        var libraryCode = NuvioRemainingEpisodesPatch.instructions(library);
        int imageUrl = NuvioAnchors.reference(libraryCode, "Lz0/c;->e(Ljava/lang/String;Lg1/n;)I", "library poster URL before native image request");
        library.getImplementation().addInstruction(imageUrl, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 4, 0, 7, 13, 9, 0,
            extension("libraryPoster", List.of(OBJECT, STRING, OBJECT, "Z"), STRING)));
        library.getImplementation().addInstruction(imageUrl + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 7));
        var enrichment = method(classes, ENRICHMENT).getImplementation();
        // After the native overlay reads, allow a cache miss to enter its existing lifecycle-bound enrichment job.
        for (int index : new int[]{214, 81}) {
            int register = index == 214 ? 4 : 3;
            enrichment.addInstruction(index + 1, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
                extension("cached", List.of(OBJECT), OBJECT)));
            enrichment.addInstruction(index + 2, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register));
        }
        var classic = method(classes, CLASSIC).getImplementation();
        var original = classic.newLabelForIndex(0);
        classic.addInstruction(0, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 5, 7, 0, 0, 0, extension("image", List.of(OBJECT, "Z"), STRING)));
        classic.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        classic.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
        classic.addInstruction(3, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        var facade = method(classes, NuvioNative.REF_METADATA_FACADE);
        replaceInvoke(facade, 2, "all", List.of(OBJECT, STRING, STRING, STRING));
        var cw = method(classes, CW);
        var code = NuvioRemainingEpisodesPatch.instructions(cw);
        int count = 0;
        for (int i = 0; i < code.size(); i++) {
            String ref = NuvioPlaybackButtonsPatch.reference(code.get(i));
            if (ref.equals(NuvioNative.REF_METADATA_FACADE) || ref.equals(NuvioNative.REF_METADATA_PRIMARY)) {
                replaceInvoke(cw, i, ref.equals(NuvioNative.REF_METADATA_PRIMARY) ? "cwPrimary" : "cwAll", List.of(OBJECT, STRING, STRING)); count++;
            }
        }
        if (count != 4) throw new IllegalStateException("CW metadata calls changed");
        var addons = method(classes, NuvioNative.REF_METADATA_ADDONS);
        var body = addons.getImplementation();
        // Only the completed List return, never the COROUTINE_SUSPENDED return.
        body.replaceInstruction(43, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 5, 6, 0, 0, 0, extension("filterAddons", List.of(OBJECT, "Ljava/util/List;"), "Ljava/util/List;")));
        body.addInstruction(44, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6));
        body.addInstruction(45, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 6));
        var card = method(classes, CARD);
        body = card.getImplementation();
        // At the sole return, v2/v3 are dead and all live output is held in v11.
        body.replaceInstruction(613, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 11));
        body.addInstruction(614, new BuilderInstruction22x(Opcode.MOVE_FROM16, 3, 40));
        body.addInstruction(615, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 2, 3, 0, 0, 0, extension("decorate", List.of(OBJECT, "Z"), OBJECT)));
        body.addInstruction(616, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 11));
        body.addInstruction(617, new BuilderInstruction21c(Opcode.CHECK_CAST, 11, new ImmutableTypeReference("Lya/m6;")));
        body.addInstruction(618, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 11));
    }
    static void register(MutableClass component) {
        var init = NuvioRemainingEpisodesPatch.unique(component, "<init>", 1);
        if (!init.toString().equals(NuvioNative.REF_HILT_COMPONENT_INIT)) throw new IllegalStateException("Metadata component changed");
        var code = NuvioRemainingEpisodesPatch.instructions(init);
        int at = NuvioAnchors.unique(code, i -> code.get(i).getOpcode() == Opcode.RETURN_VOID, "metadata component return");
        if (code.stream().anyMatch(i -> NuvioRemainingEpisodesPatch.calls(i, SETTINGS, "registerComponent"))) throw new IllegalStateException("Metadata component already patched");
        init.getImplementation().addInstruction(at, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(init), 1, new ImmutableMethodReference(SETTINGS, "registerComponent", List.of(OBJECT), "V")));
    }
}
