package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.writer.util.TryListBuilder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;

/** Index-independent fingerprint of executable instructions and ordered exception coverage. */
public final class SummaryBytecodeGuard {
    private SummaryBytecodeGuard() {}

    public static String fingerprint(Method method) {
        var body = method.getImplementation();
        if (body == null) throw new IllegalStateException("Missing summary hook body: " + method);
        StringBuilder value = new StringBuilder().append(method.getAccessFlags()).append('/').append(body.getRegisterCount()).append('\n');
        for (Instruction instruction : body.getInstructions()) {
            value.append(instruction.getOpcode()).append('/').append(instruction.getCodeUnits());
            if (instruction instanceof OneRegisterInstruction x) value.append("/a").append(x.getRegisterA());
            if (instruction instanceof TwoRegisterInstruction x) value.append("/b").append(x.getRegisterB());
            if (instruction instanceof ThreeRegisterInstruction x) value.append("/c").append(x.getRegisterC());
            if (instruction instanceof VariableRegisterInstruction x) value.append("/n").append(x.getRegisterCount());
            if (instruction instanceof FiveRegisterInstruction x) value.append('/').append(x.getRegisterC()).append('/').append(x.getRegisterD()).append('/').append(x.getRegisterE()).append('/').append(x.getRegisterF()).append('/').append(x.getRegisterG());
            if (instruction instanceof RegisterRangeInstruction x) value.append("/s").append(x.getStartRegister());
            if (instruction instanceof WideLiteralInstruction x) value.append("/l").append(x.getWideLiteral());
            if (instruction instanceof OffsetInstruction x) value.append("/o").append(x.getCodeOffset());
            if (instruction instanceof ReferenceInstruction x) value.append("/r").append(x.getReference());
            if (instruction instanceof DualReferenceInstruction x) value.append("/r2").append(x.getReference2());
            if (instruction instanceof SwitchPayload x) for (var entry : x.getSwitchElements()) value.append("/k").append(entry.getKey()).append(':').append(entry.getOffset());
            if (instruction instanceof ArrayPayload x) value.append("/w").append(x.getElementWidth()).append('/').append(x.getArrayElements());
            if (instruction instanceof VerificationErrorInstruction || instruction instanceof InlineIndexInstruction || instruction instanceof VtableIndexInstruction || instruction instanceof FieldOffsetInstruction)
                throw new IllegalStateException("Optimized summary bytecode is unsupported");
            value.append('\n');
        }
        for (var block : TryListBuilder.massageTryBlocks(body.getTryBlocks())) {
            value.append("try/").append(block.getStartCodeAddress()).append('/').append(block.getCodeUnitCount());
            for (var handler : block.getExceptionHandlers()) value.append('/').append(handler.getExceptionType()).append(':').append(handler.getHandlerCodeAddress());
            value.append('\n');
        }
        try {
            return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(value.toString().getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException impossible) {
            throw new AssertionError(impossible);
        }
    }
}
