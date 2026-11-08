package tw.maps;

import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Strict, reference-index-independent fingerprint of a complete method body. */
public final class MethodFingerprint {
    private MethodFingerprint() {}

    public static String canonical(Method method) {
        StringBuilder s = new StringBuilder(method.toString()).append('|').append(method.getAccessFlags());
        var code = method.getImplementation();
        if (code == null) return s.append("|native/abstract").toString();
        s.append('|').append(code.getRegisterCount()).append('\n');
        for (Instruction i : code.getInstructions()) {
            s.append(i.getOpcode().name()).append(':').append(i.getCodeUnits());
            if (i instanceof OneRegisterInstruction) s.append(" A").append(((OneRegisterInstruction)i).getRegisterA());
            if (i instanceof TwoRegisterInstruction) s.append(" B").append(((TwoRegisterInstruction)i).getRegisterB());
            if (i instanceof ThreeRegisterInstruction) s.append(" C").append(((ThreeRegisterInstruction)i).getRegisterC());
            if (i instanceof VariableRegisterInstruction) s.append(" N").append(((VariableRegisterInstruction)i).getRegisterCount());
            if (i instanceof FiveRegisterInstruction) {
                FiveRegisterInstruction x = (FiveRegisterInstruction)i;
                // Unused register slots are not semantic and can be normalized by writers.
                int[] registers = {x.getRegisterC(), x.getRegisterD(), x.getRegisterE(), x.getRegisterF(), x.getRegisterG()};
                for (int n = 0; n < x.getRegisterCount(); n++) s.append(" V").append(registers[n]);
            }
            if (i instanceof RegisterRangeInstruction) s.append(" S").append(((RegisterRangeInstruction)i).getStartRegister());
            if (i instanceof WideLiteralInstruction) s.append(" L").append(((WideLiteralInstruction)i).getWideLiteral());
            if (i instanceof OffsetInstruction) s.append(" O").append(((OffsetInstruction)i).getCodeOffset());
            if (i instanceof ReferenceInstruction) s.append(" R").append(((ReferenceInstruction)i).getReference());
            if (i instanceof DualReferenceInstruction) s.append(" R2").append(((DualReferenceInstruction)i).getReference2());
            if (i instanceof SwitchPayload) for (var e : ((SwitchPayload)i).getSwitchElements()) s.append(" K").append(e.getKey()).append('=').append(e.getOffset());
            if (i instanceof ArrayPayload) s.append(" DATA").append(((ArrayPayload)i).getElementWidth()).append(':').append(((ArrayPayload)i).getArrayElements());
            s.append('\n');
        }
        for (var t : code.getTryBlocks()) {
            s.append("TRY ").append(t.getStartCodeAddress()).append(':').append(t.getCodeUnitCount());
            for (var h : t.getExceptionHandlers()) s.append('|').append(h.getExceptionType()).append(':').append(h.getHandlerCodeAddress());
            s.append('\n');
        }
        return s.toString();
    }

    public static String sha256(Method method) { return sha256(canonical(method).getBytes(StandardCharsets.UTF_8)); }
    public static String sha256(byte[] data) {
        try {
            StringBuilder s = new StringBuilder();
            for (byte b : MessageDigest.getInstance("SHA-256").digest(data)) s.append(String.format("%02x", b & 255));
            return s.toString();
        } catch (Exception e) { throw new IllegalStateException(e); }
    }
}
