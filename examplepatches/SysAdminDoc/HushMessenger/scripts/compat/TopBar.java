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
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** The chat top bar: the Mark as read and message log buttons, app themes and factory sites. */
final class TopBar {

    static final String QR_BUTTON = "Lcom/facebook/messaging/payments/plugins/core/qrscannerbutton/ThreadViewTitleBarQRScannerButtonImplementation;";
    static final String QR_BUTTON_NAME = "messaging.payments.core.qrscannerbutton.ThreadViewTitleBarQRScannerButtonImplementation";
    static final String QR_BUTTON_TAG = "thread_view_title_bar_qr_scanner_button";
    static final String THREAD_SCHEME = "Lcom/facebook/messaging/threadview/scheme/interfaces/ThreadViewColorScheme;";
    static final String MIG_SCHEME = "Lcom/facebook/mig/scheme/interfaces/MigColorScheme;";
    static final String COLLECTION_ITERATOR = "Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;";
    static final String COLLECTION_ADD = "Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z";
    static final String TOP_BAR_CUT = "Lcom/google/common/collect/ImmutableList;->subList(II)Lcom/google/common/collect/ImmutableList;";
    /** MarkReadButton.MOST_BUTTONS. */
    static final int TOP_BAR_BUTTONS = 3;

    static List<Integer> callArgs(Instruction i) {
        var out = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction f) {
            int[] r = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
            for (int k = 0; k < f.getRegisterCount(); k++) out.add(r[k]);
        } else if (i instanceof RegisterRangeInstruction r) {
            for (int k = 0; k < r.getRegisterCount(); k++) out.add(r.getStartRegister() + k);
        }
        return out;
    }

    /** Whether this may read the register, erring toward yes. Mirrors galleryReads. */
    static boolean mayRead(Instruction i, int register) {
        var op = i.getOpcode().toString();
        boolean onlyWrites = i.getOpcode().setsRegister() && i.getOpcode() != Opcode.CHECK_CAST && !op.endsWith("_2ADDR");
        var read = new ArrayList<Integer>();
        if (i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction) read.addAll(callArgs(i));
        else if (i instanceof ThreeRegisterInstruction t) {
            if (!onlyWrites) read.add(t.getRegisterA());
            read.add(t.getRegisterB());
            read.add(t.getRegisterC());
        } else if (i instanceof TwoRegisterInstruction t) {
            if (!onlyWrites) read.add(t.getRegisterA());
            read.add(t.getRegisterB());
        } else if (i instanceof OneRegisterInstruction o) {
            if (!onlyWrites) read.add(o.getRegisterA());
        }
        boolean wide = op.contains("WIDE") || op.contains("LONG") || op.contains("DOUBLE");
        for (int r : read) if (r == register || (wide && r + 1 == register)) return true;
        return false;
    }

    /**
     * Which instructions can define the register as it is read at the target: their indices, -1 for none before the
     * method. Null when a branch lands between instructions. Mirrors ReadFlow.definitionsAt.
     */
    static Set<Integer> definitionsAt(Method method, int target, int register) {
        var code = instructions(method);
        int[] address = new int[code.size() + 1];
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) { indexAt.put(address[i], i); address[i + 1] = address[i] + code.get(i).getCodeUnits(); }
        var found = new HashSet<Integer>();
        var seen = new HashSet<Long>();
        var pending = new ArrayDeque<int[]>();
        pending.add(new int[] {0, -1});
        while (!pending.isEmpty()) {
            var state = pending.poll();
            if (!seen.add(((long) state[0] << 32) | (state[1] & 0xffffffffL))) continue;
            int i = state[0], origin = state[1];
            if (i == target) found.add(origin);
            var insn = code.get(i);
            int next = writesRegister(insn, register) ? i : origin;
            if (insn instanceof OffsetInstruction jump && insn.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                Integer landing = indexAt.get(address[i] + jump.getCodeOffset());
                if (landing == null) return null;
                if (code.get(landing) instanceof SwitchPayload payload) {
                    for (var element : payload.getSwitchElements()) {
                        Integer to = indexAt.get(address[i] + element.getOffset());
                        if (to == null) return null;
                        pending.add(new int[] {to, next});
                    }
                } else pending.add(new int[] {landing, next});
            }
            if (insn.getOpcode().canContinue() && i + 1 < code.size()) pending.add(new int[] {i + 1, next});
            if (insn.getOpcode().canThrow()) for (var block : method.getImplementation().getTryBlocks()) {
                if (address[i] < block.getStartCodeAddress() || address[i] >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                for (var handler : block.getExceptionHandlers()) {
                    Integer to = indexAt.get(handler.getHandlerCodeAddress());
                    if (to == null) return null;
                    pending.add(new int[] {to, origin});
                }
            }
        }
        return found;
    }

    static boolean writesRegister(Instruction i, int register) {
        return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction o &&
            (o.getRegisterA() == register || (i.getOpcode().setsWideRegister() && o.getRegisterA() + 1 == register));
    }

    static List<String> refParams(MethodReference m) {
        var out = new ArrayList<String>();
        for (var t : m.getParameterTypes()) out.add(t.toString());
        return out;
    }

    /** Every branch, switch case and catch handler as {source, landing}, a handler's source -1; null if one lands mid-instruction. */
    static List<int[]> edges(Method method) {
        var code = instructions(method);
        int[] at = new int[code.size() + 1];
        for (int i = 0; i < code.size(); i++) at[i + 1] = at[i] + code.get(i).getCodeUnits();
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) indexAt.put(at[i], i);
        var edges = new ArrayList<int[]>();
        for (int i = 0; i < code.size(); i++) {
            if (!(code.get(i) instanceof OffsetInstruction o) || code.get(i).getOpcode() == Opcode.FILL_ARRAY_DATA) continue;
            Integer landing = indexAt.get(at[i] + o.getCodeOffset());
            if (landing == null) return null;
            if (code.get(i).getOpcode() == Opcode.PACKED_SWITCH || code.get(i).getOpcode() == Opcode.SPARSE_SWITCH) {
                if (!(code.get(landing) instanceof SwitchPayload payload)) return null;
                for (var element : payload.getSwitchElements()) {
                    Integer target = indexAt.get(at[i] + element.getOffset());
                    if (target == null) return null;
                    edges.add(new int[] {i, target});
                }
            } else edges.add(new int[] {i, landing});
        }
        for (var block : method.getImplementation().getTryBlocks()) for (var handler : block.getExceptionHandlers()) {
            Integer target = indexAt.get(handler.getHandlerCodeAddress());
            if (target == null) return null;
            edges.add(new int[] {-1, target});
        }
        return edges;
    }

    /** The builder's one walk of the finished list, right after the socket's plugin count. Mirrors markReadSite in MarkReadButton.kt. */
    static int markReadSite(Method bar, int list, int socket, String socketType) {
        var code = instructions(bar);
        int site = -1;
        for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && COLLECTION_ITERATOR.equals(ref(code.get(i)))) {
            if (site >= 0) return -1;
            site = i;
        }
        if (site < 0 || !callArgs(code.get(site)).equals(List.of(list)) || list > 15 || socket > 15) return -1;
        int count = -1;
        for (int i = site - 1; i >= 0 && count < 0; i--) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_STATIC && code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                socketType.equals(m.getDefiningClass()) && refParams(m).equals(List.of(socketType)) && "I".equals(m.getReturnType())) count = i;
        }
        if (count < 0 || !callArgs(code.get(count)).equals(List.of(socket))) return -1;
        for (int i = count + 1; i < site; i++) if (writesRegister(code.get(i), list) || writesRegister(code.get(i), socket)) return -1;
        var edges = edges(bar);
        if (edges == null) return -1;
        for (var e : edges) if (e[1] > count && e[1] <= site && (e[0] < count || e[0] >= site || e[1] == site)) return -1;
        return site;
    }

    /**
     * The top bar keeps its first TOP_BAR_BUTTONS buttons: the one reaching definition of the subList end is that
     * constant, handed to the cut directly with no move before it.
     */
    static boolean topBarCapMatches(Method bar) {
        var code = instructions(bar);
        int cut = -1;
        for (int i = 0; i < code.size(); i++) if (TOP_BAR_CUT.equals(ref(code.get(i)))) {
            if (cut >= 0) return false;
            cut = i;
        }
        if (cut < 1) return false;
        var args = callArgs(code.get(cut));
        if (args.size() != 3) return false;
        Integer cap = narrowConstantAt(bar, code, cut, args.get(2), 0);
        return cap != null && cap == TOP_BAR_BUTTONS;
    }

    /**
     * The narrow constant a register holds at {@code target}, following plain moves to the register they copy. A bar
     * can hoist the listener case into a high register and move it down at the call. Returns null unless one
     * definition reaches each step.
     */
    static Integer narrowConstantAt(Method method, List<Instruction> code, int target, int register, int depth) {
        if (depth < 0) return null;
        var defs = definitionsAt(method, target, register);
        if (defs == null || defs.size() != 1) return null;
        int at = defs.iterator().next();
        if (at < 0) return null;
        var insn = code.get(at);
        if (insn instanceof NarrowLiteralInstruction lit && (insn.getOpcode() == Opcode.CONST_4 || insn.getOpcode() == Opcode.CONST_16 || insn.getOpcode() == Opcode.CONST))
            return lit.getNarrowLiteral();
        if (insn instanceof TwoRegisterInstruction move && insn.getOpcode().name().startsWith("MOVE") &&
            !insn.getOpcode().name().startsWith("MOVE_RESULT")) return narrowConstantAt(method, code, at, move.getRegisterB(), depth - 1);
        return null;
    }

    /**
     * mark_read_bar and mark_read_click: the chat top bar's builder (the one method naming the QR scanner plugin and
     * reading it from the socket) and its shared listener's onClick, taken only when every value the generated button
     * copies from the QR block resolves, the classes and helpers it names are public, the list walk seam and the
     * three-button limit hold, and the listener's onClick has two locals. The newer top bar's factory, the one other
     * caller of the details button's builder, joins mark_read_bar when its return seam holds. Returns bar, click,
     * factory. Mirrors MarkReadButton.kt.
     */
    static List<Method> markReadButton(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        Method bar = null;
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean names = false, reads = false;
            for (var i : instructions(method)) {
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && QR_BUTTON_NAME.equals(s.getString())) names = true;
                if (i.getOpcode() == Opcode.IGET_OBJECT && i instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && QR_BUTTON.equals(f.getType())) reads = true;
            }
            if (!names || !reads) continue;
            if (bar != null) return List.of();
            bar = method;
        }
        if (bar == null) return List.of();
        var c = instructions(bar);
        int name = -1;
        for (int i = 0; i < c.size(); i++) if (c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && QR_BUTTON_NAME.equals(s.getString())) {
            if (name >= 0) return List.of();
            name = i;
        }
        int plugin = -1;
        for (int i = name; i < c.size() && plugin < 0; i++)
            if (c.get(i).getOpcode() == Opcode.IGET_OBJECT && c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && QR_BUTTON.equals(f.getType())) plugin = i;
        if (plugin < 0) return List.of();
        var pluginRead = (TwoRegisterInstruction) c.get(plugin);
        String socketType = ((FieldReference) ((ReferenceInstruction) c.get(plugin)).getReference()).getDefiningClass();
        int add = -1;
        for (int i = plugin; i < c.size() && add < 0; i++) if (COLLECTION_ADD.equals(ref(c.get(i)))) add = i;
        if (add < 0) return List.of();
        int list = callArgs(c.get(add)).get(0);
        var qr = byType.get(QR_BUTTON);
        if (qr == null) return List.of();
        String builder = null, mig = null, builderScheme = null, tagField = null, listenerField = null, iconProvider = null, listener = null, spec = null;
        FieldReference iconRead = null;
        Integer listenerCase = null;
        int listenerRegister = -1;
        var strings = new HashMap<Integer, String>();
        // The button's builder is the one class the block constructs from a label String.
        var builders = new LinkedHashSet<String>();
        for (int i = plugin; i <= add; i++)
            if (c.get(i).getOpcode() == Opcode.INVOKE_DIRECT && c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                "<init>".equals(m.getName()) && refParams(m).equals(List.of("Ljava/lang/String;"))) builders.add(m.getDefiningClass());
        if (builders.size() != 1) return List.of();
        builder = builders.iterator().next();
        for (int i = plugin; i <= add; i++) {
            var insn = c.get(i);
            var r = insn instanceof ReferenceInstruction ri ? ri.getReference() : null;
            if (r instanceof StringReference s && insn instanceof OneRegisterInstruction o) strings.put(o.getRegisterA(), s.getString());
            else if (insn.getOpcode() == Opcode.IGET_OBJECT && r instanceof FieldReference f) {
                if (THREAD_SCHEME.equals(f.getDefiningClass()) && MIG_SCHEME.equals(f.getType())) mig = f.toString();
                if (QR_BUTTON.equals(f.getDefiningClass()) && !THREAD_SCHEME.equals(f.getType()) && !"Landroid/content/Context;".equals(f.getType())) iconRead = f;
            } else if (insn.getOpcode() == Opcode.INVOKE_STATIC && r instanceof MethodReference m && iconRead != null && iconProvider == null &&
                refParams(m).equals(List.of(iconRead.getType())) && m.getReturnType().startsWith("L")) {
                if (c.get(i - 1).getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) c.get(i - 1)).getRegisterA() == callArgs(insn).get(0)) iconProvider = m.toString();
            } else if (insn.getOpcode() == Opcode.IPUT_OBJECT && r instanceof FieldReference f && builder.equals(f.getDefiningClass())) {
                int value = ((TwoRegisterInstruction) insn).getRegisterA();
                if (MIG_SCHEME.equals(f.getType())) builderScheme = f.toString();
                else if ("Ljava/lang/String;".equals(f.getType()) && QR_BUTTON_TAG.equals(strings.get(value))) tagField = f.toString();
                else if (value == listenerRegister) listenerField = f.toString();
            } else if (insn.getOpcode() == Opcode.INVOKE_DIRECT && r instanceof MethodReference m && "<init>".equals(m.getName())) {
                var args = callArgs(insn);
                if (refParams(m).equals(List.of("Ljava/lang/Object;", "I")) && args.size() == 3 && args.get(1) == pluginRead.getRegisterA()) {
                    listener = m.getDefiningClass();
                    // The case is a constant set wherever the method keeps it: the one definition that reaches the call.
                    listenerCase = narrowConstantAt(bar, c, i, args.get(2), 4);
                    listenerRegister = args.get(0);
                } else if (refParams(m).equals(List.of(builder))) spec = m.getDefiningClass();
            }
        }
        if (builder == null || iconRead == null || iconProvider == null || mig == null || builderScheme == null ||
            tagField == null || listenerField == null || listener == null || listenerCase == null || spec == null) return List.of();
        // The plugin keeps more than one lazy of the icon's type, so the field is the one the block reads, by name.
        Field iconField = null;
        for (var f : qr.getFields())
            if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getType().equals(iconRead.getType()) && f.getName().equals(iconRead.getName())) iconField = f;
        if (iconField == null) return List.of();
        var sources = new LinkedHashSet<String>();
        for (var ctor : qr.getMethods()) if ("<init>".equals(ctor.getName())) {
            var ic = instructions(ctor);
            for (int k = 2; k < ic.size(); k++) {
                if (ic.get(k).getOpcode() == Opcode.IPUT_OBJECT && ic.get(k) instanceof ReferenceInstruction store && store.getReference() instanceof FieldReference f &&
                    f.getName().equals(iconField.getName()) && ic.get(k - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && ic.get(k - 2).getOpcode() == Opcode.INVOKE_STATIC &&
                    ic.get(k - 2) instanceof ReferenceInstruction src && src.getReference() instanceof MethodReference m && m.getParameterTypes().isEmpty() &&
                    m.getReturnType().equals(iconField.getType())) sources.add(m.toString());
            }
        }
        if (sources.size() != 1) return List.of();
        String iconSource = sources.iterator().next();
        // The builder keeps its icon in an int field, which a public static helper fills from the provider's result. A
        // build can carry copies of it on other public classes: every copy must resolve the same icon into the same
        // field, and the first by name is used. Mirrors resolveMarkReadRecipe.
        String providerType = iconProvider.substring(iconProvider.indexOf(')') + 1);
        var setters = new TreeMap<String, Method>();
        String setterSteps = null;
        for (var cls : classes) {
            if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) continue;
            for (var m : cls.getMethods()) {
                var ps = params(m);
                if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) ||
                    ps.size() != 3 || !ps.get(1).equals(providerType) || !ps.get(2).equals(builder) || m.getImplementation() == null) continue;
                var steps = iconSetterSteps(m, providerType, builder);
                if (steps == null) continue;
                if (setterSteps != null && !setterSteps.equals(steps)) return List.of();
                setterSteps = steps;
                setters.put(hookId(m), m);
            }
        }
        if (setters.isEmpty()) return List.of();
        var setterMethod = setters.firstEntry().getValue();
        String iconSetter = hookId(setterMethod);
        String iconType = params(setterMethod).get(0);
        var sc = instructions(setterMethod);
        var resolve = (MethodReference) ((ReferenceInstruction) sc.get(0)).getReference();
        var store = (FieldReference) ((ReferenceInstruction) sc.get(2)).getReference();
        // The QR block does the same two steps inline, so the helper is the button's own way of setting an icon.
        boolean resolves = false, stores = false;
        for (int i = plugin; i <= add; i++) {
            if (resolve.toString().equals(ref(c.get(i)))) resolves = true;
            if (c.get(i).getOpcode() == Opcode.IPUT && store.toString().equals(ref(c.get(i)))) stores = true;
        }
        if (!resolves || !stores) return List.of();
        var iconClass = byType.get(iconType);
        if (iconClass == null) return List.of();
        var icons = new LinkedHashSet<String>();
        for (var init : iconClass.getMethods()) if ("<clinit>".equals(init.getName())) {
            var ic = instructions(init);
            for (int k = 0; k < ic.size(); k++) {
                if (!(ic.get(k) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && "ENVELOPE_OPEN".equals(s.getString()))) continue;
                for (int j = k + 1; j < Math.min(ic.size(), k + 8); j++) {
                    if (ic.get(j).getOpcode() == Opcode.SPUT_OBJECT && ic.get(j) instanceof ReferenceInstruction put && put.getReference() instanceof FieldReference f &&
                        iconType.equals(f.getType()) && iconType.equals(f.getDefiningClass())) { icons.add(f.toString()); break; }
                }
            }
        }
        if (icons.size() != 1) return List.of();
        var socketClass = byType.get(socketType);
        if (socketClass == null) return List.of();
        for (var type : List.of("Lcom/facebook/auth/usersession/FbUserSession;", THREAD_KEY, THREAD_SCHEME)) {
            Field only = null;
            for (var f : socketClass.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && type.equals(f.getType())) {
                if (only != null) return List.of();
                only = f;
            }
            if (only == null || !AccessFlags.FINAL.isSet(only.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(only.getAccessFlags())) return List.of();
        }
        var listenerClass = byType.get(listener);
        if (listenerClass == null) return List.of();
        String target = null;
        int targets = 0;
        Method click = null;
        for (var m : listenerClass.getMethods()) {
            if ("<init>".equals(m.getName()) && params(m).equals(List.of("Ljava/lang/Object;", "I")) && m.getImplementation() != null) {
                int p1 = m.getImplementation().getRegisterCount() - 3 + 1;
                for (var i : instructions(m))
                    if (i.getOpcode() == Opcode.IPUT_OBJECT && ((TwoRegisterInstruction) i).getRegisterA() == p1 && i instanceof ReferenceInstruction ri &&
                        ri.getReference() instanceof FieldReference f && listener.equals(f.getDefiningClass()) && "Ljava/lang/Object;".equals(f.getType())) { target = f.toString(); targets++; }
            }
            if ("onClick".equals(m.getName()) && params(m).equals(List.of("Landroid/view/View;")) && "V".equals(m.getReturnType())) {
                if (click != null) return List.of();
                click = m;
            }
        }
        if (target == null || targets != 1 || click == null || click.getImplementation() == null || AccessFlags.STATIC.isSet(click.getAccessFlags())) return List.of();
        // The tap hook writes v0 and v1 before the stock body.
        if (click.getImplementation().getRegisterCount() - 2 < 2) return List.of();
        var builderClass = byType.get(builder);
        var specClass = byType.get(spec);
        if (builderClass == null || specClass == null) return List.of();
        boolean labelled = false;
        for (var m : builderClass.getMethods()) if ("<init>".equals(m.getName()) && params(m).equals(List.of("Ljava/lang/String;"))) labelled = true;
        if (!labelled) return List.of();
        for (var cls : List.of(socketClass, builderClass, specClass, listenerClass)) if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) return List.of();
        for (var helper : List.of(iconSource, iconProvider, iconSetter)) {
            var owner = byType.get(helper.substring(0, helper.indexOf("->")));
            if (owner == null || !AccessFlags.PUBLIC.isSet(owner.getAccessFlags())) return List.of();
            Method found = null;
            for (var m : owner.getMethods()) if (hookId(m).equals(helper)) found = m;
            if (found == null || !AccessFlags.PUBLIC.isSet(found.getAccessFlags()) || !AccessFlags.STATIC.isSet(found.getAccessFlags())) return List.of();
        }
        if (markReadSite(bar, list, pluginRead.getRegisterB(), socketType) < 0 || !topBarCapMatches(bar)) return List.of();
        // The details button's builder: the bar's one call that takes the chat colors last and returns a button.
        var detailsRefs = new LinkedHashSet<String>();
        for (var insn : c)
            if (insn.getOpcode() == Opcode.INVOKE_VIRTUAL && insn instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m &&
                spec.equals(m.getReturnType()) && !m.getParameterTypes().isEmpty() &&
                MIG_SCHEME.equals(m.getParameterTypes().get(m.getParameterTypes().size() - 1).toString())) detailsRefs.add(m.toString());
        if (detailsRefs.size() != 1) return List.of();
        String detailsRef = detailsRefs.iterator().next();
        var detailsOwner = byType.get(detailsRef.substring(0, detailsRef.indexOf("->")));
        Method details = null;
        if (detailsOwner != null) for (var m : detailsOwner.getMethods()) if (hookId(m).equals(detailsRef)) details = m;
        if (details == null || !tagsDetails(details, tagField)) return List.of();
        // The extension leaves a full bar's call buttons in place by these tags. 587's family B looks one up in a string table.
        var named = new HashSet<String>();
        for (var insn : c) if (insn instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) named.add(s.getString());
        if (!named.containsAll(CALL_TAGS)) named.addAll(tableStrings(c, stringTables(classes)));
        if (!named.containsAll(CALL_TAGS)) return List.of();
        // The newer bar is the one other method that makes the details button.
        Method factory = null;
        String barId = hookId(bar);
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (hookId(m).equals(barId)) continue;
            boolean calls = false;
            for (var i : instructions(m)) if (detailsRef.equals(ref(i))) { calls = true; break; }
            if (!calls) continue;
            if (factory != null) return List.of();
            factory = m;
        }
        if (factory == null || !markReadFactorySite(factory, detailsRef, byType)) return List.of();
        var immutable = byType.get(IMMUTABLE_LIST);
        boolean copies = false;
        if (immutable != null) for (var m : immutable.getMethods())
            if (LIST_COPY.equals(hookId(m)) && AccessFlags.STATIC.isSet(m.getAccessFlags()) && AccessFlags.PUBLIC.isSet(m.getAccessFlags())) copies = true;
        if (!copies) return List.of();
        return List.of(bar, click, factory);
    }

    static final String LIST_BUILD = "Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;";
    static final String LIST_COPY = "Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;";
    /** MarkReadButton.DETAILS_TAG. */
    static final String DETAILS_TAG = "settings_button";
    /** MarkReadButton.kt's MARK_READ_CALL_TAGS. */
    static final List<String> CALL_TAGS = List.of("audio_call_button", "video_call_button");
    static final Set<String> FACTORY_RETURNS = Set.of("Ljava/lang/Object;", "Ljava/lang/Iterable;", "Ljava/util/Collection;", "Ljava/util/List;", IMMUTABLE_LIST);

    /**
     * An icon setter's two steps, "resolve store": the provider resolves the icon (parameter 0) to an int and the builder
     * (parameter 2) stores it in its own int field, and nothing else. Null for any other body. Mirrors iconSetterSteps in MarkReadButton.kt.
     */
    static String iconSetterSteps(Method m, String providerType, String builder) {
        var sc = instructions(m);
        // Static, three one-word parameters: p0 the icon, p1 the provider, p2 the builder.
        int p0 = m.getImplementation().getRegisterCount() - 3;
        if (sc.size() != 4 || p0 < 0 || sc.get(0).getOpcode() != Opcode.INVOKE_VIRTUAL || sc.get(1).getOpcode() != Opcode.MOVE_RESULT ||
            sc.get(2).getOpcode() != Opcode.IPUT || sc.get(3).getOpcode() != Opcode.RETURN_VOID ||
            !(sc.get(0) instanceof ReferenceInstruction rr && rr.getReference() instanceof MethodReference resolve) ||
            !(sc.get(2) instanceof ReferenceInstruction sr && sr.getReference() instanceof FieldReference store) ||
            !resolve.getDefiningClass().equals(providerType) || !refParams(resolve).equals(List.of(params(m).get(0))) || !"I".equals(resolve.getReturnType()) ||
            !store.getDefiningClass().equals(builder) || !"I".equals(store.getType())) return null;
        var put = (TwoRegisterInstruction) sc.get(2);
        if (!callArgs(sc.get(0)).equals(List.of(p0 + 1, p0)) || register(sc.get(1)) != put.getRegisterA() || put.getRegisterB() != p0 + 2) return null;
        return resolve + " " + store;
    }

    /** The details builder stores DETAILS_TAG in the button builder's tag field. */
    static boolean tagsDetails(Method details, String tagField) {
        var dc = instructions(details);
        for (int k = 0; k < dc.size(); k++) {
            if (dc.get(k).getOpcode() != Opcode.IPUT_OBJECT || !tagField.equals(ref(dc.get(k)))) continue;
            int value = ((TwoRegisterInstruction) dc.get(k)).getRegisterA();
            for (int j = k - 1; j >= 0; j--) if (writesRegister(dc.get(j), value)) {
                if (DETAILS_TAG.equals(dc.get(j) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s ? s.getString() : null)) return true;
                break;
            }
        }
        return false;
    }

    /** MessageLogButton.kt's COMPOSE_BUTTON_NAME and COMPOSER_BUTTON_ID. */
    static final String COMPOSE_BUTTON_NAME = "messaging.inbox.tab.core.tabtoolbarbutton.composerbutton.composertoolbarbutton.ComposeButtonTabButtonImplementation";
    static final String COMPOSER_BUTTON_ID = "ComposerButton";
    /** MessageLogButton.kt's BAR_STRINGS: only the Chats tab bar's builder names all four. */
    static final List<String> LOG_BAR_STRINGS = List.of("messaging.navigation.home.tabs.tabtoolbarbutton.TabToolbarButtonInterfaceSpec",
        "getTabToolbarButtonModel", COMPOSE_BUTTON_NAME, COMPOSER_BUTTON_ID);

    /**
     * message_log_button and message_log_click: the Chats tab bar's button list builder (the one no-argument instance
     * List method naming the new message button's plugin and id) and the same class's tap handler. Taken only when the
     * new message button's block resolves to bar fields, an icon factory, a label and a builder it fills with only
     * those and its id, the button copies that id into a public field, Messenger's CLOCK icon is a public enum value,
     * the classes the generated button names are public, and the return seam holds. Returns bar, click. Mirrors
     * MessageLogButton.kt.
     */
    static List<Method> messageLogButton(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        Method bar = null;
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!"Ljava/util/List;".equals(m.getReturnType()) || !m.getParameterTypes().isEmpty() || AccessFlags.STATIC.isSet(m.getAccessFlags()) ||
                m.getImplementation() == null || !literals(m).containsAll(LOG_BAR_STRINGS)) continue;
            if (bar != null) return List.of();
            bar = m;
        }
        if (bar == null) return List.of();
        var barClass = byType.get(bar.getDefiningClass());
        if (barClass == null) return List.of();
        Method click = null;
        for (var m : barClass.getMethods()) {
            if (!params(m).equals(List.of("Landroid/view/View;", "Ljava/lang/String;", "Ljava/lang/String;", "I")) || !"V".equals(m.getReturnType()) ||
                AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null || !literals(m).contains(COMPOSER_BUTTON_ID)) continue;
            if (click != null) return List.of();
            click = m;
        }
        // The tap hook writes v0 ahead of the stock body; the receiver and the four parameters take five words.
        if (click == null || click.getImplementation().getRegisterCount() - 5 < 1) return List.of();
        var c = instructions(bar);
        int name = -1;
        for (int i = 0; i < c.size(); i++) if (c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && COMPOSE_BUTTON_NAME.equals(s.getString())) {
            if (name >= 0) return List.of();
            name = i;
        }
        if (name < 0) return List.of();
        int add = -1;
        for (int i = name; i < c.size() && add < 0; i++) if (COLLECTION_ADD.equals(ref(c.get(i)))) add = i;
        if (add < 0) return List.of();
        if (logBarField(barClass, c, name, add, "Landroid/content/Context;") == null || logBarField(barClass, c, name, add, FB_SESSION_TYPE) == null) return List.of();
        int factoryAt = -1, labelAt = -1, initAt = -1;
        MethodReference factory = null;
        for (int i = name; i <= add; i++) {
            if (c.get(i).getOpcode() != Opcode.INVOKE_STATIC || !(c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m)) continue;
            var ps = refParams(m);
            if (ps.size() != 3 || !"Landroid/content/Context;".equals(ps.get(0)) || !FB_SESSION_TYPE.equals(ps.get(1)) || !m.getReturnType().startsWith("L")) continue;
            if (factoryAt >= 0) return List.of();
            factoryAt = i;
            factory = m;
        }
        if (factory == null || c.get(factoryAt + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return List.of();
        String iconType = refParams(factory).get(2);
        for (int i = name; i <= add; i++) if (c.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && "Landroid/content/Context;->getString(I)Ljava/lang/String;".equals(ref(c.get(i)))) {
            if (labelAt >= 0) return List.of();
            labelAt = i;
        }
        if (labelAt < 0 || c.get(labelAt + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return List.of();
        // What goes in the list is a button made by its one-argument constructor from a builder made just for it.
        var addArgs = callArgs(c.get(add));
        if (addArgs.size() < 2) return List.of();
        MethodReference init = null;
        for (int i = name; i <= add; i++) {
            if (c.get(i).getOpcode() != Opcode.INVOKE_DIRECT || !(c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference m) ||
                !"<init>".equals(m.getName()) || refParams(m).size() != 1 || !callArgs(c.get(i)).get(0).equals(addArgs.get(1))) continue;
            if (initAt >= 0) return List.of();
            initAt = i;
            init = m;
        }
        if (init == null) return List.of();
        String builder = refParams(init).get(0);
        int held = callArgs(c.get(initAt)).get(1);
        var madeAt = definitionsAt(bar, initAt, held);
        if (madeAt == null || madeAt.size() != 1) return List.of();
        int made = madeAt.iterator().next();
        if (made < name || made >= add || c.get(made).getOpcode() != Opcode.NEW_INSTANCE || !builder.equals(ref(c.get(made))) ||
            c.get(made + 1).getOpcode() != Opcode.INVOKE_DIRECT || !(builder + "-><init>()V").equals(ref(c.get(made + 1))) ||
            !callArgs(c.get(made + 1)).equals(List.of(held))) return List.of();
        // Between the two, the block only fills builder fields, each with the icon, the label or the new message button's id.
        var filled = new HashMap<String, FieldReference>();
        for (int i = made + 2; i < initAt; i++) {
            var at = c.get(i);
            boolean touches = callArgs(at).contains(held) || (at instanceof OneRegisterInstruction one && (one.getRegisterA() == held ||
                (at.getOpcode().setsWideRegister() && one.getRegisterA() + 1 == held))) ||
                (at instanceof TwoRegisterInstruction two && two.getRegisterB() == held) || (at instanceof ThreeRegisterInstruction three && three.getRegisterC() == held);
            if (!touches) continue;
            if (at.getOpcode() != Opcode.IPUT_OBJECT || !(at instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f) ||
                !builder.equals(f.getDefiningClass()) || ((TwoRegisterInstruction) at).getRegisterB() != held) return List.of();
            var defs = definitionsAt(bar, i, ((TwoRegisterInstruction) at).getRegisterA());
            if (defs == null || defs.size() != 1) return List.of();
            int def = defs.iterator().next();
            String slot;
            if (def == factoryAt + 1 && f.getType().equals(factory.getReturnType())) slot = "icon";
            else if (def == labelAt + 1 && "Ljava/lang/String;".equals(f.getType())) slot = "label";
            else if (def >= 0 && "Ljava/lang/String;".equals(f.getType()) && c.get(def) instanceof ReferenceInstruction rs && rs.getReference() instanceof StringReference s &&
                COMPOSER_BUTTON_ID.equals(s.getString())) slot = "id";
            else return List.of();
            if (filled.put(slot, f) != null) return List.of();
        }
        if (filled.size() != 3 || filled.values().stream().map(Object::toString).distinct().count() != 3) return List.of();
        var buttonClass = byType.get(init.getDefiningClass());
        var builderClass = byType.get(builder);
        if (buttonClass == null || builderClass == null) return List.of();
        Method ctor = null, builderInit = null;
        for (var m : buttonClass.getMethods()) if (hookId(m).equals(init.toString())) ctor = m;
        for (var m : builderClass.getMethods()) if (hookId(m).equals(builder + "-><init>()V")) builderInit = m;
        if (ctor == null || ctor.getImplementation() == null || builderInit == null || !AccessFlags.PUBLIC.isSet(ctor.getAccessFlags()) ||
            !AccessFlags.PUBLIC.isSet(builderInit.getAccessFlags())) return List.of();
        for (var f : filled.values()) if (!logPublicField(builderClass, f)) return List.of();
        // The constructor copies the builder's id into one public String field, which the extension reads back to place the button.
        var cc = instructions(ctor);
        int receiver = ctor.getImplementation().getRegisterCount() - 2;
        int idRead = -1;
        for (int i = 0; i < cc.size(); i++) if (cc.get(i).getOpcode() == Opcode.IGET_OBJECT && filled.get("id").toString().equals(ref(cc.get(i)))) {
            if (idRead >= 0) return List.of();
            idRead = i;
        }
        if (idRead < 0 || idRead + 1 >= cc.size() || cc.get(idRead + 1).getOpcode() != Opcode.IPUT_OBJECT ||
            !(cc.get(idRead + 1) instanceof ReferenceInstruction rc && rc.getReference() instanceof FieldReference idField)) return List.of();
        var read = (TwoRegisterInstruction) cc.get(idRead);
        var copy = (TwoRegisterInstruction) cc.get(idRead + 1);
        if (read.getRegisterB() != receiver + 1 || copy.getRegisterA() != read.getRegisterA() || copy.getRegisterB() != receiver ||
            !init.getDefiningClass().equals(idField.getDefiningClass()) || !"Ljava/lang/String;".equals(idField.getType()) ||
            !logPublicField(buttonClass, idField)) return List.of();
        // Messenger's clock icon, by its enum name.
        var iconClass = byType.get(iconType);
        if (iconClass == null) return List.of();
        var clocks = new LinkedHashSet<String>();
        FieldReference clock = null;
        for (var m : iconClass.getMethods()) if ("<clinit>".equals(m.getName())) {
            var ic = instructions(m);
            for (int k = 0; k < ic.size(); k++) {
                if (!(ic.get(k) instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && "CLOCK".equals(s.getString()))) continue;
                for (int j = k + 1; j < Math.min(ic.size(), k + 8); j++) {
                    if (ic.get(j).getOpcode() == Opcode.SPUT_OBJECT && ic.get(j) instanceof ReferenceInstruction put && put.getReference() instanceof FieldReference f &&
                        iconType.equals(f.getType()) && iconType.equals(f.getDefiningClass())) { clocks.add(f.toString()); clock = f; break; }
                }
            }
        }
        if (clocks.size() != 1) return List.of();
        boolean clockPublic = false;
        for (var f : iconClass.getFields())
            if (f.getName().equals(clock.getName()) && iconType.equals(f.getType()) && AccessFlags.STATIC.isSet(f.getAccessFlags()) && AccessFlags.PUBLIC.isSet(f.getAccessFlags())) clockPublic = true;
        if (!clockPublic) return List.of();
        // Every class and member the generated button names is public, since it lives in the extension's package.
        var factoryClass = byType.get(factory.getDefiningClass());
        var session = byType.get(FB_SESSION_TYPE);
        if (factoryClass == null || session == null) return List.of();
        Method factoryMethod = null;
        for (var m : factoryClass.getMethods()) if (hookId(m).equals(factory.toString())) factoryMethod = m;
        if (factoryMethod == null || !AccessFlags.PUBLIC.isSet(factoryMethod.getAccessFlags()) || !AccessFlags.STATIC.isSet(factoryMethod.getAccessFlags())) return List.of();
        for (var cls : List.of(buttonClass, builderClass, factoryClass, iconClass, session)) if (!AccessFlags.PUBLIC.isSet(cls.getAccessFlags())) return List.of();
        int list = logBarSite(bar);
        if (list < 0 || list != callArgs(c.get(add)).get(0)) return List.of();
        return List.of(bar, click);
    }

    /** A public instance field of this class with the reference's name and type. */
    static boolean logPublicField(ClassDef owner, FieldReference f) {
        for (var field : owner.getFields())
            if (field.getName().equals(f.getName()) && field.getType().equals(f.getType()) && AccessFlags.PUBLIC.isSet(field.getAccessFlags()) &&
                !AccessFlags.STATIC.isSet(field.getAccessFlags())) return true;
        return false;
    }

    /** The one instance field of this type the block reads on the bar itself, or null. */
    static String logBarField(ClassDef barClass, List<Instruction> c, int from, int to, String type) {
        var found = new LinkedHashSet<String>();
        FieldReference field = null;
        for (int i = from; i <= to; i++)
            if (c.get(i).getOpcode() == Opcode.IGET_OBJECT && c.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f &&
                barClass.getType().equals(f.getDefiningClass()) && type.equals(f.getType())) { found.add(f.toString()); field = f; }
        if (found.size() != 1) return null;
        for (var f : barClass.getFields())
            if (f.getName().equals(field.getName()) && type.equals(f.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) return found.iterator().next();
        return null;
    }

    /**
     * The bar's return seam: its one return hands back an ArrayList the method made, nothing lands on the return, no try
     * covers it or ends on it, the receiver is never written and two low locals other than the list are free. The
     * list's register, or -1. Mirrors messageLogBarSite in MessageLogButton.kt.
     */
    static int logBarSite(Method bar) {
        var code = instructions(bar);
        int site = -1;
        for (int i = 0; i < code.size(); i++) if (code.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
            if (site >= 0) return -1;
            site = i;
        }
        if (site < 0) return -1;
        int list = register(code.get(site));
        if (list > 15) return -1;
        var edges = edges(bar);
        if (edges == null) return -1;
        for (var e : edges) if (e[1] == site) return -1;
        int at = 0;
        for (int i = 0; i < site; i++) at += code.get(i).getCodeUnits();
        for (var block : bar.getImplementation().getTryBlocks())
            if (block.getStartCodeAddress() < at && block.getStartCodeAddress() + block.getCodeUnitCount() >= at) return -1;
        int self = bar.getImplementation().getRegisterCount() - 1;
        for (var i : code) if (writesRegister(i, self)) return -1;
        var defs = definitionsAt(bar, site, list);
        if (defs == null || defs.size() != 1) return -1;
        int made = defs.iterator().next();
        if (made < 0 || code.get(made).getOpcode() != Opcode.NEW_INSTANCE || !"Ljava/util/ArrayList;".equals(ref(code.get(made)))) return -1;
        int scratch = 0;
        for (int r = 0; r < Math.min(16, self); r++) if (r != list) scratch++;
        return scratch >= 2 ? list : -1;
    }

    /** AppThemes.kt's THEME_PICKER_SURFACE and INSTANT_FEEDBACK. */
    static final String THEME_PICKER_SURFACE = "msgr_theme_picker";
    static final String INSTANT_FEEDBACK = "Lcom/facebook/fds/instantfeedback/FDSInstantFeedback;";

    /**
     * app_theme_pick: the Theme setting's tap case, the one invoke(Object) lambda naming the picker's logging surface and
     * making an FDSInstantFeedback toast. Taken only when its toast seam holds and the picker it writes the pick into has
     * one no-argument instance method, not private, that asks the theme check. Mirrors resolveAppThemePick in AppThemes.kt.
     */
    static List<Method> appThemePick(List<ClassDef> classes) {
        var byType = new HashMap<String, ClassDef>();
        for (var c : classes) byType.put(c.getType(), c);
        Method tap = null;
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!isAppThemeTap(m)) continue;
            if (tap != null) return List.of();
            tap = m;
        }
        if (tap == null) return List.of();
        String pickField = appThemePickSite(tap);
        if (pickField == null) return List.of();
        // Family B moved the list builder up into the picker's abstract base: take the nearest class on the chain that has one.
        var chain = new ArrayList<ClassDef>();
        for (var c = byType.get(pickField.substring(0, pickField.indexOf("->"))); c != null && chain.size() < 8;
             c = c.getSuperclass() == null ? null : byType.get(c.getSuperclass())) chain.add(c);
        for (int owner = 0; owner < chain.size(); owner++) {
            var redraws = appThemeRedraws(byType, chain.get(owner));
            if (redraws.isEmpty()) continue;
            if (redraws.size() != 1) return List.of();
            var redraw = redraws.get(0);
            for (var below : chain.subList(0, owner))
                for (var m : below.getMethods()) if (m.getName().equals(redraw.getName()) && m.getParameterTypes().isEmpty()) return List.of();
            boolean callable = owner == 0 || AccessFlags.PUBLIC.isSet(redraw.getAccessFlags()) ||
                packageOf(redraw.getDefiningClass()).equals(packageOf(tap.getDefiningClass()));
            return callable ? List.of(tap) : List.of();
        }
        return List.of();
    }

    /** The class's no-argument, non-private instance methods returning V that ask the theme check. */
    static List<Method> appThemeRedraws(Map<String, ClassDef> byType, ClassDef cls) {
        var redraws = new ArrayList<Method>();
        for (var m : cls.getMethods()) {
            if (!m.getParameterTypes().isEmpty() || !"V".equals(m.getReturnType()) || "<init>".equals(m.getName()) ||
                AccessFlags.STATIC.isSet(m.getAccessFlags()) || AccessFlags.PRIVATE.isSet(m.getAccessFlags())) continue;
            for (var i : instructions(m))
                if (i.getOpcode() == Opcode.INVOKE_STATIC && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call &&
                    "Z".equals(call.getReturnType()) && refParams(call).equals(List.of(FB_SESSION_TYPE)) && asksAppThemeGate(byType, call)) {
                    redraws.add(m);
                    break;
                }
        }
        return redraws;
    }

    static boolean isAppThemeTap(Method m) {
        if (!"invoke".equals(m.getName()) || !"Ljava/lang/Object;".equals(m.getReturnType()) || !params(m).equals(List.of("Ljava/lang/Object;")) ||
            !literals(m).contains(THEME_PICKER_SURFACE)) return false;
        for (var i : instructions(m)) if (i.getOpcode() == Opcode.NEW_INSTANCE && INSTANT_FEEDBACK.equals(ref(i))) return true;
        return false;
    }

    /** Whether the call lands on the one static benefit check for paid themes, as the app_themes discovery reads it. */
    static boolean asksAppThemeGate(Map<String, ClassDef> byType, MethodReference call) {
        var owner = byType.get(call.getDefiningClass());
        if (owner == null) return false;
        for (var m : owner.getMethods())
            if (hookId(m).equals(call.toString())) return AccessFlags.STATIC.isSet(m.getAccessFlags()) && "Z".equals(m.getReturnType()) &&
                params(m).equals(List.of(FB_SESSION_TYPE)) && literals(m).contains("CUSTOM_APP_THEME");
        return false;
    }

    /**
     * The tap case's toast seam: one show call on the toast's controller, followed by a jump nothing else lands on, that
     * no try covers or ends on, whose landing writes the toast's register first. The pick is the last String put before
     * the toast, into an object whose low register is kept until the toast and whose field the case read earlier. The
     * pick field, or null. Mirrors appThemePickSite in AppThemes.kt.
     */
    static String appThemePickSite(Method tap) {
        var code = instructions(tap);
        int show = -1;
        for (int i = 0; i + 1 < code.size(); i++) {
            if (code.get(i).getOpcode() != Opcode.IGET_OBJECT || !(code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference read) ||
                !INSTANT_FEEDBACK.equals(read.getDefiningClass())) continue;
            var call = code.get(i + 1);
            if (call.getOpcode() != Opcode.INVOKE_VIRTUAL || !(call instanceof ReferenceInstruction rc && rc.getReference() instanceof MethodReference shown) ||
                !read.getType().equals(shown.getDefiningClass()) || !"V".equals(shown.getReturnType()) || !shown.getParameterTypes().isEmpty() ||
                ((FiveRegisterInstruction) call).getRegisterC() != ((TwoRegisterInstruction) code.get(i)).getRegisterA()) continue;
            if (show >= 0) return null;
            show = i + 1;
        }
        if (show < 0 || show + 1 >= code.size()) return null;
        int scratch = ((FiveRegisterInstruction) code.get(show)).getRegisterC();
        var jump = code.get(show + 1);
        if (!EnumSet.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32).contains(jump.getOpcode()) || mediaTargets(tap).contains(show + 1)) return null;
        int at = 0;
        for (int i = 0; i <= show; i++) at += code.get(i).getCodeUnits();
        int landing = -1, offset = 0;
        for (int i = 0; i < code.size(); i++) { if (offset == at + ((OffsetInstruction) jump).getCodeOffset()) landing = i; offset += code.get(i).getCodeUnits(); }
        if (landing < 0 || code.get(landing).getOpcode() != Opcode.SGET_OBJECT || !writesRegister(code.get(landing), scratch)) return null;
        for (var block : tap.getImplementation().getTryBlocks())
            if (block.getStartCodeAddress() < at && block.getStartCodeAddress() + block.getCodeUnitCount() >= at) return null;
        int pick = -1;
        for (int i = show - 1; i >= 0 && pick < 0; i--)
            if (code.get(i).getOpcode() == Opcode.IPUT_OBJECT && code.get(i) instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f &&
                "Ljava/lang/String;".equals(f.getType())) pick = i;
        if (pick < 0) return null;
        int fragment = ((TwoRegisterInstruction) code.get(pick)).getRegisterB();
        String pickField = ref(code.get(pick));
        if (fragment > 15) return null;
        for (int i = pick + 1; i < show; i++) if (writesRegister(code.get(i), fragment)) return null;
        for (int i = 0; i < pick; i++) if (code.get(i).getOpcode() == Opcode.IGET_OBJECT && pickField.equals(ref(code.get(i)))) return pickField;
        return null;
    }

    /**
     * The newer bar's factory, static or (as in 586) an instance method whose receiver comes before the parameters. Its
     * one call to the details builder reaches exactly one return, of the list an ImmutableList builder just built,
     * directly or through a static helper that only builds it. Returns the details button never reaches, such as early
     * lists, are left alone. Nothing between the build and that return writes the list, branches or is landed on,
     * the account, chat and colors are each one parameter never reassigned, and three low locals are free. Mirrors
     * markReadFactorySite in MarkReadButton.kt.
     */
    static boolean markReadFactorySite(Method factory, String detailsRef, Map<String, ClassDef> byType) {
        if (!FACTORY_RETURNS.contains(factory.getReturnType()) || factory.getImplementation() == null) return false;
        var code = instructions(factory);
        int details = -1;
        for (int i = 0; i < code.size(); i++) if (detailsRef.equals(ref(code.get(i)))) {
            if (details >= 0) return false;
            details = i;
        }
        if (details < 0) return false;
        var reached = reachableFrom(factory, details);
        if (reached == null) return false;
        int site = -1;
        for (int i : reached) if (code.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
            if (site >= 0) return false;
            site = i;
        }
        if (site < 0) return false;
        int list = ((OneRegisterInstruction) code.get(site)).getRegisterA();
        int build = -1;
        for (int i = site - 1; i >= 0 && build < 0; i--) if (LIST_BUILD.equals(ref(code.get(i))) || listBuildHelper(code.get(i), byType)) build = i;
        if (build < 0 || code.get(build + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || ((OneRegisterInstruction) code.get(build + 1)).getRegisterA() != list) return false;
        for (int i = build + 2; i < site; i++) if (writesRegister(code.get(i), list) || code.get(i) instanceof OffsetInstruction) return false;
        var edges = edges(factory);
        if (edges == null) return false;
        for (var e : edges) if (e[1] > build && e[1] <= site) return false;
        var types = params(factory);
        int self = AccessFlags.STATIC.isSet(factory.getAccessFlags()) ? 0 : 1;
        int words = self;
        for (var t : types) words += "J".equals(t) || "D".equals(t) ? 2 : 1;
        int first = factory.getImplementation().getRegisterCount() - words;
        var registers = new ArrayList<Integer>();
        for (var type : List.of("Lcom/facebook/auth/usersession/FbUserSession;", THREAD_KEY, MIG_SCHEME)) {
            int at = -1, offset = self;
            for (var t : types) {
                if (t.equals(type)) {
                    if (at >= 0) return false;
                    at = first + offset;
                }
                offset += "J".equals(t) || "D".equals(t) ? 2 : 1;
            }
            if (at < 0) return false;
            registers.add(at);
        }
        for (var i : code) for (int r : registers) if (writesRegister(i, r)) return false;
        int scratch = 0;
        for (int r = 0; r < Math.min(16, first); r++) if (r != list) scratch++;
        return list <= 15 && scratch >= 3;
    }

    /**
     * A call to a static helper that takes an ImmutableList builder and does nothing but build it, null-check it and
     * return the list, which the factory builds its button list through. Mirrors isListBuildHelper in MarkReadButton.kt.
     */
    static boolean listBuildHelper(Instruction call, Map<String, ClassDef> byType) {
        if (call.getOpcode() != Opcode.INVOKE_STATIC || !(call instanceof ReferenceInstruction ri) || !(ri.getReference() instanceof MethodReference m) ||
            !refParams(m).equals(List.of("Lcom/google/common/collect/ImmutableList$Builder;")) || !IMMUTABLE_LIST.equals(m.getReturnType())) return false;
        var owner = byType.get(m.getDefiningClass());
        if (owner == null) return false;
        Method helper = null;
        for (var candidate : owner.getMethods()) if (hookId(candidate).equals(m.toString())) helper = candidate;
        if (helper == null || !AccessFlags.STATIC.isSet(helper.getAccessFlags()) || helper.getImplementation() == null) return false;
        var hc = new ArrayList<>(instructions(helper));
        int p0 = helper.getImplementation().getRegisterCount() - 1;
        // The helper may null-check the list before it returns it: a static (Object)V call on the list and nothing else.
        if (hc.size() == 4 && hc.get(2).getOpcode() == Opcode.INVOKE_STATIC && hc.get(2) instanceof ReferenceInstruction ci &&
            ci.getReference() instanceof MethodReference check && refParams(check).equals(List.of("Ljava/lang/Object;")) && "V".equals(check.getReturnType()) &&
            callArgs(hc.get(2)).equals(List.of(register(hc.get(1))))) hc.remove(2);
        return hc.size() == 3 && LIST_BUILD.equals(ref(hc.get(0))) && hc.get(0).getOpcode() == Opcode.INVOKE_VIRTUAL && callArgs(hc.get(0)).equals(List.of(p0)) &&
            hc.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && hc.get(2).getOpcode() == Opcode.RETURN_OBJECT && register(hc.get(1)) == register(hc.get(2));
    }

    /** Every instruction reachable from start, catch handlers included; null when a branch lands between instructions. Mirrors ReadFlow.successors. */
    static Set<Integer> reachableFrom(Method method, int start) {
        var code = instructions(method);
        int[] address = new int[code.size() + 1];
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) { indexAt.put(address[i], i); address[i + 1] = address[i] + code.get(i).getCodeUnits(); }
        var seen = new TreeSet<Integer>();
        var pending = new ArrayDeque<Integer>(List.of(start));
        while (!pending.isEmpty()) {
            int i = pending.poll();
            if (!seen.add(i)) continue;
            var insn = code.get(i);
            if (insn instanceof OffsetInstruction jump && insn.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                Integer landing = indexAt.get(address[i] + jump.getCodeOffset());
                if (landing == null) return null;
                if (code.get(landing) instanceof SwitchPayload payload) {
                    for (var element : payload.getSwitchElements()) {
                        Integer to = indexAt.get(address[i] + element.getOffset());
                        if (to == null) return null;
                        pending.add(to);
                    }
                } else pending.add(landing);
            }
            if (insn.getOpcode().canContinue() && i + 1 < code.size()) pending.add(i + 1);
            if (insn.getOpcode().canThrow()) for (var block : method.getImplementation().getTryBlocks()) {
                if (address[i] < block.getStartCodeAddress() || address[i] >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                for (var handler : block.getExceptionHandlers()) {
                    Integer to = indexAt.get(handler.getHandlerCodeAddress());
                    if (to == null) return null;
                    pending.add(to);
                }
            }
        }
        return seen;
    }

    /**
     * The scan-result reader's shape: an instance (Z)ArrayList with one getScanResults call that also returns a register
     * it loads with null, the answer it gives when Messenger may not read the list.
     */
    static boolean scanResultReader(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !"Ljava/util/ArrayList;".equals(method.getReturnType())) return false;
        var params = new ArrayList<String>();
        for (var t : method.getParameterTypes()) params.add(t.toString());
        if (!params.equals(List.of("Z"))) return false;
        var nulls = new HashSet<Integer>();
        var reads = 0;
        for (var i : instructions(method)) {
            if (i.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) i).getNarrowLiteral() == 0) nulls.add(((OneRegisterInstruction) i).getRegisterA());
            if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference call && readsScanResults(call)) reads++;
        }
        if (reads != 1) return false;
        for (var i : instructions(method))
            if (i.getOpcode() == Opcode.RETURN_OBJECT && nulls.contains(((OneRegisterInstruction) i).getRegisterA())) return true;
        return false;
    }
}
