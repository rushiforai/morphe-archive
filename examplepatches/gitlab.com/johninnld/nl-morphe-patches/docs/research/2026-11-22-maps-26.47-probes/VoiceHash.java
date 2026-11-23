import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.nio.file.*;
import java.security.*;
import java.util.*;

/**
 * VoiceHash APK refs.txt
 * refs.txt: one "Ltype;->name(params)ret" per line. Prints
 * row: descriptor \t flags \t registers \t instructions \t sha256
 */
public class VoiceHash {
    static int count(Iterable<?> it){int n=0;for(Object o:it)n++;return n;}

    static String j(String s) {
        StringBuilder b = new StringBuilder("\"");
        for (char c : s.toCharArray()) {
            switch (c) {
                case '"': b.append("\\\""); break;
                case '\\': b.append("\\\\"); break;
                case '\b': b.append("\\b"); break;
                case '\f': b.append("\\f"); break;
                case '\n': b.append("\\n"); break;
                case '\r': b.append("\\r"); break;
                case '\t': b.append("\\t"); break;
                default:
                    if (c < ' ' || c == '\u2028' || c == '\u2029') b.append(String.format("\\u%04x", (int) c));
                    else b.append(c);
            }
        }
        return b.append('"').toString();
    }

    static String json(Object v) {
        if (v == null) return "null";
        if (v instanceof String) return j((String) v);
        if (v instanceof Number || v instanceof Boolean) return v.toString();
        if (v instanceof List) {
            StringBuilder b = new StringBuilder("[");
            List<?> l = (List<?>) v;
            for (int i = 0; i < l.size(); i++) { if (i > 0) b.append(","); b.append(json(l.get(i))); }
            return b.append("]").toString();
        }
        throw new IllegalArgumentException(v.getClass().toString());
    }

    static String fingerprint(Method m) throws Exception {
        MethodImplementation body = m.getImplementation();
        if (body == null) throw new IllegalStateException("no body");
        List<Object> rows = new ArrayList<>();
        for (Instruction i : body.getInstructions()) {
            List<Object> row = new ArrayList<>();
            row.add(i.getOpcode().toString());
            row.add(i.getCodeUnits());
            if (i instanceof OneRegisterInstruction) row.add(Arrays.asList("a", ((OneRegisterInstruction) i).getRegisterA()));
            if (i instanceof TwoRegisterInstruction) row.add(Arrays.asList("b", ((TwoRegisterInstruction) i).getRegisterB()));
            if (i instanceof ThreeRegisterInstruction) row.add(Arrays.asList("c", ((ThreeRegisterInstruction) i).getRegisterC()));
            if (i instanceof FiveRegisterInstruction) {
                FiveRegisterInstruction f = (FiveRegisterInstruction) i;
                row.add(Arrays.asList("invoke", f.getRegisterCount(), f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()));
            }
            if (i instanceof RegisterRangeInstruction) {
                RegisterRangeInstruction r = (RegisterRangeInstruction) i;
                row.add(Arrays.asList("range", r.getStartRegister(), r.getRegisterCount()));
            }
            if (i instanceof WideLiteralInstruction) row.add(Arrays.asList("literal", ((WideLiteralInstruction) i).getWideLiteral()));
            if (i instanceof OffsetInstruction) row.add(Arrays.asList("offset", ((OffsetInstruction) i).getCodeOffset()));
            if (i instanceof ReferenceInstruction) row.add(Arrays.asList("reference", ((ReferenceInstruction) i).getReference().toString()));
            if (i instanceof DualReferenceInstruction) row.add(Arrays.asList("reference2", ((DualReferenceInstruction) i).getReference2().toString()));
            if (i instanceof SwitchPayload) {
                for (SwitchElement e : ((SwitchPayload) i).getSwitchElements()) row.add(Arrays.asList("switch", e.getKey(), e.getOffset()));
            }
            if (i instanceof ArrayPayload) {
                ArrayPayload p = (ArrayPayload) i;
                row.add(Arrays.asList("array", p.getElementWidth(), p.getArrayElements()));
            }
            rows.add(row);
        }
        for (TryBlock<? extends ExceptionHandler> b : body.getTryBlocks()) {
            List<Object> hs = new ArrayList<>();
            for (ExceptionHandler h : b.getExceptionHandlers()) {
                hs.add(Arrays.asList(h.getExceptionType(), h.getHandlerCodeAddress()));
            }
            rows.add(Arrays.asList("try", b.getStartCodeAddress(), b.getCodeUnitCount(), hs));
        }
        MessageDigest d = MessageDigest.getInstance("SHA-256");
        byte[] digest = d.digest(json(rows).getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for (byte x : digest) hex.append(String.format("%02x", x & 0xff));
        return hex.toString();
    }

    public static void main(String[] args) throws Exception {
        var c = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        Map<String, ClassDef> byType = new HashMap<>();
        for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) byType.put(cd.getType(), cd);
        for (String line : Files.readAllLines(Paths.get(args[1]))) {
            line = line.trim();
            if (line.isEmpty()) continue;
            int arrow = line.indexOf("->");
            String owner = line.substring(0, arrow);
            String rest = line.substring(arrow + 2);
            String name = rest.substring(0, rest.indexOf('('));
            String params = rest.substring(rest.indexOf('(') + 1, rest.indexOf(')'));
            String ret = rest.substring(rest.indexOf(')') + 1);
            ClassDef cd = byType.get(owner);
            if (cd == null) { System.out.println("MISSING\t" + line); continue; }
            Method found = null;
            for (Method m : cd.getMethods()) {
                if (!m.getName().equals(name) || !m.getReturnType().equals(ret)) continue;
                StringBuilder b = new StringBuilder();
                for (CharSequence p : m.getParameterTypes()) b.append(p);
                if (b.toString().equals(params)) { found = m; break; }
            }
            if (found == null) { System.out.println("MISSING\t" + line); continue; }
            System.out.println(found.getAccessFlags() + "\t" + (found.getImplementation() == null ? -1 : found.getImplementation().getRegisterCount())
                + "\t" + (found.getImplementation() == null ? -1 : count(found.getImplementation().getInstructions()))
                + "\t" + fingerprint(found) + "\t" + line);
        }
    }
}
