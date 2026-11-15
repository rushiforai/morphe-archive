package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.CompatReport.*;
import static compat.Coexist.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Chat bubbles: the eligibility and mode gates, native bubble routes and the values a bubble notification is built from. */
final class Bubbles {

    static final String BUBBLE_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;";
    /** The specifier of the bubble rollout read as 587 numbers it (586 read 36311998572662839). Each release renumbers it, as in NativeBubbles.kt. */
    static final long BUBBLE_ROLLOUT = 36311994277695516L;
    static final String BUBBLE_ACTIVITY = "com.facebook.messaging.msys.thread.bubbles.activity.StaxThreadViewBubblesActivity";
    static final String SHORTCUT_BUILDER = "Landroid/content/pm/ShortcutInfo$Builder;";
    static final String MESSAGING_STYLE = "Landroidx/core/app/NotificationCompat$MessagingStyle;";

    static boolean jumpsTo(List<Instruction> code, int at, int target) {
        if (!(code.get(at) instanceof OffsetInstruction jump)) return false;
        int source = code.subList(0, at).stream().mapToInt(Instruction::getCodeUnits).sum();
        return source + jump.getCodeOffset() == code.subList(0, target).stream().mapToInt(Instruction::getCodeUnits).sum();
    }

    static boolean validBubbleEligibility(Method m) {
        var c = instructions(m);
        var shape = List.of(Opcode.SGET, Opcode.CONST_16, Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
            Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
            Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN);
        return !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getParameterTypes().isEmpty() && "Z".equals(m.getReturnType()) &&
            m.getImplementation() != null && m.getImplementation().getRegisterCount() == 3 && m.getImplementation().getTryBlocks().isEmpty() &&
            c.stream().map(Instruction::getOpcode).toList().equals(shape) &&
            "Landroid/os/Build$VERSION;->SDK_INT:I".equals(ref(c.get(0))) && register(c.get(0)) == 1 &&
            ((NarrowLiteralInstruction)c.get(1)).getNarrowLiteral() == 30 && register(c.get(1)) == 0 &&
            ((TwoRegisterInstruction)c.get(2)).getRegisterA() == 1 && ((TwoRegisterInstruction)c.get(2)).getRegisterB() == 0 &&
            jumpsTo(c,2,13) && "Landroid/app/ActivityManager;".equals(ref(c.get(7))) &&
            "Landroid/app/ActivityManager;->isLowRamDevice()Z".equals(ref(c.get(8))) && calls(c.get(8),0) &&
            register(c.get(9)) == 0 && register(c.get(10)) == 0 && jumpsTo(c,10,13) &&
            ((NarrowLiteralInstruction)c.get(11)).getNarrowLiteral() == 1 && register(c.get(11)) == 0 &&
            register(c.get(12)) == 0 && ((NarrowLiteralInstruction)c.get(13)).getNarrowLiteral() == 0 &&
            register(c.get(13)) == 0 && register(c.get(14)) == 0;
    }

    static boolean validNativeBubbleMode(Method m, String eligibility, Profile profile) {
        var c = instructions(m);
        // NativeBubbles.kt: family B copies A00's checks into the gate (e) and fetches the config by number (f).
        boolean inline = c.size() == 35;
        int e = inline ? 8 : 0, f = inline ? 10 : 0, last = 24 + f;
        var shape = new ArrayList<>(List.of(Opcode.CONST_4, Opcode.INVOKE_STATIC));
        shape.addAll(inline ? List.of(Opcode.SGET, Opcode.CONST_16, Opcode.IF_LT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT,
            Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ)
            : List.of(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ));
        shape.addAll(List.of(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
            Opcode.CHECK_CAST, Opcode.CONST_16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE));
        shape.addAll(inline ? List.of(Opcode.CONST, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST)
            : List.of(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT));
        shape.addAll(List.of(Opcode.CONST_WIDE, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.RETURN));
        String capability = profile.fields.get("bubbleCapabilityGetter"), rollout = profile.fields.get("bubbleRolloutGetter");
        return capability != null && rollout != null && !AccessFlags.STATIC.isSet(m.getAccessFlags()) &&
            "Z".equals(m.getReturnType()) && m.getParameterTypes().equals(List.of(BUBBLE_SESSION)) && m.getImplementation() != null &&
            m.getImplementation().getRegisterCount() == 5 && m.getImplementation().getTryBlocks().isEmpty() &&
            c.stream().map(Instruction::getOpcode).toList().equals(shape) &&
            register(c.get(0)) == 2 && ((NarrowLiteralInstruction)c.get(0)).getNarrowLiteral() == 0 && calls(c.get(1),4,2) &&
            (inline ? inlineBubbleEligibility(c, m.getDefiningClass(), eligibility, last)
                : eligibility.equals(ref(c.get(2))) && calls(c.get(2),3) && register(c.get(3)) == 0 &&
                    register(c.get(4)) == 0 && jumpsTo(c,4,last)) &&
            capability.split("->")[0].equals(ref(c.get(9+e))) && register(c.get(9+e)) == 1 &&
            register(c.get(10+e)) == 0 && ((NarrowLiteralInstruction)c.get(10+e)).getNarrowLiteral() == 28 &&
            capability.equals(ref(c.get(11+e))) && calls(c.get(11+e),1,4,0) && register(c.get(12+e)) == 0 &&
            register(c.get(13+e)) == 0 && jumpsTo(c,13+e,last) &&
            (inline ? numberedBubbleConfig(c, 17+e) : register(c.get(18)) == 2) && register(c.get(19+f)) == 0 &&
            ((WideLiteralInstruction)c.get(19+f)).getWideLiteral() == BUBBLE_ROLLOUT && register(c.get(20+f)) == 2 &&
            "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;".equals(ref(c.get(20+f))) &&
            rollout.equals(ref(c.get(21+f))) && calls(c.get(21+f),2,0,1) && register(c.get(22+f)) == 0 &&
            register(c.get(23+f)) == 0 && register(c.get(last)) == 2;
    }

    /** NativeBubbles.kt inlineEligibility: A00's checks on A00's own holder, both false branches returning v2. */
    static boolean inlineBubbleEligibility(List<Instruction> c, String owner, String eligibility, int last) {
        return eligibility.split("->")[0].equals(owner) && "Landroid/os/Build$VERSION;->SDK_INT:I".equals(ref(c.get(2))) &&
            register(c.get(2)) == 1 && ((NarrowLiteralInstruction)c.get(3)).getNarrowLiteral() == 30 && register(c.get(3)) == 0 &&
            ((TwoRegisterInstruction)c.get(4)).getRegisterA() == 1 && ((TwoRegisterInstruction)c.get(4)).getRegisterB() == 0 &&
            jumpsTo(c,4,last) && ((ReferenceInstruction)c.get(5)).getReference() instanceof FieldReference holder &&
            owner.equals(holder.getDefiningClass()) && ((TwoRegisterInstruction)c.get(5)).getRegisterA() == 0 &&
            ((TwoRegisterInstruction)c.get(5)).getRegisterB() == 3 && "Landroid/app/ActivityManager;".equals(ref(c.get(9))) &&
            register(c.get(9)) == 0 && "Landroid/app/ActivityManager;->isLowRamDevice()Z".equals(ref(c.get(10))) && calls(c.get(10),0) &&
            register(c.get(11)) == 0 && register(c.get(12)) == 0 && jumpsTo(c,12,last);
    }

    /** const v0, n; invoke-static {v0}, (I)Object; move-result-object v2; check-cast v2. */
    static boolean numberedBubbleConfig(List<Instruction> c, int at) {
        return register(c.get(at)) == 0 && calls(c.get(at+1),0) &&
            ((ReferenceInstruction)c.get(at+1)).getReference() instanceof MethodReference fetch &&
            fetch.getParameterTypes().size() == 1 && "I".equals(fetch.getParameterTypes().get(0).toString()) &&
            "Ljava/lang/Object;".equals(fetch.getReturnType()) && register(c.get(at+2)) == 2 && register(c.get(at+3)) == 2;
    }

    static boolean reachesBubbleApi(Map<String,ClassDef> byType, Method m, String api, int depth, Map<String,Integer> seen) {
        if (seen.getOrDefault(hookId(m),-1) >= depth) return false;
        seen.put(hookId(m),depth);
        var calls = instructions(m).stream().filter(i -> i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference)
            .map(i -> (MethodReference)((ReferenceInstruction)i).getReference()).toList();
        if (calls.stream().anyMatch(r -> api.equals(r.toString()))) return true;
        if (depth == 0) return false;
        for (var call : calls) {
            var cls = byType.get(call.getDefiningClass());
            if (cls == null) continue;
            for (var target : cls.getMethods()) if (hookId(target).equals(call.toString()) &&
                reachesBubbleApi(byType,target,api,depth-1,seen)) return true;
        }
        return false;
    }

    /** NativeBubbles.kt's bubbleGateHelper: the gate is read through a static (session, lazy holder) helper returning its answer. */
    static boolean bubbleGateHelper(Method m, String gate) {
        var c = instructions(m); var p = bubbleParameters(m);
        var shape = List.of(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST,
            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN);
        if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Z".equals(m.getReturnType()) || p.size() != 2 ||
            !BUBBLE_SESSION.equals(p.get(0)) || m.getImplementation() == null || m.getImplementation().getRegisterCount() != 3 ||
            !m.getImplementation().getTryBlocks().isEmpty() || !c.stream().map(Instruction::getOpcode).toList().equals(shape) ||
            !(((ReferenceInstruction)c.get(0)).getReference() instanceof FieldReference holder) ||
            !(((ReferenceInstruction)c.get(1)).getReference() instanceof MethodReference fetch)) return false;
        var read = (TwoRegisterInstruction)c.get(0);
        return read.getRegisterA() == 0 && read.getRegisterB() == 2 && holder.getDefiningClass().equals(p.get(1)) &&
            fetch.getDefiningClass().equals(holder.getType()) && fetch.getName().equals("get") && fetch.getParameterTypes().isEmpty() &&
            fetch.getReturnType().equals("Ljava/lang/Object;") && calls(c.get(1),0) && register(c.get(2)) == 0 &&
            register(c.get(3)) == 0 && gate.split("->")[0].equals(ref(c.get(3))) && gate.equals(ref(c.get(4))) &&
            calls(c.get(4),0,1) && register(c.get(5)) == 0 && register(c.get(6)) == 0;
    }

    /** The shortcut builder names its ID through a static (ThreadKey)String helper that does. As in NativeBubbles.kt. */
    static boolean namesThreadShortcut(Map<String,ClassDef> byType, List<Instruction> c) {
        for (var i : c) if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m &&
            m.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(BUBBLE_THREAD)) && "Ljava/lang/String;".equals(m.getReturnType()) &&
            bubbleTarget(byType, m) instanceof Method helper && instructions(helper).stream().anyMatch(h -> "thread_shortcut_".equals(ref(h)))) return true;
        return false;
    }

    /** NativeBubbles.kt's immutable connected-route checks. */
    static String nativeBubbleRoutes(List<ClassDef> classes, String gate) {
        var byType = new HashMap<String,ClassDef>(); classes.forEach(c -> byType.put(c.getType(),c));
        var activity = byType.get("L"+BUBBLE_ACTIVITY.replace('.','/')+";");
        if (activity == null || !"Lcom/facebook/messaging/msys/thread/fragment/MsysThreadViewActivity;".equals(activity.getSuperclass())) return null;
        boolean guarded = false;
        for (var m : activity.getMethods()) if (m.getName().equals("onPostResume") && instructions(m).stream().anyMatch(i -> gate.equals(ref(i)))) guarded = true;
        if (!guarded) return null;
        var shortcuts = new ArrayList<Method>(); var attachments = new ArrayList<Method>(); var conversations = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            var c = instructions(m); var refs = c.stream().map(CompatReport::ref).filter(Objects::nonNull).collect(Collectors.toSet());
            if (bubbleParameters(m).equals(List.of("Landroid/content/Context;","Landroid/graphics/Bitmap;","Lcom/facebook/messaging/model/threadkey/ThreadKey;","Ljava/lang/String;")) &&
                namesThreadShortcut(byType, c) && refs.contains(SHORTCUT_BUILDER+"->setPerson(Landroid/app/Person;)"+SHORTCUT_BUILDER) &&
                refs.contains(SHORTCUT_BUILDER+"->setIntent(Landroid/content/Intent;)"+SHORTCUT_BUILDER) &&
                refs.contains(SHORTCUT_BUILDER+"->build()Landroid/content/pm/ShortcutInfo;")) {
                for (int at=0;at<c.size();at++) if ((SHORTCUT_BUILDER+"->setLongLived(Z)"+SHORTCUT_BUILDER).equals(ref(c.get(at))) &&
                    c.get(at) instanceof FiveRegisterInstruction call && call.getRegisterCount()==2 && m.getImplementation().getTryBlocks().isEmpty()) {
                    int write=-1; for(int j=0;j<at;j++) if(c.get(j).getOpcode().setsRegister() && register(c.get(j))==call.getRegisterD()) write=j;
                    if(write>=0 && write<=2 && c.get(write).getOpcode()==Opcode.CONST_4 && ((NarrowLiteralInstruction)c.get(write)).getNarrowLiteral()==1) shortcuts.add(m);
                }
            }
            if (refs.contains("shouldAttachBubbleMetadataToNotification") && refs.contains("attach_bubble_metadata") &&
                (refs.contains(gate) || c.stream().anyMatch(i -> i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference called && bubbleTarget(byType, called) instanceof Method helper && bubbleGateHelper(helper, gate))) &&
                c.stream().anyMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference)) attachments.add(m);
            if (refs.contains(MESSAGING_STYLE) && refs.contains("Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;") &&
                refs.contains("Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V")) conversations.add(m);
        }
        if(shortcuts.size()!=1 || attachments.size()!=1 || conversations.size()!=1) return null;
        var shortcut=shortcuts.get(0); var attachment=attachments.get(0); var conversation=conversations.get(0);
        var fields=instructions(attachment).stream().filter(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference)
            .map(i -> (FieldReference)((ReferenceInstruction)i).getReference()).toList();
        if(fields.size()!=1) return null;
        var field=fields.get(0); var c=instructions(conversation);
        if(c.stream().noneMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && field.toString().equals(ref(i))) ||
            c.stream().noneMatch(i -> i.getOpcode()==Opcode.IPUT_OBJECT && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f &&
                f.getDefiningClass().equals(field.getDefiningClass()) && f.getType().equals("Ljava/lang/String;"))) return null;
        var builder=byType.get(field.getDefiningClass()); if(builder==null) return null;
        for(var api : List.of("Landroid/app/Notification$Builder;->setBubbleMetadata(Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;",
                             "Landroid/app/Notification$Builder;->setShortcutId(Ljava/lang/String;)Landroid/app/Notification$Builder;")) {
            boolean reached=false; var seen=new HashMap<String,Integer>();
            for(var root:builder.getMethods()) if(root.getReturnType().equals("Landroid/app/Notification;") && reachesBubbleApi(byType,root,api,4,seen)) reached=true;
            if(!reached) return null;
        }
        if (!connectedBubbleValues(classes, shortcut, attachment, conversation, field)) return null;
        return String.join("|",hookId(attachment),hookId(shortcut),hookId(conversation));
    }

    static final String BUBBLE_SHORTCUT = "Landroid/content/pm/ShortcutInfo;";
    static final String BUBBLE_THREAD = "Lcom/facebook/messaging/model/threadkey/ThreadKey;";
    static final String BUBBLE_BUILDER = "Landroid/app/Notification$Builder;";
    static final String BUBBLE_PLATFORM_METADATA = "Landroid/app/Notification$BubbleMetadata;";
    static final String BUBBLE_METADATA_BUILDER = "Landroid/app/Notification$BubbleMetadata$Builder;";
    static final String BUBBLE_PENDING = "Landroid/app/PendingIntent;";

    static List<Integer> bubbleArgs(Instruction i) {
        if (i instanceof RegisterRangeInstruction r)
            return java.util.stream.IntStream.range(r.getStartRegister(), r.getStartRegister() + r.getRegisterCount()).boxed().toList();
        if (i instanceof FiveRegisterInstruction r)
            return Arrays.asList(r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG()).subList(0, r.getRegisterCount());
        return List.of();
    }

    record BubbleField(FieldReference reference, String base) {}

    /** NativeBubbles.kt's bounded reaching-definition and connected-value contracts. */
    static final class BubbleValues {
        final Method method;
        final List<Instruction> code;
        final List<List<Integer>> predecessors;
        final int parameterStart;
        final boolean valid;
        BubbleValues(Method method) {
            this.method = method;
            code = instructions(method);
            parameterStart = (method.getImplementation() == null ? 0 : method.getImplementation().getRegisterCount()) -
                bubbleParameters(method).stream().mapToInt(p -> p.equals("J") || p.equals("D") ? 2 : 1).sum() -
                (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            predecessors = new ArrayList<>();
            for (int i = 0; i < code.size(); i++) predecessors.add(new ArrayList<>());
            var offsets = new HashMap<Integer, Integer>();
            int offset = 0;
            for (int at = 0; at < code.size(); at++) { offsets.put(offset, at); offset += code.get(at).getCodeUnits(); }
            boolean supported = !code.isEmpty() && code.size() <= 2048;
            if (!code.isEmpty()) predecessors.get(0).add(-1);
            offset = 0;
            for (int at = 0; at < code.size(); at++) {
                var i = code.get(at); String op = i.getOpcode().name();
                if (op.contains("SWITCH") || op.contains("PAYLOAD")) supported = false;
                if (op.startsWith("INVOKE") && (!(i instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference) ||
                    op.contains("POLYMORPHIC"))) supported = false;
                if (op.startsWith("IF_") || op.startsWith("GOTO")) {
                    Integer target = i instanceof OffsetInstruction jump ? offsets.get(offset + jump.getCodeOffset()) : null;
                    if (target == null) supported = false; else predecessors.get(target).add(at);
                }
                if (!op.startsWith("GOTO") && !op.startsWith("RETURN") && !op.equals("THROW") && at + 1 < code.size())
                    predecessors.get(at + 1).add(at);
                offset += i.getCodeUnits();
            }
            var normal = predecessors.stream().map(List::copyOf).toList();
            var blocks = method.getImplementation() == null ? List.<com.android.tools.smali.dexlib2.iface.TryBlock<? extends com.android.tools.smali.dexlib2.iface.ExceptionHandler>>of() : method.getImplementation().getTryBlocks();
            if (blocks.size() > 32) supported = false;
            int edges = normal.stream().mapToInt(List::size).sum();
            for (var block : blocks.subList(0, Math.min(32, blocks.size()))) for (var handler : block.getExceptionHandlers()) {
                Integer target = offsets.get(handler.getHandlerCodeAddress());
                if (target == null) { supported = false; continue; }
                int address = 0;
                for (int at = 0; at < code.size(); at++) {
                    if (address >= block.getStartCodeAddress() && address < block.getStartCodeAddress() + block.getCodeUnitCount() && code.get(at).getOpcode().canThrow()) {
                        // A throwing instruction may not write its destination. Use its incoming values.
                        edges += normal.get(at).size();
                        if (edges > 8192) supported = false; else predecessors.get(target).addAll(normal.get(at));
                    }
                    address += code.get(at).getCodeUnits();
                }
            }
            valid = supported;
        }
        Integer parameter(String type) {
            int register = parameterStart + (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            Integer found = null;
            for (var p : bubbleParameters(method)) {
                if (p.equals(type)) { if (found != null) return null; found = register; }
                register += p.equals("J") || p.equals("D") ? 2 : 1;
            }
            return found;
        }
        int parameterAt(int index) {
            int register = parameterStart + (AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1);
            for (int n = 0; n < index; n++) register += bubbleParameters(method).get(n).equals("J") || bubbleParameters(method).get(n).equals("D") ? 2 : 1;
            return register;
        }
        Set<Integer> definitions(int before, int register) {
            if (!valid || before < 0 || before >= code.size()) return Set.of();
            var pending = new ArrayDeque<List<Integer>>(); pending.add(List.of(before, register));
            var seen = new HashSet<List<Integer>>(); var result = new TreeSet<Integer>();
            while (!pending.isEmpty()) {
                var work = pending.removeFirst(); int at = work.get(0), r = work.get(1);
                if (!seen.add(work)) continue;
                if (seen.size() > 4096 || result.size() > 8) return Set.of();
                if (predecessors.get(at).isEmpty()) return Set.of();
                for (int previous : predecessors.get(at)) {
                    if (previous < 0) {
                        if (r < parameterStart) return Set.of();
                        result.add(-r - 1); continue;
                    }
                    var i = code.get(previous);
                    if (!i.getOpcode().setsRegister() || register(i) != r) pending.add(List.of(previous, r));
                    else if (i.getOpcode().name().startsWith("MOVE") && i instanceof TwoRegisterInstruction move)
                        pending.add(List.of(previous, move.getRegisterB()));
                    else if (i.getOpcode() == Opcode.CHECK_CAST) pending.add(List.of(previous, r));
                    else {
                        Instruction call = previous > 0 ? code.get(previous - 1) : null;
                        MethodReference ref = call instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr ? mr : null;
                        if (i.getOpcode() == Opcode.MOVE_RESULT_OBJECT && ref != null &&
                            Set.of(SHORTCUT_BUILDER, BUBBLE_BUILDER, BUBBLE_METADATA_BUILDER, "Landroid/content/Intent;").contains(ref.getDefiningClass()) &&
                            ref.getReturnType().equals(ref.getDefiningClass()) && !ref.getName().equals("build") && !bubbleArgs(call).isEmpty())
                            pending.add(List.of(previous - 1, bubbleArgs(call).get(0)));
                        else result.add(previous);
                    }
                }
            }
            return result;
        }
        String key(int before, int register) { return key(before, register, 8); }
        String key(int before, int register, int depth) {
            if (depth == 0) return null;
            var definitions = definitions(before, register);
            if (definitions.isEmpty()) return null;
            var keys = new ArrayList<String>();
            for (int at : definitions) {
                if (at < 0) keys.add("p" + (-at - 1));
                else {
                    var i = code.get(at);
                    if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof TwoRegisterInstruction read) {
                        String base = key(at, read.getRegisterB(), depth - 1);
                        if (base == null) return null;
                        keys.add(ref(i) + "[" + base + "]");
                    } else keys.add(i.getOpcode().name() + ":" + at + ":" + ref(i));
                }
            }
            return String.join("|", keys);
        }
        Integer callValue(int before, int register) {
            var defs = definitions(before, register);
            if (defs.size() != 1) return null;
            int at = defs.iterator().next();
            return at > 0 && code.get(at).getOpcode() == Opcode.MOVE_RESULT_OBJECT &&
                code.get(at - 1).getOpcode().name().startsWith("INVOKE") ? at - 1 : null;
        }
        BubbleField fieldKey(int before, int register) {
            var defs = definitions(before, register); if (defs.size() != 1) return null;
            int at = defs.iterator().next();
            if (at < 0 || code.get(at).getOpcode() != Opcode.IGET_OBJECT || !(code.get(at) instanceof TwoRegisterInstruction read) ||
                !(code.get(at) instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof FieldReference field)) return null;
            String base = key(at, read.getRegisterB());
            return base == null ? null : new BubbleField(field, base);
        }
        Set<Integer> fieldDefinitions(int before, int register) {
            var defs = definitions(before, register); if (defs.size() != 1) return Set.of();
            int at = defs.iterator().next();
            if (at < 0 || code.get(at).getOpcode() != Opcode.IGET_OBJECT || !(code.get(at) instanceof TwoRegisterInstruction read)) return Set.of();
            return definitions(at, read.getRegisterB());
        }
        boolean returns(String expected) {
            if (expected == null) return false;
            for (int at = 0; at < code.size(); at++)
                if (code.get(at).getOpcode() == Opcode.RETURN_OBJECT && expected.equals(key(at, register(code.get(at))))) return true;
            return false;
        }
        List<Integer> calls() {
            if (!valid) return List.of();
            var calls = new ArrayList<Integer>();
            for (int at = 0; at < code.size(); at++) if (code.get(at).getOpcode().name().startsWith("INVOKE")) calls.add(at);
            return calls;
        }
        MethodReference reference(int at) {
            return code.get(at) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr ? mr : null;
        }
        Integer argument(int at, int n) { var args = bubbleArgs(code.get(at)); return n >= 0 && n < args.size() ? args.get(n) : null; }
    }

    static Method bubbleTarget(Map<String, ClassDef> byType, MethodReference reference) {
        if (reference == null || !byType.containsKey(reference.getDefiningClass())) return null;
        Method found = null;
        for (var m : byType.get(reference.getDefiningClass()).getMethods()) if (hookId(m).equals(reference.toString())) {
            if (found != null) return null; found = m;
        }
        return found;
    }
    static Integer bubbleSingle(List<Integer> sites, java.util.function.Predicate<Integer> predicate) {
        var matches = sites.stream().filter(predicate).toList(); return matches.size() == 1 ? matches.get(0) : null;
    }
    static boolean bubbleReturnsCall(Map<String, ClassDef> byType, Method method, Method shortcut, String id, int depth, Map<String, Integer> seen) {
        if (hookId(method).equals(id) || (method.getDefiningClass().equals(shortcut.getDefiningClass()) &&
            method.getReturnType().equals(shortcut.getReturnType()) &&
            Objects.equals(String.valueOf(bubbleShortcutField(byType, method)), String.valueOf(bubbleShortcutField(byType, shortcut))))) return true;
        if (depth == 0 || seen.getOrDefault(hookId(method), -1) >= depth) return false;
        seen.put(hookId(method), depth);
        var f = new BubbleValues(method);
        for (int at = 0; at < f.code.size(); at++) if (f.code.get(at).getOpcode() == Opcode.RETURN_OBJECT)
            for (int definition : f.definitions(at, register(f.code.get(at)))) {
                if (definition <= 0 || f.code.get(definition).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                var called = bubbleTarget(byType, f.reference(definition - 1));
                if (called != null && bubbleReturnsCall(byType, called, shortcut, id, depth - 1, seen)) return true;
            }
        return false;
    }
    static MethodReference bubbleFactory(BubbleValues f, int store, String container, String containerType, FieldReference metadata) {
        var write = (TwoRegisterInstruction)f.code.get(store);
        Integer pack = f.callValue(store, write.getRegisterA()); if (pack == null) return null;
        var packRef = f.reference(pack);
        if (packRef == null || !packRef.getReturnType().equals(metadata.getType()) || !bubbleParameters(packRef).isEmpty()) return null;
        Integer receiver = f.argument(pack, 0), make = receiver == null ? null : f.callValue(pack, receiver);
        if (make == null) return null;
        var ref = f.reference(make); if (ref == null) return null;
        int argument = bubbleParameters(ref).indexOf(containerType) + (f.code.get(make).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
        Integer input = f.argument(make, argument);
        if (!ref.getReturnType().equals(packRef.getDefiningClass()) ||
            bubbleParameters(ref).stream().filter(containerType::equals).count() != 1 ||
            input == null || !Objects.equals(f.key(make, input), container)) return null;
        return ref;
    }
    static FieldReference bubbleShortcutField(Map<String, ClassDef> byType, Method shortcut) {
        var s = new BubbleValues(shortcut);
        Integer build = bubbleSingle(s.calls(), at -> (SHORTCUT_BUILDER + "->build()" + BUBBLE_SHORTCUT).equals(s.reference(at).toString()));
        if (build == null) return null;
        String builderKey = s.key(build, s.argument(build, 0)); if (builderKey == null) return null;
        for (var entry : Map.of("setLongLived", "Z", "setPerson", "Landroid/app/Person;", "setIntent", "Landroid/content/Intent;").entrySet()) {
            Integer at = bubbleSingle(s.calls(), i -> s.reference(i).getName().equals(entry.getKey()) && s.reference(i).getDefiningClass().equals(SHORTCUT_BUILDER));
            if (at == null || !Objects.equals(s.key(at, s.argument(at, 0)), builderKey)) return null;
            Integer argument = s.argument(at, 1); if (argument == null) return null;
            if (entry.getKey().equals("setLongLived")) {
                var defs = s.definitions(at, argument);
                if (defs.size() != 1) return null;
                int d = defs.iterator().next();
                if (d < 0 || !(s.code.get(d) instanceof NarrowLiteralInstruction literal) || literal.getNarrowLiteral() != 1) return null;
            } else {
                Integer result = s.callValue(at, argument);
                if (result == null || !s.reference(result).getReturnType().equals(entry.getValue())) return null;
            }
        }
        Integer containerCtor = bubbleSingle(s.calls(), at -> {
            var ref = s.reference(at); int index = bubbleParameters(ref).indexOf(BUBBLE_SHORTCUT);
            Integer argument = s.argument(at, index + 1);
            return ref.getName().equals("<init>") && ref.getDefiningClass().equals(shortcut.getReturnType()) && index >= 0 &&
                argument != null && Objects.equals(s.callValue(at, argument), build);
        });
        if (containerCtor == null) return bubbleHolderField(byType, shortcut, s, build);
        if (!s.returns(s.key(containerCtor, s.argument(containerCtor, 0)))) return null;
        var constructor = bubbleTarget(byType, s.reference(containerCtor)); if (constructor == null) return null;
        var cf = new BubbleValues(constructor); Integer shortcutRegister = cf.parameter(BUBBLE_SHORTCUT);
        if (shortcutRegister == null) return null;
        var shortcutFields = new ArrayList<FieldReference>();
        for (int at = 0; at < cf.code.size(); at++) {
            var i = cf.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field)) continue;
            if (field.getType().equals(BUBBLE_SHORTCUT) && Objects.equals(cf.key(at, write.getRegisterA()), cf.key(0, shortcutRegister)) &&
                Objects.equals(cf.key(at, write.getRegisterB()), cf.key(0, cf.parameterStart))) shortcutFields.add(field);
        }
        return shortcutFields.size() == 1 ? shortcutFields.get(0) : null;
    }

    /**
     * 586's armv7 build puts the shortcut in a holder and hands the holder to the returned container's constructor, which
     * copies it onto the container's own field. That field, as in NativeBubbles.kt's bubbleHolderField.
     */
    static FieldReference bubbleHolderField(Map<String, ClassDef> byType, Method shortcut, BubbleValues s, int build) {
        var holderWrites = new ArrayList<Integer>();
        for (int at = 0; at < s.code.size(); at++) {
            var i = s.code.get(at);
            if (i.getOpcode() == Opcode.IPUT_OBJECT && i instanceof TwoRegisterInstruction write &&
                ((ReferenceInstruction)i).getReference() instanceof FieldReference field && field.getType().equals(BUBBLE_SHORTCUT) &&
                Objects.equals(s.callValue(at, write.getRegisterA()), build)) holderWrites.add(at);
        }
        if (holderWrites.size() != 1) return null;
        int store = holderWrites.get(0);
        var holderField = (FieldReference)((ReferenceInstruction)s.code.get(store)).getReference();
        String holderKey = s.key(store, ((TwoRegisterInstruction)s.code.get(store)).getRegisterB());
        if (holderKey == null) return null;
        Integer containerCtor = bubbleSingle(s.calls(), at -> {
            var ref = s.reference(at); int index = bubbleParameters(ref).indexOf(holderField.getDefiningClass());
            Integer argument = s.argument(at, index + 1);
            return ref.getName().equals("<init>") && ref.getDefiningClass().equals(shortcut.getReturnType()) && index >= 0 &&
                bubbleParameters(ref).stream().filter(holderField.getDefiningClass()::equals).count() == 1 &&
                argument != null && holderKey.equals(s.key(at, argument));
        });
        if (containerCtor == null || !s.returns(s.key(containerCtor, s.argument(containerCtor, 0)))) return null;
        var constructor = bubbleTarget(byType, s.reference(containerCtor)); if (constructor == null) return null;
        var cf = new BubbleValues(constructor); Integer holder = cf.parameter(holderField.getDefiningClass());
        if (holder == null) return null;
        var shortcutFields = new ArrayList<FieldReference>();
        for (int at = 0; at < cf.code.size(); at++) {
            var i = cf.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) ||
                !field.getDefiningClass().equals(shortcut.getReturnType()) || !field.getType().equals(BUBBLE_SHORTCUT) ||
                !Objects.equals(cf.key(at, write.getRegisterB()), cf.key(0, cf.parameterStart))) continue;
            var read = cf.fieldKey(at, write.getRegisterA());
            if (read != null && read.reference().toString().equals(holderField.toString()) && Objects.equals(read.base(), cf.key(0, holder)))
                shortcutFields.add(field);
        }
        return shortcutFields.size() == 1 ? shortcutFields.get(0) : null;
    }

    static boolean connectedBubbleValues(List<ClassDef> classes, Method shortcut, Method attachment, Method conversation, FieldReference metadata) {
        var byType = new HashMap<String, ClassDef>(); classes.forEach(c -> byType.put(c.getType(), c));
        var shortcutField = bubbleShortcutField(byType, shortcut); if (shortcutField == null) return false;
        var a = new BubbleValues(attachment); var c = new BubbleValues(conversation);
        var storesA = new ArrayList<Integer>(); var storesC = new ArrayList<Integer>();
        for (int at = 0; at < a.code.size(); at++) if (a.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && metadata.toString().equals(ref(a.code.get(at)))) storesA.add(at);
        for (int at = 0; at < c.code.size(); at++) if (c.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && metadata.toString().equals(ref(c.code.get(at)))) storesC.add(at);
        if (storesA.size() != 1 || storesC.size() != 1) return false;
        int attachmentStore = storesA.get(0), conversationStore = storesC.get(0);
        Integer ap = a.parameter(shortcut.getReturnType()), notificationParameter = a.parameter(metadata.getDefiningClass());
        if (ap == null || notificationParameter == null ||
            !Objects.equals(a.key(attachmentStore, ((TwoRegisterInstruction)a.code.get(attachmentStore)).getRegisterB()), a.key(0, notificationParameter))) return false;
        var attachedFactory = bubbleFactory(a, attachmentStore, a.key(0, ap), shortcut.getReturnType(), metadata);
        if (attachedFactory == null) return false;
        Integer push = bubbleSingle(c.calls(), at -> ("Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(" + BUBBLE_SHORTCUT + ")V").equals(c.reference(at).toString()));
        if (push == null || c.argument(push, 1) == null) return false;
        var pushed = c.fieldKey(push, c.argument(push, 1));
        if (pushed == null || !pushed.reference().toString().equals(shortcutField.toString())) return false;
        var idStores = new ArrayList<Integer>();
        for (int at = 0; at < c.code.size(); at++) {
            var i = c.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) ||
                !field.getDefiningClass().equals(metadata.getDefiningClass()) || !field.getType().equals("Ljava/lang/String;")) continue;
            Integer call = c.callValue(at, write.getRegisterA());
            if (call != null && (BUBBLE_SHORTCUT + "->getId()Ljava/lang/String;").equals(c.reference(call).toString())) idStores.add(at);
        }
        if (idStores.size() != 1) return false;
        int idStore = idStores.get(0); var idWrite = (TwoRegisterInstruction)c.code.get(idStore);
        int idCall = c.callValue(idStore, idWrite.getRegisterA());
        var read = c.fieldKey(idCall, c.argument(idCall, 0));
        var conversationFactory = read == null ? null : bubbleFactory(c, conversationStore, read.base(), shortcut.getReturnType(), metadata);
        if (read == null || !read.reference().toString().equals(pushed.reference().toString()) ||
            !c.fieldDefinitions(idCall, c.argument(idCall, 0)).containsAll(c.fieldDefinitions(push, c.argument(push, 1))) ||
            c.fieldDefinitions(idCall, c.argument(idCall, 0)).stream().anyMatch(d -> d <= 0 || c.code.get(d).getOpcode() != Opcode.MOVE_RESULT_OBJECT ||
                bubbleTarget(byType, c.reference(d - 1)) == null || !bubbleReturnsCall(byType, bubbleTarget(byType, c.reference(d - 1)), shortcut, hookId(shortcut), 5, new HashMap<>())) ||
            !Objects.equals(c.key(idStore, idWrite.getRegisterB()),
            c.key(conversationStore, ((TwoRegisterInstruction)c.code.get(conversationStore)).getRegisterB())) ||
            conversationFactory == null || !conversationFactory.toString().equals(attachedFactory.toString())) return false;
        var idField = (FieldReference)((ReferenceInstruction)c.code.get(idStore)).getReference();
        String notificationKey = c.key(idStore, idWrite.getRegisterB()); if (notificationKey == null) return false;
        boolean style = c.calls().stream().anyMatch(at -> {
            if (!c.reference(at).getDefiningClass().equals(metadata.getDefiningClass()) || c.argument(at, 1) == null ||
                !Objects.equals(c.key(at, c.argument(at, 0)), notificationKey)) return false;
            var defs = c.definitions(at, c.argument(at, 1));
            if (defs.size() != 1) return false;
            int d = defs.iterator().next();
            return d >= 0 && c.code.get(d).getOpcode() == Opcode.NEW_INSTANCE && MESSAGING_STYLE.equals(ref(c.code.get(d)));
        });
        if (!style) return false;
        var make = bubbleTarget(byType, attachedFactory); if (make == null) return false;
        var mf = new BubbleValues(make); Integer containerParameter = mf.parameter(shortcut.getReturnType());
        if (containerParameter == null) return false;
        Integer packAt = a.callValue(attachmentStore, ((TwoRegisterInstruction)a.code.get(attachmentStore)).getRegisterA());
        var packMethod = packAt == null ? null : bubbleTarget(byType, a.reference(packAt)); if (packMethod == null) return false;
        var pending = new ArrayList<FieldReference>();
        for (int at = 0; at < mf.code.size(); at++) {
            var i = mf.code.get(at);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                !(((ReferenceInstruction)i).getReference() instanceof FieldReference field) || !field.getType().equals(BUBBLE_PENDING) ||
                !mf.returns(mf.key(at, write.getRegisterB()))) continue;
            Integer call = mf.callValue(at, write.getRegisterA()); if (call == null) continue;
            var ref = mf.reference(call); int index = bubbleParameters(ref).indexOf(BUBBLE_THREAD) + (mf.code.get(call).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
            Integer arg = mf.argument(call, index); var thread = arg == null ? null : mf.fieldKey(call, arg);
            if (ref.getReturnType().equals(BUBBLE_PENDING) && bubbleParameters(ref).stream().filter(BUBBLE_THREAD::equals).count() == 1 &&
                thread != null && thread.reference().getType().equals(BUBBLE_THREAD) &&
                thread.reference().getDefiningClass().equals(shortcut.getReturnType()) && Objects.equals(thread.base(), mf.key(0, containerParameter))) {
                var linked = bubbleMetadataField(byType, packMethod, field); if (linked != null) pending.add(linked);
            }
        }
        if (pending.stream().noneMatch(field -> bubbleNotificationBridge(byType, metadata, idField, field))) return false;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (instructions(method).stream().noneMatch(i -> i.getOpcode().name().startsWith("INVOKE") && hookId(attachment).equals(ref(i)))) continue;
            var f = new BubbleValues(method);
            for (int at : f.calls()) {
                if (!f.reference(at).toString().equals(hookId(attachment))) continue;
                var args = bubbleArgs(f.code.get(at)); if (args.size() < 5) continue;
                String wrapper = f.key(at, args.get(2)); Integer producerAt = f.callValue(at, args.get(4));
                if (wrapper == null || producerAt == null) continue;
                var producer = bubbleTarget(byType, f.reference(producerAt));
                if (producer == null || !producer.getReturnType().equals(shortcut.getReturnType()) ||
                    !bubbleReturnsCall(byType, producer, shortcut, hookId(shortcut), 5, new HashMap<>())) continue;
                boolean built = false;
                for (int site : f.calls()) if (site > at && bubbleBuildCall(byType, f, site, wrapper, metadata.getDefiningClass())) built = true;
                if (!built) continue;
                var p = new BubbleValues(producer); Integer parent = p.parameter(metadata.getDefiningClass());
                int passed = bubbleParameters(producer).indexOf(metadata.getDefiningClass()) + (AccessFlags.STATIC.isSet(producer.getAccessFlags()) ? 0 : 1);
                Integer argument = f.argument(producerAt, passed);
                if (parent == null || argument == null || !Objects.equals(f.key(producerAt, argument), wrapper)) continue;
                for (int site = 0; site < p.code.size(); site++) {
                    var i = p.code.get(site);
                    if (i.getOpcode() != Opcode.IPUT_OBJECT || !(i instanceof TwoRegisterInstruction write) ||
                        !idField.toString().equals(ref(i)) || !Objects.equals(p.key(site, write.getRegisterB()), p.key(0, parent))) continue;
                    Integer idCallP = p.callValue(site, write.getRegisterA()); if (idCallP == null || p.argument(idCallP, 0) == null) continue;
                    var readP = p.fieldKey(idCallP, p.argument(idCallP, 0));
                    if ((BUBBLE_SHORTCUT + "->getId()Ljava/lang/String;").equals(p.reference(idCallP).toString()) &&
                        readP != null && readP.reference().toString().equals(shortcutField.toString()) && p.returns(readP.base())) return true;
                }
            }
        }
        return false;
    }
    static boolean bubbleBuildCall(Map<String, ClassDef> byType, BubbleValues f, int at, String wrapper, String type) {
        var ref = f.reference(at); if (ref == null || !ref.getReturnType().equals("Landroid/app/Notification;")) return false;
        if (ref.getDefiningClass().equals(type)) return f.argument(at, 0) != null && Objects.equals(f.key(at, f.argument(at, 0)), wrapper);
        int index = bubbleParameters(ref).indexOf(type) + (f.code.get(at).getOpcode().name().startsWith("INVOKE_STATIC") ? 0 : 1);
        if (bubbleParameters(ref).stream().filter(type::equals).count() != 1 || f.argument(at, index) == null || !Objects.equals(f.key(at, f.argument(at, index)), wrapper)) return false;
        var helper = bubbleTarget(byType, ref); if (helper == null) return false;
        var h = new BubbleValues(helper); Integer parent = h.parameter(type); if (parent == null) return false;
        for (int site : h.calls()) if (h.reference(site).getDefiningClass().equals(type) && h.reference(site).getReturnType().equals("Landroid/app/Notification;") &&
            h.argument(site, 0) != null && Objects.equals(h.key(site, h.argument(site, 0)), h.key(0, parent))) {
            for (int r = 0; r < h.code.size(); r++) if (h.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(h.callValue(r, register(h.code.get(r))), site)) return true;
        }
        return false;
    }
    static FieldReference bubbleStoredField(Map<String, ClassDef> byType, Method constructor, int index, int depth) {
        var f = new BubbleValues(constructor); String value = f.key(0, f.parameterAt(index)); if (value == null) return null;
        var fields = new ArrayList<FieldReference>();
        for (int at = 0; at < f.code.size(); at++) {
            var i = f.code.get(at);
            if (i.getOpcode() == Opcode.IPUT_OBJECT && i instanceof TwoRegisterInstruction write && i instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof FieldReference field && field.getType().equals(BUBBLE_PENDING) &&
                Objects.equals(f.key(at, write.getRegisterA()), value) && Objects.equals(f.key(at, write.getRegisterB()), f.key(0, f.parameterStart))) fields.add(field);
        }
        if (!fields.isEmpty()) return fields.size() == 1 ? fields.get(0) : null;
        if (depth == 0) return null;
        for (int at : f.calls()) {
            var ref = f.reference(at);
            if (ref == null || !ref.getName().equals("<init>") || !ref.getDefiningClass().equals(constructor.getDefiningClass()) || f.argument(at, 0) == null ||
                !Objects.equals(f.key(at, f.argument(at, 0)), f.key(0, f.parameterStart))) continue;
            Integer forwarded = null;
            for (int n = 0; n < bubbleParameters(ref).size(); n++) if (bubbleParameters(ref).get(n).equals(BUBBLE_PENDING) &&
                f.argument(at, n + 1) != null && Objects.equals(f.key(at, f.argument(at, n + 1)), value)) {
                if (forwarded != null) return null; forwarded = n;
            }
            var target = bubbleTarget(byType, ref); if (forwarded == null || target == null) continue;
            var field = bubbleStoredField(byType, target, forwarded, depth - 1); if (field != null) fields.add(field);
        }
        return fields.size() == 1 ? fields.get(0) : null;
    }
    static FieldReference bubbleMetadataField(Map<String, ClassDef> byType, Method pack, FieldReference pending) {
        var f = new BubbleValues(pack); var fields = new ArrayList<FieldReference>();
        for (int at : f.calls()) {
            var ref = f.reference(at); if (ref == null) continue;
            int index = bubbleParameters(ref).indexOf(BUBBLE_PENDING);
            if (!ref.getName().equals("<init>") || !ref.getDefiningClass().equals(pack.getReturnType()) || index < 0 || f.argument(at, 0) == null ||
                !f.returns(f.key(at, f.argument(at, 0))) || f.argument(at, index + 1) == null) continue;
            var read = f.fieldKey(at, f.argument(at, index + 1));
            if (read == null || !read.reference().toString().equals(pending.toString()) || !Objects.equals(read.base(), f.key(0, f.parameterStart))) continue;
            var target = bubbleTarget(byType, ref); if (target == null) continue;
            var field = bubbleStoredField(byType, target, index, 2); if (field != null) fields.add(field);
        }
        return fields.size() == 1 ? fields.get(0) : null;
    }
    static boolean bubbleConversion(Map<String, ClassDef> byType, Method conversion, FieldReference pending, int depth) {
        var f = new BubbleValues(conversion); Integer parent = f.parameter(pending.getDefiningClass()); if (parent == null) return false;
        for (int at : f.calls()) {
            var ref = f.reference(at); if (ref == null) continue;
            if (ref.toString().equals(BUBBLE_METADATA_BUILDER + "-><init>(" + BUBBLE_PENDING + "Landroid/graphics/drawable/Icon;)V")) {
                if (f.argument(at, 1) == null || f.argument(at, 0) == null) continue;
                var read = f.fieldKey(at, f.argument(at, 1)); int receiver = f.argument(at, 0);
                if (read == null || !read.reference().toString().equals(pending.toString()) || !Objects.equals(read.base(), f.key(0, parent))) continue;
                for (int site : f.calls()) if ((BUBBLE_METADATA_BUILDER + "->build()" + BUBBLE_PLATFORM_METADATA).equals(f.reference(site).toString()) &&
                    f.argument(site, 0) != null && f.definitions(site, f.argument(site, 0)).containsAll(f.definitions(at, receiver))) {
                    for (int r = 0; r < f.code.size(); r++) if (f.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(f.callValue(r, register(f.code.get(r))), site)) return true;
                }
            } else if (depth > 0 && ref.getReturnType().equals(BUBBLE_PLATFORM_METADATA) && bubbleParameters(ref).equals(List.of(pending.getDefiningClass())) &&
                f.argument(at, 0) != null && Objects.equals(f.key(at, f.argument(at, 0)), f.key(0, parent))) {
                boolean returned = false;
                for (int r = 0; r < f.code.size(); r++) if (f.code.get(r).getOpcode() == Opcode.RETURN_OBJECT && f.definitions(r, register(f.code.get(r))).contains(at + 1)) returned = true;
                var target = bubbleTarget(byType, ref);
                if (returned && target != null && bubbleConversion(byType, target, pending, depth - 1)) return true;
            }
        }
        return false;
    }
    static boolean bubbleNotificationBridge(Map<String, ClassDef> byType, FieldReference metadata, FieldReference id, FieldReference pending) {
        var owner = byType.get(metadata.getDefiningClass()); if (owner == null) return false;
        var roots = new ArrayList<Method>();
        for (var m : owner.getMethods()) if (m.getReturnType().equals("Landroid/app/Notification;") && bubbleParameters(m).isEmpty()) roots.add(m);
        if (roots.size() != 1) return false;
        var r = new BubbleValues(roots.get(0));
        Integer build = bubbleSingle(r.calls(), at -> (BUBBLE_BUILDER + "->build()Landroid/app/Notification;").equals(r.reference(at).toString()));
        if (build == null || r.argument(build, 0) == null) return false;
        boolean builtReturn = false;
        for (int at = 0; at < r.code.size(); at++) if (r.code.get(at).getOpcode() == Opcode.RETURN_OBJECT && Objects.equals(r.callValue(at, register(r.code.get(at))), build)) builtReturn = true;
        if (!builtReturn) return false;
        var builder = r.fieldKey(build, r.argument(build, 0)); if (builder == null) return false;
        Integer ctorAt = bubbleSingle(r.calls(), at -> r.reference(at).getName().equals("<init>") &&
            r.reference(at).getDefiningClass().equals(builder.reference().getDefiningClass()) && r.argument(at, 1) != null &&
            Objects.equals(r.key(at, r.argument(at, 0)), builder.base()) && Objects.equals(r.key(at, r.argument(at, 1)), r.key(0, r.parameterStart)));
        if (ctorAt == null) return false;
        var constructor = bubbleTarget(byType, r.reference(ctorAt)); if (constructor == null) return false;
        var f = new BubbleValues(constructor); Integer parent = f.parameter(metadata.getDefiningClass()); if (parent == null) return false;
        Integer platformStore = bubbleSingle(java.util.stream.IntStream.range(0, f.code.size()).boxed().toList(), at -> f.code.get(at).getOpcode() == Opcode.IPUT_OBJECT && builder.reference().toString().equals(ref(f.code.get(at))));
        if (platformStore == null) return false;
        var write = (TwoRegisterInstruction)f.code.get(platformStore); var values = f.definitions(platformStore, write.getRegisterA());
        if (values.size() != 1) return false;
        int value = values.iterator().next();
        if (value < 0 || f.code.get(value).getOpcode() != Opcode.NEW_INSTANCE || !BUBBLE_BUILDER.equals(ref(f.code.get(value))) ||
            !Objects.equals(f.key(platformStore, write.getRegisterB()), f.key(0, f.parameterStart))) return false;
        String platformKey = builder.reference() + "[" + f.key(0, f.parameterStart) + "]";
        Integer shortcut = bubbleSingle(f.calls(), at -> (BUBBLE_BUILDER + "->setShortcutId(Ljava/lang/String;)" + BUBBLE_BUILDER).equals(f.reference(at).toString()));
        if (shortcut == null || f.argument(shortcut, 1) == null || !Objects.equals(f.key(shortcut, f.argument(shortcut, 0)), platformKey) ||
            !bubbleReadsField(f, shortcut, f.argument(shortcut, 1), id, parent)) return false;
        for (int at : f.calls()) {
            var ref = f.reference(at);
            if (!bubbleParameters(ref).equals(List.of(BUBBLE_PLATFORM_METADATA, BUBBLE_BUILDER)) || !ref.getReturnType().equals("V")) continue;
            var args = bubbleArgs(f.code.get(at));
            if (args.size() != 2 || !Objects.equals(f.key(at, args.get(1)), platformKey)) continue;
            Integer convert = f.callValue(at, args.get(0)); if (convert == null) continue;
            var conversion = f.reference(convert);
            if (!bubbleParameters(conversion).equals(List.of(metadata.getType())) || !conversion.getReturnType().equals(BUBBLE_PLATFORM_METADATA) ||
                f.argument(convert, 0) == null || !bubbleReadsField(f, convert, f.argument(convert, 0), metadata, parent)) continue;
            var converter = bubbleTarget(byType, conversion); if (converter == null || !bubbleConversion(byType, converter, pending, 3)) continue;
            var delegate = bubbleTarget(byType, ref); if (delegate == null) continue;
            var d = new BubbleValues(delegate);
            Integer mp = d.parameter(BUBBLE_PLATFORM_METADATA), bp = d.parameter(BUBBLE_BUILDER); if (mp == null || bp == null) continue;
            for (int site : d.calls()) if ((BUBBLE_BUILDER + "->setBubbleMetadata(" + BUBBLE_PLATFORM_METADATA + ")" + BUBBLE_BUILDER).equals(d.reference(site).toString()) &&
                d.argument(site, 1) != null && Objects.equals(d.key(site, d.argument(site, 0)), d.key(0, bp)) &&
                Objects.equals(d.key(site, d.argument(site, 1)), d.key(0, mp))) return true;
        }
        return false;
    }
    static boolean bubbleReadsField(BubbleValues f, int at, int register, FieldReference field, int parent) {
        var read = f.fieldKey(at, register);
        return read != null && read.reference().toString().equals(field.toString()) && Objects.equals(read.base(), f.key(0, parent));
    }

    static List<String> bubbleParameters(MethodReference reference) {
        return reference.getParameterTypes().stream().map(CharSequence::toString).toList();
    }
}
