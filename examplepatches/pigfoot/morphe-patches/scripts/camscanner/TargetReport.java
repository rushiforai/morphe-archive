import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.writer.pool.*;
import com.android.tools.smali.dexlib2.writer.io.*;
import java.nio.*;
import java.nio.file.*;
import java.security.*;
import java.util.*;
import java.util.zip.*;

/** Read-only canonical class/method report. Emits tab records, not an acceptance list. */
public class TargetReport {
    static String hash(ClassDef c) throws Exception {
        var pool = new DexPool(Opcodes.forDexVersion(39)); pool.internClass(c);
        var store = new MemoryDataStore(); pool.writeTo(store);
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(store.getData()));
    }
    static String graph(Method m) {
        var p = m.getImplementation(); if (p == null) return "abstract/native";
        var out = new StringBuilder("registers=" + p.getRegisterCount() + "\n");
        int pc = 0;
        for (var i : p.getInstructions()) {
            out.append(pc).append(':').append(i.getOpcode());
            if (i instanceof ThreeRegisterInstruction v) out.append(" regs=").append(List.of(v.getRegisterA(),v.getRegisterB(),v.getRegisterC()));
            else if (i instanceof TwoRegisterInstruction v) out.append(" regs=").append(List.of(v.getRegisterA(),v.getRegisterB()));
            else if (i instanceof OneRegisterInstruction v) out.append(" reg=").append(v.getRegisterA());
            if (i instanceof FiveRegisterInstruction v) out.append(" args=").append(v.getRegisterCount()).append(List.of(v.getRegisterC(),v.getRegisterD(),v.getRegisterE(),v.getRegisterF(),v.getRegisterG()));
            if (i instanceof RegisterRangeInstruction v) out.append(" range=").append(v.getStartRegister()).append('/').append(v.getRegisterCount());
            if (i instanceof OffsetInstruction v) out.append(" target=").append(pc + v.getCodeOffset());
            if (i instanceof ReferenceInstruction v) out.append(" ref=").append(v.getReference());
            if (i instanceof DualReferenceInstruction v) out.append(" ref2=").append(v.getReference2());
            if (i instanceof WideLiteralInstruction v) out.append(" literal=").append(v.getWideLiteral());
            if (i instanceof SwitchPayload v) for (var e : v.getSwitchElements()) out.append(" switch=").append(e.getKey()).append(':').append(e.getOffset());
            if (i instanceof ArrayPayload v) out.append(" array=").append(v.getElementWidth()).append(':').append(v.getArrayElements());
            out.append('\n'); pc += i.getCodeUnits();
        }
        for (var t : p.getTryBlocks()) {
            out.append("try=").append(t.getStartCodeAddress()).append(':').append(t.getCodeUnitCount());
            for (var h : t.getExceptionHandlers()) out.append('/').append(h.getExceptionType()).append(':').append(h.getHandlerCodeAddress());
            out.append('\n');
        }
        return out.toString();
    }
    public static void main(String[] a) throws Exception {
        var wanted = new HashSet<>(Files.readAllLines(Path.of(a[1])));
        var found = new HashSet<String>();
        try (var z = new ZipFile(a[0])) {
            for (var e : Collections.list(z.entries())) {
                if (!e.getName().matches("classes[0-9]*\\.dex")) continue;
                var dex = new DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(z.getInputStream(e).readAllBytes()));
                for (var c : dex.getClasses()) if (wanted.contains(c.getType())) {
                    if (!found.add(c.getType())) throw new IllegalStateException("Duplicate target class: " + c.getType());
                    System.out.println("CLASS\t" + c.getType() + "\t" + hash(c));
                    for (var m : c.getMethods()) {
                        var one = new ImmutableClassDef(c.getType(), c.getAccessFlags(), c.getSuperclass(), c.getInterfaces(),
                            c.getSourceFile(), c.getAnnotations(), List.of(), List.of(m));
                        String id = m.getName() + "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
                        System.out.println("METHOD\t" + c.getType() + "\t" + id + "\t" + hash(one) + "\t" +
                            Base64.getEncoder().encodeToString(graph(m).getBytes(java.nio.charset.StandardCharsets.UTF_8)));
                    }
                }
            }
        }
        for (var type : wanted) if (!found.contains(type)) System.out.println("MISSING\t" + type);
    }
}
