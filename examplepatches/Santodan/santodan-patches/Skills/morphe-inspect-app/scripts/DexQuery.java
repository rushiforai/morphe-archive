import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

/**
 * Compact read-only DEX queries for Morphe inspection. Prints only matching lines.
 *
 * java -cp <dexlib2.jar;guava.jar> DexQuery.java <mode> <needle> <input>...
 *   input: an APK/APKS member APK, a folder containing classes*.dex, or .dex files.
 *   refs <text>      call sites/field uses whose reference contains text
 *   strings <text>   const-string uses containing text (case-insensitive)
 *   literal <n>      const uses of an int literal (hex or decimal), e.g. 0x7f1103ed
 *   methods <text>   method signatures containing text, with flags/registers/size
 *   dump <methodRef> one method: pc, opcode, registers, reference, branch targets,
 *                    try ranges and branch-target marks (*) for hook placement
 */
public class DexQuery {
    public static void main(String[] a) throws Exception {
        if (a.length < 3) { System.err.println("usage: DexQuery refs|strings|literal|methods|dump <needle> <input>..."); System.exit(2); }
        String mode = a[0], needle = a[1];
        long literal = mode.equals("literal") ? Long.decode(needle) : 0;
        int hits = 0;
        for (var entry : dexes(Arrays.copyOfRange(a, 2, a.length)).entrySet()) {
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, new BufferedInputStream(new ByteArrayInputStream(entry.getValue())));
            for (ClassDef c : dex.getClasses()) for (Method m : c.getMethods()) {
                String sig = m.toString();
                if (mode.equals("methods")) {
                    if (sig.contains(needle)) { hits++; System.out.println(entry.getKey() + " " + sig + " flags=0x" + Integer.toHexString(m.getAccessFlags())
                        + (m.getImplementation() == null ? "" : " regs=" + m.getImplementation().getRegisterCount() + " units=" + units(m))); }
                    continue;
                }
                if (mode.equals("dump")) { if (sig.equals(needle)) { hits++; dump(entry.getKey(), m); } continue; }
                if (m.getImplementation() == null) continue;
                int pc = 0;
                for (Instruction i : m.getImplementation().getInstructions()) {
                    String ref = i instanceof ReferenceInstruction r ? r.getReference().toString() : null;
                    boolean match = switch (mode) {
                        case "refs" -> ref != null && !(((ReferenceInstruction) i).getReference() instanceof StringReference) && ref.contains(needle);
                        case "strings" -> ref != null && ((ReferenceInstruction) i).getReference() instanceof StringReference && ref.toLowerCase(Locale.ROOT).contains(needle.toLowerCase(Locale.ROOT));
                        case "literal" -> i instanceof WideLiteralInstruction w && w.getWideLiteral() == literal;
                        default -> throw new IllegalArgumentException("unknown mode " + mode);
                    };
                    if (match) { hits++; System.out.println(entry.getKey() + " " + sig + " @" + pc + " " + i.getOpcode() + (ref == null ? "" : " " + ref)); }
                    pc += i.getCodeUnits();
                }
            }
        }
        System.out.println("hits=" + hits);
    }

    static int units(Method m) { int n = 0; for (Instruction i : m.getImplementation().getInstructions()) n += i.getCodeUnits(); return n; }

    static void dump(String dexName, Method m) {
        var impl = m.getImplementation();
        System.out.println("METHOD " + m + " in " + dexName + " flags=0x" + Integer.toHexString(m.getAccessFlags())
            + " regs=" + (impl == null ? 0 : impl.getRegisterCount()) + " params=" + m.getParameters().size());
        if (impl == null) return;
        List<Instruction> list = new ArrayList<>(); List<Integer> pcs = new ArrayList<>(); int pc = 0;
        for (Instruction i : impl.getInstructions()) { list.add(i); pcs.add(pc); pc += i.getCodeUnits(); }
        Set<Integer> targets = new TreeSet<>();
        for (int k = 0; k < list.size(); k++) {
            Instruction i = list.get(k);
            if (!(i instanceof OffsetInstruction o)) continue;
            int t = pcs.get(k) + o.getCodeOffset();
            if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                int idx = pcs.indexOf(t);
                if (idx >= 0 && list.get(idx) instanceof SwitchPayload p) for (var e : p.getSwitchElements()) targets.add(pcs.get(k) + e.getOffset());
            } else targets.add(t);
        }
        for (var tb : impl.getTryBlocks()) {
            StringBuilder h = new StringBuilder();
            for (var e : tb.getExceptionHandlers()) { targets.add(e.getHandlerCodeAddress()); h.append(' ').append(e.getExceptionType() == null ? "*" : e.getExceptionType()).append("->").append(e.getHandlerCodeAddress()); }
            System.out.println("TRY " + tb.getStartCodeAddress() + ".." + (tb.getStartCodeAddress() + tb.getCodeUnitCount()) + h);
        }
        for (int k = 0; k < list.size(); k++) {
            Instruction i = list.get(k); int at = pcs.get(k);
            StringBuilder s = new StringBuilder().append(targets.contains(at) ? '*' : ' ').append(k).append(" @").append(at).append(' ').append(i.getOpcode());
            if (i instanceof OneRegisterInstruction r) s.append(" v").append(r.getRegisterA());
            if (i instanceof TwoRegisterInstruction r) s.append(",v").append(r.getRegisterB());
            if (i instanceof ThreeRegisterInstruction r) s.append(",v").append(r.getRegisterC());
            if (i instanceof RegisterRangeInstruction r) s.append(" {v").append(r.getStartRegister()).append("..v").append(r.getStartRegister() + r.getRegisterCount() - 1).append('}');
            if (i instanceof FiveRegisterInstruction r) { s.append(" {"); int[] regs = {r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG()}; for (int x = 0; x < r.getRegisterCount(); x++) s.append(x == 0 ? "v" : ",v").append(regs[x]); s.append('}'); }
            if (i instanceof WideLiteralInstruction w) s.append(" #").append(w.getWideLiteral());
            if (i instanceof ReferenceInstruction r) s.append(' ').append(r.getReference());
            if (i instanceof OffsetInstruction o) s.append(" ->").append(at + o.getCodeOffset());
            System.out.println(s);
        }
    }

    /** Collects classes*.dex from folders, .dex files, or APK zip members (including APKs nested in .apks/.apkm/.xapk). */
    static Map<String, byte[]> dexes(String[] inputs) throws IOException {
        Map<String, byte[]> out = new TreeMap<>();
        for (String input : inputs) {
            Path p = Path.of(input);
            if (Files.isDirectory(p)) {
                try (var s = Files.list(p)) { for (Path f : s.filter(f -> f.getFileName().toString().matches("classes\\d*\\.dex")).sorted().toList()) out.put(f.getFileName().toString(), Files.readAllBytes(f)); }
            } else if (input.endsWith(".dex")) out.put(p.getFileName().toString(), Files.readAllBytes(p));
            else try (var zip = new ZipInputStream(new BufferedInputStream(Files.newInputStream(p)))) { zip(p.getFileName().toString(), zip, out); }
        }
        if (out.isEmpty()) throw new IllegalArgumentException("No classes*.dex found in inputs");
        return out;
    }

    static void zip(String prefix, ZipInputStream zip, Map<String, byte[]> out) throws IOException {
        for (ZipEntry e; (e = zip.getNextEntry()) != null; ) {
            if (e.getName().matches("classes\\d*\\.dex")) out.put(prefix + "!" + e.getName(), zip.readAllBytes());
            else if (e.getName().endsWith(".apk")) zip(prefix + "!" + e.getName(), new ZipInputStream(new ByteArrayInputStream(zip.readAllBytes())), out);
        }
    }
}
