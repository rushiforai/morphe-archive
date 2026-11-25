import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.google.gson.*;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.*;

/** Static DEX oracle. Hash instruction operands and typed catch ranges, not JADX text. */
public final class InspectBindings {
    private static final Gson JSON = new GsonBuilder().disableHtmlEscaping().create();

    private static String hash(byte[] bytes) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
    }

    private static List<Object> instruction(Instruction ins) {
        List<Object> row = new ArrayList<>();
        row.add(ins.getOpcode().name());
        row.add(ins.getCodeUnits());
        if (ins instanceof OneRegisterInstruction r) row.add(List.of("a", r.getRegisterA()));
        if (ins instanceof TwoRegisterInstruction r) row.add(List.of("b", r.getRegisterB()));
        if (ins instanceof ThreeRegisterInstruction r) row.add(List.of("c", r.getRegisterC()));
        if (ins instanceof FiveRegisterInstruction r) row.add(List.of("invoke", r.getRegisterCount(),
                r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG()));
        if (ins instanceof RegisterRangeInstruction r) row.add(List.of("range", r.getStartRegister(), r.getRegisterCount()));
        if (ins instanceof WideLiteralInstruction l) row.add(List.of("literal", l.getWideLiteral()));
        if (ins instanceof OffsetInstruction o) row.add(List.of("offset", o.getCodeOffset()));
        if (ins instanceof ReferenceInstruction r) row.add(List.of("reference", r.getReference().toString()));
        if (ins instanceof DualReferenceInstruction r) row.add(List.of("reference2", r.getReference2().toString()));
        if (ins instanceof SwitchPayload p) for (var e : p.getSwitchElements()) row.add(List.of("switch", e.getKey(), e.getOffset()));
        if (ins instanceof ArrayPayload p) row.add(List.of("array", p.getElementWidth(), p.getArrayElements()));
        return row;
    }

    private static Map<String, Object> method(Method method, String dexName, boolean includeInstructions) throws Exception {
        Map<String, Object> result = new TreeMap<>();
        result.put("dex", dexName);
        result.put("access_flags", method.getAccessFlags());
        var implementation = method.getImplementation();
        if (implementation == null) throw new IllegalArgumentException("Selected method has no code: " + method);
        result.put("register_count", implementation.getRegisterCount());
        List<Object> body = new ArrayList<>();
        SortedSet<String> references = new TreeSet<>();
        int codeUnits = 0;
        for (var ins : implementation.getInstructions()) {
            body.add(instruction(ins));
            codeUnits += ins.getCodeUnits();
            if (ins instanceof ReferenceInstruction r) references.add(r.getReference().toString());
            if (ins instanceof DualReferenceInstruction r) references.add(r.getReference2().toString());
        }
        result.put("instruction_count", body.size());
        result.put("code_units", codeUnits);
        for (var block : implementation.getTryBlocks()) {
            List<Object> handlers = new ArrayList<>();
            for (var h : block.getExceptionHandlers()) handlers.add(Arrays.asList(h.getExceptionType(), h.getHandlerCodeAddress()));
            body.add(List.of("try", block.getStartCodeAddress(), block.getCodeUnitCount(), handlers));
        }
        result.put("body_sha256", hash(JSON.toJson(body).getBytes(StandardCharsets.UTF_8)));
        result.put("references", references);
        if (includeInstructions) result.put("instructions_and_catches", body);
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Usage: InspectBindings original.apk selection.json");
        var selection = JsonParser.parseString(Files.readString(Path.of(args[1]))).getAsJsonObject();
        var requested = selection.getAsJsonObject("methods");
        boolean includeInstructions = selection.has("include_instructions") && selection.get("include_instructions").getAsBoolean();
        Map<String, Object> methods = new TreeMap<>();
        Map<String, Object> enums = new TreeMap<>();
        Set<String> remainingMethods = new TreeSet<>();
        for (var entry : requested.entrySet()) for (var name : entry.getValue().getAsJsonArray())
            remainingMethods.add(entry.getKey() + "->" + name.getAsString());
        Set<String> remainingEnums = new TreeSet<>();
        for (var name : selection.getAsJsonArray("enums")) remainingEnums.add(name.getAsString());
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (var dexName : dex.getDexEntryNames()) for (var cls : dex.getEntry(dexName).getDexFile().getClasses()) {
            if (remainingEnums.contains(cls.getType())) {
                if ((cls.getAccessFlags() & 0x4000) == 0) throw new IllegalArgumentException("Not an enum: " + cls.getType());
                SortedSet<String> values = new TreeSet<>();
                for (var field : cls.getStaticFields()) if ((field.getAccessFlags() & 0x4000) != 0) values.add(field.getName());
                if (values.isEmpty()) throw new IllegalArgumentException("Enum without values: " + cls.getType());
                enums.put(cls.getType(), values);
            }
            if (!requested.has(cls.getType())) continue;
            Set<String> names = new HashSet<>();
            for (var name : requested.getAsJsonArray(cls.getType())) names.add(name.getAsString());
            for (var m : cls.getMethods()) if (names.contains(m.getName())) {
                if (methods.put(m.toString(), method(m, dexName, includeInstructions)) != null) throw new IllegalArgumentException("Duplicate method: " + m);
                remainingMethods.remove(cls.getType() + "->" + m.getName());
            }
        }
        remainingEnums.removeAll(enums.keySet());
        if (!remainingMethods.isEmpty() || !remainingEnums.isEmpty())
            throw new IllegalArgumentException("Missing methods " + remainingMethods + " / enums " + remainingEnums);
        Map<String, Object> result = new TreeMap<>();
        result.put("format", 1);
        result.put("artifact_sha256", hash(Files.readAllBytes(Path.of(args[0]))));
        result.put("methods", methods);
        result.put("enums", enums);
        if (selection.has("warning_entry_points")) {
            SortedSet<String> roots = new TreeSet<>();
            for (var item : selection.getAsJsonArray("warning_entry_points")) {
                String name = item.getAsString();
                if (!methods.containsKey(name) || !roots.add(name))
                    throw new IllegalArgumentException("Missing or duplicate warning entry point: " + name);
            }
            if (roots.isEmpty()) throw new IllegalArgumentException("Empty warning entry point inventory");
            result.put("warning_entry_points", roots);
        }
        System.out.println(JSON.toJson(result));
    }
}
