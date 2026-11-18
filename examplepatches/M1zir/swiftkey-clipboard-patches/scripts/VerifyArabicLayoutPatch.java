import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.ZipFile;
import java.util.zip.InflaterInputStream;
import java.io.DataInputStream;
import java.io.InputStream;

/** Executes the actual chooser DEX using a limited model; not Android/ART testing.
 * Compile alongside VerifyClipboardPatch.java, which supplies DEX/signature helpers.
 */
class VerifyArabicLayoutPatch {
    enum Layout {
        ARABIC_WESTERN, ARABIC_WESTERN_V2, ARABIC_3_WESTERN, ARABIC_V2, ARABIC_2,
        ARABIC_2_WESTERN, ARABIC_3_V2, ARABIC_3_WESTERN_V2,
        QWERTY, AZERTY, ARABIC_FARSI, ARABIC_URDU
    }
    record Pack(Layout primary, List<Layout> alternates) {}
    record Key(String label, String output, String alternatives) {}
    static int checks;
    static void check(boolean ok, String message) {
        checks++;
        if (!ok) throw new AssertionError(message);
    }
    static String reference(Instruction i) {
        return ((ReferenceInstruction)i).getReference().toString();
    }
    // SwiftKey's .json-named key maps are zlib-compressed binary records.
    // Read their actual primary labels separately from long-press alternatives;
    // a flat string search cannot distinguish و from a dedicated ؤ key.
    static List<List<Key>> readKeyRows(InputStream input) throws Exception {
        try (var data = new DataInputStream(new InflaterInputStream(input))) {
            check(data.readInt() == 1 && data.readInt() == 3, "Unexpected key-map schema");
            data.readBoolean(); data.readUTF();
            data.readDouble(); data.readDouble(); data.readUTF();
            int count = data.readInt();
            check(count > 3 && count < 100, "Invalid row count");
            var rows = new ArrayList<List<Key>>();
            for (int row = 0; row < count; row++) {
                data.readShort(); data.readShort(); data.readBoolean(); data.readDouble();
                int size = data.readInt();
                if (size < 0 || size > 100) throw new AssertionError("Invalid key count");
                var keys = new ArrayList<Key>();
                for (int key = 0; key < size; key++) {
                    data.skipNBytes(32); // six shorts, two doubles, four booleans
                    String[] fields = new String[6];
                    for (int f = 0; f < fields.length; f++) fields[f] = data.readUTF();
                    keys.add(new Key(fields[4], fields[3], fields[5]));
                    data.readDouble(); data.readBoolean();
                    if (!data.readBoolean()) data.readUTF();
                    data.skipNBytes(32); // four geometry doubles
                }
                rows.add(keys);
            }
            return rows;
        }
    }
    static void verifyRequestedArrangement(List<List<Key>> rows) {
        String[][] expected = {
            {"ض", "ص", "ث", "ق", "ف", "غ", "ع", "ه", "خ", "ح", "ج"},
            {"ش", "س", "ي", "ب", "ل", "ا", "ت", "ن", "م", "ك", "ط"},
            {"ذ", "ء", "و", "ر", "ى", "ة", "ز", "ظ", "د"},
        };
        for (int row = 0; row < expected.length; row++) {
            var labels = rows.get(row + 1).stream().map(Key::label).toList();
            check(labels.size() >= expected[row].length &&
                labels.subList(0, expected[row].length).equals(Arrays.asList(expected[row])),
                "Wrong legacy letter arrangement on row " + row);
            check(!labels.contains("ؤ"), "Dedicated ؤ key present");
        }
        Key waw = rows.get(3).get(2);
        check(waw.label().equals("و") && (waw.output().isEmpty() || waw.output().equals("و")),
            "Waw key label/output is not و");
        check(waw.alternatives().contains("ؤ"), "Native long-press ؤ was lost");
    }
    @SuppressWarnings("unchecked")
    static List<Layout> execute(Method method, Pack pack) {
        var instructions = VerifyClipboardPatch.body(method);
        Object[] r = new Object[method.getImplementation().getRegisterCount()];
        r[r.length - 1] = pack;
        Map<Integer,Integer> targets = new HashMap<>();
        int offset = 0;
        for (int n = 0; n < instructions.size(); n++) {
            targets.put(offset, n);
            offset += instructions.get(n).getCodeUnits();
        }
        Object result = null;
        offset = 0;
        int pc = 0;
        for (int step = 0; step < 100; step++) {
            Instruction i = instructions.get(pc);
            int a = i instanceof OneRegisterInstruction x ? x.getRegisterA() : -1;
            int b = i instanceof TwoRegisterInstruction x ? x.getRegisterB() : -1;
            boolean jump = false;
            switch (i.getOpcode()) {
                case NEW_INSTANCE -> r[a] = switch (reference(i)) {
                    case "Ljava/util/ArrayList;" -> new ArrayList<Layout>();
                    case "Luj0/n;" -> Comparator.comparing((Layout x) -> x.name().toLowerCase(Locale.ROOT));
                    default -> throw new AssertionError(reference(i));
                };
                case IGET_OBJECT -> {
                    Pack receiver = (Pack) r[b];
                    r[a] = switch (reference(i)) {
                        case "Luj0/f;->a:Ljava/util/ArrayList;" -> receiver.alternates();
                        case "Luj0/f;->c:Lxj0/a;" -> receiver.primary();
                        default -> throw new AssertionError(reference(i));
                    };
                }
                case CONST_4 -> r[a] = (int)((WideLiteralInstruction)i).getWideLiteral();
                case CONST_STRING, CONST_STRING_JUMBO ->
                    r[a] = ((StringReference)((ReferenceInstruction)i).getReference()).getString();
                case INVOKE_DIRECT, INVOKE_STATIC, INVOKE_VIRTUAL -> {
                    FiveRegisterInstruction call = (FiveRegisterInstruction)i;
                    int c = call.getRegisterC(), d = call.getRegisterD(), e = call.getRegisterE();
                    String ref = reference(i);
                    switch (ref) {
                        case "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V" ->
                            ((List<Layout>)r[c]).addAll((Collection<Layout>)r[d]);
                        case "Ljava/lang/Object;-><init>()V" -> { }
                        case "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V" ->
                            ((List<Layout>)r[c]).sort((Comparator<Layout>)r[d]);
                        case "Ljava/util/ArrayList;->add(ILjava/lang/Object;)V" ->
                            ((List<Layout>)r[c]).add((Integer)r[d], (Layout)r[e]);
                        case "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" ->
                            result = ((List<Layout>)r[c]).add((Layout)r[d]) ? 1 : 0;
                        case "Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z" ->
                            result = ((List<Layout>)r[c]).contains(r[d]) ? 1 : 0;
                        case "Lxj0/a;->valueOf(Ljava/lang/String;)Lxj0/a;" -> result = Layout.valueOf((String)r[c]);
                        case "Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;" ->
                            result = Collections.unmodifiableList((List<Layout>)r[c]);
                        default -> throw new AssertionError("Unsupported call " + ref);
                    }
                }
                case MOVE_RESULT_OBJECT, MOVE_RESULT -> r[a] = result;
                case IF_EQZ -> jump = ((Integer)r[a]) == 0;
                case IF_NEZ -> jump = ((Integer)r[a]) != 0;
                case NOP -> { }
                case RETURN_OBJECT -> { return (List<Layout>)r[a]; }
                default -> throw new AssertionError("Unsupported opcode " + i.getOpcode());
            }
            if (jump) {
                offset += ((OffsetInstruction)i).getCodeOffset();
                pc = Objects.requireNonNull(targets.get(offset));
            } else {
                offset += i.getCodeUnits();
                pc++;
            }
        }
        throw new AssertionError("Execution limit exceeded");
    }
    static void exercise(Method original, Method patched, Pack pack) {
        var originalAlternates = List.copyOf(pack.alternates());
        var before = execute(original, pack);
        var after = execute(patched, pack);
        var expected = new ArrayList<>(before);
        if (before.contains(Layout.ARABIC_3_WESTERN_V2) && !before.contains(Layout.ARABIC_3_WESTERN))
            expected.add(Layout.ARABIC_3_WESTERN);
        check(after.equals(expected), "Incorrect layout list for " + pack);
        check(after.getFirst() == pack.primary(), "Default selection moved");
        check(pack.alternates().equals(originalAlternates), "Stored pack data was mutated");
        check(execute(patched, pack).equals(after), "Repeated reads change result");
        try {
            after.add(Layout.QWERTY);
            throw new AssertionError("Result is mutable");
        } catch (UnsupportedOperationException expectedException) { checks++; }
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("original.apk patched.apk");
        var original = VerifyClipboardPatch.load(args[0]);
        var patched = VerifyClipboardPatch.load(args[1]);
        var oldMethod = VerifyClipboardPatch.method(original, "Luj0/f;", "a");
        var newMethod = VerifyClipboardPatch.method(patched, "Luj0/f;", "a");
        var before = VerifyClipboardPatch.signatures(oldMethod);
        var after = VerifyClipboardPatch.signatures(newMethod);
        check(after.size() == before.size() + 13, "Unexpected patch size");
        check(after.subList(0, 9).equals(before.subList(0, 9)), "Original list construction changed");
        check(after.subList(22, after.size()).equals(before.subList(9, before.size())), "Original immutable return changed");
        check(newMethod.getImplementation().getRegisterCount() == 4, "Registers changed");
        for (String cls : List.of("Lxj0/a;", "Luj0/e;", "Luj0/f;")) {
            Map<String,Method> methods = new HashMap<>();
            for (Method m : patched.get(cls).getMethods()) methods.put(m.toString(), m);
            for (Method m : original.get(cls).getMethods()) {
                if (cls.equals("Luj0/f;") && m.getName().equals("a")) continue;
                check(methods.containsKey(m.toString()), "Method removed: " + m);
                if (m.getImplementation() != null)
                    check(VerifyClipboardPatch.signatures(m).equals(VerifyClipboardPatch.signatures(methods.get(m.toString()))),
                        "Selection, persistence or enum changed: " + m);
            }
        }
        try (ZipFile a = new ZipFile(args[0]); ZipFile b = new ZipFile(args[1])) {
            for (String suffix : List.of("", "_compact", "_pc")) {
                String name = "res/raw/keyboard_layout_standard_arabic_3_western" + suffix + ".json";
                check(Arrays.equals(a.getInputStream(a.getEntry(name)).readAllBytes(),
                    b.getInputStream(b.getEntry(name)).readAllBytes()), "Legacy key map changed: " + name);
                verifyRequestedArrangement(readKeyRows(b.getInputStream(b.getEntry(name))));
            }
            // Guard against the specific regression: the similarly named modern
            // variant has ؤ at this position; the restored legacy one has و.
            String modern = "res/raw/keyboard_layout_standard_arabic_3_western_v2.json";
            check(readKeyRows(a.getInputStream(a.getEntry(modern))).get(3).get(2).label().equals("ؤ"),
                "Modern-layout regression fixture changed");
        }
        int structural = checks;
        // Exact layouts from Microsoft's four Arabic model archives, inspected 2026-11-11.
        for (String locale : List.of("ar_MA", "ar_SA", "ar_TN", "ar_DZ")) {
            Layout primary = locale.equals("ar_SA") ? Layout.ARABIC_2 : Layout.ARABIC_2_WESTERN;
            exercise(oldMethod, newMethod, new Pack(primary, List.of(Layout.ARABIC_V2,
                Layout.ARABIC_WESTERN_V2, locale.equals("ar_SA") ? Layout.ARABIC_2_WESTERN : Layout.ARABIC_2,
                Layout.ARABIC_3_V2, Layout.ARABIC_3_WESTERN_V2)));
        }
        // Default modern/legacy, existing legacy, empty alternatives, non-Arabic,
        // mixed lists, and subsequent language-pack refreshes.
        for (Layout primary : Layout.values()) {
            for (List<Layout> alternatives : List.of(List.<Layout>of(), List.of(Layout.ARABIC_3_WESTERN_V2),
                    List.of(Layout.ARABIC_3_WESTERN_V2, Layout.ARABIC_3_WESTERN),
                    List.of(Layout.ARABIC_WESTERN_V2, Layout.ARABIC_WESTERN),
                    List.of(Layout.QWERTY, Layout.AZERTY), List.of(Layout.ARABIC_FARSI, Layout.ARABIC_URDU)))
                exercise(oldMethod, newMethod, new Pack(primary, alternatives));
        }
        System.out.println("PASS: " + (checks - structural) + " emitted-DEX layout behavior assertions; " + structural + " structural/resource checks.");
        System.out.println("PASS: original defaults, choices, immutable results, pack data and save/select methods preserved.");
        System.out.println("Scope: limited DEX execution model, not Android/ART or device validation.");
    }
}
