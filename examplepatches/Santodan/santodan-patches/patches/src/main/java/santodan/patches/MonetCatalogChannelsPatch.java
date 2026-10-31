package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

/** Channel-aware custom media rows without changing native item ownership or navigation. */
public final class MonetCatalogChannelsPatch {
    public static final String NAME = "Monet - Individual Nuvio catalog rows";
    static final String EXTENSION = "Lsoftware/santodan/extension/monetchannels/MonetCatalogChannels;";
    static final String READER = "La/fi5;->k(Landroid/content/Context;Landroid/net/Uri;ILjava/lang/Long;)La/ec5;";
    static final String PROGRAMS = "La/fi5;->e(Ljava/util/List;)Ljava/util/List;";
    static final String STATE = "La/zg2;->i(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String FILTER = "La/rx3;->u(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/LinkedHashMap;Ljava/util/List;I)La/ii4;";
    static final String SOURCES = "La/rx3;->i(Ljava/util/List;Ljava/util/LinkedHashMap;Ljava/util/Set;Ljava/util/Locale;)Ljava/util/List;";
    static final String RESUME = "Lcom/klevico/monet/MainActivity;->onResume()V";
    static final String PAUSE = "Lcom/klevico/monet/MainActivity;->onPause()V";
    static final String OWNER = "La/cs0;->j()Ljava/lang/String;";
    static final String HEADER = "La/kq3;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String MODEL = "La/mx3;-><init>(Landroid/content/Context;La/ym;La/iz2;La/mm;La/xk;La/ne1;La/gh7;La/m20;La/v47;La/io0;La/e87;La/ch2;)V";
    static final String PICKER = "La/zs3;->u2(La/s26;La/od2;La/cr2;La/xr2;La/er2;La/br2;La/lg3;La/nt3;La/mt3;La/nt2;La/nt2;La/dr2;Landroid/content/Context;La/bz1;La/zz4;La/yq6;La/kq1;La/kq4;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLa/yq1;La/kq1;La/yq1;La/kq1;La/yq1;La/kq1;La/kq1;La/iq1;La/iq1;La/iq1;La/kq1;La/iq1;La/yq1;La/kq1;La/ar1;La/yr1;I)V";
    static final List<String> TARGETS = List.of(READER, PROGRAMS, STATE, FILTER, RESUME, PAUSE, OWNER, HEADER, PICKER, MODEL);
    static final Map<String, String> CONTRACTS = Map.ofEntries(
        Map.entry(MODEL, "60d50894bb5d288c69dc6974405a04c91a24ab980bad26925685c863ca4546fc"),
        Map.entry(RESUME, "39e89d1f6d6773d37c4f0ec145feaf493261024d86e642bb44dcdeb2e3511006"),
        Map.entry(PAUSE, "9aed3bbf2dd880843083789b222d4dd9c78e078ff7e98f3066aad1d497cf7d38"),
        Map.entry(OWNER, "0fe14bce5956234a6f9e51e7d3ada02b63603d24008737376928c2d3606bd695"),
        Map.entry(HEADER, "eb4d33b66f65ca1888e1be374d80b2bf5f5aef1e291a824ac4795ff38b4b5ede"),
        Map.entry(PICKER, "a2c3083a89dbbb89919bf0720cb786a889bdb36dd8b60ca567bc28b2e0a09a3c"),
        Map.entry(FILTER, "49f556e8d825d834285d6c159a116344cb58a07c3d2ca943cf7acaf728da1414"),
        Map.entry(READER, "551d27e4dc84d08cbd4ac281ac86363adaaa0cc667b3475a29b525071e9a01a7"),
        Map.entry(PROGRAMS, "278099718b62a3217d368805c5e4ffa04ccf0549e4c362c042d63684335ab895"),
        Map.entry(STATE, "0bf4b583db1f0dc63879ceecef15ccca8f39d27ee5f58e5380676026a11c3d8c"),
        Map.entry(SOURCES, "a92ffd2bc919671618a4c855cf8dcdb6b88521ff0d37e6fa40600952d57f60da"),
        Map.entry("La/fi5;->l(La/ai5;La/te4;Ljava/util/List;J)La/zo0;", "76b6c57395aa376380481c022a8268a1144fe56d57ef317a28be9794de98559f"));
    private MonetCatalogChannelsPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getMonetCatalogChannelsPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Select individual NuvioTV catalogs in the app's content picker, with Nuvio icons and refresh independent of Recommendations.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("com.klevico.monet", "Monet", null, ApkFileType.APK,
                    null, null, Arrays.asList(new AppTarget("1.0.97", null, false, 26, null),
                        new AppTarget("1.1.0", null, false, 26, null)), FormFactor.TV, false));
                builder.extendWith(() -> {
                    var input = MonetCatalogChannelsPatch.class.getClassLoader().getResourceAsStream("extensions/monet-catalog-channels.mpe");
                    if (input == null) throw new IllegalStateException("Missing Monet catalog channels extension");
                    return input;
                });
                builder.execute(context -> {
                    if (!"com.klevico.monet".equals(context.getPackageMetadata().getPackageName())
                        || !Set.of("1.0.97","1.1.0").contains(context.getPackageMetadata().getVersionName())) throw unsupported("Unexpected package/version");
                    List<ClassDef> classes = new ArrayList<>();
                    context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
                    boolean modern="1.1.0".equals(context.getPackageMetadata().getVersionName());
                    Map<String, Method> contracts = modern?MonetCatalogChannels110.validate(classes):validate(classes);
                    if (modern) MonetCatalogChannels110.selectLayout(context.mutableClassDefBy(MonetCatalogChannels110.LAYOUT));
                    for (String signature : modern?MonetCatalogChannels110.TARGETS:TARGETS) {
                        Method original = contracts.get(signature);
                        MutableMethod method = context.mutableClassDefBy(original.getDefiningClass()).getMethods().stream()
                            .filter(m -> m.equals(original)).findFirst().orElseThrow();
                        if (modern) MonetCatalogChannels110.apply(method); else apply(method);
                    }
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Monet catalog channels bytecode: " + reason + ". Use a supported original Monet APK.");
    }
    static Map<String, Method> validate(List<? extends ClassDef> classes) {
        Map<String, Method> found = new HashMap<>();
        Map<String, ClassDef> types = new HashMap<>();
        for (ClassDef c : classes) {
            if (types.put(c.getType(), c) != null) throw unsupported("Duplicate class " + c.getType());
            for (Method m : c.getMethods()) if (CONTRACTS.containsKey(m.toString())) {
                int expectedAccess = m.toString().equals(MODEL) ? 65537
                    : List.of(STATE, RESUME, PAUSE, OWNER, HEADER).contains(m.toString()) ? 17 : 25;
                if (found.put(m.toString(), m) != null || m.getImplementation() == null
                    || m.getAccessFlags() != expectedAccess
                    || !CONTRACTS.get(m.toString()).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))))
                    throw unsupported("Changed or already patched contract " + m);
            }
        }
        if (found.size() != CONTRACTS.size()) throw unsupported("Missing native reader/source/state contract");
        Set<String> publicSymbols = new HashSet<>();
        for (ClassDef c : classes) {
            for (Method m : c.getMethods()) if ((m.getAccessFlags() & 1) != 0) publicSymbols.add(m.toString());
            for (Field f : c.getFields()) if ((f.getAccessFlags() & 1) != 0) publicSymbols.add(f.toString());
        }
        if (!publicSymbols.containsAll(List.of(
            "La/sx;->a(Ljava/lang/Object;)La/ie6;",
            "La/yg2;->o(La/nj1;La/nj1;La/nj1;La/ar1;)La/lm;",
            "La/ar1;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/ie6;->k(Ljava/lang/Object;)V",
            "La/ec5;->a:Ljava/util/ArrayList;", "La/cs0;->g:Ljava/util/List;", "La/cs0;->A:Ljava/util/List;",
            "La/q03;->k:La/xr2;", "La/q03;->l:Ljava/lang/String;", "La/xr2;->L:La/ga4;",
            "La/yq1;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            "La/bs0;->RECOMMENDATIONS:La/bs0;", "La/sj4;->a:Ljava/lang/String;",
            "La/zs3;->L1(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;La/zq1;ZLa/zq1;La/kq1;La/kq1;La/kq1;La/iq1;La/yr1;III)V")))
            throw unsupported("Missing native catalog flow, content picker or row identity contract");
        for (String signature : List.of(
            "La/te4;-><init>(Landroid/content/Context;)V", "La/sj4;-><init>(ILjava/lang/String;Ljava/lang/String;Z)V")) {
            long count = classes.stream().flatMap(c -> { List<Method> methods = new ArrayList<>(); c.getMethods().forEach(methods::add); return methods.stream(); })
                .filter(m -> signature.equals(m.toString()) && (m.getAccessFlags() & 1) != 0).count();
            if (count != 1) throw unsupported("Missing public constructor " + signature);
        }
        for (String signature : List.of("La/ai5;->c:J", "La/ai5;->b:Ljava/lang/String;", "La/ai5;->f:Ljava/util/List;",
            "La/zo0;->k:Ljava/lang/String;", "La/zo0;->b:Ljava/lang/String;")) {
            int count = 0;
            for (ClassDef c : classes) for (Field f : c.getFields())
                if (signature.equals(f.toString()) && (f.getAccessFlags() & 1) != 0) count++;
            if (count != 1) throw unsupported("Missing public item field " + signature);
        }
        List<Instruction> ins = MonetPremiumPatch.instructions(found.get(STATE));
        if (ins.size() != 1255 || !NuvioPlaybackButtonsPatch.reference(ins.get(686)).equals("La/zo0;->b:Ljava/lang/String;")
            || !NuvioPlaybackButtonsPatch.reference(ins.get(687)).equals("La/y62;->k(Ljava/lang/Object;Ljava/lang/Object;)Z")
            || !NuvioPlaybackButtonsPatch.reference(ins.get(965)).equals(SOURCES)) throw unsupported("Custom row selection layout changed");
        return found;
    }
    static void apply(MutableMethod method) {
        String signature = method.toString();
        if (!CONTRACTS.containsKey(signature) || !CONTRACTS.get(signature).equals(NuvioPlaybackButtonsPatch.fingerprint(method)))
            throw unsupported("Changed or already patched method " + signature);
        if (signature.equals(MODEL)) {
            var original = (ThreeRegisterInstruction) MonetPremiumPatch.instructions(method).get(215);
            method.getImplementation().replaceInstruction(215, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 20, 1,
                new ImmutableMethodReference(EXTENSION, "wrap", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;")));
            method.getImplementation().addInstruction(216, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 15));
            method.getImplementation().addInstruction(217, new BuilderInstruction21c(Opcode.CHECK_CAST, 15,
                new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("La/nj1;")));
            method.getImplementation().addInstruction(218, new BuilderInstruction23x(Opcode.APUT_OBJECT, 15, original.getRegisterB(), original.getRegisterC()));
        } else if (signature.equals(RESUME) || signature.equals(PAUSE)) {
            method.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                signature.equals(RESUME) ? 14 : 7, 1, new ImmutableMethodReference(
                    "Lsoftware/santodan/extension/monetchannels/CatalogRefresh;", signature.equals(RESUME) ? "resume" : "pause", List.of("Ljava/lang/Object;"), "V")));
        } else if (signature.equals(OWNER)) {
            method.getImplementation().replaceInstruction(7, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 2, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "owner", List.of("Ljava/lang/String;"), "Ljava/lang/String;")));
            method.getImplementation().addInstruction(8, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
            method.getImplementation().addInstruction(9, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 2));
        } else if (signature.equals(HEADER)) {
            method.getImplementation().addInstruction(80, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 6, 2, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "contentLabel", List.of("Ljava/lang/String;", "Ljava/lang/Object;"), "Ljava/lang/String;")));
            method.getImplementation().addInstruction(81, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6));
        } else if (signature.equals(PICKER)) {
            List<String> parameters = List.of("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/Object;",
                "Ljava/lang/Object;", "Z", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                "Ljava/lang/Object;", "Ljava/lang/Object;", "I", "I", "I");
            method.getImplementation().replaceInstruction(1465, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 6, 15,
                new ImmutableMethodReference(EXTENSION, "contentPicker", parameters, "V")));
            method.getImplementation().addInstruction(1465, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 44, 1,
                new ImmutableMethodReference(EXTENSION, "preparePicker", List.of("Ljava/lang/Object;"), "V")));
        } else if (signature.equals(READER)) {
            method.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 31, 4,
                new ImmutableMethodReference(EXTENSION, "reader", List.of("Landroid/content/Context;", "Ljava/lang/Object;", "I", "Ljava/lang/Object;"), "V")));
        } else if (signature.equals(PROGRAMS)) {
            method.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 8, 1,
                new ImmutableMethodReference(EXTENSION, "programs", List.of("Ljava/util/List;"), "V")));
        } else if (signature.equals(STATE)) {
            // v15 holds the item, v8 the saved source ID. Keep the native branch and move-result.
            method.getImplementation().replaceInstruction(687, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 15, 8, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "matches", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")));
            // Same width as iget-object; retain the object for the callback and all code addresses.
            method.getImplementation().replaceInstruction(686, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 15, 15));
            method.getImplementation().replaceInstruction(965, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 4, 10, 14, 1, 11, 0,
                new ImmutableMethodReference(EXTENSION, "sources", List.of("Ljava/util/List;", "Ljava/util/LinkedHashMap;", "Ljava/util/Set;", "Ljava/util/Locale;"), "Ljava/util/List;")));
            method.getImplementation().replaceInstruction(699, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 8, 7, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "hidden", List.of("Ljava/util/Set;", "Ljava/lang/Object;"), "Ljava/util/LinkedHashSet;")));
            // Replace the existing target so all incoming branches obtain independent catalog data.
            method.getImplementation().replaceInstruction(675, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 10, 8, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rowItems", List.of("Ljava/util/ArrayList;", "Ljava/lang/Object;"), "Ljava/util/ArrayList;")));
            method.getImplementation().addInstruction(676, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 10));
            method.getImplementation().addInstruction(677, new BuilderInstruction21c(Opcode.NEW_INSTANCE, 11,
                new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Ljava/util/ArrayList;")));
            method.getImplementation().replaceInstruction(547, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 7, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "selection", List.of("Ljava/lang/Object;"), "Ljava/lang/String;")));
        } else if (signature.equals(FILTER)) {
            method.getImplementation().replaceInstruction(111, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 1, 8, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "disabled", List.of("Ljava/util/Set;", "Ljava/lang/Object;"), "Z")));
        } else throw unsupported("Method is not a mutation target");
    }
}
