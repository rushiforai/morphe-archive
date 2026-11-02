package app.spicetify.patches.spotify.settings;

import com.android.tools.smali.dexlib2.formatter.DexFormatter;
import com.android.tools.smali.dexlib2.iface.Annotation;
import com.android.tools.smali.dexlib2.iface.AnnotationElement;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.ExceptionHandler;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MethodParameter;
import com.android.tools.smali.dexlib2.iface.TryBlock;
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FieldOffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.InlineIndexInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchElement;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.VerificationErrorInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.VtableIndexInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.util.ReferenceUtil;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/** Snapshot of the native constructors, renderers, navigation, and DI traced for this build. */
public final class NativeSettingsAbi {
    public static final List<String> TYPES = Arrays.asList(
        "Lcom/spotify/music/SpotifyApplication;", "Lp/xlt;", "Lp/ion;", "Lp/yv80;",
        "Lp/tdn;", "Lp/tcn;", "Lp/afr;", "Lp/rp60;", "Lp/rfr0;", "Lp/xh0;",
        "Lp/tyh0;", "Lp/gtl;", "Lp/ftl;", "Lp/dtl;", "Lp/etl;", "Lp/qf60;",
        "Lkotlin/jvm/functions/Function1;", "Lp/gke;", "Lp/k2u;", "Lp/osa0;",
        "Lp/hka1;", "Lp/wgy0;", "Lp/dm70;", "Lp/s8;", "Lp/qte;", "Lp/pmy0;",
        "Lp/cmy0;", "Lp/rk50;", "Lp/nsa0;", "Lp/gv90;", "Lp/abe1;", "Lp/c3g0;"
    );

    /**
     * SHA-256 of {@link #describe}. It hashes what the class does, not the bytes a dexlib2 writer lays
     * out for it: the dexlib2 that Morphe patcher 2.x ships orders type lists differently, which moved
     * the digest of nearly every class and made every patch refuse the verified Spotify APK.
     */
    public static String digest(ClassDef definition) throws NoSuchAlgorithmException {
        StringBuilder hex = new StringBuilder();
        byte[] text = describe(definition).getBytes(StandardCharsets.UTF_8);
        for (byte value : MessageDigest.getInstance("SHA-256").digest(text)) {
            hex.append(Character.forDigit((value & 255) >>> 4, 16));
            hex.append(Character.forDigit(value & 15, 16));
        }
        return hex.toString();
    }

    /**
     * Everything about a class that a hook can depend on, as text: flags, supertypes, annotations, and
     * each field and method with its registers, instructions and try blocks. Members are sorted, so the
     * order dexlib2 returns them in doesn't matter. Debug info and parameter names are left out.
     */
    static String describe(ClassDef definition) {
        StringBuilder text = new StringBuilder("class ").append(definition.getType()).append(' ')
            .append(definition.getAccessFlags()).append(" super=").append(definition.getSuperclass())
            .append(" interfaces=[").append(String.join(", ", definition.getInterfaces())).append(']')
            .append(" source=").append(definition.getSourceFile()).append('\n');
        annotations(text, "", "", definition.getAnnotations());
        List<String> members = new ArrayList<>();
        for (Field field : definition.getFields()) members.add(describe(field));
        for (Method method : definition.getMethods()) members.add(describe(method));
        Collections.sort(members);
        for (String member : members) text.append(member);
        return text.toString();
    }

    private static String describe(Field field) {
        StringBuilder text = new StringBuilder("field ").append(field.getName()).append(':').append(field.getType())
            .append(' ').append(field.getAccessFlags());
        if (field.getInitialValue() != null) {
            text.append(" = ").append(DexFormatter.INSTANCE.getEncodedValue(field.getInitialValue()));
        }
        text.append('\n');
        annotations(text, "  ", "", field.getAnnotations());
        return text.toString();
    }

    private static String describe(Method method) {
        StringBuilder text = new StringBuilder("method ").append(method.getName()).append('(');
        for (CharSequence type : method.getParameterTypes()) text.append(type);
        text.append(')').append(method.getReturnType()).append(' ').append(method.getAccessFlags()).append('\n');
        annotations(text, "  ", "", method.getAnnotations());
        int index = 0;
        for (MethodParameter parameter : method.getParameters()) {
            annotations(text, "  ", "parameter " + index++ + " ", parameter.getAnnotations());
        }
        MethodImplementation code = method.getImplementation();
        if (code == null) return text.toString();
        text.append("  registers ").append(code.getRegisterCount()).append('\n');
        for (Instruction instruction : code.getInstructions()) text.append("  ").append(describe(instruction)).append('\n');
        for (TryBlock<? extends ExceptionHandler> block : code.getTryBlocks()) {
            text.append("  try ").append(block.getStartCodeAddress()).append('+').append(block.getCodeUnitCount());
            for (ExceptionHandler handler : block.getExceptionHandlers()) {
                String type = handler.getExceptionType();
                text.append(' ').append(type == null ? "any" : type).append("->").append(handler.getHandlerCodeAddress());
            }
            text.append('\n');
        }
        return text.toString();
    }

    /** An opcode with each operand it has, found through the interfaces that dexlib2 gives every format. */
    private static String describe(Instruction instruction) {
        StringBuilder text = new StringBuilder(instruction.getOpcode().name);
        if (instruction instanceof OneRegisterInstruction) {
            text.append(" a=").append(((OneRegisterInstruction) instruction).getRegisterA());
        }
        if (instruction instanceof TwoRegisterInstruction) {
            text.append(" b=").append(((TwoRegisterInstruction) instruction).getRegisterB());
        }
        if (instruction instanceof ThreeRegisterInstruction) {
            text.append(" c=").append(((ThreeRegisterInstruction) instruction).getRegisterC());
        }
        if (instruction instanceof FiveRegisterInstruction) {
            FiveRegisterInstruction five = (FiveRegisterInstruction) instruction;
            text.append(" count=").append(five.getRegisterCount()).append(" c=").append(five.getRegisterC())
                .append(" d=").append(five.getRegisterD()).append(" e=").append(five.getRegisterE())
                .append(" f=").append(five.getRegisterF()).append(" g=").append(five.getRegisterG());
        }
        if (instruction instanceof RegisterRangeInstruction) {
            RegisterRangeInstruction range = (RegisterRangeInstruction) instruction;
            text.append(" start=").append(range.getStartRegister()).append(" count=").append(range.getRegisterCount());
        }
        if (instruction instanceof NarrowLiteralInstruction) {
            text.append(" literal=").append(((NarrowLiteralInstruction) instruction).getNarrowLiteral());
        } else if (instruction instanceof WideLiteralInstruction) {
            text.append(" wide=").append(((WideLiteralInstruction) instruction).getWideLiteral());
        }
        if (instruction instanceof OffsetInstruction) {
            text.append(" offset=").append(((OffsetInstruction) instruction).getCodeOffset());
        }
        if (instruction instanceof ReferenceInstruction) {
            text.append(" ref=").append(ReferenceUtil.getReferenceString(((ReferenceInstruction) instruction).getReference()));
        }
        if (instruction instanceof DualReferenceInstruction) {
            text.append(" ref2=").append(ReferenceUtil.getReferenceString(((DualReferenceInstruction) instruction).getReference2()));
        }
        if (instruction instanceof VerificationErrorInstruction) {
            text.append(" error=").append(((VerificationErrorInstruction) instruction).getVerificationError());
        }
        if (instruction instanceof InlineIndexInstruction) {
            text.append(" inline=").append(((InlineIndexInstruction) instruction).getInlineIndex());
        }
        if (instruction instanceof VtableIndexInstruction) {
            text.append(" vtable=").append(((VtableIndexInstruction) instruction).getVtableIndex());
        }
        if (instruction instanceof FieldOffsetInstruction) {
            text.append(" field-offset=").append(((FieldOffsetInstruction) instruction).getFieldOffset());
        }
        if (instruction instanceof SwitchPayload) {
            for (SwitchElement element : ((SwitchPayload) instruction).getSwitchElements()) {
                text.append(' ').append(element.getKey()).append(':').append(element.getOffset());
            }
        }
        if (instruction instanceof ArrayPayload) {
            ArrayPayload payload = (ArrayPayload) instruction;
            text.append(" width=").append(payload.getElementWidth()).append(' ');
            List<String> elements = new ArrayList<>();
            for (Number element : payload.getArrayElements()) elements.add(element.toString());
            text.append(String.join(",", elements));
        }
        return text.toString();
    }

    /** One line per annotation, sorted, with its elements sorted too. */
    private static void annotations(StringBuilder text, String indent, String label, Collection<? extends Annotation> annotations) {
        List<String> lines = new ArrayList<>();
        for (Annotation annotation : annotations) {
            List<String> elements = new ArrayList<>();
            for (AnnotationElement element : annotation.getElements()) {
                elements.add(element.getName() + "=" + DexFormatter.INSTANCE.getEncodedValue(element.getValue()));
            }
            Collections.sort(elements);
            lines.add(indent + label + "annotation " + annotation.getVisibility() + ' ' + annotation.getType()
                + " [" + String.join(", ", elements) + "]\n");
        }
        Collections.sort(lines);
        for (String line : lines) text.append(line);
    }
}
