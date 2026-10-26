import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.*;
import com.android.apksig.ApkVerifier;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;

/**
 * Taobao 10.66.30: verifies four DinamicX text-writing paths were changed,
 * no unrelated code or app data was rewritten, and original method bodies
 * survive after inserted translation logic. Use Morphe Desktop's dexlib2 JAR.
 */
public final class VerifyDinamicXNativeLabels {
    private static final Set<String> TARGETS = initTargets();
    private static Set<String> initTargets() {
        Set<String> targets = new TreeSet<>(Set.of(
            "Ltb/gi6;->setText(Ljava/lang/CharSequence;)V",
            "Ltb/cx5;->setText(Ljava/lang/CharSequence;)V",
            "Ltb/gi6;->onSetStringAttribute(JLjava/lang/String;)V",
            "Ltb/cx5;->onSetStringAttribute(JLjava/lang/String;)V"
        ));
        // -Dtaobaolingo.extended=true enables exact 28-method audit of
        // separately opt-in subclass coverage, not the standard four-hook bundle.
        if (Boolean.getBoolean("taobaolingo.extended")) {
            targets.add("Ltb/oe6;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMPTextViewWidgetNode;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Lcom/taobao/unit/center/mdc/dinamicx/widget/DXMsgTextViewWidgetNode;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/g2s;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/z1s;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Lcom/taobao/android/detail2/core/framework/base/dinamicx/a;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/a2s;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/h2s;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/umx;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/vmx;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/wmx;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/xjx;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/yjx;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Lcom/taobao/android/dinamicx/widget/b0;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Lcom/taobao/android/dinamicx/widget/e0;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/ce5;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/db6;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/op00;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/q86;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/vr90;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/han;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/i6z;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/ian;->onSetStringAttribute(JLjava/lang/String;)V");
            targets.add("Ltb/t9n;->onSetStringAttribute(JLjava/lang/String;)V");
        }
        return Set.copyOf(targets);
    }
    private static void check(boolean b, String s) {
        if(!b) throw new AssertionError(s);
    }
    private record Code(long checksum,int regs,int tryCount,List<String> sample) {}
    private static String instruction(Instruction i) {
        StringBuilder s=new StringBuilder(i.getOpcode().name);
        if(i instanceof ReferenceInstruction r) s.append(" REF:").append(r.getReference());
        if(i instanceof OneRegisterInstruction r) s.append(" A=").append(r.getRegisterA());
        if(i instanceof TwoRegisterInstruction r) s.append(" B=").append(r.getRegisterB());
        if(i instanceof ThreeRegisterInstruction r) s.append(" C=").append(r.getRegisterC());
        if(i instanceof FiveRegisterInstruction r)
            s.append(" D=").append(r.getRegisterD()).append(" E=").append(r.getRegisterE());
        if(i instanceof WideLiteralInstruction l) s.append(" VALUE=").append(l.getWideLiteral());
        // Without these fields, modifying a const/4, branch or invoke-range
        // could be invisible to the old checksum despite changing behavior.
        if(i instanceof NarrowLiteralInstruction l) s.append(" NARROW=").append(l.getNarrowLiteral());
        if(i instanceof OffsetInstruction o) s.append(" OFFSET=").append(o.getCodeOffset());
        if(i instanceof RegisterRangeInstruction r)
            s.append(" START=").append(r.getStartRegister()).append(" COUNT=").append(r.getRegisterCount());
        if(i instanceof ArrayPayload a)
            s.append(" ELEMENT_WIDTH=").append(a.getElementWidth()).append(" ELEMENTS=").append(a.getArrayElements());
        if(i instanceof PackedSwitchPayload p) {
            s.append(" SWITCH=");
            for(SwitchElement e:p.getSwitchElements())s.append(e.getKey()).append(":").append(e.getOffset()).append(",");
        }
        if(i instanceof SparseSwitchPayload p) {
            s.append(" SWITCH=");
            for(SwitchElement e:p.getSwitchElements())s.append(e.getKey()).append(":").append(e.getOffset()).append(",");
        }
        return s.toString();
    }
    private static Map<String,Code> methods(ZipFile zip) throws Exception {
        Map<String,Code> map=new HashMap<>(650000);
        for(ZipEntry e:Collections.list(zip.entries())) {
            if(!e.getName().matches("classes(\\d*)\\.dex")) continue;
            var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),
                new BufferedInputStream(zip.getInputStream(e)));
            for(ClassDef cls:dex.getClasses()) for(Method m:cls.getMethods()) {
                var impl=m.getImplementation();
                if(impl==null) continue;
                String id=cls.getType()+"->"+m.getName()+"("+
                    String.join("",m.getParameterTypes())+")"+m.getReturnType();
                CRC32 crc=new CRC32();
                List<String> sample=TARGETS.contains(id)?new ArrayList<>():null;
                for(Instruction instr:impl.getInstructions()) {
                    String signature=instruction(instr);
                    byte[] bytes=signature.getBytes(StandardCharsets.UTF_8);
                    crc.update(bytes,0,bytes.length);
                    crc.update(0);
                    if(sample!=null) sample.add(signature);
                }
                check(map.put(id,new Code(crc.getValue(),impl.getRegisterCount(),
                    impl.getTryBlocks().size(),sample))==null,"Duplicate method: "+id);
            }
        }
        return map;
    }
    public static void main(String[] args) throws Exception {
        check(args.length==2 || args.length==3,
            "Usage: VerifyDinamicXNativeLabels original.apk candidate.apk [--unsigned]");
        try(var original=new ZipFile(args[0]);var candidate=new ZipFile(args[1])) {
            var before=methods(original);
            var after=methods(candidate);
            final boolean fixture = Boolean.getBoolean("taobaolingo.fixture");
            check(before.keySet().equals(after.keySet()) &&
                  (fixture ? before.size() >= TARGETS.size() : before.size()==595518),
                "DEX method inventory changed (fixture="+fixture+", total="+before.size()+")");
            Set<String> changed=new TreeSet<>();
            for(var e:before.entrySet())
                if(e.getValue().checksum()!=after.get(e.getKey()).checksum())changed.add(e.getKey());
            check(changed.equals(TARGETS),"Unexpected changed DEX methods: "+changed);
            for(String id:TARGETS) {
                Code orig=before.get(id),newer=after.get(id);
                check(orig.regs()==newer.regs() && orig.tryCount()==newer.tryCount(),
                    "Register/try-block change "+id);
                int prefix=newer.sample().size()-orig.sample().size();
                check(prefix>0 && newer.sample().subList(prefix,newer.sample().size()).equals(orig.sample()),
                    "Original bytecode instruction sequence was changed: "+id);
                String injected=newer.sample().subList(0,prefix).toString();
                check(injected.contains("我的淘宝") && injected.contains("My Taobao")
                        && injected.contains("equals(Ljava/lang/Object;)"),
                    "Missing exact Chinese-English text mappings: "+id);
                if(id.contains("onSetStringAttribute"))
                    check(injected.contains("38178040921") && injected.contains("cmp-long"),
                        "Missing text-attribute-only guard: "+id);
            }
            for(ZipEntry e:Collections.list(original.entries())) {
                String n=e.getName();
                if(n.matches("classes(\\d*)\\.dex")||n.startsWith("META-INF/")||e.isDirectory())
                    continue;
                ZipEntry dst=candidate.getEntry(n);
                check(dst!=null && e.getCrc()==dst.getCrc() && e.getSize()==dst.getSize(),
                    "Unrelated APK resource changed: "+n);
            }
        }
        if(args.length==2) {
            var sig=new ApkVerifier.Builder(new File(args[1])).build().verify();
            check(sig.isVerified() && sig.isVerifiedUsingV2Scheme()
                    && sig.isVerifiedUsingV3Scheme(),"APK signature failed: "+sig.getErrors());
        }
        System.out.println("PASS: only expected native text binding methods changed; method inventory identical");
        System.out.println("PASS: original instructions intact; text attribute guard present");
        System.out.println("PASS: no unrelated APK resource changes");
        System.out.println("NOTE: static DEX validation does not prove Taobao actually displays English.");
    }
}
