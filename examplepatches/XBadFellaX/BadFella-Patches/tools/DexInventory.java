import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Read-only DEX metadata for update_check.py. Never emits string constant contents. */
class DexInventory {
    static String shape(MethodReference m) {
        return "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }
    static String id(MethodReference m) { return m.getDefiningClass() + "->" + m.getName() + shape(m); }
    static String hash(String value) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8)));
    }
    static String json(Object value) {
        if (value == null) return "null";
        if (value instanceof String s) {
            StringBuilder b = new StringBuilder("\"");
            for (char c : s.toCharArray()) {
                if (c == '"' || c == '\\') b.append('\\').append(c);
                else if (c < 32) b.append(String.format("\\u%04x", (int)c));
                else b.append(c);
            }
            return b.append('"').toString();
        }
        if (value instanceof Map<?,?> map) {
            List<String> entries = new ArrayList<>();
            map.forEach((k,v) -> entries.add(json(k.toString()) + ":" + json(v)));
            return "{" + String.join(",", entries) + "}";
        }
        if (value instanceof Collection<?> list) return "[" + String.join(",", list.stream().map(DexInventory::json).toList()) + "]";
        return value.toString();
    }
    static Set<String> calls(Method m) {
        Set<String> calls = new TreeSet<>();
        if (m.getImplementation() != null) for (var i : m.getImplementation().getInstructions())
            if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref) calls.add(id(ref));
        return calls;
    }
    static Map<String,Object> describe(Method m, Set<String> callers) throws Exception {
        var out = new LinkedHashMap<String,Object>();
        out.put("id", id(m)); out.put("owner", m.getDefiningClass()); out.put("name", m.getName());
        out.put("params", m.getParameterTypes()); out.put("return", m.getReturnType());
        out.put("flags", m.getAccessFlags()); out.put("calls", calls(m));
        out.put("callers", callers.stream().limit(8).toList());
        out.put("caller_count", callers.size()); out.put("callers_hash", hash(String.join("\n", callers)));
        Set<String> fields = new TreeSet<>(); Map<String,Integer> ops = new TreeMap<>();
        StringBuilder body = new StringBuilder();
        if (m.getImplementation() != null) {
            body.append("registers:").append(m.getImplementation().getRegisterCount());
            for (var i : m.getImplementation().getInstructions()) {
                String opcode = i.getOpcode().name(); ops.merge(opcode, 1, Integer::sum); body.append('|').append(opcode);
                if (i instanceof FiveRegisterInstruction r) body.append(":r").append(List.of(r.getRegisterCount(),r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()));
                else if (i instanceof RegisterRangeInstruction r) body.append(":r").append(r.getStartRegister()).append(':').append(r.getRegisterCount());
                else if (i instanceof ThreeRegisterInstruction r) body.append(":r").append(List.of(r.getRegisterA(),r.getRegisterB(),r.getRegisterC()));
                else if (i instanceof TwoRegisterInstruction r) body.append(":r").append(List.of(r.getRegisterA(),r.getRegisterB()));
                else if (i instanceof OneRegisterInstruction r) body.append(":r").append(r.getRegisterA());
                if (i instanceof ReferenceInstruction r) {
                    var ref = r.getReference();
                    // Hash constants in place: a changed key/URL changes the body hash without exposing it.
                    body.append(":ref:").append(ref instanceof StringReference s ? hash(s.getString()) : ref.toString());
                    if (ref instanceof FieldReference f) fields.add(f.getDefiningClass()+"->"+f.getName()+":"+f.getType());
                }
                if (i instanceof DualReferenceInstruction r) body.append(":ref2:").append(r.getReference2());
                if (i instanceof WideLiteralInstruction l) body.append(":n:").append(l.getWideLiteral());
                else if (i instanceof NarrowLiteralInstruction l) body.append(":n:").append(l.getNarrowLiteral());
                if (i instanceof OffsetInstruction o) body.append(":offset:").append(o.getCodeOffset());
                if (i instanceof SwitchPayload s) for (var e:s.getSwitchElements()) body.append(":switch:").append(e.getKey()).append(':').append(e.getOffset());
                if (i instanceof ArrayPayload a) body.append(":array:").append(a.getElementWidth()).append(a.getArrayElements());
            }
            for (var t : m.getImplementation().getTryBlocks()) {
                body.append(":try:").append(t.getStartCodeAddress()).append(':').append(t.getCodeUnitCount());
                for (var h:t.getExceptionHandlers()) body.append(':').append(h.getExceptionType()).append(':').append(h.getHandlerCodeAddress());
            }
        }
        out.put("fields", fields); out.put("ops", ops);
        out.put("body", m.getImplementation() == null ? null : hash(body.toString()));
        return out;
    }
    public static void main(String[] args) throws Exception {
        Set<String> owners = new HashSet<>(), shapes = new HashSet<>(), deep = new HashSet<>();
        for (String line : Files.readAllLines(Path.of(args[1]))) {
            String[] pair = line.split(" ", 2);
            switch(pair[0]) { case "owner" -> owners.add(pair[1]); case "shape" -> shapes.add(pair[1]); case "deep" -> deep.add(pair[1]); default -> throw new IOException("Unknown inventory directive"); }
        }
        var apk = DexFileFactory.loadDexContainer(new File(args[0]), null);
        Map<String,ClassDef> classes = new TreeMap<>(); Map<String,Method> methods = new TreeMap<>();
        for (String entry : apk.getDexEntryNames()) for (var c : apk.getEntry(entry).getDexFile().getClasses()) {
            if (classes.put(c.getType(), c) != null) throw new IOException("Duplicate DEX class");
            for (var m:c.getMethods()) methods.put(id(m), m);
        }
        Deque<String> parents = new ArrayDeque<>(owners);
        while (!parents.isEmpty()) {
            var c = classes.get(parents.remove()); if (c == null) continue;
            List<String> bases = new ArrayList<>(c.getInterfaces());
            if (c.getSuperclass() != null) bases.add(c.getSuperclass());
            for (String parent:bases) if (owners.add(parent)) parents.add(parent);
        }
        Set<String> selected = new TreeSet<>(), dependencies = new TreeSet<>();
        for (var m:methods.values()) if (owners.contains(m.getDefiningClass()) || shapes.contains(shape(m))) selected.add(id(m));
        Set<String> frontier = new TreeSet<>();
        for (var m:methods.values()) if (deep.contains(m.getDefiningClass()+"->"+m.getName())) frontier.add(id(m));
        for (int depth=0; depth<2; depth++) {
            Set<String> next = new TreeSet<>();
            for (String method:frontier) for (String call:calls(methods.get(method))) {
                if (call.startsWith("Lcom/ticktick/") && methods.containsKey(call) && dependencies.add(call)) next.add(call);
            }
            frontier = next;
            if (dependencies.size() > 2000) throw new IOException("Dependency scan exceeded its reviewed bound");
        }
        selected.addAll(dependencies);
        Map<String,Set<String>> callers = new HashMap<>();
        for (var m:methods.values()) for (String call:calls(m)) if (selected.contains(call)) {
            var set = callers.computeIfAbsent(call, k -> new TreeSet<>());
            set.add(id(m));
        }
        for (var c:classes.values()) System.out.println(json(Map.of("kind","class", "owner",c.getType(), "super",Objects.toString(c.getSuperclass(),""), "interfaces",c.getInterfaces())));
        for (String method:selected) {
            var info=describe(methods.get(method), callers.getOrDefault(method, Collections.emptySet()));
            info.put("kind","method"); info.put("dependency",dependencies.contains(method));
            System.out.println(json(info));
        }
    }
}
