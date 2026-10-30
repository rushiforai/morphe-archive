// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;

/** API 29 backports pinned to original 26.10 DEX. No Google bodies are bundled.
 * 26.10 dropped View.getWindowInsetsController (26.09 dba.b), so that hook is gone; R8 moved
 * getAttributionTag from Outline2 into Outline0.
 */
final class Api29Hooks {
    static final String COMPAT="Llocal/maps/cluster/PlatformCompat;";
    private static final String OUT0="Lrj$$ExternalSyntheticApiModelOutline0;";
    private static void check(boolean value,String message){if(!value)throw new IllegalStateException(message);}
    static String descriptor(Method m){StringBuilder s=new StringBuilder(m.getName()).append('(');for(var p:m.getParameterTypes())s.append(p);return s.append(')').append(m.getReturnType()).toString();}
    private static String reference(Instruction i){return i instanceof ReferenceInstruction?((ReferenceInstruction)i).getReference().toString():"";}
    static String fingerprint(Method m){
        StringBuilder s=new StringBuilder().append(m.getAccessFlags()).append(':').append(descriptor(m)).append('\n');
        var impl=m.getImplementation();check(impl!=null,"Abstract API29 target");s.append(impl.getRegisterCount()).append('\n');
        for(var i:impl.getInstructions()){
            s.append(i.getOpcode()).append('/').append(i.getCodeUnits());
            if(i instanceof ThreeRegisterInstruction){var r=(ThreeRegisterInstruction)i;s.append(" a=").append(r.getRegisterA()).append(" b=").append(r.getRegisterB()).append(" c=").append(r.getRegisterC());}
            else if(i instanceof TwoRegisterInstruction){var r=(TwoRegisterInstruction)i;s.append(" a=").append(r.getRegisterA()).append(" b=").append(r.getRegisterB());}
            else if(i instanceof OneRegisterInstruction)s.append(" a=").append(((OneRegisterInstruction)i).getRegisterA());
            if(i instanceof FiveRegisterInstruction){var r=(FiveRegisterInstruction)i;int[] a={r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};s.append(" args=").append(Arrays.toString(Arrays.copyOf(a,r.getRegisterCount())));}
            if(i instanceof RegisterRangeInstruction){var r=(RegisterRangeInstruction)i;s.append(" range=").append(r.getStartRegister()).append(':').append(r.getRegisterCount());}
            if(i instanceof ReferenceInstruction)s.append(" ref=").append(reference(i));
            if(i instanceof DualReferenceInstruction)s.append(" ref2=").append(((DualReferenceInstruction)i).getReference2());
            if(i instanceof WideLiteralInstruction)s.append(" literal=").append(((WideLiteralInstruction)i).getWideLiteral());
            if(i instanceof OffsetInstruction)s.append(" offset=").append(((OffsetInstruction)i).getCodeOffset());
            if(i instanceof SwitchPayload)for(var e:((SwitchPayload)i).getSwitchElements())s.append(" switch=").append(e.getKey()).append(':').append(e.getOffset());
            if(i instanceof ArrayPayload){var a=(ArrayPayload)i;s.append(" array=").append(a.getElementWidth()).append(':').append(a.getArrayElements());}
            s.append('\n');
        }
        for(var t:impl.getTryBlocks())for(var h:t.getExceptionHandlers()){s.append("try=").append(t.getStartCodeAddress()).append(':').append(t.getCodeUnitCount()).append('\n');s.append("catch=").append(h.getExceptionType()).append(':').append(h.getHandlerCodeAddress()).append('\n');}
        try{byte[] b=MessageDigest.getInstance("SHA-256").digest(s.toString().getBytes(StandardCharsets.UTF_8));StringBuilder h=new StringBuilder();for(byte v:b)h.append(String.format(Locale.ROOT,"%02x",v&255));return h.toString();}catch(Exception e){throw new IllegalStateException(e);}
    }
    private static final Map<String,String> PIN=new LinkedHashMap<>();
    static {
        // Filled from the original input APK; every opcode/operand/try region is checked.
        PIN.put("Laarj;->run()V", "6c73f5ef5fabd576abb58dff7701da3ced220ce2436c04751243d256e8e062e7");
        PIN.put("Ljfs;-><init>(Landroid/content/Context;Lqxn;Lqjg;Lxlm;Lxmk;Ltoi;Lrvr;Lzhv;Laddm;Ljava/util/concurrent/Executor;Lxdy;Ljbp;Lsmt;Lwll;Ljfr;Ljgv;)V", "150fd624855670f090676070579cf8bdb18e14e663dac7376559cbff22a76013");
        PIN.put("Lecc;->a(Landroid/content/Context;)Lebz;", "028a58ce329038c3a1311ef54a686d13c17349c8c4b9d548303b0434dc45ad98");
        PIN.put("Lapbv;->h()V", "4bf647139828a5963c6783a42fbe9c8b1f495161dfc9a963056aa16c5088dab2");
        PIN.put("Lapbx;->a()J", "f00e9bb443b9ae79b33d06614d3ea4ee75d4bfb8639357fbbfb54908e9bd04fd");
        PIN.put("Ldpr;-><init>(Landroid/content/Context;)V", "e6036e27e0c84b7e398a9fe790e2af39bf231221793bc08027696be59ca082c2");
        PIN.put("Ldcc;-><clinit>()V", "b96b14f6555d24e91f9bacce450bb95ea12d0ad7ec97769dda85300fffd924d2");
        PIN.put("Ldcc;-><init>(Landroid/view/WindowInsets;)V", "0041f79c7d3df3341126905405b524a42d3bdd376b7e99b3dffa96a08d67a959");
        PIN.put("Ldbr;->F(Landroid/view/View;)Lcxt;", "9f5c1d760151fe5c038ef5af49f8522467666c1f01c4094910ffe5a39a1aa142");
        PIN.put("Ldbj;->a(Landroid/view/View;Ldbh;)V", "84fc8f9452088866badb05f0eeaa3a72f24ff791570d46fa19ba0e31372ed14b");
        PIN.put(OUT0+"->m(I)I", "c8fb2371d55086bc8f12d9a82ad568c46f6ada1748f4187547734b97741691dd");
        PIN.put(OUT0+"->m(Landroid/graphics/Outline;Landroid/graphics/Path;)V", "886ec7b5eb64a3fa9242f5342364ce90f099833f5a0a2091bc185d115335eed4");
        PIN.put(OUT0+"->m(Landroid/app/ActivityManager;Ljava/lang/String;II)Ljava/util/List;", "23017b7aa155c9fda43bf7d6e8d21b78f4bcfcd64692b139d124ef832a60a387");
        PIN.put(OUT0+"->m(Landroid/app/ActivityManager;[B)V", "ce2b2fef9b69227578ac2ebb9e3cfebb37e6e4d07ea51356c5d2f4eacae27ff9");
        PIN.put(OUT0+"->m(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;", "43276fccd8a4fbdc277f748c438c92b421b60525bb9bff79dc15dc6eb3956884");
        PIN.put(OUT0+"->m(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V", "ad24275d9d2c8bdbf128c1b8eb972f7606ef5d20b8db4a0b7b52702cf68fd7ea");
        PIN.put(OUT0+"->m(Landroid/content/Context;)Ljava/lang/String;", "a591b5284da2b9f39815c0e3bd3dbf15e2572ef54726c24b33c53281cb08c75d");
        PIN.put(OUT0+"->m(Landroid/view/Window;Z)V", "e8e685949fadfdf2b9dba98ea5a8878d3d2df17d5b2679d70cc1ca16cfbd37b5");
        PIN.put(OUT0+"->m(Landroid/view/View;)Ljava/lang/CharSequence;", "2302d2ec86ad12d3849d7f0a83d8483d78332817b356859d89971dabf2750c7c");
        PIN.put(OUT0+"->m(Landroid/view/View;Ljava/lang/CharSequence;)V", "27e743e9819f88f43f08531ea7f9b767e2cd835e59360bab98f2a7d9a22e3018");
        PIN.put(OUT0+"->m()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;", "f56aaea0a22dc1ec79f4c0546be8771aa7d3214f2b86ca864763bbcc5d57057b");
        PIN.put(OUT0+"->m$1()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;", "3443be5e57de44b3d8f7310b4370506b51004e10734e2c926225102069116c73");
        // Sole callee of Lcdy;->a(View)Z, which Compose's InnerNodeCoordinator draw (Lcad;->C, Lcak;->C)
        // calls on every frame without an SDK check: NoSuchMethodError on DiLink 3 / API29.
        PIN.put(OUT0+"->m(Landroid/view/View;)Z", "7afa31c569f8933a97db75d231b49d05bdc513dc758b347590764cd4f7b219af");
    }
    private static ImmutableMethodReference helper(String n,List<String> p,String r){return new ImmutableMethodReference(COMPAT,n,p,r);}
    private static BuilderInstruction35c call(String n,List<String> p,String r,int... registers){int[] a=new int[5];System.arraycopy(registers,0,a,0,registers.length);return new BuilderInstruction35c(Opcode.INVOKE_STATIC,registers.length,a[0],a[1],a[2],a[3],a[4],helper(n,p,r));}
    private static BuilderInstruction21c sdk(int r){return new BuilderInstruction21c(Opcode.SGET,r,new ImmutableFieldReference("Landroid/os/Build$VERSION;","SDK_INT","I"));}
    private static void prepend(MutableMethod m,int at,List<BuilderInstruction> additions){for(int n=0;n<additions.size();n++)m.getImplementation().addInstruction(at+n,additions.get(n));}
    private static int only(List<Instruction> code,String ref){int at=-1;for(int n=0;n<code.size();n++)if(reference(code.get(n)).equals(ref)){check(at<0,"Repeated API29 pinned reference");at=n;}check(at>=0,"Missing API29 pinned reference "+ref);return at;}
    /** All entry prefixes branch to untouched original instructions on API 30+. */
    static void patch(MutableMethod m){
        String key=m.getDefiningClass()+"->"+descriptor(m);String expected=PIN.get(key);check(expected!=null,"Unexpected API29 method "+key);check(expected.equals(fingerprint(m)),"API29 original fingerprint mismatch "+key);
        var out=m.getImplementation();List<Instruction> code=new ArrayList<>(out.getInstructions());String d=descriptor(m),type=m.getDefiningClass();
        if(type.equals("Laarj;")){
            int at=only(code,OUT0+"->m(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;");
            check(reference(code.get(at+2)).equals(OUT0+"->m(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;"),"Popup WindowMetrics chain changed");
            check(code.get(at-4).getOpcode()==Opcode.CONST_STRING&&((OneRegisterInstruction)code.get(at-4)).getRegisterA()==4&&
                reference(code.get(at-3)).equals("Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;")&&
                ((FiveRegisterInstruction)code.get(at-3)).getRegisterD()==4,"Popup window-service scratch changed");
            check(code.get(at+8).getOpcode()==Opcode.AGET&&((ThreeRegisterInstruction)code.get(at+8)).getRegisterC()==3,"Popup location index register changed");
            Label original=out.newLabelForIndex(at),join=out.newLabelForIndex(at+4);
            // Only this popup case reaches this site; v4's last value ("window") is dead and is
            // never read again in this case. v3 is NOT free in 26.10: it still holds the constant 1
            // that the following aget uses as index. v0/v1/v2/v3/v8 retained.
            prepend(m,at,List.of(sdk(4),new BuilderInstruction22b(Opcode.ADD_INT_LIT8,4,4,-30),new BuilderInstruction21t(Opcode.IF_GEZ,4,original),
                call("getWindowBounds",List.of("Landroid/view/WindowManager;"),"Landroid/graphics/Rect;",1),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,1),new BuilderInstruction20t(Opcode.GOTO_16,join)));
        } else if(type.equals("Ljfs;")){
            int at=only(code,"La$$ExternalSyntheticApiModelOutline3;->m()Landroid/icu/util/ULocale;");
            int joinAt=only(code,OUT0+"->m(Landroid/icu/number/FormattedNumber;)Ljava/lang/String;")+2;
            check(code.get(at-2).getOpcode()==Opcode.IGET&&reference(code.get(at-2)).equals("Ljfr;->b:I")&&
                ((TwoRegisterInstruction)code.get(at-2)).getRegisterA()==1,"Whole-percent source register changed");
            check(code.get(at+10).getOpcode()==Opcode.INT_TO_DOUBLE&&((TwoRegisterInstruction)code.get(at+10)).getRegisterB()==1,"Whole-percent formatter input changed");
            check(code.get(joinAt-1).getOpcode()==Opcode.MOVE_RESULT_OBJECT&&((OneRegisterInstruction)code.get(joinAt-1)).getRegisterA()==1,"Whole-percent formatter output changed");
            check(code.get(joinAt).getOpcode()==Opcode.NEW_ARRAY&&((TwoRegisterInstruction)code.get(joinAt)).getRegisterA()==4,"Whole-percent formatter rejoin changed");
            check(out.getTryBlocks().isEmpty(),"Whole-percent constructor gained exception regions");
            Label original=out.newLabelForIndex(at),join=out.newLabelForIndex(joinAt);
            // Existing v1 is a WHOLE percent (91 means 91%, never 9100%). v4/v5 dead here: original
            // ICU replaces both on API30+, API29's next NEW_ARRAY replaces v4 and v5 is never read again.
            // v2 (0) and v3 (1) are live constants used after the rejoin and stay untouched.
            prepend(m,at,List.of(sdk(4),new BuilderInstruction21s(Opcode.CONST_16,5,30),new BuilderInstruction22t(Opcode.IF_GE,4,5,original),
                call("formatWholePercent",List.of("I"),"Ljava/lang/String;",1),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,1),new BuilderInstruction20t(Opcode.GOTO_16,join)));
        } else if(type.equals("Lecc;")){
            Label original=out.newLabelForIndex(0);
            prepend(m,0,List.of(sdk(0),new BuilderInstruction21s(Opcode.CONST_16,1,30),new BuilderInstruction22t(Opcode.IF_GE,0,1,original),
                call("getWindowBounds",List.of("Landroid/content/Context;"),"Landroid/graphics/Rect;",2),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0),
                new BuilderInstruction21c(Opcode.NEW_INSTANCE,1,new ImmutableTypeReference("Lebz;")),
                new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL,1,2,0,0,0,0,new ImmutableMethodReference("Landroid/content/Context;","getResources",List.of(),"Landroid/content/res/Resources;")),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2),
                new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL,1,2,0,0,0,0,new ImmutableMethodReference("Landroid/content/res/Resources;","getDisplayMetrics",List.of(),"Landroid/util/DisplayMetrics;")),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,2),
                new BuilderInstruction22c(Opcode.IGET,2,2,new ImmutableFieldReference("Landroid/util/DisplayMetrics;","density","F")),
                new BuilderInstruction35c(Opcode.INVOKE_DIRECT,3,1,0,2,0,0,new ImmutableMethodReference("Lebz;","<init>",List.of("Landroid/graphics/Rect;","F"),"V")),new BuilderInstruction11x(Opcode.RETURN_OBJECT,1)));
        } else if(type.equals("Lapbv;")){
            Label original=out.newLabelForIndex(0);prepend(m,0,List.of(sdk(0),new BuilderInstruction21s(Opcode.CONST_16,1,30),new BuilderInstruction22t(Opcode.IF_GE,0,1,original),new BuilderInstruction10x(Opcode.RETURN_VOID)));
            // API29 leaves s null. Lapbx's paired leak-warning guard below handles that
            // optional diagnostic without skipping connection-pool/socket cleanup.
        } else if(type.equals("Lapbx;")){
            int field=only(code,"Lapbt;->a:Ljava/lang/Object;"),at=field+1,joinAt=field+5;
            check(d.equals("a()J")&&out.getRegisterCount()==21,"CloseGuard cleanup schema changed");
            check(code.get(field).getOpcode()==Opcode.IGET_OBJECT&&code.get(field) instanceof TwoRegisterInstruction&&
                ((TwoRegisterInstruction)code.get(field)).getRegisterA()==1&&((TwoRegisterInstruction)code.get(field)).getRegisterB()==1,"CloseGuard field/register changed");
            check(reference(code.get(field-1)).equals("Lapep;->b:Lapep;")&&((OneRegisterInstruction)code.get(field-1)).getRegisterA()==5,"CloseGuard platform scratch changed");
            check(reference(code.get(at)).equals("Ljava/lang/Object;->getClass()Ljava/lang/Class;")&&
                ((FiveRegisterInstruction)code.get(at)).getRegisterCount()==1&&((FiveRegisterInstruction)code.get(at)).getRegisterC()==1,"CloseGuard dereference changed");
            check(reference(code.get(at+1)).equals(OUT0+"->m(Ljava/lang/Object;)Landroid/util/CloseGuard;")&&
                code.get(at+2).getOpcode()==Opcode.MOVE_RESULT_OBJECT&&((OneRegisterInstruction)code.get(at+2)).getRegisterA()==1&&
                reference(code.get(at+3)).equals(OUT0+"->m(Landroid/util/CloseGuard;)V"),"CloseGuard warning chain changed");
            check(reference(code.get(joinAt)).equals("Ljava/util/List;->remove(I)Ljava/lang/Object;")&&
                ((FiveRegisterInstruction)code.get(joinAt)).getRegisterCount()==2&&((FiveRegisterInstruction)code.get(joinAt)).getRegisterC()==11&&
                ((FiveRegisterInstruction)code.get(joinAt)).getRegisterD()==0,"CloseGuard cleanup rejoin changed");
            int address=0,guardAddress=-1,joinAddress=-1;
            for(int n=0;n<code.size();n++){if(n==at)guardAddress=address;if(n==joinAt)joinAddress=address;address+=code.get(n).getCodeUnits();}
            check(guardAddress==0x63&&joinAddress==0x6d,"CloseGuard warning boundaries changed");
            address=0;
            for(Instruction i:code){
                if(i instanceof OffsetInstruction){int target=address+((OffsetInstruction)i).getCodeOffset();check(target<guardAddress||target>=joinAddress,"CloseGuard warning has another incoming branch");}
                address+=i.getCodeUnits();
            }
            boolean monitorRegion=false;
            for(var region:out.getTryBlocks()){
                int start=region.getStartCodeAddress(),end=start+region.getCodeUnitCount();
                check(!(start>guardAddress&&start<joinAddress)&&!(end>guardAddress&&end<joinAddress),"CloseGuard warning crosses try boundary");
                for(var handler:region.getExceptionHandlers())check(handler.getHandlerCodeAddress()<guardAddress||handler.getHandlerCodeAddress()>=joinAddress,"CloseGuard warning has exception entry");
                if(start<=guardAddress&&end>=joinAddress)monitorRegion=true;
            }
            check(monitorRegion,"CloseGuard cleanup lost monitor handler");
            Label original=out.newLabelForIndex(at),join=out.newLabelForIndex(joinAt);
            // The real guard has already been read into v1. v5's platform singleton
            // is dead here: both cleanup successors redefine it (0x79/0x89) before
            // any read. Leave every original instruction/try region in place.
            // 26.10 keeps the 26.09 shape: 21 registers, warning 0x63..0x6d, same registers.
            // API30+ and a nonnull API29 guard still execute the original warning.
            prepend(m,at,List.of(sdk(5),new BuilderInstruction22b(Opcode.ADD_INT_LIT8,5,5,-30),
                new BuilderInstruction21t(Opcode.IF_GEZ,5,original),new BuilderInstruction21t(Opcode.IF_EQZ,1,join)));
        } else if(type.equals("Ldpr;")){
            int at=only(code,"Ldpz;-><init>(Landroid/content/Context;Lpgc;)V")-4;
            check(code.get(at).getOpcode()==Opcode.IF_NEZ&&((OneRegisterInstruction)code.get(at)).getRegisterA()==1,"MediaRouter backend branch changed");
            int address=0;for(int i=0;i<at;i++)address+=code.get(i).getCodeUnits();
            int target=address+((OffsetInstruction)code.get(at)).getCodeOffset();int targetIndex=0,pos=0;while(pos<target){pos+=code.get(targetIndex++).getCodeUnits();}check(pos==target,"MediaRouter branch target changed");Label skip=out.newLabelForIndex(targetIndex);
            out.replaceInstruction(at,sdk(2));out.addInstruction(at+1,new BuilderInstruction21s(Opcode.CONST_16,3,30));out.addInstruction(at+2,new BuilderInstruction22t(Opcode.IF_LT,2,3,skip));out.addInstruction(at+3,new BuilderInstruction21t(Opcode.IF_NEZ,1,skip));
        } else if(type.equals("Ldcc;")&&d.equals("<clinit>()V")){
            Label original=out.newLabelForIndex(0);prepend(m,0,List.of(sdk(0),new BuilderInstruction21s(Opcode.CONST_16,1,30),new BuilderInstruction22t(Opcode.IF_GE,0,1,original),
                call("consumedWindowInsets",List.of(),"Landroid/view/WindowInsets;"),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0),new BuilderInstruction11n(Opcode.CONST_4,1,0),
                new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,0,1,0,0,0,new ImmutableMethodReference("Ldcc;","p",List.of("Landroid/view/WindowInsets;","Landroid/view/View;"),"Ldcc;")),new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,0),
                new BuilderInstruction21c(Opcode.SPUT_OBJECT,0,new ImmutableFieldReference("Ldcc;","a","Ldcc;")),new BuilderInstruction10x(Opcode.RETURN_VOID)));
        } else if(type.equals("Ldcc;")){
            // Ldbu is WindowInsetsCompat Impl29 (super chain dbt/dbs/dbr/dbz); Ldbv (Impl30) extends it.
            Label original=out.newLabelForIndex(1);prepend(m,1,List.of(sdk(0),new BuilderInstruction21s(Opcode.CONST_16,1,30),new BuilderInstruction22t(Opcode.IF_GE,0,1,original),
                new BuilderInstruction21c(Opcode.NEW_INSTANCE,0,new ImmutableTypeReference("Ldbu;")),new BuilderInstruction35c(Opcode.INVOKE_DIRECT,3,0,2,3,0,0,new ImmutableMethodReference("Ldbu;","<init>",List.of("Ldcc;","Landroid/view/WindowInsets;"),"V")),
                new BuilderInstruction22c(Opcode.IPUT_OBJECT,0,2,new ImmutableFieldReference("Ldcc;","b","Ldbz;")),new BuilderInstruction10x(Opcode.RETURN_VOID)));
        } else if(type.equals("Ldbr;")){
            // R8 removed the old visible-insets reflection path. Native h(View)
            // explicitly supports null and substitutes Insets.NONE; normal API29
            // system/stable/IME inset sources in Ldbu remain active. Both incoming
            // registers are dead here: the API30 original only constructs/throws.
            Label original=out.newLabelForIndex(0);prepend(m,0,List.of(sdk(0),new BuilderInstruction21s(Opcode.CONST_16,1,30),new BuilderInstruction22t(Opcode.IF_GE,0,1,original),new BuilderInstruction11n(Opcode.CONST_4,0,0),new BuilderInstruction11x(Opcode.RETURN_OBJECT,0)));
        } else if(type.equals("Ldbj;")){
            // Animation callbacks are an API30 feature. Insets continue through Ldbu on API29.
            Label original=out.newLabelForIndex(0);prepend(m,0,List.of(sdk(0),new BuilderInstruction22b(Opcode.ADD_INT_LIT8,0,0,-30),new BuilderInstruction21t(Opcode.IF_GEZ,0,original),new BuilderInstruction10x(Opcode.RETURN_VOID)));
        } else {
            String name;
            if(d.equals("m(I)I"))name="getExtensionVersion";
            else if(d.equals("m(Landroid/graphics/Outline;Landroid/graphics/Path;)V"))name="setOutlinePath";
            else if(d.equals("m(Landroid/app/ActivityManager;Ljava/lang/String;II)Ljava/util/List;"))name="getHistoricalProcessExitReasons";
            else if(d.equals("m(Landroid/app/ActivityManager;[B)V"))name="setProcessStateSummary";
            else if(d.equals("m(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/CharSequence;"))name="getStateDescription";
            else if(d.equals("m(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/CharSequence;)V"))name="setStateDescription";
            else if(d.equals("m(Landroid/content/Context;)Ljava/lang/String;"))name="getAttributionTag";
            else if(d.equals("m(Landroid/view/Window;Z)V"))name="setDecorFitsSystemWindows";
            else if(d.equals("m(Landroid/view/View;)Ljava/lang/CharSequence;"))name="getStateDescription";
            else if(d.equals("m(Landroid/view/View;Ljava/lang/CharSequence;)V"))name="setStateDescription";
            else if(d.equals("m(Landroid/view/View;)Z"))name="isShowingLayoutBounds";
            else if(d.startsWith("m$1("))name="actionImeEnter";
            else name="actionPressAndHold";
            int at=0;check(code.get(at) instanceof ReferenceInstruction,"Outline reference missing");
            int[] registers;
            if(code.get(at) instanceof FiveRegisterInstruction){var r=(FiveRegisterInstruction)code.get(at);int[] a={r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG()};registers=Arrays.copyOf(a,r.getRegisterCount());}
            else if(code.get(at).getOpcode()==Opcode.SGET_OBJECT){registers=new int[0];}
            else throw new IllegalStateException("Unexpected API29 outline body");
            List<String> params=new ArrayList<>();for(var p:m.getParameterTypes())params.add(p.toString());
            out.replaceInstruction(at,call(name,params,m.getReturnType(),registers));
            if(code.get(at).getOpcode()==Opcode.SGET_OBJECT)out.addInstruction(at+1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,((OneRegisterInstruction)code.get(at)).getRegisterA()));
        }
    }
    static Set<String> targets(){return Collections.unmodifiableSet(PIN.keySet());}
    static void apply(BytecodePatchContext ctx){int n=0;for(String key:PIN.keySet()){int split=key.indexOf("->");String type=key.substring(0,split),desc=key.substring(split+2);MutableMethod found=null;for(var m:ctx.mutableClassDefBy(type).getMethods())if(descriptor(m).equals(desc)){check(found==null,"Duplicate API29 target");found=m;}check(found!=null,"Missing API29 target "+key);patch(found);n++;}System.out.println("API29 compatibility hooks: "+n+" pinned methods; native API30+ paths retained");}
}
