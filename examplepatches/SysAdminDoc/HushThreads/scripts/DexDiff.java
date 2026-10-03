import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.ExceptionHandler;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.TryBlock;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchElement;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.Reference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;

import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * Names every method a patched APK does not share with the clean one it was built from, and prints
 * the register evidence for each: how many registers the method declares, and every instruction the
 * two bodies do not have in common.
 *
 * <p>The point of it is the last line of the report. A patch that writes into a register the method
 * never declared assembles happily and only fails when a device verifies the class, so every
 * instruction that was not in the clean body is checked against the register count of the method it
 * landed in. Methods the patch adds outright, which is where a hand-written bridge lives and where
 * the registers are chosen rather than inherited, are checked the same way: every one of them, the
 * helpers a patch adds to one of the host app's own classes as well as the extension's. Every
 * instruction of every changed and added method is also held to its method's count in the structural
 * pass, the upper half of each wide value it reads or writes included, and one out of range is a
 * finding there rather than a register the later checks step over.
 *
 * <p>Three things this deliberately does not leave to chance:
 *
 * <ul>
 *   <li>A wide instruction names one register and occupies two, so a destination that sets a wide
 *       register counts as reaching one higher than it names. Missing that would let a
 *       {@code const-wide} one short of the ceiling read as safe.
 *   <li>The highest register travels with the rendered line rather than being read back out of the
 *       text, because a host app can hold string constants that look like register names (the
 *       Facebook sibling's held {@code v4190} and {@code v20200906}, and parsing the text flagged
 *       five of them).
 *   <li>Absence of evidence is a failure, not a pass. A run that finds no changed methods, or no
 *       added methods of the extension's own, is comparing the wrong pair of files and says so
 *       instead of reporting nothing wrong.
 * </ul>
 *
 * <p>Branch targets and try-block ranges are part of a body's identity here, so a change that only
 * moves a jump or widens an exception range still shows up as a changed method.
 *
 * <p>Every changed and added method is also held to the structural rules the Facebook sibling's
 * crash reports came from (FroggoMorphePatches issues 3, 16 and 21): a branch or switch case that
 * lands inside an instruction ("target dex pc is not at instruction start"), an invoke whose
 * registers don't match what the callee takes, a parameter register read as the wrong kind (the
 * static and wide off-by-one), a register the body wrote at the wrong width (a narrow const left
 * where a const-wide was, which the Facebook sibling's AMOLED sweep did on its 580), a move-result
 * cut off from its invoke, and a try range or handler off an instruction boundary. A contract file
 * adds rules about the whole APK, in the grammar below: a call with exactly one call site, a stub
 * that has to call out before it returns, a hook that has to come first in a method, right after
 * one call, in place of one call or once in it, and a call nobody outside the extension may make.
 * Each kind came from one of the Facebook sibling's patches: its feed guard had to have one call
 * site, in addNewEdgeToCollection, because two guards stacked on that method is what broke Froggo's
 * builds. A start-call, next-call, sole-call or once-call rule names its method by the strings it
 * loads, and a shape where strings alone don't tell it apart, and exactly one of the host app's
 * methods may answer that: five held "FeedRefreshTriggerController" on the Facebook sibling's 580,
 * so a rule naming that string alone passed a hook in any of them, and its logo rule named one
 * string and counted calls in any method holding it. The device verifier stays the authority;
 * these catch the known shapes without a phone. A threads-feature rule also checks the selected
 * patch's exact host mutations and generated helpers against the stock APK.
 *
 *   java -cp &lt;cli jar&gt; DexDiff.java &lt;cleanApk&gt; &lt;patchedApk&gt; &lt;reportFile&gt;
 *       &lt;removalAllowlist&gt; [&lt;contracts&gt;]
 */
public class DexDiff {

    /** Anything under here is the bundle's own code rather than the host's. */
    private static final String OWN = "Lapp/morphe/";

    private static final class RemovalAllowlist {
        final Set<String> methods = new TreeSet<>();
        final Set<String> dexEntries = new TreeSet<>();
    }

    private static RemovalAllowlist readRemovalAllowlist(File file) throws Exception {
        if (!file.isFile()) throw new IllegalArgumentException("Removal allowlist not found: " + file);
        RemovalAllowlist allowlist = new RemovalAllowlist();
        int lineNumber = 0;
        for (String raw : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
            lineNumber++;
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            Set<String> target;
            String value;
            if (line.startsWith("method ")) {
                target = allowlist.methods;
                value = line.substring("method ".length()).trim();
            } else if (line.startsWith("dex ")) {
                target = allowlist.dexEntries;
                value = line.substring("dex ".length()).trim();
            } else {
                throw new IllegalArgumentException("Invalid removal allowlist line " + lineNumber
                        + ": expected method or dex");
            }
            if (value.isEmpty() || !target.add(value)) {
                throw new IllegalArgumentException("Invalid removal allowlist line " + lineNumber
                        + ": value is empty or duplicated");
            }
        }
        return allowlist;
    }

    /**
     * One rule about the whole APK.
     *
     * <ul>
     *   <li>"single-call &lt;method reference&gt; in &lt;caller method name&gt;": exactly one call
     *       site, there.
     *   <li>"first-call &lt;method reference&gt; on &lt;class&gt;": the method calls a method of
     *       &lt;class&gt; that takes no arguments before its first return or throw. A stub the
     *       patch filled does; one still answering its marker doesn't.
     *   <li>"first-call &lt;method reference&gt; on-type-named &lt;GraphQL type&gt;": the same, where
     *       the class is the one whose {@code getTypeName()} answers &lt;GraphQL type&gt; as a
     *       literal. For an accessor on a class Redex renames, which no contract can name, and
     *       exactly one class may answer the type.
     *   <li>"first-call &lt;method reference&gt; outside &lt;class prefix&gt;": the method calls a
     *       method of a class whose type doesn't start with &lt;class prefix&gt;, whatever it takes,
     *       before its first return or throw. For a stub the patch fills with a call to a method it
     *       found by what the method does, whose class is a Redex name and no model answering a type
     *       name. A stub still answering its marker makes no call, and one whose only call stays in
     *       the extension doesn't leave it.
     *   <li>"start-call &lt;method reference&gt; [in [static|instance] &lt;shape&gt;] holding
     *       &lt;string&gt; [&lt;string&gt; ...]": exactly one method outside the bundle's own code
     *       loads every one of the strings and has the shape, a descriptor such as
     *       {@code (Landroid/content/Context;*)Z} where * stands for any run of
     *       characters. That method calls the method reference, with nothing before the call but
     *       plain instructions (no other call, branch, switch, return or throw), and no other
     *       method loading the strings calls it.
     *   <li>"no-call &lt;method reference&gt; outside &lt;class prefix&gt;": no class but those whose
     *       type starts with &lt;class prefix&gt; calls it. For a call the patch sends to the
     *       extension everywhere, where the extension makes the real one and a call left anywhere
     *       else would undo what the patch is for.
     *   <li>"next-call &lt;method reference&gt; after &lt;method reference&gt; [in [static|instance]
     *       &lt;shape&gt;] holding &lt;string&gt; [&lt;string&gt; ...]": exactly one method outside the
     *       bundle's own code loads every one of the strings and has the shape, as for start-call.
     *       That method calls the first method once, no other host method calls it, and the
     *       instruction just before the call calls the second method, on the same first register.
     *       For a hook sent in place of one call of a known pair, so it can't drift onto another
     *       view, another call or another method holding the same strings.
     *   <li>"sole-call &lt;method reference&gt; replacing &lt;method reference&gt; [in [static|instance]
     *       &lt;shape&gt;] holding &lt;string&gt; [&lt;string&gt; ...]": exactly one method outside the
     *       bundle's own code loads every one of the strings and has the shape. It calls the first
     *       method once and the second not at all, no other host method calls the first, and that
     *       call reads the registers, in their order, that the clean build's one call to the
     *       second method there read. For a hook that takes one call's place: left out or left
     *       beside the call it stands in for, the call it replaces still happens, and on other
     *       registers the hook gets the wrong values.
     *   <li>"once-call &lt;method reference&gt; [in [static|instance] &lt;shape&gt;] holding &lt;string&gt;
     *       [&lt;string&gt; ...]": exactly one method outside the bundle's own code loads every one of
     *       the strings and has the shape, as for start-call. That method calls the method reference
     *       once, anywhere in its body, and no other host method calls it. For a hook that has to
     *       read what the method made first, so it can't come first, and follows no one call.
     * </ul>
     */
    /** The kind a first-call rule that names its class by GraphQL type is read into. */
    private static final String TYPED_FIRST_CALL = "first-call-typed";
    /** The kind a first-call rule that asks only for a call leaving a class prefix is read into. */
    private static final String OUTSIDE_FIRST_CALL = "first-call-outside";
    private static final Set<String> THREADS_FEATURES = Set.of(
            "hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust");

    private static final class Contract {
        final String kind;
        final String callee;
        final String target;
        /** For a next-call rule, the call that has to come just before; null for the others. */
        final String after;
        /** For a sole-call rule, the call the callee stands in for; null for the others. */
        final String replaced;
        /** start-call, next-call, sole-call and once-call: the strings its method loads, every one of them. */
        final List<String> strings;
        /** The same rules: whether its method is static, or null when the rule doesn't say. */
        final Boolean isStatic;
        /** The same rules: its method's descriptor, "*" for any run of characters, or null. */
        final String shape;

        Contract(String kind, String callee, String target) {
            this(kind, callee, target, null, null, List.of(), null, null);
        }

        Contract(String kind, String callee, String target, String after, String replaced, List<String> strings,
                Boolean isStatic, String shape) {
            this.kind = kind;
            this.callee = callee;
            this.target = target;
            this.after = after;
            this.replaced = replaced;
            this.strings = strings;
            this.isStatic = isStatic;
            this.shape = shape;
        }

        /** Whether this rule picks its method by strings and a shape: start-call, next-call, sole-call and once-call. */
        boolean picks() {
            return kind.equals("start-call") || kind.equals("next-call") || kind.equals("sole-call")
                    || kind.equals("once-call");
        }

        /** How a rule that picks its method reads in the contract file, from its kind on. */
        String rule() {
            StringBuilder b = new StringBuilder(kind).append(' ').append(callee);
            if (after != null) b.append(" after ").append(after);
            if (replaced != null) b.append(" replacing ").append(replaced);
            if (shape != null) {
                b.append(" in ");
                if (isStatic != null) b.append(isStatic ? "static " : "instance ");
                b.append(shape);
            }
            return b.append(" holding ").append(String.join(" ", strings)).toString();
        }

        /** Whether [m] has this rule's shape: its static flag and its descriptor. */
        boolean hasShape(Method m) {
            if (isStatic != null && AccessFlags.STATIC.isSet(m.getAccessFlags()) != isStatic) return false;
            if (shape == null) return true;
            StringBuilder descriptor = new StringBuilder("(");
            for (CharSequence p : m.getParameterTypes()) descriptor.append(p);
            descriptor.append(')').append(m.getReturnType());
            String[] pieces = shape.split("\\*", -1);
            StringBuilder pattern = new StringBuilder();
            for (int k = 0; k < pieces.length; k++) {
                if (k > 0) pattern.append(".*");
                pattern.append(java.util.regex.Pattern.quote(pieces[k]));
            }
            return descriptor.toString().matches(pattern.toString());
        }
    }

    /** How each rule that picks its method by strings and a shape is written, for the message a bad line gets. */
    private static final Map<String, String> PICKED_FORMS = Map.of(
            "start-call", "start-call <method reference>",
            "next-call", "next-call <method reference> after <method reference>",
            "sole-call", "sole-call <method reference> replacing <method reference>",
            "once-call", "once-call <method reference>");

    /**
     * A start-call, next-call, sole-call or once-call line: its method reference, the next-call's
     * "after &lt;method reference&gt;" or the sole-call's "replacing &lt;method reference&gt;", then "[in
     * [static|instance] &lt;shape&gt;] holding &lt;string&gt; [&lt;string&gt; ...]". Null when it isn't one.
     */
    private static Contract readPicked(String[] parts) {
        String kind = parts[0];
        if (parts.length < 2 || !parts[1].contains("->")) return null;
        int at = 2;
        String after = null;
        String replaced = null;
        if (kind.equals("next-call") || kind.equals("sole-call")) {
            String word = kind.equals("next-call") ? "after" : "replacing";
            if (parts.length < 4 || !parts[2].equals(word) || !parts[3].contains("->")) return null;
            if (kind.equals("next-call")) after = parts[3];
            else replaced = parts[3];
            at = 4;
        }
        Boolean isStatic = null;
        String shape = null;
        if (at < parts.length && parts[at].equals("in")) {
            at++;
            if (at < parts.length && (parts[at].equals("static") || parts[at].equals("instance"))) {
                isStatic = parts[at].equals("static");
                at++;
            }
            if (at >= parts.length || !parts[at].startsWith("(") || parts[at].indexOf(')') < 1) return null;
            shape = parts[at++];
        }
        if (at >= parts.length || !parts[at].equals("holding")) return null;
        List<String> strings = new ArrayList<>(Arrays.asList(parts).subList(at + 1, parts.length));
        if (strings.isEmpty() || new TreeSet<>(strings).size() != strings.size()) return null;
        return new Contract(kind, parts[1], String.join(" ", strings), after, replaced, strings, isStatic, shape);
    }

    private static List<Contract> readContracts(File file) throws Exception {
        List<Contract> contracts = new ArrayList<>();
        if (file == null) return contracts;
        if (!file.isFile()) throw new IllegalArgumentException("Contract file not found: " + file);
        int lineNumber = 0;
        for (String raw : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
            lineNumber++;
            String line = raw.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            String[] parts = line.split("\\s+");
            if (parts.length == 2 && parts[0].equals("threads-feature") && THREADS_FEATURES.contains(parts[1])) {
                contracts.add(new Contract(parts[0], parts[1], ""));
                continue;
            }
            String form = PICKED_FORMS.get(parts[0]);
            if (form != null) {
                Contract picked = readPicked(parts);
                if (picked == null) {
                    throw new IllegalArgumentException("Invalid contract line " + lineNumber + ": expected " + form
                            + " [in [static|instance] <(parameters)return>] holding <string> [<string> ...]");
                }
                contracts.add(picked);
                continue;
            }
            boolean singleCall = parts.length == 4 && parts[0].equals("single-call") && parts[2].equals("in");
            boolean firstCall = parts.length == 4 && parts[0].equals("first-call") && parts[2].equals("on")
                    && parts[3].startsWith("L") && parts[3].endsWith(";");
            boolean firstCallTyped = parts.length == 4 && parts[0].equals("first-call")
                    && parts[2].equals("on-type-named") && parts[3].matches("[A-Za-z][A-Za-z0-9_]*");
            boolean firstCallOutside = parts.length == 4 && parts[0].equals("first-call") && parts[2].equals("outside")
                    && parts[3].startsWith("L") && parts[3].endsWith("/");
            boolean noCall = parts.length == 4 && parts[0].equals("no-call") && parts[2].equals("outside")
                    && parts[3].startsWith("L") && parts[3].endsWith("/");
            if ((!singleCall && !firstCall && !firstCallTyped && !firstCallOutside && !noCall)
                    || !parts[1].contains("->")) {
                throw new IllegalArgumentException("Invalid contract line " + lineNumber
                        + ": expected single-call <method reference> in <caller method name>,"
                        + " first-call <method reference> on <class>,"
                        + " first-call <method reference> on-type-named <GraphQL type>,"
                        + " first-call <method reference> outside <package prefix ending in />,"
                        + " no-call <method reference> outside <package prefix ending in />,"
                        + " or start-call <method reference>, next-call <method reference> after <method reference>,"
                        + " sole-call <method reference> replacing <method reference>"
                        + " or once-call <method reference>, each then"
                        + " [in [static|instance] <(parameters)return>] holding <string> [<string> ...]");
            }
            String kind = firstCallTyped ? TYPED_FIRST_CALL : firstCallOutside ? OUTSIDE_FIRST_CALL : parts[0];
            contracts.add(new Contract(kind, parts[1], parts[3]));
        }
        return contracts;
    }

    /** Every instruction of a body with its code-unit address, and where the body ends. */
    private static final class Layout {
        final List<Instruction> instructions = new ArrayList<>();
        final List<Integer> addresses = new ArrayList<>();
        final Map<Integer, Instruction> byAddress = new HashMap<>();
        int size;

        Layout(MethodImplementation impl) {
            int address = 0;
            for (Instruction i : impl.getInstructions()) {
                instructions.add(i);
                addresses.add(address);
                byAddress.put(address, i);
                address += i.getCodeUnits();
            }
            size = address;
        }

        boolean isStart(int address) {
            return byAddress.containsKey(address);
        }
    }

    /** Registers a parameter of this type takes: two for long and double, one for anything else. */
    private static int slots(CharSequence type) {
        char c = type.charAt(0);
        return c == 'J' || c == 'D' ? 2 : 1;
    }

    /** The kind a value of this type has in a register: L object, W wide (low half), I narrow. */
    private static char kindOf(CharSequence type) {
        char c = type.charAt(0);
        if (c == 'J' || c == 'D') return 'W';
        if (c == 'L' || c == '[') return 'L';
        return 'I';
    }

    private static boolean isStaticInvoke(Opcode opcode) {
        return opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE;
    }

    /** The invoke kinds whose registers are the callee's receiver and parameters, in order. */
    private static boolean isPlainInvoke(Opcode opcode) {
        switch (opcode) {
            case INVOKE_VIRTUAL: case INVOKE_SUPER: case INVOKE_DIRECT: case INVOKE_STATIC:
            case INVOKE_INTERFACE: case INVOKE_VIRTUAL_RANGE: case INVOKE_SUPER_RANGE:
            case INVOKE_DIRECT_RANGE: case INVOKE_STATIC_RANGE: case INVOKE_INTERFACE_RANGE:
                return true;
            default:
                return false;
        }
    }

    /** The registers an invoke passes, in argument order. */
    private static int[] invokeRegisters(Instruction i) {
        if (i instanceof RegisterRangeInstruction) {
            RegisterRangeInstruction r = (RegisterRangeInstruction) i;
            int[] regs = new int[r.getRegisterCount()];
            for (int k = 0; k < regs.length; k++) regs[k] = r.getStartRegister() + k;
            return regs;
        }
        FiveRegisterInstruction r = (FiveRegisterInstruction) i;
        int[] all = { r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG() };
        int[] regs = new int[r.getRegisterCount()];
        System.arraycopy(all, 0, regs, 0, regs.length);
        return regs;
    }

    /**
     * For each instruction, the parameter registers some path from the entry may have written
     * before it runs, as bits counted from the first parameter register, or null where no path
     * reaches it. A register no path has written still holds its argument, so its kind is known.
     * An exception edge carries the state after the throwing instruction, which only adds writes,
     * so wherever a path is in doubt the check that reads this stays quiet.
     */
    private static BitSet[] parameterWrites(MethodImplementation impl, Layout layout, int firstParameter) {
        int count = layout.instructions.size();
        BitSet[] before = new BitSet[count];
        if (count == 0) return before;
        Map<Integer, Integer> indexAt = new HashMap<>();
        for (int k = 0; k < count; k++) indexAt.put(layout.addresses.get(k), k);
        Deque<Integer> work = new ArrayDeque<>();
        before[0] = new BitSet();
        work.add(0);
        while (!work.isEmpty()) {
            int k = work.poll();
            Instruction i = layout.instructions.get(k);
            Opcode opcode = i.getOpcode();
            int at = layout.addresses.get(k);
            BitSet after = (BitSet) before[k].clone();
            if (opcode.setsRegister() && i instanceof OneRegisterInstruction) {
                int destination = ((OneRegisterInstruction) i).getRegisterA();
                int last = destination + (opcode.setsWideRegister() ? 1 : 0);
                for (int r = Math.max(destination, firstParameter); r <= last; r++) after.set(r - firstParameter);
            }
            List<Integer> next = new ArrayList<>();
            if (opcode.canContinue()) next.add(at + i.getCodeUnits());
            if (i instanceof OffsetInstruction && opcode != Opcode.FILL_ARRAY_DATA) {
                int target = at + ((OffsetInstruction) i).getCodeOffset();
                if (opcode == Opcode.PACKED_SWITCH || opcode == Opcode.SPARSE_SWITCH) {
                    Instruction payload = layout.byAddress.get(target);
                    if (payload instanceof SwitchPayload) {
                        for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements()) {
                            next.add(at + element.getOffset());
                        }
                    }
                } else {
                    next.add(target);
                }
            }
            if (opcode.canThrow()) {
                for (TryBlock<? extends ExceptionHandler> block : impl.getTryBlocks()) {
                    int start = block.getStartCodeAddress();
                    if (at < start || at >= start + block.getCodeUnitCount()) continue;
                    for (ExceptionHandler handler : block.getExceptionHandlers()) {
                        next.add(handler.getHandlerCodeAddress());
                    }
                }
            }
            for (int address : next) {
                Integer successor = indexAt.get(address);
                if (successor == null) continue;
                if (before[successor] == null) {
                    before[successor] = (BitSet) after.clone();
                    work.add(successor);
                    continue;
                }
                BitSet merged = (BitSet) before[successor].clone();
                merged.or(after);
                if (!merged.equals(before[successor])) {
                    before[successor] = merged;
                    work.add(successor);
                }
            }
        }
        return before;
    }

    private static boolean isMoveResult(Opcode opcode) {
        return opcode == Opcode.MOVE_RESULT || opcode == Opcode.MOVE_RESULT_WIDE
                || opcode == Opcode.MOVE_RESULT_OBJECT;
    }

    /**
     * The kind each register holds before each instruction, along every path from the entry, or
     * null where no path reaches it: L an object, I a narrow value, Z a zero constant (narrow or
     * null), W and w the halves of a wide value, B and b the halves of one whose other half was
     * overwritten, C a register the paths that meet there disagree about, T unknown. The
     * parameters start with their declared kinds; constants, moves, move-results and the plain
     * object producers set theirs; a wide result sets a pair; anything else leaves T, which no
     * check reads. Where paths meet, the kinds join the way ART merges them (see join), so a pair
     * broken or a width changed on one arm of a branch is still a finding after the arms rejoin.
     * An exception edge carries the kinds from before the throwing instruction, as ART's does: the
     * exception leaves before the instruction writes anything.
     */
    private static char[][] registerKinds(MethodImplementation impl, Layout layout,
            Map<Integer, Character> parameterKind) {
        int count = layout.instructions.size();
        int registers = impl.getRegisterCount();
        char[][] before = new char[count][];
        if (count == 0) return before;
        Map<Integer, Integer> indexAt = new HashMap<>();
        for (int k = 0; k < count; k++) indexAt.put(layout.addresses.get(k), k);
        char[] entry = new char[registers];
        java.util.Arrays.fill(entry, 'T');
        for (Map.Entry<Integer, Character> p : parameterKind.entrySet()) {
            if (p.getKey() < registers) entry[p.getKey()] = p.getValue();
        }
        Deque<Integer> work = new ArrayDeque<>();
        before[0] = entry;
        work.add(0);
        while (!work.isEmpty()) {
            int k = work.poll();
            Instruction i = layout.instructions.get(k);
            Opcode opcode = i.getOpcode();
            int at = layout.addresses.get(k);
            char[] after = transfer(i, before[k]);
            List<Integer> next = new ArrayList<>();
            if (opcode.canContinue()) next.add(at + i.getCodeUnits());
            if (i instanceof OffsetInstruction && opcode != Opcode.FILL_ARRAY_DATA) {
                int target = at + ((OffsetInstruction) i).getCodeOffset();
                if (opcode == Opcode.PACKED_SWITCH || opcode == Opcode.SPARSE_SWITCH) {
                    Instruction payload = layout.byAddress.get(target);
                    if (payload instanceof SwitchPayload) {
                        for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements()) {
                            next.add(at + element.getOffset());
                        }
                    }
                } else {
                    next.add(target);
                }
            }
            List<Integer> handlers = new ArrayList<>();
            if (opcode.canThrow()) {
                for (TryBlock<? extends ExceptionHandler> block : impl.getTryBlocks()) {
                    int start = block.getStartCodeAddress();
                    if (at < start || at >= start + block.getCodeUnitCount()) continue;
                    for (ExceptionHandler handler : block.getExceptionHandlers()) {
                        handlers.add(handler.getHandlerCodeAddress());
                    }
                }
            }
            for (int address : next) flow(before, indexAt, work, address, after);
            for (int address : handlers) flow(before, indexAt, work, address, before[k]);
        }
        return before;
    }

    private static void flow(char[][] before, Map<Integer, Integer> indexAt, Deque<Integer> work,
            int address, char[] state) {
        Integer successor = indexAt.get(address);
        if (successor == null) return;
        if (before[successor] == null) {
            before[successor] = state.clone();
            work.add(successor);
            return;
        }
        boolean changed = false;
        char[] into = before[successor];
        for (int r = 0; r < into.length; r++) {
            char joined = join(into[r], state[r]);
            if (joined != into[r]) {
                into[r] = joined;
                changed = true;
            }
        }
        if (changed) work.add(successor);
    }

    /**
     * One register's kind where two paths meet, as ART merges it. A zero is a null or a zero, so it
     * takes the other side's object or narrow kind, and a pair broken on one path is broken. Any
     * other two known kinds make C, a conflict: ART lets a move copy one, and fails every other
     * read of it. T stays T, since a register this doesn't know is never judged.
     */
    private static char join(char a, char b) {
        if (a == b) return a;
        if (a == 'T' || b == 'T') return 'T';
        if (a == 'Z' && (b == 'L' || b == 'I')) return b;
        if (b == 'Z' && (a == 'L' || a == 'I')) return a;
        if ((a == 'W' && b == 'B') || (a == 'B' && b == 'W')) return 'B';
        if ((a == 'w' && b == 'b') || (a == 'b' && b == 'w')) return 'b';
        return 'C';
    }

    /** A narrow or object move: ART lets one copy a conflict, which fails only where it's used. */
    private static boolean copiesConflict(Opcode opcode) {
        switch (opcode) {
            case MOVE: case MOVE_FROM16: case MOVE_16:
            case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
                return true;
            default:
                return false;
        }
    }

    /** The kinds after one instruction. */
    private static char[] transfer(Instruction i, char[] in) {
        Opcode opcode = i.getOpcode();
        if (!opcode.setsRegister() || !(i instanceof OneRegisterInstruction)) return in;
        char[] out = in.clone();
        int a = ((OneRegisterInstruction) i).getRegisterA();
        // A move copies its source's kind, a conflict included, unless the read is already a
        // finding: then what it wrote is unknown, and the one mistake is reported once rather
        // than at every later use.
        if (opcode.setsWideRegister()) {
            char low = 'W', high = 'w';
            if (opcode == Opcode.MOVE_WIDE || opcode == Opcode.MOVE_WIDE_FROM16 || opcode == Opcode.MOVE_WIDE_16) {
                int b = ((TwoRegisterInstruction) i).getRegisterB();
                boolean wide = b + 1 < in.length && in[b] == 'W' && in[b + 1] == 'w';
                low = wide ? 'W' : 'T';
                high = wide ? 'w' : 'T';
            }
            write(out, a, low);
            write(out, a + 1, high);
            return out;
        }
        char kind;
        switch (opcode) {
            case CONST_4: case CONST_16: case CONST: case CONST_HIGH16:
                kind = ((com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction) i)
                        .getNarrowLiteral() == 0 ? 'Z' : 'I';
                break;
            case MOVE: case MOVE_FROM16: case MOVE_16: {
                int b = ((TwoRegisterInstruction) i).getRegisterB();
                char source = b < in.length ? in[b] : 'T';
                kind = source == 'C' || (source != 'T' && readableAs(source, 'I')) ? source : 'T';
                break;
            }
            case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16: {
                int b = ((TwoRegisterInstruction) i).getRegisterB();
                char source = b < in.length ? in[b] : 'T';
                kind = source == 'C' || (source != 'T' && readableAs(source, 'L')) ? source : 'T';
                break;
            }
            case MOVE_RESULT: case INSTANCE_OF: case ARRAY_LENGTH:
            case IGET: case IGET_BOOLEAN: case IGET_BYTE: case IGET_CHAR: case IGET_SHORT:
            case SGET: case SGET_BOOLEAN: case SGET_BYTE: case SGET_CHAR: case SGET_SHORT:
            case AGET: case AGET_BOOLEAN: case AGET_BYTE: case AGET_CHAR: case AGET_SHORT:
                kind = 'I';
                break;
            case MOVE_RESULT_OBJECT: case MOVE_EXCEPTION: case CONST_STRING: case CONST_STRING_JUMBO:
            case CONST_CLASS: case NEW_INSTANCE: case NEW_ARRAY: case CHECK_CAST:
            case IGET_OBJECT: case SGET_OBJECT: case AGET_OBJECT:
                kind = 'L';
                break;
            default:
                // Arithmetic, compares and conversions that don't set a pair set a narrow value.
                kind = arithmeticOperands(opcode) != null ? 'I' : 'T';
        }
        write(out, a, kind);
        return out;
    }

    /**
     * One register's new kind, and the wide pair it breaks if it was half of one. ART keeps the
     * half that wasn't written as it was and checks the pair where it's read, so the half left
     * behind can't be read as anything: writing over the upper half leaves the lower half as B,
     * and writing over the lower half leaves the upper half as b. A patch that borrows either half
     * of a live long as a free local does this, and so does a wide write that lands one register
     * below a live pair.
     */
    private static void write(char[] out, int register, char kind) {
        // Out of range has no kind to hold; the register check in structuralFindings reports it.
        if (register >= out.length) return;
        if (out[register] == 'W' && register + 1 < out.length && out[register + 1] == 'w' && kind != 'W') {
            out[register + 1] = 'b';
        }
        if (out[register] == 'w' && register > 0 && out[register - 1] == 'W' && kind != 'w') {
            out[register - 1] = 'B';
        }
        out[register] = kind;
    }

    /**
     * Whether a register of this kind can be read as that kind. T is never in doubt here; B, b, w
     * and C can't be read as anything, and W only as the pair it starts. E is what a test against
     * zero or an equality test takes: a narrow value or an object.
     */
    private static boolean readableAs(char have, char want) {
        if (have == 'T') return true;
        if (have == 'B') return false;
        switch (want) {
            case 'W': return have == 'W';
            case 'I': return have == 'I' || have == 'Z';
            case 'L': return have == 'L' || have == 'Z';
            case 'E': return have == 'I' || have == 'Z' || have == 'L';
            default: return true;
        }
    }

    private static final java.util.regex.Pattern WIDE_PAIR = java.util.regex.Pattern.compile(
            "(add|sub|mul|div|rem|and|or|xor)-(long|double)(/2addr)?|cmp-long|cmp[lg]-double");
    private static final java.util.regex.Pattern WIDE_SHIFT = java.util.regex.Pattern.compile(
            "(shl|shr|ushr)-long(/2addr)?");
    private static final java.util.regex.Pattern NARROW_PAIR = java.util.regex.Pattern.compile(
            "(add|sub|mul|div|rem|and|or|xor|shl|shr|ushr)-(int|float)(/2addr)?|cmp[lg]-float");
    private static final java.util.regex.Pattern NARROW_LITERAL = java.util.regex.Pattern.compile(
            "(add|rsub|mul|div|rem|and|or|xor|shl|shr|ushr)-int/lit(8|16)|rsub-int");
    private static final java.util.regex.Pattern WIDE_SINGLE = java.util.regex.Pattern.compile(
            "(neg|not)-(long|double)|(long|double)-to-(int|long|float|double)");
    private static final java.util.regex.Pattern NARROW_SINGLE = java.util.regex.Pattern.compile(
            "(neg|not)-(int|float)|(int|float)-to-(int|long|float|double|byte|char|short)");

    /** The kinds an arithmetic, compare or conversion instruction reads its operands as, or null. */
    private static char[] arithmeticOperands(Opcode opcode) {
        String name = opcode.name;
        if (WIDE_PAIR.matcher(name).matches()) return new char[]{'W', 'W'};
        if (WIDE_SHIFT.matcher(name).matches()) return new char[]{'W', 'I'};
        if (NARROW_PAIR.matcher(name).matches()) return new char[]{'I', 'I'};
        if (NARROW_LITERAL.matcher(name).matches() || NARROW_SINGLE.matcher(name).matches()) return new char[]{'I'};
        if (WIDE_SINGLE.matcher(name).matches()) return new char[]{'W'};
        return null;
    }

    private static void read(List<int[]> reads, int register, char kind) {
        reads.add(new int[]{register, kind});
    }

    /** Every register an instruction reads as a value, with the kind it reads it as. */
    private static List<int[]> valueReads(Instruction i) {
        List<int[]> reads = new ArrayList<>();
        Opcode opcode = i.getOpcode();
        switch (opcode) {
            case MOVE: case MOVE_FROM16: case MOVE_16:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'I');
                return reads;
            case MOVE_WIDE: case MOVE_WIDE_FROM16: case MOVE_WIDE_16:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'W');
                return reads;
            case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case RETURN:
            case SPUT: case SPUT_BOOLEAN: case SPUT_BYTE: case SPUT_CHAR: case SPUT_SHORT:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'I');
                return reads;
            case RETURN_WIDE: case SPUT_WIDE:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'W');
                return reads;
            case RETURN_OBJECT: case SPUT_OBJECT:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'L');
                return reads;
            case IPUT: case IPUT_BOOLEAN: case IPUT_BYTE: case IPUT_CHAR: case IPUT_SHORT:
                read(reads, ((TwoRegisterInstruction) i).getRegisterA(), 'I');
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case IPUT_WIDE:
                read(reads, ((TwoRegisterInstruction) i).getRegisterA(), 'W');
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case IPUT_OBJECT:
                read(reads, ((TwoRegisterInstruction) i).getRegisterA(), 'L');
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case IGET: case IGET_BOOLEAN: case IGET_BYTE: case IGET_CHAR: case IGET_SHORT:
            case IGET_WIDE: case IGET_OBJECT:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case APUT: case APUT_BOOLEAN: case APUT_BYTE: case APUT_CHAR: case APUT_SHORT:
            case APUT_WIDE: case APUT_OBJECT: {
                ThreeRegisterInstruction t = (ThreeRegisterInstruction) i;
                char value = opcode == Opcode.APUT_WIDE ? 'W' : opcode == Opcode.APUT_OBJECT ? 'L' : 'I';
                read(reads, t.getRegisterA(), value);
                read(reads, t.getRegisterB(), 'L');
                read(reads, t.getRegisterC(), 'I');
                return reads;
            }
            case AGET: case AGET_BOOLEAN: case AGET_BYTE: case AGET_CHAR: case AGET_SHORT:
            case AGET_WIDE: case AGET_OBJECT: {
                ThreeRegisterInstruction t = (ThreeRegisterInstruction) i;
                read(reads, t.getRegisterB(), 'L');
                read(reads, t.getRegisterC(), 'I');
                return reads;
            }
            // Each register as ART's verifier checks it. A test against zero or for equality takes
            // a narrow value or an object, an ordering, a switch or a new array's size takes a
            // narrow value, and a lock, a throw, a cast, a type test, or an array to measure or
            // fill takes an object. An equality test's two registers also have to agree, which
            // structuralFindings checks as a pair.
            case IF_EQZ: case IF_NEZ:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'E');
                return reads;
            case IF_EQ: case IF_NE:
                read(reads, ((TwoRegisterInstruction) i).getRegisterA(), 'E');
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'E');
                return reads;
            case IF_LTZ: case IF_GEZ: case IF_GTZ: case IF_LEZ:
            case PACKED_SWITCH: case SPARSE_SWITCH:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'I');
                return reads;
            case IF_LT: case IF_GE: case IF_GT: case IF_LE:
                read(reads, ((TwoRegisterInstruction) i).getRegisterA(), 'I');
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'I');
                return reads;
            case MONITOR_ENTER: case MONITOR_EXIT: case THROW: case CHECK_CAST: case FILL_ARRAY_DATA:
                read(reads, ((OneRegisterInstruction) i).getRegisterA(), 'L');
                return reads;
            case INSTANCE_OF: case ARRAY_LENGTH:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'L');
                return reads;
            case NEW_ARRAY:
                read(reads, ((TwoRegisterInstruction) i).getRegisterB(), 'I');
                return reads;
            case FILLED_NEW_ARRAY: case FILLED_NEW_ARRAY_RANGE: {
                // Each element as the array holds it: an object, or a narrow value.
                Reference type = ((ReferenceInstruction) i).getReference();
                if (!(type instanceof TypeReference)) return reads;
                char element = kindOf(((TypeReference) type).getType().substring(1));
                for (int register : invokeRegisters(i)) read(reads, register, element);
                return reads;
            }
            default:
                break;
        }
        char[] operands = arithmeticOperands(opcode);
        if (operands == null) return reads;
        int[] registers;
        if (i instanceof ThreeRegisterInstruction) {
            registers = new int[]{((ThreeRegisterInstruction) i).getRegisterB(), ((ThreeRegisterInstruction) i).getRegisterC()};
        } else if (i instanceof TwoRegisterInstruction && opcode.name.endsWith("/2addr")) {
            registers = new int[]{((TwoRegisterInstruction) i).getRegisterA(), ((TwoRegisterInstruction) i).getRegisterB()};
        } else if (i instanceof TwoRegisterInstruction) {
            registers = new int[]{((TwoRegisterInstruction) i).getRegisterB()};
        } else {
            return reads;
        }
        for (int k = 0; k < Math.min(operands.length, registers.length); k++) read(reads, registers[k], operands[k]);
        return reads;
    }

    /**
     * The structural findings for one method, each as "category: detail". The parameter check
     * reads a register only where no path from the entry has written it, where the value can
     * only be the argument the method was called with.
     */
    private static List<String> structuralFindings(ClassDef cd, Method m) {
        List<String> findings = new ArrayList<>();
        MethodImplementation impl = m.getImplementation();
        if (impl == null) return findings;
        Layout layout = new Layout(impl);

        // Registers: every one an instruction names, and the upper half of each wide value it
        // writes or reads, has to be below the count the method declares. ART checks that for each
        // instruction before it follows any path, so one out of range fails the class wherever it
        // sits, reachable or not. The kind checks further down have no kind to give such a
        // register and step over it, which is why it's a finding here, once for each instruction.
        int registerCount = impl.getRegisterCount();
        for (int k = 0; k < layout.instructions.size(); k++) {
            Instruction i = layout.instructions.get(k);
            int reach = reach(i);
            if (reach >= registerCount) {
                findings.add("register: " + i.getOpcode().name + " at " + layout.addresses.get(k) + " reaches v" + reach
                        + ", and the method declares " + registerCount + (registerCount == 1 ? " register" : " registers"));
            }
        }

        // A move-result takes the result of the instruction right before it, so an instruction
        // injected between an invoke and its move-result leaves nothing to take.
        for (int k = 0; k < layout.instructions.size(); k++) {
            if (!isMoveResult(layout.instructions.get(k).getOpcode())) continue;
            if (k == 0 || !layout.instructions.get(k - 1).getOpcode().setsResult()) {
                findings.add("result: " + layout.instructions.get(k).getOpcode().name + " at "
                        + layout.addresses.get(k) + " does not follow an invoke");
            }
        }

        // Branches and switch cases.
        for (int k = 0; k < layout.instructions.size(); k++) {
            Instruction i = layout.instructions.get(k);
            if (!(i instanceof OffsetInstruction)) continue;
            int at = layout.addresses.get(k);
            int target = at + ((OffsetInstruction) i).getCodeOffset();
            Opcode opcode = i.getOpcode();
            if (target == at && opcode != Opcode.GOTO_32) {
                findings.add("branch: " + opcode.name + " at " + at + " branches to itself");
                continue;
            }
            if (!layout.isStart(target)) {
                findings.add("branch: " + opcode.name + " at " + at + " targets " + target
                        + ", which is not the start of an instruction");
                continue;
            }
            Instruction payload = layout.byAddress.get(target);
            if (opcode == Opcode.PACKED_SWITCH || opcode == Opcode.SPARSE_SWITCH) {
                if (!(payload instanceof SwitchPayload)) {
                    findings.add("branch: " + opcode.name + " at " + at + " points at " + target
                            + ", which is not a switch payload");
                    continue;
                }
                // Each switch reads its own kind of table, and ART checks the table's signature
                // against the switch ("wrong signature for switch table").
                Opcode wanted = opcode == Opcode.PACKED_SWITCH ? Opcode.PACKED_SWITCH_PAYLOAD : Opcode.SPARSE_SWITCH_PAYLOAD;
                if (payload.getOpcode() != wanted) {
                    findings.add("branch: " + opcode.name + " at " + at + " points at " + target + ", a "
                            + payload.getOpcode().name + " rather than the " + wanted.name + " it reads");
                    continue;
                }
                for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements()) {
                    int caseTarget = at + element.getOffset();
                    if (!layout.isStart(caseTarget)) {
                        findings.add("branch: " + opcode.name + " at " + at + " sends case "
                                + element.getKey() + " to " + caseTarget
                                + ", which is not the start of an instruction");
                        continue;
                    }
                    String bad = badLanding(layout.byAddress.get(caseTarget));
                    if (bad != null) {
                        findings.add("branch: " + opcode.name + " at " + at + " sends case " + element.getKey()
                                + " to " + caseTarget + ", " + bad + ", which a branch may not land on");
                    }
                }
            } else if (opcode == Opcode.FILL_ARRAY_DATA) {
                if (!(payload instanceof ArrayPayload)) {
                    findings.add("branch: fill-array-data at " + at + " points at " + target
                            + ", which is not an array payload");
                }
            } else {
                String bad = badLanding(payload);
                if (bad != null) {
                    findings.add("branch: " + opcode.name + " at " + at + " targets " + target + ", " + bad
                            + ", which a branch may not land on");
                }
            }
        }

        // Try ranges and handlers.
        for (TryBlock<? extends ExceptionHandler> block : impl.getTryBlocks()) {
            int start = block.getStartCodeAddress();
            int end = start + block.getCodeUnitCount();
            if (block.getCodeUnitCount() <= 0) {
                findings.add("try: a try range at " + start + " covers nothing");
            }
            if (!layout.isStart(start)) {
                findings.add("try: a try range starts at " + start + ", which is not the start of an instruction");
            }
            if (end > layout.size || (end != layout.size && !layout.isStart(end))) {
                findings.add("try: a try range ends at " + end + ", which is not an instruction boundary");
            }
            for (ExceptionHandler handler : block.getExceptionHandlers()) {
                int address = handler.getHandlerCodeAddress();
                if (!layout.isStart(address)) {
                    findings.add("try: a handler for " + handler.getExceptionType() + " is at "
                            + address + ", which is not the start of an instruction");
                } else if (isMoveResult(layout.byAddress.get(address).getOpcode())) {
                    findings.add("try: a handler for " + handler.getExceptionType() + " starts with a move-result at "
                            + address);
                } else if (isPayload(layout.byAddress.get(address))) {
                    findings.add("try: a handler for " + handler.getExceptionType() + " starts at a payload at "
                            + address);
                }
            }
        }

        // Invokes: as many registers as the callee takes, and each wide argument in a pair.
        for (int k = 0; k < layout.instructions.size(); k++) {
            Instruction i = layout.instructions.get(k);
            Opcode opcode = i.getOpcode();
            if (!isPlainInvoke(opcode) || !(i instanceof ReferenceInstruction)
                    || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) continue;
            MethodReference callee = (MethodReference) ((ReferenceInstruction) i).getReference();
            List<Character> expected = expectedArguments(opcode, callee);
            int[] regs = invokeRegisters(i);
            int at = layout.addresses.get(k);
            if (regs.length != expected.size()) {
                findings.add("invoke: " + opcode.name + " at " + at + " passes " + regs.length
                        + (regs.length == 1 ? " register" : " registers") + " to " + callee
                        + ", which takes " + expected.size());
                continue;
            }
            for (int a = 0; a < regs.length; a++) {
                if (expected.get(a) == 'w' && regs[a] != regs[a - 1] + 1) {
                    findings.add("invoke: " + opcode.name + " at " + at + " splits a wide argument of "
                            + callee + " across v" + regs[a - 1] + " and v" + regs[a]);
                }
            }
        }

        // Parameters: registerCount minus the ins, then this, then each parameter in order.
        boolean isStatic = AccessFlags.STATIC.isSet(m.getAccessFlags());
        int ins = isStatic ? 0 : 1;
        for (CharSequence p : m.getParameterTypes()) ins += slots(p);
        int firstParameter = impl.getRegisterCount() - ins;
        if (firstParameter < 0) {
            findings.add("parameter: declares " + impl.getRegisterCount() + " registers but its parameters need " + ins);
            return findings;
        }
        Map<Integer, Character> parameterKind = new HashMap<>();
        int register = firstParameter;
        if (!isStatic) parameterKind.put(register++, 'L');
        for (CharSequence p : m.getParameterTypes()) {
            char kind = kindOf(p);
            parameterKind.put(register, kind);
            if (kind == 'W') parameterKind.put(register + 1, 'w');
            register += slots(p);
        }

        // Kinds: a read of a register that every path gives the wrong kind. Where no path has
        // written the register it still holds its argument, and the finding is the parameter
        // layout's (the static and wide off-by-one); otherwise the body wrote the wrong width,
        // such as a narrow const left where a const-wide was.
        BitSet[] writes = parameterWrites(impl, layout, firstParameter);
        char[][] kinds = registerKinds(impl, layout, parameterKind);
        for (int k = 0; k < layout.instructions.size(); k++) {
            if (kinds[k] == null || writes[k] == null) continue;
            Instruction i = layout.instructions.get(k);
            Opcode opcode = i.getOpcode();
            int at = layout.addresses.get(k);

            for (int[] read : valueReads(i)) {
                // A register out of range is already a register finding for this instruction.
                if (read[0] >= kinds[k].length) continue;
                char have = kinds[k][read[0]];
                if (readableAs(have, (char) read[1]) || (have == 'C' && copiesConflict(opcode))) continue;
                findings.add(origin(read[0], firstParameter, writes[k], have) + opcode.name + " at " + at
                        + " reads v" + read[0] + ", which holds " + describe(have)
                        + ", as " + describe((char) read[1]));
            }

            // An equality test compares two objects or two narrow values, and a zero may stand
            // for either. Each register passes the read above on its own, so an int tested
            // against an object is only caught as a pair; ART refuses it ("args to if-eq/if-ne
            // must both be references or integral").
            if (opcode == Opcode.IF_EQ || opcode == Opcode.IF_NE) {
                int first = ((TwoRegisterInstruction) i).getRegisterA();
                int second = ((TwoRegisterInstruction) i).getRegisterB();
                if (first < kinds[k].length && second < kinds[k].length) {
                    char a = kinds[k][first];
                    char b = kinds[k][second];
                    if ((a == 'I' && b == 'L') || (a == 'L' && b == 'I')) {
                        findings.add("width: " + opcode.name + " at " + at + " compares v" + first + ", which holds "
                                + describe(a) + ", with v" + second + ", which holds " + describe(b));
                    }
                }
            }

            if (!isPlainInvoke(opcode) || !(i instanceof ReferenceInstruction)
                    || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) continue;
            MethodReference callee = (MethodReference) ((ReferenceInstruction) i).getReference();
            List<Character> expected = expectedArguments(opcode, callee);
            int[] regs = invokeRegisters(i);
            if (regs.length != expected.size()) continue;
            for (int a = 0; a < regs.length; a++) {
                char want = expected.get(a);
                // The upper half of a wide argument is checked with its pair, and a register out
                // of range is already a register finding for this instruction.
                if (want == 'w' || regs[a] >= kinds[k].length) continue;
                char have = kinds[k][regs[a]];
                if (!readableAs(have, want)) {
                    findings.add(origin(regs[a], firstParameter, writes[k], have) + opcode.name + " at " + at
                            + " passes v" + regs[a] + ", which holds " + describe(have) + ", where "
                            + callee + " takes " + describe(want));
                }
            }
        }

        // A move-exception takes the exception a handler caught, so only a throw may reach it.
        // Falling into one from the instruction above is what ART calls flowing through to it,
        // and the method's entry reaches one at the very start the same way.
        if (!layout.instructions.isEmpty() && layout.instructions.get(0).getOpcode() == Opcode.MOVE_EXCEPTION) {
            findings.add("try: move-exception at 0 is reached from the method's entry");
        }
        for (int k = 1; k < layout.instructions.size(); k++) {
            if (layout.instructions.get(k).getOpcode() != Opcode.MOVE_EXCEPTION) continue;
            Instruction above = layout.instructions.get(k - 1);
            if (kinds[k - 1] != null && above.getOpcode().canContinue()) {
                findings.add("try: move-exception at " + layout.addresses.get(k) + " is reached by falling through from "
                        + above.getOpcode().name + " at " + layout.addresses.get(k - 1));
            }
        }

        // A payload is data, and ART fails the class wherever flow reaches one. A branch, a case
        // or a handler sent to one is reported above; falling into one from the instruction above
        // it, which a return or goto removed from before a switch table leaves, and a payload at
        // the very start are the other ways in.
        if (!layout.instructions.isEmpty() && isPayload(layout.instructions.get(0))) {
            findings.add("branch: the payload at 0 is reached from the method's entry");
        }
        for (int k = 1; k < layout.instructions.size(); k++) {
            if (!isPayload(layout.instructions.get(k))) continue;
            Instruction above = layout.instructions.get(k - 1);
            if (kinds[k - 1] != null && above.getOpcode().canContinue()) {
                findings.add("branch: the payload at " + layout.addresses.get(k) + " is reached by falling through from "
                        + above.getOpcode().name + " at " + layout.addresses.get(k - 1));
            }
        }

        // Flow may not run off the end of the code either. A method whose last return was removed
        // or nopped leaves its last instruction able to continue into nothing, and ART refuses the
        // class ("Execution can walk off end of code area").
        if (!layout.instructions.isEmpty()) {
            int last = layout.instructions.size() - 1;
            Instruction end = layout.instructions.get(last);
            if (kinds[last] != null && !isPayload(end) && end.getOpcode().canContinue()) {
                findings.add("branch: " + end.getOpcode().name + " at " + layout.addresses.get(last)
                        + " runs off the end of the code");
            }
        }
        return findings;
    }

    /**
     * The highest register an instruction touches: every register it names, the upper half of a
     * wide value it writes, and the upper half of each wide value it reads (valueReads knows which
     * operands those are, opcode by opcode). -1 for an instruction with no register.
     */
    private static int reach(Instruction i) {
        int high = -1;
        if (i instanceof RegisterRangeInstruction) {
            RegisterRangeInstruction r = (RegisterRangeInstruction) i;
            high = r.getStartRegister() + r.getRegisterCount() - 1;
        } else if (i instanceof FiveRegisterInstruction) {
            for (int register : invokeRegisters(i)) high = Math.max(high, register);
        } else if (i instanceof ThreeRegisterInstruction) {
            ThreeRegisterInstruction r = (ThreeRegisterInstruction) i;
            high = Math.max(r.getRegisterA(), Math.max(r.getRegisterB(), r.getRegisterC()));
        } else if (i instanceof TwoRegisterInstruction) {
            TwoRegisterInstruction r = (TwoRegisterInstruction) i;
            high = Math.max(r.getRegisterA(), r.getRegisterB());
        } else if (i instanceof OneRegisterInstruction) {
            high = ((OneRegisterInstruction) i).getRegisterA();
        }
        if (i.getOpcode().setsWideRegister() && i instanceof OneRegisterInstruction) {
            high = Math.max(high, ((OneRegisterInstruction) i).getRegisterA() + 1);
        }
        for (int[] read : valueReads(i)) {
            if (read[1] == 'W') high = Math.max(high, read[0] + 1);
        }
        return high;
    }

    /**
     * "parameter" for a register that still holds its argument on every path, else "width". A
     * broken pair or a conflict is always the body's doing, even on an argument's register.
     */
    private static String origin(int register, int firstParameter, BitSet written, char have) {
        if (have == 'B' || have == 'b' || have == 'C') return "width: ";
        boolean argument = register >= firstParameter && !written.get(register - firstParameter);
        return argument ? "parameter: " : "width: ";
    }

    /** A switch or array payload: data inside the code, which ART fails the moment flow reaches it. */
    private static boolean isPayload(Instruction i) {
        return i instanceof SwitchPayload || i instanceof ArrayPayload;
    }

    /**
     * What a branch or switch case may not land on, or null: ART refuses a move-result or
     * move-exception there, and a payload is data ("encountered data table in instruction stream").
     */
    private static String badLanding(Instruction landing) {
        if (landing == null) return null;
        if (isPayload(landing)) return "a payload";
        Opcode opcode = landing.getOpcode();
        if (isMoveResult(opcode)) return "a move-result";
        if (opcode == Opcode.MOVE_EXCEPTION) return "a move-exception";
        return null;
    }

    /** The kind of each register an invoke passes: the receiver, then each parameter's slots. */
    private static List<Character> expectedArguments(Opcode opcode, MethodReference callee) {
        List<Character> expected = new ArrayList<>();
        if (!isStaticInvoke(opcode)) expected.add('L');
        for (CharSequence p : callee.getParameterTypes()) {
            expected.add(kindOf(p));
            if (slots(p) == 2) expected.add('w');
        }
        return expected;
    }

    private static String describe(char kind) {
        switch (kind) {
            case 'L': return "an object";
            case 'W': return "a wide value";
            case 'w': return "the upper half of a wide value";
            case 'B': return "the lower half of a wide value whose upper half was overwritten";
            case 'b': return "the upper half of a wide value whose lower half was overwritten";
            case 'C': return "a different kind depending on the path taken";
            case 'Z': return "a zero constant";
            case 'E': return "a narrow value or an object";
            default: return "a narrow value";
        }
    }

    /**
     * Holds every changed and added method of the patched APK to the structural rules, and counts
     * each contract's call sites across the whole APK. Returns method signature to findings, with
     * contract results under the pseudo-method "contract". [clean] is the build the patched one
     * came from, which a sole-call rule reads the call its hook replaced out of. [fresh] holds the
     * prints of each wanted method's definitions that the clean build doesn't have; a definition
     * the clean build has body for body, a copy in another dex entry the patch left alone, isn't
     * checked again.
     */
    private static Map<String, List<String>> structuralPass(File apk, File clean, Set<String> wanted,
            Map<String, List<String>> fresh, List<Contract> contracts) throws Exception {
        Map<String, List<String>> out = new TreeMap<>();
        Map<String, List<String>> unchecked = new HashMap<>();
        for (Map.Entry<String, List<String>> e : fresh.entrySet()) unchecked.put(e.getKey(), new ArrayList<>(e.getValue()));
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        Map<String, List<String>> callSites = new LinkedHashMap<>();
        // first-call: the method, and the first call it makes on the class before it returns, or
        // an empty string when it makes none there.
        Map<String, String> firstCalls = new HashMap<>();
        Map<String, String> firstCallTargets = new HashMap<>();
        // first-call on-type-named: the method, and the first call it makes on any class, whose
        // class is held afterwards to the classes whose getTypeName() answers the type.
        Map<String, String> typedFirstCallTargets = new HashMap<>();
        Map<String, Set<String>> typeNamedClasses = new HashMap<>();
        // first-call outside: the method, and the class prefix its first call has to leave.
        Map<String, String> outsideFirstCallTargets = new HashMap<>();
        // start-call, next-call, sole-call and once-call: for each rule, every method outside the
        // bundle's own code that loads all of its strings, with whether that method has the rule's shape. The
        // rules' own strings are the only ones collected, so a method is read once.
        List<Contract> pickRules = new ArrayList<>();
        Map<Contract, List<Holder>> holders = new LinkedHashMap<>();
        Set<String> pickStrings = new HashSet<>();
        // And every method outside the bundle's own code that calls such a rule's method, to say
        // where a hook went when it isn't in the method its rule picks, or went there as well.
        Map<String, List<String>> hookCallers = new HashMap<>();
        // no-call: the package prefix whose classes may call the method, and the methods of every
        // other class that do.
        Map<String, String> noCallInside = new HashMap<>();
        Map<String, List<String>> noCallSites = new LinkedHashMap<>();
        for (Contract contract : contracts) {
            if (contract.kind.equals("threads-feature")) continue;
            if (contract.kind.equals("single-call")) callSites.put(contract.callee, new ArrayList<>());
            else if (contract.kind.equals("first-call")) firstCallTargets.put(contract.callee, contract.target);
            else if (contract.kind.equals(TYPED_FIRST_CALL)) {
                typedFirstCallTargets.put(contract.callee, contract.target);
                typeNamedClasses.put(contract.target, new TreeSet<>());
            } else if (contract.kind.equals(OUTSIDE_FIRST_CALL)) {
                outsideFirstCallTargets.put(contract.callee, contract.target);
            } else if (contract.kind.equals("no-call")) {
                noCallInside.put(contract.callee, contract.target);
                noCallSites.put(contract.callee, new ArrayList<>());
            } else {
                pickRules.add(contract);
                holders.put(contract, new ArrayList<>());
                pickStrings.addAll(contract.strings);
                hookCallers.put(contract.callee, new ArrayList<>());
            }
        }
        MultiDexContainer<? extends DexFile> container =
                DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cd : container.getEntry(entry).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    String s = sig(cd, m);
                    List<String> left = wanted.contains(s) ? unchecked.get(s) : null;
                    if (left != null && left.remove(print(m, digest))) {
                        List<String> findings = structuralFindings(cd, m);
                        if (!findings.isEmpty()) out.computeIfAbsent(s, k -> new ArrayList<>()).addAll(findings);
                    }
                    String firstCallOn = firstCallTargets.get(s);
                    if (firstCallOn != null) firstCalls.put(s, firstCallBeforeReturn(m, firstCallOn));
                    if (typedFirstCallTargets.containsKey(s)) firstCalls.put(s, firstCallBeforeReturn(m, null));
                    String leaving = outsideFirstCallTargets.get(s);
                    if (leaving != null) firstCalls.put(s, firstCallOutside(m, leaving));
                    if (!typeNamedClasses.isEmpty()) recordTypeNamed(cd, m, typeNamedClasses);
                    if (!pickRules.isEmpty() && !cd.getType().startsWith(OWN)) {
                        recordHolders(s, m, pickRules, pickStrings, holders);
                    }
                    if ((callSites.isEmpty() && noCallSites.isEmpty() && hookCallers.isEmpty())
                            || m.getImplementation() == null) continue;
                    for (Instruction i : m.getImplementation().getInstructions()) {
                        if (!(i instanceof ReferenceInstruction)) continue;
                        Reference r = ((ReferenceInstruction) i).getReference();
                        if (!(r instanceof MethodReference)) continue;
                        List<String> sites = callSites.get(r.toString());
                        if (sites != null) sites.add(s);
                        String inside = noCallInside.get(r.toString());
                        if (inside != null && !cd.getType().startsWith(inside)) noCallSites.get(r.toString()).add(s);
                        List<String> callers = hookCallers.get(r.toString());
                        if (callers != null && !cd.getType().startsWith(OWN) && !callers.contains(s)) callers.add(s);
                    }
                }
            }
        }
        List<String> contractFindings = new ArrayList<>();
        for (Contract contract : contracts) {
            if (contract.kind.equals("threads-feature")) continue;
            if (contract.picks()) {
                checkPicked(contract, holders.get(contract), hookCallers.get(contract.callee), clean, contractFindings);
                continue;
            }
            if (contract.kind.equals("no-call")) {
                List<String> left = noCallSites.get(contract.callee);
                System.out.println("[diff] contract no-call " + contract.callee + " outside " + contract.target + ": "
                        + left.size() + " call site" + (left.size() == 1 ? "" : "s")
                        + (left.isEmpty() ? "" : ", in " + String.join(", ", left)));
                if (!left.isEmpty()) {
                    contractFindings.add("contract: " + contract.callee + " is still called outside "
                            + contract.target + ", in " + String.join(", ", left));
                }
                continue;
            }
            if (contract.kind.equals("first-call")) {
                String call = firstCalls.get(contract.callee);
                String rule = "contract first-call " + contract.callee;
                if (call == null) {
                    System.out.println("[diff] " + rule + ": not in the APK");
                    contractFindings.add("contract: " + contract.callee + " is not in the APK, so nothing calls "
                            + contract.target + " from it");
                } else if (call.isEmpty()) {
                    System.out.println("[diff] " + rule + ": no call on " + contract.target + " before its first return");
                    contractFindings.add("contract: " + contract.callee + " returns before it calls a method of "
                            + contract.target + " that takes no arguments, so the patch didn't fill it");
                } else {
                    System.out.println("[diff] " + rule + ": calls " + call + " before its first return");
                }
                continue;
            }
            if (contract.kind.equals(OUTSIDE_FIRST_CALL)) {
                String call = firstCalls.get(contract.callee);
                String rule = "contract first-call " + contract.callee + " outside " + contract.target;
                if (call == null) {
                    System.out.println("[diff] " + rule + ": not in the APK");
                    contractFindings.add("contract: " + contract.callee + " is not in the APK, so nothing outside "
                            + contract.target + " is called from it");
                } else if (call.isEmpty()) {
                    System.out.println("[diff] " + rule + ": no call outside it before its first return");
                    contractFindings.add("contract: " + contract.callee + " returns before it calls a method outside "
                            + contract.target + ", so the patch didn't fill it");
                } else {
                    System.out.println("[diff] " + rule + ": calls " + call + " before its first return");
                }
                continue;
            }
            if (contract.kind.equals(TYPED_FIRST_CALL)) {
                String call = firstCalls.get(contract.callee);
                Set<String> named = typeNamedClasses.get(contract.target);
                String rule = "contract first-call " + contract.callee + " on-type-named " + contract.target;
                String owner = call == null || call.isEmpty() ? null : call.substring(0, call.indexOf("->"));
                if (named.size() != 1) {
                    System.out.println("[diff] " + rule + ": " + named.size() + " classes answer it");
                    contractFindings.add("contract: " + named.size() + " classes answer getTypeName() with \""
                            + contract.target + "\", and exactly one must" + (named.isEmpty() ? "" : ": " + String.join(", ", named)));
                } else if (call == null) {
                    System.out.println("[diff] " + rule + ": not in the APK");
                    contractFindings.add("contract: " + contract.callee + " is not in the APK, so nothing calls "
                            + named.iterator().next() + " from it");
                } else if (owner == null) {
                    System.out.println("[diff] " + rule + ": no call before its first return");
                    contractFindings.add("contract: " + contract.callee + " returns before it calls a method of "
                            + named.iterator().next() + " that takes no arguments, so the patch didn't fill it");
                } else if (!named.contains(owner)) {
                    System.out.println("[diff] " + rule + ": calls " + call + ", not a method of " + named.iterator().next());
                    contractFindings.add("contract: " + contract.callee + " calls " + call + " first, not a method of "
                            + named.iterator().next() + ", the class answering \"" + contract.target + "\"");
                } else {
                    System.out.println("[diff] " + rule + ": calls " + call + " before its first return");
                }
                continue;
            }
            List<String> sites = callSites.get(contract.callee);
            System.out.println("[diff] contract " + contract.callee + ": " + sites.size() + " call site"
                    + (sites.size() == 1 ? "" : "s") + (sites.isEmpty() ? "" : ", in " + String.join(", ", sites)));
            if (sites.size() != 1) {
                contractFindings.add("contract: " + contract.callee + " has " + sites.size()
                        + " call sites, and must have exactly one, in " + contract.target
                        + (sites.isEmpty() ? "" : ": " + String.join(", ", sites)));
            } else if (!sites.get(0).contains("->" + contract.target + "(")) {
                contractFindings.add("contract: " + contract.callee + " is called from " + sites.get(0)
                        + ", not from " + contract.target);
            }
        }
        if (!contractFindings.isEmpty()) out.put("contract", contractFindings);
        return out;
    }

    /** Where a method calls a start-call rule's method: not at all, first thing, or later. */
    private static final int NOT_CALLED = 0;
    private static final int LATER = 1;
    private static final int FIRST = 2;

    /**
     * A method outside the bundle's own code that loads every string of a start-call, next-call,
     * sole-call or once-call rule: its signature, whether it has the rule's shape, and the method
     * itself, which the rule reads again once it knows which one it picked.
     */
    private static final class Holder {
        final String method;
        final boolean shaped;
        final Method m;

        Holder(String method, boolean shaped, Method m) {
            this.method = method;
            this.shaped = shaped;
            this.m = m;
        }
    }

    /** Adds [m] to each rule whose strings it loads, every one of them. */
    private static void recordHolders(String s, Method m, List<Contract> rules, Set<String> wanted,
            Map<Contract, List<Holder>> holders) {
        if (m.getImplementation() == null) return;
        Set<String> held = null;
        for (Instruction i : m.getImplementation().getInstructions()) {
            if (!(i instanceof ReferenceInstruction)) continue;
            Reference r = ((ReferenceInstruction) i).getReference();
            if (!(r instanceof StringReference) || !wanted.contains(((StringReference) r).getString())) continue;
            if (held == null) held = new HashSet<>();
            held.add(((StringReference) r).getString());
        }
        if (held == null) return;
        for (Contract rule : rules) {
            if (held.containsAll(rule.strings)) holders.get(rule).add(new Holder(s, rule.hasShape(m), m));
        }
    }

    /**
     * Holds a start-call, next-call, sole-call or once-call rule to the patched APK. Exactly one of
     * [holders] has the rule's shape, and it calls the rule's method; [callers] are the host methods
     * that call that method anywhere. Then each kind asks its own questions: start-call that no other
     * holder calls it and that the call comes first; once-call that no other host method calls it and
     * that it's the method's one call there; next-call that as well, right after the call it pairs
     * with and on the same register; sole-call that it's the method's one call, that the call it
     * stands in for is gone, and that it reads what that call read in [clean].
     */
    private static void checkPicked(Contract contract, List<Holder> holders, List<String> callers, File clean,
            List<String> findings) throws Exception {
        String rule = "contract " + contract.rule();
        String held = describePicked(contract);
        List<String> shaped = new ArrayList<>();
        Holder only = null;
        for (Holder holder : holders) {
            if (!holder.shaped) continue;
            shaped.add(holder.method);
            only = holder;
        }
        if (shaped.size() != 1) {
            // None, and the method moved or lost a string; several, and the rule can't tell the
            // right one from the others, so a hook in any of them would pass.
            System.out.println("[diff] " + rule + ": " + shaped.size() + " methods answer it" + named(shaped));
            findings.add("contract: " + shaped.size() + " methods hold " + held + ", and exactly one"
                    + " must, so the rule can't say which one calls " + contract.callee + named(shaped));
            return;
        }
        List<Instruction> body = instructions(only.m);
        List<Integer> sites = callSites(body, contract.callee);
        // Where else the hook went. A start-call rule looks among the methods holding its strings,
        // since the two tray rules send the same call to two adapters. A next-call, sole-call or
        // once-call hook belongs to one method, so a second call anywhere is one too many.
        List<String> elsewhere = new ArrayList<>();
        if (contract.kind.equals("start-call")) {
            for (Holder holder : holders) {
                if (holder != only && !elsewhere.contains(holder.method)
                        && !callSites(instructions(holder.m), contract.callee).isEmpty()) elsewhere.add(holder.method);
            }
        } else {
            for (String caller : callers) if (!caller.equals(only.method)) elsewhere.add(caller);
        }
        if (sites.isEmpty()) {
            System.out.println("[diff] " + rule + ": not called in " + only.method
                    + (callers.isEmpty() ? "" : "; called in " + String.join(", ", callers)));
            findings.add("contract: " + contract.callee + " is not called in " + only.method
                    + ", the one method holding " + held
                    + (callers.isEmpty() ? "" : "; the host methods that call it: " + String.join(", ", callers)));
        } else if (!elsewhere.isEmpty()) {
            System.out.println("[diff] " + rule + ": called in " + only.method + " and in " + String.join(", ", elsewhere));
            findings.add("contract: " + contract.callee + " is called in " + String.join(", ", elsewhere)
                    + " as well as in " + only.method + ", the one method holding " + held);
        } else if (contract.kind.equals("start-call")) {
            if (callOf(only.m, contract.callee) != FIRST) {
                System.out.println("[diff] " + rule + ": not first in " + only.method);
                findings.add("contract: " + contract.callee + " is called in " + only.method
                        + ", but after a call, branch, switch, return or throw, not first");
            } else {
                System.out.println("[diff] " + rule + ": first in " + only.method);
            }
        } else if (sites.size() > 1) {
            System.out.println("[diff] " + rule + ": " + sites.size() + " call sites in " + only.method);
            findings.add("contract: " + contract.callee + " has " + sites.size() + " call sites in " + only.method
                    + ", and must have exactly one");
        } else if (contract.kind.equals("once-call")) {
            System.out.println("[diff] " + rule + ": once in " + only.method);
        } else if (contract.kind.equals("next-call")) {
            int at = sites.get(0);
            Instruction before = at == 0 ? null : body.get(at - 1);
            String previous = before != null && before.getOpcode().name.startsWith("invoke")
                    && before instanceof ReferenceInstruction ? ((ReferenceInstruction) before).getReference().toString() : null;
            int register = firstRegister(body.get(at));
            int previousRegister = before == null ? -1 : firstRegister(before);
            if (!contract.after.equals(previous)) {
                System.out.println("[diff] " + rule + ": after " + (previous == null ? "no call" : previous) + " in " + only.method);
                findings.add("contract: " + contract.callee + " is called in " + only.method
                        + ", but not right after " + contract.after);
            } else if (previousRegister != register) {
                System.out.println("[diff] " + rule + ": on v" + register + ", after a call on v" + previousRegister
                        + " in " + only.method);
                findings.add("contract: " + contract.callee + " is called in " + only.method + " on v" + register
                        + ", not on v" + previousRegister + ", the register " + contract.after + " is made on");
            } else {
                System.out.println("[diff] " + rule + ": right after it on v" + register + " in " + only.method);
            }
        } else if (!callSites(body, contract.replaced).isEmpty()) {
            System.out.println("[diff] " + rule + ": " + only.method + " still calls " + contract.replaced);
            findings.add("contract: " + only.method + " still calls " + contract.replaced + ", which "
                    + contract.callee + " stands in for");
        } else {
            // What the hook reads, against what the call it took the place of read in the clean
            // build: the one such call there, on the same registers in the same order.
            List<Integer> hook = callRegisters(body.get(sites.get(0)));
            List<List<Integer>> was = cleanCallRegisters(clean, only.method, contract.replaced);
            if (was.size() == 1 && was.get(0).equals(hook)) {
                System.out.println("[diff] " + rule + ": in place of it on " + registerList(hook) + " in " + only.method);
            } else {
                String there = was.size() == 1 ? "on " + registerList(was.get(0)) : was.size() + " times, not once";
                System.out.println("[diff] " + rule + ": on " + registerList(hook) + " in " + only.method
                        + ", where the clean build calls it " + there);
                findings.add("contract: " + contract.callee + " is called in " + only.method + " on "
                        + registerList(hook) + ", but the clean build calls " + contract.replaced + " there " + there);
            }
        }
    }

    /** [m]'s instructions, in order. */
    private static List<Instruction> instructions(Method m) {
        List<Instruction> body = new ArrayList<>();
        if (m.getImplementation() != null) for (Instruction i : m.getImplementation().getInstructions()) body.add(i);
        return body;
    }

    /** The index in [body] of each invoke of [callee]. */
    private static List<Integer> callSites(List<Instruction> body, String callee) {
        List<Integer> sites = new ArrayList<>();
        for (int k = 0; k < body.size(); k++) {
            Instruction i = body.get(k);
            if (i.getOpcode().name.startsWith("invoke") && i instanceof ReferenceInstruction
                    && ((ReferenceInstruction) i).getReference().toString().equals(callee)) sites.add(k);
        }
        return sites;
    }

    /** The registers an invoke passes, in order, as a list. */
    private static List<Integer> callRegisters(Instruction i) {
        List<Integer> registers = new ArrayList<>();
        for (int register : invokeRegisters(i)) registers.add(register);
        return registers;
    }

    /** "v2, v1" for [registers]. */
    private static String registerList(List<Integer> registers) {
        List<String> named = new ArrayList<>();
        for (int register : registers) named.add("v" + register);
        return String.join(", ", named);
    }

    /**
     * The registers of each call to [callee] that [method] makes in [clean], in every dex entry
     * defining it. Only its own class's methods are read.
     */
    private static List<List<Integer>> cleanCallRegisters(File clean, String method, String callee) throws Exception {
        String type = method.substring(0, method.indexOf("->"));
        List<List<Integer>> calls = new ArrayList<>();
        MultiDexContainer<? extends DexFile> container = DexFileFactory.loadDexContainer(clean, Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cd : container.getEntry(entry).getDexFile().getClasses()) {
                if (!cd.getType().equals(type)) continue;
                for (Method m : cd.getMethods()) {
                    if (!sig(cd, m).equals(method)) continue;
                    List<Instruction> body = instructions(m);
                    for (int at : callSites(body, callee)) calls.add(callRegisters(body.get(at)));
                }
            }
        }
        return calls;
    }

    /**
     * FIRST when [m]'s first call to [callee] has only plain instructions before it (no other
     * call, branch, switch, return or throw), LATER when it calls it after one, NOT_CALLED when it
     * doesn't call it at all.
     */
    private static int callOf(Method m, String callee) {
        boolean plainSoFar = true;
        boolean called = false;
        for (Instruction i : m.getImplementation().getInstructions()) {
            String name = i.getOpcode().name;
            if (name.startsWith("invoke") && i instanceof ReferenceInstruction
                    && ((ReferenceInstruction) i).getReference().toString().equals(callee)) {
                if (plainSoFar) return FIRST;
                called = true;
            }
            if (name.startsWith("invoke") || name.startsWith("return") || name.startsWith("goto")
                    || name.startsWith("if-") || name.endsWith("-switch") || name.equals("throw")) {
                plainSoFar = false;
            }
        }
        return called ? LATER : NOT_CALLED;
    }

    /** A picking rule's strings as a finding names them, and its shape when it has one. */
    private static String describePicked(Contract rule) {
        List<String> quoted = new ArrayList<>();
        for (String s : rule.strings) quoted.add("\"" + s + "\"");
        String strings = quoted.size() == 1 ? quoted.get(0)
                : String.join(", ", quoted.subList(0, quoted.size() - 1)) + " and " + quoted.get(quoted.size() - 1);
        if (rule.shape == null) return strings;
        return strings + " with the shape " + (rule.isStatic == null ? "" : rule.isStatic ? "static " : "instance ") + rule.shape;
    }

    /** ": " and the first eight of [methods], or nothing for none. */
    private static String named(List<String> methods) {
        if (methods.isEmpty()) return "";
        List<String> shown = methods.subList(0, Math.min(8, methods.size()));
        return ": " + String.join(", ", shown) + (methods.size() > shown.size() ? " and " + (methods.size() - shown.size()) + " more" : "");
    }

    /** The first register an invoke names, or -1 for an instruction that isn't one. */
    private static int firstRegister(Instruction i) {
        if (i instanceof RegisterRangeInstruction) return ((RegisterRangeInstruction) i).getStartRegister();
        if (i instanceof FiveRegisterInstruction && ((FiveRegisterInstruction) i).getRegisterCount() > 0) {
            return ((FiveRegisterInstruction) i).getRegisterC();
        }
        return -1;
    }

    /**
     * Adds [cd] to the classes of each type name its {@code getTypeName()} loads as a literal, for
     * the type names a contract asks about.
     */
    private static void recordTypeNamed(ClassDef cd, Method m, Map<String, Set<String>> typeNamedClasses) {
        if (!m.getName().equals("getTypeName") || !m.getReturnType().equals("Ljava/lang/String;")
                || !m.getParameterTypes().isEmpty() || m.getImplementation() == null) {
            return;
        }
        for (Instruction i : m.getImplementation().getInstructions()) {
            if (!(i instanceof ReferenceInstruction)) continue;
            Reference r = ((ReferenceInstruction) i).getReference();
            if (!(r instanceof StringReference)) continue;
            Set<String> classes = typeNamedClasses.get(((StringReference) r).getString());
            if (classes != null) classes.add(cd.getType());
        }
    }

    /**
     * The first call [m] makes, before any return or throw in its instruction order, to a method of
     * [owner], or of any class when [owner] is null, that takes no arguments, or an empty string
     * when there is none. A filled stub makes that call first thing; the stub's own body, left after
     * it, only answers a marker.
     */
    private static String firstCallBeforeReturn(Method m, String owner) {
        if (m.getImplementation() == null) return "";
        for (Instruction i : m.getImplementation().getInstructions()) {
            String name = i.getOpcode().name;
            if (name.startsWith("return") || name.equals("throw")) return "";
            if (!(i instanceof ReferenceInstruction) || !name.startsWith("invoke")) continue;
            Reference r = ((ReferenceInstruction) i).getReference();
            if (r instanceof MethodReference
                    && (owner == null || ((MethodReference) r).getDefiningClass().equals(owner))
                    && ((MethodReference) r).getParameterTypes().isEmpty()) {
                return r.toString();
            }
        }
        return "";
    }

    /**
     * The first call [m] makes, before any return or throw in its instruction order, to a method of
     * a class whose type doesn't start with [prefix], whatever it takes, or an empty string when
     * there is none. A call into the extension on the way there doesn't count, and doesn't stop the
     * search.
     */
    private static String firstCallOutside(Method m, String prefix) {
        if (m.getImplementation() == null) return "";
        for (Instruction i : m.getImplementation().getInstructions()) {
            String name = i.getOpcode().name;
            if (name.startsWith("return") || name.equals("throw")) return "";
            if (!(i instanceof ReferenceInstruction) || !name.startsWith("invoke")) continue;
            Reference r = ((ReferenceInstruction) i).getReference();
            if (r instanceof MethodReference && !((MethodReference) r).getDefiningClass().startsWith(prefix)) {
                return r.toString();
            }
        }
        return "";
    }

    private static Set<String> dexEntries(File apk) throws Exception {
        MultiDexContainer<? extends DexFile> container =
                DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        return new TreeSet<>(container.getDexEntryNames());
    }

    /**
     * Signature -> the print of each of its definitions ("registerCount:bodyHash"), sorted and
     * joined with a space, for every method of an APK.
     *
     * <p>A signature can be defined in more than one dex entry. The Facebook sibling's 580 split
     * bundle, merged, carries the in-app browser's standalone dex twice (lib/arm64-v8a/libhelium_standalone.dex.so
     * and assets/heliumcore/helium_standalone.dex.force-store), and 480 of its methods are in
     * classes*.dex too, 212 of them with other bodies. dexlib2 reads the entries in name order, and
     * keyed one body to a signature, the last copy stood for every one: the browser's copy in lib/
     * hid whatever a patch did to the classes*.dex one, and read against base.apk, which has no
     * such copy, those 212 came out changed. So every definition counts, and a signature is changed
     * when the multiset of its definitions' prints is.
     */
    private static Map<String, String> fingerprintAll(File apk) throws Exception {
        Map<String, String> out = new HashMap<>(1 << 20);
        MultiDexContainer<? extends DexFile> container =
                DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cd : container.getEntry(entry).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) out.merge(sig(cd, m), print(m, digest), DexDiff::joinPrints);
            }
        }
        return out;
    }

    /**
     * What keeps [merged] from carrying every classes*.dex at [base]'s root byte for byte, and no
     * other classes*.dex there: "lacks", "changes" and "adds" with the entry names, or nothing.
     *
     * <p>The comparison reads a bundle's merge, which carries no signature, while Meta's signer is
     * checked on base.apk and the device half runs base.apk. The CLI's merger copies base.apk's
     * classes*.dex as they are; other dex a merge carries (the Facebook sibling's 580 in-app
     * browser's, from split_heliumcore.apk, twice) came from the splits under other names.
     */
    private static List<String> rootDexMismatch(File base, File merged) throws Exception {
        Map<String, String> baseDex = rootDexDigests(base);
        Map<String, String> mergedDex = rootDexDigests(merged);
        if (baseDex.isEmpty()) return List.of("was handed a " + base.getName() + " with no classes*.dex to hold it to");
        List<String> lacks = new ArrayList<>(), changes = new ArrayList<>(), adds = new ArrayList<>();
        for (Map.Entry<String, String> e : baseDex.entrySet()) {
            String other = mergedDex.get(e.getKey());
            if (other == null) lacks.add(e.getKey());
            else if (!other.equals(e.getValue())) changes.add(e.getKey());
        }
        for (String name : mergedDex.keySet()) if (!baseDex.containsKey(name)) adds.add(name);
        List<String> said = new ArrayList<>();
        if (!lacks.isEmpty()) said.add("lacks " + String.join(", ", lacks));
        if (!changes.isEmpty()) said.add("changes " + String.join(", ", changes));
        if (!adds.isEmpty()) said.add("adds " + String.join(", ", adds));
        return said;
    }

    /** classes*.dex entry name at an APK's root -> the SHA-256 of its bytes. */
    private static Map<String, String> rootDexDigests(File apk) throws Exception {
        Map<String, String> out = new TreeMap<>();
        try (java.util.zip.ZipFile zip = new java.util.zip.ZipFile(apk)) {
            for (java.util.zip.ZipEntry entry : java.util.Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes\\d*\\.dex")) continue;
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                try (java.io.InputStream in = zip.getInputStream(entry)) {
                    byte[] buffer = new byte[1 << 16];
                    for (int n; (n = in.read(buffer)) > 0; ) digest.update(buffer, 0, n);
                }
                out.put(entry.getName(), java.util.HexFormat.of().formatHex(digest.digest()));
            }
        }
        return out;
    }

    /** One definition's "registerCount:bodyHash": its register count and its rendered body's hash. */
    private static String print(Method m, MessageDigest digest) throws Exception {
        MethodImplementation impl = m.getImplementation();
        StringBuilder body = new StringBuilder();
        int registers = 0;
        if (impl != null) {
            registers = impl.getRegisterCount();
            for (Instruction i : impl.getInstructions()) body.append(render(i)).append('\n');
            for (String t : tryBlocks(impl)) body.append(t).append('\n');
        }
        digest.reset();
        byte[] hash = digest.digest(body.toString().getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for (int k = 0; k < 8; k++) hex.append(String.format("%02x", hash[k]));
        return registers + ":" + hex;
    }

    /** Two joined print lists as one, sorted, so the same definitions compare equal in any order. */
    private static String joinPrints(String a, String b) {
        List<String> all = new ArrayList<>(prints(a));
        all.addAll(prints(b));
        java.util.Collections.sort(all);
        return String.join(" ", all);
    }

    /** The prints fingerprintAll joined for one signature, one per definition; none for null. */
    private static List<String> prints(String joined) {
        return joined == null ? List.of() : Arrays.asList(joined.split(" "));
    }

    /** How many of fingerprintAll's signatures have more than one definition. */
    private static int multiplyDefined(Map<String, String> prints) {
        int count = 0;
        for (String joined : prints.values()) if (joined.indexOf(' ') >= 0) count++;
        return count;
    }

    /** The items of [a] that [b] doesn't hold, counting duplicates. */
    private static <T> List<T> without(List<T> a, List<T> b) {
        List<T> left = new ArrayList<>(b);
        List<T> out = new ArrayList<>();
        for (T item : a) if (!left.remove(item)) out.add(item);
        return out;
    }

    /** Signature -> the rendered body of each of its definitions, in dex entry order, for the named methods only. */
    private static Map<String, List<List<String>>> bodiesOf(File apk, Set<String> wanted) throws Exception {
        Map<String, List<List<String>>> out = new LinkedHashMap<>();
        MultiDexContainer<? extends DexFile> container =
                DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : container.getDexEntryNames()) {
            for (ClassDef cd : container.getEntry(entry).getDexFile().getClasses()) {
                for (Method m : cd.getMethods()) {
                    String s = sig(cd, m);
                    if (!wanted.contains(s)) continue;
                    List<String> body = new ArrayList<>();
                    MethodImplementation impl = m.getImplementation();
                    if (impl != null) {
                        body.add("# registers=" + impl.getRegisterCount());
                        for (Instruction i : impl.getInstructions()) body.add(render(i));
                        body.addAll(tryBlocks(impl));
                    }
                    out.computeIfAbsent(s, k -> new ArrayList<>()).add(body);
                }
            }
        }
        return out;
    }

    /** Each try block as a line, so an exception range that moved is a body that changed. */
    private static List<String> tryBlocks(MethodImplementation impl) {
        List<String> out = new ArrayList<>();
        for (TryBlock<? extends ExceptionHandler> block : impl.getTryBlocks()) {
            StringBuilder b = new StringBuilder("# try start=").append(block.getStartCodeAddress())
                    .append(" units=").append(block.getCodeUnitCount());
            for (ExceptionHandler handler : block.getExceptionHandlers()) {
                b.append(" catch(").append(handler.getExceptionType())
                        .append(")->").append(handler.getHandlerCodeAddress());
            }
            out.add(b.toString());
        }
        return out;
    }

    private static String sig(ClassDef cd, Method m) {
        StringBuilder b = new StringBuilder(cd.getType()).append("->").append(m.getName()).append('(');
        for (CharSequence p : m.getParameterTypes()) b.append(p);
        return b.append(')').append(m.getReturnType()).toString();
    }

    /** One instruction as text: opcode, registers, branch offset, literal, reference, max register. */
    private static String render(Instruction i) {
        StringBuilder b = new StringBuilder(i.getOpcode().name);
        List<String> regs = new ArrayList<>();
        int maxReg = -1;
        if (i instanceof RegisterRangeInstruction) {
            RegisterRangeInstruction r = (RegisterRangeInstruction) i;
            regs.add("v" + r.getStartRegister() + "..v" + (r.getStartRegister() + r.getRegisterCount() - 1));
            maxReg = r.getStartRegister() + r.getRegisterCount() - 1;
        } else if (i instanceof FiveRegisterInstruction) {
            FiveRegisterInstruction r = (FiveRegisterInstruction) i;
            int n = r.getRegisterCount();
            int[] all = { r.getRegisterC(), r.getRegisterD(), r.getRegisterE(), r.getRegisterF(), r.getRegisterG() };
            for (int k = 0; k < n; k++) { regs.add("v" + all[k]); maxReg = Math.max(maxReg, all[k]); }
        } else if (i instanceof ThreeRegisterInstruction) {
            ThreeRegisterInstruction r = (ThreeRegisterInstruction) i;
            regs.add("v" + r.getRegisterA());
            regs.add("v" + r.getRegisterB());
            regs.add("v" + r.getRegisterC());
            maxReg = Math.max(r.getRegisterA(), Math.max(r.getRegisterB(), r.getRegisterC()));
        } else if (i instanceof TwoRegisterInstruction) {
            TwoRegisterInstruction r = (TwoRegisterInstruction) i;
            regs.add("v" + r.getRegisterA());
            regs.add("v" + r.getRegisterB());
            maxReg = Math.max(r.getRegisterA(), r.getRegisterB());
        } else if (i instanceof OneRegisterInstruction) {
            regs.add("v" + ((OneRegisterInstruction) i).getRegisterA());
            maxReg = ((OneRegisterInstruction) i).getRegisterA();
        }
        // A wide destination names its low half and occupies the pair, so it reaches one higher
        // than it says. Only the destination: dexlib2 does not describe which sources are wide,
        // and guessing there would fail a valid narrow destination sitting above a wide source.
        if (i.getOpcode().setsWideRegister() && i instanceof OneRegisterInstruction) {
            maxReg = Math.max(maxReg, ((OneRegisterInstruction) i).getRegisterA() + 1);
        }
        if (!regs.isEmpty()) b.append(' ').append(String.join(", ", regs));
        if (i instanceof OffsetInstruction) {
            b.append(", ").append(String.format("%+d", ((OffsetInstruction) i).getCodeOffset()));
        }
        if (i instanceof WideLiteralInstruction) {
            b.append(", #").append(((WideLiteralInstruction) i).getWideLiteral());
        }
        if (i instanceof ReferenceInstruction) {
            Reference r = ((ReferenceInstruction) i).getReference();
            if (r != null) b.append(", ").append(r);
        }
        // A payload's cases and values are part of the body: a case moved to another target
        // changed nothing else, and left out of the text, the method read as untouched.
        if (i instanceof SwitchPayload) {
            for (SwitchElement e : ((SwitchPayload) i).getSwitchElements()) {
                b.append(' ').append(e.getKey()).append("->").append(String.format("%+d", e.getOffset()));
            }
        }
        if (i instanceof ArrayPayload) {
            b.append(" width=").append(((ArrayPayload) i).getElementWidth());
            for (Number n : ((ArrayPayload) i).getArrayElements()) b.append(' ').append(n);
        }
        return b.append(" |maxreg=").append(maxReg).toString();
    }

    private static final String STATUS = "Lapp/morphe/extension/hushthreads/settings/SettingsStatus;->";
    private static final String FEED = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;";
    private static final String MEDIA = "Lcom/instagram/feed/media/Media;";
    private static final String ADS = "Lapp/morphe/extension/hushthreads/ads/FeedAds;->";
    private static final String FILTER_PAGE = ADS + "filter(Ljava/util/List;)Ljava/util/List;";
    private static final String CLEAN_LINK = "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;";
    private static final String POST_LINK = "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->postLink(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;";
    private static final String REMEMBER_POST = "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->rememberPost(Ljava/lang/Object;Ljava/lang/Object;)V";
    private static final String REMEMBERED_POST = "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->rememberedPost(Ljava/lang/Object;)Ljava/lang/Object;";
    private static final String OPEN_LINK = "Lapp/morphe/extension/hushthreads/misc/ExternalBrowser;->open(Landroid/content/Context;Ljava/lang/String;)Z";
    /** What only Threads' browser launcher logs, the string Open links in browser finds it by. */
    private static final String LAUNCHER_MESSAGE = "ThreadsBrowserLauncher: cookie injection failed; system WebView unavailable";
    private static final String PERMALINK_REPOSITORY = "Lcom/instagram/barcelona/share/permalink/data/PermalinkRepository;";
    private static final String USER = "Lcom/instagram/user/model/User;";
    /** Each class's interfaces, filled in with the superclasses when featureMethods is asked for them. */
    private static final Map<String, List<String>> INTERFACES = new HashMap<>();
    /** Each class's instance fields that hold a post, filled in beside INTERFACES. */
    private static final Map<String, List<String>> POST_FIELDS = new HashMap<>();
    private static final String ENDPOINT = "Lapp/morphe/extension/hushthreads/misc/Analytics;->endpoint(Ljava/lang/String;)Ljava/lang/String;";
    private static final String SIGNERS = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;->originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;";
    private static final String LOGGING_URL = "https://graph.facebook.com/logging_client_events";

    /** Keep duplicate definitions visible: choosing whichever dex was visited last hides corruption. */
    private static Map<String, List<Method>> featureMethods(File apk, Map<String, String> parents) throws Exception {
        Map<String, List<Method>> methods = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cd : dex.getEntry(entry).getDexFile().getClasses()) {
            if (parents != null) {
                parents.put(cd.getType(), cd.getSuperclass());
                INTERFACES.put(cd.getType(), new ArrayList<>(cd.getInterfaces()));
                List<String> posts = new ArrayList<>();
                for (Field f : cd.getInstanceFields()) if (f.getType().equals(MEDIA)) posts.add(f.getName());
                POST_FIELDS.put(cd.getType(), posts);
            }
            for (Method m : cd.getMethods()) methods.computeIfAbsent(sig(cd, m), k -> new ArrayList<>()).add(m);
        }
        return methods;
    }

    private static void requireFeature(boolean condition, String detail) {
        if (!condition) throw new IllegalArgumentException(detail);
    }

    private static Method featureMethod(Map<String, List<Method>> methods, String signature) {
        List<Method> found = methods.getOrDefault(signature, List.of());
        requireFeature(found.size() == 1, "expected one definition of " + signature + ", found " + found.size());
        return found.get(0);
    }

    private static Method featureTarget(Map<String, List<Method>> methods,
            java.util.function.Predicate<Method> predicate, String label) {
        Method target = null;
        int count = 0;
        for (List<Method> definitions : methods.values()) for (Method m : definitions) {
            if (predicate.test(m)) { target = m; count++; }
        }
        requireFeature(count == 1, label + " has " + count + " stock candidates");
        return target;
    }

    private static String featureSig(MethodReference m) {
        return m.getDefiningClass() + "->" + m.getName() + "("
                + String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }

    private static String reference(Instruction i) {
        return i instanceof ReferenceInstruction ? ((ReferenceInstruction) i).getReference().toString() : "";
    }

    private static boolean holds(Method m, String... strings) {
        Set<String> wanted = new HashSet<>(Arrays.asList(strings));
        for (Instruction i : instructions(m)) if (i instanceof ReferenceInstruction
                && ((ReferenceInstruction) i).getReference() instanceof StringReference) {
            wanted.remove(((StringReference) ((ReferenceInstruction) i).getReference()).getString());
        }
        return wanted.isEmpty();
    }

    private static int featureConstant(Map<String, List<Method>> methods, String name, String returns) {
        Method m = featureMethod(methods, STATUS + name + "()" + returns);
        List<Instruction> body = instructions(m);
        requireFeature(AccessFlags.STATIC.isSet(m.getAccessFlags()) && body.size() >= 2
                && (returns.equals("Z") || body.size() == 2)
                && body.get(0) instanceof WideLiteralInstruction && body.get(0) instanceof OneRegisterInstruction
                && body.get(0).getOpcode().name.startsWith("const")
                && body.get(1).getOpcode() == Opcode.RETURN
                && ((OneRegisterInstruction) body.get(0)).getRegisterA() == ((OneRegisterInstruction) body.get(1)).getRegisterA(),
                name + " is not a constant status stub");
        return Math.toIntExact(((WideLiteralInstruction) body.get(0)).getWideLiteral());
    }

    private static void featureCall(List<Instruction> body, int at, String callee, int input, int output) {
        requireFeature(at >= 0 && at + 1 < body.size() && isStaticInvoke(body.get(at).getOpcode())
                && reference(body.get(at)).equals(callee)
                && Arrays.equals(invokeRegisters(body.get(at)), new int[]{input})
                && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && ((OneRegisterInstruction) body.get(at + 1)).getRegisterA() == output,
                "missing or miswired " + callee + " at instruction " + at);
    }

    /** Compare original operations separately from offsets, then check the relocated branch graph. */
    private static String featureInstruction(Instruction i) {
        if (i instanceof SwitchPayload) {
            StringBuilder keys = new StringBuilder(i.getOpcode().name);
            for (SwitchElement e : ((SwitchPayload) i).getSwitchElements()) keys.append(' ').append(e.getKey());
            return keys.toString();
        }
        String key = render(i);
        if (i instanceof OffsetInstruction) key = key.replaceFirst(java.util.regex.Pattern.quote(
                ", " + String.format("%+d", ((OffsetInstruction) i).getCodeOffset())), "");
        return key.replace("const-string/jumbo ", "const-string ").replaceFirst("^goto(?:/16|/32)?", "goto");
    }

    /**
     * The original body must survive with exactly the declared call/result insertions. Branches
     * aimed at a wrapped instruction must reach the hook first, including switch cases.
     */
    private static void featureBody(Method stock, Method patched, int prefix,
            Map<Integer, Integer> insertions, String callee) {
        featureBody(stock, patched, prefix, insertions, callee, null);
    }

    private static void featureBody(Method stock, Method patched, int prefix,
            Map<Integer, Integer> insertions, String callee, FieldReference recordedRaw) {
        featureBody(stock, patched, prefix, insertions, callee, recordedRaw, Map.of());
    }

    /** A hook longer than a call and its result: checks the one at [at] and answers its length. */
    private interface FeatureBlock {
        int check(List<Instruction> body, int at);
    }

    private static void featureBody(Method stock, Method patched, int prefix,
            Map<Integer, Integer> insertions, String callee, FieldReference recordedRaw, Map<Integer, FeatureBlock> blocks) {
        featureDeclaration(stock, patched);
        requireFeature(stock.getImplementation() != null && patched.getImplementation() != null,
                featureSig(stock) + " lost its executable implementation");
        Layout old = new Layout(stock.getImplementation()), now = new Layout(patched.getImplementation());
        requireFeature(stock.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(),
                featureSig(stock) + " changed its register allocation");
        int[] operations = new int[old.instructions.size()];
        Map<Integer, Integer> relocated = new HashMap<>();
        int at = prefix;
        for (int k = 0; k < old.instructions.size(); k++) {
            requireFeature(at < now.instructions.size(), featureSig(stock) + " lost original instruction " + k);
            // The nop that aligns a payload comes and goes with the length of the code inserted above it.
            boolean oldPad = alignsPayload(old.instructions, k);
            if (oldPad && !alignsPayload(now.instructions, at)) {
                relocated.put(old.addresses.get(k), now.addresses.get(at));
                operations[k] = at;
                continue;
            }
            if (!oldPad && alignsPayload(now.instructions, at)) at++;
            relocated.put(old.addresses.get(k), now.addresses.get(at));
            Integer register = insertions.get(k);
            if (register != null) {
                featureCall(now.instructions, at, callee, register, register);
                at += 2;
            }
            FeatureBlock block = blocks.get(k);
            if (block != null) at += block.check(now.instructions, at);
            if (recordedRaw != null && old.instructions.get(k).getOpcode() == Opcode.RETURN_VOID) {
                requireFeature(at + 2 < now.instructions.size(), "raw wrapper lost its constructor recorder");
                Instruction receiver = now.instructions.get(at), value = now.instructions.get(at + 1), store = now.instructions.get(at + 2);
                int input = stock.getImplementation().getRegisterCount() - 1;
                requireFeature(receiver.getOpcode() == Opcode.MOVE_OBJECT_FROM16 && value.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                        && store.getOpcode() == Opcode.IPUT_OBJECT
                        && ((TwoRegisterInstruction) receiver).getRegisterA() == 0 && ((TwoRegisterInstruction) receiver).getRegisterB() == input - 1
                        && ((TwoRegisterInstruction) value).getRegisterA() == 1 && ((TwoRegisterInstruction) value).getRegisterB() == input
                        && ((TwoRegisterInstruction) store).getRegisterA() == 1 && ((TwoRegisterInstruction) store).getRegisterB() == 0
                        && reference(store).equals(recordedRaw.toString()), "raw wrapper has a different constructor recorder");
                at += 3;
            }
            requireFeature(at < now.instructions.size()
                    && featureInstruction(old.instructions.get(k)).equals(featureInstruction(now.instructions.get(at))),
                    featureSig(stock) + " changed original instruction " + k);
            operations[k] = at++;
        }
        relocated.put(old.size, now.size);
        requireFeature(at == now.instructions.size(), featureSig(stock) + " contains undeclared operations");
        for (int k = 0; k < old.instructions.size(); k++) {
            Instruction before = old.instructions.get(k), after = now.instructions.get(operations[k]);
            if (!(before instanceof OffsetInstruction)) continue;
            int oldTarget = old.addresses.get(k) + ((OffsetInstruction) before).getCodeOffset();
            int newTarget = now.addresses.get(operations[k]) + ((OffsetInstruction) after).getCodeOffset();
            requireFeature(java.util.Objects.equals(relocated.get(oldTarget), newTarget),
                    featureSig(stock) + " bypasses a hook or changes a branch target");
            if (old.byAddress.get(oldTarget) instanceof SwitchPayload) {
                List<? extends SwitchElement> oldCases = ((SwitchPayload) old.byAddress.get(oldTarget)).getSwitchElements();
                List<? extends SwitchElement> newCases = ((SwitchPayload) now.byAddress.get(newTarget)).getSwitchElements();
                for (int n = 0; n < oldCases.size(); n++) {
                    int oldCase = old.addresses.get(k) + oldCases.get(n).getOffset();
                    int newCase = now.addresses.get(operations[k]) + newCases.get(n).getOffset();
                    requireFeature(java.util.Objects.equals(relocated.get(oldCase), newCase),
                            featureSig(stock) + " bypasses a hook or changes a switch target");
                }
            }
        }
        List<? extends TryBlock<? extends ExceptionHandler>> oldTries = stock.getImplementation().getTryBlocks();
        List<? extends TryBlock<? extends ExceptionHandler>> newTries = patched.getImplementation().getTryBlocks();
        List<List<String>> protectedRanges = new ArrayList<>();
        for (int side = 0; side < 2; side++) {
            List<String> ranges = new ArrayList<>(), previousHandlers = null;
            int start = -1, end = -1;
            for (TryBlock<? extends ExceptionHandler> block : side == 0 ? oldTries : newTries) {
                Integer from = block.getStartCodeAddress(), to = from + block.getCodeUnitCount();
                if (side == 0) { from = relocated.get(from); to = relocated.get(to); }
                requireFeature(from != null && to != null, featureSig(stock) + " lost an exception boundary");
                List<String> handlers = new ArrayList<>();
                for (ExceptionHandler handler : block.getExceptionHandlers()) {
                    Integer target = handler.getHandlerCodeAddress();
                    if (side == 0) target = relocated.get(target);
                    requireFeature(target != null, featureSig(stock) + " lost an exception target");
                    handlers.add(handler.getExceptionType() + "@" + target);
                }
                // A relocated protected span can exceed DEX's unsigned-short try-item limit.
                // Adjacent pieces are equivalent only when their ordered handlers are identical.
                if (from == end && handlers.equals(previousHandlers)) {
                    end = to;
                } else {
                    if (previousHandlers != null) ranges.add(start + ":" + end + ":" + previousHandlers);
                    start = from; end = to; previousHandlers = handlers;
                }
            }
            if (previousHandlers != null) ranges.add(start + ":" + end + ":" + previousHandlers);
            protectedRanges.add(ranges);
        }
        requireFeature(protectedRanges.get(0).equals(protectedRanges.get(1)),
                featureSig(stock) + " changed a protected range or ordered exception handlers");
    }

    /** Whether [body] at [index] is the nop dex puts before a payload to align it. */
    private static boolean alignsPayload(List<Instruction> body, int index) {
        if (index + 1 >= body.size() || body.get(index).getOpcode() != Opcode.NOP) return false;
        Opcode next = body.get(index + 1).getOpcode();
        return next == Opcode.PACKED_SWITCH_PAYLOAD || next == Opcode.SPARSE_SWITCH_PAYLOAD || next == Opcode.ARRAY_PAYLOAD;
    }

    private static void featureHostCalls(Map<String, List<Method>> methods, String callee, Map<String, Integer> expected) {
        Map<String, Integer> found = new TreeMap<>();
        for (List<Method> definitions : methods.values()) for (Method m : definitions) {
            if (m.getDefiningClass().startsWith(OWN)) continue;
            int count = callSites(instructions(m), callee).size();
            if (count > 0) found.merge(featureSig(m), count, Integer::sum);
        }
        requireFeature(found.equals(expected), callee + " host calls differ: expected " + expected + ", found " + found);
    }

    private static Method featureMerge(Map<String, List<Method>> clean) {
        return featureTarget(clean, m -> m.getDefiningClass().equals(FEED)
                && m.getReturnType().equals("Ljava/lang/Object;") && m.getParameterTypes().size() == 8
                && m.getParameterTypes().get(4).equals("Ljava/util/List;")
                && instructions(m).stream().anyMatch(i -> reference(i).startsWith(FEED.substring(0, FEED.length() - 1)
                        + "$addAndSaveItemsFromFeedFetchSuccess$2$1;-><init>(")), "feed merge");
    }

    private static MethodReference featureStockMedia(Map<String, List<Method>> clean) {
        return featureOne(instructions(featureMerge(clean)).stream().filter(i -> isPlainInvoke(i.getOpcode())
                && ((ReferenceInstruction) i).getReference() instanceof MethodReference)
                .map(i -> (MethodReference) ((ReferenceInstruction) i).getReference())
                .filter(m -> m.getParameterTypes().isEmpty() && m.getReturnType().equals(MEDIA)
                        && !m.getDefiningClass().equals(MEDIA)).distinct().toList(), "stock feed-item Media getter");
    }

    private static MethodReference featureFeedPage(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method merge = featureMerge(clean);
        int parameter = merge.getImplementation().getRegisterCount() - merge.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        for (int n = 0; n < 4; n++) parameter += slots(merge.getParameterTypes().get(n).toString());
        Method actual = featureMethod(patched, featureSig(merge));
        featureCall(instructions(actual), 0, FILTER_PAGE, parameter, parameter);
        featureBody(merge, actual, 2, Map.of(), FILTER_PAGE);
        featureHostCalls(patched, FILTER_PAGE, Map.of(featureSig(merge), 1));

        Method getter = featureMethod(patched, ADS + "itemMedia(Ljava/lang/Object;)Ljava/lang/Object;");
        List<Instruction> g = instructions(getter);
        requireFeature(g.size() == 8 && g.get(0).getOpcode() == Opcode.INSTANCE_OF
                && g.get(1).getOpcode() == Opcode.IF_EQZ && g.get(2).getOpcode() == Opcode.CHECK_CAST
                && g.get(3).getOpcode() == Opcode.INVOKE_VIRTUAL
                && g.get(4).getOpcode() == Opcode.MOVE_RESULT_OBJECT && g.get(5).getOpcode() == Opcode.RETURN_OBJECT
                && g.get(6).getOpcode() == Opcode.CONST_4 && g.get(7).getOpcode() == Opcode.RETURN_OBJECT,
                "itemMedia is still a stub or has a different typed-accessor shape");
        MethodReference mediaGetter = (MethodReference) ((ReferenceInstruction) g.get(3)).getReference();
        String owner = mediaGetter.getDefiningClass();
        requireFeature(mediaGetter.getParameterTypes().isEmpty() && mediaGetter.getReturnType().equals(MEDIA)
                && !owner.equals(MEDIA) && reference(g.get(0)).equals(owner) && reference(g.get(2)).equals(owner)
                && callSites(instructions(merge), featureSig(mediaGetter)).size() > 0,
                "itemMedia does not call the feed item's stock Media getter");
        Method declared = featureMethod(clean, featureSig(mediaGetter));
        requireFeature(!AccessFlags.STATIC.isSet(declared.getAccessFlags()), "itemMedia's getter is not an instance method");
        featureBody(declared, featureMethod(patched, featureSig(declared)), 0, Map.of(), "");
        int input = getter.getImplementation().getRegisterCount() - 1;
        requireFeature(((TwoRegisterInstruction) g.get(0)).getRegisterA() == 0
                && ((TwoRegisterInstruction) g.get(0)).getRegisterB() == input
                && ((OneRegisterInstruction) g.get(1)).getRegisterA() == 0
                && ((OneRegisterInstruction) g.get(2)).getRegisterA() == input
                && Arrays.equals(invokeRegisters(g.get(3)), new int[]{input})
                && ((OneRegisterInstruction) g.get(4)).getRegisterA() == 0
                && ((OneRegisterInstruction) g.get(5)).getRegisterA() == 0
                && ((WideLiteralInstruction) g.get(6)).getWideLiteral() == 0
                && ((OneRegisterInstruction) g.get(6)).getRegisterA() == 0
                && ((OneRegisterInstruction) g.get(7)).getRegisterA() == 0, "itemMedia uses the wrong registers");
        Layout getterLayout = new Layout(getter.getImplementation());
        requireFeature(getterLayout.addresses.get(1) + ((OffsetInstruction) g.get(1)).getCodeOffset()
                == getterLayout.addresses.get(6), "itemMedia's non-item branch does not return null");
        requireFeature(AccessFlags.STATIC.isSet(getter.getAccessFlags())
                && getter.getImplementation().getTryBlocks().isEmpty(), "itemMedia is not an unprotected static accessor");
        return mediaGetter;
    }

    private static void featureFeed(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureFeedPage(clean, patched);
        Method ad = featureMethod(patched, ADS + "isAd(Ljava/lang/Object;)Z");
        List<Instruction> a = instructions(ad);
        requireFeature(a.size() == 4 && a.get(0).getOpcode() == Opcode.CHECK_CAST && reference(a.get(0)).equals(MEDIA)
                && a.get(1).getOpcode() == Opcode.INVOKE_VIRTUAL && a.get(2).getOpcode() == Opcode.MOVE_RESULT
                && a.get(3).getOpcode() == Opcode.RETURN, "isAd is still a stub or lacks the Media check");
        MethodReference adCall = (MethodReference) ((ReferenceInstruction) a.get(1)).getReference();
        Method adMethod = featureMethod(clean, featureSig(adCall));
        requireFeature(adCall.getDefiningClass().equals(MEDIA) && adCall.getParameterTypes().isEmpty()
                && adCall.getReturnType().equals("Z") && !AccessFlags.STATIC.isSet(adMethod.getAccessFlags()),
                "isAd calls a different Media method");
        Method injected = featureTarget(clean, m -> AccessFlags.STATIC.isSet(m.getAccessFlags())
                && m.getReturnType().equals("Z") && m.getParameterTypes().size() == 1
                && instructions(m).stream().anyMatch(i -> i instanceof WideLiteralInstruction
                        && (int) ((WideLiteralInstruction) i).getWideLiteral() == 0x8669a9b0)
                && instructions(m).stream().anyMatch(i -> i instanceof WideLiteralInstruction
                        && (int) ((WideLiteralInstruction) i).getWideLiteral() == "injected".hashCode()), "injected ad check");
        List<Instruction> predicate = instructions(adMethod);
        List<Integer> checks = callSites(predicate, featureSig(injected));
        requireFeature(checks.size() == 1 && checks.get(0) == predicate.size() - 3
                && isStaticInvoke(predicate.get(predicate.size() - 3).getOpcode())
                && predicate.get(predicate.size() - 2).getOpcode() == Opcode.MOVE_RESULT
                && predicate.get(predicate.size() - 1).getOpcode() == Opcode.RETURN
                && ((OneRegisterInstruction) predicate.get(predicate.size() - 2)).getRegisterA()
                        == ((OneRegisterInstruction) predicate.get(predicate.size() - 1)).getRegisterA()
                && adMethod.getImplementation().getTryBlocks().isEmpty()
                && predicate.subList(0, predicate.size() - 1).stream().allMatch(i -> i.getOpcode().canContinue()
                        && !(i instanceof OffsetInstruction)), "isAd does not directly return the injected ad result");
        featureBody(adMethod, featureMethod(patched, featureSig(adMethod)), 0, Map.of(), "");
        featureBody(injected, featureMethod(patched, featureSig(injected)), 0, Map.of(), "");
        int adInput = ad.getImplementation().getRegisterCount() - 1;
        requireFeature(((OneRegisterInstruction) a.get(0)).getRegisterA() == adInput
                && Arrays.equals(invokeRegisters(a.get(1)), new int[]{adInput})
                && ((OneRegisterInstruction) a.get(2)).getRegisterA() == ((OneRegisterInstruction) a.get(3)).getRegisterA(),
                "isAd uses the wrong receiver or result");
    }

    private static final String FEATURE_STRING = "Ljava/lang/String;";
    private static final String SUGGESTED_WIRE = "suggested_users";
    private static final String KICKSTART_WIRE = "text_app_suggested_users_kickstart_unit";
    private static final String STRING_EQUALS = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z";
    private static final String RECORDED_RAW = "hushthreadsSuggestedUsersRaw";

    private record FeatureUse(int index, int register) {}
    private record ParsedFeatureValue(int result, String parser) {}

    /** Stock value provenance follows copies and both branch arms; a write kills the old value.
     * Catch edges carry the value before the throwing instruction writes its result. */
    private static final class FeatureFlow {
        final Method method;
        final Layout layout;
        final List<List<Integer>> normal = new ArrayList<>(), exceptional = new ArrayList<>();

        FeatureFlow(Method method) {
            this.method = method;
            requireFeature(method.getImplementation() != null, featureSig(method) + " has no body");
            layout = new Layout(method.getImplementation());
            Map<Integer, Integer> indices = new HashMap<>();
            for (int n = 0; n < layout.instructions.size(); n++) indices.put(layout.addresses.get(n), n);
            for (int n = 0; n < layout.instructions.size(); n++) {
                Instruction i = layout.instructions.get(n);
                int address = layout.addresses.get(n);
                List<Integer> targets = new ArrayList<>(), handlers = new ArrayList<>();
                if (i.getOpcode().canContinue()) targets.add(address + i.getCodeUnits());
                if (i instanceof OffsetInstruction && i.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                    int target = address + ((OffsetInstruction) i).getCodeOffset();
                    if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                        Instruction payload = layout.byAddress.get(target);
                        requireFeature(payload instanceof SwitchPayload, "stock parser has no switch payload");
                        for (SwitchElement e : ((SwitchPayload) payload).getSwitchElements()) targets.add(address + e.getOffset());
                    } else targets.add(target);
                }
                if (i.getOpcode().canThrow()) for (TryBlock<? extends ExceptionHandler> t : method.getImplementation().getTryBlocks()) {
                    if (address < t.getStartCodeAddress() || address >= t.getStartCodeAddress() + t.getCodeUnitCount()) continue;
                    for (ExceptionHandler h : t.getExceptionHandlers()) handlers.add(h.getHandlerCodeAddress());
                }
                normal.add(targets.stream().map(indices::get).filter(java.util.Objects::nonNull).distinct().toList());
                exceptional.add(handlers.stream().map(indices::get).filter(java.util.Objects::nonNull).distinct().toList());
            }
        }

        Set<FeatureUse> uses(int definition, int register) {
            if (definition >= 0) register = ((OneRegisterInstruction) layout.instructions.get(definition)).getRegisterA();
            Deque<FeatureUse> work = new ArrayDeque<>();
            if (definition < 0) work.add(new FeatureUse(0, register));
            else for (int next : normal.get(definition)) work.add(new FeatureUse(next, register));
            Set<FeatureUse> visited = new HashSet<>(), used = new HashSet<>();
            while (!work.isEmpty()) {
                FeatureUse use = work.removeFirst();
                if (!visited.add(use)) continue;
                Instruction i = layout.instructions.get(use.index());
                for (int[] read : valueReads(i)) if (read[0] == use.register()) used.add(use);
                if (isPlainInvoke(i.getOpcode())) for (int argument : invokeRegisters(i)) if (argument == use.register()) used.add(use);
                boolean copy = (i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                        || i.getOpcode() == Opcode.MOVE_OBJECT_16) && ((TwoRegisterInstruction) i).getRegisterB() == use.register();
                int destination = i.getOpcode().setsRegister() ? ((OneRegisterInstruction) i).getRegisterA() : -1;
                boolean killed = i.getOpcode() != Opcode.CHECK_CAST && (destination == use.register()
                        || i.getOpcode().setsWideRegister() && destination + 1 == use.register());
                for (int next : normal.get(use.index())) {
                    if (!killed) work.add(new FeatureUse(next, use.register()));
                    if (copy) work.add(new FeatureUse(next, ((OneRegisterInstruction) i).getRegisterA()));
                }
                for (int next : exceptional.get(use.index())) work.add(new FeatureUse(next, use.register()));
            }
            return used;
        }

        /** A must-analysis: intersect provenance at joins instead of accepting one alias path. */
        boolean parameterOnEveryPath(int use, int register, int parameter) {
            return sourceOnEveryPath(-1, parameter, use, register, false);
        }

        boolean parsedOnEveryPath(int definition, int use, int register) {
            return sourceOnEveryPath(definition, -1, use, register, true);
        }

        boolean sourceOnEveryPath(int definition, int parameter, int use, int register, boolean allowNull) {
            BitSet[] before = new BitSet[layout.instructions.size()];
            before[0] = new BitSet(method.getImplementation().getRegisterCount());
            if (parameter >= 0) before[0].set(parameter);
            Deque<Integer> work = new ArrayDeque<>(List.of(0));
            while (!work.isEmpty()) {
                int n = work.removeFirst();
                Instruction i = layout.instructions.get(n);
                BitSet input = before[n], output = (BitSet) input.clone();
                if (i.getOpcode().setsRegister() && i.getOpcode() != Opcode.CHECK_CAST) {
                    int destination = ((OneRegisterInstruction) i).getRegisterA();
                    boolean copy = i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                            || i.getOpcode() == Opcode.MOVE_OBJECT_16;
                    boolean explicitNull = allowNull && (i.getOpcode() == Opcode.CONST_4 || i.getOpcode() == Opcode.CONST_16
                            || i.getOpcode() == Opcode.CONST || i.getOpcode() == Opcode.CONST_HIGH16)
                            && ((WideLiteralInstruction) i).getWideLiteral() == 0;
                    output.set(destination, n == definition || explicitNull || copy && input.get(((TwoRegisterInstruction) i).getRegisterB()));
                    if (i.getOpcode().setsWideRegister()) output.clear(destination + 1);
                }
                for (int next : normal.get(n)) if (mergeSource(before, next, output)) work.add(next);
                // A throwing instruction's destination is written only along its normal edge.
                for (int next : exceptional.get(n)) if (mergeSource(before, next, input)) work.add(next);
            }
            return before[use] != null && before[use].get(register);
        }

        /** A missing Raw model supplies a null lookup key; a present model must supply its field. */
        boolean lookupOnEveryPath(int definition, int use, int register, int parameter) {
            BitSet[][] values = new BitSet[layout.instructions.size()][3], nulls = new BitSet[layout.instructions.size()][3];
            values[0][0] = new BitSet();
            nulls[0][0] = new BitSet();
            Deque<int[]> work = new ArrayDeque<>(List.of(new int[]{0, 0}));
            while (!work.isEmpty()) {
                int[] state = work.removeFirst();
                int at = state[0], rawState = state[1]; // 0 unknown, 1 absent, 2 present.
                Instruction instruction = layout.instructions.get(at);
                BitSet input = values[at][rawState], zeroInput = nulls[at][rawState];
                BitSet output = (BitSet) input.clone(), zeroOutput = (BitSet) zeroInput.clone();
                if (instruction.getOpcode().setsRegister() && instruction.getOpcode() != Opcode.CHECK_CAST) {
                    int destination = ((OneRegisterInstruction) instruction).getRegisterA();
                    boolean copy = instruction.getOpcode() == Opcode.MOVE_OBJECT || instruction.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                            || instruction.getOpcode() == Opcode.MOVE_OBJECT_16;
                    boolean zero = (instruction.getOpcode() == Opcode.CONST_4 || instruction.getOpcode() == Opcode.CONST_16
                            || instruction.getOpcode() == Opcode.CONST || instruction.getOpcode() == Opcode.CONST_HIGH16)
                            && ((WideLiteralInstruction) instruction).getWideLiteral() == 0;
                    int source = copy ? ((TwoRegisterInstruction) instruction).getRegisterB() : -1;
                    output.set(destination, at == definition || copy && input.get(source));
                    zeroOutput.set(destination, zero || copy && zeroInput.get(source));
                    if (instruction.getOpcode().setsWideRegister()) {
                        output.clear(destination + 1);
                        zeroOutput.clear(destination + 1);
                    }
                }
                boolean test = (instruction.getOpcode() == Opcode.IF_EQZ || instruction.getOpcode() == Opcode.IF_NEZ)
                        && parameterOnEveryPath(at, ((OneRegisterInstruction) instruction).getRegisterA(), parameter);
                int target = test ? layout.addresses.get(at) + ((OffsetInstruction) instruction).getCodeOffset() : -1;
                for (int next : normal.get(at)) {
                    for (int nextState : test ? new int[]{1, 2} : new int[]{rawState}) {
                        if (test) {
                            if (rawState != 0 && rawState != nextState) continue;
                            boolean jump = (nextState == 1) == (instruction.getOpcode() == Opcode.IF_EQZ);
                            int destination = jump ? target : layout.addresses.get(at) + instruction.getCodeUnits();
                            if (layout.addresses.get(next) != destination) continue;
                        }
                        if (mergeLookup(values, nulls, next, nextState, output, zeroOutput)) work.add(new int[]{next, nextState});
                    }
                }
                for (int next : exceptional.get(at)) {
                    if (mergeLookup(values, nulls, next, rawState, input, zeroInput)) work.add(new int[]{next, rawState});
                }
            }
            boolean reaches = false;
            for (int state = 0; state < 3; state++) if (values[use][state] != null) {
                reaches = true;
                if (!values[use][state].get(register) && !(state == 1 && nulls[use][state].get(register))) return false;
            }
            return reaches;
        }

        private static boolean mergeLookup(BitSet[][] values, BitSet[][] nulls, int at, int state, BitSet value, BitSet zero) {
            if (values[at][state] == null) {
                values[at][state] = (BitSet) value.clone();
                nulls[at][state] = (BitSet) zero.clone();
                return true;
            }
            BitSet merged = (BitSet) values[at][state].clone(), zeroMerged = (BitSet) nulls[at][state].clone();
            merged.and(value);
            zeroMerged.and(zero);
            if (merged.equals(values[at][state]) && zeroMerged.equals(nulls[at][state])) return false;
            values[at][state] = merged;
            nulls[at][state] = zeroMerged;
            return true;
        }

        private static boolean mergeSource(BitSet[] before, int at, BitSet incoming) {
            if (before[at] == null) {
                before[at] = (BitSet) incoming.clone();
                return true;
            }
            BitSet joined = (BitSet) before[at].clone();
            joined.and(incoming);
            if (joined.equals(before[at])) return false;
            before[at] = joined;
            return true;
        }

        int string(String value) {
            List<Integer> matches = new ArrayList<>();
            for (int n = 0; n < layout.instructions.size(); n++) {
                Instruction i = layout.instructions.get(n);
                if (i instanceof ReferenceInstruction && ((ReferenceInstruction) i).getReference() instanceof StringReference
                        && reference(i).equals(value)) matches.add(n);
            }
            return featureOne(matches, "stock string " + value);
        }

        boolean reachableWithoutEdge(int target, int edgeFrom, int edgeTo) {
            Deque<Integer> work = new ArrayDeque<>(List.of(0));
            Set<Integer> visited = new HashSet<>();
            while (!work.isEmpty()) {
                int at = work.removeFirst();
                if (!visited.add(at)) continue;
                if (at == target) return true;
                for (int next : normal.get(at)) if (at != edgeFrom || next != edgeTo) work.add(next);
                work.addAll(exceptional.get(at));
            }
            return false;
        }

        ParsedFeatureValue parsed(String key, String type) {
            List<Instruction> body = layout.instructions;
            int literal = string(key);
            Set<FeatureUse> keyUses = uses(literal, -1);
            int comparison = featureOne(keyUses.stream().map(FeatureUse::index).distinct()
                    .filter(n -> reference(body.get(n)).equals(STRING_EQUALS)).toList(), key + " comparison");
            int[] arguments = invokeRegisters(body.get(comparison));
            int keyRegister = featureOne(keyUses.stream().filter(use -> use.index() == comparison
                    && Arrays.stream(arguments).anyMatch(register -> register == use.register()))
                    .map(FeatureUse::register).distinct().toList(), key + " comparison key register");
            requireFeature(arguments.length == 2 && sourceOnEveryPath(literal, -1, comparison, keyRegister, false),
                    "JSON key " + key + " does not preserve its exact literal on every comparison path");
            requireFeature(comparison + 3 < body.size() && body.get(comparison + 1).getOpcode() == Opcode.MOVE_RESULT
                    && body.get(comparison + 2).getOpcode() == Opcode.IF_EQZ
                    && ((OneRegisterInstruction) body.get(comparison + 1)).getRegisterA()
                    == ((OneRegisterInstruction) body.get(comparison + 2)).getRegisterA(), key + " has no direct key branch");
            int join = featureOne(normal.get(comparison + 2).stream().filter(n -> n != comparison + 3).toList(), key + " branch join");
            Set<Integer> branch = new HashSet<>();
            Deque<Integer> work = new ArrayDeque<>(List.of(comparison + 3));
            while (!work.isEmpty()) {
                int n = work.removeFirst();
                if (n != join && branch.add(n)) work.addAll(normal.get(n));
            }
            List<ParsedFeatureValue> values = new ArrayList<>();
            for (int n : branch) {
                Instruction i = body.get(n);
                if (!(i instanceof ReferenceInstruction) || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)
                        || !isPlainInvoke(i.getOpcode()) || n + 1 >= body.size() || body.get(n + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
                if (!call.getParameterTypes().equals(method.getParameterTypes())) continue;
                if (type.equals(FEATURE_STRING)) {
                    if (call.getReturnType().equals(type)) values.add(new ParsedFeatureValue(n + 1, null));
                } else if (n > 0 && n + 2 < body.size() && !isStaticInvoke(i.getOpcode())
                        && call.getName().equals("parseFromJsonParser") && call.getReturnType().equals("Ljava/lang/Object;")
                        && body.get(n + 2).getOpcode() == Opcode.CHECK_CAST && reference(body.get(n + 2)).equals(type)
                        && ((OneRegisterInstruction) body.get(n + 2)).getRegisterA() == ((OneRegisterInstruction) body.get(n + 1)).getRegisterA()
                        && body.get(n - 1).getOpcode() == Opcode.SGET_OBJECT
                        && ((OneRegisterInstruction) body.get(n - 1)).getRegisterA() == invokeRegisters(i)[0]) {
                    FieldReference loader = (FieldReference) ((ReferenceInstruction) body.get(n - 1)).getReference();
                    values.add(new ParsedFeatureValue(n + 1, loader.getType()));
                }
            }
            ParsedFeatureValue value = featureOne(values, "typed JSON value for " + key);
            int reader = value.result() - 1;
            requireFeature(!reachableWithoutEdge(reader, comparison + 2, comparison + 3),
                    "JSON key " + key + " true edge does not control its typed reader");
            requireFeature(method.getParameterTypes().size() == 1 && slots(method.getParameterTypes().get(0)) == 1,
                    key + " has no single JSON input parameter");
            int parameter = method.getImplementation().getRegisterCount() - 1;
            int[] readerArguments = invokeRegisters(body.get(reader));
            int input = isStaticInvoke(body.get(reader).getOpcode()) ? 0 : 1;
            requireFeature(readerArguments.length == input + 1 && parameterOnEveryPath(reader, readerArguments[input], parameter),
                    "JSON key " + key + " typed reader does not preserve the original JSON input on every path");
            return value;
        }
    }

    private static void featureDeclaration(Method stock, Method patched) {
        requireFeature(featureSig(stock).equals(featureSig(patched)) && stock.getAccessFlags() == patched.getAccessFlags()
                && stock.getAnnotations().equals(patched.getAnnotations())
                && stock.getHiddenApiRestrictions().equals(patched.getHiddenApiRestrictions()),
                featureSig(stock) + " changed its method declaration");
        requireFeature(stock.getParameters().size() == patched.getParameters().size(), featureSig(stock) + " changed its parameters");
        for (int n = 0; n < stock.getParameters().size(); n++) {
            var before = stock.getParameters().get(n);
            var after = patched.getParameters().get(n);
            requireFeature(before.getType().equals(after.getType())
                    && java.util.Objects.equals(before.getName(), after.getName())
                    && java.util.Objects.equals(before.getSignature(), after.getSignature())
                    && before.getAnnotations().equals(after.getAnnotations()), featureSig(stock) + " changed parameter " + n);
        }
    }

    private static void featureFieldDeclaration(Field stock, Field patched) {
        requireFeature(stock.toString().equals(patched.toString()) && stock.getAccessFlags() == patched.getAccessFlags()
                && java.util.Objects.equals(stock.getInitialValue(), patched.getInitialValue())
                && stock.getAnnotations().equals(patched.getAnnotations())
                && stock.getHiddenApiRestrictions().equals(patched.getHiddenApiRestrictions()),
                "stock card field declaration changed: " + stock);
    }

    private static <T> T featureOne(List<T> values, String label) {
        requireFeature(values.size() == 1, label + " has " + values.size() + " candidates");
        return values.get(0);
    }

    private static Map<String, ClassDef> featureClasses(File apk, Set<String> wanted) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cd : dex.getEntry(entry).getDexFile().getClasses()) {
            if (wanted.contains(cd.getType())) requireFeature(classes.put(cd.getType(), cd) == null, "duplicate stock class " + cd.getType());
        }
        requireFeature(classes.keySet().equals(wanted), "missing stock card classes " + wanted);
        return classes;
    }

    private static Field featureField(ClassDef owner, FieldReference reference, boolean enumConstant) {
        List<Field> fields = new ArrayList<>();
        for (Field field : owner.getFields()) if (field.getName().equals(reference.getName()) && field.getType().equals(reference.getType())) fields.add(field);
        Field field = featureOne(fields, "stock field " + reference);
        requireFeature(AccessFlags.PUBLIC.isSet(field.getAccessFlags())
                && AccessFlags.STATIC.isSet(field.getAccessFlags()) == enumConstant
                && (!enumConstant || AccessFlags.FINAL.isSet(field.getAccessFlags()) && AccessFlags.ENUM.isSet(field.getAccessFlags())),
                "inaccessible stock card field " + reference);
        return field;
    }

    private static FieldReference featureEnum(Method initializer, String wire, String name, String enumType) {
        FeatureFlow flow = new FeatureFlow(initializer);
        List<Instruction> body = flow.layout.instructions;
        Set<FeatureUse> names = flow.uses(flow.string(name), -1);
        List<Integer> constructors = flow.uses(flow.string(wire), -1).stream().filter(use -> {
            Instruction i = body.get(use.index());
            if (!isPlainInvoke(i.getOpcode()) || !(i instanceof ReferenceInstruction)
                    || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) return false;
            MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
            int[] registers = invokeRegisters(i);
            return call.getDefiningClass().equals(enumType) && call.getName().equals("<init>") && call.getReturnType().equals("V")
                    && call.getParameterTypes().equals(List.of(FEATURE_STRING, "I", FEATURE_STRING)) && registers.length == 4
                    && registers[3] == use.register() && names.contains(new FeatureUse(use.index(), registers[1]));
        }).map(FeatureUse::index).distinct().toList();
        int constructor = featureOne(constructors, "enum construction for " + wire);
        int receiver = invokeRegisters(body.get(constructor))[0], allocation = -1;
        for (int n = 0; n < constructor; n++) if (body.get(n).getOpcode().setsRegister()
                && ((OneRegisterInstruction) body.get(n)).getRegisterA() == receiver) allocation = n;
        requireFeature(allocation >= 0 && body.get(allocation).getOpcode() == Opcode.NEW_INSTANCE
                && reference(body.get(allocation)).equals(enumType), "enum construction receiver is not allocated for " + wire);
        return featureOne(flow.uses(allocation, -1).stream().filter(use -> body.get(use.index()).getOpcode() == Opcode.SPUT_OBJECT
                && ((OneRegisterInstruction) body.get(use.index())).getRegisterA() == use.register())
                .map(use -> (FieldReference) ((ReferenceInstruction) body.get(use.index())).getReference())
                .filter(field -> field.getDefiningClass().equals(enumType) && field.getType().equals(enumType)).distinct().toList(), "enum field for " + wire);
    }

    private static FieldReference featureSlot(FeatureFlow flow, ParsedFeatureValue value, String owner, String model, Set<FeatureUse> receivers, int allocation) {
        FieldReference slot = featureOne(flow.uses(value.result(), -1).stream().filter(use -> {
            Instruction i = flow.layout.instructions.get(use.index());
            return i.getOpcode() == Opcode.IPUT_OBJECT && ((TwoRegisterInstruction) i).getRegisterA() == use.register()
                    && receivers.contains(new FeatureUse(use.index(), ((TwoRegisterInstruction) i).getRegisterB()));
        }).map(use -> (FieldReference) ((ReferenceInstruction) flow.layout.instructions.get(use.index())).getReference())
                .filter(f -> f.getDefiningClass().equals(owner) && f.getType().equals(model)).distinct().toList(), "item-owned JSON slot");
        for (int n = 0; n < flow.layout.instructions.size(); n++) {
            Instruction i = flow.layout.instructions.get(n);
            if (i.getOpcode() != Opcode.IPUT_OBJECT || !reference(i).equals(slot.toString())) continue;
            TwoRegisterInstruction store = (TwoRegisterInstruction) i;
            requireFeature(flow.parsedOnEveryPath(value.result(), n, store.getRegisterA())
                    && flow.sourceOnEveryPath(allocation, -1, n, store.getRegisterB(), false),
                    "JSON slot does not preserve its exact parsed result or explicit null on every path: " + slot);
        }
        return slot;
    }

    private static MethodReference featureWrapper(FeatureFlow flow, FieldReference slot, String model) {
        List<MethodReference> wrappers = new ArrayList<>();
        for (int n = 0; n < flow.layout.instructions.size(); n++) {
            Instruction i = flow.layout.instructions.get(n);
            if (i.getOpcode() != Opcode.IGET_OBJECT || !reference(i).equals(slot.toString())) continue;
            for (FeatureUse use : flow.uses(n, -1)) {
                Instruction call = flow.layout.instructions.get(use.index());
                if (!isPlainInvoke(call.getOpcode()) || !(call instanceof ReferenceInstruction)
                        || !(((ReferenceInstruction) call).getReference() instanceof MethodReference)) continue;
                MethodReference target = (MethodReference) ((ReferenceInstruction) call).getReference();
                int[] args = invokeRegisters(call);
                if (target.getName().equals("<init>") && target.getParameterTypes().equals(List.of(model))
                        && args.length == 2 && args[1] == use.register()) wrappers.add(target);
            }
        }
        return featureOne(wrappers.stream().distinct().toList(), "wrapper consuming " + slot);
    }

    /** Resolve the selected content from the allocation that consumes each target raw slot.
     * A populated raw slot alone does not prove the vendor selected it as the active card. */
    private static FieldReference featureActiveContent(FeatureFlow flow, FieldReference slot, MethodReference wrapper,
            String item, Set<FeatureUse> itemReceivers) {
        Set<Integer> constructors = new HashSet<>();
        List<Instruction> body = flow.layout.instructions;
        for (int n = 0; n < body.size(); n++) {
            if (body.get(n).getOpcode() != Opcode.IGET_OBJECT || !reference(body.get(n)).equals(slot.toString())) continue;
            for (FeatureUse use : flow.uses(n, -1)) {
                Instruction call = body.get(use.index());
                if (isPlainInvoke(call.getOpcode()) && reference(call).equals(featureSig(wrapper))
                        && invokeRegisters(call).length == 2 && invokeRegisters(call)[1] == use.register()) constructors.add(use.index());
            }
        }
        Set<FieldReference> stores = new HashSet<>();
        for (int n = 0; n < body.size(); n++) {
            if (body.get(n).getOpcode() != Opcode.NEW_INSTANCE || !reference(body.get(n)).equals(wrapper.getDefiningClass())) continue;
            Set<FeatureUse> allocations = flow.uses(n, -1);
            boolean constructs = allocations.stream().anyMatch(use -> constructors.contains(use.index())
                    && invokeRegisters(body.get(use.index()))[0] == use.register());
            if (!constructs) continue;
            for (FeatureUse use : allocations) {
                Instruction i = body.get(use.index());
                if (i.getOpcode() != Opcode.IPUT_OBJECT || ((TwoRegisterInstruction) i).getRegisterA() != use.register()
                        || !itemReceivers.contains(new FeatureUse(use.index(), ((TwoRegisterInstruction) i).getRegisterB()))) continue;
                FieldReference field = (FieldReference) ((ReferenceInstruction) i).getReference();
                if (field.getDefiningClass().equals(item) && field.getType().startsWith("L")) stores.add(field);
            }
        }
        return featureOne(new ArrayList<>(stores), "active content field consuming " + slot);
    }

    private static void featureRecordableWrapper(Method wrapper, String model) {
        requireFeature(wrapper.getParameterTypes().equals(List.of(model)) && !AccessFlags.STATIC.isSet(wrapper.getAccessFlags())
                && wrapper.getReturnType().equals("V") && wrapper.getImplementation() != null, "raw wrapper constructor signature changed");
        int input = wrapper.getImplementation().getRegisterCount() - 1;
        requireFeature(input - 1 >= 2 && wrapper.getImplementation().getTryBlocks().isEmpty(), "raw wrapper has no safe unprotected recorder registers");
        boolean returns = false;
        for (Instruction i : wrapper.getImplementation().getInstructions()) {
            if (i.getOpcode() == Opcode.RETURN_VOID) returns = true;
            if (!i.getOpcode().setsRegister()) continue;
            int destination = ((OneRegisterInstruction) i).getRegisterA();
            int last = destination + (i.getOpcode().setsWideRegister() ? 1 : 0);
            requireFeature(last < input - 1 || destination > input, "raw wrapper overwrites its original receiver or parameter");
        }
        requireFeature(returns, "raw wrapper has no constructor return to record");
    }

    private static void featurePreserveCards(Map<String, ClassDef> before, Map<String, ClassDef> after,
            Map<String, List<Method>> patched, Method wrapper, Field recordedRaw) {
        for (String owner : before.keySet()) {
            ClassDef stock = before.get(owner), actual = after.get(owner);
            requireFeature(stock.getAccessFlags() == actual.getAccessFlags() && java.util.Objects.equals(stock.getSuperclass(), actual.getSuperclass())
                    && stock.getInterfaces().equals(actual.getInterfaces()) && java.util.Objects.equals(stock.getSourceFile(), actual.getSourceFile())
                    && stock.getAnnotations().equals(actual.getAnnotations()), "stock card class declaration changed: " + owner);
            Map<String, Field> fields = new HashMap<>(), actualFields = new HashMap<>();
            for (Field field : stock.getFields()) requireFeature(fields.put(field.toString(), field) == null, "duplicate stock card field: " + field);
            if (recordedRaw != null && owner.equals(wrapper.getDefiningClass())) fields.put(recordedRaw.toString(), recordedRaw);
            for (Field field : actual.getFields()) requireFeature(actualFields.put(field.toString(), field) == null, "duplicate patched card field: " + field);
            requireFeature(fields.keySet().equals(actualFields.keySet()), "stock card fields changed: " + owner);
            for (String field : fields.keySet()) featureFieldDeclaration(fields.get(field), actualFields.get(field));
            Set<String> methods = new HashSet<>(), actualMethods = new HashSet<>();
            for (Method m : actual.getMethods()) actualMethods.add(featureSig(m));
            for (Method m : stock.getMethods()) {
                methods.add(featureSig(m));
                Method p = featureMethod(patched, featureSig(m));
                if (m.getImplementation() == null) {
                    featureDeclaration(m, p);
                    requireFeature(p.getImplementation() == null, "stock card declaration changed: " + featureSig(m));
                } else featureBody(m, p, 0, Map.of(), "", recordedRaw != null && featureSig(m).equals(featureSig(wrapper)) ? recordedRaw : null);
            }
            requireFeature(methods.equals(actualMethods), "stock card methods added or removed: " + owner);
        }
    }

    /** Card fields are resolved from stock JSON keys, constructor arguments and enum allocation.
     * The generated predicate must then match every guard, receiver, branch and result register. */
    private static void featureSuggested(Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            File cleanApk, File patchedApk) throws Exception {
        MethodReference media = featureFeedPage(clean, patched);
        String item = media.getDefiningClass();
        Method kind = featureTarget(clean, m -> m.getDefiningClass().equals(item) && m.getParameterTypes().isEmpty()
                && m.getReturnType().startsWith("L") && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                && AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && holds(m, "feedItemType"), "feedItemType getter");
        String enumType = kind.getReturnType();
        Method initializer = featureMethod(clean, enumType + "-><clinit>()V");
        FieldReference suggestedKind = featureEnum(initializer, SUGGESTED_WIRE, "SUGGESTED_USERS", enumType);
        FieldReference kickstartKind = featureEnum(initializer, KICKSTART_WIRE, "KICKSTART_FEED_UNIT", enumType);
        Method constructor = featureTarget(clean, m -> m.getName().equals("<init>") && m.getReturnType().equals("V")
                && holds(m, "XDTSuggestedUsers"), "raw suggestion constructor");
        String model = constructor.getDefiningClass();
        Method parser = featureTarget(clean, m -> m.getName().equals("unsafeParseFromJson") && m.getReturnType().equals("Ljava/lang/Object;")
                && m.getParameterTypes().size() == 1 && holds(m, SUGGESTED_WIRE, KICKSTART_WIRE), "suggestion response parser");
        FeatureFlow root = new FeatureFlow(parser);
        int allocation = featureOne(java.util.stream.IntStream.range(0, root.layout.instructions.size()).boxed()
                .filter(n -> root.layout.instructions.get(n).getOpcode() == Opcode.NEW_INSTANCE
                        && reference(root.layout.instructions.get(n)).equals(item)).toList(), "parsed feed-item allocation");
        Set<FeatureUse> receivers = root.uses(allocation, -1);
        ParsedFeatureValue suggested = root.parsed(SUGGESTED_WIRE, model), kickstart = root.parsed(KICKSTART_WIRE, model);
        FieldReference suggestedSlot = featureSlot(root, suggested, item, model, receivers, allocation);
        FieldReference kickstartSlot = featureSlot(root, kickstart, item, model, receivers, allocation);
        requireFeature(!suggestedSlot.equals(kickstartSlot) && suggested.parser().equals(kickstart.parser()), "card slots are not distinct with one raw parser");
        Method rawParser = featureTarget(clean, m -> m.getDefiningClass().equals(suggested.parser()) && m.getName().equals("unsafeParseFromJson")
                && m.getReturnType().equals("Ljava/lang/Object;") && m.getParameterTypes().equals(parser.getParameterTypes()) && holds(m, "netego_type"), "raw netego_type parser");
        FeatureFlow raw = new FeatureFlow(rawParser);
        ParsedFeatureValue rawValue = raw.parsed("netego_type", FEATURE_STRING);
        Set<Integer> arguments = new HashSet<>();
        for (FeatureUse use : raw.uses(rawValue.result(), -1)) {
            Instruction call = raw.layout.instructions.get(use.index());
            if (!isPlainInvoke(call.getOpcode()) || !reference(call).equals(featureSig(constructor))) continue;
            int[] args = invokeRegisters(call);
            int word = 1;
            for (int n = 0; n < constructor.getParameterTypes().size(); n++) {
                CharSequence parameter = constructor.getParameterTypes().get(n);
                if (word < args.length && args[word] == use.register() && parameter.equals(FEATURE_STRING)) arguments.add(n);
                word += slots(parameter);
            }
        }
        int argument = featureOne(new ArrayList<>(arguments), "netego_type constructor argument");
        int argumentWord = 1;
        for (int n = 0; n < argument; n++) argumentWord += slots(constructor.getParameterTypes().get(n));
        for (int n = 0; n < raw.layout.instructions.size(); n++) {
            Instruction i = raw.layout.instructions.get(n);
            if (!isPlainInvoke(i.getOpcode()) || !reference(i).equals(featureSig(constructor))) continue;
            int[] args = invokeRegisters(i);
            requireFeature(argumentWord < args.length && raw.parsedOnEveryPath(rawValue.result(), n, args[argumentWord]),
                    "netego_type constructor argument does not preserve its exact parsed result or explicit null on every path");
        }
        int thisRegister = constructor.getImplementation().getRegisterCount() - 1 - constructor.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        int parameterRegister = thisRegister + 1;
        for (int n = 0; n < argument; n++) parameterRegister += slots(constructor.getParameterTypes().get(n));
        FeatureFlow modelFlow = new FeatureFlow(constructor);
        FieldReference rawType = featureOne(modelFlow.uses(-1, parameterRegister).stream().filter(use -> {
            Instruction i = modelFlow.layout.instructions.get(use.index());
            return i.getOpcode() == Opcode.IPUT_OBJECT && ((TwoRegisterInstruction) i).getRegisterA() == use.register()
                    && ((TwoRegisterInstruction) i).getRegisterB() == thisRegister;
        }).map(use -> (FieldReference) ((ReferenceInstruction) modelFlow.layout.instructions.get(use.index())).getReference())
                .filter(f -> f.getDefiningClass().equals(model) && f.getType().equals(FEATURE_STRING)).distinct().toList(), "constructor-owned netego_type field");
        List<Integer> rawStores = new ArrayList<>();
        for (int n = 0; n < modelFlow.layout.instructions.size(); n++) {
            Instruction i = modelFlow.layout.instructions.get(n);
            if (i.getOpcode() == Opcode.IPUT_OBJECT && reference(i).equals(rawType.toString())) rawStores.add(n);
        }
        int rawStore = featureOne(rawStores, "single netego_type constructor writer");
        TwoRegisterInstruction rawWrite = (TwoRegisterInstruction) modelFlow.layout.instructions.get(rawStore);
        requireFeature(modelFlow.parameterOnEveryPath(rawStore, rawWrite.getRegisterB(), thisRegister)
                && modelFlow.parameterOnEveryPath(rawStore, rawWrite.getRegisterA(), parameterRegister),
                "netego_type writer does not preserve the parsed constructor parameter on every path");
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (!m.getDefiningClass().equals(model) || featureSig(m).equals(featureSig(constructor))) continue;
            requireFeature(instructions(m).stream().noneMatch(i -> i.getOpcode() == Opcode.IPUT_OBJECT && reference(i).equals(rawType.toString())),
                    "netego_type has another model writer: " + featureSig(m));
        }
        MethodReference wrapperCall = featureWrapper(root, suggestedSlot, model);
        requireFeature(featureSig(wrapperCall).equals(featureSig(featureWrapper(root, kickstartSlot, model))), "card slots use different wrappers");
        Method wrapper = featureMethod(clean, featureSig(wrapperCall));
        FieldReference activeContent = featureActiveContent(root, suggestedSlot, wrapperCall, item, receivers);
        requireFeature(activeContent.equals(featureActiveContent(root, kickstartSlot, wrapperCall, item, receivers)), "card slots do not select one active content field");
        featureRecordableWrapper(wrapper, model);
        FeatureFlow wrapperFlow = new FeatureFlow(wrapper);
        Set<Integer> mapReads = new HashSet<>();
        for (int n = 0; n < wrapperFlow.layout.instructions.size(); n++) {
            Instruction i = wrapperFlow.layout.instructions.get(n);
            if (i.getOpcode() != Opcode.IGET_OBJECT || !reference(i).equals(rawType.toString())) continue;
            for (FeatureUse use : wrapperFlow.uses(n, -1)) {
                int at = use.index();
                Instruction call = wrapperFlow.layout.instructions.get(at);
                if (reference(call).equals("Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;") && invokeRegisters(call)[1] == use.register()
                        && at + 2 < wrapperFlow.layout.instructions.size() && wrapperFlow.layout.instructions.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && wrapperFlow.layout.instructions.get(at + 2).getOpcode() == Opcode.CHECK_CAST
                        && reference(wrapperFlow.layout.instructions.get(at + 2)).equals(enumType)
                        && ((OneRegisterInstruction) wrapperFlow.layout.instructions.get(at + 1)).getRegisterA()
                        == ((OneRegisterInstruction) wrapperFlow.layout.instructions.get(at + 2)).getRegisterA()) {
                    int input = wrapper.getImplementation().getRegisterCount() - 1;
                    requireFeature(wrapperFlow.parameterOnEveryPath(n, ((TwoRegisterInstruction) i).getRegisterB(), input)
                            && wrapperFlow.lookupOnEveryPath(n, at, invokeRegisters(call)[1], input),
                            "raw netego_type lookup does not preserve its original raw tag on every path");
                    mapReads.add(at);
                }
            }
        }
        requireFeature(mapReads.size() == 1, "raw netego_type does not select the wrapper's feed enum");
        Set<String> owners = Set.of(item, enumType, model, parser.getDefiningClass(), rawParser.getDefiningClass(), wrapper.getDefiningClass());
        Map<String, ClassDef> before = featureClasses(cleanApk, owners), after = featureClasses(patchedApk, owners);
        String wrapperType = wrapper.getDefiningClass();
        List<Field> captureFields = new ArrayList<>();
        for (Field field : before.get(wrapperType).getFields()) requireFeature(!field.getName().equals(RECORDED_RAW), "stock wrapper already has a recording field");
        for (Field field : after.get(wrapperType).getFields()) if (field.getName().equals(RECORDED_RAW)) captureFields.add(field);
        Field recordedRaw = featureOne(captureFields, "owned raw-wrapper recording field");
        requireFeature(recordedRaw.getType().equals(model) && recordedRaw.getAccessFlags() == (AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue())
                && recordedRaw.getInitialValue() == null && recordedRaw.getAnnotations().isEmpty()
                && recordedRaw.getHiddenApiRestrictions().isEmpty(), "raw-wrapper recording field has a different declaration");
        requireFeature(before.get(enumType).getSuperclass().equals("Ljava/lang/Enum;") && AccessFlags.PUBLIC.isSet(before.get(enumType).getAccessFlags())
                && AccessFlags.PUBLIC.isSet(before.get(model).getAccessFlags()), "card enum/model is inaccessible");
        featureField(before.get(enumType), suggestedKind, true);
        featureField(before.get(enumType), kickstartKind, true);
        featureField(before.get(item), suggestedSlot, false);
        featureField(before.get(item), kickstartSlot, false);
        featureField(before.get(item), activeContent, false);
        requireFeature(AccessFlags.FINAL.isSet(featureField(before.get(model), rawType, false).getAccessFlags()), "raw netego_type field is mutable");
        featurePreserveCards(before, after, patched, wrapper, recordedRaw);
        Method stub = featureMethod(patched, ADS + "isSuggestedUserItem(Ljava/lang/Object;)Z");
        List<Instruction> body = instructions(stub);
        Opcode[] expected = { Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                Opcode.IF_NEZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.SGET_OBJECT,
                Opcode.IF_NE, Opcode.IGET_OBJECT, Opcode.CONST_STRING, Opcode.GOTO, Opcode.IGET_OBJECT, Opcode.CONST_STRING,
                Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.IGET_OBJECT,
                Opcode.IF_NE, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN };
        int[][] registers = { {0, 4}, {0}, {4}, {4}, {0}, {0}, {4}, {0}, {1}, {0, 1}, {1}, {0, 1}, {0, 4}, {1}, {},
                {0, 4}, {1}, {0}, {2, 4}, {3, 2}, {3}, {2}, {2, 2}, {0, 2}, {0, 0}, {1, 0}, {0}, {0}, {0}, {0} };
        requireFeature(body.size() == expected.length && AccessFlags.STATIC.isSet(stub.getAccessFlags())
                && stub.getImplementation().getRegisterCount() == 5 && stub.getImplementation().getTryBlocks().isEmpty(), "suggestion predicate is a stub or has a different declaration");
        Map<Integer, String> references = Map.ofEntries(Map.entry(0, item), Map.entry(2, item), Map.entry(3, featureSig(media)), Map.entry(6, featureSig(kind)),
                Map.entry(8, suggestedKind.toString()), Map.entry(10, kickstartKind.toString()), Map.entry(12, kickstartSlot.toString()), Map.entry(13, KICKSTART_WIRE),
                Map.entry(15, suggestedSlot.toString()), Map.entry(16, SUGGESTED_WIRE), Map.entry(18, activeContent.toString()), Map.entry(19, wrapperType),
                Map.entry(21, wrapperType), Map.entry(22, recordedRaw.toString()), Map.entry(24, rawType.toString()), Map.entry(25, STRING_EQUALS));
        Layout layout = new Layout(stub.getImplementation());
        Map<Integer, Integer> branches = Map.of(1, 28, 5, 28, 9, 15, 11, 28, 14, 17, 17, 28, 20, 28, 23, 28);
        for (int n = 0; n < body.size(); n++) {
            Instruction i = body.get(n);
            requireFeature(i.getOpcode() == expected[n] || expected[n] == Opcode.CONST_STRING && i.getOpcode() == Opcode.CONST_STRING_JUMBO,
                    "suggestion predicate instruction " + n + " changed");
            int[] actualRegisters = isPlainInvoke(i.getOpcode()) ? invokeRegisters(i)
                    : i instanceof TwoRegisterInstruction ? new int[]{ ((TwoRegisterInstruction) i).getRegisterA(), ((TwoRegisterInstruction) i).getRegisterB() }
                    : i instanceof OneRegisterInstruction ? new int[]{ ((OneRegisterInstruction) i).getRegisterA() } : new int[0];
            requireFeature(Arrays.equals(actualRegisters, registers[n]), "suggestion predicate registers changed at " + n);
            if (references.containsKey(n)) requireFeature(reference(i).equals(references.get(n)), "suggestion predicate target changed at " + n);
            if (branches.containsKey(n)) requireFeature(layout.addresses.get(n) + ((OffsetInstruction) i).getCodeOffset()
                    == layout.addresses.get(branches.get(n)), "suggestion predicate guard changed at " + n);
        }
        requireFeature(((WideLiteralInstruction) body.get(28)).getWideLiteral() == 0, "unknown suggestion cards do not return false");
        featureHostCalls(patched, featureSig(stub), Map.of());
    }

    private static int ownedPermalinkStore(Method parser, Map<String, String> parents) {
        List<Instruction> body = instructions(parser);
        Set<Integer> stores = new HashSet<>();
        for (int t = 0; t < body.size(); t++) {
            if (!reference(body.get(t)).equals("XDTPermalinkResponse")) continue;
            int nameRegister = ((OneRegisterInstruction) body.get(t)).getRegisterA();
            for (int n = t + 1; n < body.size(); n++) {
                if (body.get(n).getOpcode() != Opcode.NEW_INSTANCE) continue;
                String owner = reference(body.get(n));
                Set<String> constructorOwners = new HashSet<>();
                String ancestor = owner;
                while (ancestor != null && constructorOwners.size() < 20 && constructorOwners.add(ancestor)) ancestor = parents.get(ancestor);
                Set<Integer> aliases = new HashSet<>(Set.of(((OneRegisterInstruction) body.get(n)).getRegisterA()));
                boolean named = false, nameAlive = true;
                for (int k = t + 1; k <= n; k++) if (body.get(k).getOpcode().setsRegister()
                        && (((OneRegisterInstruction) body.get(k)).getRegisterA() == nameRegister
                        || body.get(k).getOpcode().setsWideRegister() && ((OneRegisterInstruction) body.get(k)).getRegisterA() == nameRegister - 1)) nameAlive = false;
                for (int k = n + 1; k < body.size() && !aliases.isEmpty(); k++) {
                    Instruction i = body.get(k);
                    if (i instanceof OffsetInstruction || !i.getOpcode().canContinue()) break;
                    if ((i.getOpcode() == Opcode.INVOKE_DIRECT || i.getOpcode() == Opcode.INVOKE_DIRECT_RANGE)
                            && ((ReferenceInstruction) i).getReference() instanceof MethodReference) {
                        MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
                        int[] registers = invokeRegisters(i);
                        int word = 1;
                        for (CharSequence p : call.getParameterTypes()) {
                            if (call.getName().equals("<init>") && constructorOwners.contains(call.getDefiningClass())
                                    && call.getReturnType().equals("V") && aliases.contains(registers[0]) && nameAlive
                                    && p.toString().equals("Ljava/lang/String;") && registers[word] == nameRegister) named = true;
                            word += slots(p.toString());
                        }
                    }
                    if (named && i.getOpcode() == Opcode.IPUT_OBJECT) {
                        FieldReference field = (FieldReference) ((ReferenceInstruction) i).getReference();
                        if (field.getDefiningClass().equals(owner) && field.getType().equals("Ljava/lang/String;")
                                && aliases.contains(((TwoRegisterInstruction) i).getRegisterB())) stores.add(k);
                    }
                    if (i.getOpcode().setsRegister()) {
                        int dest = ((OneRegisterInstruction) i).getRegisterA();
                        boolean carries = (i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                                || i.getOpcode() == Opcode.MOVE_OBJECT_16) && aliases.contains(((TwoRegisterInstruction) i).getRegisterB());
                        if (i.getOpcode() == Opcode.CHECK_CAST) carries = aliases.contains(dest);
                        aliases.remove(dest);
                        if (i.getOpcode().setsWideRegister()) aliases.remove(dest + 1);
                        if (carries) aliases.add(dest);
                        if (dest == nameRegister || i.getOpcode().setsWideRegister() && dest + 1 == nameRegister) nameAlive = false;
                    }
                }
            }
        }
        requireFeature(stores.size() == 1, "permalink has " + stores.size() + " owned String stores");
        return stores.iterator().next();
    }

    private static void featureLinks(Map<String, List<Method>> clean, Map<String, List<Method>> patched, Map<String, String> parents) {
        Method parser = featureTarget(clean, m -> m.getName().equals("unsafeParseFromJson")
                && m.getReturnType().equals("Ljava/lang/Object;") && holds(m, "permalink", "XDTPermalinkResponse"), "permalink parser");
        int store = ownedPermalinkStore(parser, parents);
        int link = ((TwoRegisterInstruction) instructions(parser).get(store)).getRegisterA();
        featureBody(parser, featureMethod(patched, featureSig(parser)), 0, Map.of(store, link), CLEAN_LINK);
        featureHostCalls(patched, CLEAN_LINK, Map.of(featureSig(parser), 1));

        // The share sheet's fetch reads that link through the response's getter of the same field,
        // and each read is followed by the post's code and author's name going to the extension.
        FieldReference field = (FieldReference) ((ReferenceInstruction) instructions(parser).get(store)).getReference();
        Set<String> chain = new HashSet<>();
        for (String type = field.getDefiningClass(); type != null && chain.add(type); type = parents.get(type)) { }
        Set<String> owners = new HashSet<>(chain);
        for (String type : chain) owners.addAll(INTERFACES.getOrDefault(type, List.of()));
        Set<String> getters = new HashSet<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (chain.contains(m.getDefiningClass()) && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Ljava/lang/String;")
                    && instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.IGET_OBJECT && reference(i).equals(field.toString()))) {
                getters.add(m.getName());
            }
        }
        Method fetch = featureTarget(clean, m -> m.getDefiningClass().equals(PERMALINK_REPOSITORY)
                && m.getReturnType().equals("Ljava/lang/Object;") && m.getParameterTypes().size() == 4
                && m.getParameterTypes().get(1).toString().equals(MEDIA) && holds(m, "itas-android"), "post link fetch");
        List<Instruction> body = instructions(fetch);
        List<Integer> reads = linkReads(body, owners, getters);
        requireFeature(!reads.isEmpty(), "post link fetch never reads the permalink");
        List<Integer> posts = new ArrayList<>();
        for (int k = reads.get(reads.size() - 1); k < body.size(); k++) {
            if (body.get(k).getOpcode() == Opcode.IPUT_OBJECT && ((FieldReference) ((ReferenceInstruction) body.get(k)).getReference()).getType().equals(MEDIA)) posts.add(k);
        }
        requireFeature(posts.size() == 1, "post link fetch stores " + posts.size() + " posts with the link");
        int post = ((TwoRegisterInstruction) body.get(posts.get(0))).getRegisterA();
        Map<Integer, FeatureBlock> blocks = new HashMap<>();
        for (int read : reads) {
            int value = ((OneRegisterInstruction) body.get(read + 1)).getRegisterA();
            blocks.put(read + 2, (now, at) -> featurePostLink(clean, now, at, value, post));
        }
        featureBody(fetch, featureMethod(patched, featureSig(fetch)), 0, Map.of(), POST_LINK, null, blocks);

        // Copy link and the other rows read the link themselves, in an object that holds its post
        // in one post field. Each read is followed by the post out of that field, then the same hook.
        Map<String, Integer> calls = new HashMap<>(Map.of(featureSig(fetch), reads.size()));
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            String type = m.getDefiningClass();
            List<String> postFields = POST_FIELDS.getOrDefault(type, List.of());
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null || postFields.size() != 1
                    || type.equals(PERMALINK_REPOSITORY) || type.startsWith("Lapp/morphe/extension/")) continue;
            List<Instruction> holder = instructions(m);
            List<Integer> holderReads = linkReads(holder, owners, getters);
            if (holderReads.isEmpty()) continue;
            int self = m.getImplementation().getRegisterCount() - m.getParameterTypes().size() - 1
                    - (int) m.getParameterTypes().stream().filter(p -> p.toString().equals("J") || p.toString().equals("D")).count();
            String held = type + "->" + postFields.get(0) + ":" + MEDIA;
            Map<Integer, FeatureBlock> holderBlocks = new HashMap<>();
            for (int read : holderReads) {
                int value = ((OneRegisterInstruction) holder.get(read + 1)).getRegisterA();
                holderBlocks.put(read + 2, (now, at) -> featureHolderLink(clean, now, at, value, self, held));
            }
            featureBody(m, featureMethod(patched, featureSig(m)), 0, Map.of(), POST_LINK, null, holderBlocks);
            calls.put(featureSig(m), holderReads.size());
        }
        requireFeature(calls.size() > 1, "nothing that holds a post reads the permalink");

        // Send, WhatsApp status or Instagram story, and WhatsApp quick sends read the link in a
        // coroutine that has let go of its post. The post goes to the extension against the
        // coroutine before the wait, and comes back out for the same hook after each read.
        Map<String, Integer> remembers = new TreeMap<>(), recalls = new TreeMap<>();
        boolean fetcher = false;
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            String type = m.getDefiningClass();
            if (m.getImplementation() == null || calls.containsKey(featureSig(m)) || type.equals(PERMALINK_REPOSITORY)
                    || type.startsWith("Lapp/morphe/extension/")) continue;
            List<Instruction> stock = instructions(m);
            List<Integer> stockReads = linkReads(stock, owners, getters);
            if (stockReads.isEmpty()) continue;
            List<Integer> fetches = new ArrayList<>();
            for (int k = 0; k < stock.size(); k++) if (plainFetch(stock.get(k), fetch)) fetches.add(k);
            int self = m.getImplementation().getRegisterCount() - 2;
            Map<Integer, FeatureBlock> resumed = new HashMap<>();
            final int key;
            if (!fetches.isEmpty()) {
                // The receiver, then the four arguments: the post is the second and the continuation the last.
                key = invokeRegisters(stock.get(fetches.get(0)))[4];
                for (int call : fetches) {
                    int[] arguments = invokeRegisters(stock.get(call));
                    requireFeature(arguments[4] == key, featureSig(m) + " hands the plain fetch more than one continuation");
                    resumed.put(call, (now, at) -> featureRemember(now, at, key, arguments[2]));
                }
                fetcher = true;
            } else if (m.getName().equals("invokeSuspend") && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && m.getParameterTypes().size() == 1 && m.getParameterTypes().get(0).toString().equals("Ljava/lang/Object;")
                    && m.getReturnType().equals("Ljava/lang/Object;")) {
                key = self;
                for (int read : stockReads) {
                    int cast = read - 1;
                    while (cast > 0 && !ownPostCast(stock, cast, self, type)) cast--;
                    requireFeature(cast > 0, featureSig(m) + " reads the permalink with no cast of its own post field before it");
                    int kept = registerA(stock.get(cast));
                    resumed.put(cast + 1, (now, at) -> featureRemember(now, at, self, kept));
                }
            } else {
                continue;
            }
            remembers.put(featureSig(m), resumed.size());
            for (int read : stockReads) {
                int value = registerA(stock.get(read + 1));
                resumed.put(read + 2, (now, at) -> featureResumeLink(clean, now, at, value, key));
            }
            featureBody(m, featureMethod(patched, featureSig(m)), 0, Map.of(), POST_LINK, null, resumed);
            recalls.put(featureSig(m), stockReads.size());
            calls.put(featureSig(m), stockReads.size());
        }
        requireFeature(fetcher, "nothing outside a holder hands the plain fetch a post and reads the permalink");
        featureHostCalls(patched, POST_LINK, calls);
        featureHostCalls(patched, REMEMBER_POST, remembers);
        featureHostCalls(patched, REMEMBERED_POST, recalls);
    }

    /** A call to the repository's plain fetch: a post in, the answer out, and not [own], the fetch hooked inside. */
    private static boolean plainFetch(Instruction i, Method own) {
        if ((i.getOpcode() != Opcode.INVOKE_VIRTUAL && i.getOpcode() != Opcode.INVOKE_VIRTUAL_RANGE)
                || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) return false;
        MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
        return call.getDefiningClass().equals(PERMALINK_REPOSITORY) && call.getReturnType().equals("Ljava/lang/Object;")
                && call.getParameterTypes().size() == 4 && call.getParameterTypes().get(1).toString().equals(MEDIA)
                && !featureSig(call).equals(featureSig(own));
    }

    /** Whether [body] at [k] casts to a post what the instruction before read out of [owner]'s own field through this in [self]. */
    private static boolean ownPostCast(List<Instruction> body, int k, int self, String owner) {
        if (body.get(k).getOpcode() != Opcode.CHECK_CAST || !reference(body.get(k)).equals(MEDIA)
                || body.get(k - 1).getOpcode() != Opcode.IGET_OBJECT) return false;
        TwoRegisterInstruction load = (TwoRegisterInstruction) body.get(k - 1);
        return load.getRegisterB() == self && load.getRegisterA() == registerA(body.get(k))
                && ((FieldReference) ((ReferenceInstruction) load).getReference()).getDefiningClass().equals(owner);
    }

    /** The post going to the extension against the coroutine in [key], just before the share waits. */
    private static int featureRemember(List<Instruction> body, int at, int key, int post) {
        requireFeature(at < body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(REMEMBER_POST)
                && Arrays.equals(invokeRegisters(body.get(at)), new int[]{key, post}), "missing or miswired " + REMEMBER_POST + " at instruction " + at);
        return 1;
    }

    /** A resumed share's hook: the post kept against [key] back out of the extension, cast to a post, then the fetch's hook with it. */
    private static int featureResumeLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int key) {
        requireFeature(at + 3 <= body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(REMEMBERED_POST)
                && Arrays.equals(invokeRegisters(body.get(at)), new int[]{key}) && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT,
                "missing or miswired " + REMEMBERED_POST + " at instruction " + at);
        int post = registerA(body.get(at + 1));
        requireFeature(post != key && post != link && body.get(at + 2).getOpcode() == Opcode.CHECK_CAST
                && registerA(body.get(at + 2)) == post && reference(body.get(at + 2)).equals(MEDIA),
                "resumed link hook doesn't cast the post it got back at " + (at + 2));
        return 3 + featurePostLink(clean, body, at + 3, link, post);
    }

    /** The reads of the permalink in [body]: a call to one of [getters] on [owners], and its result. */
    private static List<Integer> linkReads(List<Instruction> body, Set<String> owners, Set<String> getters) {
        List<Integer> reads = new ArrayList<>();
        for (int k = 0; k + 1 < body.size(); k++) {
            Instruction i = body.get(k);
            if ((i.getOpcode() != Opcode.INVOKE_INTERFACE && i.getOpcode() != Opcode.INVOKE_VIRTUAL)
                    || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) continue;
            MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
            if (owners.contains(call.getDefiningClass()) && getters.contains(call.getName()) && call.getParameterTypes().isEmpty()
                    && call.getReturnType().equals("Ljava/lang/String;") && body.get(k + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT) reads.add(k);
        }
        return reads;
    }

    /** A holder's hook: this into a free local, the post out of the holder's post field, then the fetch's hook with that post. */
    private static int featureHolderLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int self, String post) {
        requireFeature(at + 2 <= body.size() && body.get(at).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                && body.get(at + 1).getOpcode() == Opcode.IGET_OBJECT, "holder link hook doesn't load its post at " + at);
        TwoRegisterInstruction copy = (TwoRegisterInstruction) body.get(at), load = (TwoRegisterInstruction) body.get(at + 1);
        int media = copy.getRegisterA();
        requireFeature(copy.getRegisterB() == self && media < self, "holder link hook reads its post through another register than this");
        requireFeature(load.getRegisterA() == media && load.getRegisterB() == media && reference(body.get(at + 1)).equals(post),
                "holder link hook reads another field than " + post);
        return 2 + featurePostLink(clean, body, at + 2, link, media);
    }

    /**
     * The hook after one link read: null code and name, the post's code and its author's username
     * when there is a post and an author, then the extension with the link, the name and the code,
     * its answer replacing the link.
     */
    private static int featurePostLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int post) {
        Opcode[] shape = {Opcode.CONST_4, Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT};
        requireFeature(at + shape.length <= body.size(), "post link hook cut short at " + at);
        for (int n = 0; n < shape.length; n++) requireFeature(body.get(at + n).getOpcode() == shape[n], "post link hook differs at " + (at + n));
        int code = registerA(body.get(at)), name = registerA(body.get(at + 1));
        requireFeature(((WideLiteralInstruction) body.get(at)).getWideLiteral() == 0 && ((WideLiteralInstruction) body.get(at + 1)).getWideLiteral() == 0,
                "post link hook doesn't start from null");
        requireFeature(new HashSet<>(List.of(code, name, link, post)).size() == 4, "post link hook shares a register");
        requireFeature(registerA(body.get(at + 2)) == post && lands(body, at + 2) == at + 10, "post link hook's post check skips the wrong way");
        requireFeature(Arrays.equals(invokeRegisters(body.get(at + 3)), new int[]{post}) && registerA(body.get(at + 4)) == code
                && readsField(clean, body.get(at + 3), MEDIA, "Ljava/lang/String;", "code"), "post link hook reads another post field than code");
        requireFeature(Arrays.equals(invokeRegisters(body.get(at + 5)), new int[]{post}) && registerA(body.get(at + 6)) == name
                && readsField(clean, body.get(at + 5), MEDIA, USER, "user"), "post link hook reads another post field than user");
        requireFeature(registerA(body.get(at + 7)) == name && lands(body, at + 7) == at + 10, "post link hook's author check skips the wrong way");
        requireFeature(Arrays.equals(invokeRegisters(body.get(at + 8)), new int[]{name}) && registerA(body.get(at + 9)) == name
                && readsField(clean, body.get(at + 8), USER, "Ljava/lang/String;", "username"), "post link hook reads another user field than username");
        requireFeature(reference(body.get(at + 10)).equals(POST_LINK) && Arrays.equals(invokeRegisters(body.get(at + 10)), new int[]{link, name, code})
                && registerA(body.get(at + 11)) == link, "missing or miswired " + POST_LINK + " at instruction " + (at + 10));
        return shape.length;
    }

    private static int registerA(Instruction i) {
        return ((OneRegisterInstruction) i).getRegisterA();
    }

    /** The index a forward branch at [index] lands on, or -1 when it lands between instructions or behind. */
    private static int lands(List<Instruction> body, int index) {
        int offset = ((OffsetInstruction) body.get(index)).getCodeOffset(), units = 0, k = index;
        while (units < offset && k < body.size()) units += body.get(k++).getCodeUnits();
        return offset > 0 && units == offset ? k : -1;
    }

    /** Whether [call] is a getter on [owner] answering [returns] that reads the Pando field named [field] by its hash. */
    private static boolean readsField(Map<String, List<Method>> clean, Instruction call, String owner, String returns, String field) {
        MethodReference m = (MethodReference) ((ReferenceInstruction) call).getReference();
        if (!m.getDefiningClass().equals(owner) || !m.getParameterTypes().isEmpty() || !m.getReturnType().equals(returns)) return false;
        List<Method> found = clean.getOrDefault(featureSig(m), List.of());
        return found.size() == 1 && instructions(found.get(0)).stream().anyMatch(i -> i instanceof WideLiteralInstruction
                && i.getOpcode().name.startsWith("const") && ((WideLiteralInstruction) i).getWideLiteral() == field.hashCode());
    }

    private static void featureAnalytics(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        int mask = featureConstant(patched, "analyticsAddressMask", "I");
        requireFeature(mask > 0 && (mask & ~7) == 0, "analytics has no valid recorded address coverage");
        Map<Method, Map<Integer, Integer>> wraps = new LinkedHashMap<>();
        if ((mask & 1) != 0) {
            Method pigeon = featureTarget(clean, m -> AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && m.getReturnType().equals("Ljava/lang/String;") && m.getParameterTypes().equals(List.of("Ljava/lang/String;", "Z"))
                    && holds(m, "/pigeon_nest", "/logging_client_events"), "PIGEON");
            Map<Integer, Integer> returns = new TreeMap<>();
            List<Instruction> body = instructions(pigeon);
            for (int k = 0; k < body.size(); k++) if (body.get(k).getOpcode() == Opcode.RETURN_OBJECT)
                returns.put(k, ((OneRegisterInstruction) body.get(k)).getRegisterA());
            requireFeature(!returns.isEmpty(), "PIGEON has no address returns");
            wraps.put(pigeon, returns);
        }
        if ((mask & 2) != 0) {
            int sites = 0;
            for (List<Method> definitions : clean.values()) for (Method m : definitions) {
                List<Instruction> body = instructions(m);
                for (int k = 1; k < body.size(); k++) if (body.get(k).getOpcode() == Opcode.RETURN_OBJECT
                        && reference(body.get(k - 1)).equals(LOGGING_URL)
                        && (body.get(k - 1).getOpcode() == Opcode.CONST_STRING || body.get(k - 1).getOpcode() == Opcode.CONST_STRING_JUMBO)
                        && ((OneRegisterInstruction) body.get(k - 1)).getRegisterA() == ((OneRegisterInstruction) body.get(k)).getRegisterA()) {
                    wraps.computeIfAbsent(m, key -> new TreeMap<>()).put(k, ((OneRegisterInstruction) body.get(k)).getRegisterA());
                    sites++;
                }
            }
            requireFeature(sites > 0, "DEFAULT has no literal address answers");
        }
        if ((mask & 4) != 0) {
            Method mqtt = featureTarget(clean, m -> m.getName().equals("<init>")
                    && m.getParameterTypes().equals(List.of("Lorg/json/JSONObject;"))
                    && holds(m, "analytics_endpoint", LOGGING_URL), "MQTT");
            List<Instruction> body = instructions(mqtt);
            int key = -1, read = -1;
            for (int k = 0; k < body.size(); k++) {
                if (reference(body.get(k)).equals("analytics_endpoint") && key < 0) key = k;
                if (key >= 0 && body.get(k).getOpcode() == Opcode.MOVE_RESULT_OBJECT) { read = k; break; }
            }
            requireFeature(read >= 0 && read + 1 < body.size(), "MQTT never reads its analytics address");
            wraps.computeIfAbsent(mqtt, unused -> new TreeMap<>()).put(read + 1, ((OneRegisterInstruction) body.get(read)).getRegisterA());
        }
        Map<String, Integer> calls = new TreeMap<>();
        for (Map.Entry<Method, Map<Integer, Integer>> e : wraps.entrySet()) {
            featureBody(e.getKey(), featureMethod(patched, featureSig(e.getKey())), 0, e.getValue(), ENDPOINT);
            calls.put(featureSig(e.getKey()), e.getValue().size());
        }
        featureHostCalls(patched, ENDPOINT, calls);
    }

    private static void featureTrust(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method stock = featureTarget(clean, m -> m.getParameterTypes().isEmpty() && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                && !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;").isEmpty()
                && !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getSigningCertificateHistory()[Landroid/content/pm/Signature;").isEmpty()
                && instructions(m).stream().anyMatch(i -> reference(i).equals("Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;")),
                "signature wrapper");
        Method actual = featureMethod(patched, featureSig(stock));
        List<Instruction> body = instructions(actual);
        requireFeature(body.size() >= 9 && body.get(0).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                && body.get(1).getOpcode() == Opcode.IGET_OBJECT && body.get(4).getOpcode() == Opcode.IF_EQZ
                && body.get(5).getOpcode() == Opcode.NEW_INSTANCE && body.get(6).getOpcode() == Opcode.CONST_4
                && body.get(7).getOpcode() == Opcode.INVOKE_DIRECT && body.get(8).getOpcode() == Opcode.RETURN_OBJECT,
                "signature wrapper prefix is missing");
        FieldReference info = (FieldReference) ((ReferenceInstruction) body.get(1)).getReference();
        requireFeature(info.getDefiningClass().equals(stock.getDefiningClass()) && info.getType().equals("Landroid/content/pm/PackageInfo;")
                && instructions(stock).stream().anyMatch(i -> reference(i).equals(info.toString())), "signature wrapper reads the wrong PackageInfo");
        int self = actual.getImplementation().getRegisterCount() - 1;
        requireFeature(((TwoRegisterInstruction) body.get(0)).getRegisterA() == 0
                && ((TwoRegisterInstruction) body.get(0)).getRegisterB() == self
                && ((TwoRegisterInstruction) body.get(1)).getRegisterA() == 0 && ((TwoRegisterInstruction) body.get(1)).getRegisterB() == 0,
                "signature wrapper uses the wrong PackageInfo receiver");
        featureCall(body, 2, SIGNERS, 0, 1);
        requireFeature(((OneRegisterInstruction) body.get(4)).getRegisterA() == 1
                && ((OneRegisterInstruction) body.get(5)).getRegisterA() == 0 && reference(body.get(5)).equals(stock.getReturnType())
                && ((OneRegisterInstruction) body.get(6)).getRegisterA() == 2 && ((WideLiteralInstruction) body.get(6)).getWideLiteral() == 0
                && reference(body.get(7)).equals(stock.getReturnType() + "-><init>(Ljava/util/List;ZZ)V")
                && Arrays.equals(invokeRegisters(body.get(7)), new int[]{0, 1, 2, 2})
                && ((OneRegisterInstruction) body.get(8)).getRegisterA() == 0, "signature wrapper changes result flags or constructor");
        Layout layout = new Layout(actual.getImplementation());
        requireFeature(layout.addresses.get(4) + ((OffsetInstruction) body.get(4)).getCodeOffset() == layout.addresses.get(9),
                "null signers do not fall back to the original body");
        featureBody(stock, actual, 9, Map.of(), SIGNERS);
        featureHostCalls(patched, SIGNERS, Map.of(featureSig(stock), 1));
    }

    /**
     * Open links in browser: Threads' browser launcher asks the extension first. Its first six
     * instructions copy the context and the link into two locals, call the extension, and return
     * when the link went out. A kept link falls through to the stock launcher, unchanged.
     */
    private static void featureBrowser(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method stock = featureTarget(clean, m -> AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals("V")
                && holds(m, LAUNCHER_MESSAGE), "browser launcher");
        requireFeature(stock.getParameterTypes().size() > 0 && stock.getParameterTypes().get(0).equals("Landroid/content/Context;")
                && stock.getParameterTypes().stream().noneMatch(p -> p.equals("J") || p.equals("D")),
                "browser launcher takes no context first");
        int locals = stock.getImplementation().getRegisterCount() - stock.getParameterTypes().size();
        int link = featureLauncherLink(stock, locals);
        Method actual = featureMethod(patched, featureSig(stock));
        List<Instruction> body = instructions(actual);
        requireFeature(body.size() >= 6 && body.get(0).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                && body.get(1).getOpcode() == Opcode.MOVE_OBJECT_FROM16 && isStaticInvoke(body.get(2).getOpcode())
                && reference(body.get(2)).equals(OPEN_LINK) && body.get(3).getOpcode() == Opcode.MOVE_RESULT
                && body.get(4).getOpcode() == Opcode.IF_EQZ && body.get(5).getOpcode() == Opcode.RETURN_VOID,
                "browser launcher hook is missing");
        TwoRegisterInstruction context = (TwoRegisterInstruction) body.get(0), url = (TwoRegisterInstruction) body.get(1);
        int result = ((OneRegisterInstruction) body.get(3)).getRegisterA();
        requireFeature(context.getRegisterB() == locals && url.getRegisterB() == link
                && Arrays.equals(invokeRegisters(body.get(2)), new int[]{context.getRegisterA(), url.getRegisterA()})
                && context.getRegisterA() != url.getRegisterA() && context.getRegisterA() < locals && url.getRegisterA() < locals
                && result < locals && ((OneRegisterInstruction) body.get(4)).getRegisterA() == result,
                "browser launcher hook passes the wrong context or link");
        Layout layout = new Layout(actual.getImplementation());
        requireFeature(layout.addresses.get(4) + ((OffsetInstruction) body.get(4)).getCodeOffset() == layout.addresses.get(6),
                "a link that stays doesn't fall through to the launcher");
        featureBody(stock, actual, 6, Map.of(), OPEN_LINK);
        featureHostCalls(patched, OPEN_LINK, Map.of(featureSig(stock), 1));
    }

    /** The parameter register of the string the launcher parses with java.net.URI, through the moves in front of it. */
    private static int featureLauncherLink(Method stock, int locals) {
        List<Instruction> body = instructions(stock);
        int parse = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> body.get(k).getOpcode() == Opcode.INVOKE_DIRECT
                        && reference(body.get(k)).equals("Ljava/net/URI;-><init>(Ljava/lang/String;)V")).toList(), "launcher URI parse");
        int register = invokeRegisters(body.get(parse))[1];
        for (int k = parse - 1; k >= 0; k--) {
            Instruction i = body.get(k);
            if (i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16 || i.getOpcode() == Opcode.MOVE_OBJECT_16) {
                if (((TwoRegisterInstruction) i).getRegisterA() == register) register = ((TwoRegisterInstruction) i).getRegisterB();
            } else {
                requireFeature(i.getOpcode() == Opcode.NEW_INSTANCE && ((OneRegisterInstruction) i).getRegisterA() != register,
                        "browser launcher runs " + i.getOpcode().name + " before it parses the link");
            }
        }
        requireFeature(register >= locals && stock.getParameterTypes().get(register - locals).equals("Ljava/lang/String;"),
                "browser launcher parses no string parameter");
        return register;
    }

    private static void featureFalseStub(Map<String, List<Method>> patched, String signature, boolean optional) {
        if (optional && !patched.containsKey(signature)) return;
        Method stub = featureMethod(patched, signature);
        List<Instruction> body = instructions(stub);
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && body.size() == 2 && body.get(0).getOpcode() == Opcode.CONST_4
                && ((WideLiteralInstruction) body.get(0)).getWideLiteral() == 0
                && body.get(1).getOpcode() == (stub.getReturnType().equals("Z") ? Opcode.RETURN : Opcode.RETURN_OBJECT)
                && ((OneRegisterInstruction) body.get(0)).getRegisterA() == ((OneRegisterInstruction) body.get(1)).getRegisterA()
                && stub.getImplementation().getTryBlocks().isEmpty(), "omitted feature has an active accessor: " + signature);
    }

    private static void featurePreserveTargets(Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            java.util.function.Predicate<Method> predicate) {
        for (List<Method> definitions : clean.values()) for (Method stock : definitions) if (predicate.test(stock)) {
            Method actual = featureMethod(patched, featureSig(stock));
            if (stock.getImplementation() != null) featureBody(stock, actual, 0, Map.of(), "");
            else {
                featureDeclaration(stock, actual);
                requireFeature(actual.getImplementation() == null, "omitted feature altered " + featureSig(stock));
            }
        }
    }

    private static void featureOmittedSuggested(Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            File cleanApk, File patchedApk) throws Exception {
        featureFalseStub(patched, ADS + "isSuggestedUserItem(Ljava/lang/Object;)Z", true);
        featureHostCalls(patched, ADS + "isSuggestedUserItem(Ljava/lang/Object;)Z", Map.of());
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(patchedApk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cd : dex.getEntry(entry).getDexFile().getClasses())
            for (Field field : cd.getFields()) requireFeature(!field.getName().equals(RECORDED_RAW), "omitted suggestion feature added a raw recording field: " + field);
        // Old targets without these kept anchors still get predicate/capture absence checks.
        boolean hasModel = clean.values().stream().flatMap(List::stream).anyMatch(m -> m.getName().equals("<init>") && holds(m, "XDTSuggestedUsers"));
        boolean hasParser = clean.values().stream().flatMap(List::stream).anyMatch(m -> m.getName().equals("unsafeParseFromJson") && holds(m, SUGGESTED_WIRE, KICKSTART_WIRE));
        if (!hasModel || !hasParser) return;
        String item = featureStockMedia(clean).getDefiningClass();
        Method kind = featureTarget(clean, m -> m.getDefiningClass().equals(item) && m.getParameterTypes().isEmpty()
                && m.getReturnType().startsWith("L") && holds(m, "feedItemType"), "omitted feedItemType getter");
        Method constructor = featureTarget(clean, m -> m.getName().equals("<init>") && holds(m, "XDTSuggestedUsers"), "omitted raw suggestion constructor");
        String model = constructor.getDefiningClass();
        Method parser = featureTarget(clean, m -> m.getName().equals("unsafeParseFromJson") && m.getReturnType().equals("Ljava/lang/Object;")
                && m.getParameterTypes().size() == 1 && holds(m, SUGGESTED_WIRE, KICKSTART_WIRE), "omitted suggestion response parser");
        FeatureFlow root = new FeatureFlow(parser);
        int allocation = featureOne(java.util.stream.IntStream.range(0, root.layout.instructions.size()).boxed()
                .filter(n -> root.layout.instructions.get(n).getOpcode() == Opcode.NEW_INSTANCE && reference(root.layout.instructions.get(n)).equals(item)).toList(), "omitted feed-item allocation");
        ParsedFeatureValue value = root.parsed(SUGGESTED_WIRE, model);
        FieldReference slot = featureSlot(root, value, item, model, root.uses(allocation, -1), allocation);
        MethodReference wrapper = featureWrapper(root, slot, model);
        Set<String> owners = Set.of(item, kind.getReturnType(), model, parser.getDefiningClass(), value.parser(), wrapper.getDefiningClass());
        featurePreserveCards(featureClasses(cleanApk, owners), featureClasses(patchedApk, owners), patched, null, null);
    }

    private static void featureOmitted(String feature, Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            File cleanApk, File patchedApk) throws Exception {
        switch (feature) {
            case "hideSuggestedUsers": featureOmittedSuggested(clean, patched, cleanApk, patchedApk); break;
            case "hideAds":
                featureFalseStub(patched, ADS + "isAd(Ljava/lang/Object;)Z", true);
                featurePreserveTargets(clean, patched, m -> m.getDefiningClass().equals(MEDIA)
                        || m.getReturnType().equals("Z") && instructions(m).stream().anyMatch(i -> i instanceof WideLiteralInstruction
                                && (int) ((WideLiteralInstruction) i).getWideLiteral() == 0x8669a9b0));
                break;
            case "sanitizeSharingLinks":
                featureHostCalls(patched, CLEAN_LINK, Map.of());
                featureHostCalls(patched, POST_LINK, Map.of());
                featureHostCalls(patched, REMEMBER_POST, Map.of());
                featureHostCalls(patched, REMEMBERED_POST, Map.of());
                featurePreserveTargets(clean, patched, m -> holds(m, "permalink", "XDTPermalinkResponse")
                        || m.getDefiningClass().equals(PERMALINK_REPOSITORY));
                break;
            case "openLinksExternally":
                featureHostCalls(patched, OPEN_LINK, Map.of());
                featurePreserveTargets(clean, patched, m -> holds(m, LAUNCHER_MESSAGE));
                break;
            case "disableAnalytics":
                featureHostCalls(patched, ENDPOINT, Map.of());
                if (patched.containsKey(STATUS + "analyticsAddressMask()I")) requireFeature(featureConstant(patched, "analyticsAddressMask", "I") == 0,
                        "omitted analytics feature has nonzero address coverage");
                featurePreserveTargets(clean, patched, m -> holds(m, "/pigeon_nest", "/logging_client_events") || holds(m, LOGGING_URL)
                        || m.getName().equals("<init>") && holds(m, "analytics_endpoint"));
                break;
            case "restoreTrust":
                featureHostCalls(patched, SIGNERS, Map.of());
                featurePreserveTargets(clean, patched, m -> !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;").isEmpty()
                        && !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getSigningCertificateHistory()[Landroid/content/pm/Signature;").isEmpty());
                break;
            default: throw new IllegalArgumentException("Unknown omitted feature " + feature);
        }
        if (feature.equals("hideAds") || feature.equals("hideSuggestedUsers")) {
            boolean feed = false;
            for (String flag : List.of("hideAds", "hideSuggestedUsers")) if (patched.containsKey(STATUS + flag + "()Z")) feed |= featureConstant(patched, flag, "Z") == 1;
            if (!feed) {
                featureHostCalls(patched, FILTER_PAGE, Map.of());
                featureFalseStub(patched, ADS + "itemMedia(Ljava/lang/Object;)Ljava/lang/Object;", true);
                featurePreserveTargets(clean, patched, m -> m.getDefiningClass().equals(FEED));
            }
        }
    }

    private static List<String> checkThreadsFeatures(File cleanApk, File patchedApk, Set<String> rules,
            Set<String> selected) throws Exception {
        Map<String, List<Method>> patched = featureMethods(patchedApk, null);
        Map<String, List<Method>> clean = null;
        Map<String, String> parents = new HashMap<>();
        boolean hasPayload = patched.keySet().stream().anyMatch(s -> s.startsWith(ADS)
                || s.startsWith(ENDPOINT.substring(0, ENDPOINT.indexOf("->") + 2))
                || s.startsWith(CLEAN_LINK.substring(0, CLEAN_LINK.indexOf("->") + 2))
                || s.startsWith(SIGNERS.substring(0, SIGNERS.indexOf("->") + 2)));
        List<String> findings = new ArrayList<>();
        if (selected != null) for (String feature : selected) if (!rules.contains(feature))
            findings.add("contract: selected feature has no contract: " + feature);
        for (String feature : rules) {
            try {
                boolean hasStatus = patched.containsKey(STATUS + feature + "()Z");
                if (!hasStatus && selected != null && !selected.contains(feature)) {
                    if (hasPayload) {
                        if (clean == null) clean = featureMethods(cleanApk, parents);
                        featureOmitted(feature, clean, patched, cleanApk, patchedApk);
                    }
                    System.out.println("[diff] threads-feature " + feature + ": omitted");
                    continue;
                }
                // Historical bundles predate these independently selectable families. Existing
                // families still require their statuses whenever an extension payload exists.
                if (!hasStatus && selected == null && (feature.equals("hideSuggestedUsers") || feature.equals("openLinksExternally"))) {
                    if (hasPayload) {
                        if (clean == null) clean = featureMethods(cleanApk, parents);
                        featureOmitted(feature, clean, patched, cleanApk, patchedApk);
                    }
                    System.out.println("[diff] threads-feature " + feature + ": omitted");
                    continue;
                }
                if (!hasStatus && selected == null && !hasPayload) {
                    System.out.println("[diff] threads-feature " + feature + ": no feature payload");
                    continue;
                }
                int flag = featureConstant(patched, feature, "Z");
                requireFeature(flag == 0 || flag == 1, feature + " status is not boolean");
                if (selected != null) requireFeature((flag == 1) == selected.contains(feature), feature + " status disagrees with the selected patches");
                if (flag == 0) {
                    if (clean == null) clean = featureMethods(cleanApk, parents);
                    featureOmitted(feature, clean, patched, cleanApk, patchedApk);
                    System.out.println("[diff] threads-feature " + feature + ": omitted");
                    continue;
                }
                if (clean == null) clean = featureMethods(cleanApk, parents);
                switch (feature) {
                    case "hideAds": featureFeed(clean, patched); break;
                    case "hideSuggestedUsers": featureSuggested(clean, patched, cleanApk, patchedApk); break;
                    case "sanitizeSharingLinks": featureLinks(clean, patched, parents); break;
                    case "openLinksExternally": featureBrowser(clean, patched); break;
                    case "disableAnalytics": featureAnalytics(clean, patched); break;
                    case "restoreTrust": featureTrust(clean, patched); break;
                    default: throw new IllegalArgumentException("Unknown feature " + feature);
                }
                System.out.println("[diff] threads-feature " + feature + ": verified");
            } catch (IllegalArgumentException | ClassCastException | IndexOutOfBoundsException ex) {
                findings.add("contract: " + feature + ": " + ex.getMessage());
            }
        }
        return findings;
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 4 || args.length > 7) {
            System.err.println("usage: DexDiff <cleanApk> <patchedApk> <reportFile> <removalAllowlist> [<contracts> [<signedBase|-> [<selectedFeatures|none>]]]");
            System.exit(2);
        }
        File clean = new File(args[0]);
        File patched = new File(args[1]);
        File allowlistFile = new File(args[3]);
        RemovalAllowlist allowlist = readRemovalAllowlist(allowlistFile);
        File contractFile = args.length > 4 ? new File(args[4]) : null;
        List<Contract> contracts = readContracts(contractFile);
        // The base.apk whose signer was checked, when the clean side is the bundle's merge.
        File signedBase = args.length > 5 && !args[5].equals("-") ? new File(args[5]) : null;
        Set<String> selectedFeatures = null;
        if (args.length > 6) {
            selectedFeatures = args[6].equals("none") ? Set.of() : new HashSet<>(Arrays.asList(args[6].split(",", -1)));
            if (!THREADS_FEATURES.containsAll(selectedFeatures)) throw new IllegalArgumentException("Unknown selected feature: " + args[6]);
        }
        List<String> baseMismatch = signedBase == null ? List.of() : rootDexMismatch(signedBase, clean);

        System.out.println("[diff] fingerprinting clean " + clean.getName());
        Map<String, String> before = fingerprintAll(clean);
        Set<String> beforeDexEntries = dexEntries(clean);
        System.out.println("[diff] " + before.size() + " methods");
        System.out.println("[diff] fingerprinting patched " + patched.getName());
        Map<String, String> after = fingerprintAll(patched);
        Set<String> afterDexEntries = dexEntries(patched);
        System.out.println("[diff] " + after.size() + " methods");
        System.out.println("[diff] signatures defined in more than one dex entry: clean " + multiplyDefined(before)
                + ", patched " + multiplyDefined(after));

        Set<String> changed = new TreeSet<>();
        Set<String> added = new TreeSet<>();
        for (Map.Entry<String, String> e : after.entrySet()) {
            String was = before.get(e.getKey());
            if (was == null) added.add(e.getKey());
            else if (!was.equals(e.getValue())) changed.add(e.getKey());
        }
        // A method gone from the patched APK, or one of its definitions gone while a copy in another
        // dex entry stays: a definition the clean build has more of than the patched one.
        Set<String> removed = new TreeSet<>();
        for (Map.Entry<String, String> e : before.entrySet()) {
            if (prints(after.get(e.getKey())).size() < prints(e.getValue()).size()) removed.add(e.getKey());
        }
        // The clean side is Meta's build, which carries none of the bundle's code. A merged bundle
        // carries no signature to prove that the way base.apk does, and a patched build on the clean
        // side would hide everything the bundle added.
        Set<String> cleanOwn = new TreeSet<>();
        for (String s : before.keySet()) if (s.startsWith(OWN)) cleanOwn.add(s);
        Set<String> removedDexEntries = new TreeSet<>(beforeDexEntries);
        removedDexEntries.removeAll(afterDexEntries);

        Set<String> rejectedRemoved = new TreeSet<>(removed);
        rejectedRemoved.removeAll(allowlist.methods);
        Set<String> rejectedDexEntries = new TreeSet<>(removedDexEntries);
        rejectedDexEntries.removeAll(allowlist.dexEntries);
        Set<String> staleAllowedMethods = new TreeSet<>(allowlist.methods);
        staleAllowedMethods.removeAll(removed);
        Set<String> staleAllowedDexEntries = new TreeSet<>(allowlist.dexEntries);
        staleAllowedDexEntries.removeAll(removedDexEntries);

        Set<String> ownAdded = new TreeSet<>();
        for (String s : added) if (s.startsWith(OWN)) ownAdded.add(s);

        System.out.println("[diff] host methods changed: " + changed.size());
        System.out.println("[diff] methods added: " + added.size()
                + " (" + ownAdded.size() + " under " + OWN + ")");
        System.out.println("[diff] methods removed: " + removed.size()
                + " (rejected " + rejectedRemoved.size() + ")");
        System.out.println("[diff] DEX entries removed: " + removedDexEntries.size()
                + " (rejected " + rejectedDexEntries.size() + ")");

        // A pair of files with nothing between them is not a clean bill of health, it is the wrong
        // pair of files. Both of these were reachable by pointing the run at one APK twice.
        int problems = 0;
        if (!baseMismatch.isEmpty()) {
            System.out.println("[diff] FAIL: the clean APK " + clean.getName() + " doesn't carry " + signedBase.getName()
                    + "'s code as it is: it " + String.join("; ", baseMismatch) + ". Meta's signer was checked on "
                    + signedBase.getName() + ", so this would compare against code nobody checked.");
            problems++;
        } else if (signedBase != null) {
            System.out.println("[diff] the clean APK carries " + signedBase.getName() + "'s classes*.dex byte for byte");
        }
        if (!cleanOwn.isEmpty()) {
            System.out.println("[diff] FAIL: the clean APK carries " + cleanOwn.size() + " method"
                    + (cleanOwn.size() == 1 ? "" : "s") + " under " + OWN + " (" + cleanOwn.iterator().next()
                    + (cleanOwn.size() == 1 ? "" : " first") + "), so it is a patched build, not the one the patch started from.");
            problems++;
        }
        if (changed.isEmpty()) {
            System.out.println("[diff] FAIL: no host method differs, so these two APKs are not a "
                    + "clean build and a patched build of it.");
            problems++;
        }
        if (ownAdded.isEmpty()) {
            System.out.println("[diff] FAIL: the patched APK carries no method under " + OWN
                    + ", so no extension code was added to it.");
            problems++;
        }
        if (!rejectedRemoved.isEmpty()) {
            System.out.println("[diff] FAIL: removed host methods are not allowed:");
            for (String method : rejectedRemoved) System.out.println("[diff]   " + method);
            problems += rejectedRemoved.size();
        }
        if (!rejectedDexEntries.isEmpty()) {
            System.out.println("[diff] FAIL: removed DEX entries are not allowed:");
            for (String entry : rejectedDexEntries) System.out.println("[diff]   " + entry);
            problems += rejectedDexEntries.size();
        }
        if (!staleAllowedMethods.isEmpty() || !staleAllowedDexEntries.isEmpty()) {
            System.out.println("[diff] FAIL: the removal allowlist contains entries this pair did not remove:");
            for (String method : staleAllowedMethods) System.out.println("[diff]   method " + method);
            for (String entry : staleAllowedDexEntries) System.out.println("[diff]   dex " + entry);
            problems += staleAllowedMethods.size() + staleAllowedDexEntries.size();
        }

        System.out.println("[diff] reading both bodies for the changed and added methods");
        Set<String> wanted = new TreeSet<>(changed);
        wanted.addAll(added);
        Map<String, List<List<String>>> beforeBodies = bodiesOf(clean, changed);
        Map<String, List<List<String>>> afterBodies = bodiesOf(patched, wanted);

        // Every method the patch wrote or touched, the host's and the bundle's alike: each
        // definition of it the clean build doesn't have.
        System.out.println("[diff] checking branches, invokes, parameters and try ranges of "
                + (changed.size() + added.size()) + " methods");
        Set<String> structuralWanted = new TreeSet<>(changed);
        structuralWanted.addAll(added);
        Map<String, List<String>> fresh = new HashMap<>();
        for (String s : structuralWanted) fresh.put(s, without(prints(after.get(s)), prints(before.get(s))));
        Map<String, List<String>> structural = structuralPass(patched, clean, structuralWanted, fresh, contracts);
        Set<String> featureRules = new TreeSet<>();
        for (Contract contract : contracts) if (contract.kind.equals("threads-feature")) featureRules.add(contract.callee);
        if (!featureRules.isEmpty() || selectedFeatures != null) {
            List<String> featureFindings = checkThreadsFeatures(clean, patched, featureRules, selectedFeatures);
            if (!featureFindings.isEmpty()) structural.computeIfAbsent("contract", k -> new ArrayList<>()).addAll(featureFindings);
        }
        int structuralCount = 0;
        for (Map.Entry<String, List<String>> e : structural.entrySet()) {
            for (String finding : e.getValue()) {
                structuralCount++;
                System.out.println("[diff] FAIL: " + finding
                        + (e.getKey().equals("contract") ? "" : "  in " + e.getKey()));
            }
        }
        System.out.println("[diff] structural findings: " + structuralCount);
        problems += structuralCount;

        PrintWriter report = new PrintWriter(args[2], "UTF-8");
        try {
            report.println("Methods a patched APK does not share with the clean build it came from.");
            report.println("clean:   " + clean.getAbsolutePath());
            report.println("patched: " + patched.getAbsolutePath());
            report.println("removal allowlist: " + allowlistFile.getAbsolutePath());
            report.println("contracts: " + (contractFile == null ? "none" : contractFile.getAbsolutePath()));
            report.println("changed=" + changed.size() + " added=" + added.size()
                    + " (own=" + ownAdded.size() + ") removed=" + removed.size()
                    + " removedDex=" + removedDexEntries.size());
            report.println();

            report.println("Structural findings: " + structuralCount);
            for (Map.Entry<String, List<String>> e : structural.entrySet()) {
                report.println("  " + e.getKey());
                for (String finding : e.getValue()) report.println("    FAIL  " + finding);
            }
            report.println();

            report.println("Removed methods:");
            for (String method : removed) {
                report.println((allowlist.methods.contains(method) ? "  allowed " : "  FAIL    ") + method);
            }
            report.println("Removed DEX entries:");
            for (String entry : removedDexEntries) {
                report.println((allowlist.dexEntries.contains(entry) ? "  allowed " : "  FAIL    ") + entry);
            }
            report.println("Stale removal allowlist entries:");
            for (String method : staleAllowedMethods) report.println("  FAIL    method " + method);
            for (String entry : staleAllowedDexEntries) report.println("  FAIL    dex " + entry);
            report.println();

            int overRegister = 0;
            int unreadable = 0;

            for (String s : changed) {
                // The definitions both builds have, body for body, are copies in other dex entries
                // the patch left alone. What's left on each side is paired in dex entry order.
                List<List<String>> cleanBodies = beforeBodies.getOrDefault(s, List.of());
                List<List<String>> patchedBodies = afterBodies.getOrDefault(s, List.of());
                List<List<String>> befores = without(cleanBodies, patchedBodies);
                List<List<String>> afters = without(patchedBodies, cleanBodies);
                int pairs = Math.max(befores.size(), afters.size());
                for (int k = 0; k < pairs; k++) {
                    List<String> b = k < befores.size() ? befores.get(k) : List.of();
                    List<String> a = k < afters.size() ? afters.get(k) : List.of();
                    int regsBefore = registersOf(b), regsAfter = registersOf(a);
                    report.println("==== " + s + (pairs == 1 ? "" : "  (definition " + (k + 1) + " of " + pairs + " that differ)"));
                    report.println("     registers " + regsBefore + " -> " + regsAfter
                            + ", instructions " + Math.max(0, b.size() - 1) + " -> " + Math.max(0, a.size() - 1));
                    if (regsAfter < 0 && !a.isEmpty()) {
                        // Nothing to hold the injected lines to. Silently skipping this was a hole:
                        // any method the second pass failed to render passed the check by default.
                        report.println("  !  no register count could be read for this method");
                        unreadable++;
                    }
                    List<String> onlyAfter = minus(a, b);
                    for (String line : minus(b, a)) report.println("  -  " + line);
                    for (String line : onlyAfter) {
                        int high = highestRegister(line);
                        boolean bad = high >= 0 && regsAfter >= 0 && high >= regsAfter;
                        if (bad) overRegister++;
                        report.println("  +  " + line + (bad ? "   <<< REGISTER >= registerCount" : ""));
                    }
                    report.println();
                }
            }

            // Added methods are where registers are chosen by hand rather than reused from the
            // host, which is exactly where an out-of-range one would come from: the extension's,
            // and the helpers a patch adds to one of the host app's own classes (the Facebook
            // sibling's story, reel and video downloads each added one). Only the extension's were
            // read here until 2026-09-26.
            // Each definition of one is read, in whichever dex entry it landed.
            for (String s : added) {
                for (List<String> a : afterBodies.getOrDefault(s, List.of())) {
                    int regsAfter = registersOf(a);
                    if (a.isEmpty()) continue;
                    List<String> offending = new ArrayList<>();
                    for (String line : a) {
                        if (line.startsWith("#")) continue;
                        int high = highestRegister(line);
                        if (high >= 0 && regsAfter >= 0 && high >= regsAfter) offending.add(line);
                    }
                    if (regsAfter < 0) {
                        report.println("==== added " + s);
                        report.println("  !  no register count could be read for this method");
                        unreadable++;
                    }
                    if (offending.isEmpty()) continue;
                    overRegister += offending.size();
                    report.println("==== added " + s);
                    report.println("     registers " + regsAfter);
                    for (String line : offending) {
                        report.println("  +  " + line + "   <<< REGISTER >= registerCount");
                    }
                    report.println();
                }
            }

            report.println("Lines naming a register at or above the method's register count: " + overRegister);
            report.println("Methods whose register count could not be read: " + unreadable);
            System.out.println("[diff] methods whose register count could not be read: " + unreadable);
            System.out.println("[diff] injected lines naming an out-of-range register: " + overRegister);
            if (unreadable != 0) problems++;
            if (overRegister != 0) problems++;
        } finally {
            report.close();
        }
        System.out.println("[diff] report written to " + args[2]);
        System.exit(problems == 0 ? 0 : 1);
    }

    /**
     * The register count the body declares, or -1 when the body was not read at all.
     *
     * <p>Zero is a real answer: a static method with no arguments and no locals declares no
     * registers, and R8's synthetic lambda bridges are full of them. Treating zero as "unknown"
     * flagged twenty-one of the bundle's own methods as unreadable when nothing was wrong.
     */
    private static int registersOf(List<String> body) {
        if (body.isEmpty() || !body.get(0).startsWith("# registers=")) return -1;
        return Integer.parseInt(body.get(0).substring("# registers=".length()));
    }

    /** Lines of a that are not in b, counting duplicates. */
    private static List<String> minus(List<String> a, List<String> b) {
        Map<String, Integer> pool = new HashMap<>();
        for (String s : b) pool.merge(s, 1, Integer::sum);
        List<String> out = new ArrayList<>();
        for (String s : a) {
            Integer left = pool.get(s);
            if (left != null && left > 0) pool.put(s, left - 1);
            else if (!s.startsWith("# registers=")) out.add(s);
        }
        return out;
    }

    /** The highest register the instruction touched, read back from the marker render() wrote. */
    private static int highestRegister(String line) {
        int at = line.lastIndexOf("|maxreg=");
        if (at < 0) return -1;
        return Integer.parseInt(line.substring(at + "|maxreg=".length()).trim());
    }
}
