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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
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
            "hideAds", "hideSuggestedUsers", "sanitizeSharingLinks", "openLinksExternally", "disableAnalytics", "restoreTrust",
            "returnRefresh", "disableVideoAutoplay", "pureBlack", "saveMedia", "settingsRow");

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
        // Quoted notes keep Compose's source-file suffix in one exact string.
        String remaining = String.join(" ", Arrays.asList(parts).subList(at + 1, parts.length));
        var tokens = java.util.regex.Pattern.compile("\"([^\"]+)\"|(\\S+)").matcher(remaining);
        List<String> strings = new ArrayList<>();
        int end = 0;
        while (tokens.find()) {
            if ((end > 0 && tokens.start() == end) || !remaining.substring(end, tokens.start()).isBlank()) return null;
            String value = tokens.group(1) == null ? tokens.group(2) : tokens.group(1);
            if (value.indexOf('"') >= 0) return null;
            strings.add(value);
            end = tokens.end();
        }
        if (end != remaining.length()) return null;
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
        } else if (!callSitesMatching(body, contract.replaced).isEmpty()) {
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

    /** The index in [body] of each invoke whose reference [pattern] matches, a * standing for any run. */
    private static List<Integer> callSitesMatching(List<Instruction> body, String pattern) {
        if (pattern.indexOf('*') < 0) return callSites(body, pattern);
        StringBuilder regex = new StringBuilder();
        String[] literals = pattern.split("\\*", -1);
        for (int n = 0; n < literals.length; n++) regex.append(n == 0 ? "" : ".*").append(java.util.regex.Pattern.quote(literals[n]));
        java.util.regex.Pattern shape = java.util.regex.Pattern.compile(regex.toString());
        List<Integer> sites = new ArrayList<>();
        for (int k = 0; k < body.size(); k++) {
            Instruction i = body.get(k);
            if (i.getOpcode().name.startsWith("invoke") && i instanceof ReferenceInstruction
                    && shape.matcher(((ReferenceInstruction) i).getReference().toString()).matches()) sites.add(k);
        }
        return sites;
    }

    /** The registers an invoke passes, in order, as a list. */
    private static List<Integer> callRegisters(Instruction i) {
        List<Integer> registers = new ArrayList<>();
        for (int register : invokeRegisters(i)) registers.add(register);
        return registers;
    }

    /** Every register [i] names, in operand order: a range's or a call's, or A, B and C as it has them. */
    private static List<Integer> namedRegisters(Instruction i) {
        if (i instanceof RegisterRangeInstruction || i instanceof FiveRegisterInstruction) return callRegisters(i);
        List<Integer> named = new ArrayList<>();
        if (i instanceof OneRegisterInstruction) named.add(((OneRegisterInstruction) i).getRegisterA());
        if (i instanceof TwoRegisterInstruction) named.add(((TwoRegisterInstruction) i).getRegisterB());
        if (i instanceof ThreeRegisterInstruction) named.add(((ThreeRegisterInstruction) i).getRegisterC());
        return named;
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
                    for (int at : callSitesMatching(body, callee)) calls.add(callRegisters(body.get(at)));
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
    private static final String PERMALINK_ADS = ADS + "permalinkAds(Ljava/util/List;)Ljava/util/List;";
    private static final String PERMALINK_AD_FETCHER = "Lcom/instagram/barcelona/sponsored/permalink/ThreadsPermalinkAdFetcher;";
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
    private static final String OPEN_REFUSED_TILE = "Lapp/morphe/extension/hushthreads/coexist/ShareTiles;->openRefused(ZLandroid/content/Context;Landroid/content/Intent;)V";
    private static final String TILE_COMPOSER_EXTRA = "DirectPrivateStoryRecipientFragment.DIRECT_SHOULD_SHOW_MESSAGE_COMPOSER";
    private static final String LOGGING_URL = "https://graph.facebook.com/logging_client_events";
    private static final String RETURN_REFRESH = "Lapp/morphe/extension/hushthreads/feed/ReturnRefresh;->";
    private static final String HOLD_HOT_START = RETURN_REFRESH + "holdHotStart()Z";
    private static final String RESET_TO_FEED = RETURN_REFRESH + "resetToFeed(Z)Z";
    private static final String WARM_START = RETURN_REFRESH + "warmStart(Z)Z";
    private static final String CACHED_POSTS = RETURN_REFRESH + "cachedPosts(Z)Z";
    /** The activity every Threads screen lives in, a kept name, and the strings its return checks log. */
    private static final String BARCELONA_ACTIVITY = "Lcom/instagram/barcelona/mainactivity/BarcelonaActivity;";
    private static final String TOO_SHORT = "background_time_too_short_for_hot_start_feed_refresh";
    private static final String WALL_CLOCK = "hot_start_wall_clock_bg_elapsed_ms";
    private static final String RESET_TO_MAIN_FEED = "RESET_TO_MAIN_FEED";
    private static final String RESET_TO_HOME_FEED = "reset_to_home_feed";
    private static final String BADGE_DECISION = "badge_decision";
    private static final String HOLD_VIDEO = "Lapp/morphe/extension/hushthreads/feed/VideoAutoplay;->play(Z)Z";
    private static final String SKIP_PREFETCH = "Lapp/morphe/extension/hushthreads/feed/VideoAutoplay;->skipPrefetch(Z)Z";
    /** The two flag names Instagram's autoplay-off check holds, and the string the video prefetch dispatcher queues under. */
    private static final String AUTOPLAY_OFF = "ig_disable_video_autoplay";
    private static final String AUTOPLAY_OFF_OLYMPUS = "ig_olympus_disable_video_autoplay";
    private static final String PREFETCH_DISPATCHER = "VideoPrefetchDispatcher.queue";
    /** Compose's notes naming Threads' video in a post and the effect that starts its player. They name the source file, so they survive Redex. */
    private static final String POST_VIDEO_NOTE = "com.instagram.barcelona.feed.post.video.PostVideo (PostVideo.kt:";
    private static final String PLAYBACK_EFFECT_NOTE = "com.instagram.video.player.compose.VideoPlaybackEffect (VideoPlaybackEffect.kt:";
    /** The notes of the feed post composables that put a video in a post: one on its own, and one in a carousel. */
    private static final List<String> FEED_POST_NOTES = List.of("com.instagram.barcelona.feed.post.ui.PostSingleMedia",
            "com.instagram.barcelona.feed.post.ui.PostCarousel");
    /** The notes of the composables that show a video inside a post: an Instagram post shown in a thread, a trend's preview and an ad card. */
    private static final List<String> EMBED_NOTES = List.of("com.instagram.barcelona.igmedia.InlineIgVideo",
            "com.instagram.barcelona.common.ui.mediahighlights.AutoplayingMediaHighlightVideo (TrendMediaHighlightsPreview.kt:",
            "com.instagram.barcelona.sponsored.ui.AdCard (AdCard.kt:");
    /** The note of the full-screen viewer's video composable, which plays by PostVideo's default and has to stay as Threads wrote it. */
    private static final String MEDIA_VIEWER_NOTE = "com.instagram.barcelona.feed.mediaviewer.ui.MediaViewerVideo";
    private static final String PURE_BLACK = "Lapp/morphe/extension/hushthreads/theme/PureBlack;->";
    private static final String PURE_ARGB = PURE_BLACK + "argb(J)J";
    private static final String PURE_COLOR = PURE_BLACK + "color(J)J";
    /** Compose's note in Threads' theme, the lambda that builds its colors for dark or light mode. It names the source file, so it survives Redex. */
    private static final String BDS_THEME_NOTE = "com.instagram.barcelona.bds.theme.BdsTheme.<anonymous> (BdsTheme.kt:";
    private static final String IG_PALETTE_NOTE = "com.instagram.compose.core.theme.IgTheme.<get-colors> (IgTheme.kt:";
    /** Threads' dark mode background, #101010, and white, as the ARGB literals its theme and color schemes load. */
    private static final long THREADS_DARK = 0xff101010L, THREADS_WHITE = 0xffffffffL;
    /** A color scheme's constructor takes at least this many colors and nothing else. Threads' takes 39. */
    private static final int SCHEME_COLORS = 20;
    private static final String SETTINGS_ROW = "Lapp/morphe/extension/hushthreads/settings/ThreadsSettingsRow;";
    private static final String ADD_ROW = SETTINGS_ROW + "->add(Ljava/lang/Object;)V";
    private static final String SHOW_ROW = SETTINGS_ROW + "->showRow(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V";
    private static final String ROW_CLICK = "Lapp/morphe/extension/hushthreads/settings/ThreadsSettingsRow$Click;";
    private static final String FUNCTION0 = "Lkotlin/jvm/functions/Function0;";
    /**
     * Compose's notes in Threads' settings row, in the row it draws Accounts Center with, and in the
     * lambda that draws each entry of its settings list. They name the source file, so they survive Redex.
     */
    private static final String SETTINGS_ROW_NOTE = "com.instagram.barcelona.settings.SettingsRow (SettingsScreen.kt:";
    private static final String ACCOUNTS_ROW_NOTE = "com.instagram.barcelona.settings.AccountsCenterRow (SettingsScreen.kt:";
    private static final String SETTINGS_LIST_NOTE = "com.instagram.barcelona.settings.SettingsScreen.<anonymous>";
    /** The settings entry the HushThreads row goes above. Redex keeps an enum constant's name. */
    private static final String MORE_ENTRY = "MORE";
    /** Copy text on long press, which the settings patch depends on and brings into every build it's in. */
    private static final String COPY_TEXT = "Lapp/morphe/extension/hushthreads/feed/CopyText;";
    private static final String COPY_LONG_PRESS = COPY_TEXT + "->longPress(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    private static final String COPY_SELECTION = COPY_TEXT + "->selection(Z)Z";
    /**
     * Compose's notes on the post row's lambdas that lay out a post's text and its link preview, and
     * on PostText remembering its text selection, inlined into PostText. They name the source file.
     */
    private static final String POST_ROW_NOTE = "com.instagram.barcelona.feed.post.ui.FeedPostRow.<anonymous>.<anonymous> (FeedPostRow.kt:";
    private static final String SELECTION_NOTE = "com.instagram.barcelona.feed.post.ui.rememberPostTextSelectionState (PostTextSelectionMode.kt:";
    /** Save photos and videos' extension: the row it puts below Copy link, its click, and the bridges to Instagram's post model. */
    private static final String SAVE_ROW = "Lapp/morphe/extension/hushthreads/download/SaveMediaRow;";
    private static final String ADD_SAVE_ROW = SAVE_ROW + "->add(Ljava/lang/Object;Ljava/lang/Object;)V";
    private static final String SAVE_SHOW_ROW = SAVE_ROW + "->showRow(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)V";
    private static final String SAVE_MEDIA_OF = SAVE_ROW + "->media(Ljava/lang/Object;)Ljava/lang/Object;";
    private static final String SAVE_ACTIVITY_OF = SAVE_ROW + "->activity(Ljava/lang/Object;)Landroid/app/Activity;";
    private static final String SAVE_DISMISS = SAVE_ROW + "->dismiss(Ljava/lang/Object;)V";
    private static final String SAVE_CLICK = "Lapp/morphe/extension/hushthreads/download/SaveMediaRow$Click;";
    /** The bridges to Instagram's post model: every static method it has, shipped as an empty stub only the Save patch writes. */
    private static final String INSTAGRAM_MEDIA = "Lapp/morphe/extension/hushthreads/download/InstagramMedia;";
    /** Compose's note in the lambda that draws the rows of a post's menu. It names the source file, so it survives Redex. */
    private static final String MENU_NOTE = "com.instagram.barcelona.feed.post.actionmenu.PostActionMenuSheet.<anonymous> (PostActionMenuSheet.kt:";
    /** What the menu's Copy link item says it is. A Kotlin data object's toString keeps its source name. */
    private static final String COPY_LINK = "CopyLinkAction";
    private static final String FEATURE_OBJECT = "Ljava/lang/Object;";
    private static final String ANDROID_ACTIVITY = "Landroid/app/Activity;";
    /** The models the bridges read past Media and User, which keep their names: a video's versions, a picture's sizes and one size. */
    private static final String VIDEO_VERSION = "Lcom/instagram/api/schemas/VideoVersionIntf;";
    private static final String PANDO_VIDEO_VERSION = "Lcom/instagram/api/schemas/ImmutablePandoVideoVersion;";
    private static final String IMAGE_INFO = "Lcom/instagram/model/mediasize/ImageInfo;";
    private static final String PANDO_IMAGE_INFO = "Lcom/instagram/model/mediasize/ImmutablePandoImageInfo;";
    private static final String IMAGE_URL = "Lcom/instagram/common/typedurl/ImageUrl;";

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
        // A hook answering a boolean hands it back with move-result, and one answering a long with
        // move-result-wide, taking the pair from [input]; the others answer an object.
        boolean wide = callee.endsWith(")J");
        Opcode result = callee.endsWith(")Z") ? Opcode.MOVE_RESULT : wide ? Opcode.MOVE_RESULT_WIDE : Opcode.MOVE_RESULT_OBJECT;
        requireFeature(at >= 0 && at + 1 < body.size() && isStaticInvoke(body.get(at).getOpcode())
                && reference(body.get(at)).equals(callee)
                && Arrays.equals(invokeRegisters(body.get(at)), wide ? new int[]{input, input + 1} : new int[]{input})
                && body.get(at + 1).getOpcode() == result
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

    /**
     * A hook put in front of an original instruction whose branches skip the hook. Code inserted
     * with labels leaves a branch, case or handler aimed at that instruction landing on the
     * original, past the hook, so only the path that falls into it runs the hook.
     */
    private interface FeatureInsert extends FeatureBlock {}

    /**
     * Where a body that should match its stock one, with nothing declared added, first changed, given
     * that the two agree up to original instruction [k]. Code added in front of instructions it
     * repeats matches them, so the change can start before [k]: as early as the first instruction
     * of the tail the two bodies still share.
     */
    private static int featureChangedAt(Layout old, Layout now, int k) {
        int shared = 0;
        while (shared < old.instructions.size() && shared < now.instructions.size()
                && featureInstruction(old.instructions.get(old.instructions.size() - 1 - shared))
                        .equals(featureInstruction(now.instructions.get(now.instructions.size() - 1 - shared)))) shared++;
        return Math.min(k, old.instructions.size() - shared);
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
            if (block instanceof FeatureInsert && at < now.addresses.size()) relocated.put(old.addresses.get(k), now.addresses.get(at));
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
            if (at >= now.instructions.size() || !featureInstruction(old.instructions.get(k)).equals(featureInstruction(now.instructions.get(at)))) {
                boolean declared = prefix != 0 || !insertions.isEmpty() || !blocks.isEmpty() || recordedRaw != null;
                requireFeature(false, featureSig(stock) + " changed original instruction " + (declared ? k : featureChangedAt(old, now, k)));
            }
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
        // A build whose extension can't take an opened post's ads out predates that hook.
        if (patched.containsKey(PERMALINK_ADS)) featurePermalinkAds(clean, patched);
    }

    /**
     * An opened post's ads: the fetcher builds its one result from the list it read the ads into,
     * and that list goes through the extension right before the result is made. A branch into the
     * new-instance would skip the hook, so featureBody wants every way in to land on the hook.
     */
    private static void featurePermalinkAds(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method fetch = featureTarget(clean, m -> m.getDefiningClass().equals(PERMALINK_AD_FETCHER)
                && holds(m, "text_feed/threads_permalink_ads/"), "opened post ad fetcher");
        List<Instruction> body = instructions(fetch);
        List<Integer> sites = new ArrayList<>();
        for (int k = 1; k + 1 < body.size(); k++) {
            Instruction made = body.get(k - 1), init = body.get(k), back = body.get(k + 1);
            if (init.getOpcode() != Opcode.INVOKE_DIRECT || !(((ReferenceInstruction) init).getReference() instanceof MethodReference)) continue;
            MethodReference ctor = (MethodReference) ((ReferenceInstruction) init).getReference();
            int[] args = invokeRegisters(init);
            if (ctor.getName().equals("<init>") && String.join("", ctor.getParameterTypes()).equals("Ljava/util/List;I")
                    && made.getOpcode() == Opcode.NEW_INSTANCE && reference(made).equals(ctor.getDefiningClass())
                    && ((OneRegisterInstruction) made).getRegisterA() == args[0]
                    && back.getOpcode() == Opcode.RETURN_OBJECT && ((OneRegisterInstruction) back).getRegisterA() == args[0]) sites.add(k - 1);
        }
        requireFeature(sites.size() == 1, "opened post ad fetcher builds " + sites.size() + " results from a List");
        int made = sites.get(0);
        int[] args = invokeRegisters(body.get(made + 1));
        requireFeature(args[1] != args[0], "opened post ad fetcher builds its result from itself");
        featureBody(fetch, featureMethod(patched, featureSig(fetch)), 0, Map.of(made, args[1]), PERMALINK_ADS);
        featureHostCalls(patched, PERMALINK_ADS, Map.of(featureSig(fetch), 1));
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
        /** The handlers of every try each instruction sits in, whether or not it can throw: code a hook puts in front of it can. */
        final List<List<Integer>> guarded = new ArrayList<>();

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
                for (TryBlock<? extends ExceptionHandler> t : method.getImplementation().getTryBlocks()) {
                    if (address < t.getStartCodeAddress() || address >= t.getStartCodeAddress() + t.getCodeUnitCount()) continue;
                    for (ExceptionHandler h : t.getExceptionHandlers()) handlers.add(h.getHandlerCodeAddress());
                }
                List<Integer> caught = handlers.stream().map(indices::get).filter(java.util.Objects::nonNull).distinct().toList();
                normal.add(targets.stream().map(indices::get).filter(java.util.Objects::nonNull).distinct().toList());
                exceptional.add(i.getOpcode().canThrow() ? caught : List.of());
                guarded.add(caught);
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

        /**
         * Whether [register] holds the boolean [parameter] arrived in at [use] on every path: as it
         * arrived, through narrow moves, or as the 0 or 1 Compose writes when a caller leaves it out.
         */
        boolean booleanOnEveryPath(int use, int register, int parameter) {
            BitSet[] before = new BitSet[layout.instructions.size()];
            before[0] = new BitSet(method.getImplementation().getRegisterCount());
            before[0].set(parameter);
            Deque<Integer> work = new ArrayDeque<>(List.of(0));
            while (!work.isEmpty()) {
                int n = work.removeFirst();
                Instruction i = layout.instructions.get(n);
                BitSet input = before[n], output = (BitSet) input.clone();
                if (i.getOpcode().setsRegister()) {
                    int destination = ((OneRegisterInstruction) i).getRegisterA();
                    boolean copy = i.getOpcode() == Opcode.MOVE || i.getOpcode() == Opcode.MOVE_FROM16 || i.getOpcode() == Opcode.MOVE_16;
                    boolean literal = (i.getOpcode() == Opcode.CONST_4 || i.getOpcode() == Opcode.CONST_16 || i.getOpcode() == Opcode.CONST)
                            && (((WideLiteralInstruction) i).getWideLiteral() == 0 || ((WideLiteralInstruction) i).getWideLiteral() == 1);
                    output.set(destination, literal || copy && input.get(((TwoRegisterInstruction) i).getRegisterB()));
                    if (i.getOpcode().setsWideRegister()) output.clear(destination + 1);
                }
                for (int next : normal.get(n)) if (mergeSource(before, next, output)) work.add(next);
                // A throwing instruction's destination is written only along its normal edge.
                for (int next : exceptional.get(n)) if (mergeSource(before, next, input)) work.add(next);
            }
            return before[use] != null && before[use].get(register);
        }

        private List<List<Integer>> into, thrownInto;

        /**
         * The writes of [register] that reach the instruction at [use], -1 standing for a path from
         * the entry that writes none. A throwing instruction writes nothing along its handler edge.
         * It's the patches' ReachingWrites.reaching.
         */
        Set<Integer> reaching(int use, int register) {
            if (into == null) {
                into = new ArrayList<>();
                thrownInto = new ArrayList<>();
                for (int n = 0; n < layout.instructions.size(); n++) { into.add(new ArrayList<>()); thrownInto.add(new ArrayList<>()); }
                for (int n = 0; n < layout.instructions.size(); n++) {
                    for (int next : normal.get(n)) into.get(next).add(n);
                    for (int next : exceptional.get(n)) thrownInto.get(next).add(n);
                }
            }
            Set<Integer> writes = new TreeSet<>();
            Set<List<Integer>> seen = new HashSet<>();
            Deque<List<Integer>> work = new ArrayDeque<>();
            java.util.function.IntConsumer before = at -> {
                if (at == 0) writes.add(-1);
                for (int from : into.get(at)) if (seen.add(List.of(from, 0))) work.add(List.of(from, 0));
                for (int from : thrownInto.get(at)) if (seen.add(List.of(from, 1))) work.add(List.of(from, 1));
            };
            before.accept(use);
            while (!work.isEmpty()) {
                List<Integer> step = work.removeFirst();
                Instruction i = layout.instructions.get(step.get(0));
                boolean writesIt = i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction
                        && (registerA(i) == register || i.getOpcode().setsWideRegister() && registerA(i) + 1 == register);
                if (step.get(1) == 0 && writesIt) writes.add(step.get(0)); else before.accept(step.get(0));
            }
            return writes;
        }

        /**
         * The one instruction whose value [register] holds at [use] on every path, followed back
         * through narrow moves, as {its index, the register it wrote}, or {-1, the register} for the
         * value the method got. Null when paths disagree.
         */
        int[] origin(int use, int register) {
            while (true) {
                Set<Integer> writes = reaching(use, register);
                if (writes.size() != 1) return null;
                int write = writes.iterator().next();
                if (write < 0) return new int[]{-1, register};
                Instruction i = layout.instructions.get(write);
                if (i.getOpcode() != Opcode.MOVE && i.getOpcode() != Opcode.MOVE_FROM16 && i.getOpcode() != Opcode.MOVE_16) return new int[]{write, register};
                use = write;
                register = ((TwoRegisterInstruction) i).getRegisterB();
            }
        }

        /**
         * The instructions that can read [register] once the one at [index] has run, before
         * something writes it again, on every path. Reads are over-counted as Pure black dark
         * mode's patch counts them: a named register is read unless it's the plain destination,
         * and a wide instruction's registers count with the one above. A throwing instruction
         * writes nothing, so its handlers see the value.
         */
        List<Integer> readsAfter(int index, int register) {
            List<Integer> starts = new ArrayList<>(normal.get(index));
            starts.addAll(exceptional.get(index));
            return reads(starts, register, exceptional);
        }

        /**
         * The instructions that can read [register] on a path from the one at [index], that one
         * included, before something writes it again: empty when code put in front of it may
         * write the register for itself. It's the patches' RegisterLiveness.liveInto, which the
         * fixture tests hold each hook's scratch registers to: reads count as [readsAfter] counts
         * them, and inside a try a handler's reads count before an instruction's own write even
         * where it can't throw, since the code put in front of it can.
         */
        List<Integer> readsFrom(int index, int register) {
            return reads(List.of(index), register, guarded);
        }

        /** The reads of [register] on a path from [starts] before a write, a handler in [handlers] seeing the value from before it. */
        private List<Integer> reads(List<Integer> starts, int register, List<List<Integer>> handlers) {
            Set<Integer> reads = new TreeSet<>();
            BitSet seen = new BitSet();
            Deque<Integer> work = new ArrayDeque<>();
            for (int next : starts) if (!seen.get(next)) { seen.set(next); work.add(next); }
            while (!work.isEmpty()) {
                int n = work.removeFirst();
                Instruction i = layout.instructions.get(n);
                String name = i.getOpcode().name;
                boolean wide = name.contains("wide") || name.contains("long") || name.contains("double");
                boolean plainWrite = i.getOpcode().setsRegister() && !name.endsWith("/2addr") && i.getOpcode() != Opcode.CHECK_CAST;
                List<Integer> named = namedRegisters(i);
                for (int k = plainWrite ? 1 : 0; k < named.size(); k++) {
                    if (named.get(k) == register || wide && named.get(k) + 1 == register) reads.add(n);
                }
                List<Integer> next = new ArrayList<>(handlers.get(n));
                boolean writes = i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction
                        && (registerA(i) == register || i.getOpcode().setsWideRegister() && registerA(i) + 1 == register);
                if (!writes) next.addAll(normal.get(n));
                for (int k : next) if (!seen.get(k)) { seen.set(k); work.add(k); }
            }
            return new ArrayList<>(reads);
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
        featureSearchCarousel(clean, patched);
        featureProfileSuggestions(clean, patched);
    }

    /** The key Search's list builder adds its Follow suggestions carousel under, which Threads keeps from build to build. */
    private static final String SEARCH_CAROUSEL_KEY = "standalone_suggested_users";
    private static final String SHOW_SEARCH_CAROUSEL = "Lapp/morphe/extension/hushthreads/search/SearchSuggestions;->showCarousel()Z";

    /**
     * Search's list builder [stock] as Threads shipped it: the check at [guard] that its suggestions
     * list isn't empty is the one way into the carousel's path from [start], and [away] is where that
     * check sends an empty list.
     */
    private record SearchCarouselSite(Method stock, int guard, int start, int away) {}

    /**
     * Finds the builder in the clean APK on its own: the one method holding the carousel's key, the
     * stretch above the key that only falls from the instruction before it, and the conditional that
     * is that stretch's single way in. The conditional has to test the answer of the list's own
     * isEmpty(), read out of a field, and enter the stretch only for a list that isn't empty.
     */
    private static SearchCarouselSite featureSearchCarouselSite(Map<String, List<Method>> clean) {
        Method stock = featureTarget(clean, m -> !m.getDefiningClass().startsWith(OWN) && holds(m, SEARCH_CAROUSEL_KEY)
                && java.util.stream.IntStream.range(0, instructions(m).size()).anyMatch(n -> addsCarouselKeyAt(instructions(m), n)), "Search carousel builder");
        FeatureFlow flow = new FeatureFlow(stock);
        List<Instruction> body = flow.layout.instructions;
        int key = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed().filter(n -> addsCarouselKeyAt(body, n)).toList(), "Search carousel key");
        List<List<Integer>> into = new ArrayList<>();
        for (int n = 0; n < body.size(); n++) into.add(new ArrayList<>());
        for (int n = 0; n < body.size(); n++) {
            for (int next : flow.normal.get(n)) into.get(next).add(n);
            for (int next : flow.exceptional.get(n)) into.get(next).add(n);
        }
        int start = key;
        while (start > 0 && into.get(start).equals(List.of(start - 1)) && !body.get(start - 1).getOpcode().name.startsWith("if-")) start--;
        requireFeature(into.get(start).size() == 1 && body.get(into.get(start).get(0)).getOpcode().name.startsWith("if-"),
                "Search carousel is not reached through one check");
        int guard = into.get(start).get(0), entry = start;
        int away = featureOne(flow.normal.get(guard).stream().filter(n -> n != entry).toList(), "Search carousel check's empty side");
        Instruction check = body.get(guard);
        boolean nonEmpty = check.getOpcode() == Opcode.IF_NEZ ? start == guard + 1 : check.getOpcode() == Opcode.IF_EQZ && start != guard + 1;
        Set<Integer> answers = nonEmpty ? flow.reaching(guard, registerA(check)) : Set.of();
        int answer = answers.size() == 1 ? answers.iterator().next() : -1;
        boolean asked = answer > 0 && body.get(answer).getOpcode() == Opcode.MOVE_RESULT
                && isPlainInvoke(body.get(answer - 1).getOpcode()) && !isStaticInvoke(body.get(answer - 1).getOpcode())
                && ((ReferenceInstruction) body.get(answer - 1)).getReference() instanceof MethodReference call
                && call.getName().equals("isEmpty") && call.getReturnType().equals("Z") && call.getParameterTypes().isEmpty();
        Set<Integer> lists = asked ? flow.reaching(answer - 1, invokeRegisters(body.get(answer - 1))[0]) : Set.of();
        requireFeature(lists.size() == 1 && lists.iterator().next() >= 0 && body.get(lists.iterator().next()).getOpcode() == Opcode.IGET_OBJECT,
                "Search carousel check is not whether the list it reads is empty");
        return new SearchCarouselSite(stock, guard, start, away);
    }

    /**
     * Whether [at] loads the carousel's key and hands it straight to a call that adds an item under it.
     * From 452 Search also compares each item's key with it, through equals, when it logs how far the
     * list was scrolled, and that method adds nothing.
     */
    private static boolean addsCarouselKeyAt(List<Instruction> body, int at) {
        if (!(body.get(at) instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s
                && s.getString().equals(SEARCH_CAROUSEL_KEY)) || at + 1 >= body.size()) return false;
        Instruction next = body.get(at + 1);
        if (!isPlainInvoke(next.getOpcode()) || next.getOpcode() == Opcode.INVOKE_SUPER || next.getOpcode() == Opcode.INVOKE_SUPER_RANGE
                || !(((ReferenceInstruction) next).getReference() instanceof MethodReference call)) return false;
        return !(call.getName().equals("equals") && call.getReturnType().equals("Z") && call.getParameterTypes().size() == 1);
    }

    /**
     * Hide suggested users in Search: the builder asks showCarousel() once, first thing on the
     * carousel's path, and only a false answer leaves, by the check's own empty side, so a switch
     * that's off or paused shows the carousel. The answer's register is a local nothing reads on
     * either edge, and every other instruction is Threads' own.
     */
    private static void featureSearchCarousel(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        SearchCarouselSite site = featureSearchCarouselSite(clean);
        Method stock = site.stock();
        Method changed = featureMethod(patched, featureSig(stock));
        List<Instruction> body = instructions(changed);
        int at = site.start();
        requireFeature(body.size() > at + 2 && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(SHOW_SEARCH_CAROUSEL)
                && invokeRegisters(body.get(at)).length == 0 && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT,
                "Search carousel hook is missing or doesn't take the switch's answer");
        int scratch = registerA(body.get(at + 1));
        requireFeature(body.get(at + 2).getOpcode() == Opcode.IF_EQZ && registerA(body.get(at + 2)) == scratch,
                "Search carousel hook leaves on something other than a false answer");
        featureHostCalls(patched, SHOW_SEARCH_CAROUSEL, Map.of(featureSig(stock), 1));
        Layout layout = new Layout(changed.getImplementation());
        int target = layout.addresses.indexOf(layout.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset());
        requireFeature(target == site.away() + (site.away() >= at ? 3 : 0), "Search carousel hook doesn't leave by the check's own empty side");
        FeatureFlow old = new FeatureFlow(stock);
        int locals = stock.getImplementation().getRegisterCount() - stock.getParameterTypes().stream().mapToInt(DexDiff::slots).sum()
                - (AccessFlags.STATIC.isSet(stock.getAccessFlags()) ? 0 : 1);
        requireFeature(scratch < locals && old.readsFrom(at, scratch).isEmpty() && old.readsFrom(site.away(), scratch).isEmpty(),
                "Search carousel hook clobbers a live local");
        featureBody(stock, changed, 0, Map.of(), SHOW_SEARCH_CAROUSEL, null, Map.of(at, (b, n) -> 3));
    }

    /** Left out, Search's carousel is asked nowhere and every method holding its key is Threads' own. */
    private static void featureOmittedSearchCarousel(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureHostCalls(patched, SHOW_SEARCH_CAROUSEL, Map.of());
        featurePreserveTargets(clean, patched, m -> !m.getDefiningClass().startsWith(OWN) && holds(m, SEARCH_CAROUSEL_KEY));
    }

    /** The Compose note of Threads' suggested accounts row, the one Search, Activity and profiles share. */
    private static final String SUGGESTED_ROW_NOTE = "com.instagram.barcelona.suggestedusers.ui.SuggestedUsersRow (SuggestedUsersRow.kt:";
    /** How every Compose note of the profile's own screens begins. */
    private static final String PROFILE_UI = "com.instagram.barcelona.profile.ui.";
    /** Threads keeps this class's name. It builds the list of rows above a profile's tabs. */
    private static final String PROFILE_VIEW_MODEL = "Lcom/instagram/barcelona/profile/viewmodel/ProfileViewModel;";
    private static final String PROFILE_CAROUSEL = "Lapp/morphe/extension/hushthreads/profile/ProfileSuggestions;->carousel(Ljava/lang/Object;)Ljava/lang/Object;";
    private static final String SHOW_PROFILE_ROW = "Lapp/morphe/extension/hushthreads/profile/ProfileSuggestions;->showRow()Z";
    /** A Compose source note, `<function> (<File>.kt:<line>)`, which Threads keeps from build to build. */
    private static final java.util.regex.Pattern COMPOSE_NOTE = java.util.regex.Pattern.compile("^[^ ()]+ \\(([A-Za-z0-9_]+\\.kt):\\d+\\)$");

    /**
     * The profile's two places as Threads shipped them: in [screen], the read at [read] that puts the
     * carousel's list, a [type], in [list], with the null check right after it the only way to the
     * carousel; in [builder], [start], the row's path past the view model's one check, and [away],
     * where that check goes otherwise.
     */
    private record ProfileSites(Method screen, int read, int list, String type, Method builder, int start, int away) {}

    /** One call to the suggested accounts row, at [at] of [method], and the Compose note governing it, if any. */
    private record ProfileRowCall(Method method, int at, MethodReference callee, String note) {}

    /** The Compose note [i] loads, or null. */
    private static String featureNote(Instruction i) {
        if (i.getOpcode() != Opcode.CONST_STRING && i.getOpcode() != Opcode.CONST_STRING_JUMBO) return null;
        String s = ((StringReference) ((ReferenceInstruction) i).getReference()).getString();
        return COMPOSE_NOTE.matcher(s).matches() ? s : null;
    }

    /** Whether [note] is a note of the profile's own screens from [file]. */
    private static boolean profileNote(String note, String file) {
        if (note == null || !note.startsWith(PROFILE_UI)) return false;
        java.util.regex.Matcher matcher = COMPOSE_NOTE.matcher(note);
        return matcher.matches() && matcher.group(1).equals(file);
    }

    /** Whether [to] can run after [from], along branches, switches and the handlers of every try an instruction sits in. */
    private static boolean featureReaches(FeatureFlow flow, int from, int to) {
        BitSet seen = new BitSet();
        Deque<Integer> work = new ArrayDeque<>(List.of(from));
        seen.set(from);
        while (!work.isEmpty()) {
            int at = work.removeFirst();
            if (at == to) return true;
            List<Integer> next = new ArrayList<>(flow.normal.get(at));
            next.addAll(flow.guarded.get(at));
            for (int n : next) if (!seen.get(n)) { seen.set(n); work.add(n); }
        }
        return false;
    }

    /**
     * The Compose note nearest above [at], when it can reach [at]. A note further up, or one that can't
     * reach it, belongs to another lambda Redex merged into the same method.
     */
    private static String featureGoverningNote(FeatureFlow flow, int at) {
        for (int index = at - 1; index >= 0; index--) {
            String note = featureNote(flow.layout.instructions.get(index));
            if (note != null) return featureReaches(flow, index, at) ? note : null;
        }
        return null;
    }

    /**
     * Where the value [register] holds at [at] was made, followed back through object moves and casts:
     * {the write, the register it wrote}, or {-1, the register} for the value the method got. Null
     * when more than one write can reach it, or a write and the method's entry.
     */
    private static int[] featureSource(FeatureFlow flow, int at, int register) {
        List<Instruction> body = flow.layout.instructions;
        int index = at, held = register;
        for (int step = 0; step < body.size(); step++) {
            Set<Integer> writes = flow.reaching(index, held);
            if (writes.size() != 1) return null;
            int write = writes.iterator().next();
            if (write < 0) return new int[]{-1, held};
            Opcode op = body.get(write).getOpcode();
            if (op == Opcode.CHECK_CAST) index = write;
            else if (op == Opcode.MOVE_OBJECT || op == Opcode.MOVE_OBJECT_FROM16 || op == Opcode.MOVE_OBJECT_16) {
                index = write;
                held = ((TwoRegisterInstruction) body.get(write)).getRegisterB();
            } else return new int[]{write, held};
        }
        return null;
    }

    /** The register [m] keeps this in, past its locals and parameters' words. */
    private static int featureThis(Method m) {
        requireFeature(!AccessFlags.STATIC.isSet(m.getAccessFlags()), featureSig(m) + " is static, so it has no this");
        return m.getImplementation().getRegisterCount() - m.getParameterTypes().stream().mapToInt(DexDiff::slots).sum() - 1;
    }

    /** How many words come before parameter [index] in a call to [callee], this aside. */
    private static int featureWord(MethodReference callee, int index) {
        int words = 0;
        for (int p = 0; p < index; p++) words += slots(callee.getParameterTypes().get(p));
        return words;
    }

    /**
     * {guard, start, away, before}: walks back from [target] while each instruction is reached only by
     * falling from the one above, and answers the conditional that is then the single way in, where
     * it goes otherwise, and the check's one way in, or -1 when it has more than one. Refuses a jump,
     * a switch or a handler into the stretch, or more than one way in.
     */
    private static int[] featureSoleEntry(FeatureFlow flow, int target, String what) {
        List<Instruction> body = flow.layout.instructions;
        List<List<Integer>> into = new ArrayList<>();
        for (int n = 0; n < body.size(); n++) into.add(new ArrayList<>());
        for (int n = 0; n < body.size(); n++) {
            for (int next : flow.normal.get(n)) into.get(next).add(n);
            for (int next : flow.guarded.get(n)) into.get(next).add(n);
        }
        int start = target;
        while (start > 0 && into.get(start).equals(List.of(start - 1)) && !body.get(start - 1).getOpcode().name.startsWith("if-")) start--;
        requireFeature(into.get(start).size() == 1 && body.get(into.get(start).get(0)).getOpcode().name.startsWith("if-"),
                what + " in " + featureSig(flow.method) + " is reached from " + into.get(start) + " at instruction " + start + ", not through one check");
        int guard = into.get(start).get(0), entry = start;
        List<Integer> away = flow.normal.get(guard).stream().filter(n -> n != entry).toList();
        requireFeature(away.size() == 1, "the check at " + guard + " in " + featureSig(flow.method) + " has no way past " + what);
        return new int[]{guard, start, away.get(0), into.get(guard).size() == 1 ? into.get(guard).get(0) : -1};
    }

    /** Whether [i] makes a new [type]. */
    private static boolean featureAllocates(Instruction i, String type) {
        return i.getOpcode() == Opcode.NEW_INSTANCE && reference(i).equals(type);
    }

    /**
     * Finds both profile places in the clean APK on its own, the way the patch does. Threads' one
     * static suggested accounts row and the static overloads its class keeps are the entries; every
     * call to one in the classes holding a profile note belongs to the nearest note above it that can
     * reach it, and exactly one sits under a ProfileScreen.kt note and one under a ProfileInfoRows.kt
     * note. The info rows' call reads its list from its own captured row, which names the list's type
     * and the row's. The screen's call hands the row a list its lambda was built with, one constructor
     * parameter fills that field, and the screen builds the lambda once, from a list it reads out of a
     * field and checks for null right after. The view model makes the row once, past one check whose
     * other side nothing reads what the check compared on.
     */
    private static ProfileSites featureProfileSites(Map<String, List<Method>> clean) {
        Map<String, List<Method>> byClass = new TreeMap<>();
        for (List<Method> definitions : clean.values()) byClass.computeIfAbsent(definitions.get(0).getDefiningClass(), k -> new ArrayList<>()).add(definitions.get(0));
        Method row = featureTarget(clean, m -> !m.getDefiningClass().startsWith(OWN)
                && instructions(m).stream().anyMatch(i -> { String note = featureNote(i); return note != null && note.startsWith(SUGGESTED_ROW_NOTE); }),
                "Threads' suggested accounts row, the method holding \"" + SUGGESTED_ROW_NOTE + "\",");
        String rowSig = featureSig(row);
        requireFeature(AccessFlags.STATIC.isSet(row.getAccessFlags()), "the suggested accounts row " + rowSig + " isn't static");
        Set<String> entries = new TreeSet<>(List.of(rowSig));
        for (Method m : byClass.get(row.getDefiningClass())) {
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && !featureSig(m).equals(rowSig) && instructions(m).stream().anyMatch(i -> i instanceof ReferenceInstruction r
                    && r.getReference() instanceof MethodReference called && featureSig(called).equals(rowSig))) entries.add(featureSig(m));
        }
        List<Method> profile = new ArrayList<>();
        for (Map.Entry<String, List<Method>> e : byClass.entrySet()) {
            if (e.getKey().startsWith(OWN) || e.getKey().equals(row.getDefiningClass())) continue;
            if (e.getValue().stream().anyMatch(m -> holdsNote(m, PROFILE_UI))) profile.addAll(e.getValue());
        }
        List<ProfileRowCall> calls = new ArrayList<>();
        for (Method m : profile) {
            List<Instruction> body = instructions(m);
            FeatureFlow flow = null;
            for (int at = 0; at < body.size(); at++) {
                if (!isStaticInvoke(body.get(at).getOpcode()) || !entries.contains(featureSig((MethodReference) ((ReferenceInstruction) body.get(at)).getReference()))) continue;
                if (flow == null) flow = new FeatureFlow(m);
                calls.add(new ProfileRowCall(m, at, (MethodReference) ((ReferenceInstruction) body.get(at)).getReference(), featureGoverningNote(flow, at)));
            }
        }
        ProfileRowCall screen = featureOne(calls.stream().filter(c -> profileNote(c.note(), "ProfileScreen.kt")).toList(), "the suggested accounts row under a ProfileScreen.kt note");
        ProfileRowCall infoRows = featureOne(calls.stream().filter(c -> profileNote(c.note(), "ProfileInfoRows.kt")).toList(), "the suggested accounts row under a ProfileInfoRows.kt note");

        // The info rows' call hands the row ((Row) this.row).list: that names the list's type and the row's.
        Method info = infoRows.method();
        FeatureFlow infoFlow = new FeatureFlow(info);
        List<Instruction> infoBody = infoFlow.layout.instructions;
        int self = featureThis(info);
        List<String[]> found = new ArrayList<>();
        List<Integer> foundAt = new ArrayList<>();
        int[] infoArguments = invokeRegisters(infoBody.get(infoRows.at()));
        for (int index = 0; index < infoRows.callee().getParameterTypes().size(); index++) {
            int word = featureWord(infoRows.callee(), index);
            if (!infoRows.callee().getParameterTypes().get(index).toString().startsWith("L") || word >= infoArguments.length) continue;
            int[] source = featureSource(infoFlow, infoRows.at(), infoArguments[word]);
            if (source == null || source[0] < 0 || infoBody.get(source[0]).getOpcode() != Opcode.IGET_OBJECT) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) infoBody.get(source[0])).getReference();
            if (field.getDefiningClass().equals(info.getDefiningClass())) continue;
            int holder = ((TwoRegisterInstruction) infoBody.get(source[0])).getRegisterB();
            Set<Integer> casts = infoFlow.reaching(source[0], holder);
            int cast = casts.size() == 1 ? casts.iterator().next() : -1;
            if (cast < 0 || infoBody.get(cast).getOpcode() != Opcode.CHECK_CAST || !reference(infoBody.get(cast)).equals(field.getDefiningClass())) continue;
            int[] captured = featureSource(infoFlow, cast, holder);
            if (captured == null || captured[0] < 0 || infoBody.get(captured[0]).getOpcode() != Opcode.IGET_OBJECT
                    || !((FieldReference) ((ReferenceInstruction) infoBody.get(captured[0])).getReference()).getDefiningClass().equals(info.getDefiningClass())
                    || !Arrays.equals(featureSource(infoFlow, captured[0], ((TwoRegisterInstruction) infoBody.get(captured[0])).getRegisterB()), new int[]{-1, self})) continue;
            found.add(new String[]{field.getType(), field.getDefiningClass()});
            foundAt.add(index);
        }
        String[] data = featureOne(found, "the list " + featureSig(info) + " reads from its own row for the suggested accounts row");
        String list = data[0], rowType = data[1];
        requireFeature(infoRows.callee().getParameterTypes().get(foundAt.get(0)).toString().equals(list),
                featureSig(infoRows.callee()) + " takes a " + infoRows.callee().getParameterTypes().get(foundAt.get(0)) + " where the profile's row hands it a " + list);

        // The screen's lambda hands the row a list it was built with.
        Method lambda = screen.method();
        String owner = lambda.getDefiningClass();
        FeatureFlow lambdaFlow = new FeatureFlow(lambda);
        List<Instruction> lambdaBody = lambdaFlow.layout.instructions;
        List<Integer> listIndices = new ArrayList<>();
        for (int p = 0; p < screen.callee().getParameterTypes().size(); p++) if (screen.callee().getParameterTypes().get(p).toString().equals(list)) listIndices.add(p);
        int listIndex = featureOne(listIndices, "the list among " + featureSig(screen.callee()) + "'s parameters");
        int[] screenArguments = invokeRegisters(lambdaBody.get(screen.at()));
        requireFeature(featureWord(screen.callee(), listIndex) < screenArguments.length, featureSig(lambda) + " hands the row no list");
        int[] handedRow = featureSource(lambdaFlow, screen.at(), screenArguments[featureWord(screen.callee(), listIndex)]);
        requireFeature(handedRow != null && handedRow[0] >= 0, featureSig(lambda) + " sets the list it hands the row on more than one path");
        Instruction capture = lambdaBody.get(handedRow[0]);
        requireFeature(capture.getOpcode() == Opcode.IGET_OBJECT && ((FieldReference) ((ReferenceInstruction) capture).getReference()).getDefiningClass().equals(owner),
                featureSig(lambda) + " doesn't hand the row a list it was built with");
        String captured = reference(capture);
        requireFeature(Arrays.equals(featureSource(lambdaFlow, handedRow[0], ((TwoRegisterInstruction) capture).getRegisterB()), new int[]{-1, featureThis(lambda)}),
                featureSig(lambda) + " reads the row's list from something other than itself");

        // One constructor parameter goes into that field, and nothing else writes it.
        List<Method> storing = new ArrayList<>();
        List<Integer> stores = new ArrayList<>();
        for (Method m : byClass.getOrDefault(owner, List.of())) {
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) if (body.get(at).getOpcode() == Opcode.IPUT_OBJECT && reference(body.get(at)).equals(captured)) { storing.add(m); stores.add(at); }
        }
        Method constructor = featureOne(storing, "the one write of " + captured);
        int store = stores.get(0);
        FeatureFlow constructorFlow = new FeatureFlow(constructor);
        TwoRegisterInstruction stored = (TwoRegisterInstruction) constructorFlow.layout.instructions.get(store);
        int[] storedFrom = featureSource(constructorFlow, store, stored.getRegisterA());
        List<Integer> parameters = new ArrayList<>();
        int word = featureThis(constructor) + 1;
        for (int p = 0; p < constructor.getParameterTypes().size(); p++) {
            if (storedFrom != null && storedFrom[0] == -1 && storedFrom[1] == word) parameters.add(p);
            word += slots(constructor.getParameterTypes().get(p));
        }
        requireFeature(constructor.getName().equals("<init>") && parameters.size() == 1
                && Arrays.equals(featureSource(constructorFlow, store, stored.getRegisterB()), new int[]{-1, featureThis(constructor)}),
                featureSig(constructor) + " doesn't fill " + captured + " from one of its own parameters");
        int parameter = parameters.get(0);

        // The screen builds that lambda once, under a profile screen note, from a list it reads and checks for null right away.
        List<Method> builders = new ArrayList<>();
        for (Method m : profile) {
            List<Instruction> body = instructions(m);
            if (body.stream().noneMatch(i -> featureAllocates(i, owner))) continue;
            FeatureFlow flow = new FeatureFlow(m);
            for (int at = 0; at < body.size(); at++) if (featureAllocates(body.get(at), owner) && profileNote(featureGoverningNote(flow, at), "ProfileScreen.kt")) { builders.add(m); break; }
        }
        Method built = featureOne(builders, "the ProfileScreen.kt method that builds the suggested accounts carousel");
        FeatureFlow flow = new FeatureFlow(built);
        List<Instruction> body = flow.layout.instructions;
        List<Integer> allocations = new ArrayList<>();
        for (int at = 0; at < body.size(); at++) if (featureAllocates(body.get(at), owner) && profileNote(featureGoverningNote(flow, at), "ProfileScreen.kt")) allocations.add(at);
        int allocation = featureOne(allocations, "the carousel built in " + featureSig(built));
        int init = -1;
        for (int at = allocation + 1; at < body.size() && init < 0; at++) {
            Instruction i = body.get(at);
            if ((i.getOpcode() == Opcode.INVOKE_DIRECT || i.getOpcode() == Opcode.INVOKE_DIRECT_RANGE) && reference(i).equals(featureSig(constructor))) {
                int[] made = featureSource(flow, at, invokeRegisters(i)[0]);
                if (made != null && made[0] == allocation) init = at;
            }
        }
        requireFeature(init >= 0, featureSig(built) + " never constructs the carousel it allocates at " + allocation);
        int[] initArguments = invokeRegisters(body.get(init));
        requireFeature(1 + featureWord(constructor, parameter) < initArguments.length, featureSig(built) + " hands the carousel no list");
        int[] handed = featureSource(flow, init, initArguments[1 + featureWord(constructor, parameter)]);
        requireFeature(handed != null && handed[0] >= 0, featureSig(built) + " sets the carousel's list on more than one path");
        int read = handed[0];
        requireFeature(body.get(read).getOpcode() == Opcode.IGET_OBJECT && ((FieldReference) ((ReferenceInstruction) body.get(read)).getReference()).getType().equals(list),
                featureSig(built) + " doesn't hand the carousel a list it reads from a field");
        int register = registerA(body.get(read));
        int[] entry = featureSoleEntry(flow, allocation, "the suggested accounts carousel");
        Instruction check = body.get(entry[0]);
        boolean past = check.getOpcode() == Opcode.IF_NEZ ? entry[1] != entry[0] + 1 : check.getOpcode() == Opcode.IF_EQZ && entry[1] == entry[0] + 1;
        requireFeature(past && registerA(check) == register && entry[0] == read + 1 && entry[3] == read,
                featureSig(built) + " doesn't build its carousel only past a null check of the list it reads at " + read);
        requireFeature(register <= 255, featureSig(built) + " keeps the carousel's list in v" + register + ", past move-result's reach");

        // The view model makes the row once, past one check, and nothing past the check's other side reads what it compared.
        requireFeature(byClass.containsKey(PROFILE_VIEW_MODEL), "Threads carries no profile view model " + PROFILE_VIEW_MODEL);
        List<Method> makers = byClass.get(PROFILE_VIEW_MODEL).stream()
                .filter(m -> instructions(m).stream().anyMatch(i -> featureAllocates(i, rowType))).toList();
        Method maker = featureOne(makers, "the profile view model's method that adds the suggested accounts row");
        FeatureFlow makerFlow = new FeatureFlow(maker);
        List<Instruction> makerBody = makerFlow.layout.instructions;
        List<Integer> made = new ArrayList<>();
        for (int at = 0; at < makerBody.size(); at++) if (featureAllocates(makerBody.get(at), rowType)) made.add(at);
        int[] rowEntry = featureSoleEntry(makerFlow, featureOne(made, "the suggested accounts row made in " + featureSig(maker)), "the suggested accounts row");
        List<String> compared = new ArrayList<>();
        for (int r : namedRegisters(makerBody.get(rowEntry[0]))) if (!makerFlow.readsFrom(rowEntry[2], r).isEmpty()) compared.add("v" + r);
        requireFeature(compared.isEmpty(), featureSig(maker) + " reads " + String.join(", ", compared) + " again past its check at " + rowEntry[0]
                + ", so leaving the row's path there wouldn't match Threads' own");
        return new ProfileSites(built, read, register, list, maker, rowEntry[1], rowEntry[2]);
    }

    /**
     * Hide suggested users on profiles. The screen hands the carousel's list to carousel() right
     * after reading it, takes the answer back into the same register and casts it to the list's own
     * type, so the null check Threads already makes drops the carousel. The view model asks showRow()
     * first thing on the row's path, branches into it included, and only a false answer leaves, by the
     * check's own other side, in a local nothing reads from there or from that side. Each is called
     * once, from its own method, and every other instruction is Threads' own.
     */
    private static void featureProfileSuggestions(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        try {
            ProfileSites sites = featureProfileSites(clean);
            String screenSig = featureSig(sites.screen()), builderSig = featureSig(sites.builder());
            featureHostCalls(patched, PROFILE_CAROUSEL, Map.of(screenSig, 1));
            featureHostCalls(patched, SHOW_PROFILE_ROW, Map.of(builderSig, 1));
            int guard = sites.read() + 1, list = sites.list();
            String atCheck = " at the carousel's null check at " + guard + " in " + screenSig;
            featureBody(sites.screen(), featureMethod(patched, screenSig), 0, Map.of(), PROFILE_CAROUSEL, null, Map.of(guard, (body, at) -> {
                requireFeature(at + 3 <= body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(PROFILE_CAROUSEL)
                        && Arrays.equals(invokeRegisters(body.get(at)), new int[]{list}), "no hook" + atCheck + " that hands carousel() the list in v" + list);
                requireFeature(body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && registerA(body.get(at + 1)) == list,
                        "the hook" + atCheck + " doesn't take carousel()'s answer back into the list's register, v" + list);
                requireFeature(body.get(at + 2).getOpcode() == Opcode.CHECK_CAST && registerA(body.get(at + 2)) == list && reference(body.get(at + 2)).equals(sites.type()),
                        "the hook" + atCheck + " doesn't cast carousel()'s answer back to the list's type, " + sites.type());
                return 3;
            }));
            Method builder = featureMethod(patched, builderSig);
            Layout now = new Layout(builder.getImplementation());
            FeatureFlow old = new FeatureFlow(sites.builder());
            int locals = sites.builder().getImplementation().getRegisterCount() - sites.builder().getParameterTypes().stream().mapToInt(DexDiff::slots).sum()
                    - (AccessFlags.STATIC.isSet(sites.builder().getAccessFlags()) ? 0 : 1);
            String atRow = " at the start of the row's path at " + sites.start() + " in " + builderSig;
            featureBody(sites.builder(), builder, 0, Map.of(), SHOW_PROFILE_ROW, null, Map.of(sites.start(), (body, at) -> {
                requireFeature(at + 3 <= body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(SHOW_PROFILE_ROW)
                        && invokeRegisters(body.get(at)).length == 0 && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT,
                        "no hook" + atRow + " that takes showRow()'s answer");
                int scratch = registerA(body.get(at + 1));
                requireFeature(body.get(at + 2).getOpcode() == Opcode.IF_EQZ && registerA(body.get(at + 2)) == scratch,
                        "the hook" + atRow + " leaves on something other than a false answer");
                int target = now.addresses.indexOf(now.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset());
                int away = sites.away() + (sites.away() >= sites.start() ? 3 : 0);
                requireFeature(target == away, "the hook" + atRow + " sends a false answer to instruction " + target + ", not the check's own other side at " + away);
                requireFeature(scratch < locals && old.readsFrom(sites.start(), scratch).isEmpty() && old.readsFrom(sites.away(), scratch).isEmpty(),
                        "the hook" + atRow + " clobbers v" + scratch + ", which isn't a local nothing reads from there or from the check's other side");
                return 3;
            }));
            System.out.println("[diff] threads-feature hideSuggestedUsers: Profile suggestions hook the carousel at " + guard + " of " + screenSig
                    + " and the row at " + sites.start() + " of " + builderSig);
        } catch (IllegalArgumentException | ClassCastException | IndexOutOfBoundsException ex) {
            throw new IllegalArgumentException("Profile suggestions: " + ex.getMessage(), ex);
        }
    }

    /**
     * Left out, profiles ask neither question, and the screen and view model methods the hooks go
     * into are Threads' own. Only those two: Hide ghost post bubbles changes other profile code.
     * A build with no suggested accounts row has nothing to keep.
     */
    private static void featureOmittedProfileSuggestions(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        try {
            featureHostCalls(patched, PROFILE_CAROUSEL, Map.of());
            featureHostCalls(patched, SHOW_PROFILE_ROW, Map.of());
            boolean rowed = false;
            for (List<Method> definitions : clean.values()) if (!definitions.get(0).getDefiningClass().startsWith(OWN) && holdsNote(definitions.get(0), SUGGESTED_ROW_NOTE)) rowed = true;
            if (!rowed) return;
            ProfileSites sites = featureProfileSites(clean);
            for (Method stock : List.of(sites.screen(), sites.builder())) featureBody(stock, featureMethod(patched, featureSig(stock)), 0, Map.of(), "");
        } catch (IllegalArgumentException | ClassCastException | IndexOutOfBoundsException ex) {
            throw new IllegalArgumentException("Profile suggestions: " + ex.getMessage(), ex);
        }
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
        // The network-only fetch also names itas-android on 451. Its caller owns the resume state.
        // Old synthetic fixtures have one labelled fetch and no coroutine prologue.
        List<Method> labelledFetches = clean.values().stream().flatMap(List::stream).filter(m ->
                m.getDefiningClass().equals(PERMALINK_REPOSITORY) && m.getReturnType().equals("Ljava/lang/Object;")
                && m.getParameterTypes().size() == 4 && m.getParameterTypes().get(1).toString().equals(MEDIA)
                && holds(m, "itas-android")).toList();
        List<Method> resumedFetches = labelledFetches.stream()
                .filter(m -> holds(m, "call to 'resume' before 'invoke' with coroutine")).toList();
        Method fetch = featureOne(resumedFetches.isEmpty() ? labelledFetches : resumedFetches, "post link fetch");
        List<Instruction> body = instructions(fetch);
        List<Integer> reads = linkReads(body, owners, getters);
        requireFeature(!reads.isEmpty(), "post link fetch never reads the permalink");
        List<Integer> posts = new ArrayList<>();
        for (int k = reads.get(reads.size() - 1); k < body.size(); k++) {
            if (body.get(k).getOpcode() == Opcode.IPUT_OBJECT && ((FieldReference) ((ReferenceInstruction) body.get(k)).getReference()).getType().equals(MEDIA)) posts.add(k);
        }
        requireFeature(posts.size() == 1, "post link fetch stores " + posts.size() + " posts with the link");
        int post = ((TwoRegisterInstruction) body.get(posts.get(0))).getRegisterA();
        FeatureFlow fetchFlow = new FeatureFlow(fetch);
        Map<Integer, FeatureBlock> blocks = new HashMap<>();
        for (int read : reads) {
            int value = ((OneRegisterInstruction) body.get(read + 1)).getRegisterA();
            blocks.put(read + 2, (now, at) -> featurePostLink(clean, now, at, value, post, fetchFlow, read + 2));
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
            FeatureFlow holderFlow = new FeatureFlow(m);
            Map<Integer, FeatureBlock> holderBlocks = new HashMap<>();
            for (int read : holderReads) {
                int value = ((OneRegisterInstruction) holder.get(read + 1)).getRegisterA();
                holderBlocks.put(read + 2, (now, at) -> featureHolderLink(clean, now, at, value, self, held, holderFlow, read + 2));
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
            FeatureFlow resumedFlow = new FeatureFlow(m);
            Map<Integer, FeatureBlock> resumed = new HashMap<>();
            final int key, recall;
            if (!fetches.isEmpty()) {
                // The receiver, then the four arguments: the post is the second and the continuation the last.
                key = invokeRegisters(stock.get(fetches.get(0)))[4];
                recall = key;
                for (int call : fetches) {
                    int[] arguments = invokeRegisters(stock.get(call));
                    requireFeature(arguments[4] == key, featureSig(m) + " hands the plain fetch more than one continuation");
                    resumed.put(call, (now, at) -> featureRemember(now, at, key, arguments[2]));
                }
                fetcher = true;
            } else if (m.getName().equals("invokeSuspend") && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && m.getParameterTypes().size() == 1 && m.getParameterTypes().get(0).toString().equals("Ljava/lang/Object;")
                    && m.getReturnType().equals("Ljava/lang/Object;")) {
                Set<Integer> postCasts = new TreeSet<>();
                for (int read : stockReads) {
                    List<Integer> casts = java.util.stream.IntStream.range(1, read).boxed()
                            .filter(cast -> ownPostCast(resumedFlow, cast, self, type)
                                    && !resumedFlow.reachableWithoutEdge(read, cast, cast + 1)).toList();
                    postCasts.add(featureOne(casts, featureSig(m) + " own post cast completed on every path to link read " + read));
                }
                key = featureOne(postCasts.stream().map(cast -> ((TwoRegisterInstruction) stock.get(cast - 1)).getRegisterB())
                        .distinct().toList(), featureSig(m) + " coroutine field receiver");
                for (int cast : postCasts) {
                    requireFeature(resumedFlow.parameterOnEveryPath(cast + 1, key, self),
                            featureSig(m) + " loses its coroutine alias before remembering the post");
                    int kept = registerA(stock.get(cast));
                    resumed.put(cast + 1, (now, at) -> featureRemember(now, at, key, kept));
                }
                // The recall goes through this itself: 452 reuses the alias for an instance-of
                // between the cast and the read.
                recall = self;
                for (int read : stockReads) requireFeature(resumedFlow.parameterOnEveryPath(read + 2, self, self),
                        featureSig(m) + " lets go of this before recalling the post");
            } else {
                continue;
            }
            remembers.put(featureSig(m), resumed.size());
            for (int read : stockReads) {
                int value = registerA(stock.get(read + 1));
                resumed.put(read + 2, (now, at) -> featureResumeLink(clean, now, at, value, recall, resumedFlow, read + 2));
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

    /** A post field read through the coroutine's entry this, including proven low-register copies. */
    private static boolean ownPostCast(FeatureFlow flow, int k, int self, String owner) {
        List<Instruction> body = flow.layout.instructions;
        if (body.get(k).getOpcode() != Opcode.CHECK_CAST || !reference(body.get(k)).equals(MEDIA)
                || body.get(k - 1).getOpcode() != Opcode.IGET_OBJECT) return false;
        TwoRegisterInstruction load = (TwoRegisterInstruction) body.get(k - 1);
        if (load.getRegisterA() != registerA(body.get(k))
                || !((FieldReference) ((ReferenceInstruction) load).getReference()).getDefiningClass().equals(owner)
                || !flow.parameterOnEveryPath(k - 1, load.getRegisterB(), self)) return false;
        for (int from = 0; from < body.size(); from++) {
            if (from != k - 1 && flow.normal.get(from).contains(k) || flow.guarded.get(from).contains(k)) return false;
        }
        return true;
    }

    /** The post going to the extension against the coroutine in [key], just before the share waits. */
    private static int featureRemember(List<Instruction> body, int at, int key, int post) {
        requireFeature(at < body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(REMEMBER_POST)
                && Arrays.equals(invokeRegisters(body.get(at)), new int[]{key, post}), "missing or miswired " + REMEMBER_POST + " at instruction " + at);
        return 1;
    }

    /**
     * A resumed share's hook in front of [stock]'s instruction [site]: the post kept against [key]
     * back out of the extension into a free local, cast to a post, then the fetch's hook with it.
     */
    private static int featureResumeLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int key,
            FeatureFlow stock, int site) {
        requireFeature(at + 3 <= body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(REMEMBERED_POST)
                && Arrays.equals(invokeRegisters(body.get(at)), new int[]{key}) && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT,
                "missing or miswired " + REMEMBERED_POST + " at instruction " + at);
        int post = registerA(body.get(at + 1));
        requireFeature(post != key && post != link && body.get(at + 2).getOpcode() == Opcode.CHECK_CAST
                && registerA(body.get(at + 2)) == post && reference(body.get(at + 2)).equals(MEDIA),
                "resumed link hook doesn't cast the post it got back at " + (at + 2));
        featureScratch(stock, site, "resumed link hook at instruction " + at, post);
        return 3 + featurePostLink(clean, body, at + 3, link, post, stock, site);
    }

    /**
     * Throws naming [hook] unless each of [scratch], registers a hook in front of [stock]'s
     * instruction [site] writes for itself, is one nothing reads from there on before writing it,
     * a handler of a try the site sits in included. Every path out of the hook goes to the site or
     * those handlers: featureBody holds branches to the site to the hook's first instruction and
     * relocates each try range around it. A register still read there would be swapped for the
     * hook's own value without a word; the method verifies all the same when the kinds agree.
     */
    private static void featureScratch(FeatureFlow stock, int site, String hook, int... scratch) {
        for (int register : scratch) {
            List<Integer> reads = stock.readsFrom(site, register);
            requireFeature(reads.isEmpty(), hook + " writes v" + register + ", which " + featureSig(stock.method)
                    + " reads from its instruction " + site + " on, at " + reads);
        }
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

    /**
     * A holder's hook in front of [stock]'s instruction [site]: this into a free local, the post out
     * of the holder's post field, then the fetch's hook with that post.
     */
    private static int featureHolderLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int self, String post,
            FeatureFlow stock, int site) {
        requireFeature(at + 2 <= body.size() && body.get(at).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                && body.get(at + 1).getOpcode() == Opcode.IGET_OBJECT, "holder link hook doesn't load its post at " + at);
        TwoRegisterInstruction copy = (TwoRegisterInstruction) body.get(at), load = (TwoRegisterInstruction) body.get(at + 1);
        int media = copy.getRegisterA();
        requireFeature(copy.getRegisterB() == self && media < self, "holder link hook reads its post through another register than this");
        requireFeature(load.getRegisterA() == media && load.getRegisterB() == media && reference(body.get(at + 1)).equals(post),
                "holder link hook reads another field than " + post);
        featureScratch(stock, site, "holder link hook at instruction " + at, media);
        return 2 + featurePostLink(clean, body, at + 2, link, media, stock, site);
    }

    /**
     * The hook after one link read, in front of [stock]'s instruction [site]: null code and name,
     * the post's code and its author's username when there is a post and an author, then the
     * extension with the link, the name and the code, its answer replacing the link. The code and
     * the name go in registers nothing reads from the site on.
     */
    private static int featurePostLink(Map<String, List<Method>> clean, List<Instruction> body, int at, int link, int post,
            FeatureFlow stock, int site) {
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
        featureScratch(stock, site, "post link hook at instruction " + at, code, name);
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
        // The prefix writes v0 (the receiver copy, the PackageInfo, the result), v1 (the signers) and v2 (the false flag)
        // before the stock body runs. Each has to be a local, below the register `this` and the parameters start at.
        int locals = actual.getImplementation().getRegisterCount() - 1 - actual.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        for (int k : new int[]{0, 1, 3, 5, 6}) {
            int written = ((OneRegisterInstruction) body.get(k)).getRegisterA();
            requireFeature(written < locals, "signature wrapper writes v" + written + ", which is " + (written == locals ? "this" : "a parameter")
                    + " and not one of the method's " + locals + (locals == 1 ? " local" : " locals"));
        }
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
        featureShareTiles(clean, patched);
    }

    private static boolean featureIsShareTiles(Method m) {
        return m.getName().equals("invokeSuspend") && holds(m, "com.facebook.orca", TILE_COMPOSER_EXTRA);
    }

    /**
     * Share tiles on a re-signed build: each launch in the tiles' lambda hands the launcher's answer
     * and the same context and intent to the extension, the answer in a register nothing reads after
     * it, and nothing else in the lambda changes. Nothing else in Threads calls the extension.
     */
    private static void featureShareTiles(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method stock = featureTarget(clean, DexDiff::featureIsShareTiles, "share tile launches");
        FeatureFlow flow = new FeatureFlow(stock);
        List<Instruction> code = instructions(stock);
        Map<Integer, FeatureBlock> hooks = new HashMap<>();
        for (int k = 0; k < code.size(); k++) {
            if (code.get(k).getOpcode() != Opcode.INVOKE_VIRTUAL) continue;
            MethodReference called = (MethodReference) ((ReferenceInstruction) code.get(k)).getReference();
            if (!called.getReturnType().equals("Z") || !called.getDefiningClass().startsWith("LX/")
                    || !called.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of("Landroid/content/Context;", "Landroid/content/Intent;"))) continue;
            int[] launch = invokeRegisters(code.get(k));
            int next = k + 1;
            hooks.put(next, (body, at) -> {
                requireFeature(at + 1 < body.size() && body.get(at).getOpcode() == Opcode.MOVE_RESULT,
                        "the share tile launch before original instruction " + next + " drops its answer");
                int answer = registerA(body.get(at));
                requireFeature(isStaticInvoke(body.get(at + 1).getOpcode()) && reference(body.get(at + 1)).equals(OPEN_REFUSED_TILE)
                        && Arrays.equals(invokeRegisters(body.get(at + 1)), new int[]{answer, launch[1], launch[2]}),
                        "the share tile launch before original instruction " + next + " doesn't hand its answer, context and intent to " + OPEN_REFUSED_TILE);
                requireFeature(flow.readsFrom(next, answer).isEmpty(), "the share tile hook clobbers v" + answer + ", which is read after it");
                return 2;
            });
        }
        requireFeature(!hooks.isEmpty(), featureSig(stock) + " has no share tile launch");
        featureBody(stock, featureMethod(patched, featureSig(stock)), 0, Map.of(), OPEN_REFUSED_TILE, null, hooks);
        featureHostCalls(patched, OPEN_REFUSED_TILE, Map.of(featureSig(stock), hooks.size()));
    }

    /**
     * Open links in browser: Threads' browser launcher asks the extension first. Its first seven
     * instructions copy this into a local, read the context and the link from the launcher's fields,
     * call the extension, and return when the link went out. A kept link falls through to the stock
     * launcher, unchanged.
     */
    private static void featureBrowser(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        Method stock = featureTarget(clean, m -> !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals("V")
                && m.getParameterTypes().isEmpty() && holds(m, LAUNCHER_MESSAGE), "browser launcher");
        int locals = stock.getImplementation().getRegisterCount() - 1;
        String linkField = featureLauncherLink(stock);
        String contextField = featureOne(instructions(stock).stream().filter(i -> i instanceof ReferenceInstruction r
                && r.getReference() instanceof FieldReference f && f.getType().equals("Landroid/content/Context;")).map(DexDiff::reference).distinct().toList(),
                "browser launcher's context field");
        Method actual = featureMethod(patched, featureSig(stock));
        List<Instruction> body = instructions(actual);
        requireFeature(body.size() >= 7 && body.subList(0, 7).stream().map(Instruction::getOpcode).toList().equals(List.of(
                Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID))
                && reference(body.get(3)).equals(OPEN_LINK), "browser launcher hook is missing");
        TwoRegisterInstruction self = (TwoRegisterInstruction) body.get(0), context = (TwoRegisterInstruction) body.get(1), url = (TwoRegisterInstruction) body.get(2);
        int result = registerA(body.get(4));
        requireFeature(self.getRegisterB() == locals && self.getRegisterA() < locals
                && context.getRegisterB() == self.getRegisterA() && url.getRegisterB() == self.getRegisterA()
                && reference(body.get(1)).equals(contextField) && reference(body.get(2)).equals(linkField)
                && Arrays.equals(invokeRegisters(body.get(3)), new int[]{context.getRegisterA(), url.getRegisterA()})
                && context.getRegisterA() != url.getRegisterA() && context.getRegisterA() < locals && url.getRegisterA() < locals
                && result < locals && registerA(body.get(5)) == result,
                "browser launcher hook passes the wrong context or link");
        Layout layout = new Layout(actual.getImplementation());
        requireFeature(browserDestination(layout, 5) == 7, "a link that stays doesn't fall through to the launcher");
        featureBody(stock, actual, 7, Map.of(), OPEN_LINK);
        Map<String, Integer> expected = new HashMap<>(Map.of(featureSig(stock), 1));
        BrowserSites direct = featureBrowserSites(clean, stock);
        for (BrowserSite site : direct.hooks()) {
            Method changed = featureMethod(patched, featureSig(site.stock()));
            int size = featureBrowserGuard(site, changed, instructions(changed));
            if (site.at() == 0) featureBody(site.stock(), changed, size, Map.of(), OPEN_LINK);
            else featureBody(site.stock(), changed, 0, Map.of(), OPEN_LINK, null, Map.of(site.at(), (b, n) -> size));
            expected.put(featureSig(site.stock()), 1);
        }
        for (Method kept : direct.kept()) featureBody(kept, featureMethod(patched, featureSig(kept)), 0, Map.of(), "");
        featureHostCalls(patched, OPEN_LINK, expected);
    }

    /**
     * A place that makes the browser's Intent without the launcher asking first. [field] names the
     * String field a site reads its link from, at the start of a method that answers true when the
     * link went out; such a site has no [url] or [done], -1 for both. Any other site has its link in
     * [url] and goes on to [done], its own ending for an opened browser.
     */
    private record BrowserSite(Method stock, int at, int done, int context, int url, String field) {}
    private record BrowserSites(List<BrowserSite> hooks, List<Method> kept) {}
    private static final String BROWSER_FACTORY_NOTE = "BrowserLiteIntent.OPEN_WITH_URL";
    private static final String BROWSER_AD_NOTE = "AdClickHandler.openWebLink missing webUri for AD_DESTINATION_WEB";
    private static final String BROWSER_IMMERSIVE_NOTE = "com.instagram.barcelona.inappbrowser.compose.ImmersiveBrowserScreen (";
    private static final String BROWSER_STATE = "Landroidx/compose/runtime/MutableState;";

    /** Independently identify the current direct callers and their success exits from the clean APK. */
    private static BrowserSites featureBrowserSites(Map<String, List<Method>> clean, Method launcher) {
        Method factory = featureTarget(clean, m -> AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals("Landroid/content/Intent;")
                && m.getParameterTypes().size() == 10 && holds(m, "TrackingInfo.ARG_MODULE_NAME", BROWSER_FACTORY_NOTE), "browser Intent factory");
        String target = featureSig(factory);
        FeatureFlow factoryFlow = new FeatureFlow(factory);
        List<Instruction> made = instructions(factory);
        int parser = featureOne(java.util.stream.IntStream.range(0, made.size()).boxed().filter(n -> {
            if (!isStaticInvoke(made.get(n).getOpcode()) || !(((ReferenceInstruction) made.get(n)).getReference() instanceof MethodReference p)) return false;
            return p.getReturnType().equals("Landroid/net/Uri;") && p.getParameterTypes().equals(List.of("Ljava/lang/String;"));
        }).toList(), "browser factory URI parser");
        requireFeature(factoryFlow.parameterOnEveryPath(parser, invokeRegisters(made.get(parser))[0], browserParameter(factory, 5)), "browser factory parses the wrong URL parameter");
        List<Method> everything = clean.values().stream().flatMap(List::stream).toList();
        List<Method> callers = everything.stream().filter(m -> !callSites(instructions(m), target).isEmpty()).toList();
        requireFeature(callers.size() == 5 && callers.stream().mapToInt(m -> callSites(instructions(m), target).size()).sum() == 5,
                "browser factory caller census changed");
        String launcherClass = launcher.getDefiningClass();
        Method helper = featureOne(callers.stream().filter(m -> m.getDefiningClass().equals(launcherClass)).toList(), "launcher's browser Intent helper");
        Method builder = featureOne(callers.stream().filter(m -> m != helper && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                && m.getReturnType().equals("Landroid/content/Intent;")).toList(), "ad browser Intent builder");
        Method media = featureOne(callers.stream().filter(m -> m.getName().equals("invokeSuspend") && m.getReturnType().equals("Ljava/lang/Object;")
                && holds(m, "AD_DESTINATION_WEB")).toList(), "media ad browser");
        Method immersive = featureOne(callers.stream().filter(m -> holdsNote(m, BROWSER_IMMERSIVE_NOTE)).toList(), "immersive browser");
        Method lead = featureOne(callers.stream().filter(m -> m.getName().equals("invoke") && m.getReturnType().equals("Ljava/lang/Object;")
                && holds(m, "android.intent.action.VIEW")).toList(), "lead/policy browser");
        requireFeature(new HashSet<>(callers).equals(new HashSet<>(List.of(helper, builder, media, immersive, lead))), "unexpected direct browser caller");

        // The web link an ad request gives the launcher, by the constructor argument the link field gets.
        Method request = featureTarget(clean, m -> holds(m, BROWSER_AD_NOTE), "ad web request");
        List<Instruction> requested = instructions(request);
        Method constructor = featureOne(everything.stream().filter(m -> m.getDefiningClass().equals(launcherClass) && m.getName().equals("<init>")).toList(),
                "browser launcher's constructor");
        featureOne(callSites(requested, featureSig(launcher)), "ad web launcher request");
        int requestAt = featureOne(callSites(requested, featureSig(constructor)), "ad web launcher construction");
        List<Instruction> building = instructions(constructor);
        String linkField = featureLauncherLink(launcher);
        int stored = featureOne(java.util.stream.IntStream.range(0, building.size()).boxed().filter(n -> building.get(n).getOpcode() == Opcode.IPUT_OBJECT
                && reference(building.get(n)).equals(linkField)).toList(), "browser launcher's link store");
        int requestUrl = invokeRegisters(requested.get(requestAt))[registerA(building.get(stored)) - browserParameter(constructor, 0) + 1];
        int webRead = browserOrigin(new FeatureFlow(request), requestAt, requestUrl);
        requireFeature(webRead >= 0 && requested.get(webRead).getOpcode() == Opcode.IGET_OBJECT, "ad web request no longer reads a CTA field");
        String webField = reference(requested.get(webRead));

        List<BrowserSite> hooks = new ArrayList<>();
        hooks.add(featureBrowserLead(lead, target));
        hooks.add(featureBrowserAd(everything, builder, target));
        hooks.add(featureBrowserMedia(media, target, webField));
        return new BrowserSites(hooks, List.of(factory, immersive, request, helper, builder));
    }

    /**
     * The lead form and privacy policy helper, one case of a merged lambda: it reads the link from its
     * own String field, an empty string standing in on the way there when the field is null.
     */
    private static BrowserSite featureBrowserLead(Method lead, String target) {
        List<Instruction> body = instructions(lead);
        FeatureFlow flow = new FeatureFlow(lead);
        int at = featureOne(callSites(body, target), "lead/policy factory call");
        int[] args = invokeRegisters(body.get(at));
        Set<Integer> links = browserOrigins(flow, at, args[5], new HashSet<>());
        java.util.function.IntPredicate own = n -> n >= 0 && body.get(n).getOpcode() == Opcode.IGET_OBJECT
                && ((ReferenceInstruction) body.get(n)).getReference() instanceof FieldReference f
                && f.getType().equals("Ljava/lang/String;") && f.getDefiningClass().equals(lead.getDefiningClass());
        requireFeature(links.stream().anyMatch(own::test) && links.stream().allMatch(n -> own.test(n) || n >= 0
                && (body.get(n).getOpcode() == Opcode.CONST_STRING || body.get(n).getOpcode() == Opcode.CONST_STRING_JUMBO)), "lead/policy URL or fallback changed");
        int ending = java.util.stream.IntStream.range(at + 1, body.size()).filter(n -> (body.get(n).getOpcode() == Opcode.GOTO
                || body.get(n).getOpcode() == Opcode.GOTO_16 || body.get(n).getOpcode() == Opcode.GOTO_32) && browserDestination(flow.layout, n) > n).findFirst().orElse(-1);
        requireFeature(ending >= 0 && callSites(body, "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V").stream().anyMatch(n -> n > at && n < ending),
                "lead/policy browser has no successful ending");
        return new BrowserSite(lead, at, browserDestination(flow.layout, ending), args[0], args[5], null);
    }

    /**
     * The ad browser: [builder] makes the Intent from its class's own String field, and the method
     * of that class taking the Activity and calling the builder opens it, so the hook goes first
     * thing in there.
     */
    private static BrowserSite featureBrowserAd(List<Method> everything, Method builder, String target) {
        List<Instruction> body = instructions(builder);
        int at = featureOne(callSites(body, target), "ad browser factory call");
        int url = browserOrigin(new FeatureFlow(builder), at, invokeRegisters(body.get(at))[5]);
        requireFeature(url >= 0 && body.get(url).getOpcode() == Opcode.IGET_OBJECT, "ad browser gets a link other than a field");
        FieldReference field = (FieldReference) ((ReferenceInstruction) body.get(url)).getReference();
        requireFeature(field.getType().equals("Ljava/lang/String;") && field.getDefiningClass().equals(builder.getDefiningClass()), "ad browser gets a link other than its own String field");
        Method opener = featureOne(everything.stream().filter(m -> m != builder && m.getDefiningClass().equals(builder.getDefiningClass()) && m.getReturnType().equals("Z")
                && !m.getParameterTypes().isEmpty() && m.getParameterTypes().get(0).equals(ANDROID_ACTIVITY)
                && !callSites(instructions(m), featureSig(builder)).isEmpty()).toList(), "ad browser's opener");
        requireFeature(opener.getImplementation().getTryBlocks().stream().noneMatch(t -> t.getStartCodeAddress() == 0), "ad browser's opener starts inside a try block");
        return new BrowserSite(opener, 0, -1, browserParameter(opener, 0), -1, reference(body.get(url)));
    }

    /**
     * The media viewer's swipe up on an ad, a coroutine reading its context and state from its own
     * fields. It opens the web link of a call to action past the check that its destination is the
     * web, then sets its state from the flag the path made. An ad with no web link clears the flag and
     * joins it there.
     */
    private static BrowserSite featureBrowserMedia(Method media, String target, String webField) {
        List<Instruction> body = instructions(media);
        FeatureFlow flow = new FeatureFlow(media);
        int at = featureOne(callSites(body, target), "CTA factory call");
        int[] args = invokeRegisters(body.get(at));
        int url = browserOrigin(flow, at, args[5]);
        requireFeature(url >= 0 && body.get(url).getOpcode() == Opcode.IGET_OBJECT && reference(body.get(url)).equals(webField), "browser CTA uses the wrong web field");
        FieldReference field = (FieldReference) ((ReferenceInstruction) body.get(url)).getReference();
        requireFeature(field.getType().equals("Ljava/lang/String;"), "browser CTA URL is not a string");
        // The destination check reads the same call to action the link comes from.
        int cta = browserOrigin(flow, url, ((TwoRegisterInstruction) body.get(url)).getRegisterB());
        int guard = featureOne(java.util.stream.IntStream.range(3, at).boxed().filter(n -> body.get(n).getOpcode() == Opcode.IF_NE
                && body.get(n - 1).getOpcode() == Opcode.SGET_OBJECT && body.get(n - 2).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                && body.get(n - 3) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference getter
                && getter.getDefiningClass().equals(field.getDefiningClass()) && getter.getParameterTypes().isEmpty()
                && ((FieldReference) ((ReferenceInstruction) body.get(n - 1)).getReference()).getType().equals(getter.getReturnType())
                && browserOrigin(flow, n - 3, invokeRegisters(body.get(n - 3))[0]) == cta).toList(), "browser web CTA guard");
        requireFeature(browserDominates(flow, guard, at), "browser skips the web CTA guard");
        int failed = browserDestination(flow.layout, guard);
        int self = browserParameter(media, 0) - 1;
        int context = browserOrigin(flow, at, args[0]);
        requireFeature(context >= 0 && body.get(context).getOpcode() == Opcode.IGET_OBJECT
                && ((FieldReference) ((ReferenceInstruction) body.get(context)).getReference()).getType().equals("Landroid/content/Context;")
                && flow.parameterOnEveryPath(context, ((TwoRegisterInstruction) body.get(context)).getRegisterB(), self), "media browser uses the wrong Context");
        int setter = featureOne(java.util.stream.IntStream.range(1, body.size() - 2).boxed().filter(n -> body.get(n - 1).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                && body.get(n) instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference set
                && set.getParameterTypes().equals(List.of(BROWSER_STATE, "Z"))
                && body.get(n + 1).getOpcode() == Opcode.SGET_OBJECT && body.get(n + 2).getOpcode() == Opcode.RETURN_OBJECT).toList(), "media opened state completion");
        int done = setter - 1;
        int saved = ((TwoRegisterInstruction) body.get(done)).getRegisterB();
        int state = browserOrigin(flow, at, saved);
        requireFeature(state >= 0 && state == browserOrigin(flow, done, saved)
                && body.get(state).getOpcode() == Opcode.IGET_OBJECT
                && ((FieldReference) ((ReferenceInstruction) body.get(state)).getReference()).getType().equals(BROWSER_STATE)
                && flow.parameterOnEveryPath(state, ((TwoRegisterInstruction) body.get(state)).getRegisterB(), self), "media completion state is not initialized before the handoff");
        requireFeature(body.get(failed).getOpcode() == Opcode.CONST_4 && ((WideLiteralInstruction) body.get(failed)).getWideLiteral() == 0
                && registerA(body.get(failed)) == invokeRegisters(body.get(setter))[1] && browserDestination(flow.layout, failed + 1) == done, "media no-open tail changed");
        return new BrowserSite(media, at, done, args[0], args[5], null);
    }

    /** Checks the hook in front of [site]'s stock instruction and answers how many instructions it takes. */
    private static int featureBrowserGuard(BrowserSite site, Method changed, List<Instruction> body) {
        int at = site.at();
        boolean reads = site.field() != null;
        List<Opcode> shape = reads
                ? List.of(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN)
                : List.of(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.GOTO_16);
        int size = shape.size(), load = reads ? 2 : 1;
        requireFeature(body.size() > at + size && body.subList(at, at + size).stream().map(Instruction::getOpcode).toList().equals(shape), "direct browser hook is missing");
        TwoRegisterInstruction link = (TwoRegisterInstruction) body.get(at), context = (TwoRegisterInstruction) body.get(at + load);
        Instruction call = body.get(at + load + 1);
        int result = registerA(body.get(at + load + 2));
        requireFeature(context.getRegisterB() == site.context() && context.getRegisterA() != link.getRegisterA() && result == context.getRegisterA()
                && registerA(body.get(at + load + 3)) == result && reference(call).equals(OPEN_LINK)
                && Arrays.equals(invokeRegisters(call), new int[]{context.getRegisterA(), link.getRegisterA()}), "direct browser arguments or answer are wrong");
        if (reads) {
            TwoRegisterInstruction read = (TwoRegisterInstruction) body.get(at + 1);
            requireFeature(link.getRegisterB() == browserParameter(site.stock(), 0) - 1 && read.getRegisterA() == link.getRegisterA()
                    && read.getRegisterB() == link.getRegisterA() && reference(body.get(at + 1)).equals(site.field()), "direct browser arguments or answer are wrong");
            requireFeature(((WideLiteralInstruction) body.get(at + 6)).getWideLiteral() == 1 && registerA(body.get(at + 6)) == result
                    && registerA(body.get(at + 7)) == result, "direct browser hook doesn't answer true for a link that went out");
        } else {
            requireFeature(link.getRegisterB() == site.url(), "direct browser arguments or answer are wrong");
        }
        FeatureFlow old = new FeatureFlow(site.stock());
        int locals = browserParameter(site.stock(), 0) - (AccessFlags.STATIC.isSet(site.stock().getAccessFlags()) ? 0 : 1);
        String clobbers = "direct browser hook clobbers a live local";
        for (int scratch : new int[]{context.getRegisterA(), link.getRegisterA()}) {
            requireFeature(scratch < locals, clobbers + ": past the method's locals");
            requireFeature(old.readsFrom(at, scratch).isEmpty(), clobbers + ": read at the hook site");
            if (site.done() >= 0) requireFeature(old.readsFrom(site.done(), scratch).isEmpty(), clobbers + ": read where it succeeds");
        }
        Layout layout = new Layout(changed.getImplementation());
        requireFeature(browserDestination(layout, at + load + 3) == at + size, "declined browser handoff bypasses stock code");
        if (site.done() >= 0) requireFeature(browserDestination(layout, at + load + 4) == (site.done() < at ? site.done() : site.done() + size),
                "successful browser handoff opens twice or uses the wrong completion");
        return size;
    }

    private static int browserParameter(Method method, int parameter) {
        int first = method.getImplementation().getRegisterCount() - method.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        return first + method.getParameterTypes().subList(0, parameter).stream().mapToInt(DexDiff::slots).sum();
    }

    private static int browserDestination(Layout layout, int at) {
        Instruction instruction = layout.instructions.get(at);
        requireFeature(instruction instanceof OffsetInstruction, "browser completion is not a branch");
        int target = layout.addresses.indexOf(layout.addresses.get(at) + ((OffsetInstruction) instruction).getCodeOffset());
        requireFeature(target >= 0, "browser branch misses an instruction");
        return target;
    }

    private static int browserOrigin(FeatureFlow flow, int at, int register) {
        Set<Integer> sources = browserOrigins(flow, at, register, new HashSet<>());
        requireFeature(sources.size() == 1, "browser value has disagreeing origins");
        return sources.iterator().next();
    }

    private static Set<Integer> browserOrigins(FeatureFlow flow, int at, int register, Set<List<Integer>> seen) {
        requireFeature(seen.add(List.of(at, register)), "cyclic browser value");
        Set<Integer> result = new HashSet<>();
        for (int n : flow.reaching(at, register)) {
            if (n < 0) { result.add(-1); continue; }
            Instruction i = flow.layout.instructions.get(n);
            requireFeature(registerA(i) == register, "browser value has a wide-half clobber");
            if (i.getOpcode() == Opcode.CHECK_CAST || i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16 || i.getOpcode() == Opcode.MOVE_OBJECT_16)
                result.addAll(browserOrigins(flow, n, i instanceof TwoRegisterInstruction move ? move.getRegisterB() : register, new HashSet<>(seen)));
            else result.add(n);
        }
        return result;
    }

    private static boolean browserDominates(FeatureFlow flow, int guard, int target) {
        Set<Integer> seen = new HashSet<>();
        Deque<Integer> work = new ArrayDeque<>(List.of(0));
        while (!work.isEmpty()) {
            int at = work.removeFirst();
            if (at == guard || !seen.add(at)) continue;
            if (at == target) return false;
            work.addAll(flow.normal.get(at)); work.addAll(flow.exceptional.get(at));
        }
        return true;
    }

    /** The String field of its own class the launcher parses with java.net.URI, through the moves in front of it. */
    private static String featureLauncherLink(Method stock) {
        List<Instruction> body = instructions(stock);
        int parse = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> body.get(k).getOpcode() == Opcode.INVOKE_DIRECT
                        && reference(body.get(k)).equals("Ljava/net/URI;-><init>(Ljava/lang/String;)V")).toList(), "launcher URI parse");
        int register = invokeRegisters(body.get(parse))[1];
        for (int k = parse - 1; k >= 0; k--) {
            Instruction i = body.get(k);
            if (i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16 || i.getOpcode() == Opcode.MOVE_OBJECT_16) {
                if (((TwoRegisterInstruction) i).getRegisterA() == register) register = ((TwoRegisterInstruction) i).getRegisterB();
            } else if (i.getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) i).getRegisterA() == register) {
                FieldReference field = (FieldReference) ((ReferenceInstruction) i).getReference();
                requireFeature(field.getType().equals("Ljava/lang/String;") && field.getDefiningClass().equals(stock.getDefiningClass()),
                        "browser launcher parses a field other than its own String");
                return reference(i);
            } else {
                requireFeature(i.getOpcode() == Opcode.IGET_OBJECT || i.getOpcode() == Opcode.NEW_INSTANCE && ((OneRegisterInstruction) i).getRegisterA() != register,
                        "browser launcher runs " + i.getOpcode().name + " before it parses the link");
            }
        }
        throw new AssertionError("browser launcher parses no field of its own");
    }

    /** Where one of Threads' return checks makes its boolean answer: the stock method, the instruction the hook goes in front of, and the answer's register. */
    private static final class ReturnSite {
        final Method stock;
        final int at;
        final int register;

        ReturnSite(Method stock, int at, int register) {
            this.stock = stock;
            this.at = at;
            this.register = register;
        }
    }

    /**
     * Block background-return feed refresh: each of Threads' four return checks asks the extension
     * once, where its answer is made. The hot-start decision asks first thing and answers null when
     * the feed is held. The reset to main feed, the warm-start check and For you's swap hand their
     * own answer to the extension right before it's returned, stored or joined, so every path to
     * that answer goes through the hook.
     */
    private static void featureReturnRefresh(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        for (Map.Entry<String, ReturnSite> e : featureReturnSites(clean).entrySet()) {
            ReturnSite site = e.getValue();
            featureBody(site.stock, featureMethod(patched, featureSig(site.stock)), 0, Map.of(site.at, site.register), e.getKey());
            featureHostCalls(patched, e.getKey(), Map.of(featureSig(site.stock), 1));
        }
        Method stock = featureHotStartDecision(clean);
        Method actual = featureMethod(patched, featureSig(stock));
        List<Instruction> body = instructions(actual);
        int locals = stock.getImplementation().getRegisterCount() - stock.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        requireFeature(AccessFlags.STATIC.isSet(stock.getAccessFlags()) && body.size() > 5 && isStaticInvoke(body.get(0).getOpcode())
                && reference(body.get(0)).equals(HOLD_HOT_START) && invokeRegisters(body.get(0)).length == 0
                && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                && featureLiteral(body.get(3), 0) && body.get(4).getOpcode() == Opcode.RETURN_OBJECT,
                "hot-start decision hook is missing");
        int held = ((OneRegisterInstruction) body.get(1)).getRegisterA();
        requireFeature(held < locals && ((OneRegisterInstruction) body.get(2)).getRegisterA() == held
                && ((OneRegisterInstruction) body.get(3)).getRegisterA() == held
                && ((OneRegisterInstruction) body.get(4)).getRegisterA() == held, "hot-start decision hook uses the wrong register");
        Layout layout = new Layout(actual.getImplementation());
        requireFeature(layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(5),
                "a return the extension doesn't hold doesn't fall through to the hot-start decision");
        featureBody(stock, actual, 5, Map.of(), HOLD_HOT_START);
        featureHostCalls(patched, HOLD_HOT_START, Map.of(featureSig(stock), 1));
    }

    /** The three return checks that hand the extension their own answer, by the call each one makes. */
    private static Map<String, ReturnSite> featureReturnSites(Map<String, List<Method>> clean) {
        Map<String, ReturnSite> sites = new LinkedHashMap<>();
        Method warm = featureTarget(clean, m -> !m.getParameterTypes().isEmpty()
                && m.getParameterTypes().get(m.getParameterTypes().size() - 1).toString().equals("Z")
                && holds(m, TOO_SHORT, WALL_CLOCK), "warm-start check");
        sites.put(WARM_START, featureWarmStore(warm));
        Method reset = featureTarget(clean, m -> m.getDefiningClass().equals(BARCELONA_ACTIVITY) && m.getReturnType().equals("Z")
                && holds(m, RESET_TO_MAIN_FEED, RESET_TO_HOME_FEED), "reset to main feed");
        List<Instruction> body = instructions(reset);
        int answer = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> body.get(k).getOpcode() == Opcode.RETURN).toList(), "reset to main feed's return");
        sites.put(RESET_TO_FEED, new ReturnSite(reset, answer, ((OneRegisterInstruction) body.get(answer)).getRegisterA()));
        // For you's swap compares the time away once more, in the warm-start check's class.
        List<ReturnSite> swaps = new ArrayList<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m.getDefiningClass().equals(warm.getDefiningClass())) swaps.addAll(featureSwaps(m));
        }
        sites.put(CACHED_POSTS, featureOne(swaps, "For you's swap to posts fetched in the background"));
        return sites;
    }

    /**
     * The warm-start check's store of its refresh answer. A cmp-long of the time away with the
     * threshold, then an if-ltz that sends a short time to the TOO_SHORT log, which runs straight
     * from the branch's target. The const/4 1 right after the if-ltz is the answer, and the first
     * iput-boolean of its register after that stores it into the decision Threads hands back.
     */
    private static ReturnSite featureWarmStore(Method warm) {
        Layout layout = new Layout(warm.getImplementation());
        List<Instruction> body = layout.instructions;
        int logged = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> reference(body.get(k)).equals(TOO_SHORT)).toList(), "warm-start check's short log");
        int branch = featureOne(java.util.stream.IntStream.range(1, body.size()).boxed().filter(k -> {
            if (body.get(k).getOpcode() != Opcode.IF_LTZ || body.get(k - 1).getOpcode() != Opcode.CMP_LONG
                    || ((OneRegisterInstruction) body.get(k)).getRegisterA() != ((OneRegisterInstruction) body.get(k - 1)).getRegisterA()) return false;
            int target = layout.addresses.indexOf(layout.addresses.get(k) + ((OffsetInstruction) body.get(k)).getCodeOffset());
            if (target < 0 || target > logged) return false;
            for (int n = target; n < logged; n++) if (body.get(n) instanceof OffsetInstruction || !body.get(n).getOpcode().canContinue()) return false;
            return true;
        }).toList(), "warm-start threshold comparison");
        requireFeature(featureLiteral(body.get(branch + 1), 1), "warm-start check sets no true answer past its threshold");
        int register = ((OneRegisterInstruction) body.get(branch + 1)).getRegisterA();
        for (int k = branch + 2; k < body.size(); k++) {
            if (body.get(k).getOpcode() == Opcode.IPUT_BOOLEAN && ((TwoRegisterInstruction) body.get(k)).getRegisterA() == register) {
                return new ReturnSite(warm, k, register);
            }
        }
        throw new IllegalArgumentException("warm-start answer v" + register + " is never stored");
    }

    /**
     * For you's swaps to the posts it fetched in the background in [m]: a cmp-long, a const/4 true,
     * an if-gez on the comparison over a const/4 false into the join, and an if-eqz on that answer
     * within six instructions of the join, which guards the swap. The hook goes in at the join.
     */
    private static List<ReturnSite> featureSwaps(Method m) {
        List<ReturnSite> sites = new ArrayList<>();
        if (m.getImplementation() == null) return sites;
        Layout layout = new Layout(m.getImplementation());
        List<Instruction> body = layout.instructions;
        for (int zero = 3; zero + 1 < body.size(); zero++) {
            int branch = zero - 1, compare = zero - 3, join = zero + 1;
            if (!featureLiteral(body.get(zero), 0) || !featureLiteral(body.get(zero - 2), 1)
                    || body.get(branch).getOpcode() != Opcode.IF_GEZ || body.get(compare).getOpcode() != Opcode.CMP_LONG) continue;
            int answer = ((OneRegisterInstruction) body.get(zero)).getRegisterA();
            if (((OneRegisterInstruction) body.get(zero - 2)).getRegisterA() != answer
                    || ((OneRegisterInstruction) body.get(branch)).getRegisterA() != ((OneRegisterInstruction) body.get(compare)).getRegisterA()
                    || layout.addresses.get(branch) + ((OffsetInstruction) body.get(branch)).getCodeOffset() != layout.addresses.get(join)) continue;
            for (int k = join; k < Math.min(body.size(), join + 6); k++) {
                if (body.get(k).getOpcode() == Opcode.IF_EQZ && ((OneRegisterInstruction) body.get(k)).getRegisterA() == answer) {
                    sites.add(new ReturnSite(m, join, answer));
                    break;
                }
            }
        }
        return sites;
    }

    /**
     * The hot-start decision. It has no string of its own: BarcelonaActivity's handler of it is the
     * one method there holding badge_decision, and onStart makes it with one static call answering
     * the handler's parameter type, from a helper, the last surface and two times.
     */
    private static Method featureHotStartDecision(Map<String, List<Method>> clean) {
        Method handler = featureTarget(clean, m -> m.getDefiningClass().equals(BARCELONA_ACTIVITY) && m.getReturnType().equals("V")
                && m.getParameterTypes().size() == 1 && holds(m, BADGE_DECISION), "hot-start handler");
        String decision = handler.getParameterTypes().get(0).toString();
        Method onStart = featureTarget(clean, m -> m.getDefiningClass().equals(BARCELONA_ACTIVITY) && m.getName().equals("onStart")
                && m.getParameterTypes().isEmpty(), "BarcelonaActivity.onStart");
        String call = featureOne(instructions(onStart).stream().filter(i -> isStaticInvoke(i.getOpcode()))
                .map(i -> (MethodReference) ((ReferenceInstruction) i).getReference())
                .filter(r -> r.getReturnType().equals(decision) && r.getParameterTypes().size() == 4
                        && r.getParameterTypes().get(0).toString().startsWith("L")
                        && r.getParameterTypes().get(1).toString().equals("Ljava/lang/String;")
                        && r.getParameterTypes().get(2).toString().equals("J") && r.getParameterTypes().get(3).toString().equals("J"))
                .map(DexDiff::featureSig).distinct().toList(), "onStart's hot-start decision");
        return featureMethod(clean, call);
    }

    private static boolean featureLiteral(Instruction i, long value) {
        return i.getOpcode() == Opcode.CONST_4 && ((WideLiteralInstruction) i).getWideLiteral() == value;
    }

    /**
     * Where Disable video autoplay hooks: PostVideo, its playback effect, its play flag, each feed
     * post, Instagram post, trend preview and ad card method's calls to PostVideo with their play
     * flag's register, and the viewer's methods that call PostVideo.
     */
    private record VideoSites(Method postVideo, Method effect, PlayFlag flag, List<Method> forwarders, Map<Method, Map<Integer, VideoCall>> calls, List<Method> viewers) {}

    /** A direct or forwarded call's actual play and mask registers, with PostVideo's default. */
    private record VideoCall(int play, int mask, PlayDefault fallback) {}

    /** PostVideo or a checked shortened overload and the parameters it passes through. */
    private record VideoTarget(Method method, int play, PlayDefault fallback) {}

    /** PostVideo's play flag: the [parameter] it plays by, and the [test] of the register holding it. */
    private record PlayFlag(int parameter, int test) {}

    /** PostVideo's default for its play flag: a caller that sets [bit] of its [mask] parameter gets [value] instead of the flag it hands over. */
    private record PlayDefault(int mask, long bit, long value) {}

    /**
     * Disable video autoplay: every call a feed post, an Instagram post shown in a thread, a trend
     * preview or an ad card makes to PostVideo asks the extension first about the flag it hands
     * PostVideo as whether to play, on that flag's own register, with every branch to the call
     * landing on the hook. A call whose default mask, one constant, leaves the flag to PostVideo's
     * default, as the trend preview and the ad card do on 450, would have PostVideo ignore that
     * register, so it first gets the mask without the flag's bit and the default's value in the
     * flag's register, and nothing may read either after the call. PostVideo, its playback effect
     * and the full-screen viewer keep their stock bodies, so the viewer plays as it always has.
     */
    private static void featureVideoAutoplay(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        VideoSites sites = featureVideoSites(clean);
        List<Method> stock = new ArrayList<>(List.of(sites.postVideo(), sites.effect()));
        stock.addAll(sites.forwarders());
        stock.addAll(sites.viewers());
        for (Method m : stock) featureBody(m, featureMethod(patched, featureSig(m)), 0, Map.of(), HOLD_VIDEO);
        Map<String, Integer> calls = new TreeMap<>();
        for (Map.Entry<Method, Map<Integer, VideoCall>> e : sites.calls().entrySet()) {
            Method caller = e.getKey();
            List<Instruction> body = instructions(caller);
            FeatureFlow flow = new FeatureFlow(caller);
            Map<Integer, Integer> asked = new TreeMap<>();
            Map<Integer, FeatureBlock> defaulted = new HashMap<>();
            for (Map.Entry<Integer, VideoCall> call : e.getValue().entrySet()) {
                int k = call.getKey(), play = call.getValue().play();
                PlayDefault fallback = call.getValue().fallback();
                if (fallback == null) { asked.put(k, play); continue; }
                int mask = call.getValue().mask();
                int[] origin = flow.origin(k, mask);
                requireFeature(origin != null && origin[0] >= 0 && featureConstant(body.get(origin[0])),
                        featureSig(caller) + " hands PostVideo a default mask in v" + mask + " at instruction " + k + " that isn't one constant");
                long value = ((WideLiteralInstruction) body.get(origin[0])).getWideLiteral();
                if ((value & fallback.bit()) == 0) { asked.put(k, play); continue; }
                for (int written : new int[]{mask, play}) {
                    List<Integer> reads = flow.readsAfter(k, written);
                    requireFeature(reads.isEmpty(), "the default flag's hook at instruction " + k + " writes v" + written + ", which "
                            + featureSig(caller) + " reads after PostVideo, at " + reads);
                }
                defaulted.put(k, featureDefaultedFlag(mask, value & ~fallback.bit(), play, fallback.value()));
            }
            featureBody(caller, featureMethod(patched, featureSig(caller)), 0, asked, HOLD_VIDEO, null, defaulted);
            calls.put(featureSig(caller), e.getValue().size());
        }
        featureHostCalls(patched, HOLD_VIDEO, calls);
        featureVideoPrefetch(clean, patched);
    }

    /**
     * Where the video prefetcher asks Instagram's autoplay-off check: the static one-object boolean
     * [check] holding both flag names, the [dispatcher] holding "VideoPrefetchDispatcher.queue", the
     * [skip] test it calls that calls the check, the check's call at [call] followed by its
     * move-result and the if-nez at [test] reading it from [register], the [siblings] holding the
     * Olympus name without the check's, and the check's [others] callers, Instagram's legacy checker.
     */
    private record PrefetchSites(Method check, Method dispatcher, Method skip, int call, int test, int register,
            List<Method> siblings, List<Method> others) {}

    private static PrefetchSites featurePrefetchSites(Map<String, List<Method>> clean) {
        Method check = featureTarget(clean, m -> AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals("Z")
                && m.getParameterTypes().size() == 1 && m.getParameterTypes().get(0).toString().startsWith("L")
                && holds(m, AUTOPLAY_OFF, AUTOPLAY_OFF_OLYMPUS), "Instagram's autoplay-off check");
        String checkSig = featureSig(check);
        Method dispatcher = featureTarget(clean, m -> holds(m, PREFETCH_DISPATCHER), "video prefetch dispatcher");
        Set<String> callees = new TreeSet<>();
        for (Instruction i : instructions(dispatcher)) {
            if (!isStaticInvoke(i.getOpcode()) || !(((ReferenceInstruction) i).getReference() instanceof MethodReference)) continue;
            MethodReference callee = (MethodReference) ((ReferenceInstruction) i).getReference();
            List<Method> found = clean.get(featureSig(callee));
            if (callee.getReturnType().equals("Z") && found != null && found.size() == 1
                    && !callSites(instructions(found.get(0)), checkSig).isEmpty()) callees.add(featureSig(callee));
        }
        Method skip = featureMethod(clean, featureOne(new ArrayList<>(callees), "the prefetch skip test"));
        List<Instruction> body = instructions(skip);
        int call = featureOne(callSites(body, checkSig), "the skip test's call to the autoplay-off check");
        requireFeature(call + 2 < body.size() && body.get(call + 1).getOpcode() == Opcode.MOVE_RESULT
                && body.get(call + 2).getOpcode() == Opcode.IF_NEZ && registerA(body.get(call + 2)) == registerA(body.get(call + 1)),
                featureSig(skip) + " doesn't test the autoplay-off check's answer straight away");
        List<Method> siblings = new ArrayList<>(), others = new ArrayList<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m == skip || m == check) continue;
            if (holds(m, AUTOPLAY_OFF_OLYMPUS)) siblings.add(m);
            if (!callSites(instructions(m), checkSig).isEmpty()) others.add(m);
        }
        requireFeature(!others.isEmpty(), "no method but the skip test calls the autoplay-off check");
        return new PrefetchSites(check, dispatcher, skip, call, call + 2, registerA(body.get(call + 1)), siblings, others);
    }

    /**
     * Disable video autoplay also holds the video prefetcher: the skip test, the one place the
     * dispatcher's prefetch asks Instagram's autoplay-off check, hands the check's answer to the
     * extension right before its if-nez, in the register that if-nez reads and the answer comes
     * back in, with every branch to the if-nez landing on the call. The if-nez, its target, the
     * check, its Olympus sibling, Instagram's legacy checker and the dispatcher stay as Threads
     * wrote them, and nothing but the skip test calls skipPrefetch, once.
     */
    private static void featureVideoPrefetch(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        PrefetchSites sites = featurePrefetchSites(clean);
        String skipSig = featureSig(sites.skip());
        Map<String, Integer> found = new TreeMap<>();
        for (List<Method> definitions : patched.values()) for (Method m : definitions) {
            if (m.getDefiningClass().startsWith(OWN)) continue;
            int count = callSites(instructions(m), SKIP_PREFETCH).size();
            if (count > 0) found.merge(featureSig(m), count, Integer::sum);
        }
        for (String caller : found.keySet()) requireFeature(caller.equals(skipSig), "skipPrefetch is called from " + caller + ", not only from the prefetch skip test " + skipSig);
        int calls = found.getOrDefault(skipSig, 0);
        requireFeature(calls > 0, "the prefetch skip test " + skipSig + " never calls skipPrefetch");
        requireFeature(calls == 1, "the prefetch skip test " + skipSig + " calls skipPrefetch " + calls + " times");
        Method actual = featureMethod(patched, skipSig);
        List<Instruction> now = instructions(actual);
        int at = callSites(now, SKIP_PREFETCH).get(0), register = sites.register();
        List<Integer> asks = callSites(now, featureSig(sites.check()));
        requireFeature(asks.size() == 1 && at == asks.get(0) + 2 && now.get(asks.get(0) + 1).getOpcode() == Opcode.MOVE_RESULT,
                "skipPrefetch isn't right after the autoplay-off check's move-result in " + skipSig);
        requireFeature(isStaticInvoke(now.get(at).getOpcode()) && Arrays.equals(invokeRegisters(now.get(at)), new int[]{register}),
                "skipPrefetch is passed " + Arrays.toString(invokeRegisters(now.get(at))) + ", not the check's answer in v" + register);
        requireFeature(now.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && registerA(now.get(at + 1)) == register,
                "skipPrefetch's answer doesn't go back into v" + register);
        featureBody(sites.skip(), actual, 0, Map.of(sites.test(), register), SKIP_PREFETCH);
        featurePrefetchKept(clean, patched, sites);
    }

    /** The check, its Olympus siblings, Instagram's other callers of the check and the dispatcher, as Threads wrote them. */
    private static void featurePrefetchKept(Map<String, List<Method>> clean, Map<String, List<Method>> patched, PrefetchSites sites) {
        List<Method> kept = new ArrayList<>(List.of(sites.check(), sites.dispatcher()));
        kept.addAll(sites.siblings());
        kept.addAll(sites.others());
        for (Method m : kept) featureBody(m, featureMethod(patched, featureSig(m)), 0, Map.of(), SKIP_PREFETCH);
    }

    /** A defaulted call's hook: [mask] in its mask's register, [value] in the flag's, then the question on the flag. */
    private static FeatureBlock featureDefaultedFlag(int maskRegister, long mask, int play, long value) {
        return (body, at) -> {
            requireFeature(at + 1 < body.size() && featureConstant(body.get(at)) && registerA(body.get(at)) == maskRegister
                    && ((WideLiteralInstruction) body.get(at)).getWideLiteral() == mask,
                    "missing or miswired default mask " + mask + " in v" + maskRegister + " at instruction " + at);
            requireFeature(featureConstant(body.get(at + 1)) && registerA(body.get(at + 1)) == play
                    && ((WideLiteralInstruction) body.get(at + 1)).getWideLiteral() == value,
                    "missing or miswired default flag " + value + " in v" + play + " at instruction " + (at + 1));
            featureCall(body, at + 2, HOLD_VIDEO, play, play);
            return 4;
        };
    }

    /** Whether [i] loads an int constant. */
    private static boolean featureConstant(Instruction i) {
        Opcode opcode = i.getOpcode();
        return opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16 || opcode == Opcode.CONST || opcode == Opcode.CONST_HIGH16;
    }

    /**
     * PostVideo and its playback effect, each the one method holding its note, every call to
     * PostVideo from a method holding a feed post's, an Instagram post's, a trend preview's or an
     * ad card's note, by the register its play flag goes in, and the viewer's methods that call
     * PostVideo. Each of the five notes and the viewer's has to hold at least one.
     */
    private static VideoSites featureVideoSites(Map<String, List<Method>> clean) {
        Method effect = featureTarget(clean, m -> holdsNote(m, PLAYBACK_EFFECT_NOTE), "video playback effect");
        Method postVideo = featureTarget(clean, m -> holdsNote(m, POST_VIDEO_NOTE), "PostVideo");
        requireFeature(AccessFlags.STATIC.isSet(postVideo.getAccessFlags()) && AccessFlags.STATIC.isSet(effect.getAccessFlags()),
                "PostVideo or its playback effect isn't static");
        PlayFlag flag = featurePlayFlag(postVideo, effect);
        Map<String, VideoTarget> targets = featureVideoTargets(clean, postVideo, flag);
        Map<Method, Map<Integer, VideoCall>> calls = new LinkedHashMap<>();
        List<String> notes = new ArrayList<>(FEED_POST_NOTES);
        notes.addAll(EMBED_NOTES);
        for (String note : notes) {
            int found = 0;
            for (List<Method> definitions : clean.values()) for (Method m : definitions) {
                if (!holdsNote(m, note)) continue;
                List<Instruction> body = instructions(m);
                for (int k = 0; k < body.size(); k++) {
                    if (!isStaticInvoke(body.get(k).getOpcode())) continue;
                    VideoTarget target = targets.get(reference(body.get(k)));
                    if (target == null) continue;
                    int[] arguments = invokeRegisters(body.get(k));
                    int play = arguments[featureVideoOffset(target.method(), target.play())];
                    int mask = target.fallback() == null ? -1 : arguments[featureVideoOffset(target.method(), target.fallback().mask())];
                    calls.computeIfAbsent(m, unused -> new TreeMap<>()).put(k, new VideoCall(play, mask, target.fallback()));
                    found++;
                }
            }
            requireFeature(found > 0, "no call to PostVideo holds \"" + note + "\"");
        }
        List<Method> viewers = new ArrayList<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (holdsNote(m, MEDIA_VIEWER_NOTE) && instructions(m).stream().anyMatch(i -> isStaticInvoke(i.getOpcode()) && targets.containsKey(reference(i)))) viewers.add(m);
        }
        requireFeature(!viewers.isEmpty(), "no call to PostVideo holds \"" + MEDIA_VIEWER_NOTE + "\"");
        List<Method> forwarders = targets.values().stream().map(VideoTarget::method).filter(m -> m != postVideo).toList();
        return new VideoSites(postVideo, effect, flag, forwarders, calls, viewers);
    }

    /** 451's embeds call a shortened overload that only fills omitted arguments and forwards. */
    private static Map<String, VideoTarget> featureVideoTargets(Map<String, List<Method>> clean, Method postVideo, PlayFlag flag) {
        String post = featureSig(postVideo);
        PlayDefault fallback = featurePlayDefault(postVideo, flag);
        Map<String, VideoTarget> targets = new LinkedHashMap<>();
        targets.put(post, new VideoTarget(postVideo, flag.parameter(), fallback));
        Set<Opcode> copies = Set.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
                Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (!m.getDefiningClass().equals(postVideo.getDefiningClass()) || featureSig(m).equals(post)) continue;
            List<Instruction> body = instructions(m);
            List<Integer> into = callSites(body, post);
            if (into.isEmpty()) continue;
            requireFeature(into.size() == 1 && AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals(postVideo.getReturnType()),
                    featureSig(m) + " isn't a straight PostVideo forwarder");
            int call = into.get(0);
            requireFeature(call == body.size() - 2 && body.get(body.size() - 1).getOpcode() == Opcode.RETURN_VOID &&
                    body.subList(0, call).stream().allMatch(i -> copies.contains(i.getOpcode()) || featureConstant(i)),
                    featureSig(m) + " isn't a straight PostVideo forwarder");
            int play = featureVideoForwarded(m, call, postVideo, flag.parameter(), "Z");
            PlayDefault passed = fallback == null ? null : new PlayDefault(featureVideoForwarded(m, call, postVideo, fallback.mask(), "I"), fallback.bit(), fallback.value());
            requireFeature(targets.put(featureSig(m), new VideoTarget(m, play, passed)) == null, "duplicate PostVideo forwarder " + featureSig(m));
        }
        return targets;
    }

    /** The unmodified incoming parameter a forwarder hands PostVideo for this argument. */
    private static int featureVideoForwarded(Method forwarder, int call, Method postVideo, int parameter, String type) {
        int register = invokeRegisters(instructions(forwarder).get(call))[featureVideoOffset(postVideo, parameter)];
        int[] origin = new FeatureFlow(forwarder).origin(call, register);
        int first = forwarder.getImplementation().getRegisterCount();
        for (CharSequence p : forwarder.getParameterTypes()) first -= slots(p);
        for (int p = 0, at = first; p < forwarder.getParameterTypes().size(); at += slots(forwarder.getParameterTypes().get(p++))) {
            if (origin != null && origin[0] < 0 && origin[1] == at && forwarder.getParameterTypes().get(p).toString().equals(type)) return p;
        }
        throw new IllegalArgumentException(featureSig(forwarder) + " doesn't forward PostVideo's " + type + " parameter unchanged");
    }

    private static int featureVideoOffset(Method method, int parameter) {
        int offset = 0;
        for (int p = 0; p < parameter; p++) offset += slots(method.getParameterTypes().get(p));
        return offset;
    }

    /**
     * PostVideo's default for its play flag: the 0 or 1 it writes into the register it tests, right
     * behind an if-eqz that jumps over it unless one bit of an int parameter, the caller's default
     * mask, is set. Null when PostVideo has no default for the flag, so every caller hands its own.
     */
    private static PlayDefault featurePlayDefault(Method postVideo, PlayFlag flag) {
        List<Instruction> body = instructions(postVideo);
        FeatureFlow flow = new FeatureFlow(postVideo);
        List<Integer> literals = flow.reaching(flag.test(), registerA(body.get(flag.test()))).stream()
                .filter(k -> k >= 0 && body.get(k) instanceof NarrowLiteralInstruction).toList();
        if (literals.isEmpty()) return null;
        int write = featureOne(literals, "PostVideo's default for its play flag");
        requireFeature(write > 0 && body.get(write - 1).getOpcode() == Opcode.IF_EQZ && lands(body, write - 1) == write + 1,
                "PostVideo's default for its play flag isn't behind a test of its default mask");
        int[] tests = flow.origin(write - 1, registerA(body.get(write - 1)));
        Instruction and = tests == null || tests[0] < 0 ? null : body.get(tests[0]);
        requireFeature(and != null && (and.getOpcode() == Opcode.AND_INT_LIT16 || and.getOpcode() == Opcode.AND_INT_LIT8)
                && Long.bitCount(((WideLiteralInstruction) and).getWideLiteral()) == 1,
                "PostVideo's default for its play flag isn't behind one bit of its default mask");
        int[] mask = flow.origin(tests[0], ((TwoRegisterInstruction) and).getRegisterB());
        int parameter = -1;
        if (mask != null && mask[0] < 0) {
            int at = postVideo.getImplementation().getRegisterCount() - postVideo.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
            for (int p = 0; p < postVideo.getParameterTypes().size(); p++) {
                if (at == mask[1] && postVideo.getParameterTypes().get(p).toString().equals("I")) parameter = p;
                at += slots(postVideo.getParameterTypes().get(p));
            }
        }
        requireFeature(parameter >= 0, "PostVideo's default mask isn't one of its int parameters");
        return new PlayDefault(parameter, ((WideLiteralInstruction) and).getWideLiteral(), ((WideLiteralInstruction) body.get(write)).getWideLiteral());
    }

    /**
     * Which of PostVideo's parameters says whether its video plays: the boolean it tests last before
     * its one call to the playback effect, on a branch whose false side writes a 0 as the effect's
     * play argument, the effect's first boolean. The tested register has to hold that one boolean on
     * every path. It's the fourth boolean on 450.
     */
    private static PlayFlag featurePlayFlag(Method postVideo, Method effect) {
        List<Instruction> body = instructions(postVideo);
        String effectSig = featureSig(effect);
        int call = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> isStaticInvoke(body.get(k).getOpcode()) && reference(body.get(k)).equals(effectSig)).toList(),
                "PostVideo's call to the playback effect");
        List<String> types = effect.getParameterTypes().stream().map(CharSequence::toString).toList();
        int first = types.indexOf("Z"), offset = 0;
        requireFeature(first >= 0, "the video playback effect takes no boolean");
        for (int p = 0; p < first; p++) offset += slots(types.get(p));
        int argument = invokeRegisters(body.get(call))[offset];
        FeatureFlow flow = new FeatureFlow(postVideo);
        for (int k = call - 1; k >= 0; k--) {
            Opcode opcode = body.get(k).getOpcode();
            if (opcode != Opcode.IF_EQZ && opcode != Opcode.IF_NEZ) continue;
            int side = opcode == Opcode.IF_NEZ ? k + 1 : lands(body, k);
            if (side <= k || side >= call || !(body.get(side) instanceof WideLiteralInstruction) || !body.get(side).getOpcode().setsRegister()
                    || registerA(body.get(side)) != argument || ((WideLiteralInstruction) body.get(side)).getWideLiteral() != 0) continue;
            List<Integer> held = featureBooleans(postVideo, flow, k, registerA(body.get(k)));
            if (held.size() == 1) return new PlayFlag(held.get(0), k);
        }
        throw new IllegalArgumentException("PostVideo never tests one of its booleans before the playback effect");
    }

    /** The boolean parameters of static [method] that [register] holds at [use] on every path. */
    private static List<Integer> featureBooleans(Method method, FeatureFlow flow, int use, int register) {
        List<Integer> held = new ArrayList<>();
        int at = method.getImplementation().getRegisterCount() - method.getParameterTypes().stream().mapToInt(DexDiff::slots).sum();
        for (int p = 0; p < method.getParameterTypes().size(); p++) {
            if (method.getParameterTypes().get(p).toString().equals("Z") && flow.booleanOnEveryPath(use, register, at)) held.add(p);
            at += slots(method.getParameterTypes().get(p));
        }
        return held;
    }

    /** Whether [m] loads a string starting with [note], as Compose's source notes, which end in a line number, are matched. */
    private static boolean holdsNote(Method m, String note) {
        for (Instruction i : instructions(m)) if (i instanceof ReferenceInstruction && ((ReferenceInstruction) i).getReference() instanceof StringReference
                && ((StringReference) ((ReferenceInstruction) i).getReference()).getString().startsWith(note)) return true;
        return false;
    }

    /**
     * Where Pure black dark mode hooks: the #101010 loads of Threads' theme and of each helper it
     * builds its colors in, by method, and the dark color scheme's constructor call in its holder's
     * static initializer, with the registers of the scheme's #101010 backgrounds.
     */
    private record PureBlackSites(Map<Method, List<Integer>> builders, Method initializer, int call, List<Integer> backgrounds) {}

    /** One build of a color scheme: its constructor call, the field it's stored in, and each color it passes, as far as literals tell, with its register. */
    private record SchemeBuild(int call, String field, List<Long> colors, List<Integer> registers) {
        /** How light its opaque colors are on average: a dark scheme's are darker. */
        double lightness() {
            return colors.stream().filter(java.util.Objects::nonNull).map(c -> c >>> 32).filter(c -> c >>> 24 == 0xffL)
                    .mapToDouble(c -> 0.2126 * (c >> 16 & 0xff) + 0.7152 * (c >> 8 & 0xff) + 0.0722 * (c & 0xff)).average().orElse(Double.NaN);
        }
    }

    /**
     * Pure black dark mode: every place Threads' theme, or a helper it builds its colors in, loads
     * #101010 hands it to PureBlack.argb right after, on that register, and the dark color scheme's
     * #101010 backgrounds each go through PureBlack.color right before its constructor call. The
     * rest of those methods, the light scheme's build among them, stays as Threads wrote it, and
     * those are the only host calls.
     */
    private static void featurePureBlack(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        PureBlackSites sites = featurePureBlackSites(clean);
        Map<String, Integer> loads = new TreeMap<>();
        for (Map.Entry<Method, List<Integer>> e : sites.builders().entrySet()) {
            List<Instruction> body = instructions(e.getKey());
            Map<Integer, Integer> hooks = new TreeMap<>();
            for (int load : e.getValue()) hooks.put(load + 1, registerA(body.get(load)));
            featureBody(e.getKey(), featureMethod(patched, featureSig(e.getKey())), 0, hooks, PURE_ARGB);
            if (!hooks.isEmpty()) loads.put(featureSig(e.getKey()), hooks.size());
        }
        featureHostCalls(patched, PURE_ARGB, loads);
        // Each background asked once, in any order, with nothing between the questions and the call.
        FeatureBlock backgrounds = (body, at) -> {
            Set<Integer> left = new TreeSet<>(sites.backgrounds());
            for (int n = 0; n < sites.backgrounds().size(); n++) {
                int hook = at + 2 * n;
                int[] registers = hook < body.size() && isStaticInvoke(body.get(hook).getOpcode()) ? invokeRegisters(body.get(hook)) : new int[0];
                requireFeature(registers.length > 0 && left.remove(registers[0]), "the dark scheme's backgrounds " + left
                        + " don't each ask " + PURE_COLOR + " right before its constructor, at instruction " + hook);
                featureCall(body, hook, PURE_COLOR, registers[0], registers[0]);
            }
            return 2 * sites.backgrounds().size();
        };
        featureBody(sites.initializer(), featureMethod(patched, featureSig(sites.initializer())), 0, Map.of(), PURE_COLOR, null,
                Map.of(sites.call(), backgrounds));
        featureHostCalls(patched, PURE_COLOR, Map.of(featureSig(sites.initializer()), sites.backgrounds().size()));
    }

    /**
     * Threads' theme, the one method holding its note, and the static calls it makes answering a
     * type it builds itself, with each one's #101010 loads; 450 loads it in one of those helpers,
     * not in the theme. Then the dark scheme: the theme reads a dark and a light one from two static
     * fields of one class, whose static initializer builds each once, straight through. The darker
     * is the dark one, and its backgrounds are the colors it passes as #101010 where the light one
     * passes white. None of them may be read again once the dark scheme is built, or the light one
     * would get the black too.
     */
    private static PureBlackSites featurePureBlackSites(Map<String, List<Method>> clean) {
        Method theme = featureTarget(clean, m -> holdsNote(m, BDS_THEME_NOTE), "Threads' theme");
        List<Instruction> body = instructions(theme);
        Set<String> built = new HashSet<>();
        for (Instruction i : body) if (i.getOpcode() == Opcode.NEW_INSTANCE) built.add(reference(i));
        Map<Method, List<Integer>> builders = new LinkedHashMap<>();
        builders.put(theme, featureDarkLoads(theme));
        for (Instruction i : body) {
            if (!isStaticInvoke(i.getOpcode())) continue;
            MethodReference helper = (MethodReference) ((ReferenceInstruction) i).getReference();
            if (!built.contains(helper.getReturnType()) || !clean.containsKey(featureSig(helper))) continue;
            Method m = featureMethod(clean, featureSig(helper));
            if (!builders.containsKey(m)) builders.put(m, featureDarkLoads(m));
        }
        Set<String> schemes = new HashSet<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m.getName().equals("<init>") && m.getParameterTypes().size() >= SCHEME_COLORS
                    && m.getParameterTypes().stream().allMatch(p -> p.toString().equals("J"))) schemes.add(m.getDefiningClass());
        }
        Map<String, Set<String>> read = new LinkedHashMap<>();
        for (Instruction i : body) if (i.getOpcode() == Opcode.SGET_OBJECT) {
            FieldReference f = (FieldReference) ((ReferenceInstruction) i).getReference();
            if (schemes.contains(f.getType())) read.computeIfAbsent(f.getDefiningClass() + " " + f.getType(), k -> new TreeSet<>()).add(f.getName());
        }
        String pair = featureOne(read.entrySet().stream().filter(e -> e.getValue().size() == 2).map(Map.Entry::getKey).toList(),
                "the class holding Threads' dark and light color schemes");
        String holder = pair.substring(0, pair.indexOf(' ')), type = pair.substring(pair.indexOf(' ') + 1);
        Method initializer = featureMethod(clean, holder + "-><clinit>()V");
        List<Instruction> init = instructions(initializer);
        requireFeature(init.stream().noneMatch(i -> i instanceof OffsetInstruction && i.getOpcode() != Opcode.FILL_ARRAY_DATA),
                holder + " branches while it builds its color schemes");
        List<SchemeBuild> builds = featureSchemeBuilds(init, type).stream().filter(b -> read.get(pair).contains(b.field())).toList();
        requireFeature(builds.size() == 2, holder + " builds " + builds.size() + " of the color schemes Threads' theme reads, not a dark and a light one");
        boolean firstDark = Double.compare(builds.get(0).lightness(), builds.get(1).lightness()) <= 0;
        SchemeBuild dark = builds.get(firstDark ? 0 : 1), light = builds.get(firstDark ? 1 : 0);
        List<Integer> backgrounds = new ArrayList<>(), backgroundParameters = new ArrayList<>();
        for (int p = 0; p < dark.colors().size(); p++) {
            if (Long.valueOf(THREADS_DARK << 32).equals(dark.colors().get(p)) && Long.valueOf(THREADS_WHITE << 32).equals(light.colors().get(p))) {
                backgrounds.add(dark.registers().get(p));
                backgroundParameters.add(p);
            }
        }
        requireFeature(!backgrounds.isEmpty(), "Threads' dark color scheme has no #101010 where its light one has white");
        if (builders.values().stream().allMatch(List::isEmpty)) {
            Method constructor = featureSchemeOnlyTheme(clean, theme, builders.keySet(), type, backgroundParameters);
            // This constructor supplies the field-copy proof and must remain unchanged too.
            builders.put(constructor, List.of());
        }
        FeatureFlow flow = new FeatureFlow(initializer);
        for (int register : backgrounds) {
            List<Integer> later = new ArrayList<>(flow.readsAfter(dark.call(), register));
            later.addAll(flow.readsAfter(dark.call(), register + 1));
            requireFeature(later.isEmpty(), holder + " reads v" + register + " again after building its dark scheme, at " + later);
        }
        return new PureBlackSites(builders, initializer, dark.call(), backgrounds);
    }

    /**
     * 451 copies the Bds background into an inherited Instagram palette. Prove the constructor's
     * parameter-to-field mapping, then follow both halves of the copied color through the CFG.
     * This follows each wide half through the verifier's independent control-flow analysis.
     */
    private static Method featureSchemeOnlyTheme(Map<String, List<Method>> clean, Method theme, Set<Method> builders,
            String type, List<Integer> backgroundParameters) {
        List<Method> getters = builders.stream().filter(m -> m != theme).toList();
        requireFeature(getters.size() == 1 && holdsNote(getters.get(0), IG_PALETTE_NOTE),
                "Threads' theme no longer loads #101010 or reads its inherited Instagram palette");
        Method constructor = featureTarget(clean, m -> m.getDefiningClass().equals(type) && m.getName().equals("<init>")
                && m.getParameterTypes().size() >= SCHEME_COLORS && m.getParameterTypes().stream().allMatch(p -> p.toString().equals("J")),
                "the Bds color scheme constructor");
        FeatureFlow stored = new FeatureFlow(constructor);
        int self = constructor.getImplementation().getRegisterCount() - 1 - 2 * constructor.getParameterTypes().size();
        Map<String, Integer> fields = new LinkedHashMap<>();
        Set<String> written = new HashSet<>();
        for (int n = 0; n < stored.layout.instructions.size(); n++) {
            Instruction i = stored.layout.instructions.get(n);
            if (i.getOpcode() != Opcode.IPUT_WIDE) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) i).getReference();
            TwoRegisterInstruction store = (TwoRegisterInstruction) i;
            if (!field.getDefiningClass().equals(type) || !field.getType().equals("J") || store.getRegisterB() != self) continue;
            requireFeature(written.add(field.toString()), "the Bds constructor writes " + field + " more than once");
            int[] origin = featureWideOrigin(stored, n, store.getRegisterA());
            if (origin != null && origin[0] == -1 && origin[1] > self && (origin[1] - self - 1) % 2 == 0) {
                fields.put(field.toString(), (origin[1] - self - 1) / 2);
            }
        }
        Set<String> backgrounds = new HashSet<>();
        for (int parameter : backgroundParameters) backgrounds.add(featureOne(fields.entrySet().stream()
                .filter(e -> e.getValue() == parameter).map(Map.Entry::getKey).toList(), "the field storing dark background argument " + parameter));
        requireFeature(backgrounds.size() == backgroundParameters.size(), "dark backgrounds share a Bds field");
        FeatureFlow copied = new FeatureFlow(theme);
        Set<String> built = new HashSet<>();
        for (Instruction i : copied.layout.instructions) if (i.getOpcode() == Opcode.NEW_INSTANCE) built.add(reference(i));
        boolean complete = false;
        for (int n = 0; n < copied.layout.instructions.size(); n++) {
            Instruction i = copied.layout.instructions.get(n);
            if (i.getOpcode() != Opcode.INVOKE_DIRECT_RANGE) continue;
            MethodReference call = (MethodReference) ((ReferenceInstruction) i).getReference();
            // 453 hands the colors to a palette constructor that takes an object first, so a color's
            // register is its word offset rather than twice its index.
            if (!call.getName().equals("<init>") || !built.contains(call.getDefiningClass())
                    || call.getParameterTypes().stream().filter(p -> p.toString().equals("J")).count() < SCHEME_COLORS) continue;
            Set<String> forwarded = new HashSet<>();
            for (int p = 0; p < call.getParameterTypes().size(); p++) {
                if (!call.getParameterTypes().get(p).toString().equals("J")) continue;
                int[] origin = featureWideOrigin(copied, n, ((RegisterRangeInstruction) i).getStartRegister() + 1 + featureWord(call, p));
                if (origin == null || origin[0] < 0) continue;
                Instruction load = copied.layout.instructions.get(origin[0]);
                if (load.getOpcode() == Opcode.IGET_WIDE && backgrounds.contains(reference(load))) forwarded.add(reference(load));
            }
            if (forwarded.containsAll(backgrounds)) complete = true;
        }
        requireFeature(complete, "Threads' theme no longer copies every known dark background into the same inherited palette");
        return constructor;
    }

    /** The wide definition on every path, following wide copies and refusing a clobbered half. */
    private static int[] featureWideOrigin(FeatureFlow flow, int use, int register) {
        Set<List<Integer>> visited = new HashSet<>();
        while (visited.add(List.of(use, register))) {
            Set<Integer> low = flow.reaching(use, register), high = flow.reaching(use, register + 1);
            if (low.size() != 1 || !low.equals(high)) return null;
            int write = low.iterator().next();
            if (write == -1) return new int[]{-1, register};
            Instruction i = flow.layout.instructions.get(write);
            if (!i.getOpcode().setsWideRegister() || registerA(i) != register) return null;
            if (i.getOpcode() != Opcode.MOVE_WIDE && i.getOpcode() != Opcode.MOVE_WIDE_FROM16 && i.getOpcode() != Opcode.MOVE_WIDE_16) {
                return new int[]{write, register};
            }
            use = write;
            register = ((TwoRegisterInstruction) i).getRegisterB();
        }
        return null;
    }

    /** Every place [m] loads #101010 as a wide literal. */
    private static List<Integer> featureDarkLoads(Method m) {
        List<Instruction> body = instructions(m);
        List<Integer> loads = new ArrayList<>();
        for (int k = 0; k < body.size(); k++) {
            Opcode opcode = body.get(k).getOpcode();
            if ((opcode == Opcode.CONST_WIDE || opcode == Opcode.CONST_WIDE_32 || opcode == Opcode.CONST_WIDE_16 || opcode == Opcode.CONST_WIDE_HIGH16)
                    && ((WideLiteralInstruction) body.get(k)).getWideLiteral() == THREADS_DARK) loads.add(k);
        }
        return loads;
    }

    /**
     * Each construction of a [type] in straight-line [body], with the colors it passes as far as
     * literals, shifts and copies tell them, as Pure black dark mode's patch reads them. A color the
     * code computes some other way is null.
     */
    private static List<SchemeBuild> featureSchemeBuilds(List<Instruction> body, String type) {
        Map<Integer, Long> wide = new HashMap<>();
        Map<Integer, Integer> narrow = new HashMap<>();
        List<SchemeBuild> builds = new ArrayList<>();
        for (int k = 0; k < body.size(); k++) {
            Instruction i = body.get(k);
            switch (i.getOpcode()) {
                case CONST_WIDE: case CONST_WIDE_32: case CONST_WIDE_16: case CONST_WIDE_HIGH16:
                    featureClobber(wide, narrow, registerA(i), true);
                    wide.put(registerA(i), ((WideLiteralInstruction) i).getWideLiteral());
                    break;
                case CONST_4: case CONST_16: case CONST: case CONST_HIGH16:
                    featureClobber(wide, narrow, registerA(i), false);
                    narrow.put(registerA(i), (int) ((WideLiteralInstruction) i).getWideLiteral());
                    break;
                case MOVE_WIDE: case MOVE_WIDE_FROM16: case MOVE_WIDE_16: {
                    Long value = wide.get(((TwoRegisterInstruction) i).getRegisterB());
                    featureClobber(wide, narrow, registerA(i), true);
                    if (value != null) wide.put(registerA(i), value);
                    break;
                }
                case SHL_LONG: case SHL_LONG_2ADDR: {
                    boolean three = i instanceof ThreeRegisterInstruction;
                    int target = registerA(i), source = three ? ((ThreeRegisterInstruction) i).getRegisterB() : target;
                    int amount = three ? ((ThreeRegisterInstruction) i).getRegisterC() : ((TwoRegisterInstruction) i).getRegisterB();
                    Long value = wide.get(source);
                    Integer shift = narrow.get(amount);
                    featureClobber(wide, narrow, target, true);
                    if (value != null && shift != null) wide.put(target, value << (shift & 63));
                    break;
                }
                case INVOKE_DIRECT_RANGE: {
                    MethodReference m = (MethodReference) ((ReferenceInstruction) i).getReference();
                    if (!m.getDefiningClass().equals(type) || !m.getName().equals("<init>")) break;
                    int start = ((RegisterRangeInstruction) i).getStartRegister();
                    List<Long> colors = new ArrayList<>();
                    List<Integer> registers = new ArrayList<>();
                    for (int p = 0; p < m.getParameterTypes().size(); p++) {
                        registers.add(start + 1 + 2 * p);
                        colors.add(wide.get(start + 1 + 2 * p));
                    }
                    String field = "";
                    for (int n = k + 1; n < body.size(); n++) if (body.get(n).getOpcode() == Opcode.SPUT_OBJECT && registerA(body.get(n)) == start) {
                        field = ((FieldReference) ((ReferenceInstruction) body.get(n)).getReference()).getName();
                        break;
                    }
                    builds.add(new SchemeBuild(k, field, colors, registers));
                    break;
                }
                default:
                    if (i.getOpcode().setsRegister()) featureClobber(wide, narrow, registerA(i), i.getOpcode().setsWideRegister());
            }
        }
        return builds;
    }

    /** Forget what [register], and the one above when [pair], held, and any wide value that covered either. */
    private static void featureClobber(Map<Integer, Long> wide, Map<Integer, Integer> narrow, int register, boolean pair) {
        for (int r = register; r <= (pair ? register + 1 : register); r++) {
            narrow.remove(r);
            wide.remove(r);
            wide.remove(r - 1);
        }
    }

    /**
     * Where the HushThreads settings row hooks: Threads' settings list and the goto that ends its
     * More settings case, the composer's register there, Threads' settings row and its Accounts
     * Center row, and the modifier field the run the case goes to passes the settings row.
     */
    private record SettingsRowSites(Method list, int hook, int composer, Method row, Method accounts, String modifier) {}

    /**
     * The HushThreads row in Threads' settings. The settings list asks ThreadsSettingsRow.add once,
     * right before the goto that ends its More settings case, on the composer that case starts its
     * group on, with the list otherwise stock and every branch to that goto landing on the call.
     * showRow calls Threads' Accounts Center row with that composer, the modifier the case's run
     * passes Threads' own row, the title, subtitle, click and icon, and three zeros, and nothing else.
     * The click is a kotlin Function0, which Threads' row takes. Both of Threads' rows stay stock,
     * and the list is the only host method that calls add. Copy text on long press, which the
     * settings patch depends on, comes with the row and is held to its own contract.
     */
    private static void featureSettingsRow(Map<String, List<Method>> clean, Map<String, List<Method>> patched, File patchedApk) throws Exception {
        SettingsRowSites sites = featureSettingsRowSites(clean);
        FeatureBlock hook = (body, at) -> {
            requireFeature(at < body.size() && isStaticInvoke(body.get(at).getOpcode()) && reference(body.get(at)).equals(ADD_ROW)
                    && Arrays.equals(invokeRegisters(body.get(at)), new int[]{sites.composer()}),
                    "missing or miswired " + ADD_ROW + " at instruction " + at + ", which has to pass the More settings case's composer, v" + sites.composer());
            return 1;
        };
        featureBody(sites.list(), featureMethod(patched, featureSig(sites.list())), 0, Map.of(), ADD_ROW, null, Map.of(sites.hook(), hook));
        featureHostCalls(patched, ADD_ROW, Map.of(featureSig(sites.list()), 1));
        for (Method row : List.of(sites.row(), sites.accounts())) featureBody(row, featureMethod(patched, featureSig(row)), 0, Map.of(), "");
        featureShowRow(featureMethod(patched, SHOW_ROW), sites);
        List<ClassDef> clicks = new ArrayList<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(patchedApk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cd : dex.getEntry(entry).getDexFile().getClasses()) {
            if (cd.getType().equals(ROW_CLICK)) clicks.add(cd);
        }
        ClassDef click = featureOne(clicks, ROW_CLICK);
        requireFeature(click.getInterfaces().equals(List.of(FUNCTION0)),
                ROW_CLICK + " implements " + click.getInterfaces() + ", not " + FUNCTION0 + ", so Threads' row can't take it");
        Method invoke = featureMethod(patched, ROW_CLICK + "->invoke()Ljava/lang/Object;");
        requireFeature(AccessFlags.PUBLIC.isSet(invoke.getAccessFlags()) && !AccessFlags.STATIC.isSet(invoke.getAccessFlags()),
                ROW_CLICK + "'s invoke() isn't a public instance method");
        featureCopyText(clean, patched);
    }

    /**
     * A post row lambda's long press override as Threads shipped it: [stock] reads it at [read] into
     * [register] and checks it for null at [guard], and [action] is the override's own long press.
     */
    private record CopyTextSite(Method stock, int read, int guard, int register, FieldReference action) {}

    /** PostText [stock], and its boolean [parameter], held in [flag], that its selection check reads as it came in. */
    private record CopyTextSelection(Method stock, int parameter, int flag) {}

    /**
     * Copy text on long press. Every override check the clean post row lambdas make gets the patch's
     * five instructions in front of it, and nothing else in those lambdas changes: a null override
     * goes straight to Threads' own check, and any other is read for its own action, handed to
     * longPress as (override, action) in a local nothing reads from the check on, and taken back
     * into the override's register cast to its type. Each lambda calls longPress once per check and
     * no other host method calls it. PostText asks selection() about the boolean parameter its
     * selection check reads, first thing and into that same register, and is the one host method
     * that asks. Every refusal names Copy text.
     */
    private static void featureCopyText(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        try {
            Map<String, List<CopyTextSite>> lambdas = new TreeMap<>();
            for (CopyTextSite site : featureCopyTextSites(clean)) lambdas.computeIfAbsent(featureSig(site.stock()), k -> new ArrayList<>()).add(site);
            Map<String, Integer> calls = new TreeMap<>();
            for (Map.Entry<String, List<CopyTextSite>> lambda : lambdas.entrySet()) calls.put(lambda.getKey(), lambda.getValue().size());
            featureHostCalls(patched, COPY_LONG_PRESS, calls);
            for (Map.Entry<String, List<CopyTextSite>> lambda : lambdas.entrySet()) {
                Method stock = lambda.getValue().get(0).stock();
                Method changed = featureMethod(patched, lambda.getKey());
                Layout now = new Layout(changed.getImplementation());
                FeatureFlow old = new FeatureFlow(stock);
                int locals = stock.getImplementation().getRegisterCount() - stock.getParameterTypes().stream().mapToInt(DexDiff::slots).sum()
                        - (AccessFlags.STATIC.isSet(stock.getAccessFlags()) ? 0 : 1);
                Map<Integer, FeatureBlock> blocks = new HashMap<>();
                for (CopyTextSite site : lambda.getValue()) blocks.put(site.guard(), (body, at) -> featureCopyTextHook(body, now, at, site, old, locals));
                featureBody(stock, changed, 0, Map.of(), COPY_LONG_PRESS, null, blocks);
            }
            CopyTextSelection selection = featureCopyTextSelection(clean);
            featureHostCalls(patched, COPY_SELECTION, Map.of(featureSig(selection.stock()), 1));
            Method changed = featureMethod(patched, featureSig(selection.stock()));
            featureCall(instructions(changed), 0, COPY_SELECTION, selection.flag(), selection.flag());
            featureBody(selection.stock(), changed, 2, Map.of(), COPY_SELECTION);
            System.out.println("[diff] threads-feature settingsRow: Copy text hooks " + calls + " and parameter " + selection.parameter()
                    + " of " + featureSig(selection.stock()));
        } catch (IllegalArgumentException | ClassCastException | IndexOutOfBoundsException ex) {
            throw new IllegalArgumentException("Copy text: " + ex.getMessage(), ex);
        }
    }

    /** The hook the patch puts in front of [site]'s override check, at [at] of the patched lambda [body], laid out as [now]. Answers its length. */
    private static int featureCopyTextHook(List<Instruction> body, Layout now, int at, CopyTextSite site, FeatureFlow old, int locals) {
        int guard = site.guard(), held = site.register();
        String where = " in front of the override check at " + guard + " in " + featureSig(site.stock());
        requireFeature(at + 5 <= body.size() && body.get(at).getOpcode() == Opcode.IF_EQZ && registerA(body.get(at)) == held,
                "no hook" + where + " that tests the override in v" + held + " for null first");
        int skip = now.addresses.indexOf(now.addresses.get(at) + ((OffsetInstruction) body.get(at)).getCodeOffset());
        requireFeature(skip == at + 5, "the hook" + where + " sends a null override to instruction " + skip + ", not straight to Threads' own check");
        Instruction get = body.get(at + 1), call = body.get(at + 2), result = body.get(at + 3), cast = body.get(at + 4);
        requireFeature(get.getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) get).getRegisterB() == held
                && reference(get).equals(site.action().toString()), "the hook" + where + " doesn't read the override's own action, " + site.action());
        int free = registerA(get);
        requireFeature(free != held && free < locals && free <= 15 && old.readsFrom(guard, free).isEmpty(),
                "the hook" + where + " clobbers v" + free + ", which isn't a local nothing reads from the check on");
        requireFeature(isStaticInvoke(call.getOpcode()) && reference(call).equals(COPY_LONG_PRESS) && Arrays.equals(invokeRegisters(call), new int[]{held, free}),
                "the hook" + where + " doesn't pass " + COPY_LONG_PRESS + " the override and then its action, v" + held + " and v" + free);
        requireFeature(result.getOpcode() == Opcode.MOVE_RESULT_OBJECT && registerA(result) == held,
                "the hook" + where + " doesn't take longPress's answer back into the override's register, v" + held);
        requireFeature(cast.getOpcode() == Opcode.CHECK_CAST && registerA(cast) == held && reference(cast).equals(site.action().getDefiningClass()),
                "the hook" + where + " doesn't cast longPress's answer back to the override's type, " + site.action().getDefiningClass());
        return 5;
    }

    /**
     * Every long press override check in the clean post row lambdas, found the way the patch finds
     * them: an if-nez or if-eqz on a register, and on its not-null side, within four instructions, a
     * read of that register's Function0 field, of a type the lambda keeps a field of, tested at most
     * one other test later. 451 reads the override just before the check and its action where the
     * check jumps. 452 reads the override earlier, falls into the action and tests a boolean of the
     * override's first. There has to be at least one, they all read the same action, each check is
     * reached only by falling into it, what it tests can only be the lambda's own override, of the
     * action's type, and the override sits where a call can name it.
     */
    private static List<CopyTextSite> featureCopyTextSites(Map<String, List<Method>> clean) {
        List<CopyTextSite> sites = new ArrayList<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null || !holdsNote(m, POST_ROW_NOTE)) continue;
            FeatureFlow flow = new FeatureFlow(m);
            List<Instruction> body = flow.layout.instructions;
            for (int guard = 0; guard < body.size(); guard++) {
                FieldReference action = featureCopyTextAction(flow, guard);
                if (action == null) continue;
                List<Integer> into = new ArrayList<>();
                for (int n = 0; n < body.size(); n++) if (flow.normal.get(n).contains(guard) || flow.exceptional.get(n).contains(guard)) into.add(n);
                requireFeature(into.equals(List.of(guard - 1)), featureSig(m) + " reaches its override check at " + guard + " from " + into
                        + ", not only by falling in from " + (guard - 1));
                int register = registerA(body.get(guard));
                int[] source = featureSource(flow, guard, register);
                int read = source == null ? -1 : source[0];
                requireFeature(read >= 0 && body.get(read).getOpcode() == Opcode.IGET_OBJECT
                        && ((FieldReference) ((ReferenceInstruction) body.get(read)).getReference()).getDefiningClass().equals(m.getDefiningClass()),
                        "the override check at " + guard + " in " + featureSig(m) + " doesn't read only the lambda's own override");
                requireFeature(register <= 15, featureSig(m) + " holds its override in v" + register + ", which the hook's call can't name");
                FieldReference override = (FieldReference) ((ReferenceInstruction) body.get(read)).getReference();
                requireFeature(action.getDefiningClass().equals(override.getType()), "the override check at " + guard + " in " + featureSig(m)
                        + " reads " + action + " from another type than the override it read at " + read);
                sites.add(new CopyTextSite(m, read, guard, register, action));
            }
        }
        requireFeature(!sites.isEmpty(), "no post row lambda reads and checks a long press override");
        Set<String> actions = new TreeSet<>();
        for (CopyTextSite site : sites) actions.add(site.action().toString());
        requireFeature(actions.size() == 1, "the post row's override checks read different actions, " + actions);
        return sites;
    }

    /**
     * The override's own long press when [guard] in [flow]'s lambda is the row's null check of an
     * override of its own: an if-nez or if-eqz on a register, and on its not-null side, within four
     * instructions, a read of that register's Function0 field, of a type the lambda keeps a field
     * of, tested at most one other test later. Null for anything else.
     */
    private static FieldReference featureCopyTextAction(FeatureFlow flow, int guard) {
        List<Instruction> body = flow.layout.instructions;
        Instruction check = body.get(guard);
        if (check.getOpcode() != Opcode.IF_NEZ && check.getOpcode() != Opcode.IF_EQZ) return null;
        int register = registerA(check), held;
        if (check.getOpcode() == Opcode.IF_NEZ) {
            List<Integer> jumps = flow.normal.get(guard).stream().filter(n -> n != guard + 1).toList();
            if (jumps.size() != 1) return null;
            held = jumps.get(0);
        } else {
            held = guard + 1;
        }
        for (int at = held; at < Math.min(held + 4, body.size()); at++) {
            Instruction i = body.get(at);
            if (i.getOpcode() != Opcode.IGET_OBJECT) continue;
            FieldReference action = (FieldReference) ((ReferenceInstruction) i).getReference();
            int got = ((TwoRegisterInstruction) i).getRegisterA();
            if (((TwoRegisterInstruction) i).getRegisterB() != register || !action.getType().equals(FUNCTION0)) continue;
            if (!featureOwnsFieldOf(flow.method, action.getDefiningClass())) return null;
            int tested = -1;
            for (int n = at + 1; n < Math.min(at + 3, body.size()) && tested < 0; n++) {
                if (body.get(n) instanceof OneRegisterInstruction one && one.getRegisterA() == got) tested = n;
            }
            if (tested < 0) return null;
            for (int n = at + 1; n < tested; n++) {
                if (body.get(n).getOpcode() != Opcode.IF_NEZ && body.get(n).getOpcode() != Opcode.IF_EQZ) return null;
            }
            Opcode test = body.get(tested).getOpcode();
            return test == Opcode.IF_NEZ || test == Opcode.IF_EQZ ? action : null;
        }
        return null;
    }

    /** Whether [m] reads a field of its own class of [type] anywhere. */
    private static boolean featureOwnsFieldOf(Method m, String type) {
        for (Instruction i : instructions(m)) {
            if (i.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) i).getReference() instanceof FieldReference f
                    && f.getDefiningClass().equals(m.getDefiningClass()) && f.getType().equals(type)) return true;
        }
        return false;
    }

    /**
     * PostText, the one host method holding the selection note, and the parameter its selection
     * check reads: the first if-eqz after the note has to test one boolean parameter as it came in,
     * directly or through narrow copies, on every path but those where Compose writes the 0 or 1 a
     * caller that leaves it out gets, so a hook first thing decides what it reads. 451 copies the
     * parameter into a local and fills that local with 0 in code at the end that jumps back.
     */
    private static CopyTextSelection featureCopyTextSelection(Map<String, List<Method>> clean) {
        Method stock = featureTarget(clean, m -> !m.getDefiningClass().startsWith(OWN) && m.getImplementation() != null && holdsNote(m, SELECTION_NOTE),
                "PostText, the method holding the selection note,");
        FeatureFlow flow = new FeatureFlow(stock);
        List<Instruction> body = flow.layout.instructions;
        int note = 0;
        while (!(body.get(note) instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s && s.getString().startsWith(SELECTION_NOTE))) note++;
        int check = note + 1;
        while (check < body.size() && body.get(check).getOpcode() != Opcode.IF_EQZ) check++;
        requireFeature(check < body.size(), featureSig(stock) + " checks nothing after its selection note");
        // The registers that arrive at the check as they came in, read directly or through narrow copies.
        int read = registerA(body.get(check));
        Set<Integer> sources = new TreeSet<>();
        for (int write : flow.reaching(check, read)) {
            Opcode op = write < 0 ? null : body.get(write).getOpcode();
            int[] origin = write < 0 ? new int[]{-1, read} : op == Opcode.MOVE || op == Opcode.MOVE_FROM16 || op == Opcode.MOVE_16
                    ? flow.origin(write, ((TwoRegisterInstruction) body.get(write)).getRegisterB()) : null;
            if (origin != null && origin[0] == -1) sources.add(origin[1]);
        }
        List<? extends CharSequence> params = stock.getParameterTypes();
        int parameter = -1, register = stock.getImplementation().getRegisterCount() - params.stream().mapToInt(DexDiff::slots).sum();
        for (int p = 0; p < params.size(); p++) {
            if (sources.size() == 1 && register == sources.iterator().next()) parameter = p;
            register += slots(params.get(p));
        }
        requireFeature(parameter >= 0 && params.get(parameter).toString().equals("Z") && flow.booleanOnEveryPath(check, read, sources.iterator().next()),
                "the selection check at " + check + " in " + featureSig(stock) + " doesn't read one boolean parameter as it came in on every path");
        return new CopyTextSelection(stock, parameter, sources.iterator().next());
    }

    /** Left out with the settings patch, Copy text makes no call and leaves the post row lambdas and PostText as Threads wrote them. */
    private static void featureOmittedCopyText(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        try {
            featureHostCalls(patched, COPY_LONG_PRESS, Map.of());
            featureHostCalls(patched, COPY_SELECTION, Map.of());
            featurePreserveTargets(clean, patched, m -> !m.getDefiningClass().startsWith(OWN)
                    && (holdsNote(m, POST_ROW_NOTE) || holdsNote(m, SELECTION_NOTE)));
        } catch (IllegalArgumentException | ClassCastException | IndexOutOfBoundsException ex) {
            throw new IllegalArgumentException("Copy text: " + ex.getMessage(), ex);
        }
    }

    /**
     * showRow as the settings patch writes it: straight-line copies, casts, the modifier's static
     * read and zeros into one call to Threads' Accounts Center row, then return-void. Each argument
     * is read back to what it holds: the composer cast to the row's composer type, the modifier, the
     * title, the subtitle, the click cast to Function0, the icon, and zero for the changed and
     * defaults words and the badge.
     */
    private static void featureShowRow(Method stub, SettingsRowSites sites) {
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && stub.getImplementation() != null
                && stub.getImplementation().getTryBlocks().isEmpty(), SHOW_ROW + " isn't a static method with an unprotected body");
        List<Instruction> body = instructions(stub);
        // The arguments sit at the top of the frame: the composer, the click, the title, the subtitle and the icon.
        int first = stub.getImplementation().getRegisterCount() - 5;
        Map<Integer, String> held = new HashMap<>();
        for (int p = 0; p < 5; p++) held.put(first + p, "p" + p);
        List<String> passed = null;
        for (int k = 0; k < body.size(); k++) {
            Instruction i = body.get(k);
            switch (i.getOpcode()) {
                case MOVE: case MOVE_FROM16: case MOVE_16: case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
                    held.put(registerA(i), held.get(((TwoRegisterInstruction) i).getRegisterB()));
                    break;
                case CHECK_CAST:
                    held.put(registerA(i), held.get(registerA(i)) + " as " + reference(i));
                    break;
                case SGET_OBJECT:
                    held.put(registerA(i), reference(i));
                    break;
                case CONST_4: case CONST_16:
                    held.put(registerA(i), String.valueOf(((WideLiteralInstruction) i).getWideLiteral()));
                    break;
                case INVOKE_STATIC: case INVOKE_STATIC_RANGE:
                    requireFeature(passed == null && reference(i).equals(featureSig(sites.accounts())),
                            SHOW_ROW + " calls " + reference(i) + ", not Threads' Accounts Center row once");
                    passed = new ArrayList<>();
                    for (int register : invokeRegisters(i)) passed.add(held.get(register));
                    break;
                case RETURN_VOID:
                    requireFeature(passed != null && k == body.size() - 1, SHOW_ROW + " returns before it calls Threads' Accounts Center row");
                    break;
                default:
                    throw new IllegalArgumentException(SHOW_ROW + " runs " + i.getOpcode().name + ", which the settings patch doesn't write");
            }
        }
        requireFeature(passed != null && body.get(body.size() - 1).getOpcode() == Opcode.RETURN_VOID,
                SHOW_ROW + " doesn't return right after its call");
        List<String> expected = List.of("p0 as " + sites.accounts().getParameterTypes().get(0), sites.modifier(), "p2", "p3",
                "p1 as " + FUNCTION0, "p4", "0", "0", "0");
        requireFeature(expected.equals(passed), SHOW_ROW + " passes Threads' Accounts Center row " + passed + ", not " + expected);
    }

    /**
     * Where the row goes, read the way the settings patch reads it and never by obfuscated name.
     * Threads' settings row and its Accounts Center row are the one method holding each one's note,
     * taking (composer, modifier, Integer, Function0, four ints, boolean) and (composer, modifier,
     * two Strings, Function0, three ints, boolean). The list is the one method holding the list note
     * that switches and calls the settings row. It switches on the ordinal of an entry enum whose
     * static initializer names MORE, and that case starts its group on the composer once and runs
     * straight to a goto, reached by no branch, onto a run that calls the settings row with that
     * composer copied in and a modifier read from a static field.
     */
    private static SettingsRowSites featureSettingsRowSites(Map<String, List<Method>> clean) {
        Method row = featureTarget(clean, m -> holdsNote(m, SETTINGS_ROW_NOTE), "Threads' settings row");
        Method accounts = featureTarget(clean, m -> holdsNote(m, ACCOUNTS_ROW_NOTE), "Threads' Accounts Center row");
        List<String> params = row.getParameterTypes().stream().map(CharSequence::toString).toList();
        requireFeature(AccessFlags.STATIC.isSet(row.getAccessFlags()) && row.getReturnType().equals("V") && params.size() == 9
                && params.get(2).equals("Ljava/lang/Integer;") && params.get(3).equals(FUNCTION0)
                && params.subList(4, 8).stream().allMatch("I"::equals) && params.get(8).equals("Z"),
                "Threads' settings row has changed shape: " + featureSig(row));
        requireFeature(AccessFlags.STATIC.isSet(accounts.getAccessFlags()) && accounts.getReturnType().equals("V")
                && accounts.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of(params.get(0), params.get(1),
                        "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0, "I", "I", "I", "Z")),
                "Threads' Accounts Center row has changed shape: " + featureSig(accounts));
        String rowSig = featureSig(row);
        Method list = featureTarget(clean, m -> holdsNote(m, SETTINGS_LIST_NOTE) && !callSites(instructions(m), rowSig).isEmpty()
                && instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.PACKED_SWITCH), "Threads' settings list");
        FeatureFlow flow = new FeatureFlow(list);
        List<Instruction> body = flow.layout.instructions;
        int switchAt = featureOne(java.util.stream.IntStream.range(0, body.size()).boxed()
                .filter(k -> body.get(k).getOpcode() == Opcode.PACKED_SWITCH).toList(), "Threads' settings list's packed switch");

        // The switch reads an enum's ordinal straight from ordinal(), called on a value cast to the entry enum.
        int ordinalAt = featureLastWrite(body, switchAt, registerA(body.get(switchAt)));
        requireFeature(ordinalAt >= 1 && body.get(ordinalAt).getOpcode() == Opcode.MOVE_RESULT
                && body.get(ordinalAt - 1) instanceof FiveRegisterInstruction && reference(body.get(ordinalAt - 1)).endsWith("->ordinal()I"),
                "Threads' settings list doesn't switch on an enum's ordinal");
        int castAt = featureLastWrite(body, ordinalAt - 1, invokeRegisters(body.get(ordinalAt - 1))[0]);
        requireFeature(castAt >= 0 && body.get(castAt).getOpcode() == Opcode.CHECK_CAST, "Threads' settings list switches on an ordinal of no known type");
        String entries = reference(body.get(castAt));
        int ordinal = featureEnumOrdinal(clean, entries, MORE_ENTRY);

        int switchAddress = flow.layout.addresses.get(switchAt);
        Instruction payload = flow.layout.byAddress.get(switchAddress + ((OffsetInstruction) body.get(switchAt)).getCodeOffset());
        requireFeature(payload instanceof SwitchPayload, "Threads' settings list's switch has no payload");
        SwitchElement more = featureOne(((SwitchPayload) payload).getSwitchElements().stream().filter(e -> e.getKey() == ordinal).map(e -> (SwitchElement) e).toList(),
                "Threads' settings list's case for " + MORE_ENTRY);
        int caseAt = flow.layout.addresses.indexOf(switchAddress + more.getOffset());
        requireFeature(caseAt >= 0, "Threads' settings list's " + MORE_ENTRY + " case lands between instructions");
        int gotoAt = caseAt;
        while (gotoAt < body.size() && !(body.get(gotoAt) instanceof OffsetInstruction) && body.get(gotoAt).getOpcode().canContinue()) gotoAt++;
        requireFeature(gotoAt < body.size() && body.get(gotoAt).getOpcode().name.startsWith("goto"),
                "Threads' " + MORE_ENTRY + " case doesn't end in a goto to the settings row");
        for (int n = 0; n < body.size(); n++) {
            if (n >= caseAt && n < gotoAt) continue;
            List<Integer> next = new ArrayList<>(flow.normal.get(n));
            next.addAll(flow.exceptional.get(n));
            for (int target : next) requireFeature(target <= caseAt || target > gotoAt,
                    "Threads' settings list branches into its " + MORE_ENTRY + " case, from instruction " + n);
        }
        int tailAt = flow.layout.addresses.indexOf(flow.layout.addresses.get(gotoAt) + ((OffsetInstruction) body.get(gotoAt)).getCodeOffset());
        requireFeature(tailAt >= 0, "Threads' " + MORE_ENTRY + " case's goto lands between instructions");
        int callAt = tailAt;
        while (callAt < body.size() && !(body.get(callAt) instanceof OffsetInstruction) && body.get(callAt).getOpcode().canContinue()
                && !reference(body.get(callAt)).equals(rowSig)) callAt++;
        requireFeature(callAt < body.size() && isStaticInvoke(body.get(callAt).getOpcode()) && reference(body.get(callAt)).equals(rowSig),
                "Threads' " + MORE_ENTRY + " case reaches something other than the settings row first");

        // The composer: the one call the case makes on the composer's type, starting its group, and
        // nothing writes it again before the goto, where the hook reads it.
        String composerType = params.get(0);
        int startAt = featureOne(java.util.stream.IntStream.range(caseAt, gotoAt).boxed()
                .filter(k -> body.get(k).getOpcode() == Opcode.INVOKE_INTERFACE && reference(body.get(k)).startsWith(composerType + "->")).toList(),
                "the " + MORE_ENTRY + " case's call on its composer");
        int composer = invokeRegisters(body.get(startAt))[0];
        requireFeature(featureLastWrite(body, gotoAt, composer) < startAt, "Threads' " + MORE_ENTRY + " case overwrites its composer, v" + composer);

        // The row's composer is copied from that register, and its modifier comes, through copies,
        // from a static field the shared run reads.
        List<Integer> path = new ArrayList<>();
        for (int k = caseAt; k < gotoAt; k++) path.add(k);
        for (int k = tailAt; k < callAt; k++) path.add(k);
        int[] arguments = invokeRegisters(body.get(callAt));
        int copy = featureLastWrite(body, path, path.size(), arguments[0]);
        requireFeature(copy >= 0 && body.get(path.get(copy)).getOpcode().name.startsWith("move-object")
                && ((TwoRegisterInstruction) body.get(path.get(copy))).getRegisterB() == composer,
                "Threads' settings row isn't passed the composer the " + MORE_ENTRY + " case starts its group on");
        int at = path.size(), register = arguments[1];
        Instruction modifier;
        while (true) {
            at = featureLastWrite(body, path, at, register);
            requireFeature(at >= 0, "Threads' " + MORE_ENTRY + " case doesn't set the settings row's modifier");
            modifier = body.get(path.get(at));
            if (!ROW_ARGUMENT_MOVES.contains(modifier.getOpcode())) break;
            register = ((TwoRegisterInstruction) modifier).getRegisterB();
        }
        requireFeature(modifier.getOpcode() == Opcode.SGET_OBJECT && at >= gotoAt - caseAt,
                "Threads' settings row isn't passed a modifier from a static field the shared run reads");
        return new SettingsRowSites(list, gotoAt, composer, row, accounts, reference(modifier));
    }

    /** The narrow and object copies the settings row's arguments are followed back through. */
    private static final Set<Opcode> ROW_ARGUMENT_MOVES = Set.of(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16,
            Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);

    /** The index of the last instruction before [before] in [body] that writes [register], or -1. */
    private static int featureLastWrite(List<Instruction> body, int before, int register) {
        for (int k = before - 1; k >= 0; k--) if (featureWrites(body.get(k), register)) return k;
        return -1;
    }

    /** The last position before [end] in [path], a run of [body]'s indices, whose instruction writes [register], or -1. */
    private static int featureLastWrite(List<Instruction> body, List<Integer> path, int end, int register) {
        for (int n = end - 1; n >= 0; n--) if (featureWrites(body.get(path.get(n)), register)) return n;
        return -1;
    }

    /** Whether [i] writes [register], as its destination or the upper half of a wide one. */
    private static boolean featureWrites(Instruction i, int register) {
        return i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction
                && (registerA(i) == register || i.getOpcode().setsWideRegister() && registerA(i) + 1 == register);
    }

    /** The ordinal [type]'s static initializer hands its constructor beside [name], as a string and an int literal. */
    private static int featureEnumOrdinal(Map<String, List<Method>> clean, String type, String name) {
        Map<Integer, String> strings = new HashMap<>();
        Map<Integer, Long> literals = new HashMap<>();
        List<Long> ordinals = new ArrayList<>();
        for (Instruction i : instructions(featureMethod(clean, type + "-><clinit>()V"))) {
            if (isPlainInvoke(i.getOpcode()) && reference(i).startsWith(type + "-><init>(Ljava/lang/String;I")) {
                List<Integer> registers = callRegisters(i);
                if (name.equals(strings.get(registers.get(1))) && literals.containsKey(registers.get(2))) ordinals.add(literals.get(registers.get(2)));
                continue;
            }
            if (!i.getOpcode().setsRegister() || !(i instanceof OneRegisterInstruction)) continue;
            strings.remove(registerA(i));
            literals.remove(registerA(i));
            Opcode opcode = i.getOpcode();
            if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
                strings.put(registerA(i), ((StringReference) ((ReferenceInstruction) i).getReference()).getString());
            } else if (opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16 || opcode == Opcode.CONST || opcode == Opcode.CONST_HIGH16) {
                literals.put(registerA(i), ((WideLiteralInstruction) i).getWideLiteral());
            }
        }
        return Math.toIntExact(featureOne(ordinals, type + "'s " + name + " constant"));
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
        featureOmittedSearchCarousel(clean, patched);
        featureOmittedProfileSuggestions(clean, patched);
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

    /** Left out, Block background-return feed refresh makes no call and leaves the four methods it hooks as Threads wrote them. */
    private static void featureOmittedReturnRefresh(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        for (String callee : List.of(HOLD_HOT_START, RESET_TO_FEED, WARM_START, CACHED_POSTS)) featureHostCalls(patched, callee, Map.of());
        Set<String> hooked = new HashSet<>();
        for (ReturnSite site : featureReturnSites(clean).values()) hooked.add(featureSig(site.stock));
        hooked.add(featureSig(featureHotStartDecision(clean)));
        featurePreserveTargets(clean, patched, m -> hooked.contains(featureSig(m)));
    }

    /**
     * Left out, Disable video autoplay makes no call and leaves PostVideo, its effect, the viewer
     * and the feed posts, Instagram posts, trend previews and ad cards that call it, and the
     * prefetch skip test with the check and the methods around it, as Threads wrote them.
     */
    private static void featureOmittedVideoAutoplay(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureHostCalls(patched, HOLD_VIDEO, Map.of());
        featureHostCalls(patched, SKIP_PREFETCH, Map.of());
        VideoSites sites = featureVideoSites(clean);
        PrefetchSites prefetch = featurePrefetchSites(clean);
        Set<String> hooked = new HashSet<>(List.of(featureSig(sites.postVideo()), featureSig(sites.effect()), featureSig(prefetch.skip())));
        for (Method kept : List.of(prefetch.check(), prefetch.dispatcher())) hooked.add(featureSig(kept));
        for (Method kept : prefetch.siblings()) hooked.add(featureSig(kept));
        for (Method kept : prefetch.others()) hooked.add(featureSig(kept));
        for (Method forwarder : sites.forwarders()) hooked.add(featureSig(forwarder));
        for (Method caller : sites.calls().keySet()) hooked.add(featureSig(caller));
        for (Method viewer : sites.viewers()) hooked.add(featureSig(viewer));
        featurePreserveTargets(clean, patched, m -> hooked.contains(featureSig(m)));
    }

    /** Left out, Pure black dark mode makes no call and leaves the theme, its color helpers and the schemes' initializer as Threads wrote them. */
    private static void featureOmittedPureBlack(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureHostCalls(patched, PURE_ARGB, Map.of());
        featureHostCalls(patched, PURE_COLOR, Map.of());
        PureBlackSites sites = featurePureBlackSites(clean);
        Set<String> hooked = new HashSet<>(List.of(featureSig(sites.initializer())));
        for (Method builder : sites.builders().keySet()) hooked.add(featureSig(builder));
        featurePreserveTargets(clean, patched, m -> hooked.contains(featureSig(m)));
    }

    /**
     * Left out, the settings row makes no call, leaves Threads' settings list and both its rows as
     * Threads wrote them, and leaves showRow, when the extension has it, the empty stub it ships as.
     * Copy text, which comes only with the settings patch, is left out along with it.
     */
    private static void featureOmittedSettingsRow(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureHostCalls(patched, ADD_ROW, Map.of());
        SettingsRowSites sites = featureSettingsRowSites(clean);
        Set<String> hooked = new HashSet<>(List.of(featureSig(sites.list()), featureSig(sites.row()), featureSig(sites.accounts())));
        featurePreserveTargets(clean, patched, m -> hooked.contains(featureSig(m)));
        if (patched.containsKey(SHOW_ROW)) requireFeature(instructions(featureMethod(patched, SHOW_ROW)).stream().map(Instruction::getOpcode)
                .toList().equals(List.of(Opcode.RETURN_VOID)), "omitted settings row wrote " + SHOW_ROW);
        featureOmittedCopyText(clean, patched);
    }

    /**
     * Where Save photos and videos hooks, read off the post menu's Copy link row in the clean build:
     * the menu lambda, the index of its Copy link row call and the lambda's own register, the
     * composer's type, the row and the calls and literals that build its arguments, the menu's post,
     * activity and controller fields, and the call Copy link's click closes the menu with.
     */
    private record SaveMediaSites(Method menu, int rowAt, int self, String composerType, MethodReference row, FieldReference base,
            MethodReference role, int roleArgument, MethodReference clickModifier, int enabled, MethodReference style,
            MethodReference icon, List<Integer> iconArguments, FieldReference media, FieldReference activity,
            FieldReference controller, MethodReference dismiss) {}

    /** One InstagramMedia bridge: its name, the type it casts its argument to, and the getter it calls, by invoke-virtual or invoke-interface. */
    private record SaveBridge(String name, String receiver, Opcode call, String getter) {}

    private static final Set<Opcode> SAVE_OBJECT_MOVES = Set.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);
    private static final Set<Opcode> SAVE_EXITS = Set.of(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW);

    /**
     * Save photos and videos. Copy link's own path in the post menu gets a copy of its row call,
     * then SaveMediaRow.add with the lambda and its composer, then a goto past the original call,
     * which every branch to it still reaches; nothing else in the menu changes, and it's the one
     * host method that calls add. showRow draws Threads' row the way Copy link's is drawn, each
     * argument read back to the calls and literals the patch found; media, activity and dismiss read
     * the menu's post, activity and controller fields and close it with Copy link's call; the click
     * is a kotlin Function0; and every static method on InstagramMedia is a bridge the patch
     * wrote, casting its argument to the model and returning what the getter the patch found answers.
     */
    private static void featureSaveMedia(Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            File cleanApk, File patchedApk) throws Exception {
        Map<String, List<ClassDef>> classes = featureClassIndex(cleanApk);
        SaveMediaSites sites = featureSaveMediaSites(clean, classes);
        List<SaveBridge> bridges = featureSaveBridges(classes);
        Instruction rowCall = instructions(sites.menu()).get(sites.rowAt());
        FeatureInsert hook = (body, at) -> {
            requireFeature(at < body.size() && featureInstruction(body.get(at)).equals(featureInstruction(rowCall)),
                    "Copy link's own path doesn't draw a copy of its row call, " + featureInstruction(rowCall) + ", at instruction " + at);
            requireFeature(at + 1 < body.size() && isStaticInvoke(body.get(at + 1).getOpcode()) && reference(body.get(at + 1)).equals(ADD_SAVE_ROW),
                    "missing " + ADD_SAVE_ROW + " at instruction " + (at + 1) + ", after the copy of Copy link's row call");
            int[] passed = invokeRegisters(body.get(at + 1));
            requireFeature(Arrays.equals(passed, new int[]{sites.self(), sites.self() + 1}),
                    ADD_SAVE_ROW + " at instruction " + (at + 1) + " passes " + Arrays.toString(passed)
                            + ", not the menu and its composer, v" + sites.self() + " and v" + (sites.self() + 1));
            // The goto lands right past the original call, where Copy link's row call goes on to.
            requireFeature(at + 3 < body.size() && body.get(at + 2).getOpcode().name.startsWith("goto")
                    && ((OffsetInstruction) body.get(at + 2)).getCodeOffset() == body.get(at + 2).getCodeUnits() + body.get(at + 3).getCodeUnits(),
                    "the Save hook doesn't go from instruction " + (at + 2) + " to where Copy link's row call goes, past the original call");
            return 3;
        };
        featureBody(sites.menu(), featureMethod(patched, featureSig(sites.menu())), 0, Map.of(), ADD_SAVE_ROW, null, Map.of(sites.rowAt(), hook));
        featureHostCalls(patched, ADD_SAVE_ROW, Map.of(featureSig(sites.menu()), 1));
        featureSaveShowRow(featureMethod(patched, SAVE_SHOW_ROW), sites);
        String menuType = sites.menu().getDefiningClass();
        featureSaveReader(featureMethod(patched, SAVE_MEDIA_OF), menuType, sites.media(), "the menu's post");
        featureSaveReader(featureMethod(patched, SAVE_ACTIVITY_OF), menuType, sites.activity(), "the menu's activity");
        featureSaveDismiss(featureMethod(patched, SAVE_DISMISS), sites);
        List<ClassDef> clicks = featureClassIndex(patchedApk).getOrDefault(SAVE_CLICK, List.of());
        ClassDef click = featureOne(clicks, SAVE_CLICK);
        requireFeature(click.getInterfaces().equals(List.of(FUNCTION0)),
                SAVE_CLICK + " implements " + click.getInterfaces() + ", not " + FUNCTION0 + ", so Threads' row can't take it");
        Method invoke = featureMethod(patched, SAVE_CLICK + "->invoke()Ljava/lang/Object;");
        requireFeature(AccessFlags.PUBLIC.isSet(invoke.getAccessFlags()) && !AccessFlags.STATIC.isSet(invoke.getAccessFlags()),
                SAVE_CLICK + "'s invoke() isn't a public instance method");
        Set<String> written = new TreeSet<>();
        for (SaveBridge bridge : bridges) written.add(featureSaveBridge(patched, bridge));
        for (String stub : featureSaveBridgeSigs(patched)) requireFeature(written.contains(stub),
                stub + " isn't one of the bridges the Save patch writes, so it would still answer as its stub does");
        System.out.println("[diff] threads-feature saveMedia: Copy link's row at " + sites.rowAt() + " of " + featureSig(sites.menu())
                + ", closed by " + featureSig(sites.dismiss()));
    }

    /** Every class in [apk] by type, keeping duplicates so a lookup can refuse them. */
    private static Map<String, List<ClassDef>> featureClassIndex(File apk) throws Exception {
        Map<String, List<ClassDef>> classes = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (ClassDef cd : dex.getEntry(entry).getDexFile().getClasses())
            classes.computeIfAbsent(cd.getType(), k -> new ArrayList<>()).add(cd);
        return classes;
    }

    private static ClassDef featureSaveClass(Map<String, List<ClassDef>> classes, String type) {
        List<ClassDef> found = classes.getOrDefault(type, List.of());
        requireFeature(found.size() == 1, "expected one definition of " + type + ", found " + found.size());
        return found.get(0);
    }

    private static MethodReference callee(Instruction i) {
        return (MethodReference) ((ReferenceInstruction) i).getReference();
    }

    private static List<String> featureParams(MethodReference m) {
        List<String> params = new ArrayList<>();
        for (CharSequence type : m.getParameterTypes()) params.add(type.toString());
        return params;
    }

    /** The index of the instruction at [address] in [layout], refusing an address between two. */
    private static int featureSaveIndex(Layout layout, int address) {
        int index = layout.addresses.indexOf(address);
        requireFeature(index >= 0, "a branch lands between instructions");
        return index;
    }

    /** The post menu's Copy link item: the one class whose toString() says "CopyLinkAction". */
    private static String featureSaveCopyLink(Map<String, List<Method>> clean) {
        Set<String> owners = new TreeSet<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m.getName().equals("toString") && m.getParameterTypes().isEmpty() && m.getReturnType().equals("Ljava/lang/String;")
                    && holds(m, COPY_LINK)) owners.add(m.getDefiningClass());
        }
        return featureOne(new ArrayList<>(owners), "the post menu's Copy link item, the class whose toString says \"" + COPY_LINK + "\",");
    }

    /** The indices of [m]'s instance-of checks for [type]. */
    private static List<Integer> featureSaveChecks(Method m, String type) {
        List<Integer> checks = new ArrayList<>();
        List<Instruction> body = instructions(m);
        for (int n = 0; n < body.size(); n++) if (body.get(n).getOpcode() == Opcode.INSTANCE_OF && reference(body.get(n)).equals(type)) checks.add(n);
        return checks;
    }

    /**
     * Where the Save row goes, read the way the Save patch reads it and never by obfuscated name.
     * The menu is the one lambda holding the menu's note that checks for the Copy link item, which
     * it does once, skipping a case nothing outside branches into. That case makes one row call
     * taking (composer, modifier, style, icon, String), which Copy link's own path falls into and
     * nothing else in the case branches to. Its
     * composer is the lambda's composer parameter, cast; its modifier a click call on a static base,
     * a role built from a literal, a new click and literals, perhaps under up to three more
     * modifiers; its style built from the composer alone; and its icon from the composer, one of
     * Threads' drawables and literals. The click is a merged lambda over one object, whose case for
     * Copy link casts that object to the controller and closes the menu with one no-argument call
     * before a goto. The menu has one field each for the post, the activity and the controller, and
     * everything showRow and the readers use is public.
     */
    private static SaveMediaSites featureSaveMediaSites(Map<String, List<Method>> clean, Map<String, List<ClassDef>> classes) {
        String copyLink = featureSaveCopyLink(clean);
        Map<String, Method> menus = new TreeMap<>();
        for (List<Method> definitions : clean.values()) for (Method m : definitions) {
            if (m.getImplementation() != null && holdsNote(m, MENU_NOTE) && !featureSaveChecks(m, copyLink).isEmpty()) menus.putIfAbsent(featureSig(m), m);
        }
        Method menu = featureOne(new ArrayList<>(menus.values()), "the post menu, the lambda holding \"" + MENU_NOTE + "\" that checks for Copy link,");
        FeatureFlow flow = new FeatureFlow(menu);
        List<Instruction> body = flow.layout.instructions;

        List<Integer> checks = featureSaveChecks(menu, copyLink);
        requireFeature(checks.size() == 1, "the post menu checks for Copy link " + checks.size() + " times, not once");
        int checkAt = checks.get(0);
        requireFeature(checkAt + 1 < body.size() && body.get(checkAt + 1).getOpcode() == Opcode.IF_EQZ
                && registerA(body.get(checkAt + 1)) == registerA(body.get(checkAt)),
                "the post menu doesn't skip its Copy link case when the item isn't Copy link");
        int skipAt = featureSaveIndex(flow.layout, flow.layout.addresses.get(checkAt + 1) + ((OffsetInstruction) body.get(checkAt + 1)).getCodeOffset());
        requireFeature(skipAt > checkAt + 2, "the post menu's Copy link case is empty");

        List<Integer> rows = new ArrayList<>();
        for (int at = checkAt + 2; at < skipAt; at++) {
            if (!isStaticInvoke(body.get(at).getOpcode())) continue;
            MethodReference call = callee(body.get(at));
            if (call.getReturnType().equals("V") && call.getParameterTypes().size() == 5
                    && call.getParameterTypes().get(4).toString().equals("Ljava/lang/String;")) rows.add(at);
        }
        requireFeature(rows.size() == 1, "the post menu's Copy link case makes " + rows.size() + " row calls, not one");
        int rowAt = rows.get(0);
        MethodReference row = callee(body.get(rowAt));
        List<String> rowParams = featureParams(row);
        String composerType = rowParams.get(0);
        int[] rowArgs = invokeRegisters(body.get(rowAt));

        // The copy goes in just before the call, where only Copy link's own path runs: that path
        // falls into the call from the instruction before it, and nothing outside the case branches
        // or throws into the case. Other items may still branch to the call itself, but nothing in
        // the case may: code inserted with labels leaves a branch, case or handler aimed at the call
        // landing on the original, past the copy, so only falling into it runs the Save row.
        requireFeature(rowAt - 1 >= checkAt + 2, "the post menu's Copy link case starts with its row call");
        requireFeature(rowAt + 1 < body.size(), "the post menu ends on Copy link's row call");
        requireFeature(flow.normal.get(rowAt - 1).contains(rowAt), "Copy link's own path doesn't fall into its row call");
        boolean entered = false;
        for (int from = 0; from < body.size() && !entered; from++) {
            boolean outside = from < checkAt + 1 || from >= rowAt;
            for (int to : flow.normal.get(from)) if (outside && to >= checkAt + 2 && to < rowAt) entered = true;
            for (int to : flow.guarded.get(from)) if (to >= checkAt + 2 && to < rowAt) entered = true;
        }
        requireFeature(!entered, "the post menu branches into its Copy link case");
        for (int from = checkAt + 1; from < rowAt; from++) {
            List<Integer> aimed = new ArrayList<>(flow.guarded.get(from));
            Instruction i = body.get(from);
            if (i instanceof OffsetInstruction && i.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                int target = flow.layout.addresses.get(from) + ((OffsetInstruction) i).getCodeOffset();
                if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                    for (SwitchElement e : ((SwitchPayload) flow.layout.byAddress.get(target)).getSwitchElements())
                        aimed.add(featureSaveIndex(flow.layout, flow.layout.addresses.get(from) + e.getOffset()));
                } else aimed.add(featureSaveIndex(flow.layout, target));
            }
            requireFeature(!aimed.contains(rowAt), "the post menu's Copy link case branches from instruction " + from
                    + " straight to its row call at instruction " + rowAt + ", past where the Save row goes");
        }

        // The hook passes the lambda and its composer parameter, so neither may change, and the row's
        // composer has to be that parameter, cast.
        requireFeature(!AccessFlags.STATIC.isSet(menu.getAccessFlags()) && !menu.getParameterTypes().isEmpty()
                && kindOf(menu.getParameterTypes().get(0)) == 'L', "the post menu isn't a lambda taking its composer first");
        int self = featureThis(menu);
        for (Instruction i : body) requireFeature(!featureWrites(i, self) && !featureWrites(i, self + 1), "the post menu overwrites its own parameters");
        int composer = rowArgs[0];
        requireFeature(featureSaveComposer(flow, self, composerType, composer, featureSaveOnPath(flow, rowAt, composer), new HashSet<>()),
                "the post menu's Copy link row isn't passed the menu's composer parameter");

        // The modifier: Copy link's click call, perhaps under more modifiers of the same type.
        int clickAt = featureSaveProducer(body, featureSaveOnPath(flow, rowAt, rowArgs[1]), "Copy link's modifier");
        int hops = 0;
        while (!featureSaveIsClick(callee(body.get(clickAt)), rowParams.get(1))) {
            MethodReference hop = callee(body.get(clickAt));
            List<String> params = featureParams(hop);
            requireFeature(++hops <= 3 && !params.isEmpty() && params.get(0).equals(rowParams.get(1)) && hop.getReturnType().equals(rowParams.get(1)),
                    "Copy link's modifier isn't built by a click call: " + featureSig(hop));
            clickAt = featureSaveProducer(body, flow.reaching(clickAt, invokeRegisters(body.get(clickAt))[0]), "Copy link's modifier");
        }
        MethodReference clickModifier = callee(body.get(clickAt));
        int[] clickArgs = invokeRegisters(body.get(clickAt));
        Set<Integer> baseWrites = flow.reaching(clickAt, clickArgs[0]);
        requireFeature(baseWrites.size() == 1 && !baseWrites.contains(-1) && body.get(baseWrites.iterator().next()).getOpcode() == Opcode.SGET_OBJECT,
                "Copy link's modifier isn't built on a static base modifier");
        FieldReference base = (FieldReference) ((ReferenceInstruction) body.get(baseWrites.iterator().next())).getReference();
        int roleAt = featureSaveProducer(body, flow.reaching(clickAt, clickArgs[1]), "Copy link's role");
        MethodReference role = callee(body.get(roleAt));
        requireFeature(featureParams(role).equals(List.of("I")) && role.getReturnType().equals(clickModifier.getParameterTypes().get(1).toString()),
                "Copy link's role isn't built from an int: " + featureSig(role));
        int roleArgument = featureSaveLiteral(flow, roleAt, invokeRegisters(body.get(roleAt))[0], "role");
        if (clickArgs.length == 5) requireFeature(featureSaveLiteral(flow, clickAt, clickArgs[3], "click label") == 0, "Copy link's click has a label");
        int enabled = featureSaveLiteral(flow, clickAt, clickArgs[clickArgs.length - 1], "enabled flag");

        int styleAt = featureSaveProducer(body, featureSaveOnPath(flow, rowAt, rowArgs[2]), "Copy link's style");
        MethodReference style = callee(body.get(styleAt));
        requireFeature(featureParams(style).equals(List.of(composerType)) && style.getReturnType().equals(rowParams.get(2)),
                "Copy link's style isn't built from the composer alone: " + featureSig(style));
        requireFeature(invokeRegisters(body.get(styleAt))[0] == composer, "Copy link's style isn't built from the row's composer");
        int iconAt = featureSaveProducer(body, featureSaveOnPath(flow, rowAt, rowArgs[3]), "Copy link's icon");
        MethodReference icon = callee(body.get(iconAt));
        List<String> iconParams = featureParams(icon);
        requireFeature(iconParams.size() >= 2 && iconParams.get(0).equals(composerType) && iconParams.get(1).equals("I")
                && iconParams.subList(2, iconParams.size()).stream().allMatch(p -> p.equals("I") || p.equals("Z")),
                "Copy link's icon isn't built from the composer, a drawable and literals: " + featureSig(icon));
        int[] iconArgs = invokeRegisters(body.get(iconAt));
        requireFeature(iconArgs[0] == composer, "Copy link's icon isn't built from the row's composer");
        requireFeature(featureSaveLiteral(flow, iconAt, iconArgs[1], "icon") >>> 24 == 0x7f, "Copy link's icon isn't one of Threads' resources");
        List<Integer> iconArguments = new ArrayList<>();
        for (int n = 2; n < iconArgs.length; n++) iconArguments.add(featureSaveLiteral(flow, iconAt, iconArgs[n], "icon flag"));

        // Copy link's click, which names the controller and how the menu closes.
        List<Integer> news = new ArrayList<>();
        for (int write : flow.reaching(clickAt, clickArgs[2])) if (write >= 0 && body.get(write).getOpcode() == Opcode.NEW_INSTANCE) news.add(write);
        requireFeature(news.size() == 1, "Copy link's click isn't one new object");
        int newAt = news.get(0);
        String click = reference(body.get(newAt));
        int constructAt = -1;
        for (int at = newAt + 1; at < skipAt && constructAt < 0; at++) {
            Opcode op = body.get(at).getOpcode();
            if ((op == Opcode.INVOKE_DIRECT || op == Opcode.INVOKE_DIRECT_RANGE) && callee(body.get(at)).getDefiningClass().equals(click)
                    && callee(body.get(at)).getName().equals("<init>")) constructAt = at;
        }
        requireFeature(constructAt >= 0, "Copy link's click is never constructed");
        MethodReference constructor = callee(body.get(constructAt));
        List<String> constructorParams = featureParams(constructor);
        List<ClassDef> clickClasses = classes.getOrDefault(click, List.of());
        requireFeature(!clickClasses.isEmpty(), "Threads carries no " + click);
        List<Field> intFields = new ArrayList<>(), objectFields = new ArrayList<>();
        for (Field f : clickClasses.get(0).getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) {
            if (f.getType().equals("I")) intFields.add(f);
            if (f.getType().equals(FEATURE_OBJECT)) objectFields.add(f);
        }
        // 451 captures the two strings passed to Copy link before the case id and controller. The
        // controller remains its only Object field, whose cast and closing call are checked below.
        boolean controllerCapture = !constructorParams.isEmpty() && constructorParams.get(0).equals(FEATURE_OBJECT)
                || constructorParams.equals(List.of("Ljava/lang/String;", "Ljava/lang/String;", "I", FEATURE_OBJECT));
        requireFeature(constructorParams.stream().filter("I"::equals).count() == 1 && intFields.size() == 1 && objectFields.size() == 1 && controllerCapture,
                "Copy link's click isn't a merged lambda over one object: " + featureSig(constructor));
        int which = featureSaveLiteral(flow, constructAt, invokeRegisters(body.get(constructAt))[1 + constructorParams.indexOf("I")], "click case");
        MethodReference dismiss = featureSaveClickCase(clickClasses.get(0), intFields.get(0).getName(), objectFields.get(0).getName(), which);
        String controller = dismiss.getDefiningClass();

        ClassDef menuClass = featureSaveClass(classes, menu.getDefiningClass());
        SaveMediaSites sites = new SaveMediaSites(menu, rowAt, self, composerType, row, base, role, roleArgument, clickModifier, enabled,
                style, icon, iconArguments, featureSaveField(menuClass, MEDIA, "post"), featureSaveField(menuClass, ANDROID_ACTIVITY, "activity"),
                featureSaveField(menuClass, controller, "controller"), dismiss);
        for (MethodReference m : List.of(row, role, clickModifier, style, icon, dismiss)) featureSavePublic(classes, m);
        for (FieldReference f : List.of(base, sites.media(), sites.activity(), sites.controller())) featureSavePublic(classes, f);
        return sites;
    }

    /** What [register] holds as the row call runs on Copy link's own path, which comes from the instruction before it. */
    private static Set<Integer> featureSaveOnPath(FeatureFlow flow, int rowAt, int register) {
        return featureWrites(flow.layout.instructions.get(rowAt - 1), register) ? Set.of(rowAt - 1) : flow.reaching(rowAt - 1, register);
    }

    /**
     * Whether every write in [reaching] hands [register] the menu's composer parameter, the register
     * above [self], through object copies and casts to [composerType]. Writes that never reach the
     * row don't count, since 450 reuses the register once the menu is drawn.
     */
    private static boolean featureSaveComposer(FeatureFlow flow, int self, String composerType, int register, Set<Integer> reaching, Set<Integer> followed) {
        if (register == self + 1) return true;
        if (reaching.isEmpty() || reaching.contains(-1)) return false;
        for (int write : reaching) {
            if (!followed.add(write)) continue;
            Instruction i = flow.layout.instructions.get(write);
            boolean passed;
            if (SAVE_OBJECT_MOVES.contains(i.getOpcode())) {
                int from = ((TwoRegisterInstruction) i).getRegisterB();
                passed = featureSaveComposer(flow, self, composerType, from, flow.reaching(write, from), followed);
            } else if (i.getOpcode() == Opcode.CHECK_CAST && reference(i).equals(composerType)) {
                passed = featureSaveComposer(flow, self, composerType, register, flow.reaching(write, register), followed);
            } else passed = false;
            if (!passed) return false;
        }
        return true;
    }

    /** The static call whose answer is the one write in [reaching], by index. */
    private static int featureSaveProducer(List<Instruction> body, Set<Integer> reaching, String what) {
        int write = reaching.size() == 1 ? reaching.iterator().next() : -1;
        requireFeature(write > 0 && body.get(write).getOpcode() == Opcode.MOVE_RESULT_OBJECT && isStaticInvoke(body.get(write - 1).getOpcode()),
                what + " isn't the answer of one static call");
        return write - 1;
    }

    /** The one literal [register] holds at [at] on every path there. */
    private static int featureSaveLiteral(FeatureFlow flow, int at, int register, String what) {
        Set<Integer> reaching = flow.reaching(at, register);
        Set<Integer> values = new HashSet<>();
        boolean other = reaching.isEmpty() || reaching.contains(-1);
        for (int write : reaching) {
            if (write < 0) continue;
            Integer value = featureSaveConstant(flow.layout.instructions.get(write));
            if (value == null) other = true; else values.add(value);
        }
        requireFeature(!other && values.size() == 1, "Copy link's " + what + " isn't one literal");
        return values.iterator().next();
    }

    /** The narrow literal a const of one register loads, or null for anything else. */
    private static Integer featureSaveConstant(Instruction i) {
        switch (i.getOpcode()) {
            case CONST_4: case CONST_16: case CONST: case CONST_HIGH16: return ((NarrowLiteralInstruction) i).getNarrowLiteral();
            default: return null;
        }
    }

    /** Whether [m] is a click call on [modifier]: (modifier, role, Object, [String,] boolean), answering the modifier. */
    private static boolean featureSaveIsClick(MethodReference m, String modifier) {
        List<String> params = featureParams(m);
        return m.getReturnType().equals(modifier) && params.size() >= 4 && params.size() <= 5 && params.get(0).equals(modifier)
                && params.get(2).equals(FEATURE_OBJECT) && params.get(params.size() - 1).equals("Z")
                && (params.size() == 4 || params.get(3).equals("Ljava/lang/String;"));
    }

    /**
     * The call Copy link's click closes the menu with: in [click]'s invoke(), the case [which] that
     * the int field [intField] picks, by comparison with literals or a switch, casts the Object field
     * [objectField] to the controller and makes one no-argument call on it right before a goto.
     */
    private static MethodReference featureSaveClickCase(ClassDef click, String intField, String objectField, int which) {
        List<Method> invokes = new ArrayList<>();
        for (Method m : click.getMethods()) if (m.getName().equals("invoke") && m.getParameterTypes().isEmpty()
                && m.getReturnType().equals(FEATURE_OBJECT) && m.getImplementation() != null) invokes.add(m);
        requireFeature(invokes.size() == 1, "Copy link's click " + click.getType() + " has " + invokes.size() + " invoke() methods, not one");
        Layout layout = new Layout(invokes.get(0).getImplementation());
        List<Instruction> code = layout.instructions;
        int readAt = -1;
        for (int n = 0; n < code.size() && readAt < 0; n++) if (code.get(n).getOpcode() == Opcode.IGET
                && ((FieldReference) ((ReferenceInstruction) code.get(n)).getReference()).getDefiningClass().equals(click.getType())
                && ((FieldReference) ((ReferenceInstruction) code.get(n)).getReference()).getName().equals(intField)) readAt = n;
        requireFeature(readAt >= 0, "Copy link's click never reads its case");
        int selector = registerA(code.get(readAt));
        Map<Integer, Integer> literals = new HashMap<>(), cases = new LinkedHashMap<>();
        dispatch:
        for (int at = readAt + 1; at < code.size(); at++) {
            Instruction i = code.get(at);
            Opcode op = i.getOpcode();
            if (op == Opcode.IF_EQZ && registerA(i) == selector) {
                cases.putIfAbsent(0, featureSaveIndex(layout, layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset()));
            } else if (op == Opcode.IF_EQ && (registerA(i) == selector || ((TwoRegisterInstruction) i).getRegisterB() == selector)) {
                Integer value = literals.get(registerA(i) == selector ? ((TwoRegisterInstruction) i).getRegisterB() : registerA(i));
                if (value == null) break;
                cases.putIfAbsent(value, featureSaveIndex(layout, layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset()));
            } else if ((op == Opcode.PACKED_SWITCH || op == Opcode.SPARSE_SWITCH) && registerA(i) == selector) {
                Instruction payload = code.get(featureSaveIndex(layout, layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset()));
                for (SwitchElement e : ((SwitchPayload) payload).getSwitchElements())
                    cases.putIfAbsent(e.getKey(), featureSaveIndex(layout, layout.addresses.get(at) + e.getOffset()));
                break;
            } else if (i instanceof OffsetInstruction || SAVE_EXITS.contains(op) || featureWrites(i, selector)) {
                break;
            } else if (op.setsRegister()) {
                if (!(i instanceof OneRegisterInstruction)) break dispatch;
                literals.remove(registerA(i));
                Integer value = featureSaveConstant(i);
                if (value != null) literals.put(registerA(i), value);
            }
        }
        Integer start = cases.get(which);
        requireFeature(start != null, "Copy link's click has no case " + which);
        int end = code.size();
        for (int other : cases.values()) if (other > start && other < end) end = other;
        int loadAt = -1;
        for (int n = start; n < end && loadAt < 0; n++) if (code.get(n).getOpcode() == Opcode.IGET_OBJECT
                && ((FieldReference) ((ReferenceInstruction) code.get(n)).getReference()).getDefiningClass().equals(click.getType())
                && ((FieldReference) ((ReferenceInstruction) code.get(n)).getReference()).getName().equals(objectField)) loadAt = n;
        requireFeature(loadAt >= 0 && loadAt + 1 < code.size() && code.get(loadAt + 1).getOpcode() == Opcode.CHECK_CAST
                && registerA(code.get(loadAt + 1)) == registerA(code.get(loadAt)), "Copy link's click doesn't cast its object to a controller");
        String controller = reference(code.get(loadAt + 1));
        Map<String, MethodReference> dismisses = new LinkedHashMap<>();
        for (int n = start; n < end; n++) {
            Opcode op = code.get(n).getOpcode();
            if (op != Opcode.INVOKE_VIRTUAL && op != Opcode.INVOKE_VIRTUAL_RANGE || n + 1 >= code.size()) continue;
            Opcode next = code.get(n + 1).getOpcode();
            MethodReference call = callee(code.get(n));
            if (call.getDefiningClass().equals(controller) && call.getParameterTypes().isEmpty() && call.getReturnType().equals("V")
                    && (next == Opcode.GOTO || next == Opcode.GOTO_16 || next == Opcode.GOTO_32)) dismisses.putIfAbsent(featureSig(call), call);
        }
        return featureOne(new ArrayList<>(dismisses.values()),
                "the call Copy link's click closes the menu with, a no-argument call on " + controller + " before a goto,");
    }

    /** The menu's one instance field of [type]. */
    private static FieldReference featureSaveField(ClassDef menu, String type, String what) {
        List<Field> fields = new ArrayList<>();
        for (Field f : menu.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getType().equals(type)) fields.add(f);
        return featureOne(fields, "the post menu's " + what + ", its field of type " + type + ",");
    }

    /** Refuses unless [method] is declared public on a public class, since the extension calls it from outside. */
    private static void featureSavePublic(Map<String, List<ClassDef>> classes, MethodReference method) {
        List<ClassDef> owners = classes.getOrDefault(method.getDefiningClass(), List.of());
        List<Method> declared = new ArrayList<>();
        if (!owners.isEmpty()) for (Method m : owners.get(0).getMethods()) if (featureSig(m).equals(featureSig(method))) declared.add(m);
        requireFeature(declared.size() == 1 && AccessFlags.PUBLIC.isSet(owners.get(0).getAccessFlags()) && AccessFlags.PUBLIC.isSet(declared.get(0).getAccessFlags()),
                featureSig(method) + " isn't public");
    }

    /** The same for [field]. */
    private static void featureSavePublic(Map<String, List<ClassDef>> classes, FieldReference field) {
        List<ClassDef> owners = classes.getOrDefault(field.getDefiningClass(), List.of());
        List<Field> declared = new ArrayList<>();
        if (!owners.isEmpty()) for (Field f : owners.get(0).getFields()) if (f.toString().equals(field.toString())) declared.add(f);
        requireFeature(declared.size() == 1 && AccessFlags.PUBLIC.isSet(owners.get(0).getAccessFlags()) && AccessFlags.PUBLIC.isSet(declared.get(0).getAccessFlags()),
                field + " isn't public");
    }

    /**
     * The getter on [type] for the model field [field]: the one instance method taking nothing and
     * answering [returns] that loads the Java hash of the field's name, which the models read the
     * server's tree by however the release shortened the getter's own name.
     */
    private static Method featurePandoGetter(Map<String, List<ClassDef>> classes, String type, String field, String returns) {
        int key = field.hashCode();
        List<Method> getters = new ArrayList<>();
        for (Method m : featureSaveClass(classes, type).getMethods()) {
            if (!m.getParameterTypes().isEmpty() || AccessFlags.STATIC.isSet(m.getAccessFlags())) continue;
            if (returns == null ? !m.getReturnType().startsWith("L") : !m.getReturnType().equals(returns)) continue;
            if (instructions(m).stream().anyMatch(i -> java.util.Objects.equals(featureSaveConstant(i), key))) getters.add(m);
        }
        requireFeature(getters.size() == 1, "expected one getter on " + type + " answering " + returns + " for " + field + ", found "
                + (getters.isEmpty() ? "none" : String.join(", ", getters.stream().map(Method::getName).toList())));
        return getters.get(0);
    }

    /** [type], which the bridges call through invoke-interface, so it has to be an interface. */
    private static ClassDef featureSaveInterface(Map<String, List<ClassDef>> classes, String type) {
        ClassDef found = featureSaveClass(classes, type);
        requireFeature(AccessFlags.INTERFACE.isSet(found.getAccessFlags()), type + " is no longer an interface");
        return found;
    }

    /** The getter for [field] through the interface [type], by the name [pando], the tree-backed class implementing it, gives it. */
    private static String featureSaveThrough(Map<String, List<ClassDef>> classes, String type, String pando, String field, String returns) {
        Method getter = featurePandoGetter(classes, pando, field, returns);
        requireFeature(featureDeclares(featureSaveInterface(classes, type), getter.getName(), returns),
                type + " doesn't declare " + getter.getName() + ", the getter for " + field);
        return type + "->" + getter.getName() + "()" + returns;
    }

    /** Whether [owner] declares [name], taking nothing and answering [returns]. */
    private static boolean featureDeclares(ClassDef owner, String name, String returns) {
        for (Method m : owner.getMethods()) if (m.getName().equals(name) && m.getParameterTypes().isEmpty() && m.getReturnType().equals(returns)) return true;
        return false;
    }

    /** What each InstagramMedia bridge calls, found as the Save patch finds it: by Pando hash, or by kept name on Media and ImageUrl. */
    private static List<SaveBridge> featureSaveBridges(Map<String, List<ClassDef>> classes) {
        java.util.function.BiFunction<String, String, String> media = (field, returns) -> featureSig(featurePandoGetter(classes, MEDIA, field, returns));
        List<Method> ids = new ArrayList<>();
        for (Method m : featureSaveClass(classes, MEDIA).getMethods()) if (m.getName().equals("getId") && m.getParameterTypes().isEmpty()
                && m.getReturnType().equals("Ljava/lang/String;")) ids.add(m);
        requireFeature(ids.size() == 1, MEDIA + " has no getId()");
        java.util.function.BiFunction<String, String, String> kept = (name, returns) -> {
            requireFeature(featureDeclares(featureSaveInterface(classes, IMAGE_URL), name, returns), IMAGE_URL + " has no " + name + "()" + returns);
            return IMAGE_URL + "->" + name + "()" + returns;
        };
        List<SaveBridge> bridges = new ArrayList<>(featureLinkedPostBridges(classes));
        bridges.addAll(List.of(
                new SaveBridge("videoVersions", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("video_versions", "Ljava/util/List;")),
                new SaveBridge("dashManifest", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("video_dash_manifest", "Ljava/lang/String;")),
                new SaveBridge("mediaId", MEDIA, Opcode.INVOKE_VIRTUAL, featureSig(ids.get(0))),
                new SaveBridge("owner", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("user", USER)),
                new SaveBridge("takenAt", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("taken_at", "Ljava/lang/Long;")),
                new SaveBridge("carouselMedia", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("carousel_media", "Ljava/util/List;")),
                new SaveBridge("username", USER, Opcode.INVOKE_VIRTUAL, featureSig(featurePandoGetter(classes, USER, "username", "Ljava/lang/String;"))),
                new SaveBridge("versionUrl", VIDEO_VERSION, Opcode.INVOKE_INTERFACE, featureSaveThrough(classes, VIDEO_VERSION, PANDO_VIDEO_VERSION, "url", "Ljava/lang/String;")),
                new SaveBridge("versionWidth", VIDEO_VERSION, Opcode.INVOKE_INTERFACE, featureSaveThrough(classes, VIDEO_VERSION, PANDO_VIDEO_VERSION, "width", "Ljava/lang/Integer;")),
                new SaveBridge("versionHeight", VIDEO_VERSION, Opcode.INVOKE_INTERFACE, featureSaveThrough(classes, VIDEO_VERSION, PANDO_VIDEO_VERSION, "height", "Ljava/lang/Integer;")),
                new SaveBridge("imageVersions", MEDIA, Opcode.INVOKE_VIRTUAL, media.apply("image_versions2", IMAGE_INFO)),
                new SaveBridge("imageCandidates", IMAGE_INFO, Opcode.INVOKE_INTERFACE, featureSaveThrough(classes, IMAGE_INFO, PANDO_IMAGE_INFO, "candidates", "Ljava/util/List;")),
                new SaveBridge("candidateUrl", IMAGE_URL, Opcode.INVOKE_INTERFACE, kept.apply("getUrl", "Ljava/lang/String;")),
                new SaveBridge("candidateWidth", IMAGE_URL, Opcode.INVOKE_INTERFACE, kept.apply("getWidth", "I")),
                new SaveBridge("candidateHeight", IMAGE_URL, Opcode.INVOKE_INTERFACE, kept.apply("getHeight", "I"))));
        return bridges;
    }

    private static final List<String> LINKED_POST_KEYS = List.of("linked_inline_media", "share_info", "quoted_attachment_post", "reposted_post", "quoted_post");

    /**
     * What reads a post with no media of its own through to the post it shows, found as the Save
     * patch finds it: the text post info by Pando hash, and the rest by the one method writing all
     * their keys, the fields it reads for them and the interface getters answering those fields.
     */
    private static List<SaveBridge> featureLinkedPostBridges(Map<String, List<ClassDef>> classes) {
        List<Method> writers = new ArrayList<>();
        for (List<ClassDef> found : classes.values()) for (ClassDef def : found) for (Method m : def.getMethods()) {
            List<Instruction> body = instructions(m);
            if (LINKED_POST_KEYS.stream().allMatch(key -> body.stream().filter(i -> featureIsString(i, key)).count() == 1)) writers.add(m);
        }
        requireFeature(writers.size() == 1, "expected one method writing " + LINKED_POST_KEYS + ", found " + writers.size());
        Method writer = writers.get(0);
        String info = featurePandoGetter(classes, MEDIA, "text_post_app_info", null).getReturnType();
        Method share = featureLinkedGetter(classes, writer, "share_info", info);
        java.util.function.BiFunction<String, String, SaveBridge> post = (name, key) -> {
            String owner = key.equals("linked_inline_media") ? info : share.getReturnType();
            Method getter = featureLinkedGetter(classes, writer, key, owner);
            requireFeature(getter.getReturnType().equals(MEDIA), "the getter for " + key + " answers " + getter.getReturnType() + ", not " + MEDIA);
            return new SaveBridge(name, owner, Opcode.INVOKE_INTERFACE, owner + "->" + getter.getName() + "()" + MEDIA);
        };
        return List.of(
                new SaveBridge("textPostInfo", MEDIA, Opcode.INVOKE_VIRTUAL, featureSig(featurePandoGetter(classes, MEDIA, "text_post_app_info", null))),
                post.apply("linkedInlineMedia", "linked_inline_media"),
                new SaveBridge("shareInfo", info, Opcode.INVOKE_INTERFACE, info + "->" + share.getName() + "()" + share.getReturnType()),
                post.apply("quotedAttachmentPost", "quoted_attachment_post"),
                post.apply("repostedPost", "reposted_post"),
                post.apply("quotedPost", "quoted_post"));
    }

    private static boolean featureIsString(Instruction i, String value) {
        return (i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO) && reference(i).equals(value);
    }

    /** The getter [owner] declares for [key]: the field [writer] loads and tests just before naming it, read back through that field's class. */
    private static Method featureLinkedGetter(Map<String, List<ClassDef>> classes, Method writer, String key, String owner) {
        List<Instruction> code = instructions(writer);
        int named = 0;
        while (named < code.size() && !featureIsString(code.get(named), key)) named++;
        requireFeature(named >= 2 && named < code.size() && code.get(named - 2).getOpcode() == Opcode.IGET_OBJECT && code.get(named - 1).getOpcode() == Opcode.IF_EQZ,
                featureSig(writer) + " doesn't read a field and test it just before writing " + key);
        FieldReference field = (FieldReference) ((ReferenceInstruction) code.get(named - 2)).getReference();
        List<Method> getters = new ArrayList<>();
        for (Method m : featureSaveClass(classes, field.getDefiningClass()).getMethods()) {
            List<Instruction> body = instructions(m);
            if (m.getParameterTypes().isEmpty() && body.size() == 2 && body.get(0).getOpcode() == Opcode.IGET_OBJECT && body.get(1).getOpcode() == Opcode.RETURN_OBJECT
                    && ((FieldReference) ((ReferenceInstruction) body.get(0)).getReference()).getName().equals(field.getName())) getters.add(m);
        }
        requireFeature(getters.size() == 1, "expected one getter on " + field.getDefiningClass() + " for " + key + ", found " + getters.size());
        Method getter = getters.get(0);
        requireFeature(featureDeclares(featureSaveInterface(classes, owner), getter.getName(), getter.getReturnType()),
                owner + " doesn't declare " + getter.getName() + ", the getter for " + key);
        return getter;
    }

    /** The extension's stub for the bridge [name], whatever it answers. */
    private static List<String> featureSaveBridgeStubs(Map<String, List<Method>> patched, String name) {
        String prefix = INSTAGRAM_MEDIA + "->" + name + "(Ljava/lang/Object;)";
        return patched.keySet().stream().filter(s -> s.startsWith(prefix)).sorted().toList();
    }

    /** Every static method InstagramMedia has, each a bridge, whether written or still its stub. */
    private static List<String> featureSaveBridgeSigs(Map<String, List<Method>> patched) {
        return patched.entrySet().stream().filter(e -> e.getKey().startsWith(INSTAGRAM_MEDIA + "->")
                && e.getValue().stream().anyMatch(m -> AccessFlags.STATIC.isSet(m.getAccessFlags()) && !m.getName().startsWith("<")))
                .map(Map.Entry::getKey).sorted().toList();
    }

    /**
     * One bridge as the Save patch writes it, in front of the stub's own return: the argument cast
     * to the model, the getter called on it, and its answer returned, an int's as an int. Answers
     * the stub's signature.
     */
    private static String featureSaveBridge(Map<String, List<Method>> patched, SaveBridge bridge) {
        String signature = featureOne(featureSaveBridgeStubs(patched, bridge.name()), INSTAGRAM_MEDIA + "->" + bridge.name() + "(Object)");
        Method stub = featureMethod(patched, signature);
        List<Instruction> body = instructions(stub);
        requireFeature(!featureSaveIsShipped(stub), signature + " is still the empty stub it ships as, so the Save patch didn't write it");
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && stub.getImplementation() != null
                && stub.getImplementation().getTryBlocks().isEmpty() && body.size() >= 4, signature + " isn't a static bridge with an unprotected body");
        int p = stub.getImplementation().getRegisterCount() - 1;
        boolean primitive = bridge.getter().endsWith(")I");
        requireFeature(body.get(0).getOpcode() == Opcode.CHECK_CAST && registerA(body.get(0)) == p && reference(body.get(0)).equals(bridge.receiver()),
                signature + " casts its argument to " + reference(body.get(0)) + ", not " + bridge.receiver());
        Instruction call = body.get(1);
        requireFeature(call.getOpcode() == bridge.call() && Arrays.equals(invokeRegisters(call), new int[]{p}) && reference(call).equals(bridge.getter()),
                signature + " calls " + call.getOpcode().name + " " + reference(call) + ", not " + bridge.call().name + " " + bridge.getter());
        requireFeature(body.get(2).getOpcode() == (primitive ? Opcode.MOVE_RESULT : Opcode.MOVE_RESULT_OBJECT) && registerA(body.get(2)) == p
                && body.get(3).getOpcode() == (primitive ? Opcode.RETURN : Opcode.RETURN_OBJECT) && registerA(body.get(3)) == p,
                signature + " doesn't return what " + bridge.getter() + " answers");
        return signature;
    }

    /**
     * showRow as the Save patch writes it: straight-line copies, casts, the base modifier's static
     * read and literals into the role, click, style and icon calls Copy link's row is built with,
     * then Threads' row, then return-void. Each of the row's arguments is read back to what it holds:
     * the composer cast to the row's composer type, the click modifier on the base, Copy link's role
     * and the extension's click, the style and the icon built from that composer, the icon with the
     * extension's drawable and Copy link's literals, and the extension's label.
     */
    private static void featureSaveShowRow(Method stub, SaveMediaSites sites) {
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && stub.getImplementation() != null
                && stub.getImplementation().getTryBlocks().isEmpty(), SAVE_SHOW_ROW + " isn't a static method with an unprotected body");
        List<Instruction> body = instructions(stub);
        // The arguments sit at the top of the frame: the composer, the click, the label and the icon.
        int first = stub.getImplementation().getRegisterCount() - 4;
        Map<Integer, String> held = new HashMap<>();
        for (int p = 0; p < 4; p++) held.put(first + p, "p" + p);
        List<String> labels = List.of("role", "click", "style", "icon", "row");
        List<String> calls = new ArrayList<>();
        List<List<String>> passed = new ArrayList<>();
        for (int k = 0; k < body.size(); k++) {
            Instruction i = body.get(k);
            switch (i.getOpcode()) {
                case MOVE: case MOVE_FROM16: case MOVE_16: case MOVE_OBJECT: case MOVE_OBJECT_FROM16: case MOVE_OBJECT_16:
                    held.put(registerA(i), held.get(((TwoRegisterInstruction) i).getRegisterB()));
                    break;
                case CHECK_CAST:
                    held.put(registerA(i), held.get(registerA(i)) + " as " + reference(i));
                    break;
                case SGET_OBJECT:
                    held.put(registerA(i), reference(i));
                    break;
                case CONST_4: case CONST_16: case CONST: case CONST_HIGH16:
                    held.put(registerA(i), String.valueOf(featureSaveConstant(i)));
                    break;
                case INVOKE_STATIC: case INVOKE_STATIC_RANGE:
                    List<String> arguments = new ArrayList<>();
                    for (int register : invokeRegisters(i)) arguments.add(held.get(register));
                    calls.add(reference(i));
                    passed.add(arguments);
                    break;
                case MOVE_RESULT_OBJECT:
                    requireFeature(k > 0 && isStaticInvoke(body.get(k - 1).getOpcode()), SAVE_SHOW_ROW + " takes an answer at instruction " + k + " that no call gave");
                    int call = calls.size() - 1;
                    held.put(registerA(i), (call < labels.size() ? labels.get(call) : calls.get(call)) + "(" + String.join(", ", passed.get(call)) + ")");
                    break;
                case RETURN_VOID:
                    requireFeature(k == body.size() - 1, SAVE_SHOW_ROW + " returns before its last instruction");
                    break;
                default:
                    throw new IllegalArgumentException(SAVE_SHOW_ROW + " runs " + i.getOpcode().name + ", which the Save patch doesn't write");
            }
        }
        requireFeature(!body.isEmpty() && body.get(body.size() - 1).getOpcode() == Opcode.RETURN_VOID, SAVE_SHOW_ROW + " doesn't end in return-void");
        List<String> expectedCalls = List.of(featureSig(sites.role()), featureSig(sites.clickModifier()), featureSig(sites.style()),
                featureSig(sites.icon()), featureSig(sites.row()));
        requireFeature(calls.equals(expectedCalls), SAVE_SHOW_ROW + " calls " + calls + ", not " + expectedCalls);
        String composer = "p0 as " + sites.composerType();
        List<String> click = new ArrayList<>(List.of(sites.base().toString(), "role(" + sites.roleArgument() + ")", "p1"));
        if (sites.clickModifier().getParameterTypes().size() == 5) click.add("0");
        click.add(String.valueOf(sites.enabled()));
        List<String> icon = new ArrayList<>(List.of(composer, "p3"));
        for (int literal : sites.iconArguments()) icon.add(String.valueOf(literal));
        List<String> expected = List.of(composer, "click(" + String.join(", ", click) + ")", "style(" + composer + ")",
                "icon(" + String.join(", ", icon) + ")", "p2");
        List<String> roles = List.of("composer", "modifier", "style", "icon", "label");
        List<String> row = passed.get(4);
        for (int n = 0; n < roles.size(); n++) requireFeature(expected.get(n).equals(row.get(n)),
                SAVE_SHOW_ROW + " passes Copy link's row " + row.get(n) + " as its " + roles.get(n) + ", not " + expected.get(n));
    }

    /** media or activity as the Save patch writes it: the argument cast to the post menu, [field] read off it, and returned. */
    private static void featureSaveReader(Method stub, String menu, FieldReference field, String what) {
        String signature = featureSig(stub);
        List<Instruction> body = instructions(stub);
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && stub.getImplementation() != null
                && stub.getImplementation().getTryBlocks().isEmpty() && body.size() == 3, signature + " isn't the Save patch's three-instruction reader");
        int p = stub.getImplementation().getRegisterCount() - 1;
        requireFeature(body.get(0).getOpcode() == Opcode.CHECK_CAST && registerA(body.get(0)) == p && reference(body.get(0)).equals(menu),
                signature + " casts its argument to " + reference(body.get(0)) + ", not the post menu, " + menu);
        requireFeature(body.get(1).getOpcode() == Opcode.IGET_OBJECT && registerA(body.get(1)) == p && ((TwoRegisterInstruction) body.get(1)).getRegisterB() == p
                && reference(body.get(1)).equals(field.toString()), signature + " reads " + reference(body.get(1)) + ", not " + what + ", " + field);
        requireFeature(body.get(2).getOpcode() == Opcode.RETURN_OBJECT && registerA(body.get(2)) == p, signature + " doesn't return the field it reads");
    }

    /** dismiss as the Save patch writes it: the argument cast to the post menu, its controller read off it, and closed with Copy link's call. */
    private static void featureSaveDismiss(Method stub, SaveMediaSites sites) {
        List<Instruction> body = instructions(stub);
        String menu = sites.menu().getDefiningClass();
        requireFeature(AccessFlags.STATIC.isSet(stub.getAccessFlags()) && stub.getImplementation() != null
                && stub.getImplementation().getTryBlocks().isEmpty() && body.size() == 4, SAVE_DISMISS + " isn't the Save patch's four-instruction close");
        int p = stub.getImplementation().getRegisterCount() - 1;
        requireFeature(body.get(0).getOpcode() == Opcode.CHECK_CAST && registerA(body.get(0)) == p && reference(body.get(0)).equals(menu),
                SAVE_DISMISS + " casts its argument to " + reference(body.get(0)) + ", not the post menu, " + menu);
        requireFeature(body.get(1).getOpcode() == Opcode.IGET_OBJECT && registerA(body.get(1)) == p && ((TwoRegisterInstruction) body.get(1)).getRegisterB() == p
                && reference(body.get(1)).equals(sites.controller().toString()),
                SAVE_DISMISS + " reads " + reference(body.get(1)) + ", not the menu's controller, " + sites.controller());
        requireFeature(body.get(2).getOpcode() == Opcode.INVOKE_VIRTUAL && Arrays.equals(invokeRegisters(body.get(2)), new int[]{p})
                && reference(body.get(2)).equals(featureSig(sites.dismiss())),
                SAVE_DISMISS + " calls " + reference(body.get(2)) + ", not Copy link's close, " + featureSig(sites.dismiss()));
        requireFeature(body.get(3).getOpcode() == Opcode.RETURN_VOID, SAVE_DISMISS + " doesn't return right after closing the menu");
    }

    /** Whether [stub] is still the empty stub it ships as: return-void, or a zero returned. */
    private static boolean featureSaveIsShipped(Method stub) {
        if (stub.getImplementation() == null) return false;
        List<Instruction> body = instructions(stub);
        return stub.getReturnType().equals("V")
                ? body.size() == 1 && body.get(0).getOpcode() == Opcode.RETURN_VOID
                : body.size() == 2 && java.util.Objects.equals(featureSaveConstant(body.get(0)), 0) && body.get(0).getOpcode() == Opcode.CONST_4
                        && body.get(1).getOpcode() == (kindOf(stub.getReturnType()) == 'L' ? Opcode.RETURN_OBJECT : Opcode.RETURN)
                        && registerA(body.get(0)) == registerA(body.get(1));
    }

    /** [signature], when the extension has it, still the empty stub it ships as. */
    private static void featureSaveShipped(Map<String, List<Method>> patched, String signature) {
        if (!patched.containsKey(signature)) return;
        requireFeature(featureSaveIsShipped(featureMethod(patched, signature)), "omitted Save wrote " + signature);
    }

    /**
     * Left out, Save photos and videos makes no call to add, leaves the post menu lambdas that check
     * for Copy link as Threads wrote them, and leaves showRow, media, activity, dismiss and every
     * static method on InstagramMedia, its bridges, when the extension has them, the empty stubs
     * they ship as.
     */
    private static void featureOmittedSaveMedia(Map<String, List<Method>> clean, Map<String, List<Method>> patched) {
        featureHostCalls(patched, ADD_SAVE_ROW, Map.of());
        String copyLink = featureSaveCopyLink(clean);
        featurePreserveTargets(clean, patched, m -> !m.getDefiningClass().startsWith(OWN) && m.getImplementation() != null
                && holdsNote(m, MENU_NOTE) && !featureSaveChecks(m, copyLink).isEmpty());
        for (String stub : List.of(SAVE_SHOW_ROW, SAVE_MEDIA_OF, SAVE_ACTIVITY_OF, SAVE_DISMISS)) featureSaveShipped(patched, stub);
        for (String stub : featureSaveBridgeSigs(patched)) featureSaveShipped(patched, stub);
    }

    private static void featureOmitted(String feature, Map<String, List<Method>> clean, Map<String, List<Method>> patched,
            File cleanApk, File patchedApk) throws Exception {
        switch (feature) {
            case "hideSuggestedUsers": featureOmittedSuggested(clean, patched, cleanApk, patchedApk); break;
            case "hideAds":
                featureFalseStub(patched, ADS + "isAd(Ljava/lang/Object;)Z", true);
                featurePreserveTargets(clean, patched, m -> m.getDefiningClass().equals(MEDIA)
                        || m.getReturnType().equals("Z") && instructions(m).stream().anyMatch(i -> i instanceof WideLiteralInstruction
                                && (int) ((WideLiteralInstruction) i).getWideLiteral() == 0x8669a9b0)
                        || m.getDefiningClass().equals(PERMALINK_AD_FETCHER));
                featureHostCalls(patched, PERMALINK_ADS, Map.of());
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
                Method browserLauncher = featureTarget(clean, m -> holds(m, LAUNCHER_MESSAGE), "omitted browser launcher");
                BrowserSites browsers = featureBrowserSites(clean, browserLauncher);
                Set<String> browserMethods = new HashSet<>(List.of(featureSig(browserLauncher)));
                for (BrowserSite site : browsers.hooks()) browserMethods.add(featureSig(site.stock()));
                for (Method kept : browsers.kept()) browserMethods.add(featureSig(kept));
                featurePreserveTargets(clean, patched, m -> browserMethods.contains(featureSig(m)));
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
                featureHostCalls(patched, OPEN_REFUSED_TILE, Map.of());
                featurePreserveTargets(clean, patched, m -> !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getApkContentsSigners()[Landroid/content/pm/Signature;").isEmpty()
                        && !callSites(instructions(m), "Landroid/content/pm/SigningInfo;->getSigningCertificateHistory()[Landroid/content/pm/Signature;").isEmpty());
                featurePreserveTargets(clean, patched, DexDiff::featureIsShareTiles);
                break;
            case "returnRefresh": featureOmittedReturnRefresh(clean, patched); break;
            case "disableVideoAutoplay": featureOmittedVideoAutoplay(clean, patched); break;
            case "pureBlack": featureOmittedPureBlack(clean, patched); break;
            case "saveMedia": featureOmittedSaveMedia(clean, patched); break;
            case "settingsRow": featureOmittedSettingsRow(clean, patched); break;
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
                // The settings row has no status: HushThreads settings adds it, and every other patch
                // depends on that one (verify-injected-registers.ps1 counts a selected patch's
                // dependencies as selected). Without a selection, the row belongs to every bundle
                // whose extension carries it, and a bundle whose extension has none came before the
                // row and is read as leaving it out, the way bundles from before Open links in browser are.
                if (feature.equals("settingsRow")) {
                    if (selected == null && !hasPayload) {
                        System.out.println("[diff] threads-feature " + feature + ": no feature payload");
                        continue;
                    }
                    boolean on = selected != null ? selected.contains(feature) : patched.containsKey(ADD_ROW);
                    if (on || hasPayload) {
                        if (clean == null) clean = featureMethods(cleanApk, parents);
                        if (on) featureSettingsRow(clean, patched, patchedApk);
                        else featureOmitted(feature, clean, patched, cleanApk, patchedApk);
                    }
                    System.out.println("[diff] threads-feature " + feature + ": " + (on ? "verified" : "omitted"));
                    continue;
                }
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
                if (!hasStatus && selected == null && (feature.equals("hideSuggestedUsers") || feature.equals("openLinksExternally")
                        || feature.equals("returnRefresh") || feature.equals("disableVideoAutoplay") || feature.equals("pureBlack")
                        || feature.equals("saveMedia"))) {
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
                    case "returnRefresh": featureReturnRefresh(clean, patched); break;
                    case "disableVideoAutoplay": featureVideoAutoplay(clean, patched); break;
                    case "pureBlack": featurePureBlack(clean, patched); break;
                    case "saveMedia": featureSaveMedia(clean, patched, cleanApk, patchedApk); break;
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
