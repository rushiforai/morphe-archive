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
import static compat.Bubbles.*;
import static compat.Coexist.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Looks: the tab bar, avatar shape and story rings. */
final class Looks {

    // 587's numbering (586 read 0x0101055400014313 and 0x0101039400033264).
    static final long FLOATING_TAB_BAR_FLAG = 0x0101055600014560L;
    static final long CHATS_SCROLL_AWAY_FLAG = 0x0101039000033352L;
    // The Chats page's slide answer, which the bar's frame asks before a scroll may move the bar at all.
    static final long CHATS_SLIDE_FLAG = 0x0101039000003351L;
    static final String FUNCTION0 = "Lkotlin/jvm/functions/Function0;";
    static final List<String> TAB_BAR_BUILDER_PARAMETERS =
        List.of("Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;", "Z");
    static final List<String> TAB_BAR_FRAGMENT_PARAMETERS =
        List.of("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;");

    /** 586's singleton (Context, FbUserSession, boolean) builder, or 587's tab fragment onCreateView. */
    static boolean tabBarBuilder(Method method) {
        return !AccessFlags.STATIC.isSet(method.getAccessFlags()) && method.getReturnType().startsWith("L") &&
            (params(method).equals(TAB_BAR_BUILDER_PARAMETERS) ||
                "onCreateView".equals(method.getName()) && params(method).equals(TAB_BAR_FRAGMENT_PARAMETERS));
    }

    /**
     * The floating pill's gate in the tab bar builder: its flag loaded once, read through Messenger's config with only a
     * move or a cast in between, then an if-eqz on the answer jumping forward, with nothing landing on it. The if-eqz's
     * index, or -1. Mirrors TabBar.kt.
     */
    static int floatingTabBarGate(Method method) {
        if (!tabBarBuilder(method)) return -1;
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.CONST_WIDE || !Long.valueOf(FLOATING_TAB_BAR_FLAG).equals(wide(code.get(i)))) continue;
            if (at >= 0) return -1;
            at = i;
        }
        if (at < 0) return -1;
        int flag = register(code.get(at));
        int read = -1;
        for (int i = at + 1; i <= at + 3 && i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.INVOKE_INTERFACE) { read = i; break; }
        if (read < 0 || read + 2 >= code.size()) return -1;
        for (int i = at + 1; i < read; i++) {
            var op = code.get(i).getOpcode();
            if (op != Opcode.MOVE_OBJECT && op != Opcode.MOVE_OBJECT_FROM16 && op != Opcode.CHECK_CAST) return -1;
            int written = register(code.get(i));
            if (written == flag || written == flag + 1) return -1;
        }
        if (!(((ReferenceInstruction) code.get(read)).getReference() instanceof MethodReference call)) return -1;
        var types = new ArrayList<String>();
        for (var t : call.getParameterTypes()) types.add(t.toString());
        var args = reads(code.get(read));
        if (!"Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;".equals(call.getDefiningClass()) ||
            !"Z".equals(call.getReturnType()) || !types.equals(List.of("J")) || args.size() != 3 || args.get(1) != flag ||
            args.get(2) != flag + 1) return -1;
        int answer = register(code.get(read + 1));
        int gate = read + 2;
        if (code.get(read + 1).getOpcode() != Opcode.MOVE_RESULT || answer > 15 || code.get(gate).getOpcode() != Opcode.IF_EQZ ||
            register(code.get(gate)) != answer || mediaTarget(code, gate) <= gate) return -1;
        return mediaTargets(method).contains(gate) ? -1 : gate;
    }

    /**
     * The overlay's gate in the same builder, after the floating flag's read. 586: an if-nez on another register, then a
     * one-argument static boolean check whose if-nez goes to the same place, gated on the second if-nez. 587: an inline
     * lazy read (lazyOverlayCheck) whose if-eqz goes to the column, right after a run of if-nez whose first goes to the
     * overlay just past the check and the rest to the column. The gate's index, or -1. Mirrors TabBar.kt.
     */
    static int tabBarOverlayGate(Method method) {
        if (!tabBarBuilder(method)) return -1;
        var code = instructions(method);
        int flag = -1;
        for (int i = 0; i < code.size() && flag < 0; i++)
            if (code.get(i).getOpcode() == Opcode.CONST_WIDE && Long.valueOf(FLOATING_TAB_BAR_FLAG).equals(wide(code.get(i)))) flag = i;
        if (flag < 0) return -1;
        int gate = -1;
        for (int at = flag + 2; at < code.size() - 2; at++) {
            if (code.get(at - 1).getOpcode() != Opcode.IF_NEZ || code.get(at).getOpcode() != Opcode.INVOKE_STATIC ||
                !(((ReferenceInstruction) code.get(at)).getReference() instanceof MethodReference check)) continue;
            if (!"Z".equals(check.getReturnType()) || check.getParameterTypes().size() != 1 ||
                !check.getParameterTypes().get(0).toString().startsWith("L") || reads(code.get(at)).size() != 1) continue;
            if (code.get(at + 1).getOpcode() != Opcode.MOVE_RESULT || code.get(at + 2).getOpcode() != Opcode.IF_NEZ ||
                register(code.get(at + 2)) != register(code.get(at + 1)) || register(code.get(at - 1)) == register(code.get(at + 1))) continue;
            int target = mediaTarget(code, at + 2);
            if (mediaTarget(code, at - 1) != target || target <= at + 2) continue;
            if (gate >= 0) return -1;
            gate = at + 2;
        }
        for (int at = flag + 2; at < code.size() - 6; at++) {
            if (!lazyOverlayCheck(code, at)) continue;
            int column = mediaTarget(code, at + 5);
            int first = at;
            while (first - 1 > flag && code.get(first - 1).getOpcode() == Opcode.IF_NEZ) first--;
            if (column <= at + 6 || first == at || mediaTarget(code, first) != at + 6) continue;
            boolean rest = true;
            for (int i = first + 1; i < at; i++) if (mediaTarget(code, i) != column) rest = false;
            if (!rest) continue;
            if (gate >= 0) return -1;
            gate = at + 5;
        }
        if (gate < 0 || register(code.get(gate - 1)) > 15) return -1;
        return mediaTargets(method).contains(gate) ? -1 : gate;
    }

    /** getValue() on a lazy holder, a cast to Boolean, booleanValue() and an if-eqz on the answer. Mirrors TabBar.kt. */
    static boolean lazyOverlayCheck(List<? extends Instruction> code, int at) {
        if (code.get(at).getOpcode() != Opcode.INVOKE_INTERFACE || !(((ReferenceInstruction) code.get(at)).getReference() instanceof MethodReference get) ||
            !"getValue".equals(get.getName()) || !get.getParameterTypes().isEmpty() || !"Ljava/lang/Object;".equals(get.getReturnType()) ||
            reads(code.get(at)).size() != 1 || code.get(at + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
        int box = register(code.get(at + 1));
        return code.get(at + 2).getOpcode() == Opcode.CHECK_CAST && register(code.get(at + 2)) == box &&
            "Ljava/lang/Boolean;".equals(((ReferenceInstruction) code.get(at + 2)).getReference().toString()) &&
            code.get(at + 3).getOpcode() == Opcode.INVOKE_VIRTUAL && "Ljava/lang/Boolean;->booleanValue()Z".equals(ref(code.get(at + 3))) &&
            reads(code.get(at + 3)).equals(List.of(box)) && code.get(at + 4).getOpcode() == Opcode.MOVE_RESULT &&
            code.get(at + 5).getOpcode() == Opcode.IF_EQZ && register(code.get(at + 5)) == register(code.get(at + 4));
    }

    /** floating_tab_bar or tab_bar_overlay: the one tab bar builder with that gate. Mirrors TabBar.kt. */
    static List<Method> tabBarBuilders(List<ClassDef> classes, boolean floating) {
        Method found = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!tabBarBuilder(method) || (floating ? floatingTabBarGate(method) : tabBarOverlayGate(method)) < 0) continue;
            if (found != null) return List.of();
            found = method;
        }
        return found == null ? List.of() : List.of(found);
    }

    /**
     * One of the Chats page's two answers, its scroll-away answer or its slide answer: an instance method with no
     * parameters ending in its flag, a boolean check of it and a return of that answer. The check is a static (Object,
     * long) one (586) or the config interface's (long) one right after a cast to it (587). Early no's may jump onto the
     * return (earlyNosOnly): they keep landing on it past the hook. The return's index, or -1. Mirrors TabBar.kt.
     */
    static int tabBarScrollAwayReturn(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !method.getParameterTypes().isEmpty() || !"Z".equals(method.getReturnType())) return -1;
        var code = instructions(method);
        int end = code.size() - 1;
        if (end < 3 || code.get(end).getOpcode() != Opcode.RETURN) return -1;
        boolean cast = code.get(end - 3).getOpcode() == Opcode.CHECK_CAST;
        if (cast && end < 4) return -1;
        var load = code.get(cast ? end - 4 : end - 3);
        Long read = wide(load);
        if (load.getOpcode() != Opcode.CONST_WIDE || read == null || read != CHATS_SCROLL_AWAY_FLAG && read != CHATS_SLIDE_FLAG) return -1;
        int flag = register(load);
        var call = code.get(end - 2);
        if (!(call instanceof ReferenceInstruction r) || !(r.getReference() instanceof MethodReference check)) return -1;
        var types = new ArrayList<String>();
        for (var t : check.getParameterTypes()) types.add(t.toString());
        var args = reads(call);
        String config = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;";
        boolean form = cast
            ? call.getOpcode() == Opcode.INVOKE_INTERFACE && config.equals(check.getDefiningClass()) &&
                config.equals(((ReferenceInstruction) code.get(end - 3)).getReference().toString()) && !args.isEmpty() &&
                args.get(0) == register(code.get(end - 3)) && args.get(0) != flag + 1 && types.equals(List.of("J"))
            : call.getOpcode() == Opcode.INVOKE_STATIC && types.equals(List.of("Ljava/lang/Object;", "J"));
        if (!form || !"Z".equals(check.getReturnType()) || args.size() != 3 || args.get(1) != flag || args.get(2) != flag + 1) return -1;
        int answer = register(code.get(end - 1));
        if (code.get(end - 1).getOpcode() != Opcode.MOVE_RESULT || register(code.get(end)) != answer || answer > 15) return -1;
        return earlyNosOnly(method, code, end, answer) ? end : -1;
    }

    /**
     * Whether every jump onto the return carries a no: none from a switch or a catch, nothing landing anywhere up to the
     * last jump, and the answer's last write before each jump a const/4 of 0. Mirrors TabBar.kt's earlyNosOnly.
     */
    static boolean earlyNosOnly(Method method, List<Instruction> code, int end, int answer) {
        if (mediaTargets(method, false).contains(end)) return false;
        var early = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) if (mediaTarget(code, i) == end) early.add(i);
        if (early.isEmpty()) return true;
        int last = Collections.max(early);
        for (int t : mediaTargets(method)) if (t >= 0 && t <= last) return false;
        for (int at : early) {
            int write = -1;
            for (int i = at - 1; i >= 0 && write < 0; i--) if (writes(code.get(i), answer)) write = i;
            if (write < 0 || code.get(write).getOpcode() != Opcode.CONST_4 ||
                ((NarrowLiteralInstruction) code.get(write)).getNarrowLiteral() != 0) return false;
        }
        return true;
    }

    /** The flag a Chats page answer reads, or null when the method isn't one. */
    static Long chatsPageFlag(Method method) {
        int end = tabBarScrollAwayReturn(method);
        if (end < 0) return null;
        var code = instructions(method);
        return wide(code.get(code.get(end - 3).getOpcode() == Opcode.CHECK_CAST ? end - 4 : end - 3));
    }

    /**
     * Where the bar's frame decides whether a scroll may move the bar: an interface ()Z call that asks the page for its
     * slide answer (pageInterfaces and slideName say which count, null for any), then within four instructions, past
     * only a move-result, a const/4 and if-ne or if-eqz, a Function0 read from a field, unboxed by a static (Function0)
     * boolean helper, and an if-eqz forward on its answer. One per method, nothing landing on it. The if-eqz's index, or
     * -1. Mirrors TabBar.kt.
     */
    static int tabBarSlideCheck(Method method, Set<String> pageInterfaces, String slideName) {
        if (!"Z".equals(method.getReturnType())) return -1;
        var code = instructions(method);
        int gate = -1;
        for (int at = 0; at < code.size(); at++) {
            if (code.get(at).getOpcode() != Opcode.INVOKE_INTERFACE ||
                !(((ReferenceInstruction) code.get(at)).getReference() instanceof MethodReference call)) continue;
            if (!"Z".equals(call.getReturnType()) || !call.getParameterTypes().isEmpty()) continue;
            if (slideName != null && (!slideName.equals(call.getName()) || !pageInterfaces.contains(call.getDefiningClass()))) continue;
            int check = -1;
            for (int i = at + 1; i <= at + 4; i++) if (slideFunctionCheck(code, i)) { check = i; break; }
            if (check < 0) continue;
            boolean plain = true;
            for (int i = at + 1; i < check; i++) {
                var op = code.get(i).getOpcode();
                if (op != Opcode.MOVE_RESULT && op != Opcode.CONST_4 && op != Opcode.IF_NE && op != Opcode.IF_EQZ) plain = false;
            }
            if (!plain) continue;
            if (gate >= 0) return -1;
            gate = check + 3;
        }
        if (gate < 0) return -1;
        int answer = register(code.get(gate));
        if (answer > 15) return -1;
        return mediaTargets(method).contains(gate) ? -1 : gate;
    }

    /** A Function0 read from a field, unboxed to a yes or no by a static helper, and an if-eqz forward on the answer. */
    static boolean slideFunctionCheck(List<Instruction> code, int at) {
        if (at + 3 >= code.size()) return false;
        if (code.get(at).getOpcode() != Opcode.IGET_OBJECT ||
            !(((ReferenceInstruction) code.get(at)).getReference() instanceof FieldReference field) || !FUNCTION0.equals(field.getType())) return false;
        var unbox = code.get(at + 1);
        if (unbox.getOpcode() != Opcode.INVOKE_STATIC || !(((ReferenceInstruction) unbox).getReference() instanceof MethodReference helper)) return false;
        var types = new ArrayList<String>();
        for (var t : helper.getParameterTypes()) types.add(t.toString());
        if (!"Z".equals(helper.getReturnType()) || !types.equals(List.of(FUNCTION0)) || !reads(unbox).equals(List.of(register(code.get(at))))) return false;
        int answer = register(code.get(at + 2));
        return code.get(at + 2).getOpcode() == Opcode.MOVE_RESULT && code.get(at + 3).getOpcode() == Opcode.IF_EQZ &&
            register(code.get(at + 3)) == answer && mediaTarget(code, at + 3) > at + 3;
    }

    /**
     * tab_bar_scroll_away: the Chats page's two answers, each the one method reading its flag and both on the same page,
     * then every check in the bar's frame asking a page for its slide answer through an interface that page implements.
     * Empty when a part is missing or found twice. Mirrors TabBar.kt.
     */
    static List<Method> tabBarScrollAway(List<ClassDef> classes) {
        Method scroll = null, slide = null;
        ClassDef scrollPage = null, slidePage = null;
        int scrolls = 0, slides = 0;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!"Z".equals(method.getReturnType()) || !method.getParameterTypes().isEmpty()) continue;
            Long flag = chatsPageFlag(method);
            if (flag == null) continue;
            if (flag == CHATS_SCROLL_AWAY_FLAG) { scroll = method; scrollPage = cls; scrolls++; }
            else { slide = method; slidePage = cls; slides++; }
        }
        if (scrolls != 1 || slides != 1 || !scrollPage.getType().equals(slidePage.getType())) return List.of();
        var page = new HashSet<String>();
        for (var type : slidePage.getInterfaces()) page.add(type.toString());
        var found = new ArrayList<Method>(List.of(scroll, slide));
        for (var cls : classes) for (var method : cls.getMethods())
            if ("Z".equals(method.getReturnType()) && tabBarSlideCheck(method, page, slide.getName()) >= 0) found.add(method);
        return found.size() == 2 ? List.of() : found;
    }

    /** The register holding parameter n, counting this as 0 on an instance method. */
    static int parameterSlot(Method method, int n) {
        int words = AccessFlags.STATIC.isSet(method.getAccessFlags()) ? 0 : 1;
        for (var type : method.getParameterTypes()) words += "J".contentEquals(type) || "D".contentEquals(type) ? 2 : 1;
        return method.getImplementation().getRegisterCount() - words + n;
    }

    /** RoundingOptions' isCircular: the own boolean its toString() last read into the register it appends right after the class name. */
    static String vitoCircle(ClassDef cls) {
        Method printer = null;
        for (var method : cls.getMethods()) {
            if (!"toString".equals(method.getName()) || !method.getParameterTypes().isEmpty() || !"Ljava/lang/String;".equals(method.getReturnType())) continue;
            if (printer != null) return null;
            printer = method;
        }
        if (printer == null || AccessFlags.STATIC.isSet(printer.getAccessFlags())) return null;
        var code = instructions(printer);
        int named = -1;
        for (int i = 0; i < code.size() && named < 0; i++) {
            String value = text(code.get(i));
            if (value != null && value.startsWith("RoundingOptions(isCircular=")) named = i;
        }
        if (named < 0) return null;
        int append = -1;
        for (int i = named + 1; i < code.size() && append < 0; i++) {
            if (code.get(i) instanceof ReferenceInstruction call && call.getReference() instanceof MethodReference target &&
                "Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;".equals(target.toString())) append = i;
        }
        if (append < 0) return null;
        var targets = mediaTargets(printer);
        for (int i = 0; i < append; i++) if (code.get(i) instanceof OffsetInstruction || targets.contains(i + 1)) return null;
        var appended = reads(code.get(append));
        if (appended.size() < 2) return null;
        int value = appended.get(1);
        for (int i = append - 1; i >= 0; i--) {
            if (!(code.get(i) instanceof OneRegisterInstruction one) || one.getRegisterA() != value) continue;
            if (code.get(i).getOpcode() != Opcode.IGET_BOOLEAN || ((TwoRegisterInstruction) code.get(i)).getRegisterB() != parameterSlot(printer, 0)) return null;
            var field = (FieldReference) ((ReferenceInstruction) code.get(i)).getReference();
            return field.getDefiningClass().equals(cls.getType()) && "Z".equals(field.getType()) ? field.toString() : null;
        }
        return null;
    }

    /** Mirrors AvatarShape.kt's vitoRounding: Object's constructor, one own-parameter store per field, return. */
    static boolean vitoRounding(Method method, String circleField) {
        if (!"<init>".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType())) return false;
        if (!circleField.startsWith(method.getDefiningClass() + "->")) return false;
        var code = instructions(method);
        if (code.size() < 3 || code.get(code.size() - 1).getOpcode() != Opcode.RETURN_VOID) return false;
        int self = parameterSlot(method, 0);
        if (code.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !"Ljava/lang/Object;-><init>()V".equals(ref(code.get(0))) ||
            !reads(code.get(0)).equals(List.of(self))) return false;
        var params = new HashMap<Integer, String>();
        var types = method.getParameterTypes();
        for (int i = 0; i < types.size(); i++) {
            String type = types.get(i).toString();
            if ("J".equals(type) || "D".equals(type)) return false;
            params.put(parameterSlot(method, i + 1), type);
        }
        var names = new HashSet<String>();
        var values = new HashSet<Integer>();
        int circle = -1, radius = -1, radii = -1, floats = 0, arrays = 0, circles = 0;
        for (var store : code.subList(1, code.size() - 1)) {
            var op = store.getOpcode();
            if (op != Opcode.IPUT && op != Opcode.IPUT_BOOLEAN && op != Opcode.IPUT_OBJECT) return false;
            var field = (FieldReference) ((ReferenceInstruction) store).getReference();
            var put = (TwoRegisterInstruction) store;
            if (put.getRegisterB() != self || !field.getDefiningClass().equals(method.getDefiningClass()) ||
                !field.getType().equals(params.get(put.getRegisterA()))) return false;
            if (!names.add(field.getName()) || !values.add(put.getRegisterA())) return false;
            if (field.toString().equals(circleField)) { circle = put.getRegisterA(); circles++; }
            if ("F".equals(field.getType())) { radius = put.getRegisterA(); floats++; }
            if ("[F".equals(field.getType())) { radii = put.getRegisterA(); arrays++; }
        }
        return circles == 1 && floats == 1 && arrays == 1 && Math.max(circle, Math.max(radius, radii)) <= 15;
    }

    /** Mirrors AvatarShape.kt's legacyRounding: the params' flag, then their radii, handed to the layer, then a spare read. */
    static boolean legacyRounding(Method method) {
        if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 2) return false;
        String layerType = method.getParameterTypes().get(0).toString(), paramsType = method.getParameterTypes().get(1).toString();
        if (!layerType.startsWith("L") || !paramsType.startsWith("L") || layerType.equals(paramsType)) return false;
        var code = instructions(method);
        if (code.size() < 6) return false;
        int layer = parameterSlot(method, 0), params = parameterSlot(method, 1);
        int flag = legacyRead(code.get(0), Opcode.IGET_BOOLEAN, "Z", layer, params, paramsType);
        if (flag < 0 || !legacyHands(code.get(1), layer, flag, layerType, "Z")) return false;
        int radii = legacyRead(code.get(2), Opcode.IGET_OBJECT, "[F", layer, params, paramsType);
        if (radii < 0 || !legacyHands(code.get(3), layer, radii, layerType, "[F")) return false;
        var next = code.get(4);
        if ((next.getOpcode() != Opcode.IGET && next.getOpcode() != Opcode.IGET_BOOLEAN) || ((TwoRegisterInstruction) next).getRegisterB() != params) return false;
        int spare = ((TwoRegisterInstruction) next).getRegisterA();
        if (spare == layer || spare == params || spare == radii || spare > 15) return false;
        var targets = mediaTargets(method);
        for (int i = 0; i <= 4; i++) if (targets.contains(i)) return false;
        return true;
    }

    static int legacyRead(Instruction get, Opcode opcode, String type, int layer, int params, String paramsType) {
        if (get.getOpcode() != opcode || !(get instanceof TwoRegisterInstruction two) || two.getRegisterB() != params) return -1;
        var field = (FieldReference) ((ReferenceInstruction) get).getReference();
        if (!field.getDefiningClass().equals(paramsType) || !field.getType().equals(type)) return -1;
        int value = two.getRegisterA();
        return value == layer || value == params || value > 15 ? -1 : value;
    }

    static boolean legacyHands(Instruction call, int layer, int value, String layerType, String parameter) {
        if (call.getOpcode() != Opcode.INVOKE_INTERFACE || !(((ReferenceInstruction) call).getReference() instanceof MethodReference target)) return false;
        return target.getDefiningClass().equals(layerType) && "V".equals(target.getReturnType()) && target.getParameterTypes().size() == 1 &&
            parameter.contentEquals(target.getParameterTypes().get(0)) && reads(call).equals(List.of(layer, value));
    }

    static final String TILE_SET_SHAPE = "Landroid/graphics/drawable/ShapeDrawable;->setShape(Landroid/graphics/drawable/shapes/Shape;)V";
    static final String TILE_PATH_SHAPE = "Landroid/graphics/drawable/shapes/PathShape;-><init>(Landroid/graphics/Path;FF)V";
    static final String TILE_DRAW_OVAL = "Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V";

    /** Mirrors AvatarShape.kt's tileShapeFlag: a (Z)V that makes an OvalShape and a RectShape, sets one, and branches first on the flag. */
    static boolean tileShapeFlag(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) || method.getParameterTypes().size() != 1 ||
            !"Z".contentEquals(method.getParameterTypes().get(0)) || method.getImplementation() == null) return false;
        var code = instructions(method);
        var created = new HashSet<String>();
        boolean sets = false;
        Instruction branch = null;
        for (var i : code) {
            if (i.getOpcode() == Opcode.NEW_INSTANCE && ((ReferenceInstruction) i).getReference() instanceof TypeReference type) created.add(type.getType());
            if (TILE_SET_SHAPE.equals(ref(i))) sets = true;
            if (branch == null && i instanceof OffsetInstruction) branch = i;
        }
        if (!created.contains("Landroid/graphics/drawable/shapes/OvalShape;") || !created.contains("Landroid/graphics/drawable/shapes/RectShape;") || !sets) return false;
        int flag = parameterSlot(method, 1);
        if (branch == null || (branch.getOpcode() != Opcode.IF_EQZ && branch.getOpcode() != Opcode.IF_NEZ) || register(branch) != flag) return false;
        return flag <= 15 && !mediaTargets(method).contains(0);
    }

    /** Mirrors AvatarShape.kt's tilePath: the setter's class, one Path parameter, made into a PathShape, and the setter called. */
    static boolean tilePath(Method method, String setter) {
        if (!setter.startsWith(method.getDefiningClass() + "->") || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !"V".equals(method.getReturnType()) || method.getImplementation() == null) return false;
        var types = method.getParameterTypes();
        int paths = 0, index = -1, words = 1;
        for (int i = 0; i < types.size(); i++) {
            String type = types.get(i).toString();
            if ("Landroid/graphics/Path;".equals(type)) { paths++; if (index < 0) index = words; }
            words += "J".equals(type) || "D".equals(type) ? 2 : 1;
        }
        if (paths != 1) return false;
        var code = instructions(method);
        boolean shaped = false, set = false;
        for (var i : code) { shaped |= TILE_PATH_SHAPE.equals(ref(i)); set |= setter.equals(ref(i)); }
        return shaped && set && parameterSlot(method, index) <= 15 && !mediaTargets(method).contains(0);
    }

    /** Mirrors AvatarShape.kt's tileOvals: the placeholder's draw(Canvas), every oval it draws an invoke-virtual drawOval. */
    static boolean tileOvals(Method method) {
        if (!"draw".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) ||
            method.getParameterTypes().size() != 1 || !"Landroid/graphics/Canvas;".contentEquals(method.getParameterTypes().get(0)) ||
            method.getImplementation() == null) return false;
        int ovals = 0;
        for (var i : instructions(method)) {
            if (!TILE_DRAW_OVAL.equals(ref(i))) continue;
            if (i.getOpcode() != Opcode.INVOKE_VIRTUAL) return false;
            ovals++;
        }
        return ovals > 0;
    }

    static final List<String> RING_COLORS = List.of("#0099FF", "#A033FF", "#FF5280", "#FF7061");
    static final String RING_DRAW_ARC = "Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V";

    /** Mirrors AvatarShape.kt's paintsRing: some method of the class reads every color of the story ring's gradient. */
    static boolean paintsRing(ClassDef cls) {
        for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            var strings = new HashSet<String>();
            for (var i : instructions(method)) if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s) strings.add(s.getString());
            if (strings.containsAll(RING_COLORS)) return true;
        }
        return false;
    }

    /** Mirrors AvatarShape.kt's ringType: onCreateMountContent(Context) that makes one drawable with no arguments and returns it. */
    static String ringType(Method method) {
        if (!"onCreateMountContent".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) ||
            !"Ljava/lang/Object;".equals(method.getReturnType()) || method.getParameterTypes().size() != 1 ||
            !"Landroid/content/Context;".contentEquals(method.getParameterTypes().get(0)) || method.getImplementation() == null) return null;
        var code = instructions(method);
        if (code.size() != 3 || code.get(0).getOpcode() != Opcode.NEW_INSTANCE || code.get(2).getOpcode() != Opcode.RETURN_OBJECT) return null;
        if (!(((ReferenceInstruction) code.get(0)).getReference() instanceof TypeReference made)) return null;
        int ring = register(code.get(0));
        if (code.get(1).getOpcode() != Opcode.INVOKE_DIRECT || !(made.getType() + "-><init>()V").equals(ref(code.get(1))) ||
            !reads(code.get(1)).equals(List.of(ring)) || register(code.get(2)) != ring || ring > 15) return null;
        return made.getType();
    }

    /** Mirrors AvatarShape.kt's ringArc: draw(Canvas) with one drawArc range whose next register is this, never written. */
    static boolean ringArc(Method method) {
        if (!"draw".equals(method.getName()) || AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"V".equals(method.getReturnType()) ||
            method.getParameterTypes().size() != 1 || !"Landroid/graphics/Canvas;".contentEquals(method.getParameterTypes().get(0)) ||
            method.getImplementation() == null) return false;
        int self = parameterSlot(method, 0);
        RegisterRangeInstruction arc = null;
        int arcs = 0;
        for (var i : instructions(method)) {
            if (RING_DRAW_ARC.equals(ref(i))) { arcs++; arc = i instanceof RegisterRangeInstruction range ? range : null; }
            int written = register(i);
            if (written >= 0 && i.getOpcode().setsRegister() && (written == self || (i.getOpcode().setsWideRegister() && written + 1 == self))) return false;
        }
        return arcs == 1 && arc != null && arc.getOpcode() == Opcode.INVOKE_VIRTUAL_RANGE && arc.getRegisterCount() == 6 && arc.getStartRegister() + 6 == self;
    }

    /**
     * story_ring, shared by Square profile pictures and Hide stories and notes. Mirrors AvatarShape.kt's findStoryRing:
     * the one ring mount spec, and the draw of the direct Drawable it makes.
     */
    static List<Method> storyRing(List<ClassDef> classes) {
        Method mount = null;
        for (var cls : classes) {
            boolean mounts = false;
            for (var method : cls.getMethods()) mounts |= ringType(method) != null;
            if (!mounts || !paintsRing(cls)) continue;
            for (var method : cls.getMethods()) {
                if (ringType(method) == null) continue;
                if (mount != null) return List.of();
                mount = method;
            }
        }
        if (mount == null) return List.of();
        String type = ringType(mount);
        ClassDef ring = null;
        for (var cls : classes) if (cls.getType().equals(type)) ring = cls;
        if (ring == null || !"Landroid/graphics/drawable/Drawable;".equals(ring.getSuperclass())) return List.of();
        Method draw = null;
        for (var method : ring.getMethods()) {
            if (!ringArc(method)) continue;
            if (draw != null) return List.of();
            draw = method;
        }
        return draw == null ? List.of() : List.of(mount, draw);
    }

    /**
     * avatar_shape: Vito's one RoundingOptions constructor in its proven shape, the one legacy rounding helper, then the
     * user tile's one shape setter, the one setup in its class that hands it a clip path, the draw of the placeholder
     * type that setup takes. Mirrors AvatarShape.kt.
     */
    static List<Method> avatarShape(List<ClassDef> classes) {
        ClassDef vito = null;
        String circle = null;
        for (var cls : classes) {
            String field = vitoCircle(cls);
            if (field == null) continue;
            if (vito != null) return List.of();
            vito = cls;
            circle = field;
        }
        if (vito == null) return List.of();
        Method constructor = null;
        for (var method : vito.getMethods()) {
            if (!vitoRounding(method, circle)) continue;
            if (constructor != null) return List.of();
            constructor = method;
        }
        if (constructor == null) return List.of();
        Method legacy = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!legacyRounding(method)) continue;
            if (legacy != null) return List.of();
            legacy = method;
        }
        if (legacy == null) return List.of();
        Method setter = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (!tileShapeFlag(method)) continue;
            if (setter != null) return List.of();
            setter = method;
        }
        if (setter == null) return List.of();
        String setterId = hookId(setter);
        var byType = new HashMap<String, ClassDef>();
        for (var cls : classes) byType.put(cls.getType(), cls);
        var tile = byType.get(setter.getDefiningClass());
        if (tile == null) return List.of();
        Method setup = null;
        for (var method : tile.getMethods()) {
            if (!tilePath(method, setterId)) continue;
            if (setup != null) return List.of();
            setup = method;
        }
        if (setup == null) return List.of();
        Method placeholder = null;
        for (var type : new LinkedHashSet<String>(setup.getParameterTypes().stream().map(Object::toString).toList())) {
            var cls = byType.get(type);
            if (cls == null) continue;
            for (var method : cls.getMethods()) {
                if (!tileOvals(method)) continue;
                if (placeholder != null) return List.of();
                placeholder = method;
            }
        }
        if (placeholder == null) return List.of();
        return List.of(constructor, legacy, setter, setup, placeholder);
    }
}
