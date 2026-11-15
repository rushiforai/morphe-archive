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
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** The inbox: Meta AI cells and grids, community chats, inbox refresh, emoji and the search icon. */
final class Inbox {

    /**
     * Mirrors NativeMediaControls.kt discoverAiCells: the cell is the one class of its name whose constructor stores its
     * last argument as its A00 label, whose render overrides the abstract render of the Litho base it extends, and whose
     * labels and render size and registers match one of AI_CELL_SHAPES. Four renders offer the AI label and one the Generate
     * menu label. Every build names the cell and its types differently, so they're read off the class that matches.
     */
    record AiCell(String type, String superclass, String scope, String component, int label, int sources, int size, int menu, int menuSources, int registers) {
        String render() { return type + "->render(" + scope + ")" + component; }
    }
    record AiCellShape(int label, int sources, int size, int menu, int menuSources, int registers) {}
    static final List<AiCellShape> AI_CELL_SHAPES = List.of(
        new AiCellShape(GENERATE_AI_LABEL, 4, 105, GENERATE_MENU_LABEL, 1, 24),
        new AiCellShape(GENERATE_AI_LABEL, 4, 105, GENERATE_MENU_LABEL_ARMV7, 1, 24),
        // 587's other arm64 builds (347415280, 281 and 285): arm64's Generate label, a render an instruction shorter and a register wider.
        new AiCellShape(GENERATE_AI_LABEL, 4, 104, GENERATE_MENU_LABEL, 1, 25));
    record FoundAiCell(AiCell cell, Method render) {}
    static List<FoundAiCell> discoverAiCells(List<ClassDef> classes) {
        var byType = new HashMap<String, List<ClassDef>>();
        var renders = new ArrayList<Method>();
        for (var cls : classes) {
            byType.computeIfAbsent(cls.getType(), k -> new ArrayList<>()).add(cls);
            for (var m : cls.getMethods()) if (m.getName().equals("render")) renders.add(m);
        }
        var result = new ArrayList<FoundAiCell>();
        for (var cls : classes) {
            int fields = 0; for (var f : cls.getFields()) if (f.getName().equals("A00") && f.getType().equals("I") && !AccessFlags.STATIC.isSet(f.getAccessFlags())) fields++;
            if (fields != 1) continue;
            String type = cls.getType();
            var ctors = new ArrayList<Method>();
            for (var m : cls.getMethods()) { var p = bubbleParameters(m);
                if (m.getName().equals("<init>") && p.size() == 11 && p.getFirst().equals(BUBBLE_SESSION) && p.getLast().equals("I") &&
                        p.subList(7, 9).equals(List.of("Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function0;"))) ctors.add(m); }
            if (ctors.size() != 1) continue;
            var ctor = ctors.getFirst(); var b = instructions(ctor);
            if (AccessFlags.STATIC.isSet(ctor.getAccessFlags()) || ctor.getImplementation() == null || ctor.getImplementation().getRegisterCount() != 12 || b.size() != 15 ||
                    b.get(5).getOpcode() != Opcode.IPUT || !(b.get(5) instanceof TwoRegisterInstruction store) || store.getRegisterA() != 11 || store.getRegisterB() != 0 ||
                    !Objects.equals(ref(b.get(5)), type + "->A00:I") || b.stream().filter(i -> Objects.equals(ref(i), type + "->A00:I")).count() != 1 ||
                    b.subList(0, 5).stream().anyMatch(i -> mediaWrites(i, 0) || mediaWrites(i, 11)) ||
                    b.stream().anyMatch(i -> i instanceof OffsetInstruction) || !ctor.getImplementation().getTryBlocks().isEmpty()) continue;
            if (byType.get(type).size() != 1) continue;
            var own = new ArrayList<Method>();
            for (var m : cls.getMethods()) if (m.getName().equals("render")) own.add(m);
            if (own.size() != 1) continue;
            var render = own.getFirst();
            var params = bubbleParameters(render);
            if (params.size() != 1) continue;
            String scope = params.getFirst(), component = render.getReturnType();
            var bases = cls.getSuperclass() == null ? null : byType.get(cls.getSuperclass());
            if (bases == null || bases.size() != 1) continue;
            var base = bases.getFirst();
            boolean declared = false;
            for (var m : base.getMethods()) if (m.getName().equals("render") && AccessFlags.ABSTRACT.isSet(m.getAccessFlags()) &&
                    m.getReturnType().equals(component) && bubbleParameters(m).equals(List.of(scope))) declared = true;
            if (!AccessFlags.ABSTRACT.isSet(base.getAccessFlags()) || !Objects.equals(base.getSuperclass(), component) || !declared) continue;
            if (AccessFlags.STATIC.isSet(render.getAccessFlags()) || render.getImplementation() == null ||
                    render.getImplementation().getTryBlocks().size() != 4) continue;
            // Each label constant that reaches the constructor's label argument, and those that get there in a straight run.
            var labels = new ArrayList<Integer>();
            var straight = new ArrayList<Integer>();
            for (var source : renders) {
                var c = instructions(source);
                for (int at = 0; at < c.size(); at++) {
                    if (!Set.of(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE).contains(c.get(at).getOpcode()) || !Objects.equals(ref(c.get(at)), hookId(ctor))) continue;
                    var args = bubbleArgs(c.get(at)); if (args.isEmpty()) continue; int arg = args.getLast(), literal = -1;
                    for (int j = at - 1; j >= Math.max(0, at - 24); j--) if (mediaWrites(c.get(j), arg)) { literal = j; break; }
                    if (literal < 0 || !(c.get(literal) instanceof NarrowLiteralInstruction n)) continue;
                    boolean branchFree = true; for (int j = literal + 1; j < at; j++) if (c.get(j) instanceof OffsetInstruction) branchFree = false;
                    if (!branchFree) continue;
                    labels.add(n.getNarrowLiteral());
                    boolean joined = false; for (int t : mediaTargets(source)) if (t > literal && t <= at) joined = true;
                    if (!joined) straight.add(n.getNarrowLiteral());
                }
            }
            int size = instructions(render).size(), registers = render.getImplementation().getRegisterCount();
            // The music sticker branch jumps into the menu cell's constructor call, so the menu label counts either way.
            var shape = AI_CELL_SHAPES.stream().filter(s -> s.size() == size && s.registers() == registers &&
                    straight.stream().filter(v -> v == s.label()).count() == s.sources() &&
                    labels.stream().filter(v -> v == s.menu()).count() == s.menuSources()).findFirst().orElse(null);
            if (shape == null) continue;
            result.add(new FoundAiCell(new AiCell(type, base.getType(), scope, component, shape.label(), shape.sources(), shape.size(), shape.menu(), shape.menuSources(), shape.registers()), render));
        }
        return result;
    }
    static List<Method> findAiStickerCells(List<ClassDef> classes) {
        return discoverAiCells(classes).stream().map(FoundAiCell::render).toList();
    }

    static final Set<Opcode> MEDIA_GOTOS = Set.of(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32);
    static final Set<Opcode> MEDIA_EXITS = Set.of(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW);
    static final String ITERATOR_HAS_NEXT = "Ljava/util/Iterator;->hasNext()Z", ITERATOR_NEXT = "Ljava/util/Iterator;->next()Ljava/lang/Object;";
    static boolean mediaIs(List<Instruction> c, int at, Opcode... ops) {
        return at >= 0 && at < c.size() && Arrays.asList(ops).contains(c.get(at).getOpcode());
    }

    /** Mirrors NativeMediaControls.kt feedsAiCell: the label at {@code at} reaches the cell's constructor, following plain gotos only. */
    static boolean feedsAiCell(List<Instruction> c, int at, AiCell cell) {
        int register = register(c.get(at));
        if (register < 0) return false;
        int i = at + 1;
        for (int step = 0; step < 48; step++) {
            if (i < 0 || i >= c.size()) return false;
            var instruction = c.get(i);
            if (MEDIA_GOTOS.contains(instruction.getOpcode())) { i = mediaTarget(c, i); continue; }
            if (Set.of(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE).contains(instruction.getOpcode()) && instruction instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference m && m.getDefiningClass().equals(cell.type()) && m.getName().equals("<init>")) {
                var args = bubbleArgs(instruction);
                return m.getParameterTypes().size() == 11 && m.getParameterTypes().getLast().toString().equals("I") && !args.isEmpty() && args.getLast() == register;
            }
            if (instruction instanceof OffsetInstruction || mediaWrites(instruction, register) || MEDIA_EXITS.contains(instruction.getOpcode())) return false;
            i++;
        }
        return false;
    }

    /**
     * Mirrors NativeMediaControls.kt aiStickerGrid: the Suggested grid loop whose instance-of chain sends the Generate menu
     * item (and, where a build still lists it, the Generate AI item) to the cell. Sites are where those branch bodies start,
     * skip is the loop head every item returns to.
     */
    record AiGrid(List<Integer> sites, int skip, int flag) {}
    static AiGrid aiStickerGrid(Method method, AiCell cell) {
        if (!method.getName().equals("render") || AccessFlags.STATIC.isSet(method.getAccessFlags())) return null;
        var c = instructions(method);
        java.util.function.IntPredicate labelled = at -> c.get(at).getOpcode() == Opcode.CONST && c.get(at) instanceof NarrowLiteralInstruction n &&
                (n.getNarrowLiteral() == cell.menu() || n.getNarrowLiteral() == cell.label());
        var labels = new ArrayList<Integer>();
        for (int at = 0; at < c.size(); at++) if (labelled.test(at)) labels.add(at);
        if (labels.isEmpty() || c.stream().noneMatch(i -> ITERATOR_HAS_NEXT.equals(ref(i)))) return null;
        var found = new ArrayList<AiGrid>();
        for (int head = 0; head < c.size(); head++) {
            if (!mediaIs(c, head, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || !ITERATOR_HAS_NEXT.equals(ref(c.get(head)))) continue;
            var iterators = bubbleArgs(c.get(head));
            if (iterators.size() != 1 || head + 5 >= c.size()) continue;
            int iterator = iterators.getFirst(), more = register(c.get(head + 1)), item = register(c.get(head + 4));
            if (!mediaIs(c, head + 1, Opcode.MOVE_RESULT) || !mediaIs(c, head + 2, Opcode.IF_EQZ) || register(c.get(head + 2)) != more ||
                    !mediaIs(c, head + 3, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || !ITERATOR_NEXT.equals(ref(c.get(head + 3))) ||
                    !bubbleArgs(c.get(head + 3)).equals(List.of(iterator)) || !mediaIs(c, head + 4, Opcode.MOVE_RESULT_OBJECT) ||
                    !mediaIs(c, head + 5, Opcode.CHECK_CAST) || register(c.get(head + 5)) != item) continue;
            // Every item goes back to the head through a plain goto.
            var backs = new ArrayList<Integer>();
            for (int i = 0; i < c.size(); i++) if (c.get(i) instanceof OffsetInstruction && mediaTarget(c, i) == head) backs.add(i);
            if (backs.isEmpty() || backs.stream().anyMatch(i -> !MEDIA_GOTOS.contains(c.get(i).getOpcode()))) continue;
            int link = head + 6;
            Integer flag = null;
            var menus = new ArrayList<Integer>();
            var ais = new ArrayList<Integer>();
            var bodies = new ArrayList<int[]>();
            while (mediaIs(c, link, Opcode.INSTANCE_OF)) {
                var test = (TwoRegisterInstruction) c.get(link);
                if (test.getRegisterB() != item || (flag != null && test.getRegisterA() != flag)) break;
                flag = test.getRegisterA();
                if (!mediaIs(c, link + 1, Opcode.IF_EQZ) || register(c.get(link + 1)) != flag) break;
                int end = mediaTarget(c, link + 1);
                if (end <= link + 2) break;
                for (int at = link + 2; at < end; at++) {
                    if (!labelled.test(at) || !feedsAiCell(c, at, cell)) continue;
                    if (((NarrowLiteralInstruction) c.get(at)).getNarrowLiteral() == cell.menu()) menus.add(link + 2); else ais.add(link + 2);
                    bodies.add(new int[] {link + 2, end});
                }
                link = end;
            }
            var sites = new ArrayList<Integer>(menus);
            sites.addAll(ais);
            Collections.sort(sites);
            var targets = mediaTargets(method);
            // One menu branch and at most one AI branch (586 doesn't list it in the grid), each entered only from its own
            // instance-of test, and no label outside them.
            if (flag == null || flag > 15 || menus.size() != 1 || ais.size() > 1 || menus.equals(ais) ||
                    List.of(item, iterator).contains(flag) || sites.stream().anyMatch(targets::contains) ||
                    labels.stream().anyMatch(at -> bodies.stream().noneMatch(b -> at >= b[0] && at < b[1]))) continue;
            found.add(new AiGrid(sites, head, flag));
        }
        return found.size() == 1 ? found.getFirst() : null;
    }
    static List<Method> findAiStickerGrids(List<ClassDef> classes) {
        var cells = discoverAiCells(classes).stream().map(FoundAiCell::cell).toList();
        var result = new ArrayList<Method>();
        for (var cls : classes) for (var m : cls.getMethods()) if (cells.stream().anyMatch(cell -> aiStickerGrid(m, cell) != null)) result.add(m);
        return result;
    }

    record CommunityInbox(Method render, String identity) {}
    /**
     * The folder switch's lifecycle read with its checked static getter inlined, as 586's family B builds have it: the
     * field into v1, a null test jumping to a throwing tail of three, 45 instructions in all. CommunityInbox.kt matches it too.
     */
    static boolean inlineLifecycleRead(List<Instruction> c) {
        int n = c.size();
        return n == 45 && c.get(0).getOpcode() == Opcode.IGET_OBJECT && c.get(1).getOpcode() == Opcode.IF_EQZ &&
            register(c.get(0)) == 1 && register(c.get(1)) == 1 && jumpsTo(c, 1, n - 3) && throwingTail(c, n - 3);
    }

    /** An inlined null check's landing: a static call that makes the exception, its result, and the throw. */
    static boolean throwingTail(List<Instruction> c, int at) {
        return at >= 0 && at + 2 < c.size() && c.get(at).getOpcode() == Opcode.INVOKE_STATIC &&
            c.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && c.get(at + 2).getOpcode() == Opcode.THROW &&
            register(c.get(at + 1)) == register(c.get(at + 2));
    }

    /**
     * Family B's coordinator scope getter: its lifecycle field, a null test that throws, the lifecycle's config, and the
     * config's scope, with the result's own null test before the return. CommunityInbox.kt matches the same shape.
     */
    static boolean coordinatorScopeGetter(Method m) {
        var c = instructions(m);
        var shape = List.of(Opcode.IGET_OBJECT, Opcode.IF_NEZ, Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_OBJECT, Opcode.THROW, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.IF_NEZ, Opcode.CONST_STRING, Opcode.INVOKE_STATIC, Opcode.GOTO, Opcode.RETURN_OBJECT);
        if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getParameterTypes().isEmpty() || m.getImplementation() == null ||
            !c.stream().map(Instruction::getOpcode).toList().equals(shape)) return false;
        int self = m.getImplementation().getRegisterCount() - 1;
        return ((ReferenceInstruction)c.get(0)).getReference() instanceof FieldReference lifecycle &&
            ((ReferenceInstruction)c.get(7)).getReference() instanceof FieldReference config &&
            ((ReferenceInstruction)c.get(8)).getReference() instanceof MethodReference scope && lifecycle.getDefiningClass().equals(m.getDefiningClass()) &&
            config.getDefiningClass().equals(lifecycle.getType()) && scope.getDefiningClass().equals(config.getType()) &&
            scope.getParameterTypes().isEmpty() && scope.getReturnType().equals(m.getReturnType()) &&
            ((TwoRegisterInstruction)c.get(0)).getRegisterB() == self && register(c.get(0)) == register(c.get(1)) &&
            ((TwoRegisterInstruction)c.get(7)).getRegisterB() == register(c.get(0)) && calls(c.get(8), register(c.get(7))) &&
            register(c.get(9)) == register(c.get(10)) && register(c.get(9)) == register(c.get(14)) &&
            jumpsTo(c, 1, 7) && jumpsTo(c, 10, 14);
    }

    static CommunityInbox communityInbox(List<ClassDef> input) {
        if (input.stream().noneMatch(c->new CommunityDiscovery(List.of(c)).original(c).equals("InboxFragment"))) return null;
        try { return new CommunityDiscovery(input).prove(); } catch (RuntimeException changed) { return null; }
    }
    /** The same connected Main-only route and native subscribed predicate used by the injector. */
    static final class CommunityDiscovery {
        final Map<String,ClassDef> classes=new HashMap<>();
        static final String ROOT="Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;";
        static final String SUMMARY="Lcom/facebook/messaging/model/threads/ThreadSummary;";
        static final String KEY="Lcom/facebook/messaging/model/threadkey/ThreadKey;";
        static final String LIST="Lcom/google/common/collect/ImmutableList;";
        CommunityDiscovery(List<ClassDef> input) { input.forEach(c->classes.put(c.getType(),c)); }
        boolean literal(Instruction i,int register,int value) { return i.getOpcode()==Opcode.CONST_4 && i instanceof OneRegisterInstruction r && r.getRegisterA()==register && i instanceof NarrowLiteralInstruction l && l.getNarrowLiteral()==value; }
        List<Field> methodFields(ClassDef cls,String name) { var out=new ArrayList<Field>(); for(var f:cls.getFields()) if(f.getName().equals(name)) out.add(f); return out; }
        int branch(Method m,int at) {
            var c=instructions(m); int address=0;
            for(int i=0;i<at;i++) address+=c.get(i).getCodeUnits();
            int target=address+((OffsetInstruction)c.get(at)).getCodeOffset(); address=0;
            for(int i=0;i<c.size();i++) { if(address==target) return i; address+=c.get(i).getCodeUnits(); }
            throw new IllegalStateException("Disconnected community branch");
        }
    String id(MethodReference m) { return m.getDefiningClass() + "->" + m.getName() + "(" + String.join("", m.getParameterTypes()) + ")" + m.getReturnType(); }
    void require(boolean condition, String reason) { if (!condition) throw new IllegalStateException(reason); }
    <T> T single(List<T> values, String what) { require(values.size() == 1, what + " count=" + values.size()); return values.getFirst(); }
    List<MethodReference> calls(Method method) {
        var out = new ArrayList<MethodReference>();
        for (var i : instructions(method)) if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr) out.add(mr);
        return out;
    }
    boolean hasString(Method method, String value) {
        return instructions(method).stream().anyMatch(i -> i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s && s.getString().equals(value));
    }
    Method definition(MethodReference ref) {
        var out = new ArrayList<Method>();
        for (var m : classes.get(ref.getDefiningClass()).getMethods()) if (id(m).equals(id(ref))) out.add(m);
        return single(out, "definition " + id(ref));
    }
    Map<String, FieldReference> enumMembers(String type) {
        var out = new LinkedHashMap<String, FieldReference>();
        var cls = classes.get(type); if (cls == null) return out;
        for (var m : cls.getMethods()) if (m.getName().equals("<clinit>")) {
            var code = instructions(m);
            for (int at = 0; at < code.size(); at++) {
                var i = code.get(at);
                if (!(i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s)) continue;
                String name = s.getString();
                if (!Set.of("INBOX", "PENDING", "COMMUNITY_FOLDER", "COMMUNITY_CHANNELS", "COMMUNITY_CHANNEL", "COMMUNITY_ANNOUNCEMENT_CHANNEL", "GROUP", "SOCIAL_CHANNEL", "BROADCAST_CHANNEL").contains(name)) continue;
                for (int after = at + 1; after < Math.min(code.size(), at + 14); after++) {
                    var next = code.get(after);
                    if (next.getOpcode().name().startsWith("SPUT") && next instanceof ReferenceInstruction fr && fr.getReference() instanceof FieldReference f && f.getType().equals(type)) { out.put(name, f); break; }
                }
            }
        }
        return out;
    }
    List<Field> fieldsOf(String type, String fieldType) {
        var out = new ArrayList<Field>();
        var cls = classes.get(type);
        if (cls != null) for (var f : cls.getInstanceFields()) if (f.getType().equals(fieldType)) out.add(f);
        return out;
    }
    void publicStatic(FieldReference field) {
        var cls=classes.get(field.getDefiningClass());
        var nativeField=single(methodFields(cls,field.getName()).stream().filter(f->f.getType().equals(field.getType())).toList(),"native enum member");
        require(AccessFlags.PUBLIC.isSet(cls.getAccessFlags()) && AccessFlags.PUBLIC.isSet(nativeField.getAccessFlags()) && AccessFlags.STATIC.isSet(nativeField.getAccessFlags()),"native enum member inaccessible");
    }
    Map<String, String> enumFieldNames(String type) {
        var out = new LinkedHashMap<String, String>();
        for (var m : classes.get(type).getMethods()) if (m.getName().equals("<clinit>")) {
            String label = null;
            for (var i : instructions(m)) {
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s) label = s.getString();
                if (i.getOpcode().name().equals("SPUT_OBJECT") && i instanceof ReferenceInstruction ri && ri.getReference() instanceof FieldReference f && f.getType().equals(type)) {
                    require(label != null, "missing enum label for " + f); out.put(f.getName(), label); label = null;
                }
            }
        }
        return out;
    }
    String original(ClassDef cls) {
        for (var f : cls.getFields()) if (f.getName().equals("__redex_internal_original_name") && f.getInitialValue() instanceof StringEncodedValue s) return s.getValue();
        return "";
    }
    Object ref(Instruction i) { return i instanceof ReferenceInstruction r ? r.getReference() : null; }
    List<Integer> args(Instruction i) {
        if (i instanceof FiveRegisterInstruction f) return List.of(f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()).subList(0, f.getRegisterCount());
        if (i instanceof RegisterRangeInstruction r) { var out = new ArrayList<Integer>(); for(int at=0;at<r.getRegisterCount();at++) out.add(r.getStartRegister()+at); return out; }
        return List.of();
    }
    List<Method> methods(ClassDef cls) { var out=new ArrayList<Method>(); cls.getMethods().forEach(out::add); return out; }
    boolean reads(Instruction i, String field) { return i.getOpcode() == Opcode.IGET_OBJECT && Objects.toString(ref(i)).equals(field); }
    boolean writes(Instruction i, int register) { return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction r && r.getRegisterA() == register; }
    boolean source(Instruction i,int value,int register) {
        String name=i.getOpcode().toString();
        return value==register || ((name.contains("WIDE") || name.contains("LONG") || name.contains("DOUBLE")) && value+1==register);
    }
    boolean operandReads(Instruction i,int register) {
        if(i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction) return args(i).stream().anyMatch(v->source(i,v,register));
        if(i instanceof ThreeRegisterInstruction r) return source(i,r.getRegisterB(),register) || source(i,r.getRegisterC(),register) || (!i.getOpcode().setsRegister() && source(i,r.getRegisterA(),register));
        if(i instanceof TwoRegisterInstruction r) return source(i,r.getRegisterB(),register) || ((!i.getOpcode().setsRegister() || i.getOpcode().toString().contains("2ADDR")) && source(i,r.getRegisterA(),register));
        return i instanceof OneRegisterInstruction r && (!i.getOpcode().setsRegister() || i.getOpcode()==Opcode.CHECK_CAST) && source(i,r.getRegisterA(),register);
    }
    Set<Integer> targets(Method method) {
        var code=instructions(method); var addresses=new HashMap<Integer,Integer>(); int address=0;
        for(int at=0;at<code.size();at++) { addresses.put(address,at); address+=code.get(at).getCodeUnits(); }
        var out=new HashSet<Integer>(); address=0;
        for(var i:code) { if(i instanceof OffsetInstruction j) {
            Integer target=addresses.get(address+j.getCodeOffset()); require(target!=null,"bad native branch"); out.add(target);
            if(code.get(target) instanceof SwitchPayload s) for(var e:s.getSwitchElements()) { Integer t=addresses.get(address+e.getOffset()); require(t!=null,"bad switch branch"); out.add(t); }
        } address+=i.getCodeUnits(); } return out;
    }
    /** No path from `from` reads the register before writing it. Mirrors the scratch proof in CommunityInbox.kt. */
    boolean deadFrom(Method method,int from,int register) {
        var code=instructions(method); var addresses=new HashMap<Integer,Integer>(); var units=new int[code.size()]; int address=0;
        for(int at=0;at<code.size();at++) { units[at]=address; addresses.put(address,at); address+=code.get(at).getCodeUnits(); }
        var pending=new ArrayDeque<Integer>(List.of(from)); var seen=new HashSet<Integer>();
        while(!pending.isEmpty()) {
            int at=pending.poll(); if(!seen.add(at)) continue;
            var i=code.get(at);
            if(operandReads(i,register)) return false;
            if(writes(i,register)) continue;
            if(i instanceof OffsetInstruction j && i.getOpcode()!=Opcode.FILL_ARRAY_DATA) {
                Integer landing=addresses.get(units[at]+j.getCodeOffset()); require(landing!=null,"bad native branch");
                if(i.getOpcode()==Opcode.PACKED_SWITCH || i.getOpcode()==Opcode.SPARSE_SWITCH) {
                    require(code.get(landing) instanceof SwitchPayload,"bad switch branch");
                    for(var e:((SwitchPayload)code.get(landing)).getSwitchElements()) { Integer t=addresses.get(units[at]+e.getOffset()); require(t!=null,"bad switch branch"); pending.add(t); }
                } else pending.add(landing);
            }
            if(i.getOpcode().canContinue()) { require(at+1<code.size(),"native code falls off the end"); pending.add(at+1); }
        }
        return true;
    }
    /**
     * The closure body's pinned layout by register count: second read, list register, alias register, moves after the
     * alias, then the hook's two scratch registers. Mirrors communityLayout in CommunityInbox.kt.
     */
    static int[] communityLayout(Method invoke) {
        if(invoke.getImplementation()==null || AccessFlags.STATIC.isSet(invoke.getAccessFlags())) return null;
        return switch(invoke.getImplementation().getRegisterCount()) {
            case 21 -> new int[]{63,1,17,1,0,3};
            case 22 -> new int[]{76,2,18,2,0,1};
            default -> null;
        };
    }
    /**
     * Family B's joined predicate with the key test inlined: a null key, or a type that's neither of the two compared,
     * returns false; either type returns the subscribed flag. Mirrors CommunityInbox.kt.
     */
    boolean inlineJoinedShape(Method m) {
        var b=instructions(m);
        if(m.getImplementation()==null || m.getImplementation().getRegisterCount()!=3 || !m.getImplementation().getTryBlocks().isEmpty() ||
            !AccessFlags.STATIC.isSet(m.getAccessFlags()) || !b.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.IF_EQZ,
            Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_EQ,Opcode.SGET_OBJECT,Opcode.IF_NE,Opcode.CONST_4,Opcode.CONST_4,Opcode.IF_EQZ,
            Opcode.IGET_BOOLEAN,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.GOTO))) return false;
        if(!(ref(b.get(0)) instanceof FieldReference key && key.getDefiningClass().equals(SUMMARY) && key.getType().equals(KEY)) ||
            !(ref(b.get(2)) instanceof FieldReference type && type.getDefiningClass().equals(KEY)) ||
            !(ref(b.get(3)) instanceof FieldReference first && first.getDefiningClass().equals(type.getType()) && first.getType().equals(type.getType())) ||
            !(ref(b.get(5)) instanceof FieldReference second && second.getDefiningClass().equals(type.getType()) && second.getType().equals(type.getType())) ||
            !(ref(b.get(10)) instanceof FieldReference flag && flag.getDefiningClass().equals(SUMMARY) && flag.getType().equals("Z"))) return false;
        java.util.function.BiPredicate<Integer,int[]> two=(at,r)->((TwoRegisterInstruction)b.get(at)).getRegisterA()==r[0] && ((TwoRegisterInstruction)b.get(at)).getRegisterB()==r[1];
        return two.test(0,new int[]{0,2}) && register(b.get(1))==0 && branch(m,1)==14 && two.test(2,new int[]{1,0}) && register(b.get(3))==0 &&
            two.test(4,new int[]{1,0}) && branch(m,4)==7 && register(b.get(5))==0 && two.test(6,new int[]{1,0}) && branch(m,6)==14 &&
            literal(b.get(7),0,1) && literal(b.get(8),1,0) && register(b.get(9))==0 && branch(m,9)==13 && two.test(10,new int[]{0,2}) &&
            register(b.get(11))==0 && branch(m,11)==13 && literal(b.get(12),1,1) && register(b.get(13))==1 && literal(b.get(14),0,0) && branch(m,15)==8;
    }
    Method singleMethod(String type, String name) { return single(methods(classes.get(type)).stream().filter(m->m.getName().equals(name)).toList(),type+"->"+name); }
    boolean sessionCapturedFirst(List<Instruction> ctorCode) {
        var store=ctorCode.get(2);
        return store.getOpcode()==Opcode.IPUT_OBJECT && ref(store) instanceof FieldReference f && f.getName().equals("$fbUserSession") && f.getType().equals("Lcom/facebook/auth/usersession/FbUserSession;") &&
            ((TwoRegisterInstruction)store).getRegisterA()==2 && ((TwoRegisterInstruction)store).getRegisterB()==1;
    }
        CommunityInbox prove() {
        var immutable=classes.get(LIST);
        var copy=single(methods(immutable).stream().filter(m->id(m).equals(LIST+"->copyOf(Ljava/util/Collection;)"+LIST)).toList(),"native immutable projection");
        require(AccessFlags.PUBLIC.isSet(immutable.getAccessFlags()) && AccessFlags.PUBLIC.isSet(copy.getAccessFlags()) && AccessFlags.STATIC.isSet(copy.getAccessFlags()),"native immutable projection inaccessible");
        ClassDef main=single(classes.values().stream().filter(c->original(c).equals("InboxFragment")).toList(),"main InboxFragment");
        Method render=single(methods(main).stream().filter(m->hasString(m,"InboxFragment_updateSectionTree")).toList(),"main section tree render");
        require(render.getReturnType().equals("V") && render.getParameterTypes().size()==4 && render.getParameterTypes().get(0).toString().equals(main.getType()),"main void renderer changed");
        var renderCode=instructions(render);
        var folderConfigs=new ArrayList<Method>();
        for(var f:classes.get(ROOT).getInstanceFields()) if(classes.containsKey(f.getType())) for(var m:classes.get(f.getType()).getMethods()) if(hasString(m,"folderName") && enumMembers(m.getReturnType()).containsKey("INBOX")) folderConfigs.add(m);
        var folderGetter=single(folderConfigs,"typed folder getter"); String folderType=folderGetter.getReturnType();
        var mainLoaderCalls=new ArrayList<MethodReference>();
        for(var m:main.getMethods()) for(var c:calls(m)) if(c.getName().equals("<init>") && c.getParameterTypes().size()==6 && c.getParameterTypes().get(0).toString().equals("Landroid/content/Context;") && c.getParameterTypes().get(1).toString().equals("Lcom/facebook/auth/usersession/FbUserSession;") && c.getParameterTypes().get(2).toString().equals(main.getSuperclass()) && c.getParameterTypes().get(5).toString().equals("Ljava/util/List;")) mainLoaderCalls.add(c);
        var loaderCtor=definition(single(mainLoaderCalls,"main loader creation"));
        var coordinatorCtors=calls(loaderCtor).stream().filter(c->c.getName().equals("<init>") && classes.containsKey(c.getDefiningClass()) && original(classes.get(c.getDefiningClass())).equals("InboxLoaderCoordinator")).toList();
        var coordinatorCtor=definition(single(coordinatorCtors,"main inbox coordinator"));
        var configCtor=definition(single(calls(coordinatorCtor).stream().filter(c->c.getName().equals("<init>") && c.getDefiningClass().equals(folderGetter.getDefiningClass())).toList(),"default main list config"));
        String builder=configCtor.getParameterTypes().get(0).toString();
        var defaultBuilder=single(methods(classes.get(builder)).stream().filter(m->m.getName().equals("<init>") && m.getParameterTypes().isEmpty()).toList(),"default inbox config builder");
        require(instructions(defaultBuilder).size()==5 && calls(defaultBuilder).stream().anyMatch(c->c.getDefiningClass().equals("Ljava/util/HashSet;") && c.getParameterTypes().isEmpty()),"default config keys not empty");
        require(hasString(coordinatorCtor,"threadTypeFilter") && !hasString(coordinatorCtor,"folderName"),"main initializer overrides folder");
        var folders=enumMembers(folderType);
        require(instructions(folderGetter).stream().anyMatch(i->i.getOpcode()==Opcode.SGET_OBJECT && Objects.toString(ref(i)).equals(folders.get("INBOX").toString())),"default folder is not INBOX");
        var folderOverride=single(methods(main).stream().filter(m->hasString(m,"folderName")).toList(),"main typed folder override");
        var overrideCode=instructions(folderOverride);
        // Some 584.1 arm64 builds drop a flag store and move the config's apply into a static helper: 38 instructions, not 42.
        // 586's family B builds read the lifecycle field inline and throw from a tail of three when it's null: 45.
        require(hasString(folderOverride,"InboxLoaderCoordinator.setFolderAndFilter") && (overrideCode.size()==42 || overrideCode.size()==38 || inlineLifecycleRead(overrideCode)) && (inlineLifecycleRead(overrideCode) || (overrideCode.get(0).getOpcode()==Opcode.INVOKE_STATIC && overrideCode.get(1).getOpcode()==Opcode.MOVE_RESULT_OBJECT)) && folderOverride.getParameterTypes().size()==2,"main folder switch changed");
        String scopeType=folderOverride.getParameterTypes().get(1).toString();
        var scopeLabels=enumFieldNames(scopeType); var folderLabels=enumFieldNames(folderType);
        var pending=(FieldReference)ref(overrideCode.get(4)); var requests=(FieldReference)ref(overrideCode.get(2));
        require(scopeLabels.get(requests.getName()).equals("MESSAGE_REQUESTS") && folderLabels.get(pending.getName()).equals("PENDING"),"pending scope label changed");
        int inboxAt=branch(folderOverride,3), folderRegister=register(overrideCode.get(4));
        require(overrideCode.get(3).getOpcode()==Opcode.IF_NE && Objects.toString(ref(overrideCode.get(7))).equals(pending.toString()) && Objects.toString(ref(overrideCode.get(inboxAt))).equals(folders.get("INBOX").toString()),"main folder branches changed");
        // The switch's own scope parameter and the chosen folder are the two values stored into the new config.
        java.util.function.Function<String,TwoRegisterInstruction> stores=type->(TwoRegisterInstruction)overrideCode.get(single(java.util.stream.IntStream.range(0,overrideCode.size()).boxed()
            .filter(at->overrideCode.get(at).getOpcode()==Opcode.IPUT_OBJECT && ref(overrideCode.get(at)) instanceof FieldReference f && f.getType().equals(type)).toList(),"config store "+type));
        var scopeStore=stores.apply(scopeType); var folderStore=stores.apply(folderType);
        require(List.of(4,7,inboxAt).stream().allMatch(at->register(overrideCode.get(at))==folderRegister) &&
            scopeStore.getRegisterA()==folderOverride.getImplementation().getRegisterCount()-1 && folderStore.getRegisterA()==folderRegister &&
            scopeStore.getRegisterB()==folderStore.getRegisterB(),"folder/filter config connection changed");
        for(var m:main.getMethods()) {
            require(m.equals(folderOverride) || !hasString(m,"folderName"),"other main config folder override");
            require(calls(m).stream().noneMatch(c->c.getDefiningClass().equals(loaderCtor.getDefiningClass()) && c.getParameterTypes().contains(folderType)),"main renderer selects another folder");
        }
        var ctorCalls=calls(render).stream().filter(m->m.getName().equals("<init>") && m.getParameterTypes().contains(LIST)).toList();
        Method ctor=definition(single(ctorCalls,"dedicated immutable-list closure ctor"));
        var closure=classes.get(ctor.getDefiningClass());
        // The closure takes an $onThreadInViewport Function1 before the trailing flag, which then needs a move/from16 to be stored.
        var ctorParams=ctor.getParameterTypes().stream().map(Object::toString).toList();
        require(ctorParams.size()==15 && ctorParams.get(11).equals(LIST) && ctorParams.get(13).equals("Lkotlin/jvm/functions/Function1;") && ctorParams.get(14).equals("Z") && ctor.getReturnType().equals("V"),"captured list argument changed");
        var ctorCode=instructions(ctor);
        require(ctor.getImplementation().getRegisterCount()==17 && ctorCode.size()==19 && ctor.getImplementation().getTryBlocks().isEmpty(),"closure ctor shape changed");
        require(ctorCode.get(0).getOpcode()==Opcode.IPUT_OBJECT && ctorCode.get(0) instanceof TwoRegisterInstruction && ref(ctorCode.get(0)) instanceof FieldReference,"captured presentation store absent");
        var store=(TwoRegisterInstruction)ctorCode.get(0); var captured=(FieldReference)ref(ctorCode.get(0));
        require(store.getRegisterA()==13 && store.getRegisterB()==1 && captured.getName().equals("$inboxUnitItems") && captured.getType().equals(LIST),"captured parameter disconnected");
        // The session capture comes first, in slot 2, so the scope capture is in slot 5.
        require(sessionCapturedFirst(ctorCode),"session capture moved");
        int scopeAt=5;
        var scopeField=(FieldReference)ref(ctorCode.get(scopeAt));
        require(ctorCode.get(scopeAt).getOpcode()==Opcode.IPUT_OBJECT && scopeField.getName().equals("$threadTypeFilter") && scopeField.getType().equals(scopeType) && ((TwoRegisterInstruction)ctorCode.get(scopeAt)).getRegisterA()==10,"captured native scope disconnected");
        var ctorCallers=new ArrayList<String>(); var allocations=new ArrayList<String>(); var fieldWrites=new ArrayList<String>();
        for(var cls:classes.values()) for(var method:cls.getMethods()) { var code=instructions(method); for(int at=0;at<code.size();at++) {
            var i=code.get(at); Object r=ref(i);
            if(r instanceof MethodReference m && id(m).equals(id(ctor))) ctorCallers.add(id(method)+" @"+at);
            if(i.getOpcode()==Opcode.NEW_INSTANCE && Objects.toString(r).equals(closure.getType())) allocations.add(id(method)+" @"+at);
            if(i.getOpcode().toString().startsWith("IPUT") && Objects.toString(r).equals(captured.toString())) fieldWrites.add(id(method)+" @"+at);
        }}
        require(ctorCallers.size()==1 && ctorCallers.get(0).startsWith(id(render)+" @"),"foreign constructor caller: "+ctorCallers);
        require(allocations.size()==1 && allocations.get(0).startsWith(id(render)+" @"),"foreign closure allocation: "+allocations);
        require(fieldWrites.size()==1 && fieldWrites.get(0).equals(id(ctor)+" @0"),"shared captured-list mutation");
        int callAt=-1; for(int at=0;at<renderCode.size();at++) if(ref(renderCode.get(at)) instanceof MethodReference m && id(m).equals(id(ctor))) callAt=at;
        int listArgument=args(renderCode.get(callAt)).get(12);
        int scopeArgument=args(renderCode.get(callAt)).get(9);
        int scopeResult=-1; for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),scopeArgument)) { scopeResult=at; break; }
        require(scopeResult>=1 && renderCode.get(scopeResult).getOpcode()==Opcode.MOVE_RESULT_OBJECT && ref(renderCode.get(scopeResult-1)) instanceof MethodReference,"captured scope result disconnected");
        var scopeGetter=definition((MethodReference)ref(renderCode.get(scopeResult-1)));
        // 348 calls the loader's 13-instruction getter, which walks the loader's coordinator and lifecycle to the config.
        // Family B reads the loader's coordinator in the render and calls the coordinator's own 15-instruction getter.
        boolean coordinatorRead=coordinatorScopeGetter(scopeGetter);
        require((coordinatorRead || (scopeGetter.getDefiningClass().equals(loaderCtor.getDefiningClass()) && instructions(scopeGetter).size()==13)) && scopeGetter.getReturnType().equals(scopeType) && calls(scopeGetter).stream().anyMatch(m->m.getDefiningClass().equals(folderGetter.getDefiningClass()) && m.getReturnType().equals(scopeType)),"scope does not read current native config");
        int prefixAt=scopeAt+4;
        var prefix=(FieldReference)ref(ctorCode.get(prefixAt));
        require(prefix.getName().equals("$prefixOffsetCallback") && ctorCode.get(prefixAt).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)ctorCode.get(prefixAt)).getRegisterA()==8,"Main callback capture disconnected");
        int prefixArg=args(renderCode.get(callAt)).get(7), prefixMove=-1;
        for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),prefixArg)) { prefixMove=at; break; }
        require(prefixMove>=0 && renderCode.get(prefixMove).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"Main callback alias absent");
        int prefixSource=((TwoRegisterInstruction)renderCode.get(prefixMove)).getRegisterB(), prefixRead=-1;
        for(int at=prefixMove-1;at>=0;at--) if(writes(renderCode.get(at),prefixSource)) { prefixRead=at; break; }
        require(prefixRead>=0 && renderCode.get(prefixRead).getOpcode()==Opcode.IGET_OBJECT,"Main callback source absent");
        var mainPrefix=(FieldReference)ref(renderCode.get(prefixRead)); require(mainPrefix.getDefiningClass().equals(main.getType()) && mainPrefix.getType().equals(prefix.getType()),"foreign callback source");
        var prefixStores=new ArrayList<Method>(); int prefixStore=-1;
        for(var cls:classes.values()) for(var m:cls.getMethods()) { var body=instructions(m); for(int at=0;at<body.size();at++) if(body.get(at).getOpcode()==Opcode.IPUT_OBJECT && Objects.toString(ref(body.get(at))).equals(mainPrefix.toString())) { prefixStores.add(m); prefixStore=at; } }
        var mainCtor=single(prefixStores,"unique Main callback owner"); var mainCtorCode=instructions(mainCtor);
        require(mainCtor.getDefiningClass().equals(main.getType()) && mainCtor.getName().equals("<init>") && prefixStore>=2,"Main callback ownership changed");
        var callbackCtor=definition((MethodReference)ref(mainCtorCode.get(prefixStore-1))); var callbackCode=instructions(callbackCtor);
        require(callbackCtor.getParameterTypes().equals(List.of(main.getType())) && callbackCode.size()==3 && callbackCode.get(0).getOpcode()==Opcode.IPUT_OBJECT && ((TwoRegisterInstruction)callbackCode.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)callbackCode.get(0)).getRegisterB()==0,"callback Main pointer disconnected");
        var callbackMain=(FieldReference)ref(callbackCode.get(0));
        int getterCall=scopeResult-1, getterReceiver=args(renderCode.get(getterCall)).get(0);
        var getterCode=instructions(scopeGetter);
        List<FieldReference> currentPath;
        if(coordinatorRead) {
            // The loader field, a null test that jumps to a throwing tail, then the loader's coordinator field.
            require(getterCall>=3 && renderCode.get(getterCall-1).getOpcode()==Opcode.IGET_OBJECT && register(renderCode.get(getterCall-1))==getterReceiver &&
                ((TwoRegisterInstruction)renderCode.get(getterCall-1)).getRegisterB()==getterReceiver &&
                renderCode.get(getterCall-2).getOpcode()==Opcode.IF_EQZ && register(renderCode.get(getterCall-2))==getterReceiver && throwingTail(renderCode,branch(render,getterCall-2)) &&
                renderCode.get(getterCall-3).getOpcode()==Opcode.IGET_OBJECT && register(renderCode.get(getterCall-3))==getterReceiver,"Main loader source absent");
            var mainLoader=(FieldReference)ref(renderCode.get(getterCall-3)); var coordinator=(FieldReference)ref(renderCode.get(getterCall-1));
            require(mainLoader.getType().equals(loaderCtor.getDefiningClass()) && coordinator.getDefiningClass().equals(mainLoader.getType()) &&
                coordinator.getType().equals(scopeGetter.getDefiningClass()),"Main loader getter changed");
            currentPath=List.of(callbackMain,mainLoader,coordinator,(FieldReference)ref(getterCode.get(0)),(FieldReference)ref(getterCode.get(7)));
        } else {
            // 584 reads the loader through a lazy field: the field, a null test that skips a checked static getter, then the call.
            require(getterCall>=4 && renderCode.get(getterCall-1).getOpcode()==Opcode.MOVE_RESULT_OBJECT && register(renderCode.get(getterCall-1))==getterReceiver &&
                renderCode.get(getterCall-2).getOpcode()==Opcode.INVOKE_STATIC && renderCode.get(getterCall-3).getOpcode()==Opcode.IF_NEZ &&
                register(renderCode.get(getterCall-3))==getterReceiver && branch(render,getterCall-3)==getterCall &&
                renderCode.get(getterCall-4).getOpcode()==Opcode.IGET_OBJECT && register(renderCode.get(getterCall-4))==getterReceiver,"Main loader source absent");
            var mainLoader=(FieldReference)ref(renderCode.get(getterCall-4));
            var checkedLoader=definition((MethodReference)ref(renderCode.get(getterCall-2))); var checkedCode=instructions(checkedLoader);
            require(AccessFlags.STATIC.isSet(checkedLoader.getAccessFlags()) && checkedLoader.getParameterTypes().stream().map(Object::toString).toList().equals(List.of(main.getType())) &&
                checkedLoader.getReturnType().equals(mainLoader.getType()) && checkedCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,
                Opcode.IF_EQZ, Opcode.RETURN_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.THROW)) &&
                Objects.toString(ref(checkedCode.get(0))).equals(mainLoader.toString()),"Main loader getter changed");
            currentPath=List.of(callbackMain,mainLoader,(FieldReference)ref(getterCode.get(0)),(FieldReference)ref(getterCode.get(1)),(FieldReference)ref(getterCode.get(8)));
        }
        String owner=callbackCtor.getDefiningClass();
        for(var f:currentPath) { require(f.getDefiningClass().equals(owner),"current folder path disconnected");
            var nativeField=single(methodFields(classes.get(owner),f.getName()),"current folder field");
            require(AccessFlags.PUBLIC.isSet(nativeField.getAccessFlags()) && !AccessFlags.STATIC.isSet(nativeField.getAccessFlags()) && AccessFlags.PUBLIC.isSet(classes.get(owner).getAccessFlags()),"current folder path inaccessible"); owner=f.getType(); }
        require(owner.equals(folderGetter.getDefiningClass()) && AccessFlags.PUBLIC.isSet(classes.get(owner).getAccessFlags()) && AccessFlags.PUBLIC.isSet(folderGetter.getAccessFlags()) && !AccessFlags.STATIC.isSet(folderGetter.getAccessFlags()),"current native folder getter inaccessible");
        var folderCode=instructions(folderGetter);
        require(folderGetter.getParameterTypes().isEmpty() && folderGetter.getImplementation().getRegisterCount()==3 &&
            folderCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.CONST_STRING,Opcode.INVOKE_INTERFACE,Opcode.MOVE_RESULT,Opcode.IF_EQZ,
                Opcode.IGET_OBJECT,Opcode.RETURN_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_NEZ,Opcode.MONITOR_ENTER,Opcode.SGET_OBJECT,Opcode.IF_NEZ,Opcode.SGET_OBJECT,
                Opcode.SPUT_OBJECT,Opcode.MONITOR_EXIT,Opcode.GOTO,Opcode.MOVE_EXCEPTION,Opcode.MONITOR_EXIT,Opcode.THROW,Opcode.SGET_OBJECT,Opcode.RETURN_OBJECT)) &&
            calls(folderGetter).stream().map(this::id).toList().equals(List.of("Ljava/util/Set;->contains(Ljava/lang/Object;)Z")) &&
            branch(folderGetter,4)==7 && branch(folderGetter,8)==19 && branch(folderGetter,11)==14 && branch(folderGetter,15)==19 &&
            ref(folderCode.get(0)) instanceof FieldReference keys && keys.getDefiningClass().equals(owner) && keys.getType().equals("Ljava/util/Set;") &&
            ref(folderCode.get(5)) instanceof FieldReference selected && selected.getDefiningClass().equals(owner) && selected.getType().equals(folderType) &&
            ref(folderCode.get(7)) instanceof FieldReference cached && cached.getDefiningClass().equals(owner) && cached.getType().equals(folderType) &&
            List.of(10,13,19).stream().allMatch(at->Objects.toString(ref(folderCode.get(at))).equals(Objects.toString(ref(folderCode.get(7))))) &&
            Objects.toString(ref(folderCode.get(12))).equals(folders.get("INBOX").toString()) &&
            ((TwoRegisterInstruction)folderCode.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)folderCode.get(0)).getRegisterB()==2 &&
            ((TwoRegisterInstruction)folderCode.get(5)).getRegisterA()==0 && ((TwoRegisterInstruction)folderCode.get(5)).getRegisterB()==2 &&
            ref(folderCode.get(1)) instanceof StringReference label && label.getString().equals("folderName") && args(folderCode.get(2)).equals(List.of(1,0)) &&
            List.of(1,3,4,6,7,8,10,11,12,13,16,18,19,20).stream().allMatch(at->((OneRegisterInstruction)folderCode.get(at)).getRegisterA()==0) &&
            List.of(9,14,17).stream().allMatch(at->((OneRegisterInstruction)folderCode.get(at)).getRegisterA()==2),"native folder getter changed");
        publicStatic(requests); publicStatic(folders.get("INBOX"));
        int listMove=-1; for(int at=callAt-1;at>=0;at--) if(writes(renderCode.get(at),listArgument)) { listMove=at; break; }
        require(listMove>=1 && renderCode.get(listMove).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"main list alias absent");
        var move=(TwoRegisterInstruction)renderCode.get(listMove); var source=renderCode.get(listMove-1);
        require(source.getOpcode()==Opcode.IGET_OBJECT && source instanceof TwoRegisterInstruction && ref(source) instanceof FieldReference,"snapshot source disconnected");
        var modelRows=(FieldReference)ref(source); var sourceReg=(TwoRegisterInstruction)source;
        require(sourceReg.getRegisterA()==move.getRegisterB() && modelRows.getDefiningClass().equals(render.getParameterTypes().get(1).toString()) && modelRows.getType().equals(LIST),"main snapshot does not reach ctor");
        Method invoke=single(methods(closure).stream().filter(m->m.getName().equals("invoke") && m.getParameterTypes().equals(List.of("Ljava/lang/Object;"))).toList(),"section closure invoke");
        var code=instructions(invoke);
        var listReads=new ArrayList<Integer>(); for(int at=0;at<code.size();at++) if(reads(code.get(at),captured.toString())) listReads.add(at);
        // Two pinned layouts, picked by the body's register count. 587 (21 registers) reads the list into v1 at 63,
        // alias it into v17 and move the $onThreadInViewport after it, with v0 and v3 free. Family B (22 registers)
        // inlines the section builder's helpers, reads the list into v2 at 76, aliases it into v18 and moves the callback
        // and the data key after it, with v3 holding the builder and v0 and v1 free.
        var layout=communityLayout(invoke);
        require(layout!=null,"presentation body shape changed");
        require(listReads.size()==2 && listReads.get(0)==5 && listReads.get(1)==layout[0],"presentation read shape changed: "+listReads);
        int secondRead=listReads.get(1), listRegister=layout[1];
        require(hasString(invoke,"searchBarSection") && code.get(secondRead) instanceof TwoRegisterInstruction read && read.getRegisterA()==listRegister && read.getRegisterB()==4,"header or local presentation read changed");
        int aliasAt=-1;
        for(int at=secondRead+1;at<code.size() && aliasAt<0;at++) if(code.get(at).getOpcode()==Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction)code.get(at)).getRegisterA()==layout[2]) aliasAt=at;
        require(aliasAt>0 && ((TwoRegisterInstruction)code.get(aliasAt)).getRegisterB()==listRegister,"second list alias changed");
        for(int at=aliasAt+1;at<=aliasAt+layout[3];at++) require(at<code.size() && code.get(at).getOpcode()==Opcode.MOVE_OBJECT_FROM16,"viewport callback alias changed");
        int sinkAt=aliasAt+layout[3]+1;
        require(sinkAt<code.size() && code.get(sinkAt).getOpcode()==Opcode.INVOKE_STATIC_RANGE && ref(code.get(sinkAt)) instanceof MethodReference,"list section sink changed");
        var sink=(MethodReference)ref(code.get(sinkAt));
        require(sink.getParameterTypes().size()==13 && sink.getParameterTypes().get(11).toString().equals("Ljava/util/List;") && args(code.get(sinkAt)).get(11)==layout[2],"renderer list argument disconnected");
        require(code.size()==sinkAt+8 && invoke.getImplementation().getTryBlocks().isEmpty(),"presentation body shape changed");
        require(code.get(6).getOpcode()==Opcode.INVOKE_VIRTUAL && Objects.toString(ref(code.get(6))).equals("Ljava/util/AbstractCollection;->isEmpty()Z") && args(code.get(6)).equals(List.of(0)),"original empty/header gate changed");
        for(int at=secondRead+1;at<aliasAt;at++) require(!writes(code.get(at),listRegister),"list overwritten before render");
        require(targets(invoke).stream().noneMatch(t->t>secondRead && t<=sinkAt),"branch bypasses second-read hook");
        // The hook's two scratch registers are the layout's pair.
        for(int scratch:List.of(layout[4],layout[5])) require(deadFrom(invoke,secondRead+1,scratch),"scope scratch register still live");
        var search=classes.values().stream().filter(c->Set.of("MessagingTabbedSearchFragment","SearchListItemFragment","MsysMessageSearchThreadListFragment","FoldersFragment").contains(original(c))).toList();
        require(search.stream().anyMatch(c->original(c).equals("MessagingTabbedSearchFragment")) && search.stream().anyMatch(c->original(c).equals("SearchListItemFragment")) && search.stream().anyMatch(c->original(c).equals("FoldersFragment")),"separate native Search/folder fragments absent");
        require(search.stream().noneMatch(c->c.getType().equals(main.getType())),"Search shares main fragment");
        var joined=new ArrayList<Method>(); var inlined=new ArrayList<Method>();
        for(var cls:classes.values()) for(var method:cls.getMethods()) if(method.getParameterTypes().equals(List.of(SUMMARY)) && method.getReturnType().equals("Z") && instructions(method).size()==9) {
            var b=instructions(method);
            if(b.get(0).getOpcode()==Opcode.IGET_OBJECT && ref(b.get(0)) instanceof FieldReference f && f.getDefiningClass().equals(SUMMARY) && f.getType().equals(KEY) && b.get(1).getOpcode()==Opcode.INVOKE_STATIC && ref(b.get(1)) instanceof MethodReference m && m.getDefiningClass().equals(KEY) && m.getParameterTypes().equals(List.of(KEY)) && m.getReturnType().equals("Z") && b.get(5).getOpcode()==Opcode.IGET_BOOLEAN) joined.add(method);
        } else if(method.getParameterTypes().equals(List.of(SUMMARY)) && method.getReturnType().equals("Z") && inlineJoinedShape(method)) inlined.add(method);
        require(joined.size()+inlined.size()==1,"native joined channel predicate count="+(joined.size()+inlined.size()));
        // 586's family B builds inline the null-safe community key test: the key, its two community types, then subscribed.
        boolean inlineJoined=!inlined.isEmpty();
        var predicate=inlineJoined ? inlined.get(0) : joined.get(0); var joinedCode=instructions(predicate);
        String keyField, firstType, secondType; List<String> keyParts;
        if(inlineJoined) {
            keyField=Objects.toString(ref(joinedCode.get(2))); firstType=Objects.toString(ref(joinedCode.get(3))); secondType=Objects.toString(ref(joinedCode.get(5)));
            keyParts=List.of();
        } else {
        require(joinedCode.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.INVOKE_STATIC,Opcode.MOVE_RESULT,Opcode.CONST_4,Opcode.IF_EQZ,Opcode.IGET_BOOLEAN,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN)),"native joined branch changed");
        require(predicate.getImplementation().getRegisterCount()==3 && predicate.getImplementation().getTryBlocks().isEmpty() &&
            ((TwoRegisterInstruction)joinedCode.get(0)).getRegisterA()==0 && ((TwoRegisterInstruction)joinedCode.get(0)).getRegisterB()==2 && args(joinedCode.get(1)).equals(List.of(0)) &&
            ((OneRegisterInstruction)joinedCode.get(2)).getRegisterA()==0 && literal(joinedCode.get(3),1,0) && branch(predicate,4)==8 && branch(predicate,6)==8 &&
            ((TwoRegisterInstruction)joinedCode.get(5)).getRegisterA()==0 && ((TwoRegisterInstruction)joinedCode.get(5)).getRegisterB()==2 &&
            literal(joinedCode.get(7),1,1) && ((OneRegisterInstruction)joinedCode.get(8)).getRegisterA()==1,"native membership value flow changed");
        var keyPredicate=definition((MethodReference)ref(joinedCode.get(1)));
        var keyAny=definition(single(calls(keyPredicate).stream().filter(m->m.getDefiningClass().equals(KEY) && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Z")).toList(),"nullable key-to-community predicate"));
        require(instructions(keyPredicate).size()==8 && calls(keyPredicate).stream().anyMatch(m->id(m).equals(id(keyAny))),"null-safe community wrapper changed");
        var n=instructions(keyPredicate); var a=instructions(keyAny);
        require(n.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IF_EQZ,Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_EQZ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            keyPredicate.getImplementation().getRegisterCount()==1 && branch(keyPredicate,0)==6 && branch(keyPredicate,3)==6 && args(n.get(1)).equals(List.of(0)) && literal(n.get(4),0,1) && literal(n.get(6),0,0),"null/unknown key behavior changed");
        // The community check is split: the key's own channel test first, then the announcement type compared inline.
        require(a.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.INVOKE_VIRTUAL,Opcode.MOVE_RESULT,Opcode.IF_NEZ,Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_EQ,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            keyAny.getImplementation().getRegisterCount()==3 && keyAny.getImplementation().getTryBlocks().isEmpty() && branch(keyAny,2)==8 && branch(keyAny,5)==8 &&
            literal(a.get(6),0,0) && literal(a.get(8),0,1) && args(a.get(0)).equals(List.of(2)) && register(a.get(1))==0 && register(a.get(2))==0 &&
            ((TwoRegisterInstruction)a.get(3)).getRegisterA()==1 && ((TwoRegisterInstruction)a.get(3)).getRegisterB()==2 && register(a.get(4))==0 &&
            ((TwoRegisterInstruction)a.get(5)).getRegisterA()==1 && ((TwoRegisterInstruction)a.get(5)).getRegisterB()==0 && register(a.get(7))==0 && register(a.get(9))==0 &&
            ref(a.get(0)) instanceof MethodReference channelCall && channelCall.getDefiningClass().equals(KEY) && channelCall.getParameterTypes().isEmpty() && channelCall.getReturnType().equals("Z"),"community OR predicate changed");
        var keyChannel=definition((MethodReference)ref(a.get(0))); var k=instructions(keyChannel);
        require(!AccessFlags.STATIC.isSet(keyChannel.getAccessFlags()) && keyChannel.getImplementation().getRegisterCount()==3 && keyChannel.getImplementation().getTryBlocks().isEmpty() &&
            k.stream().map(Instruction::getOpcode).toList().equals(List.of(Opcode.IGET_OBJECT,Opcode.SGET_OBJECT,Opcode.IF_NE,Opcode.CONST_4,Opcode.RETURN,Opcode.CONST_4,Opcode.RETURN)) &&
            Objects.toString(ref(k.get(0))).equals(Objects.toString(ref(a.get(3)))) && ((TwoRegisterInstruction)k.get(0)).getRegisterA()==1 && ((TwoRegisterInstruction)k.get(0)).getRegisterB()==2 &&
            register(k.get(1))==0 && ((TwoRegisterInstruction)k.get(2)).getRegisterA()==1 && ((TwoRegisterInstruction)k.get(2)).getRegisterB()==0 && branch(keyChannel,2)==5 &&
            literal(k.get(3),0,1) && register(k.get(4))==0 && literal(k.get(5),0,0) && register(k.get(6))==0,"community channel check changed");
        keyField=Objects.toString(ref(a.get(3))); firstType=Objects.toString(ref(k.get(1))); secondType=Objects.toString(ref(a.get(4)));
        keyParts=List.of(id(keyPredicate),id(keyAny),id(keyChannel));
        }
        var subscribed=(FieldReference)ref(joinedCode.get(inlineJoined ? 10 : 5)); require(classes.values().stream().anyMatch(c->methods(c).stream().anyMatch(m->hasString(m,"thread.isSubscribed") && instructions(m).stream().anyMatch(i->Objects.toString(ref(i)).equals(subscribed.toString())))),"subscribed native label absent");
        var keyType=single(fieldsOf(KEY, keyField.substring(keyField.lastIndexOf(':')+1)),"typed key enum"); var enums=enumMembers(keyType.getType());
        String channelType=enums.get("COMMUNITY_CHANNEL").toString(), announcementType=enums.get("COMMUNITY_ANNOUNCEMENT_CHANNEL").toString();
        // The inlined test compares the two types in either order; 348's split test asks the channel type first.
        require(keyField.equals(keyType.toString()) && (inlineJoined ? !firstType.equals(secondType) && Set.of(firstType,secondType).equals(Set.of(channelType,announcementType)) :
            firstType.equals(channelType) && secondType.equals(announcementType)),"joined predicate accepts other types");
        String rowType=single(renderCode.stream().filter(i->i.getOpcode()==Opcode.INSTANCE_OF).map(i->((TypeReference)ref(i)).getType()).distinct().filter(t->fieldsOf(t,SUMMARY).size()==1).toList(),"native row type");
        var rowSummary=single(fieldsOf(rowType,SUMMARY),"native row summary");
        require(AccessFlags.PUBLIC.isSet(classes.get(rowType).getAccessFlags()) && AccessFlags.PUBLIC.isSet(rowSummary.getAccessFlags()) && AccessFlags.FINAL.isSet(rowSummary.getAccessFlags()) &&
            AccessFlags.PUBLIC.isSet(classes.get(predicate.getDefiningClass()).getAccessFlags()) && AccessFlags.PUBLIC.isSet(predicate.getAccessFlags()) && AccessFlags.STATIC.isSet(predicate.getAccessFlags()),"typed native contract inaccessible");
        var identityParts=new ArrayList<>(List.of(id(render),id(ctor),id(scopeGetter),id(folderOverride),rowSummary.toString(),id(predicate)));
        identityParts.addAll(keyParts);
        identityParts.add(requests.toString()); identityParts.add(prefix.toString());
        currentPath.forEach(f->identityParts.add(f.toString())); identityParts.add(id(folderGetter)); identityParts.add(folders.get("INBOX").toString());
        String identity=String.join("|",identityParts);
        return new CommunityInbox(invoke, identity);
        }
    }

    static final String INBOX_SUPPLIER = "Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;";
    static final String INBOX_ITEMS_TRACE = "ThreadListItemSupplierImplementation.getInboxItems";
    static final String INBOX_SUBSCRIBE_WARNING =
        "useSecondaryParentThreadKey set without a parentThreadKey; folder read falls back to the full Meta AI inbox";

    static String inboxString(Instruction i) {
        return i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr ? sr.getString() : null;
    }

    static List<String> inboxParams(MethodReference m) {
        return m.getParameterTypes().stream().map(CharSequence::toString).toList();
    }

    static boolean inboxLiteral(Instruction i, int register, int value) {
        return i.getOpcode() == Opcode.CONST_4 && register(i) == register && ((NarrowLiteralInstruction) i).getNarrowLiteral() == value;
    }

    /**
     * The chat list refresh route the patch proves, as "subscribe call|listed count", or null. The items read starts with
     * its trace outside any branch, the final supplier has one static subscribe call holding the folder warning, that call
     * creates its observer just before the observer's (supplier, int) constructor, and the observer's one list callback sets
     * one declared int to 5 or 1, which the items read checks. 586's subscribe call also takes a boolean.
     */
    /**
     * 586's listed-count update, size < limit ? 5 : 1: const/4 vR, 1 earlier in the same straight run, then
     * if-ge ..., <the write>; const/4 vR, 5; iput vR, supplier->F:I, with no write to vR and no jump landing between that
     * const and the branch. Mirrors isListedWrite in InboxRefresh.kt.
     */
    static boolean inboxListedWrite(List<Instruction> list, Set<Integer> targets, int at) {
        if (at < 3 || list.get(at).getOpcode() != Opcode.IPUT || !(((ReferenceInstruction) list.get(at)).getReference() instanceof FieldReference f) ||
            !INBOX_SUPPLIER.equals(f.getDefiningClass()) || !"I".equals(f.getType())) return false;
        int value = ((TwoRegisterInstruction) list.get(at)).getRegisterA();
        if (list.get(at - 2).getOpcode() != Opcode.IF_GE || !jumpsTo(list, at - 2, at) || !inboxLiteral(list.get(at - 1), value, 5)) return false;
        for (int i = at - 3; i >= 0; i--) {
            if (targets.contains(i + 1)) return false;
            var op = list.get(i).getOpcode();
            if (!(list.get(i) instanceof OneRegisterInstruction one)) continue;
            int written = one.getRegisterA();
            if (op.setsRegister() && (written == value || (op.setsWideRegister() && written + 1 == value))) return inboxLiteral(list.get(i), value, 1);
        }
        return false;
    }

    static String inboxRefreshRoute(Map<String, ClassDef> byType, Method items) {
        var code = instructions(items);
        if (!INBOX_SUPPLIER.equals(items.getDefiningClass()) || AccessFlags.STATIC.isSet(items.getAccessFlags()) ||
            !items.getParameterTypes().isEmpty() || !IMMUTABLE_LIST.equals(items.getReturnType()) || code.isEmpty() ||
            (code.get(0).getOpcode() != Opcode.CONST_STRING && code.get(0).getOpcode() != Opcode.CONST_STRING_JUMBO) ||
            !INBOX_ITEMS_TRACE.equals(inboxString(code.get(0))) || mediaTargets(items).contains(0)) return null;
        var supplier = byType.get(INBOX_SUPPLIER);
        if (supplier == null || !AccessFlags.FINAL.isSet(supplier.getAccessFlags())) return null;
        Method subscribe = null;
        for (var m : supplier.getMethods()) {
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) || !inboxParams(m).equals(List.of(INBOX_SUPPLIER, "Z")) ||
                instructions(m).stream().noneMatch(i -> INBOX_SUBSCRIBE_WARNING.equals(inboxString(i)))) continue;
            if (subscribe != null) return null;
            subscribe = m;
        }
        if (subscribe == null) return null;
        var body = instructions(subscribe);
        // The observer has a class of its own, built from the supplier and the subscription's generation. Mirrors OBSERVER_INIT in InboxRefresh.kt.
        int at = -1;
        for (int i = 0; i < body.size(); i++) {
            if (body.get(i).getOpcode() == Opcode.INVOKE_DIRECT && body.get(i) instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof MethodReference mr && "<init>".equals(mr.getName()) && "V".equals(mr.getReturnType()) &&
                inboxParams(mr).equals(List.of(INBOX_SUPPLIER, "I"))) {
                if (at >= 0) return null;
                at = i;
            }
        }
        if (at < 1 || body.get(at - 1).getOpcode() != Opcode.NEW_INSTANCE) return null;
        var init = (FiveRegisterInstruction) body.get(at);
        var observerType = ((TypeReference) ((ReferenceInstruction) body.get(at - 1)).getReference()).getType();
        if (init.getRegisterCount() != 3 || register(body.get(at - 1)) != init.getRegisterC() ||
            !observerType.equals(((MethodReference) ((ReferenceInstruction) body.get(at)).getReference()).getDefiningClass())) return null;
        var observer = byType.get(observerType);
        if (observer == null) return null;
        Method callback = null;
        for (var m : observer.getMethods()) {
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"V".equals(m.getReturnType()) ||
                !inboxParams(m).equals(List.of("Ljava/util/List;"))) continue;
            if (callback != null) return null;
            callback = m;
        }
        if (callback == null) return null;
        var list = instructions(callback);
        var targets = mediaTargets(callback);
        String listed = null, name = null;
        for (int k = 3; k < list.size(); k++) {
            if (!inboxListedWrite(list, targets, k)) continue;
            if (listed != null) return null;
            name = ((FieldReference) ((ReferenceInstruction) list.get(k)).getReference()).getName();
            listed = INBOX_SUPPLIER + "->" + name + ":I";
        }
        if (listed == null) return null;
        int declared = 0;
        for (var f : supplier.getFields())
            if (f.getName().equals(name) && "I".equals(f.getType()) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) declared++;
        boolean read = false;
        for (var i : code) if (i.getOpcode() == Opcode.IGET && listed.equals(ref(i))) read = true;
        return declared == 1 && read ? hookId(subscribe) + "|" + listed : null;
    }

    /**
     * The constructor of the holder Messenger keeps its downloaded emoji font in, or null. The getter reads the holder's
     * Typeface and returns it at once; the final holder has that Typeface, the font's File and one constructor taking both.
     */
    static String emojiFontHolder(Map<String, ClassDef> byType, Method getter) {
        var code = instructions(getter);
        var holders = new LinkedHashSet<String>();
        for (int i = 0; i + 1 < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.IGET_OBJECT && code.get(i) instanceof ReferenceInstruction ri &&
                ri.getReference() instanceof FieldReference fr && "Landroid/graphics/Typeface;".equals(fr.getType()) &&
                code.get(i + 1).getOpcode() == Opcode.RETURN_OBJECT && code.get(i) instanceof TwoRegisterInstruction read &&
                ((OneRegisterInstruction) code.get(i + 1)).getRegisterA() == read.getRegisterA()) holders.add(fr.getDefiningClass());
        }
        if (holders.size() != 1 || holders.contains(getter.getDefiningClass())) return null;
        var holder = byType.get(holders.iterator().next());
        if (holder == null || !AccessFlags.FINAL.isSet(holder.getAccessFlags())) return null;
        var fields = new ArrayList<String>();
        for (var f : holder.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) fields.add(f.getType());
        Collections.sort(fields);
        if (!fields.equals(List.of("Landroid/graphics/Typeface;", "Ljava/io/File;"))) return null;
        Method init = null;
        for (var m : holder.getMethods()) {
            if (!"<init>".equals(m.getName())) continue;
            if (init != null) return null;
            init = m;
        }
        if (init == null || !hookId(init).equals(holder.getType() + "-><init>(Landroid/graphics/Typeface;Ljava/io/File;)V")) return null;
        var body = instructions(init);
        if (body.isEmpty() || body.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !(body.get(0) instanceof ReferenceInstruction call) ||
            !(call.getReference() instanceof MethodReference mr) || !"Ljava/lang/Object;".equals(mr.getDefiningClass()) ||
            !"<init>".equals(mr.getName()) || mediaTargets(init).contains(1)) return null;
        return hookId(init);
    }

    static final String SNIPPET_MAKER = "Lcom/facebook/messaging/threadlist/plugins/core/threadsnippet/lastmessage/LastMessageSnippetImpl;";

    /**
     * The chat list snippet's constructor that Use system emoji passes a Like through (#34 follow-up), or null. Mirrors
     * likeSnippetInit in EmojiFont.kt: the one class LastMessageSnippetImpl builds from a CharSequence that names itself
     * LastMessageThreadSnippet, final, with that one field and one constructor.
     */
    static String likeSnippetInit(Map<String, ClassDef> byType) {
        var maker = byType.get(SNIPPET_MAKER);
        if (maker == null) return null;
        var built = new LinkedHashSet<String>();
        for (var m : maker.getMethods()) for (var i : instructions(m)) {
            if (i.getOpcode() == Opcode.INVOKE_DIRECT && i instanceof ReferenceInstruction ri && ri.getReference() instanceof MethodReference mr &&
                "<init>".equals(mr.getName()) && mr.getParameterTypes().size() == 1 &&
                "Ljava/lang/CharSequence;".equals(mr.getParameterTypes().get(0).toString())) built.add(mr.getDefiningClass());
        }
        var named = new ArrayList<ClassDef>();
        for (var type : built) {
            var cls = byType.get(type);
            if (cls == null) continue;
            boolean names = false;
            for (var m : cls.getMethods()) if ("toString".equals(m.getName())) for (var i : instructions(m))
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference s &&
                    s.getString().startsWith("LastMessageThreadSnippet(text=")) names = true;
            if (names) named.add(cls);
        }
        if (named.size() != 1) return null;
        var snippet = named.get(0);
        var fields = new ArrayList<String>();
        for (var f : snippet.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) fields.add(f.getType());
        Method init = null;
        for (var m : snippet.getMethods()) {
            if (!"<init>".equals(m.getName())) continue;
            if (init != null) return null;
            init = m;
        }
        if (!AccessFlags.FINAL.isSet(snippet.getAccessFlags()) || !fields.equals(List.of("Ljava/lang/CharSequence;")) || init == null ||
            !hookId(init).equals(snippet.getType() + "-><init>(Ljava/lang/CharSequence;)V")) return null;
        var body = instructions(init);
        if (body.isEmpty() || body.get(0).getOpcode() != Opcode.INVOKE_DIRECT || !(body.get(0) instanceof ReferenceInstruction call) ||
            !(call.getReference() instanceof MethodReference mr) || !"Ljava/lang/Object;".equals(mr.getDefiningClass()) ||
            !"<init>".equals(mr.getName()) || mediaTargets(init).contains(1) || init.getImplementation().getRegisterCount() - 2 + 1 > 15) return null;
        return hookId(init);
    }

    /**
     * 586's renderer asks a ()Z getter instead of loading the flag. The getter has to be the read alone: the config
     * object, the flag, an optional cast of another register, one (J)Z check handed the flag last, and its answer
     * returned as is. The config comes from a no-argument static call, or in family B from a static (I)Object call on
     * a constant, cast. Mirrors EmojiDrawer.kt's isEmojiDrawerGetter.
     */
    static boolean emojiDrawerGetter(Method method) {
        if (!"Z".equals(method.getReturnType()) || !method.getParameterTypes().isEmpty()) return false;
        var code = instructions(method);
        int fetch = emojiDrawerConfigFetch(code);
        if (fetch < 0 || (code.size() != fetch + 4 && code.size() != fetch + 5)) return false;
        if (code.get(fetch).getOpcode() != Opcode.CONST_WIDE || ((WideLiteralInstruction) code.get(fetch)).getWideLiteral() != EMOJI_DRAWER_FLAG) return false;
        int pair = ((OneRegisterInstruction) code.get(fetch)).getRegisterA();
        int call = fetch + 1;
        if (code.size() == fetch + 5) {
            if (code.get(call).getOpcode() != Opcode.CHECK_CAST) return false;
            int held = ((OneRegisterInstruction) code.get(call)).getRegisterA();
            if (held == pair || held == pair + 1) return false;
            call++;
        }
        if (!(code.get(call) instanceof FiveRegisterInstruction invoke) ||
            !Set.of(Opcode.INVOKE_STATIC, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL).contains(invoke.getOpcode()) ||
            !(((ReferenceInstruction) invoke).getReference() instanceof MethodReference check) || !"Z".equals(check.getReturnType()) ||
            check.getParameterTypes().isEmpty() || !"J".equals(check.getParameterTypes().get(check.getParameterTypes().size() - 1).toString())) return false;
        var arguments = List.of(invoke.getRegisterC(), invoke.getRegisterD(), invoke.getRegisterE(), invoke.getRegisterF(), invoke.getRegisterG())
            .subList(0, invoke.getRegisterCount());
        if (arguments.size() < 2 || !arguments.subList(arguments.size() - 2, arguments.size()).equals(List.of(pair, pair + 1))) return false;
        var result = code.get(call + 1);
        var back = code.get(call + 2);
        return result.getOpcode() == Opcode.MOVE_RESULT && back.getOpcode() == Opcode.RETURN &&
            ((OneRegisterInstruction) back).getRegisterA() == ((OneRegisterInstruction) result).getRegisterA();
    }

    /** How many instructions fetch the emoji drawer getter's config object, or -1 when it isn't fetched one of the two ways. */
    static int emojiDrawerConfigFetch(List<? extends Instruction> code) {
        if (code.size() > 1 && code.get(0) instanceof FiveRegisterInstruction first && first.getOpcode() == Opcode.INVOKE_STATIC &&
            first.getRegisterCount() == 0 && code.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT) return 2;
        if (code.size() < 4 || code.get(0).getOpcode() != Opcode.CONST || code.get(1).getOpcode() != Opcode.INVOKE_STATIC ||
            code.get(2).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(3).getOpcode() != Opcode.CHECK_CAST) return -1;
        var call = (FiveRegisterInstruction) code.get(1);
        if (!(((ReferenceInstruction) call).getReference() instanceof MethodReference target)) return -1;
        boolean shaped = call.getRegisterCount() == 1 && call.getRegisterC() == ((OneRegisterInstruction) code.get(0)).getRegisterA() &&
            target.getParameterTypes().size() == 1 && "I".equals(target.getParameterTypes().get(0).toString()) &&
            "Ljava/lang/Object;".equals(target.getReturnType()) &&
            ((OneRegisterInstruction) code.get(3)).getRegisterA() == ((OneRegisterInstruction) code.get(2)).getRegisterA();
        return shaped ? 4 : -1;
    }

    /**
     * Every method that loads the emoji drawer flag, but only when the one renderer that throws the anchor loads it
     * too, itself or through a call to an emojiDrawerGetter reader: a static one by its own id, an instance one
     * (family B) through an interface of its class. Mirrors EmojiDrawer.kt.
     */
    static List<Method> emojiDrawerReaders(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        var anchors = new ArrayList<Method>();
        var shared = new HashSet<String>();
        var getters = new HashSet<String>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            boolean reads = false, anchor = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) i).getWideLiteral() == EMOJI_DRAWER_FLAG) reads = true;
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                    EMOJI_DRAWER_ANCHOR.equals(sr.getString())) anchor = true;
            }
            if (reads) {
                readers.add(method);
                if (emojiDrawerGetter(method)) {
                    if (AccessFlags.STATIC.isSet(method.getAccessFlags())) getters.add(hookId(method));
                    else for (var iface : cls.getInterfaces()) shared.add(iface + "->" + method.getName() + "()Z");
                }
            }
            if (anchor) anchors.add(method);
        }
        if (anchors.size() != 1) return List.of();
        var anchor = hookId(anchors.get(0));
        boolean linked = readers.stream().anyMatch(reader -> hookId(reader).equals(anchor)) || instructions(anchors.get(0)).stream().anyMatch(i ->
            (i.getOpcode() == Opcode.INVOKE_STATIC && getters.contains(((ReferenceInstruction) i).getReference().toString())) ||
            (i.getOpcode() == Opcode.INVOKE_INTERFACE && shared.contains(((ReferenceInstruction) i).getReference().toString())));
        return linked ? readers : List.of();
    }

    /**
     * Every method that loads the search icon flag, but only when the one method that builds the top bar's search icon
     * reads it itself or calls a searchIconGetter reader. Mirrors SearchBar.kt's connectSearchBar.
     */
    static List<Method> searchIconReaders(List<ClassDef> classes) {
        var readers = new ArrayList<Method>();
        var anchors = new ArrayList<Method>();
        for (var cls : classes) for (var method : cls.getMethods()) {
            if (method.getImplementation() == null) continue;
            boolean reads = false, anchor = false;
            for (var i : method.getImplementation().getInstructions()) {
                if (i.getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) i).getWideLiteral() == SEARCH_ICON_FLAG) reads = true;
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                    SEARCH_ICON_ANCHOR.equals(sr.getString())) anchor = true;
            }
            if (reads) readers.add(method);
            if (anchor) anchors.add(method);
        }
        if (anchors.size() != 1) return List.of();
        var getters = readers.stream().filter(Inbox::searchIconGetter).map(CompatReport::hookId).collect(Collectors.toSet());
        // 587 reads the flag in the builder itself, 586 asks a shared getter.
        String anchorId = hookId(anchors.get(0));
        boolean linked = readers.stream().anyMatch(r -> hookId(r).equals(anchorId)) || instructions(anchors.get(0)).stream().anyMatch(i ->
            i.getOpcode() == Opcode.INVOKE_STATIC && getters.contains(((ReferenceInstruction) i).getReference().toString()));
        return linked ? readers : List.of();
    }

    /**
     * A static boolean method whose one flag read is its whole answer, as 586's shared getter is: the flag, a cast of
     * the config to its interface, that interface's check, and its answer returned. Mirrors SearchBar.kt's
     * isSearchIconGetter.
     */
    static boolean searchIconGetter(Method method) {
        if ((method.getAccessFlags() & AccessFlags.STATIC.getValue()) == 0 || !"Z".equals(method.getReturnType())) return false;
        var code = instructions(method);
        int at = -1;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.CONST_WIDE && ((WideLiteralInstruction) code.get(i)).getWideLiteral() == SEARCH_ICON_FLAG) {
                if (at >= 0) return false;
                at = i;
            }
        }
        if (at < 0) return false;
        int pair = ((OneRegisterInstruction) code.get(at)).getRegisterA();
        if (at + 1 >= code.size() || code.get(at + 1).getOpcode() != Opcode.CHECK_CAST) return false;
        int cast = ((OneRegisterInstruction) code.get(at + 1)).getRegisterA();
        int call = at + 2;
        if (call + 3 != code.size() || !(code.get(call) instanceof FiveRegisterInstruction invoke) || invoke.getRegisterCount() != 3 ||
            invoke.getRegisterD() != pair || invoke.getRegisterE() != pair + 1 || invoke.getOpcode() != Opcode.INVOKE_INTERFACE ||
            invoke.getRegisterC() != cast || cast == pair || cast == pair + 1) return false;
        // The config is cast to the interface that declares the check, and the check takes the flag and answers a boolean.
        var check = (MethodReference) ((ReferenceInstruction) invoke).getReference();
        if (!((ReferenceInstruction) code.get(at + 1)).getReference().toString().equals(check.getDefiningClass()) ||
            !"Z".equals(check.getReturnType()) ||
            !check.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of("J"))) return false;
        var result = code.get(call + 1);
        var back = code.get(call + 2);
        return result.getOpcode() == Opcode.MOVE_RESULT && back.getOpcode() == Opcode.RETURN &&
            ((OneRegisterInstruction) back).getRegisterA() == ((OneRegisterInstruction) result).getRegisterA();
    }
}
