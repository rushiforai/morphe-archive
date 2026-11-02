package patches.wuplay;

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import java.util.*;

/** Exact shipped Settings Catalogs builder; other merged-lambda branches remain native. */
final class WuplaySettingsHooks {
    static final String ORIGINAL_SIGNER = "ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f";
    static final String OWNER = "Lapp/wuplay/androidtv/ui/screens/PlayerScreenKt$$ExternalSyntheticLambda6;";
    static final String BODY_HASH = "b45dbf59b7a104d73b251864d146e759b202ed19e426603eebf42835ac7a0b3f";
    static final String ANCHOR = "Lapp/wuplay/androidtv/ui/screens/settings/SettingRowKt;->lambda$1843313251:Landroidx/compose/runtime/internal/ComposableLambdaImpl;";
    static final String ITEM = "Landroidx/compose/foundation/lazy/LazyListIntervalContent;->item$default(Landroidx/compose/foundation/lazy/LazyListIntervalContent;Ljava/lang/String;Lkotlin/jvm/functions/Function3;I)V";
    static final String FOCUS_OWNER = "Lapp/wuplay/androidtv/ui/components/FilterChipRowKt$$ExternalSyntheticLambda5;";
    static String ref(Instruction i) { return i instanceof ReferenceInstruction ? ((ReferenceInstruction)i).getReference().toString() : ""; }
    static void apply(MutableMethod method) {
        var implementation = method.getImplementation();
        List<Instruction> code = new ArrayList<>(); implementation.getInstructions().forEach(code::add);
        if (method.getAccessFlags()!=17 || implementation.getRegisterCount()!=18 || code.size()!=365 || !BODY_HASH.equals(fingerprint(method)) ||
                !ref(code.get(215)).equals(ANCHOR) || !ref(code.get(216)).equals(ITEM) || code.get(216).getOpcode()!=Opcode.INVOKE_STATIC)
            throw new IllegalStateException("Unsupported Wuplay Catalogs settings builder");
        FiveRegisterInstruction call = (FiveRegisterInstruction)code.get(216);
        if (call.getRegisterCount()!=4 || call.getRegisterC()!=12 || call.getRegisterD()!=13 || call.getRegisterE()!=1 || call.getRegisterF()!=14)
            throw new IllegalStateException("Wuplay Catalogs scope registers changed");
        // v0/v1 are dead before the shared Unit return; preserve the native pane's Left/Back callback.
        implementation.addInstruction(217,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,0,16));
        implementation.addInstruction(218,new BuilderInstruction22c(Opcode.IGET_OBJECT,1,0,new ImmutableFieldReference(OWNER,"f$5","Ljava/lang/Object;")));
        implementation.addInstruction(219, new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,12,1,0,0,0,
            new ImmutableMethodReference("Lnl/johninnl/wuplay/NativeChannelSettings;","appendRow",List.of("Ljava/lang/Object;","Ljava/lang/Object;"),"V")));
    }

    static void extendCatalogFocus(MutableMethod method) {
        var implementation=method.getImplementation();List<Instruction> code=new ArrayList<>();implementation.getInstructions().forEach(code::add);
        if(method.getAccessFlags()!=17||implementation.getRegisterCount()!=23||code.size()!=188||
                !fingerprint(method).equals("79608e726d3125ef1bff9902392472a538178239558f3f7651908d43dfd1178d")||
                code.get(83).getOpcode()!=Opcode.CONST_4||((OneRegisterInstruction)code.get(83)).getRegisterA()!=14||
                ((NarrowLiteralInstruction)code.get(83)).getNarrowLiteral()!=1||
                !(code.get(84) instanceof RegisterRangeInstruction)||((RegisterRangeInstruction)code.get(84)).getStartRegister()!=5||
                !ref(code.get(84)).contains("SettingRowKt;->SettingRow("))
            throw new IllegalStateException("Unsupported Wuplay Catalogs focus boundary");
        implementation.replaceInstruction(83,new BuilderInstruction11n(Opcode.CONST_4,14,0));
    }

    /** Keep the validated input identity used by native registration after APK re-signing.
     * PackageManager results and all account/device authentication remain native. */
    static void retainBuildIdentity(MutableMethod method) {
        var implementation = method.getImplementation();
        List<Instruction> code = new ArrayList<>(); implementation.getInstructions().forEach(code::add);
        if (method.getAccessFlags()!=65537 || implementation.getRegisterCount()!=19 || code.size()!=267 ||
                !fingerprint(method).equals("50bed52164e61c11c2669ae3b6187db5ca43251b6cdc7e81068c85eab6ab6b09") ||
                !ref(code.get(7)).equals("Landroidx/core/os/HandlerCompat$Api28Impl;->signingCertSha256(Landroid/content/Context;)Ljava/lang/String;") ||
                code.get(8).getOpcode()!=Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction)code.get(8)).getRegisterA()!=3 ||
                !ref(code.get(9)).equals("Lapp/wuplay/androidtv/network/BuildIdentity;-><init>(Ljava/lang/String;)V"))
            throw new IllegalStateException("Unsupported Wuplay build identity constructor");
        implementation.addInstruction(9, new BuilderInstruction21c(Opcode.CONST_STRING,3,new ImmutableStringReference(ORIGINAL_SIGNER)));
    }
    static String fingerprint(Method method) {
        StringBuilder text = new StringBuilder();
        text.append(method.getImplementation().getRegisterCount());
        for (Instruction i : method.getImplementation().getInstructions()) {
            text.append('|').append(i.getOpcode()).append(':').append(ref(i));
            if (i instanceof RegisterRangeInstruction) text.append('r').append(((RegisterRangeInstruction)i).getStartRegister()).append(',').append(((RegisterRangeInstruction)i).getRegisterCount());
            if (i instanceof OneRegisterInstruction) text.append('a').append(((OneRegisterInstruction)i).getRegisterA());
            if (i instanceof TwoRegisterInstruction) text.append('b').append(((TwoRegisterInstruction)i).getRegisterB());
            if (i instanceof ThreeRegisterInstruction) text.append('c').append(((ThreeRegisterInstruction)i).getRegisterC());
            if (i instanceof FiveRegisterInstruction) {
                FiveRegisterInstruction f = (FiveRegisterInstruction)i;
                text.append('f').append(f.getRegisterCount()).append(',').append(f.getRegisterC()).append(',').append(f.getRegisterD())
                    .append(',').append(f.getRegisterE()).append(',').append(f.getRegisterF()).append(',').append(f.getRegisterG());
            }
            if (i instanceof WideLiteralInstruction) text.append('l').append(((WideLiteralInstruction)i).getWideLiteral());
            if (i instanceof OffsetInstruction) text.append('o').append(((OffsetInstruction)i).getCodeOffset());
            if (i instanceof SwitchPayload) for (SwitchElement e : ((SwitchPayload)i).getSwitchElements()) text.append('s').append(e.getKey()).append(',').append(e.getOffset());
            if (i instanceof ArrayPayload) {
                ArrayPayload payload = (ArrayPayload)i;
                text.append('w').append(payload.getElementWidth());
                for (Number element : payload.getArrayElements()) text.append('v').append(element.longValue());
            }
        }
        for (TryBlock<? extends ExceptionHandler> block : method.getImplementation().getTryBlocks()) {
            text.append("|try:").append(block.getStartCodeAddress()).append(',').append(block.getCodeUnitCount());
            for (ExceptionHandler handler : block.getExceptionHandlers())
                text.append('|').append(handler.getExceptionType()).append('@').append(handler.getHandlerCodeAddress());
        }
        try {
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (byte b : digest) result.append(String.format("%02x", b & 255));
            return result.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
}
