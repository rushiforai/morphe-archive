import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
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
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collection;
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
 * these catch the known shapes without a phone.
 *
 *   java -cp &lt;cli jar&gt; DexDiff.java &lt;cleanApk&gt; &lt;patchedApk&gt; &lt;reportFile&gt;
 *       &lt;removalAllowlist&gt; [&lt;contracts&gt;]
 */
public class DexDiff {

    /** Anything under here is the bundle's own code rather than the host's. */
    private static final String OWN = "Lapp/hushpinterest/extension/";

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

    private static final Map<String, Integer> MUTATION_COLUMNS = Map.ofEntries(
            Map.entry("feed", 4), Map.entry("views", 3), Map.entry("guard", 2), Map.entry("refresh", 2), Map.entry("draw", 2), Map.entry("drawWash", 4), Map.entry("builtView", 3),
            Map.entry("navigation", 2), Map.entry("menu", 2), Map.entry("downloads", 2), Map.entry("comments", 7), Map.entry("closeupModule", 4),
            Map.entry("links", 6), Map.entry("analytics", 5), Map.entry("answers", 4), Map.entry("imageOrder", 1), Map.entry("closeupImage", 2), Map.entry("pageImage", 1), Map.entry("originalRetry", 1), Map.entry("topicSuggestions", 2), Map.entry("inboxUpdates", 3), Map.entry("feedbackFlyout", 2), Map.entry("recentSearchRows", 2), Map.entry("recentSearchHeading", 2), Map.entry("boardMenu", 1), Map.entry("settings", 4),
            Map.entry("longPress", 4), Map.entry("surveyPrompts", 2), Map.entry("popupBanners", 1), Map.entry("relatedPins", 3), Map.entry("creatorName", 1), Map.entry("saveSound", 1), Map.entry("pinInvites", 2), Map.entry("browserId", 2), Map.entry("likeHistory", 2), Map.entry("commentHistory", 2), Map.entry("signInFailure", 3), Map.entry("saveAndDownload", 3), Map.entry("homePage", 3), Map.entry("seenPins", 4),
            Map.entry("firebaseCertificate", 1), Map.entry("closeupButtons", 3), Map.entry("closeupSearchLabel", 1),
            Map.entry("closeupRemix", 2), Map.entry("closeupActionBar", 2), Map.entry("closeupVisitSite", 2), Map.entry("closeupSaveButton", 1), Map.entry("postedDate", 1),
            Map.entry("saveSheet", 1), Map.entry("suggestedBoard", 1), Map.entry("boardListHeight", 1), Map.entry("boardOrder", 2),
            Map.entry("pinVideoAutoplay", 1), Map.entry("pinVideoSound", 1), Map.entry("pinchZoom", 1),
            Map.entry("blackSheets", 3), Map.entry("blackBoards", 7),
            Map.entry("longPressChoices", 1), Map.entry("longPressView", 2), Map.entry("savedElsewhere", 3), Map.entry("homeBack", 1), Map.entry("offlineBanner", 1), Map.entry("refreshPill", 1),
            Map.entry("downloadToasts", 1),
            Map.entry("blackToasts", 1), Map.entry("blackButtons", 1), Map.entry("blackSearchGuides", 1), Map.entry("blackSettingsCard", 1), Map.entry("blackSearchBubbles", 1),
            Map.entry("homeTabs", 1),
            Map.entry("searchLanding", 1), Map.entry("searchSuggestions", 1), Map.entry("experimentGroup", 1),
            Map.entry("searchKeyboard", 1),
            Map.entry("pinMenuRows", 2),
            Map.entry("boardTabHeader", 1),
            Map.entry("boardTabCovers", 1),
            Map.entry("closeupGate", 1), Map.entry("highlightRing", 1), Map.entry("visualSearchThumbnails", 1), Map.entry("relatedPinsFold", 3), Map.entry("screenSleep", 3), Map.entry("ownAuthorities", 1), Map.entry("reportedPackage", 1),
            Map.entry("fontResource", 1));

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
            if (line.startsWith("family|") || line.startsWith("mutation|")) {
                String[] columns = line.split("\\|", -1);
                boolean family = columns[0].equals("family");
                int mutationValues = columns.length - 3;
                boolean validMutation = family || (columns[2].equals("guard") ? mutationValues >= 2 && mutationValues % 2 == 0
                        : columns[2].equals("builtView") ? mutationValues >= 3 && mutationValues % 3 == 0
                        : MUTATION_COLUMNS.getOrDefault(columns[2], -1) == mutationValues);
                // A family's capability column may be empty: a patch applied whole, whose own installed
                // flag a mutation rule may name when it changes bytecode too.
                if ((family && columns.length != 4) || (!family && columns.length < 4)
                        || Arrays.stream(columns).limit(family ? 3 : columns.length).anyMatch(String::isBlank)
                        || !columns[1].matches("[A-Za-z][A-Za-z0-9]*(,[A-Za-z][A-Za-z0-9]*)*")
                        || (family && !columns[3].matches("([A-Za-z][A-Za-z0-9]*(,[A-Za-z][A-Za-z0-9]*)*)?"))
                        || !validMutation) {
                    throw new IllegalArgumentException("Invalid contract line " + lineNumber + ": invalid feature columns");
                }
                contracts.add(new Contract(columns[0], columns[1], columns[2], null, null,
                        Arrays.asList(columns).subList(3, columns.length), null, null));
                continue;
            }
            String[] parts = line.split("\\s+");
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
            } else if (contract.picks()) {
                pickRules.add(contract);
                holders.put(contract, new ArrayList<>());
                pickStrings.addAll(contract.strings);
                hookCallers.put(contract.callee, new ArrayList<>());
            }
        }
        MultiDexContainer<? extends DexFile> container =
                DexFileFactory.loadDexContainer(apk, null);
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
            if (contract.kind.equals("family") || contract.kind.equals("mutation")) continue;
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
        MultiDexContainer<? extends DexFile> container = DexFileFactory.loadDexContainer(clean, null);
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
                DexFileFactory.loadDexContainer(apk, null);
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
                DexFileFactory.loadDexContainer(apk, null);
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
                DexFileFactory.loadDexContainer(apk, null);
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

    /**
     * Compiled contracts use the clean target, never a hook's own presence, to locate callers.
     *
     * <p>The index holds the classes*.dex at the APK's root alone, the app's own code and all the
     * patcher reads. 14.43.0 added Facebook's Audience Network as assets/audience_network/classes.dex,
     * which its SDK loads for itself at run time: 13 Intent.putExtra and one ClipData.newPlainText
     * call there read as link tracking boundaries the patch had skipped. Every entry still counts in
     * the body comparison, so a change to that dex is caught there.
     */
    private static final class FeatureIndex {
        final Map<String, ClassDef> classes = new LinkedHashMap<>();
        final Map<String, Method> methods = new LinkedHashMap<>();
        final Set<String> duplicates = new HashSet<>();
        final Map<String, Set<String>> texts = new HashMap<>();
        final Map<String, Set<String>> classTexts = new HashMap<>();
        final Map<String, List<FeatureSite>> ownCalls = new LinkedHashMap<>();

        FeatureIndex(File apk) throws Exception {
            MultiDexContainer<? extends DexFile> container = DexFileFactory.loadDexContainer(apk, null);
            for (String entry : container.getDexEntryNames()) if (entry.matches("classes\\d*\\.dex")) for (ClassDef cd : container.getEntry(entry).getDexFile().getClasses()) {
                if (classes.putIfAbsent(cd.getType(), cd) != null) duplicates.add(cd.getType());
                for (Method m : cd.getMethods()) {
                    String key = m.toString();
                    if (methods.putIfAbsent(key, m) != null) duplicates.add(key);
                    Set<String> strings = new HashSet<>();
                    if (m.getImplementation() != null) {
                        int at = 0;
                        for (Instruction i : m.getImplementation().getInstructions()) {
                            Reference r = reference(i);
                            if (r instanceof StringReference) strings.add(((StringReference) r).getString());
                            if (!cd.getType().startsWith(OWN) && r instanceof MethodReference && r.toString().startsWith(OWN)) {
                                ownCalls.computeIfAbsent(r.toString(), k -> new ArrayList<>()).add(new FeatureSite(m, at));
                            }
                            at++;
                        }
                    }
                    texts.put(key, strings);
                    classTexts.computeIfAbsent(cd.getType(), k -> new HashSet<>()).addAll(strings);
                }
            }
        }

        List<Method> holding(String text) {
            List<Method> out = new ArrayList<>();
            for (Method m : methods.values()) if (!m.getDefiningClass().startsWith(OWN)
                    && texts.get(m.toString()).contains(text)) out.add(m);
            return out;
        }

        List<ClassDef> classesHolding(String text) {
            List<ClassDef> out = new ArrayList<>();
            for (ClassDef cd : classes.values()) if (!cd.getType().startsWith(OWN)
                    && classTexts.getOrDefault(cd.getType(), Set.of()).contains(text)) out.add(cd);
            return out;
        }
    }

    private static final class FeatureSite {
        final Method method;
        final int at;
        FeatureSite(Method method, int at) { this.method = method; this.at = at; }
        String key() { return method + "@" + at; }
    }

    private static final class FeatureEdits {
        final Set<Integer> removed = new HashSet<>();
        final Map<Integer, Instruction> replacements = new HashMap<>();
    }

    /** Executable successors, including switch cases and only the handlers an instruction can reach. */
    private static final class FeatureFlow {
        final Layout layout;
        final int registers;
        final Map<Integer, Object> parameters = new HashMap<>();
        final List<List<Integer>> normal = new ArrayList<>();
        final List<List<Integer>> handlers = new ArrayList<>();
        final Map<Integer, Integer> indexAt = new HashMap<>();
        final BitSet loopEntries = new BitSet();

        FeatureFlow(Method m) {
            layout = new Layout(m.getImplementation());
            registers = m.getImplementation().getRegisterCount();
            int parameter = registers;
            List<? extends CharSequence> types = m.getParameterTypes();
            for (int n = types.size() - 1; n >= 0; n--) {
                String type = types.get(n).toString();
                boolean wide = type.equals("J") || type.equals("D");
                parameter -= wide ? 2 : 1;
                if (parameter < 0) break; // Structural validation reports malformed parameter layouts.
                if (wide) {
                    parameters.put(parameter, new WideValue(null, parameter));
                    parameters.put(parameter + 1, new HighHalf(parameter));
                } else if (type.startsWith("L") || type.startsWith("[")) parameters.put(parameter, new ObjectValue(parameter, false));
            }
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) && parameter > 0) parameters.put(parameter - 1, new ObjectValue(parameter - 1, true));
            for (int at = 0; at < layout.instructions.size(); at++) indexAt.put(layout.addresses.get(at), at);
            for (int at = 0; at < layout.instructions.size(); at++) {
                Instruction i = layout.instructions.get(at);
                int address = layout.addresses.get(at);
                List<Integer> next = new ArrayList<>();
                List<Integer> caught = new ArrayList<>();
                if (i.getOpcode().canContinue()) add(next, address + i.getCodeUnits());
                if (i instanceof OffsetInstruction && i.getOpcode() != Opcode.FILL_ARRAY_DATA) {
                    int target = address + ((OffsetInstruction) i).getCodeOffset();
                    if (i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) {
                        Instruction payload = layout.byAddress.get(target);
                        if (payload instanceof SwitchPayload) for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements())
                            add(next, address + element.getOffset());
                    } else add(next, target);
                }
                if (i.getOpcode().canThrow()) for (TryBlock<? extends ExceptionHandler> block : m.getImplementation().getTryBlocks()) {
                    if (address < block.getStartCodeAddress() || address >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
                    for (ExceptionHandler handler : block.getExceptionHandlers()) add(caught, handler.getHandlerCodeAddress());
                }
                normal.add(next);
                handlers.add(caught);
                for (int target : next) if (target <= at) loopEntries.set(target);
            }
        }

        void add(List<Integer> into, int address) {
            Integer index = indexAt.get(address);
            if (index != null && !isPayload(layout.instructions.get(index))) into.add(index);
        }

        BitSet reachable(int start, boolean exceptions) {
            BitSet reached = new BitSet();
            Deque<Integer> work = new ArrayDeque<>();
            if (start >= 0 && start < normal.size()) work.add(start);
            while (!work.isEmpty()) {
                int at = work.poll();
                if (reached.get(at)) continue;
                reached.set(at);
                work.addAll(normal.get(at));
                if (exceptions) work.addAll(handlers.get(at));
            }
            return reached;
        }

        private record ObjectValue(int alias, boolean nonNull) {}
        private record WideValue(Long bits, int alias) {}
        private record HighHalf(int low) {}
        private record ControlState(int at, Map<Integer, Object> values, boolean controlled) {}
        private record ControlPoint(int at, boolean controlled) {}

        static int valueRegister(Instruction i) { return ((OneRegisterInstruction) i).getRegisterA(); }

        /** Normal paths after this control answers false. Unknown inputs explore both arms, not a proof of all paths. */
        BitSet afterControl(int call) {
            List<Instruction> body = layout.instructions;
            Reference ref = reference(body.get(call));
            if (!(ref instanceof MethodReference) || !((MethodReference) ref).getReturnType().equals("Z")
                    || call + 1 >= body.size() || body.get(call + 1).getOpcode() != Opcode.MOVE_RESULT)
                return reachable(call + 1, false);
            BitSet reached = new BitSet();
            Set<ControlState> seen = new HashSet<>();
            Map<ControlPoint, Map<Integer, Object>> loops = new HashMap<>();
            Deque<ControlState> work = new ArrayDeque<>();
            work.add(new ControlState(0, Map.copyOf(parameters), false));
            while (!work.isEmpty()) {
                ControlState state = work.poll();
                if (loopEntries.get(state.at)) {
                    ControlPoint point = new ControlPoint(state.at, state.controlled);
                    Map<Integer, Object> previous = loops.get(point);
                    // A changing loop value becomes unknown once and stays unknown. Stable booleans survive.
                    Map<Integer, Object> joined = new HashMap<>(previous == null ? state.values : previous);
                    Map<Integer, Object> incoming = state.values;
                    joined.entrySet().removeIf(entry -> {
                        Object before = entry.getValue(), after = incoming.get(entry.getKey());
                        if (before.equals(after)) return false;
                        if ((before instanceof ObjectValue || Integer.valueOf(0).equals(before))
                                && (after instanceof ObjectValue || Integer.valueOf(0).equals(after))) {
                            entry.setValue(new ObjectValue(-1, before instanceof ObjectValue a && a.nonNull
                                    && after instanceof ObjectValue b && b.nonNull));
                            return false;
                        }
                        if (before instanceof WideValue && after instanceof WideValue) {
                            entry.setValue(new WideValue(null, -1));
                            return false;
                        }
                        return true;
                    });
                    Map<Integer, Object> values = Map.copyOf(joined);
                    loops.put(point, values);
                    state = new ControlState(state.at, values, state.controlled);
                }
                if (!seen.add(state)) continue;
                int at = state.at;
                Instruction i = body.get(at);
                boolean controlled = state.controlled || at == call + 1;
                if (controlled) reached.set(at);
                Map<Integer, Object> values = state.values;
                if (i.getOpcode().setsRegister()) {
                    // A widened value is initialized but has no stable identity. Give a copied
                    // source a fresh identity before clobbering overlapping destinations.
                    if (i instanceof TwoRegisterInstruction copy) {
                        int source = copy.getRegisterB();
                        Object value = values.get(source), replacement = null;
                        if (i.getOpcode().name.startsWith("move-object") && value instanceof ObjectValue object && object.alias < 0)
                            replacement = new ObjectValue(nextAlias(values), object.nonNull);
                        if (i.getOpcode().name.startsWith("move-wide") && wide(values, source) instanceof WideValue wide
                                && wide.bits == null && wide.alias < 0)
                            replacement = new WideValue(null, nextAlias(values));
                        if (replacement != null) {
                            values = new HashMap<>(values);
                            values.put(source, replacement);
                        }
                    }
                    int destination = valueRegister(i);
                    Map<Integer, Object> written = new HashMap<>(values);
                    forget(written, destination);
                    if (i.getOpcode().setsWideRegister()) {
                        forget(written, destination + 1);
                        WideValue value = wideValue(i, values);
                        if (value == null && !i.getOpcode().name.startsWith("move-wide")) value = new WideValue(null, nextAlias(values));
                        if (value != null && destination >= 0 && destination + 1 < registers) {
                            written.put(destination, value);
                            written.put(destination + 1, new HighHalf(destination));
                        }
                    } else if (at == call + 1) written.put(destination, 0);
                    else if (copiesConflict(i.getOpcode())) {
                        int sourceRegister = ((TwoRegisterInstruction) i).getRegisterB();
                        Object source = values.get(sourceRegister);
                        boolean objectMove = i.getOpcode().name.startsWith("move-object");
                        if (objectMove ? source instanceof ObjectValue || Integer.valueOf(0).equals(source)
                                : source instanceof Integer) written.put(destination, source);
                    } else if (i instanceof NarrowLiteralInstruction && i.getOpcode().name.startsWith("const"))
                        written.put(destination, ((NarrowLiteralInstruction) i).getNarrowLiteral());
                    else if (i.getOpcode() == Opcode.CHECK_CAST) {
                        if (values.containsKey(destination)) written.put(destination, values.get(destination));
                    } else if (i.getOpcode().name.contains("object") || i.getOpcode() == Opcode.NEW_INSTANCE
                            || i.getOpcode() == Opcode.NEW_ARRAY || i.getOpcode() == Opcode.CONST_STRING
                            || i.getOpcode() == Opcode.CONST_STRING_JUMBO || i.getOpcode() == Opcode.CONST_CLASS)
                        written.put(destination, new ObjectValue(nextAlias(values), i.getOpcode().name.startsWith("new-") || i.getOpcode().name.startsWith("const-")));
                    else {
                        Integer value = integerValue(i, values);
                        if (value != null) written.put(destination, value);
                    }
                    values = Map.copyOf(written);
                }
                if ((i.getOpcode().name.startsWith("div-int") || i.getOpcode().name.startsWith("rem-int"))
                        && Integer.valueOf(0).equals(integerRight(i, state.values))) continue;
                Integer chosen = null;
                Boolean taken = branchTaken(i, values);
                if (taken != null) chosen = taken
                        ? indexAt.getOrDefault(layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset(), -1) : at + 1;
                else if ((i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) && integer(values.get(valueRegister(i))) != null) {
                    chosen = at + 1;
                    Instruction payload = layout.byAddress.get(layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset());
                    if (payload instanceof SwitchPayload) for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements())
                        if (element.getKey() == integer(values.get(valueRegister(i)))) chosen = indexAt.getOrDefault(layout.addresses.get(at) + element.getOffset(), -1);
                }
                for (int next : normal.get(at)) if (chosen == null || chosen == next)
                    work.add(new ControlState(next, values, controlled));
            }
            return reached;
        }

        /** Alias numbers name equal values within one state, never object allocation sites across iterations. */
        static int nextAlias(Map<Integer, Object> values) {
            Set<Integer> used = new HashSet<>();
            for (Object value : values.values()) {
                if (value instanceof ObjectValue object) used.add(object.alias);
                if (value instanceof WideValue wide && wide.bits == null) used.add(wide.alias);
            }
            int next = 0;
            while (used.contains(next)) next++;
            return next;
        }

        static void forget(Map<Integer, Object> values, int register) {
            Object old = values.remove(register);
            if (old instanceof WideValue) values.remove(register + 1);
            if (old instanceof HighHalf high) values.remove(high.low);
        }

        static WideValue wide(Map<Integer, Object> values, int register) {
            return values.get(register) instanceof WideValue value && new HighHalf(register).equals(values.get(register + 1)) ? value : null;
        }

        static WideValue wideValue(Instruction i, Map<Integer, Object> values) {
            if (i.getOpcode().name.startsWith("const-wide")) return new WideValue(((WideLiteralInstruction) i).getWideLiteral(), -1);
            if (i instanceof TwoRegisterInstruction pair) {
                if (i.getOpcode().name.startsWith("move-wide")) return wide(values, pair.getRegisterB());
                Integer source = integer(values.get(pair.getRegisterB()));
                if (source != null && i.getOpcode() == Opcode.INT_TO_LONG) return new WideValue(source.longValue(), -1);
                if (source != null && i.getOpcode() == Opcode.INT_TO_DOUBLE) return new WideValue(Double.doubleToRawLongBits(source.doubleValue()), -1);
            }
            return null;
        }

        static Integer integer(Object value) { return value instanceof Integer scalar ? scalar : null; }

        static Integer integerRight(Instruction i, Map<Integer, Object> values) {
            if (i instanceof NarrowLiteralInstruction) return ((NarrowLiteralInstruction) i).getNarrowLiteral();
            if (i instanceof ThreeRegisterInstruction) return integer(values.get(((ThreeRegisterInstruction) i).getRegisterC()));
            return i instanceof TwoRegisterInstruction ? integer(values.get(((TwoRegisterInstruction) i).getRegisterB())) : null;
        }

        /** Exact 32-bit scalar operations. Unsupported writes and unknown operands discard the destination. */
        static Integer integerValue(Instruction i, Map<Integer, Object> values) {
            if (i.getOpcode() == Opcode.CMP_LONG || i.getOpcode() == Opcode.CMPL_DOUBLE || i.getOpcode() == Opcode.CMPG_DOUBLE) {
                ThreeRegisterInstruction comparison = (ThreeRegisterInstruction) i;
                WideValue first = wide(values, comparison.getRegisterB()), second = wide(values, comparison.getRegisterC());
                if (first == null || second == null) return null;
                if (i.getOpcode() == Opcode.CMP_LONG && (comparison.getRegisterB() == comparison.getRegisterC()
                        || first.equals(second) && (first.bits != null || first.alias >= 0))) return 0;
                if (first.bits == null || second.bits == null) return null;
                if (i.getOpcode() == Opcode.CMP_LONG) return Long.compare(first.bits, second.bits);
                double a = Double.longBitsToDouble(first.bits), b = Double.longBitsToDouble(second.bits);
                if (Double.isNaN(a) || Double.isNaN(b)) return i.getOpcode() == Opcode.CMPL_DOUBLE ? -1 : 1;
                return a == b ? 0 : a < b ? -1 : 1;
            }
            if (i instanceof TwoRegisterInstruction) {
                Integer source = integer(values.get(((TwoRegisterInstruction) i).getRegisterB()));
                if (source != null) switch (i.getOpcode()) {
                    case NEG_INT: return -source;
                    case NOT_INT: return ~source;
                    case INT_TO_BYTE: return (int) (byte) source.intValue();
                    case INT_TO_CHAR: return (int) (char) source.intValue();
                    case INT_TO_SHORT: return (int) (short) source.intValue();
                    default: break;
                }
            }
            int leftRegister;
            if (i instanceof ThreeRegisterInstruction) leftRegister = ((ThreeRegisterInstruction) i).getRegisterB();
            else if (i instanceof TwoRegisterInstruction && i.getOpcode().name.endsWith("/2addr")) leftRegister = valueRegister(i);
            else if (i instanceof TwoRegisterInstruction && i instanceof NarrowLiteralInstruction)
                leftRegister = ((TwoRegisterInstruction) i).getRegisterB();
            else return null;
            Integer first = integer(values.get(leftRegister));
            Integer second = integerRight(i, values);
            String operation = i.getOpcode().name.split("/", 2)[0];
            if (operation.equals("and-int") && (Integer.valueOf(0).equals(first) || Integer.valueOf(0).equals(second))) return 0;
            if (operation.equals("or-int") && (Integer.valueOf(-1).equals(first) || Integer.valueOf(-1).equals(second))) return -1;
            if ((operation.equals("xor-int") || operation.equals("sub-int")) && !(i instanceof NarrowLiteralInstruction)) {
                int rightRegister = i instanceof ThreeRegisterInstruction ? ((ThreeRegisterInstruction) i).getRegisterC()
                        : ((TwoRegisterInstruction) i).getRegisterB();
                if (leftRegister == rightRegister) return 0;
            }
            if (first == null || second == null) return null;
            return switch (operation) {
                case "add-int" -> first + second;
                case "sub-int" -> first - second;
                case "rsub-int" -> second - first;
                case "mul-int" -> first * second;
                case "div-int" -> second == 0 ? null : first / second;
                case "rem-int" -> second == 0 ? null : first % second;
                case "and-int" -> first & second;
                case "or-int" -> first | second;
                case "xor-int" -> first ^ second;
                case "shl-int" -> first << second;
                case "shr-int" -> first >> second;
                case "ushr-int" -> first >>> second;
                default -> null;
            };
        }

        static Boolean branchTaken(Instruction i, Map<Integer, Object> values) {
            if (!i.getOpcode().name.startsWith("if-")) return null;
            Object firstValue = values.get(valueRegister(i));
            Object secondValue = i instanceof TwoRegisterInstruction ? values.get(((TwoRegisterInstruction) i).getRegisterB()) : Integer.valueOf(0);
            if (i.getOpcode() == Opcode.IF_EQ || i.getOpcode() == Opcode.IF_EQZ || i.getOpcode() == Opcode.IF_NE || i.getOpcode() == Opcode.IF_NEZ) {
                Boolean equal = null;
                if (firstValue instanceof ObjectValue first && secondValue instanceof ObjectValue second
                        && (first.alias >= 0 && first.alias == second.alias || i instanceof TwoRegisterInstruction pair
                        && pair.getRegisterA() == pair.getRegisterB())) equal = true;
                else if (firstValue instanceof ObjectValue first && first.nonNull && Integer.valueOf(0).equals(secondValue)
                        || secondValue instanceof ObjectValue second && second.nonNull && Integer.valueOf(0).equals(firstValue)) equal = false;
                if (equal != null) return (i.getOpcode() == Opcode.IF_EQ || i.getOpcode() == Opcode.IF_EQZ) == equal;
            }
            Integer first = integer(firstValue), second = integer(secondValue);
            if (first == null || second == null) return null;
            int compared = Integer.compare(first, second);
            return switch (i.getOpcode()) {
                case IF_EQ, IF_EQZ -> compared == 0;
                case IF_NE, IF_NEZ -> compared != 0;
                case IF_LT, IF_LTZ -> compared < 0;
                case IF_LE, IF_LEZ -> compared <= 0;
                case IF_GT, IF_GTZ -> compared > 0;
                case IF_GE, IF_GEZ -> compared >= 0;
                default -> null;
            };
        }
    }

    private static Reference reference(Instruction i) {
        return i instanceof ReferenceInstruction ? ((ReferenceInstruction) i).getReference() : null;
    }

    private static List<Integer> arguments(Instruction i) {
        List<Integer> out = new ArrayList<>();
        for (int register : invokeRegisters(i)) out.add(register);
        return out;
    }

    private static String descriptor(MethodReference m) {
        StringBuilder b = new StringBuilder("(");
        for (CharSequence p : m.getParameterTypes()) b.append(p);
        return b.append(')').append(m.getReturnType()).toString();
    }

    private static final class FeatureCheck {
        static final String BASE = "Lapp/hushpinterest/extension/pinterest/";
        static final String STATUS = BASE + "settings/SettingsStatus;";
        static final String PIN_MENU = "Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;";
        static final String TOAST_CONTAINER = "Lcom/pinterest/gestalt/toast/PinterestToastContainer;";
        static final String TOAST_VIEW = "Lcom/pinterest/gestalt/toast/BaseGestaltToast;";
        static final String HOME_FEED_FRAGMENT = "Lcom/pinterest/feature/home/mainfeed/HomeFeedFragment;";
        static final String EDUCATION_CONTAINER = "Lcom/pinterest/education/view/EducationNewContainerView;";
        static final String BANNER_OVERLAY = "Lcom/pinterest/gestalt/bannerOverlay/GestaltBannerOverlay;";
        static final Set<String> RELATED_PIN_GETTERS = Set.of("getRelatedPinsPagedList", "getFilteredRelatedPinsPagedList");
        static final String RELATED_REFINEMENT_GETTER = "getCloseupRefinementPresenterDelegate";
        static final String CREATOR_ATTRIBUTION = "Lcom/pinterest/activity/pin/view/PinCloseupCreatorAttributionView;";
        static final String GESTALT_AVATAR = "Lcom/pinterest/gestalt/avatar/GestaltAvatar;";
        static final long HOME_AWAY_MS = 300_000L;
        static final Set<String> SAVE_TOAST_STRINGS = Set.of("saved_to", "saved_onto_board_bold", "pinned", "pinned_multiple", "pinned_multiple_to_board",
                "multi_board_save_saved_to_profile", "saved_onto_board", "saved_to_board_section", "saved_multiple_to_board_section", "pin_saved");
        static final String TOAST_MAKE = "Landroid/widget/Toast;->makeText";
        static final String MEDIA_PLAYER_CREATE = "Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;";
        static final String KEEP_SCREEN_ON = "Landroid/view/View;->setKeepScreenOn(Z)V";
        /** The view's screen hold, then a window's flags added and set under a mask, in the screenSleep rule's hook order. */
        static final List<String> SCREEN_HOLDS = List.of(KEEP_SCREEN_ON, "Landroid/view/Window;->addFlags(I)V",
                "Landroid/view/Window;->setFlags(II)V");
        static final Set<String> TOAST_SHAPES = Set.of("(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;",
                "(Landroid/content/Context;II)Landroid/widget/Toast;");
        final FeatureIndex clean;
        final FeatureIndex patched;
        final List<String> findings = new ArrayList<>();
        final Map<String, Boolean> flags = new LinkedHashMap<>();
        final Map<String, String> owners = new LinkedHashMap<>();
        /** Installed flags of the families with no capability, applied whole or not at all. */
        final Set<String> wholeFamilies = new HashSet<>();
        final Map<String, FeatureEdits> edits = new LinkedHashMap<>();
        final Set<String> claimed = new HashSet<>();
        final Set<String> selected;
        final Map<String, FeatureFlow> flows = new HashMap<>();
        final Map<String, Set<String>> controlCallers = new HashMap<>();
        final Map<String, List<Method>> callbacks = new HashMap<>();
        final Set<String> controlMethods = new HashSet<>();
        final Set<String> checkedControls = new HashSet<>();
        List<Method> saveReaders;
        boolean featureControls;
        /** The round long-press menu's icon class, button model, button factory and styler, once [longPress] resolved them. */
        String[] longPressButton;

        static int firstRegister(Instruction i) {
            return i instanceof OneRegisterInstruction ? ((OneRegisterInstruction) i).getRegisterA() : DexDiff.firstRegister(i);
        }

        FeatureCheck(FeatureIndex clean, FeatureIndex patched, Set<String> selected) {
            this.clean = clean;
            this.patched = patched;
            this.selected = selected;
            indexControls();
        }

        void fail(String reason) { findings.add("contract: feature " + reason); }
        boolean flag(String name) { return flags.getOrDefault(name, false); }

        FeatureFlow flow(Method m) { return flows.computeIfAbsent(m.toString(), key -> new FeatureFlow(m)); }

        static boolean controlReference(Reference r) {
            if (r instanceof FieldReference) {
                String owner = ((FieldReference) r).getDefiningClass();
                return owner.equals(BASE + "settings/Settings;") || owner.equals(BASE + "settings/PatchFamily;")
                        || owner.equals(BASE + "settings/PatchFamily$Capability;");
            }
            if (!(r instanceof MethodReference)) return false;
            MethodReference m = (MethodReference) r;
            String owner = m.getDefiningClass();
            return owner.equals(STATUS) || r.toString().equals("Lapp/hushpinterest/extension/shared/Utils;->settingsReady()Z")
                    || owner.equals(BASE + "settings/PatchFamily;") && m.getName().equals("inBuild")
                    || owner.equals(BASE + "settings/PatchFamily$Capability;") && m.getName().equals("installed")
                    || owner.equals("Lapp/hushpinterest/extension/shared/settings/BooleanSetting;") && m.getName().equals("get");
        }

        void indexControls() {
            for (ClassDef cd : patched.classes.values()) {
                // Compiled lambdas run through their interface after their constructor has returned.
                if (!cd.getType().startsWith(OWN) || !AccessFlags.SYNTHETIC.isSet(cd.getAccessFlags()) || cd.getInterfaces().isEmpty()) continue;
                List<Method> implementations = new ArrayList<>();
                for (Method m : cd.getMethods()) if (m.getImplementation() != null && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                        && !m.getName().startsWith("<")) implementations.add(m);
                for (Method m : cd.getMethods()) if (m.getName().equals("<init>")) {
                    callbacks.put(m.toString(), implementations);
                    for (Method callback : implementations) controlCallers.computeIfAbsent(callback.toString(), key -> new HashSet<>()).add(m.toString());
                }
            }
            for (Method m : patched.methods.values()) {
                if (!m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                for (Instruction i : instructions(m)) {
                    Reference r = reference(i);
                    if (controlReference(r)) controlMethods.add(m.toString());
                    else if (r instanceof MethodReference && patched.methods.containsKey(r.toString()))
                        controlCallers.computeIfAbsent(r.toString(), key -> new HashSet<>()).add(m.toString());
                }
            }
            Deque<String> work = new ArrayDeque<>(controlMethods);
            while (!work.isEmpty()) for (String caller : controlCallers.getOrDefault(work.poll(), Set.of()))
                if (controlMethods.add(caller)) work.add(caller);
        }

        boolean leadsToControl(Reference r) {
            return controlReference(r) || r instanceof MethodReference && controlMethods.contains(r.toString());
        }

        void controls(Method m, boolean required) {
            if (m == null) return;
            if (!controlMethods.contains(m.toString())) {
                if (required) fail(m + " has no compiled family control");
                return;
            }
            if (!checkedControls.add(m.toString())) return;
            BitSet reached = flow(m).reachable(0, true);
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) {
                Reference r = reference(body.get(at));
                if (!leadsToControl(r)) continue;
                if (!reached.get(at)) fail(m + " has an unreachable required family control " + r);
                if (!controlReference(r) && r instanceof MethodReference) controls(patched.methods.get(r.toString()), false);
            }
            for (Method callback : callbacks.getOrDefault(m.toString(), List.of())) controls(callback, false);
        }

        void fallback(Method m, String original) {
            List<Integer> sites = callSites(instructions(m), original);
            FeatureFlow graph = flow(m);
            BitSet reached = graph.reachable(0, false);
            if (sites.stream().noneMatch(reached::get)) fail(m + " has no reachable original framework call fallback");
            // Settings wrappers restore their shortcut after the framework call; they have no disabled family arm.
            if (!featureControls) return;
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) {
                if (!reached.get(at) || !leadsToControl(reference(body.get(at)))) continue;
                BitSet disabled = graph.afterControl(at);
                if (sites.stream().noneMatch(disabled::get)) fail(m + " has no original framework call fallback after its disabled family control " + reference(body.get(at)));
            }
        }

        Method unique(List<Method> targets, String what) {
            if (targets.size() != 1) { fail(what + " has " + targets.size() + " clean targets, expected 1"); return null; }
            Method m = targets.get(0);
            if (clean.duplicates.contains(m.toString()) || clean.duplicates.contains(m.getDefiningClass())) {
                fail(what + " has duplicate clean definitions"); return null;
            }
            return m;
        }

        ClassDef uniqueClass(List<ClassDef> targets, String what) {
            if (targets.size() != 1) { fail(what + " has " + targets.size() + " clean classes, expected 1"); return null; }
            ClassDef cd = targets.get(0);
            if (clean.duplicates.contains(cd.getType())) { fail(what + " has duplicate clean classes"); return null; }
            return cd;
        }

        Method actual(Method original) {
            if (original == null) return null;
            Method m = actual(original.toString());
            if (m != null && (AccessFlags.STATIC.isSet(original.getAccessFlags()) != AccessFlags.STATIC.isSet(m.getAccessFlags())
                    || original.getImplementation() != null && original.getImplementation().getRegisterCount() != m.getImplementation().getRegisterCount()))
                fail(original + " changed its original static flag or parameter frame");
            return m;
        }

        Method actual(String key) {
            Method m = patched.methods.get(key);
            if (m == null || m.getImplementation() == null || patched.duplicates.contains(key)
                    || patched.duplicates.contains(m.getDefiningClass())) {
                fail("missing or duplicated compiled method " + key); return null;
            }
            return m;
        }

        void readFlag(String name) {
            Method m = actual(STATUS + "->" + name + "()Z");
            if (m == null) { flags.put(name, false); return; }
            List<Instruction> body = instructions(m);
            if (!AccessFlags.PUBLIC.isSet(m.getAccessFlags()) || !AccessFlags.STATIC.isSet(m.getAccessFlags())
                    || body.size() < 2 || !body.get(0).getOpcode().name.startsWith("const")
                    || !(body.get(0) instanceof WideLiteralInstruction) || body.get(1).getOpcode() != Opcode.RETURN
                    || firstRegister(body.get(0)) != firstRegister(body.get(1))) {
                fail(name + " is not a public static literal flag"); flags.put(name, false); return;
            }
            long value = ((WideLiteralInstruction) body.get(0)).getWideLiteral();
            if (value != 0 && value != 1) fail(name + " has a non-boolean literal");
            flags.put(name, value == 1);
        }

        boolean active(Contract rule) {
            for (String cap : rule.callee.split(",")) if (flag(wholeFamilies.contains(cap) ? cap : owners.get(cap))) return true;
            return rule.target.equals("settings");
        }

        void capability(String names, boolean available) {
            for (String cap : names.split(",")) {
                boolean expected = flag(owners.get(cap)) && available;
                if (flag(cap) != expected) fail(cap + " flag is " + flag(cap) + ", clean target requires " + expected);
            }
        }

        List<Integer> calls(Method m, String hook, int count) {
            if (m == null) return List.of();
            List<Integer> sites = callSites(instructions(m), hook);
            if (sites.size() != count) fail(hook + " has " + sites.size() + " calls in " + m + ", expected " + count);
            BitSet reached = flow(m).reachable(0, true);
            for (int at : sites) {
                claimed.add(m + "@" + at);
                if (!reached.get(at)) fail(hook + " is unreachable in " + m);
                Instruction i = instructions(m).get(at);
                if (i.getOpcode() != Opcode.INVOKE_STATIC && i.getOpcode() != Opcode.INVOKE_STATIC_RANGE)
                    fail(hook + " is not invoked statically in " + m);
                // One register passed twice means a scratch write replaced a value the hook still wanted,
                // unless the hook took over a host call that already passed it twice.
                if (new HashSet<>(arguments(i)).size() != arguments(i).size() && !carried(m, i))
                    fail(hook + " passes one register twice in " + m);
            }
            Method callee = actual(hook);
            if (callee != null && (!AccessFlags.PUBLIC.isSet(callee.getAccessFlags())
                    || !AccessFlags.STATIC.isSet(callee.getAccessFlags())
                    || !AccessFlags.PUBLIC.isSet(patched.classes.get(callee.getDefiningClass()).getAccessFlags()))) fail(hook + " is not a public static hook");
            if (featureControls) controls(callee, true);
            return sites;
        }

        boolean carried(Method m, Instruction hook) {
            Method before = clean.methods.get(m.toString());
            if (before == null || before.getImplementation() == null) return false;
            List<String> shape = new ArrayList<>();
            for (CharSequence p : ((MethodReference) reference(hook)).getParameterTypes()) shape.add(p.toString());
            // A stand-in for an instance call takes the receiver first, so Window.setFlags(x, x) carried
            // into setWindowFlags(window, x, x) passes x twice because Pinterest did.
            for (Instruction i : instructions(before)) {
                if (!i.getOpcode().name().startsWith("INVOKE") || !(reference(i) instanceof MethodReference host)
                        || !arguments(i).equals(arguments(hook))) continue;
                List<String> passed = new ArrayList<>();
                if (!i.getOpcode().name().startsWith("INVOKE_STATIC")) passed.add(host.getDefiningClass());
                for (CharSequence p : host.getParameterTypes()) passed.add(p.toString());
                if (passed.equals(shape)) return true;
            }
            return false;
        }

        void remove(Method m, int first, int end) {
            if (m == null) return;
            FeatureEdits e = edits.computeIfAbsent(m.toString(), k -> new FeatureEdits());
            for (int at = Math.max(0, first); at < Math.min(end, instructions(m).size()); at++) e.removed.add(at);
        }

        int parameter(Method m, int index) {
            int start = m.getImplementation().getRegisterCount();
            for (CharSequence p : m.getParameterTypes()) start -= slots(p);
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags())) start--;
            if (index < 0) return start;
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags())) start++;
            for (int k = 0; k < index; k++) start += slots(m.getParameterTypes().get(k));
            return start;
        }

        void prefix(Method m, String hook, List<Integer> parameters, boolean result) {
            List<Integer> sites = calls(m, hook, parameters.size());
            if (m == null || sites.size() != parameters.size()) return;
            List<Instruction> body = instructions(m);
            for (int n = 0; n < sites.size(); n++) {
                int at = sites.get(n);
                int expectedAt = n * (result ? 2 : 1);
                if (at != expectedAt || !arguments(body.get(at)).equals(List.of(parameters.get(n))))
                    fail(hook + " is not a parameter-preserving prefix in " + m);
                if (result && (at + 1 >= body.size() || !isMoveResult(body.get(at + 1).getOpcode())
                        || firstRegister(body.get(at + 1)) != parameters.get(n)))
                    fail(hook + " does not replace its input register in " + m);
                remove(m, at, at + (result ? 2 : 1));
            }
        }

        void guard(Method m, String hook, int before, List<Integer> arguments, int preparations, boolean dismiss, boolean unit) {
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return;
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            int at = sites.get(0);
            int returnAt = at + (dismiss || unit ? 4 : 3);
            int resume = returnAt + 1;
            if (at != before + preparations || !arguments(body.get(at)).equals(arguments)
                    || resume > body.size() || at + 2 >= body.size()) {
                fail(hook + " has the wrong guarded placement or arguments in " + m); return;
            }
            Instruction answer = body.get(at + 1);
            Instruction branch = body.get(at + 2);
            if (answer.getOpcode() != Opcode.MOVE_RESULT || branch.getOpcode() != Opcode.IF_EQZ
                    || firstRegister(answer) != firstRegister(branch) || !(branch instanceof OffsetInstruction)
                    || layout.addresses.get(at + 2) + ((OffsetInstruction) branch).getCodeOffset()
                    != (resume == body.size() ? layout.size : layout.addresses.get(resume)))
                fail(hook + " has no false branch to its original body in " + m);
            if (body.get(returnAt).getOpcode() != (unit ? Opcode.RETURN_OBJECT : Opcode.RETURN_VOID))
                fail(hook + " does not finish only its enabled branch in " + m);
            if (dismiss) {
                Reference r = reference(body.get(at + 3));
                if (!(r instanceof MethodReference) || !((MethodReference) r).getParameterTypes().isEmpty()
                        || !((MethodReference) r).getReturnType().equals("V")
                        || !arguments(body.get(at + 3)).equals(List.of(parameter(m, -1))))
                    fail(hook + " no longer invokes the host dismissal in " + m);
                Method original = clean.methods.get(m.toString());
                Map<String, Integer> counts = new HashMap<>();
                if (original != null) for (Instruction instruction : instructions(original)) if (reference(instruction) instanceof MethodReference) {
                    MethodReference call = (MethodReference) reference(instruction);
                    if (descriptor(call).equals("()V")) counts.merge(call.toString(), 1, Integer::sum);
                }
                List<String> repeated = counts.entrySet().stream().filter(entry -> entry.getValue() >= 2).map(Map.Entry::getKey).toList();
                if (repeated.size() != 1 || !repeated.get(0).equals(String.valueOf(r)) || original == null
                        || instructions(original).isEmpty() || !instructions(original).get(0).getOpcode().name.startsWith("invoke-super"))
                    fail(hook + " is routed to a different native dismissal or runs before the superclass");
            }
            if (unit) {
                Reference r = reference(body.get(at + 3));
                if (body.get(at + 3).getOpcode() != Opcode.SGET_OBJECT || !(r instanceof FieldReference)
                        || !((FieldReference) r).getType().equals("Lkotlin/Unit;")
                        || firstRegister(body.get(at + 3)) != firstRegister(body.get(returnAt)))
                    fail(hook + " does not return Kotlin Unit in " + m);
            }
            remove(m, before, resume);
        }

        boolean canOverride(String type, String name, String shape) {
            // The view's own method is edited in place (requireOverride), so its final flag doesn't stop it.
            ClassDef own = clean.classes.get(type);
            if (own != null) for (Method m : own.getMethods()) if (m.getName().equals(name) && descriptor(m).equals(shape))
                return m.getImplementation() != null && !AccessFlags.STATIC.isSet(m.getAccessFlags());
            for (ClassDef cd = own == null ? null : clean.classes.get(own.getSuperclass()); cd != null; cd = clean.classes.get(cd.getSuperclass())) {
                for (Method m : cd.getMethods()) if (m.getName().equals(name) && descriptor(m).equals(shape))
                    return !AccessFlags.FINAL.isSet(m.getAccessFlags()) && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                            && !AccessFlags.PRIVATE.isSet(m.getAccessFlags()) && !AccessFlags.ABSTRACT.isSet(m.getAccessFlags())
                            && m.getImplementation() != null;
            }
            // android.view.View's platform methods are deliberately absent from the vendor DEX.
            return clean.classes.containsKey(type);
        }

        void view(String type, String visibility, String measure, String refresh) {
            ClassDef cd = clean.classes.get(type);
            if (cd == null) { fail("missing view " + type); return; }
            String[] names = refresh == null ? new String[]{"setVisibility", "onMeasure"} : new String[]{"onMeasure"};
            for (String name : names) {
                String shape = name.equals("setVisibility") ? "(I)V" : "(II)V";
                if (!canOverride(type, name, shape)) continue;
                Method m = actual(type + "->" + name + shape);
                if (m == null) continue;
                if (refresh != null) prefix(m, refresh, List.of(parameter(m, -1)), false);
                else if (name.equals("setVisibility")) prefix(m, visibility, List.of(parameter(m, 0)), true);
                else prefix(m, measure, List.of(parameter(m, 0), parameter(m, 1)), true);
                inherited(cd, m, name, shape);
            }
        }

        /** An override the patch added does nothing but its claimed hooks and the superclass's own call. */
        void inherited(ClassDef cd, Method m, String name, String shape) {
            if (clean.methods.containsKey(m.toString())) return;
            List<Instruction> retained = retained(m, edits.get(m.toString()));
            if (retained.size() != 2 || !retained.get(0).getOpcode().name.startsWith("invoke-super")
                    || retained.get(1).getOpcode() != Opcode.RETURN_VOID
                    || !(reference(retained.get(0)) instanceof MethodReference)) {
                fail(m + " lost its inherited original behavior"); return;
            }
            MethodReference call = (MethodReference) reference(retained.get(0));
            List<Integer> args = new ArrayList<>();
            for (int p = parameter(m, -1); p < m.getImplementation().getRegisterCount(); p++) args.add(p);
            if (!call.getDefiningClass().equals(cd.getSuperclass()) || !call.getName().equals(name)
                    || !descriptor(call).equals(shape) || !arguments(retained.get(0)).equals(args))
                fail(m + " invokes the wrong inherited implementation");
        }

        /**
         * A view whose dispatchDraw starts with the hook on the view itself and then draws as before.
         * It has a method of its own, so it can't collide with an onMeasure refresh on the same class.
         * A drawWash rule names a second hook and view as well, checked by [wash].
         */
        void draw(Contract c) {
            String type = c.strings.get(1);
            String shape = "(Landroid/graphics/Canvas;)V";
            ClassDef cd = clean.classes.get(type);
            // A build without the view, or without the one a drawWash rule washes, doesn't have this
            // surface. The patch changes neither there and keeps its others, so only the flag is held to it.
            boolean glass = c.strings.size() < 4 || clean.methods.containsKey(c.strings.get(3) + "->draw" + shape);
            if (cd == null || !glass) { capability(c.callee, false); return; }
            boolean overridable = canOverride(type, "dispatchDraw", shape);
            Method m = overridable ? actual(type + "->dispatchDraw" + shape) : null;
            if (m != null) {
                prefix(m, c.strings.get(0), List.of(parameter(m, -1)), false);
                inherited(cd, m, "dispatchDraw", shape);
            }
            boolean washed = c.strings.size() < 4 || wash(c.strings.get(2), c.strings.get(3));
            capability(c.callee, overridable && washed);
        }

        /**
         * A view whose draw() washes its canvas with one color, once. The hook goes right in front of
         * that wash: it takes the view and the color about to be used, and its answer goes back in
         * the color's register for the wash to read.
         */
        boolean wash(String hook, String type) {
            String canvas = "Landroid/graphics/Canvas;->drawColor(I)V";
            Method draw = clean.methods.get(type + "->draw(Landroid/graphics/Canvas;)V");
            if (draw == null) return false;
            if (draw.getImplementation() == null || AccessFlags.STATIC.isSet(draw.getAccessFlags())) {
                fail(type + " has a draw method with no body of its own to wash in"); return false;
            }
            List<Instruction> was = instructions(draw);
            List<Integer> washes = callSites(was, canvas);
            if (washes.size() != 1 || arguments(was.get(washes.get(0))).size() != 2) {
                fail(type + " washes its canvas " + washes.size() + " times, expected one plain call"); return false;
            }
            int wash = washes.get(0), view = parameter(draw, -1), color = arguments(was.get(wash)).get(1);
            for (int at = 0; at < wash; at++) if (writes(was.get(at), view)) {
                fail(type + " writes over itself before it washes its canvas"); return false;
            }
            Method m = actual(draw);
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            List<Instruction> body = instructions(m);
            int at = sites.get(0);
            boolean inPlace = at == wash && at + 2 < body.size() && arguments(body.get(at)).equals(List.of(view, color))
                    && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && firstRegister(body.get(at + 1)) == color
                    && callSites(body, canvas).equals(List.of(at + 2)) && arguments(body.get(at + 2)).equals(arguments(was.get(wash)));
            if (!inPlace) { fail(hook + " does not answer the wash color in place in " + m); return false; }
            remove(m, at, at + 2);
            return true;
        }

        /**
         * A view handed over as it leaves the one method that builds it. The rule names the hook, the
         * method's name and what picks the method out: its class, or the id whose R field it reads.
         * The method answers a view through a single return-object, and the hook sits right in front
         * of that return with the answered register, as the only way into it.
         */
        /**
         * Each hook, builder name ("*" for any) and anchor triple is one view handed over by the method
         * that builds it. The triples of one rule are one surface: the patch finds every builder before
         * it changes any, so a missing one leaves the whole surface, and its capability, off.
         */
        void builtView(Contract c) {
            List<List<Method>> found = new ArrayList<>();
            for (int t = 0; t < c.strings.size(); t += 3) {
                String name = c.strings.get(t + 1), anchor = c.strings.get(t + 2);
                List<Method> builders = new ArrayList<>();
                for (Method m : clean.methods.values()) {
                    if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null
                            || !(name.equals("*") || m.getName().equals(name))) continue;
                    if (anchor.startsWith("L") ? m.getDefiningClass().equals(anchor)
                            : instructions(m).stream().anyMatch(i -> readsId(i, anchor))) builders.add(m);
                }
                // No builder at all is a surface this build doesn't have: the patch warns, keeps its
                // others and leaves the capability off. Two builders are a build to look at.
                if (builders.isEmpty()) { capability(c.callee, false); return; }
                found.add(builders);
            }
            boolean handed = true;
            for (int t = 0; t < found.size(); t++) {
                String hook = c.strings.get(t * 3);
                Method builder = unique(found.get(t), "builder of the view for " + hook);
                boolean shaped = false;
                if (builder != null) {
                    String type = builder.getReturnType();
                    shaped = instructions(builder).stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count() == 1
                            && (type.startsWith("Landroid/view/") || type.startsWith("Landroid/widget/") || frameworkView(type));
                    if (!shaped) fail(builder + " doesn't answer a view through a single return");
                }
                Method m = shaped ? actual(builder) : null;
                List<Integer> sites = calls(m, hook, 1);
                boolean one = false;
                if (m != null && sites.size() == 1) {
                    List<Instruction> body = instructions(m);
                    int at = sites.get(0);
                    one = at + 1 < body.size() && body.get(at + 1).getOpcode() == Opcode.RETURN_OBJECT
                            && body.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count() == 1
                            && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at + 1)))) && onlyFrom(m, at + 1, at);
                    if (!one) fail(hook + " doesn't take the view " + m + " answers, right in front of its only return");
                    else remove(m, at, at + 1);
                }
                handed &= one;
            }
            capability(c.callee, handed);
        }

        void feed(Contract c) {
            int count = 0;
            for (String anchor : c.strings.subList(1, c.strings.size())) {
                List<Method> holders = new ArrayList<>();
                for (Method m : clean.holding(anchor)) if (m.getName().equals("toString") && descriptor(m).equals("()Ljava/lang/String;")) holders.add(m);
                if (holders.isEmpty()) continue;
                Method description = unique(holders, "feed " + anchor);
                if (description == null) continue;
                for (Method ctor : clean.classes.get(description.getDefiningClass()).getMethods()) {
                    if (!ctor.getName().equals("<init>") || ctor.getImplementation() == null) continue;
                    int parameter = -1;
                    for (int p = 0; p < ctor.getParameterTypes().size(); p++) if (ctor.getParameterTypes().get(p).toString().equals("Ljava/util/List;")) {
                        if (parameter != -1) { parameter = -2; break; }
                        parameter = p;
                    }
                    if (parameter < 0) continue;
                    Method m = actual(ctor);
                    if (m != null) prefix(m, c.strings.get(0), List.of(parameter(m, parameter)), true);
                    count++;
                }
            }
            if (count == 0) fail("feed filter has no usable clean constructor");
            capability(c.callee, count > 0);
        }

        void views(Contract c) {
            int count = 0;
            for (String type : c.strings.get(2).split(",")) {
                if (!clean.classes.containsKey(type)) {
                    if (!c.callee.equals("adViews")) fail("required view target is absent: " + type);
                    continue;
                }
                if (canOverride(type, "setVisibility", "(I)V") || canOverride(type, "onMeasure", "(II)V")) count++;
                view(type, c.strings.get(0), c.strings.get(1), null);
            }
            capability(c.callee, count > 0);
        }

        void simpleGuard(Contract c) {
            boolean available = true;
            for (int i = 0; i < c.strings.size(); i += 2) if (!simpleGuard(c, c.strings.get(i), c.strings.get(i + 1))) available = false;
            capability(c.callee, available);
        }

        boolean simpleGuard(Contract c, String hook, String selector) {
            if (selector.equals("androidToast")) return androidToast(hook);
            if (selector.equals("profileWebsite")) {
                List<Method> headers = new ArrayList<>();
                for (Method m : clean.holding("website_link")) if (m.getName().equals("onClick")
                        && descriptor(m).equals("(Landroid/view/View;)V") && fieldNames(m).contains("BUSINESS_PROFILE_WEBSITE_LINK")) headers.add(m);
                Method header = unique(headers, "profile website header");
                if (header == null) return false;
                Set<String> navigation = new HashSet<>(), getters = new HashSet<>();
                for (Instruction i : instructions(header)) if (reference(i) instanceof MethodReference) {
                    MethodReference r = (MethodReference) reference(i);
                    if (r.getDefiningClass().equals("Lcom/pinterest/navigation/Navigation;") && descriptor(r).equals(
                            "(Lcom/pinterest/framework/screens/ScreenLocation;Ljava/lang/String;)Lcom/pinterest/navigation/NavigationImpl;")) navigation.add(r.toString());
                    if (r.getDefiningClass().startsWith("Lcom/pinterest/api/model/") && descriptor(r).equals("()Ljava/lang/String;")) getters.add(r.toString());
                }
                if (navigation.size() != 1 || getters.size() != 1) { fail("profile website anchors changed"); return false; }
                String nav = navigation.iterator().next(), getter = getters.iterator().next();
                List<Method> websites = new ArrayList<>();
                for (Method m : clean.methods.values()) if (m.getName().equals("onClick") && descriptor(m).equals("(Landroid/view/View;)V")
                        && instructions(m).stream().anyMatch(i -> nav.equals(String.valueOf(reference(i))))
                        && instructions(m).stream().anyMatch(i -> getter.equals(String.valueOf(reference(i))))) websites.add(m);
                if (websites.size() != 2 || !websites.contains(header)) { fail("profile website handlers are missing or ambiguous"); return false; }
                for (Method original : websites) {
                    List<Instruction> body = instructions(original);
                    List<Integer> sites = new ArrayList<>();
                    for (int at = 0; at < body.size(); at++) if (nav.equals(String.valueOf(reference(body.get(at))))) sites.add(at);
                    if (sites.size() != 1) { fail("profile navigation call is ambiguous in " + original); continue; }
                    int at = sites.get(0);
                    List<Integer> args = arguments(body.get(at));
                    Method patchedMethod = actual(original);
                    if (args.size() != 2) fail("profile navigation arguments changed");
                    else if (patchedMethod != null) guard(patchedMethod, hook, at, List.of(args.get(1)), 0, false, false);
                }
                return true;
            }
            if (selector.equals("screenshotCallback")) {
                // Every screen capture callback in Pinterest's code returns at once while the switch is on.
                List<Method> callbacks = new ArrayList<>();
                for (ClassDef cd : clean.classes.values()) if (!cd.getType().startsWith(OWN)
                        && cd.getInterfaces().contains("Landroid/app/Activity$ScreenCaptureCallback;"))
                    for (Method m : cd.getMethods()) if (m.getName().equals("onScreenCaptured") && descriptor(m).equals("()V")
                            && m.getImplementation() != null) callbacks.add(m);
                if (callbacks.isEmpty()) { fail("no screen capture callback in this build"); return false; }
                for (Method original : callbacks) guard(actual(original), hook, 0, List.of(), 0, false, false);
                return true;
            }
            if (selector.equals("screenshotReceiver")) {
                // The photos watchers post one event for a new screenshot file; every method taking only
                // that event returns at once while the switch is on, and the watchers stay untouched.
                Set<String> events = new TreeSet<>();
                for (Method m : clean.holding("date_added")) if (m.getName().equals("onChange") && descriptor(m).equals("(ZLandroid/net/Uri;)V")
                        && clean.texts.get(m.toString()).contains("_data") && clean.classes.containsKey(m.getDefiningClass())
                        && "Landroid/database/ContentObserver;".equals(clean.classes.get(m.getDefiningClass()).getSuperclass()))
                    for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.NEW_INSTANCE) {
                        String type = String.valueOf(reference(i));
                        if (clean.classes.containsKey(type) && List.of("Ljava/", "Ljavax/", "Lkotlin/", "Landroid/", "Landroidx/")
                                .stream().noneMatch(type::startsWith)) events.add(type);
                    }
                if (events.size() != 1) { fail("the photos watchers post " + events.size() + " event types, expected one"); return false; }
                String event = events.iterator().next();
                List<Method> receivers = new ArrayList<>();
                for (Method m : clean.methods.values()) if (!m.getDefiningClass().startsWith(OWN) && m.getImplementation() != null
                        && !m.getName().startsWith("<") && m.getReturnType().equals("V") && m.getParameterTypes().size() == 1
                        && m.getParameterTypes().get(0).toString().equals(event)) receivers.add(m);
                if (receivers.isEmpty()) { fail("nothing receives the screenshot event " + event); return false; }
                for (Method original : receivers) guard(actual(original), hook, 0, List.of(), 0, false, false);
                return true;
            }
            List<Method> targets = new ArrayList<>();
            int before = 0;
            boolean whole = true;
            if (selector.equals("share")) {
                for (Method m : clean.methods.values()) {
                    if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null || !m.getReturnType().equals("V")
                            || m.getParameterTypes().size() != 5
                            || !m.getParameterTypes().get(1).toString().equals("I") || !m.getParameterTypes().get(3).toString().equals("Z")) continue;
                    Set<String> fields = fieldNames(m);
                    if (fields.containsAll(Set.of("APP_LIST_AND_CONTACT_SUGGESTIONS_FOR_UPSELL", "SCREENSHOT", "DOWNLOAD"))) targets.add(m);
                }
            } else if (selector.equals("shareCloseup")) {
                for (Method m : clean.holding("context")) if (m.getName().equals("onCreate")
                        && descriptor(m).equals("(Landroid/os/Bundle;)V") && hasSendableShareSource(m)) targets.add(m);
            } else if (selector.equals("visit")) {
                String pin = "";
                ClassDef menu = clean.classes.get(PIN_MENU);
                List<String> pins = new ArrayList<>();
                if (menu != null) for (Field field : menu.getFields()) if (field.getName().equals("pin") && field.getType().startsWith("Lcom/pinterest/api/model/")) pins.add(field.getType());
                if (pins.size() != 1) fail("Visit has no unique native pin model field"); else pin = pins.get(0);
                for (Method m : clean.holding("com.pinterest.EXTRA_URL")) if (clean.texts.get(m.toString()).contains("_url")
                        && m.getReturnType().equals("V") && m.getParameterTypes().size() >= 2
                        && m.getParameterTypes().get(0).toString().equals("Ljava/lang/String;") && m.getParameterTypes().get(1).toString().equals(pin)) targets.add(m);
            } else if (selector.equals("screenshot")) {
                for (Method m : clean.holding("sg_android_new_screenshot_api_14")) if (!AccessFlags.STATIC.isSet(m.getAccessFlags())
                        && m.getReturnType().equals("V") && m.getParameterTypes().size() == 2
                        && m.getParameterTypes().get(1).toString().equals("Landroidx/fragment/app/FragmentActivity;")) targets.add(m);
            } else if (selector.equals("assistant")) {
                for (Method m : clean.holding("ai_fwd_android_assistant_ask_mode")) if (!AccessFlags.STATIC.isSet(m.getAccessFlags())
                        && m.getReturnType().equals("Z") && m.getParameterTypes().isEmpty()) targets.add(m);
            } else if (selector.equals("update")) {
                targets.addAll(updateTargets());
                if (targets.isEmpty()) {
                    boolean play = clean.classes.keySet().stream().anyMatch(t -> t.startsWith("Lcom/google/android/play/core/appupdate/"));
                    if (play || flag(owners.get(c.callee))) fail("update prompt is absent but its family is installed or Play Core remains");
                    return false;
                }
            } else if (selector.equals("email")) {
                Set<String> types = new HashSet<>();
                for (ClassDef binding : clean.classesHolding("confirmEmailButton")) for (Field field : binding.getFields()) {
                    ClassDef fragment = clean.classes.get(field.getType());
                    if (fragment == null) continue;
                    for (Method m : fragment.getMethods()) if (m.getName().equals("onViewCreated")
                            && fieldNames(m).contains("email_verification_reminder_title")) types.add(fragment.getType());
                }
                for (String type : types) for (Method m : clean.classes.get(type).getMethods())
                    if (m.getName().equals("onCreate") && descriptor(m).equals("(Landroid/os/Bundle;)V")) targets.add(m);
                before = 1;
            } else if (selector.equals("googleAds")) {
                for (Method m : clean.methods.values()) {
                    if (m.getDefiningClass().startsWith(OWN) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !descriptor(m).equals("()V")) continue;
                    if (instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.SGET_OBJECT && reference(i) instanceof FieldReference
                            && ((FieldReference) reference(i)).getName().equals("GOOGLE_MOBILE_ADS")
                            && ((FieldReference) reference(i)).getType().equals(((FieldReference) reference(i)).getDefiningClass()))) targets.add(m);
                }
                // A build without the launch step keeps the capability off, and the patch only warns.
                if (targets.isEmpty()) return false;
            } else if (selector.equals("metaAds")) {
                // The third-party consent check: an instance (vendor)Z whose vendor enum has a
                // META_AUDIENCE_NETWORK constant of its own type. Ad model enums of that name are never asked.
                Set<String> vendors = new HashSet<>();
                for (ClassDef cd : clean.classes.values()) for (Field f : cd.getFields())
                    if (f.getName().equals("META_AUDIENCE_NETWORK") && f.getType().equals(cd.getType())
                            && AccessFlags.STATIC.isSet(f.getAccessFlags())) vendors.add(cd.getType());
                for (Method m : clean.methods.values()) {
                    if (m.getDefiningClass().startsWith(OWN) || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null
                            || !m.getReturnType().equals("Z") || m.getParameterTypes().size() != 1) continue;
                    if (vendors.contains(m.getParameterTypes().get(0).toString())) targets.add(m);
                }
                // A build without Meta's ad SDK keeps the capability off, and the patch only warns.
                if (targets.isEmpty()) return false;
            } else if (selector.equals("interstitialKillswitch") || selector.equals("interstitialExperiment")) {
                // The killswitch read: an instance ()Z naming the server experiment that turns interstitials off.
                List<Method> reads = new ArrayList<>();
                for (Method m : clean.holding("android_ad_interstitial_killswitch")) if (!m.getDefiningClass().startsWith(OWN)
                        && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && descriptor(m).equals("()Z")) reads.add(m);
                // The experiment check: an instance (kind, Z)Z naming both the house and the Google interstitial.
                List<Method> checks = new ArrayList<>();
                for (Method m : clean.holding("android_ad_house_interstitial")) if (!m.getDefiningClass().startsWith(OWN)
                        && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals("Z")
                        && m.getParameterTypes().size() == 2 && m.getParameterTypes().get(1).toString().equals("Z")
                        && clean.texts.get(m.toString()).contains("android_ad_gma_interstitial")) checks.add(m);
                // The patch answers both questions or neither. Without exactly one of each in one class it
                // only warns, so the capability stays off and none of these methods carries either hook.
                if (reads.size() != 1 || checks.size() != 1 || !reads.get(0).getDefiningClass().equals(checks.get(0).getDefiningClass())) {
                    for (Method m : reads) calls(actual(m), hook, 0);
                    for (Method m : checks) calls(actual(m), hook, 0);
                    return false;
                }
                targets.addAll(selector.equals("interstitialKillswitch") ? reads : checks);
            } else if (selector.equals("saveToast")) {
                ClassDef container = clean.classes.get(TOAST_CONTAINER);
                if (container != null) for (Method m : container.getMethods()) {
                    if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V") || m.getParameterTypes().size() != 1) continue;
                    String model = m.getParameterTypes().get(0).toString();
                    if (instructions(m).stream().anyMatch(i -> reference(i) instanceof MethodReference
                            && ((MethodReference) reference(i)).getDefiningClass().equals(model)
                            && descriptor((MethodReference) reference(i)).equals("(" + TOAST_CONTAINER + ")" + TOAST_VIEW))) targets.add(m);
                }
                if (targets.size() == 1) whole = saveToastStub(targets.get(0).getParameterTypes().get(0).toString());
            } else if (selector.equals("homeResume") || selector.equals("homeRefresh")) {
                // The Home return check: the fragment's (J)V that hands the time away to the
                // presenter's (JZ)V, which compares it with five minutes and calls the static
                // refresh with a map and a default-argument mask. 14.44.0 inlines that check into
                // the fragment's (J)V. Its refresh is the second guarded method.
                List<Method> resumes = new ArrayList<>();
                Set<Method> checks = new HashSet<>();
                ClassDef home = clean.classes.get(HOME_FEED_FRAGMENT);
                if (home != null) for (Method m : home.getMethods()) {
                    if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !descriptor(m).equals("(J)V")) continue;
                    if (instructions(m).stream().anyMatch(a -> a instanceof WideLiteralInstruction
                            && ((WideLiteralInstruction) a).getWideLiteral() == HOME_AWAY_MS) && !homeRefreshCalls(m).isEmpty()) {
                        resumes.add(m);
                        checks.add(m);
                        continue;
                    }
                    for (Instruction i : instructions(m)) if (reference(i) instanceof MethodReference r && descriptor(r).equals("(JZ)V")
                            && i.getOpcode().name.startsWith("invoke-virtual") && clean.methods.get(r.toString()) != null) {
                        Method check = clean.methods.get(r.toString());
                        if (instructions(check).stream().anyMatch(a -> a instanceof WideLiteralInstruction
                                && ((WideLiteralInstruction) a).getWideLiteral() == HOME_AWAY_MS) && !homeRefreshCalls(check).isEmpty()) {
                            resumes.add(m);
                            checks.add(check);
                        }
                    }
                }
                if (selector.equals("homeResume")) targets.addAll(resumes);
                else if (resumes.size() == 1 && checks.size() == 1) {
                    Set<String> calls = homeRefreshCalls(checks.iterator().next());
                    Method refresh = calls.size() == 1 ? clean.methods.get(calls.iterator().next()) : null;
                    if (refresh == null) fail("Home return check no longer calls one refresh in this build");
                    else targets.add(refresh);
                }
            } else { fail("unknown guard selector " + selector); return false; }
            Method original = unique(targets, c.callee);
            Method m = actual(original);
            if (m != null) {
                List<Integer> args = List.of();
                int prep = 0;
                if (selector.equals("visit")) args = List.of(parameter(m, 0), parameter(m, 1));
                if (selector.equals("saveToast")) args = List.of(parameter(m, 0));
                if (selector.equals("homeResume")) args = List.of(parameter(m, 0), parameter(m, 0) + 1);
                if (selector.equals("homeRefresh")) args = List.of(parameter(m, 1), parameter(m, 2));
                if (selector.equals("share")) {
                    args = List.of(0, 1); prep = 2;
                    List<Instruction> body = instructions(m);
                    if (body.size() < 2 || !moveFrom(body.get(0), 0, parameter(m, 0)) || !moveFrom(body.get(1), 1, parameter(m, 2)))
                        fail(c.callee + " no longer supplies the model and source parameters");
                }
                if (selector.equals("shareCloseup")) {
                    closeupShareGuard(m, hook);
                    sendableStubs();
                    return original != null;
                }
                if (selector.equals("assistant") || selector.equals("metaAds") || selector.equals("interstitialExperiment")) {
                    // The consent check hands its vendor to the hook; the other checks hand nothing.
                    falseGuard(m, hook, selector.equals("metaAds") ? List.of(parameter(m, 0)) : List.of());
                    return original != null;
                }
                if (selector.equals("interstitialKillswitch")) {
                    answerGuard(m, hook, List.of(), 1);
                    return original != null;
                }
                if (selector.equals("update")) {
                    before = -1;
                    List<Instruction> body = instructions(m);
                    for (int i = 0; i < body.size(); i++) if (reference(body.get(i)) instanceof StringReference
                            && ((StringReference) reference(body.get(i))).getString().equals("inAppUpdateManager")) before = i - 5;
                }
                guard(m, hook, before, args, prep, selector.equals("email"), selector.equals("update"));
            }
            return original != null && whole;
        }

        /** A guard on a host method that answers a question: when the hook says so it answers false, and nothing else runs. */
        void falseGuard(Method m, String hook, List<Integer> arguments) {
            answerGuard(m, hook, arguments, 0);
        }

        /** The same guard answering [answer] (0 or 1) instead. */
        void answerGuard(Method m, String hook, List<Integer> arguments, int answer) {
            List<Integer> sites = calls(m, hook, 1);
            if (sites.size() != 1) return;
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            if (sites.get(0) != 0 || body.size() < 6 || !arguments(body.get(0)).equals(arguments)) {
                fail(hook + " has the wrong guarded placement or arguments in " + m);
                return;
            }
            Instruction result = body.get(1), branch = body.get(2), constant = body.get(3), done = body.get(4);
            if (result.getOpcode() != Opcode.MOVE_RESULT || branch.getOpcode() != Opcode.IF_EQZ || firstRegister(result) != firstRegister(branch)
                    || !(branch instanceof OffsetInstruction)
                    || layout.addresses.get(2) + ((OffsetInstruction) branch).getCodeOffset() != layout.addresses.get(5))
                fail(hook + " has no false branch to its original body in " + m);
            if (constant.getOpcode() != Opcode.CONST_4 || done.getOpcode() != Opcode.RETURN || firstRegister(constant) != firstRegister(done)
                    || ((NarrowLiteralInstruction) constant).getNarrowLiteral() != answer)
                fail(hook + " does not answer " + (answer == 0 ? "false" : "true") + " only in its enabled branch in " + m);
            remove(m, 0, 5);
        }

        /** The static Home refresh calls in [m]: the fragment's owner, a pin map and a default-argument mask. */
        Set<String> homeRefreshCalls(Method m) {
            Set<String> out = new TreeSet<>();
            for (Instruction i : instructions(m)) if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE)
                    && reference(i) instanceof MethodReference) {
                MethodReference r = (MethodReference) reference(i);
                if (descriptor(r).equals("(" + r.getDefiningClass() + "Ljava/util/HashMap;I)V")) out.add(r.toString());
            }
            return out;
        }

        /**
         * The save toast stub: one instance check per concrete toast model that reads a save
         * confirmation's text or names the follow suggestion or the "more ideas" confirmation, then
         * false, then the shared true. The message stub is the same for the toast models that show
         * a text they were handed, and [textStub] checks the one for models that ask a field for
         * their text. Answers whether this build has a toast of every kind: a save confirmation, the
         * follow suggestion, one that asks for its text and one that's handed it. The patch sets
         * the capability only then.
         */
        boolean saveToastStub(String model) {
            Set<String> expected = new TreeSet<>();
            boolean saved = false, follow = false;
            for (ClassDef owner : clean.classes.values()) {
                if (AccessFlags.ABSTRACT.isSet(owner.getAccessFlags()) || AccessFlags.INTERFACE.isSet(owner.getAccessFlags())
                        || owner.getType().equals(model)) continue;
                Set<String> seen = new HashSet<>();
                boolean toast = false;
                for (ClassDef cd = clean.classes.get(owner.getSuperclass()); cd != null && seen.add(cd.getType()); cd = clean.classes.get(cd.getSuperclass()))
                    if (cd.getType().equals(model)) { toast = true; break; }
                if (!toast) continue;
                for (Method m : owner.getMethods()) for (Instruction i : instructions(m)) if (reference(i) instanceof FieldReference) {
                    FieldReference f = (FieldReference) reference(i);
                    boolean kind = f.getType().equals(f.getDefiningClass());
                    boolean save = f.getType().equals("I") && SAVE_TOAST_STRINGS.contains(f.getName())
                            || kind && f.getName().equals("BOARD_MORE_IDEAS_UPSELL_TOAST");
                    boolean suggestion = kind && f.getName().equals("FollowUpsellToast");
                    if (save || suggestion) expected.add(owner.getType());
                    saved |= save;
                    follow |= suggestion;
                }
            }
            instanceStub("isSaveToast", expected, "save toast");
            Map<String, List<String>> texts = textToasts(model);
            textStub(texts);
            Set<String> told = new HashSet<>(expected);
            for (String field : texts.keySet()) told.add(field.substring(0, field.indexOf("->")));
            Set<String> messages = messageToasts(model, told);
            instanceStub("isMessageToast", messages, "message toast");
            return saved && follow && !texts.isEmpty() && !messages.isEmpty();
        }

        /**
         * The stub for the toast models that ask a field for their text. For each of [texts] in turn:
         * is the toast that model, and if it is, does its field hold one of the classes that read a
         * save text. Then false, then the shared true. A model whose field holds anything else falls
         * through to the next, so a removal shown by the same model is never called a save. With no
         * such model the stub must still be the extension's own body, which answers false.
         */
        void textStub(Map<String, List<String>> texts) {
            Method stub = actual(BASE + "ui/UiHooks;->isSaveTextToast(Ljava/lang/Object;)Z");
            if (stub == null) return;
            List<Instruction> body = instructions(stub);
            if (texts.isEmpty()) {
                if (body.size() != 2 || body.get(0).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) body.get(0)).getNarrowLiteral() != 0
                        || body.get(1).getOpcode() != Opcode.RETURN || firstRegister(body.get(1)) != firstRegister(body.get(0)))
                    fail("text toast stub names toasts this build doesn't have");
                return;
            }
            int size = 4, input = parameter(stub, 0), at = 0;
            for (List<String> sources : texts.values()) size += 4 + 2 * sources.size();
            boolean shaped = body.size() == size;
            Layout code = new Layout(stub.getImplementation());
            for (Map.Entry<String, List<String>> text : texts.entrySet()) {
                if (!shaped) break;
                String model = text.getKey().substring(0, text.getKey().indexOf("->"));
                List<String> sources = text.getValue();
                int next = at + 4 + 2 * sources.size();
                Instruction is = body.get(at), skip = body.get(at + 1), cast = body.get(at + 2), read = body.get(at + 3);
                shaped = is.getOpcode() == Opcode.INSTANCE_OF && ((TwoRegisterInstruction) is).getRegisterB() == input
                        && firstRegister(is) != input && model.equals(String.valueOf(reference(is)))
                        && skip.getOpcode() == Opcode.IF_EQZ && firstRegister(skip) == firstRegister(is)
                        && code.addresses.get(at + 1) + ((OffsetInstruction) skip).getCodeOffset() == code.addresses.get(next)
                        && cast.getOpcode() == Opcode.CHECK_CAST && firstRegister(cast) == input && model.equals(String.valueOf(reference(cast)))
                        && read.getOpcode() == Opcode.IGET_OBJECT && ((TwoRegisterInstruction) read).getRegisterB() == input
                        && firstRegister(read) != input && text.getKey().equals(String.valueOf(reference(read)));
                for (int k = 0; shaped && k < sources.size(); k++) {
                    Instruction check = body.get(at + 4 + 2 * k), branch = body.get(at + 5 + 2 * k);
                    shaped = check.getOpcode() == Opcode.INSTANCE_OF && ((TwoRegisterInstruction) check).getRegisterB() == firstRegister(read)
                            && firstRegister(check) != firstRegister(read) && sources.get(k).equals(String.valueOf(reference(check)))
                            && branch.getOpcode() == Opcode.IF_NEZ && firstRegister(branch) == firstRegister(check)
                            && code.addresses.get(at + 5 + 2 * k) + ((OffsetInstruction) branch).getCodeOffset() == code.addresses.get(size - 2);
                }
                at = next;
            }
            if (shaped) for (int k = 0; k < 2; k++) {
                Instruction literal = body.get(size - 4 + 2 * k), exit = body.get(size - 3 + 2 * k);
                shaped &= literal.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) literal).getNarrowLiteral() == k
                        && exit.getOpcode() == Opcode.RETURN && firstRegister(exit) == firstRegister(literal);
            }
            if (!shaped) fail("text toast stub doesn't ask each of " + texts + " in turn");
        }

        /** Pinterest's methods that read a save confirmation's text, found once. */
        List<Method> saveReaders() {
            if (saveReaders != null) return saveReaders;
            saveReaders = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                for (Instruction i : m.getImplementation().getInstructions()) if (i.getOpcode() == Opcode.SGET
                        && reference(i) instanceof FieldReference f && f.getType().equals("I") && SAVE_TOAST_STRINGS.contains(f.getName())) {
                    saveReaders.add(m); break;
                }
            }
            return saveReaders;
        }

        /** Whether [type] is [target] or extends it, as far as the clean build's own classes say. */
        boolean inherits(String type, String target) {
            Set<String> seen = new HashSet<>();
            for (String at = type; at != null && seen.add(at); ) {
                if (at.equals(target)) return true;
                ClassDef cd = clean.classes.get(at);
                at = cd == null ? null : cd.getSuperclass();
            }
            return false;
        }

        /**
         * The toast models that ask an interface they hold in a public field for their text, where a
         * class behind that interface reads a save text: each such field as smali names it, with
         * those classes.
         */
        Map<String, List<String>> textToasts(String model) {
            Map<String, Set<String>> sources = new HashMap<>();
            for (Method reader : saveReaders()) {
                ClassDef owner = clean.classes.get(reader.getDefiningClass());
                if (owner == null || !AccessFlags.PUBLIC.isSet(owner.getAccessFlags()) || AccessFlags.ABSTRACT.isSet(owner.getAccessFlags())
                        || AccessFlags.INTERFACE.isSet(owner.getAccessFlags()) || inherits(owner.getType(), model)) continue;
                for (String type : owner.getInterfaces()) sources.computeIfAbsent(type, k -> new TreeSet<>()).add(owner.getType());
            }
            Map<String, List<String>> texts = new TreeMap<>();
            String builder = "(" + TOAST_CONTAINER + ")" + TOAST_VIEW;
            for (ClassDef owner : clean.classes.values()) {
                if (!AccessFlags.PUBLIC.isSet(owner.getAccessFlags()) || AccessFlags.ABSTRACT.isSet(owner.getAccessFlags())
                        || AccessFlags.INTERFACE.isSet(owner.getAccessFlags()) || owner.getType().equals(model)
                        || owner.getType().startsWith(OWN) || !inherits(owner.getType(), model)) continue;
                Set<String> asked = new HashSet<>();
                for (Method m : owner.getMethods()) if (descriptor(m).equals(builder)) for (Instruction i : instructions(m))
                    if (reference(i) instanceof MethodReference call && call.getReturnType().equals("Ljava/lang/CharSequence;")) asked.add(call.getDefiningClass());
                for (Field f : owner.getFields()) if (asked.contains(f.getType()) && sources.containsKey(f.getType())
                        && AccessFlags.PUBLIC.isSet(f.getAccessFlags()) && !AccessFlags.STATIC.isSet(f.getAccessFlags()))
                    texts.put(owner.getType() + "->" + f.getName() + ":" + f.getType(), new ArrayList<>(sources.get(f.getType())));
            }
            return texts;
        }

        /**
         * The public toast models a method that reads a save text builds, other than the ones
         * [told] apart already, that keep a text in a field of their own or of a class they extend.
         * The model HushPinterest's own messages are built with is never one.
         */
        Set<String> messageToasts(String model, Set<String> told) {
            String own = null;
            Method post = patched.methods.get(BASE + "ui/PinterestToasts;->post(Landroid/app/Activity;Ljava/lang/String;I)Z");
            if (post != null) for (Instruction i : instructions(post)) if (i.getOpcode() == Opcode.NEW_INSTANCE) own = String.valueOf(reference(i));
            Set<String> messages = new TreeSet<>();
            for (Method reader : saveReaders()) for (Instruction i : instructions(reader)) {
                if (i.getOpcode() != Opcode.NEW_INSTANCE) continue;
                String type = String.valueOf(reference(i));
                ClassDef owner = clean.classes.get(type);
                if (owner == null || type.equals(model) || told.contains(type) || !inherits(type, model)
                        || !AccessFlags.PUBLIC.isSet(owner.getAccessFlags()) || AccessFlags.ABSTRACT.isSet(owner.getAccessFlags())
                        || own != null && inherits(own, type)) continue;
                boolean text = false;
                Set<String> seen = new HashSet<>();
                for (ClassDef at = owner; at != null && !at.getType().equals(model) && seen.add(at.getType()); at = clean.classes.get(at.getSuperclass()))
                    for (Field f : at.getFields()) if (!AccessFlags.STATIC.isSet(f.getAccessFlags())
                            && (f.getType().equals("Ljava/lang/String;") || f.getType().equals("Ljava/lang/CharSequence;"))) text = true;
                if (text) messages.add(type);
            }
            return messages;
        }

        /** True when the toast made at [at] goes into a register that the very next instruction shows. */
        static boolean shownAtOnce(List<Instruction> body, int at) {
            return at + 2 < body.size() && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                    && body.get(at + 2).getOpcode() == Opcode.INVOKE_VIRTUAL
                    && "Landroid/widget/Toast;->show()V".equals(String.valueOf(reference(body.get(at + 2))))
                    && arguments(body.get(at + 2)).equals(List.of(firstRegister(body.get(at + 1))));
        }

        /**
         * The Android toasts the screens that save a pin show. Each Toast.makeText call in a method
         * that reads a save text, and in a static helper one of them hands a text to, goes to the
         * stand-in of the same shape on the same registers when its toast is shown at once. Any
         * other stays as it was. The rule runs once per shape and checks that shape's calls. Its
         * answer is for both: some call was taken over and none was left because it couldn't be.
         */
        boolean androidToast(String hook) {
            String original = TOAST_MAKE + hook.substring(hook.indexOf('('));
            Map<String, Method> makers = new LinkedHashMap<>();
            for (Method reader : saveReaders()) {
                makers.put(reader.toString(), reader);
                for (Instruction i : instructions(reader)) {
                    if (!i.getOpcode().name().startsWith("INVOKE_STATIC") || !(reference(i) instanceof MethodReference)) continue;
                    MethodReference call = (MethodReference) reference(i);
                    if (call.getDefiningClass().startsWith(OWN) || !descriptor(call).equals("(Landroid/content/Context;Ljava/lang/CharSequence;I)V")) continue;
                    Method helper = clean.methods.get(call.toString());
                    if (helper != null && helper.getImplementation() != null && AccessFlags.STATIC.isSet(helper.getAccessFlags()))
                        makers.put(helper.toString(), helper);
                }
            }
            int sites = 0, unsure = 0, taken = 0;
            for (Method maker : makers.values()) {
                List<Instruction> was = instructions(maker);
                List<Integer> originals = new ArrayList<>();
                int left = 0;
                for (int at = 0; at < was.size(); at++) {
                    if (!was.get(at).getOpcode().name().startsWith("INVOKE_STATIC") || !(reference(was.get(at)) instanceof MethodReference)) continue;
                    MethodReference call = (MethodReference) reference(was.get(at));
                    if (!call.toString().startsWith(TOAST_MAKE + "(") || !TOAST_SHAPES.contains(descriptor(call))) continue;
                    boolean shown = shownAtOnce(was, at);
                    if (shown) sites++; else unsure++;
                    if (!call.toString().equals(original)) continue;
                    if (shown) originals.add(at); else left++;
                }
                if (originals.isEmpty()) continue;
                taken += originals.size();
                Method m = actual(maker);
                List<Integer> hooked = calls(m, hook, originals.size());
                if (m == null) continue;
                List<Instruction> body = instructions(m);
                if (callSites(body, original).size() != left) fail(original + " remains beside its stand-in in " + m);
                for (int n = 0; n < Math.min(hooked.size(), originals.size()); n++) {
                    Instruction old = was.get(originals.get(n));
                    if (!arguments(body.get(hooked.get(n))).equals(arguments(old))) fail(hook + " changed its argument registers in " + m);
                    edits.computeIfAbsent(m.toString(), k -> new FeatureEdits()).replacements.put(hooked.get(n), old);
                }
            }
            if (taken > 0) {
                Method stand = actual(hook);
                if (stand != null) fallback(stand, original);
            }
            return sites > 0 && unsure == 0;
        }

        /**
         * A stub that answers true for an instance of one of the [expected] classes: a check apiece,
         * then false, then the shared true. With none expected it must still be the extension's own
         * body, which answers false.
         */
        void instanceStub(String name, Set<String> expected, String what) {
            Method stub = actual(BASE + "ui/UiHooks;->" + name + "(Ljava/lang/Object;)Z");
            if (stub == null) return;
            List<Instruction> body = instructions(stub);
            if (expected.isEmpty()) {
                if (body.size() != 2 || body.get(0).getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) body.get(0)).getNarrowLiteral() != 0
                        || body.get(1).getOpcode() != Opcode.RETURN || firstRegister(body.get(1)) != firstRegister(body.get(0)))
                    fail(what + " stub names toasts this build doesn't have");
                return;
            }
            int n = (body.size() - 4) / 2, input = parameter(stub, 0);
            List<String> named = new ArrayList<>();
            boolean shaped = body.size() == 2 * expected.size() + 4;
            Layout code = new Layout(stub.getImplementation());
            for (int k = 0; shaped && k < n; k++) {
                Instruction check = body.get(2 * k), branch = body.get(2 * k + 1);
                shaped = check.getOpcode() == Opcode.INSTANCE_OF && ((TwoRegisterInstruction) check).getRegisterB() == input
                        && branch.getOpcode() == Opcode.IF_NEZ && firstRegister(branch) == firstRegister(check)
                        && code.addresses.get(2 * k + 1) + ((OffsetInstruction) branch).getCodeOffset() == code.addresses.get(2 * n + 2);
                named.add(String.valueOf(reference(check)));
            }
            if (shaped) for (int k = 0; k < 2; k++) {
                Instruction literal = body.get(2 * n + 2 * k), exit = body.get(2 * n + 2 * k + 1);
                shaped &= literal.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) literal).getNarrowLiteral() == k
                        && exit.getOpcode() == Opcode.RETURN && firstRegister(exit) == firstRegister(literal);
            }
            if (!shaped || !new TreeSet<>(named).equals(expected) || named.size() != expected.size())
                fail(what + " stub names " + named + " instead of the " + what + " models " + expected);
        }

        /**
         * The closeup share's sendable stubs: each casts its input and returns one field, the id and
         * the kind the sendable's (String, int) constructor stores from those parameters. Its
         * accessors change meaning between builds, so nothing else names the pin reliably.
         */
        void sendableStubs() {
            String sendable = "Lcom/pinterest/sendshare/model/SendableObject;";
            ClassDef owner = clean.classes.get(sendable);
            List<Method> inits = new ArrayList<>();
            if (owner != null) for (Method m : owner.getMethods())
                if (m.getName().equals("<init>") && descriptor(m).equals("(Ljava/lang/String;I)V") && m.getImplementation() != null) inits.add(m);
            if (inits.size() != 1) { fail("share sendable has no single (String, int) constructor"); return; }
            Method init = inits.get(0);
            int registers = init.getImplementation().getRegisterCount(), self = parameter(init, -1);
            List<String> ids = new ArrayList<>(), kinds = new ArrayList<>();
            // Stores into the sendable's own field of the parameter's type, through this, the same
            // three things the patch requires, so a parameter forwarded elsewhere isn't counted.
            for (Instruction i : instructions(init)) {
                if (!(reference(i) instanceof FieldReference field) || !(i instanceof TwoRegisterInstruction two)
                        || two.getRegisterB() != self || !field.getDefiningClass().equals(sendable)) continue;
                if (i.getOpcode() == Opcode.IPUT_OBJECT && firstRegister(i) == registers - 2 && field.getType().equals("Ljava/lang/String;"))
                    ids.add(String.valueOf(field));
                if (i.getOpcode() == Opcode.IPUT && firstRegister(i) == registers - 1 && field.getType().equals("I")) kinds.add(String.valueOf(field));
            }
            if (ids.size() != 1 || kinds.size() != 1) { fail("share sendable constructor doesn't store one id and one kind"); return; }
            String own = BASE + "actions/SystemShare;->";
            Method id = stub(own + "sendableId(Ljava/lang/Object;)Ljava/lang/String;", List.of(Opcode.CHECK_CAST, Opcode.IGET_OBJECT,
                    Opcode.RETURN_OBJECT), Arrays.asList(sendable, ids.get(0), null));
            Method kind = stub(own + "sendableType(Ljava/lang/Object;)I", List.of(Opcode.CHECK_CAST, Opcode.IGET, Opcode.RETURN),
                    Arrays.asList(sendable, kinds.get(0), null));
            for (Method m : new Method[]{id, kind}) {
                if (m == null) continue;
                List<Instruction> body = instructions(m);
                if (((TwoRegisterInstruction) body.get(1)).getRegisterB() != parameter(m, 0) || firstRegister(body.get(2)) != firstRegister(body.get(1)))
                    fail(m + " doesn't return the field it reads from its own sendable");
            }
        }

        boolean hasSendableShareSource(Method m) {
            boolean sendable = false, source = false, superCreate = false;
            for (Instruction i : instructions(m)) {
                Reference r = reference(i);
                if (i.getOpcode() == Opcode.CHECK_CAST && "Lcom/pinterest/sendshare/model/SendableObject;".equals(String.valueOf(r))) sendable = true;
                if (i.getOpcode() == Opcode.CHECK_CAST && sourceEnum(String.valueOf(r))) source = true;
                if (i.getOpcode().name.startsWith("invoke-super") && methodNamed(i, "onCreate", "(Landroid/os/Bundle;)V")) superCreate = true;
            }
            return sendable && source && superCreate;
        }

        boolean sourceEnum(String type) {
            ClassDef cd = clean.classes.get(type);
            if (cd == null || !"Ljava/lang/Enum;".equals(cd.getSuperclass())) return false;
            Set<String> names = new HashSet<>();
            for (Field field : cd.getFields()) names.add(field.getName());
            return names.containsAll(Set.of("SHARE", "DOWNLOAD", "SCREENSHOT"));
        }

        void closeupShareGuard(Method m, String hook) {
            Method original = clean.methods.get(m.toString());
            List<Instruction> cleanBody = instructions(original);
            int sendable = -1, source = -1, superAt = -1;
            for (int at = 0; at < cleanBody.size(); at++) {
                Instruction i = cleanBody.get(at);
                Reference r = reference(i);
                if (i.getOpcode() == Opcode.CHECK_CAST && "Lcom/pinterest/sendshare/model/SendableObject;".equals(String.valueOf(r))) sendable = uniqueRegister(sendable, firstRegister(i), hook + " sendable");
                if (i.getOpcode() == Opcode.CHECK_CAST && sourceEnum(String.valueOf(r))) source = uniqueRegister(source, firstRegister(i), hook + " source");
                if (i.getOpcode().name.startsWith("invoke-super") && methodNamed(i, "onCreate", "(Landroid/os/Bundle;)V")) superAt = uniqueRegister(superAt, at, hook + " superclass call");
            }
            List<Integer> sites = calls(m, hook, 1);
            if (sites.size() != 1) return;
            int at = sites.get(0);
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            int returnAt = at + 4;
            int resume = returnAt + 1;
            if (sendable < 0 || source < 0 || superAt < 0 || at != superAt + 1
                    || !arguments(body.get(at)).equals(List.of(sendable, source)) || resume > body.size() || at + 2 >= body.size()) {
                fail(hook + " has the wrong closeup placement or arguments in " + m); return;
            }
            Instruction answer = body.get(at + 1);
            Instruction branch = body.get(at + 2);
            if (answer.getOpcode() != Opcode.MOVE_RESULT || branch.getOpcode() != Opcode.IF_EQZ
                    || firstRegister(answer) != firstRegister(branch) || !(branch instanceof OffsetInstruction)
                    || layout.addresses.get(at + 2) + ((OffsetInstruction) branch).getCodeOffset()
                    != (resume == body.size() ? layout.size : layout.addresses.get(resume)))
                fail(hook + " has no false branch to the closeup original body in " + m);
            Reference dismissed = reference(body.get(at + 3));
            if (!(dismissed instanceof MethodReference) || !((MethodReference) dismissed).getParameterTypes().isEmpty()
                    || !((MethodReference) dismissed).getReturnType().equals("V")
                    || !arguments(body.get(at + 3)).equals(List.of(parameter(m, -1))))
                fail(hook + " no longer dismisses the native closeup sheet in " + m);
            if (body.get(returnAt).getOpcode() != Opcode.RETURN_VOID)
                fail(hook + " does not finish only its enabled closeup branch in " + m);
            remove(m, at, resume);
        }

        int uniqueRegister(int current, int next, String label) {
            if (current >= 0 && current != next) fail(label + " is not unique");
            return next;
        }

        static boolean moveFrom(Instruction i, int to, int from) {
            return i.getOpcode().name.startsWith("move-object") && i instanceof TwoRegisterInstruction
                    && ((TwoRegisterInstruction) i).getRegisterA() == to && ((TwoRegisterInstruction) i).getRegisterB() == from;
        }

        List<Method> updateTargets() {
            List<Method> out = new ArrayList<>();
            for (Method m : clean.holding("inAppUpdateManager")) if (m.getName().equals("invokeSuspend")
                    && descriptor(m).equals("(Ljava/lang/Object;)Ljava/lang/Object;")) out.add(m);
            return out;
        }

        static Set<String> fieldNames(Method m) {
            Set<String> names = new HashSet<>();
            for (Instruction i : instructions(m)) if (reference(i) instanceof FieldReference) names.add(((FieldReference) reference(i)).getName());
            return names;
        }

        static List<Instruction> retained(Method m, FeatureEdits e) {
            List<Instruction> out = new ArrayList<>();
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) if (e == null || !e.removed.contains(at)) out.add(e == null ? body.get(at) : e.replacements.getOrDefault(at, body.get(at)));
            return out;
        }

        /** The container's method that has a toast model build its view, as the patches pick it. */
        Method toastShow() {
            List<Method> targets = new ArrayList<>();
            ClassDef container = clean.classes.get(TOAST_CONTAINER);
            if (container != null) for (Method m : container.getMethods()) {
                if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V") || m.getParameterTypes().size() != 1) continue;
                String model = m.getParameterTypes().get(0).toString();
                if (instructions(m).stream().anyMatch(i -> reference(i) instanceof MethodReference
                        && ((MethodReference) reference(i)).getDefiningClass().equals(model)
                        && descriptor((MethodReference) reference(i)).equals("(" + TOAST_CONTAINER + ")" + TOAST_VIEW))) targets.add(m);
            }
            return unique(targets, "toast container show method");
        }

        /** True when a method of the clean app reads the text shown after a picture or video finishes downloading. */
        boolean downloadTextRead() {
            for (ClassDef owner : clean.classes.values()) for (Method m : owner.getMethods()) for (Instruction i : instructions(m)) {
                if (i.getOpcode() != Opcode.SGET || !(reference(i) instanceof FieldReference)) continue;
                FieldReference f = (FieldReference) reference(i);
                if (f.getType().equals("I") && (f.getName().equals("pin_image_download_success") || f.getName().equals("pin_video_download_success"))) return true;
            }
            return false;
        }

        /**
         * The stub names exactly the concrete toast models that read the camera roll text. The switch
         * stands on those or on a screen reading a finished download's text, which the extension
         * tells at the container. Pinterest's code doesn't change.
         */
        void downloadToasts(Contract c) {
            Method show = toastShow();
            Set<String> expected = new TreeSet<>();
            if (show != null) {
                String model = show.getParameterTypes().get(0).toString();
                for (ClassDef owner : clean.classes.values()) {
                    if (AccessFlags.ABSTRACT.isSet(owner.getAccessFlags()) || AccessFlags.INTERFACE.isSet(owner.getAccessFlags())
                            || owner.getType().equals(model)) continue;
                    Set<String> seen = new HashSet<>();
                    boolean toast = false;
                    for (ClassDef cd = clean.classes.get(owner.getSuperclass()); cd != null && seen.add(cd.getType()); cd = clean.classes.get(cd.getSuperclass()))
                        if (cd.getType().equals(model)) { toast = true; break; }
                    if (!toast) continue;
                    for (Method m : owner.getMethods()) for (Instruction i : instructions(m)) if (reference(i) instanceof FieldReference) {
                        FieldReference f = (FieldReference) reference(i);
                        if (f.getType().equals("I") && f.getName().equals("downloaded_to_camera_roll")) expected.add(owner.getType());
                    }
                }
            }
            if (actual(c.strings.get(0)) != null) instanceStub("isDownloadToast", expected, "download toast");
            capability(c.callee, !expected.isEmpty() || downloadTextRead());
        }

        /** The hook takes the toast right after the container's model built it, and nothing else moves. */
        void blackToasts(Contract c) {
            String hook = c.strings.get(0);
            Method m = actual(toastShow());
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                int at = sites.get(0);
                placed = at >= 2 && reference(body.get(at - 2)) instanceof MethodReference
                        && descriptor((MethodReference) reference(body.get(at - 2))).equals("(" + TOAST_CONTAINER + ")" + TOAST_VIEW)
                        && isMoveResult(body.get(at - 1).getOpcode())
                        && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 1))));
                if (!placed) fail(hook + " doesn't take the toast the container just built in " + m);
                else remove(m, at, at + 1);
            }
            capability(c.callee, placed);
        }

        /** Every TabLayout asks for its height first, handing over itself and both measure specs. */
        void homeTabs(Contract c) {
            String hook = c.strings.get(0);
            Method stock = clean.methods.get("Lcom/google/android/material/tabs/TabLayout;->onMeasure(II)V");
            if (stock == null) { fail("TabLayout has no onMeasure to take " + hook); capability(c.callee, false); return; }
            Method m = actual(stock);
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                placed = sites.get(0) == 0 && body.get(0).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && arguments(body.get(0)).equals(List.of(parameter(m, -1), parameter(m, 0), parameter(m, 1)))
                        && body.get(1).getOpcode() == Opcode.MOVE_RESULT && firstRegister(body.get(1)) == parameter(m, 1);
                if (!placed) fail(hook + " doesn't replace the height spec first thing in " + m);
                else remove(m, 0, 2);
            }
            capability(c.callee, placed);
        }

        /** The one fragment reading the landing list's id gets its root view before anything else runs. */
        static final String ONE_BAR_MODULES = "one_bar_modules";

        /**
         * Hide suggested searches (#48): every reader of the row under the search bar calls one
         * static (X)ArrayList parser right after naming its key. The hook takes each module right
         * after the parser casts it, and a yes goes back to the loop's hasNext. The answer borrows a
         * register nothing reads after the hook.
         */
        void searchSuggestions(Contract c) {
            String hook = c.strings.get(0);
            Set<String> parsers = new HashSet<>();
            for (Method reader : clean.methods.values()) {
                if (reader.getDefiningClass().startsWith(OWN) || reader.getImplementation() == null
                        || !clean.texts.getOrDefault(reader.toString(), Set.of()).contains(ONE_BAR_MODULES)) continue;
                List<Instruction> body = instructions(reader);
                for (int k = 0; k < body.size(); k++) {
                    if (!(reference(body.get(k)) instanceof StringReference s) || !s.getString().equals(ONE_BAR_MODULES)) continue;
                    for (int j = k + 1; j < body.size(); j++) {
                        Instruction i = body.get(j);
                        if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE)
                                && reference(i) instanceof MethodReference r && r.getReturnType().equals("Ljava/util/ArrayList;")
                                && r.getParameterTypes().size() == 1) { parsers.add(r.toString()); break; }
                    }
                }
            }
            Method original = parsers.size() == 1 ? clean.methods.get(parsers.iterator().next()) : null;
            if (original == null || original.getImplementation() == null) { capability(c.callee, false); return; }
            List<Instruction> was = instructions(original);
            int next = -1, hasNext = -1, nexts = 0, hasNexts = 0;
            for (int k = 0; k < was.size(); k++) {
                if (was.get(k).getOpcode() != Opcode.INVOKE_INTERFACE) continue;
                String called = String.valueOf(reference(was.get(k)));
                if (called.equals("Ljava/util/Iterator;->next()Ljava/lang/Object;")) { next = k; nexts++; }
                if (called.equals("Ljava/util/Iterator;->hasNext()Z")) { hasNext = k; hasNexts++; }
            }
            boolean shaped = nexts == 1 && hasNexts == 1 && hasNext < next && next + 2 < was.size()
                    && was.get(next + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && was.get(next + 2).getOpcode() == Opcode.CHECK_CAST
                    && firstRegister(was.get(next + 1)) == firstRegister(was.get(next + 2));
            if (!shaped) { capability(c.callee, false); return; }
            int module = firstRegister(was.get(next + 1)), at = next + 3;
            Method m = actual(original);
            List<Integer> sites = calls(m, hook, 1);
            boolean hooked = m != null && sites.size() == 1;
            if (hooked) {
                List<Instruction> body = instructions(m);
                Layout layout = new Layout(m.getImplementation());
                int answer = at + 2 < body.size() ? firstRegister(body.get(at + 1)) : -1;
                hooked = sites.get(0) == at && arguments(body.get(at)).equals(List.of(module)) && answer >= 0
                        && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && body.get(at + 2).getOpcode() == Opcode.IF_NEZ
                        && firstRegister(body.get(at + 2)) == answer
                        && layout.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset() == layout.addresses.get(hasNext)
                        && unread(new FeatureFlow(original), was, at, answer);
                if (hooked) remove(m, at, at + 3);
                else fail(hook + " doesn't take each module right after the row parser casts it in " + m);
            }
            capability(c.callee, hooked);
        }

        static final String EXPERIMENT_ACTIVATED = "_activated";

        /**
         * Swipe down to close pins and Full-size profile photos (#48): Pinterest's one experiment
         * group lookup, the only method naming "_activated", asks the extension first with the
         * experiment's name. A group it answers is returned; null runs the lookup as it was.
         */
        void experimentGroup(Contract c) {
            String hook = c.strings.get(0);
            List<Method> lookups = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                if (clean.texts.getOrDefault(m.toString(), Set.of()).contains(EXPERIMENT_ACTIVATED)) lookups.add(m);
            }
            Method original = lookups.size() == 1 ? lookups.get(0) : null;
            if (original == null || AccessFlags.STATIC.isSet(original.getAccessFlags()) || !original.getReturnType().equals("Ljava/lang/String;")
                    || original.getParameterTypes().size() != 3 || !original.getParameterTypes().get(0).toString().equals("Ljava/lang/String;")
                    || !original.getParameterTypes().get(2).toString().equals("Z")) { capability(c.callee, false); return; }
            Method m = actual(original);
            List<Integer> sites = calls(m, hook, 1);
            boolean hooked = m != null && sites.size() == 1;
            if (hooked) {
                List<Instruction> body = instructions(m);
                Layout layout = new Layout(m.getImplementation());
                int answer = body.size() > 4 ? firstRegister(body.get(1)) : -1;
                hooked = sites.get(0) == 0 && arguments(body.get(0)).equals(List.of(parameter(m, 0))) && answer >= 0
                        && body.get(1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && body.get(2).getOpcode() == Opcode.IF_EQZ && firstRegister(body.get(2)) == answer
                        && layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(4)
                        && body.get(3).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(3)) == answer;
                if (hooked) remove(m, 0, 4);
                else fail(hook + " doesn't answer first in the experiment group lookup " + m);
            }
            capability(c.callee, hooked);
        }

        void searchLanding(Contract c) {
            String hook = c.strings.get(0);
            Set<String> pages = new TreeSet<>();
            for (ClassDef owner : clean.classes.values()) for (Method m : owner.getMethods())
                if (fieldNames(m).contains("search_landing_recycler_container")) pages.add(owner.getType());
            Method stock = pages.size() != 1 ? null
                    : clean.methods.get(pages.iterator().next() + "->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V");
            if (stock == null) { fail("no single Search page onViewCreated, pages " + pages); capability(c.callee, false); return; }
            Method m = actual(stock);
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                Instruction first = instructions(m).get(0);
                placed = sites.get(0) == 0 && first.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && arguments(first).equals(List.of(parameter(m, 0)));
                if (!placed) fail(hook + " isn't the first call, on the root view, in " + m);
                else remove(m, 0, 1);
            }
            capability(c.callee, placed);
        }

        /** The bottom bar's click handler lets the extension take a press before it reads anything. */
        void searchKeyboard(Contract c) {
            ClassDef bar = uniqueClass(clean.classesHolding("BottomNavBar tab insertion out of range"), "navigation view");
            Method stock = bar == null ? null : clean.methods.get(bar.getType() + "->onClick(Landroid/view/View;)V");
            if (stock == null) { fail("the bottom bar has no onClick to guard"); capability(c.callee, false); return; }
            Method m = actual(stock);
            if (m != null) guard(m, c.strings.get(0), 0, List.of(parameter(m, -1), parameter(m, 0)), 0, false, false);
            capability(c.callee, m != null);
        }

        /** The menu folds picked rows as it measures, and the overflow sheet hands its view over first. */
        void pinMenuRows(Contract c) {
            ClassDef layout = menuLayout();
            if (layout == null) { capability(c.callee, false); return; }
            view(layout.getType(), null, null, c.strings.get(0));
            boolean placed = true;
            ClassDef location = clean.classes.get("Lcom/pinterest/feature/GridActionsLocation$PIN_OVERFLOW_MENU_MODAL_FRAGMENT;");
            if (location != null) {
                Set<String> named = new TreeSet<>();
                for (Method init : location.getMethods()) if (init.getName().equals("<init>"))
                    for (Instruction i : instructions(init)) if (i.getOpcode() == Opcode.CONST_CLASS) named.add(String.valueOf(reference(i)));
                ClassDef fragment = named.size() == 1 ? clean.classes.get(named.iterator().next()) : null;
                Method m = fragment == null ? null : actual(viewCreated(fragment));
                placed = false;
                if (m == null) fail("pin menu sheet has no onViewCreated to hook");
                else {
                    List<Integer> sites = calls(m, c.strings.get(1), 1);
                    if (sites.size() == 1) {
                        Instruction first = instructions(m).get(0);
                        placed = sites.get(0) == 0 && first.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                                && arguments(first).equals(List.of(parameter(m, 0)));
                        if (!placed) fail(c.strings.get(1) + " isn't the first call, on the sheet's view, in " + m);
                        else remove(m, 0, 1);
                    }
                }
            }
            capability(c.callee, placed && canOverride(layout.getType(), "onMeasure", "(II)V"));
        }

        /** The one call in a method that passes the method's own argument to one of the header types. */
        int boardTabCall(Method m, Set<String> headers) {
            int at = -1;
            List<Instruction> body = instructions(m);
            for (int i = 0; i < body.size(); i++) {
                if (body.get(i).getOpcode() != Opcode.INVOKE_VIRTUAL || !(reference(body.get(i)) instanceof MethodReference)) continue;
                MethodReference called = (MethodReference) reference(body.get(i));
                if (!headers.contains(called.getDefiningClass()) || !called.getReturnType().equals("V")
                        || called.getParameterTypes().size() != 1
                        || !called.getParameterTypes().get(0).toString().equals(m.getParameterTypes().get(0).toString())) continue;
                if (at >= 0) return -1;
                at = i;
            }
            return at;
        }

        Method boardTabBinding() {
            List<Method> found = new ArrayList<>();
            for (Method style : clean.holding("com.pinterest.STRUCTURED_FEED_LANDING_PAGE_HEADER_STYLE")) {
                if (!style.getParameterTypes().isEmpty() || !style.getReturnType().equals("Z")) continue;
                ClassDef owner = clean.classes.get(style.getDefiningClass());
                Set<String> headers = new TreeSet<>();
                for (Field field : owner.getInstanceFields()) {
                    ClassDef type = clean.classes.get(field.getType());
                    if (type != null && "Landroid/widget/LinearLayout;".equals(type.getSuperclass())) headers.add(field.getType());
                }
                for (Method m : owner.getMethods())
                    if (m.getImplementation() != null && m.getReturnType().equals("V") && m.getParameterTypes().size() == 1
                            && boardTabCall(m, headers) >= 0) found.add(m);
            }
            return unique(found, "board tab screen binding");
        }

        /** The screen hands over its header and itself right before binding the header. */
        void boardTabHeader(Contract c) {
            String hook = c.strings.get(0);
            Method m = actual(boardTabBinding());
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                int at = sites.get(0);
                List<Instruction> body = instructions(m);
                Instruction next = at + 1 < body.size() ? body.get(at + 1) : null;
                placed = next != null && next.getOpcode() == Opcode.INVOKE_VIRTUAL && !arguments(next).isEmpty()
                        && arguments(body.get(at)).equals(List.of(arguments(next).get(0), parameter(m, -1)));
                if (!placed) fail(hook + " isn't right before the header call, with the header and the screen, in " + m);
                else remove(m, at, at + 1);
            }
            capability(c.callee, placed);
        }

        /** The one call in a method loading into a web image the String read just before it. */
        int boardTabCoverLoad(Method m) {
            int at = -1;
            List<Instruction> body = instructions(m);
            for (int i = 1; i < body.size(); i++) {
                Instruction call = body.get(i);
                if (call.getOpcode() != Opcode.INVOKE_VIRTUAL || !(reference(call) instanceof MethodReference)) continue;
                MethodReference called = (MethodReference) reference(call);
                if (!called.getDefiningClass().equals("Lcom/pinterest/ui/imageview/GenericWebImageView;")
                        || !called.getReturnType().equals("V") || called.getParameterTypes().size() != 1
                        || !called.getParameterTypes().get(0).toString().equals("Ljava/lang/String;")) continue;
                Instruction read = body.get(i - 1);
                if (read.getOpcode() != Opcode.IGET_OBJECT || !(reference(read) instanceof FieldReference)
                        || !((FieldReference) reference(read)).getType().equals("Ljava/lang/String;")
                        || arguments(call).size() != 2 || firstRegister(read) != arguments(call).get(1)) continue;
                if (at >= 0) return -1;
                at = i;
            }
            return at;
        }

        Method boardTabCoverBinding() {
            Method binding = boardTabBinding();
            String data = binding.getParameterTypes().get(0).toString();
            Set<String> inner = new TreeSet<>();
            for (Field header : clean.classes.get(binding.getDefiningClass()).getInstanceFields()) {
                ClassDef outer = clean.classes.get(header.getType());
                if (outer == null || !"Landroid/widget/LinearLayout;".equals(outer.getSuperclass())) continue;
                for (Field part : outer.getInstanceFields()) {
                    ClassDef type = clean.classes.get(part.getType());
                    if (type != null && "Landroidx/constraintlayout/widget/ConstraintLayout;".equals(type.getSuperclass()))
                        inner.add(part.getType());
                }
            }
            List<Method> found = new ArrayList<>();
            for (String type : inner) for (Method m : clean.classes.get(type).getMethods())
                if (m.getImplementation() != null && m.getReturnType().equals("V") && m.getParameterTypes().size() == 1
                        && m.getParameterTypes().get(0).toString().equals(data) && boardTabCoverLoad(m) >= 0) found.add(m);
            return unique(found, "board tab cover binding");
        }

        boolean boardTabCoverSkip(List<Instruction> body, Layout layout, int at, int target, int register) {
            Instruction branch = body.get(at);
            return branch.getOpcode() == Opcode.IF_EQZ && firstRegister(branch) == register && branch instanceof OffsetInstruction
                    && layout.addresses.get(at) + ((OffsetInstruction) branch).getCodeOffset() == layout.addresses.get(target);
        }

        /** A null picture goes straight to the load, and a null answer skips the load. */
        void boardTabCovers(Contract c) {
            String hook = c.strings.get(0);
            Method m = actual(boardTabCoverBinding());
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                int at = sites.get(0);
                List<Instruction> body = instructions(m);
                Layout layout = new Layout(m.getImplementation());
                List<Integer> args = arguments(body.get(at));
                placed = at > 0 && at + 4 < body.size() && args.size() == 2
                        && boardTabCoverSkip(body, layout, at - 1, at + 3, args.get(1))
                        && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == args.get(1)
                        && boardTabCoverSkip(body, layout, at + 2, at + 4, args.get(1))
                        && body.get(at + 3).getOpcode() == Opcode.INVOKE_VIRTUAL && arguments(body.get(at + 3)).equals(args);
                if (!placed) fail(hook + " doesn't guard the picture load in " + m);
                else remove(m, at - 1, at + 3);
            }
            capability(c.callee, placed);
        }

        void refresh(Contract c) {
            String type = c.strings.get(1);
            if (c.callee.equals("headerButtons")) {
                Set<String> fields = new HashSet<>();
                ClassDef header = clean.classes.get(type);
                if (header != null) for (Method m : header.getMethods()) fields.addAll(fieldNames(m));
                if (!fields.containsAll(Set.of("start_container_icon_bt", "end_container_icon_bt", "end_container_icon_buttons")))
                    fail("header target does not own all supported icon containers");
            }
            view(type, null, null, c.strings.get(0));
            capability(c.callee, clean.classes.containsKey(type) && canOverride(type, "onMeasure", "(II)V"));
        }

        void navigation(Contract c) {
            ClassDef model = uniqueClass(clean.classesHolding("BottomNavTabModel(type="), "navigation model");
            ClassDef navigation = uniqueClass(clean.classesHolding("BottomNavBar tab insertion out of range"), "navigation view");
            if (model == null || navigation == null) { capability(c.callee, false); return; }
            List<Field> identities = new ArrayList<>();
            for (Field field : model.getFields()) {
                ClassDef type = clean.classes.get(field.getType());
                if (type == null || !"Ljava/lang/Enum;".equals(type.getSuperclass())) continue;
                Set<String> names = new HashSet<>();
                for (Field value : type.getFields()) names.add(value.getName());
                if (names.containsAll(Set.of("HOME", "PROFILE", "CREATE", "NOTIFICATIONS"))) identities.add(field);
            }
            if (identities.size() != 1) fail("navigation model has no unique tab identity");
            List<Method> targets = new ArrayList<>();
            for (Method method : navigation.getMethods()) if (method.getImplementation() != null && method.getReturnType().equals("V")
                    && method.getParameterTypes().size() >= 2 && method.getParameterTypes().get(0).toString().equals(model.getType())
                    && method.getParameterTypes().get(1).toString().equals("I") && namedCalls(method, "setId", "(I)V").size() > 0) targets.add(method);
            Method m = actual(unique(targets, "navigation binding"));
            List<Integer> sites = calls(m, c.strings.get(0), 1);
            if (m != null && sites.size() == 1) {
                int at = sites.get(0);
                List<Instruction> body = instructions(m);
                if (at < 2 || body.get(at - 1).getOpcode() != Opcode.IGET_OBJECT || identities.size() != 1
                        || !identities.get(0).toString().equals(String.valueOf(reference(body.get(at - 1))))
                        || !methodNamed(body.get(at - 2), "setId", "(I)V")) fail("navigation hook is not immediately after its ID and tab read");
                else {
                    TwoRegisterInstruction identity = (TwoRegisterInstruction) body.get(at - 1);
                    List<Integer> nativeArgs = arguments(body.get(at - 2));
                    if (identity.getRegisterB() != parameter(m, 0) || nativeArgs.isEmpty() || identity.getRegisterA() == nativeArgs.get(0)
                            || !arguments(body.get(at)).equals(List.of(nativeArgs.get(0), identity.getRegisterA())))
                        fail("navigation hook reads a different view or model");
                }
                remove(m, at - 1, at + 1);
            }
            // A swapped-in tab view gets its ID in the replacement method and is bound there too.
            List<Method> swaps = new ArrayList<>();
            for (Method method : navigation.getMethods()) if (method.getImplementation() != null && method.getReturnType().equals("V")
                    && method.getParameterTypes().size() == 2 && method.getParameterTypes().get(1).toString().equals("I")
                    && !method.getParameterTypes().get(0).toString().equals(model.getType())
                    && !namedCalls(method, "setId", "(I)V").isEmpty() && !namedCalls(method, "removeViewAt", "(I)V").isEmpty()) swaps.add(method);
            Method r = actual(unique(swaps, "navigation tab replacement"));
            List<Integer> swapSites = calls(r, c.strings.get(0), 1);
            if (r != null && swapSites.size() == 1) {
                int at = swapSites.get(0);
                List<Instruction> body = instructions(r);
                Reference getter = at < 3 ? null : reference(body.get(at - 2));
                boolean shaped = at >= 3 && body.get(at - 2).getOpcode() == Opcode.INVOKE_INTERFACE
                        && body.get(at - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && methodNamed(body.get(at - 3), "setId", "(I)V")
                        && getter instanceof MethodReference && ((MethodReference) getter).getParameterTypes().isEmpty()
                        && ((MethodReference) getter).getDefiningClass().equals(r.getParameterTypes().get(0).toString())
                        && identities.size() == 1 && ((MethodReference) getter).getReturnType().equals(identities.get(0).getType());
                if (!shaped) fail("navigation replacement hook is not immediately after its ID and the replaced tab's identity");
                else {
                    List<Integer> nativeArgs = arguments(body.get(at - 3));
                    int tab = ((OneRegisterInstruction) body.get(at - 1)).getRegisterA();
                    if (!arguments(body.get(at - 2)).equals(List.of(parameter(r, 0))) || nativeArgs.isEmpty() || tab == nativeArgs.get(0)
                            || !arguments(body.get(at)).equals(List.of(nativeArgs.get(0), tab)))
                        fail("navigation replacement hook reads a different view or tab");
                }
                remove(r, at - 2, at + 1);
            }
            view(navigation.getType(), null, null, c.strings.get(1));
            String controls = c.strings.get(0).substring(0, c.strings.get(0).indexOf("->"));
            greetingRow(controls + "->greetingHeader(Landroid/view/View;)V");
            capability(c.callee, m != null && r != null && identities.size() == 1);
        }

        static final String GREETING_ROW_ID = "home_feed_greeting_header_icon_container";
        static final String GREETING_BELL_ID = "home_feed_greeting_header_newshub_icon";

        /**
         * Hide navigation buttons hands Home's greeting header row, where 14.43.0 keeps Create and the
         * bell on accounts whose bottom bar has neither, to [hook] right after the row's last addView
         * (the bell frame's). The builder is the one void method reading both ids, found in the clean
         * target. Nothing may branch to the hook: the branch for a missing row lands on the
         * instruction after it. A target without the builder has nothing to check here.
         */
        void greetingRow(String hook) {
            List<Method> builders = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null || !"V".equals(m.getReturnType())) continue;
                boolean row = false, bell = false;
                for (Instruction i : instructions(m)) { row |= readsId(i, GREETING_ROW_ID); bell |= readsId(i, GREETING_BELL_ID); }
                if (row && bell) builders.add(m);
            }
            if (builders.isEmpty()) return;
            Method was = unique(builders, "greeting header builder");
            Method m = actual(was);
            List<Integer> at = calls(m, hook, 1);
            if (m == null || at.size() != 1) return;
            int k = at.get(0);
            List<Instruction> body = instructions(m), before = instructions(was);
            int row = greetingRowRegister(body), cleanLast = lastRowAdd(before, greetingRowRegister(before));
            if (row < 0 || row != greetingRowRegister(before) || cleanLast < 0 || k != lastRowAdd(body, row) + 1
                    || k + 1 >= body.size() || cleanLast + 1 >= before.size() || !arguments(body.get(k)).equals(List.of(row))
                    || !onlyFrom(m, k, k - 1) || body.get(k + 1).getOpcode() != before.get(cleanLast + 1).getOpcode()) {
                fail(hook + " doesn't hand over the greeting header row right after its last button in " + m);
                return;
            }
            remove(m, k, k + 1);
        }

        /** The register the row lookup is cast into: the row's id, findViewById, move-result-object, check-cast. */
        static int greetingRowRegister(List<Instruction> body) {
            int found = -1;
            for (int k = 0; k + 3 < body.size(); k++) {
                if (!readsId(body.get(k), GREETING_ROW_ID) || !methodNamed(body.get(k + 1), "findViewById", "(I)Landroid/view/View;")
                        || body.get(k + 2).getOpcode() != Opcode.MOVE_RESULT_OBJECT || body.get(k + 3).getOpcode() != Opcode.CHECK_CAST
                        || firstRegister(body.get(k + 2)) != firstRegister(body.get(k + 3))) continue;
                if (found >= 0) return -1;
                found = firstRegister(body.get(k + 3));
            }
            return found;
        }

        /** The last ViewGroup.addView(View) call on [row], or -1. */
        static int lastRowAdd(List<Instruction> body, int row) {
            int last = -1;
            for (int k = 0; k < body.size(); k++) {
                if (methodNamed(body.get(k), "addView", "(Landroid/view/View;)V")
                        && "Landroid/view/ViewGroup;".equals(((MethodReference) reference(body.get(k))).getDefiningClass())
                        && !arguments(body.get(k)).isEmpty() && arguments(body.get(k)).get(0) == row) last = k;
            }
            return last;
        }

        static boolean methodNamed(Instruction i, String name, String shape) {
            Reference r = reference(i);
            return r instanceof MethodReference && ((MethodReference) r).getName().equals(name) && descriptor((MethodReference) r).equals(shape);
        }

        static List<Integer> namedCalls(Method m, String name, String shape) {
            List<Integer> out = new ArrayList<>();
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) if (methodNamed(body.get(at), name, shape)) out.add(at);
            return out;
        }

        ClassDef menuLayout() {
            ClassDef menu = clean.classes.get(PIN_MENU);
            if (menu == null) { fail("pin menu class is absent"); return null; }
            List<ClassDef> types = new ArrayList<>();
            for (Field field : menu.getFields()) if (field.getName().equals("modalView") && clean.classes.containsKey(field.getType()))
                types.add(clean.classes.get(field.getType()));
            return uniqueClass(types, "pin menu layout");
        }

        void menu(Contract c) {
            ClassDef layout = menuLayout();
            if (layout == null) { capability(c.callee, false); return; }
            List<Method> constructors = new ArrayList<>();
            for (Method m : layout.getMethods()) if (m.getName().equals("<init>") && m.getImplementation() != null) constructors.add(m);
            Method m = actual(unique(constructors, "pin menu constructor"));
            String[] keys = c.strings.get(1).split(",");
            List<Integer> sites = calls(m, c.strings.get(0), keys.length);
            Set<String> found = new HashSet<>();
            if (m != null) for (int at : sites) {
                List<Instruction> body = instructions(m);
                if (at < 3 || !(reference(body.get(at - 1)) instanceof StringReference)
                        || body.get(at - 2).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                        || !(reference(body.get(at - 3)) instanceof MethodReference)
                        || !((MethodReference) reference(body.get(at - 3))).getReturnType().equals("Landroid/widget/RelativeLayout;")) {
                    fail("pin menu hook is not attached to a native row result"); continue;
                }
                String key = ((StringReference) reference(body.get(at - 1))).getString();
                if (!Arrays.asList(keys).contains(key) || !found.add(key)
                        || !arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 2)), firstRegister(body.get(at - 1)))))
                    fail("pin menu hook has a duplicated key or the wrong row registers");
                boolean resource = false;
                for (int i = Math.max(0, at - 23); i < at - 2; i++) if (reference(body.get(i)) instanceof FieldReference
                        && ((FieldReference) reference(body.get(i))).getName().equals(key)) resource = true;
                if (!resource) fail("pin menu key " + key + " is routed to a different resource row");
                remove(m, at - 1, at + 1);
            }
            if (found.size() != keys.length) fail("pin menu does not cover all dedicated rows");
            capability(c.callee, m != null);
        }

        void downloads(Contract c) {
            ClassDef menu = clean.classes.get(c.strings.get(1));
            List<Method> creators = new ArrayList<>();
            if (menu != null) for (Method m : menu.getMethods()) if (m.getName().equals("createModalView") && m.getImplementation() != null) creators.add(m);
            Method m = actual(unique(creators, "download menu creation"));
            List<Integer> sites = calls(m, c.strings.get(0), 1);
            if (m != null && sites.size() == 1) {
                int at = sites.get(0);
                List<Instruction> body = instructions(m);
                if (at < 1 || body.get(at - 1).getOpcode() != Opcode.IPUT_OBJECT
                        || !(reference(body.get(at - 1)) instanceof FieldReference)
                        || !((FieldReference) reference(body.get(at - 1))).getName().equals("modalView")
                        || !((FieldReference) reference(body.get(at - 1))).getDefiningClass().equals(PIN_MENU)
                        || !arguments(body.get(at)).equals(List.of(parameter(m, -1)))) fail("download hook is not after its own menu view assignment");
                remove(m, at, at + 1);
            }
            String downloads = BASE + "actions/PinDownloads;";
            // Pinterest's own Download image row is marked once, straight off its row factory's result.
            ClassDef layout = menuLayout();
            if (layout != null) {
                List<Method> inits = new ArrayList<>();
                for (Method candidate : layout.getMethods()) if (candidate.getName().equals("<init>") && candidate.getImplementation() != null) inits.add(candidate);
                Method init = actual(unique(inits, "download menu constructor"));
                List<Integer> marks = calls(init, downloads + "->nativeRow(Landroid/view/View;)V", 1);
                if (init != null && marks.size() == 1) {
                    int at = marks.get(0);
                    List<Instruction> body = instructions(init);
                    boolean titled = false;
                    for (int i = Math.max(0, at - 9); i < at - 2; i++) if (reference(body.get(i)) instanceof FieldReference title
                            && title.getName().equals("save_to_device")) titled = true;
                    if (at < 2 || body.get(at - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                            || !(reference(body.get(at - 2)) instanceof MethodReference factory)
                            || !factory.getReturnType().equals("Landroid/widget/RelativeLayout;")
                            || !arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 1)))) || !titled)
                        fail("download row mark is not on Pinterest's own Download image row");
                    remove(init, at, at + 1);
                }
            }
            downloadSheet(downloads, menu);
            bridge(downloads + "->menuPin(Ljava/lang/Object;)Ljava/lang/Object;", PIN_MENU, "hushDownloadPin", "()Ljava/lang/Object;");
            bridge(downloads + "->menuView(Ljava/lang/Object;)Landroid/view/ViewGroup;", PIN_MENU, "hushDownloadMenu", "()Landroid/view/ViewGroup;");
            bridge(downloads + "->menuOrigin(Ljava/lang/Object;)Landroid/view/View;", PIN_MENU, "hushDownloadOrigin", "()Landroid/view/View;");
            bridge(downloads + "->menuCloseup(Ljava/lang/Object;)Z", PIN_MENU, "hushDownloadCloseup", "()Z");
            bridge(downloads + "->dismissMenu(Ljava/lang/Object;)V", PIN_MENU, "hushDismissDownload", "()V");
            Method cellPin = actual(downloads + "->cellPin(Landroid/view/View;)Ljava/lang/Object;");
            if (cellPin != null && menu != null) {
                String pinType = "";
                for (Field field : menu.getFields()) if (field.getName().equals("pin")) pinType = field.getType();
                List<Method> cells = new ArrayList<>();
                for (ClassDef owner : clean.classes.values()) if (AccessFlags.INTERFACE.isSet(owner.getAccessFlags())) {
                    boolean pinSetter = false;
                    for (Method method : owner.getMethods()) if (method.getName().equals("setPin") && descriptor(method).equals("(" + pinType + "I)V")) pinSetter = true;
                    if (pinSetter) for (Method method : owner.getMethods()) if (method.getName().equals("getInternalCell") && method.getParameterTypes().isEmpty()) cells.add(method);
                }
                Method cell = unique(cells, "typed pin grid cell interface");
                List<Instruction> body = instructions(cellPin);
                List<Opcode> expected = List.of(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE,
                        Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT,
                        Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT);
                if (cell == null || !body.stream().map(Instruction::getOpcode).toList().equals(expected)) fail("download grid getter has no typed bounded cell contract");
                else {
                    int input = parameter(cellPin, 0), result = firstRegister(body.get(0));
                    Layout code = new Layout(cellPin.getImplementation());
                    if (!cell.getDefiningClass().equals(String.valueOf(reference(body.get(0))))
                            || !cell.getDefiningClass().equals(String.valueOf(reference(body.get(2))))
                            || ((TwoRegisterInstruction) body.get(0)).getRegisterB() != input || firstRegister(body.get(2)) != input
                            || !cell.toString().equals(String.valueOf(reference(body.get(3)))) || !arguments(body.get(3)).equals(List.of(input))
                            || !(cell.getReturnType() + "->getPin()" + pinType).equals(String.valueOf(reference(body.get(6))))
                            || !arguments(body.get(6)).equals(List.of(result)) || ((NarrowLiteralInstruction) body.get(9)).getNarrowLiteral() != 0)
                        fail("download grid getter reads an unrelated model or cell");
                    for (int at : List.of(1, 4, 5, 7, 8, 9, 10)) if (firstRegister(body.get(at)) != result) fail("download grid getter loses its pin register");
                    for (int at : List.of(1, 5)) if (code.addresses.get(at) + ((OffsetInstruction) body.get(at)).getCodeOffset() != code.addresses.get(9))
                        fail("download grid getter lost its absent-cell fallback");
                }
            }
            Method row = actual(downloads + "->menuRow(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/view/View;");
            if (row != null && layout != null) {
                List<Instruction> body = instructions(row);
                List<Method> factories = new ArrayList<>();
                for (Method candidate : layout.getMethods()) if (candidate.getReturnType().equals("Landroid/widget/RelativeLayout;")
                        && candidate.getParameterTypes().size() == 2 && AccessFlags.PUBLIC.isSet(candidate.getAccessFlags())
                        && !AccessFlags.STATIC.isSet(candidate.getAccessFlags())
                        && candidate.getParameterTypes().stream().filter(p -> p.toString().equals("Ljava/lang/String;")).count() == 1) {
                    String icon = candidate.getParameterTypes().stream().map(Object::toString).filter(p -> !p.equals("Ljava/lang/String;")).findFirst().orElse("");
                    ClassDef iconType = clean.classes.get(icon);
                    int downloadsFound = 0;
                    if (iconType != null) for (Field field : iconType.getFields()) if (field.getName().equals("DOWNLOAD") && field.getType().equals(icon)
                            && AccessFlags.STATIC.isSet(field.getAccessFlags())) downloadsFound++;
                    if (downloadsFound == 1) factories.add(candidate);
                }
                Method factory = unique(factories, "native download row factory");
                if (body.size() != 5 || body.get(0).getOpcode() != Opcode.CHECK_CAST || !layout.getType().equals(String.valueOf(reference(body.get(0))))
                        || firstRegister(body.get(0)) != parameter(row, 0) || body.get(1).getOpcode() != Opcode.SGET_OBJECT
                        || !(reference(body.get(1)) instanceof FieldReference) || !((FieldReference) reference(body.get(1))).getName().equals("DOWNLOAD")
                        || factory == null || !factory.toString().equals(String.valueOf(reference(body.get(2))))
                        || body.get(3).getOpcode() != Opcode.MOVE_RESULT_OBJECT || body.get(4).getOpcode() != Opcode.RETURN_OBJECT
                        || firstRegister(body.get(3)) != firstRegister(body.get(4))) fail("download row stub has no native themed row contract");
                else {
                    int stringAt = factory.getParameterTypes().get(0).toString().equals("Ljava/lang/String;") ? 0 : 1;
                    List<Integer> args = stringAt == 0 ? List.of(parameter(row, 0), parameter(row, 1), firstRegister(body.get(1)))
                            : List.of(parameter(row, 0), firstRegister(body.get(1)), parameter(row, 1));
                    if (!arguments(body.get(2)).equals(args)) fail("download row factory receives the wrong icon or title");
                }
            }
            for (String name : List.of("hushDownloadPin", "hushDownloadMenu", "hushDownloadOrigin", "hushDownloadCloseup", "hushDismissDownload")) {
                List<Method> bridges = new ArrayList<>();
                ClassDef owner = patched.classes.get(PIN_MENU);
                if (owner != null) for (Method method : owner.getMethods()) if (method.getName().equals(name)) bridges.add(method);
                if (bridges.size() != 1 || !AccessFlags.PUBLIC.isSet(bridges.get(0).getAccessFlags())
                        || AccessFlags.STATIC.isSet(bridges.get(0).getAccessFlags())) fail("download native bridge " + name + " is missing or inaccessible");
                else {
                    List<Instruction> body = instructions(bridges.get(0));
                    if (body.isEmpty()) { fail("download native bridge " + name + " has no instructions"); continue; }
                    if (body.get(0).getOpcode() != (name.equals("hushDownloadCloseup") ? Opcode.IGET_BOOLEAN : Opcode.IGET_OBJECT) || !(reference(body.get(0)) instanceof FieldReference)
                            || !((FieldReference) reference(body.get(0))).getDefiningClass().equals(PIN_MENU)) fail("download native bridge " + name + " reads no menu field");
                    else {
                        String expectedField = name.equals("hushDownloadPin") ? "pin" : name.equals("hushDownloadMenu") ? "modalView"
                                : name.equals("hushDownloadOrigin") ? "originView" : name.equals("hushDownloadCloseup") ? "isPinCloseup" : "presenter";
                        if (!((FieldReference) reference(body.get(0))).getName().equals(expectedField)
                                || ((TwoRegisterInstruction) body.get(0)).getRegisterB() != parameter(bridges.get(0), -1))
                            fail("download native bridge " + name + " reads the wrong receiver or field");
                    }
                    if (!name.equals("hushDismissDownload") && (body.size() != 2 || body.get(1).getOpcode() != (name.equals("hushDownloadCloseup") ? Opcode.RETURN : Opcode.RETURN_OBJECT)
                            || firstRegister(body.get(0)) != firstRegister(body.get(1)))) fail("download native getter " + name + " is not a field read and return");
                    if (name.equals("hushDismissDownload")) {
                        FieldReference presenter = reference(body.get(0)) instanceof FieldReference ? (FieldReference) reference(body.get(0)) : null;
                        List<Method> dismissals = new ArrayList<>();
                        ClassDef presenterType = presenter == null ? null : clean.classes.get(presenter.getType());
                        if (presenterType != null) for (Method method : presenterType.getMethods()) if (descriptor(method).equals("()V")
                                && AccessFlags.PUBLIC.isSet(method.getAccessFlags()) && dismissal(instructions(method).stream().map(Instruction::getOpcode).toList())) dismissals.add(method);
                        if (dismissals.size() != 1 || body.size() != 4 || body.get(1).getOpcode() != Opcode.IF_EQZ
                                || !dismissals.get(0).toString().equals(String.valueOf(reference(body.get(2))))
                                || !arguments(body.get(2)).equals(List.of(firstRegister(body.get(0)))) || body.get(3).getOpcode() != Opcode.RETURN_VOID)
                            fail("download dismissal bridge no longer dispatches its native presenter event");
                        else {
                            Layout nativeLayout = new Layout(bridges.get(0).getImplementation());
                            if (firstRegister(body.get(1)) != firstRegister(body.get(0)) || nativeLayout.addresses.get(1)
                                    + ((OffsetInstruction) body.get(1)).getCodeOffset() != nativeLayout.addresses.get(3)) fail("download dismissal bridge lost its absent-presenter fallback");
                        }
                    }
                }
            }
            capability(c.callee, m != null && layout != null);
        }

        /**
         * The long-press menu's Download button: one call at the head of the menu's show method with
         * the menu and its event, nothing borrowed, and seven stubs bound to the members the clean APK
         * has for them: the event's pin, the menu's shown id, the pin's id getter, the menu's button
         * list and layout method, a button's detached mark and spring driver, and Pinterest's own
         * button model, icon, string, factory and styler. The newer menu is claimed with them.
         */
        void longPress(Contract c) {
            String menuType = c.strings.get(1);
            String item = "Lcom/pinterest/ui/menu/ContextMenuItemView;";
            String arrayList = "Ljava/util/ArrayList;";
            ClassDef menu = clean.classes.get(menuType);
            List<Method> shows = new ArrayList<>(), lists = new ArrayList<>();
            if (menu != null) for (Method method : menu.getMethods()) {
                if (method.getImplementation() == null || AccessFlags.STATIC.isSet(method.getAccessFlags())) continue;
                List<String> parameters = method.getParameterTypes().stream().map(Object::toString).toList();
                if (parameters.size() == 2 && parameters.stream().allMatch(p -> p.startsWith("L") && !p.startsWith("Ljava/") && !p.startsWith("Landroid/")))
                    shows.add(method);
                if (method.getReturnType().equals("V") && parameters.equals(List.of("Ljava/util/List;"))
                        && AccessFlags.PUBLIC.isSet(method.getAccessFlags()) && AccessFlags.FINAL.isSet(method.getAccessFlags())) lists.add(method);
            }
            Method show = unique(shows, "long-press menu show method");
            Method list = unique(lists, "long-press menu item list method");
            Method m = actual(show);
            List<Integer> sites = calls(m, c.strings.get(0), 1);
            if (m != null && sites.size() == 1) {
                if (sites.get(0) != 0 || !arguments(instructions(m).get(0)).equals(List.of(parameter(m, -1), parameter(m, 0))))
                    fail("long-press hook is not the show method's first instruction with the menu and its event");
                remove(m, sites.get(0), sites.get(0) + 1);
            }

            // The clean members each stub has to name, found the way the patch finds them.
            String event = show == null ? null : show.getParameterTypes().get(0).toString();
            ClassDef eventClass = event == null ? null : clean.classes.get(event);
            ClassDef pinMenu = clean.classes.get(PIN_MENU);
            String pin = null;
            if (pinMenu != null) for (Field field : pinMenu.getFields()) if (field.getName().equals("pin")) pin = field.getType();
            ClassDef pinClass = pin == null ? null : clean.classes.get(pin);
            List<Field> models = new ArrayList<>();
            if (eventClass != null && pinClass != null) for (Field field : eventClass.getFields())
                if (!AccessFlags.STATIC.isSet(field.getAccessFlags()) && pinClass.getInterfaces().contains(field.getType())) models.add(field);
            if (models.size() != 1) fail("long-press event has " + models.size() + " pin interface fields, expected 1");
            Field model = models.size() == 1 ? models.get(0) : null;
            ClassDef face = model == null ? null : clean.classes.get(model.getType());
            List<Method> getters = new ArrayList<>();
            if (face != null) for (Method method : face.getMethods()) if (AccessFlags.ABSTRACT.isSet(method.getAccessFlags())
                    && method.getParameterTypes().isEmpty() && method.getReturnType().equals("Ljava/lang/String;")) getters.add(method);
            Method getter = unique(getters, "long-press pin id getter");
            List<Field> shownFields = new ArrayList<>();
            if (menu != null) for (Field field : menu.getFields())
                if (!AccessFlags.STATIC.isSet(field.getAccessFlags()) && field.getType().equals("Ljava/lang/String;")) shownFields.add(field);
            if (shownFields.size() != 1) fail("long-press menu has " + shownFields.size() + " shown id fields, expected 1");
            // The button list is the ArrayList field whose value the list method hands to add().
            Set<String> added = new TreeSet<>();
            if (list != null) {
                List<Instruction> body = instructions(list);
                for (int at = 0; at < body.size(); at++) {
                    if (body.get(at).getOpcode() != Opcode.IGET_OBJECT || !(reference(body.get(at)) instanceof FieldReference field)
                            || !field.getDefiningClass().equals(menuType) || !field.getType().equals(arrayList)) continue;
                    int held = firstRegister(body.get(at));
                    for (int next = at + 1; next < body.size(); next++) {
                        Instruction i = body.get(next);
                        if (String.valueOf(reference(i)).equals(arrayList + "->add(Ljava/lang/Object;)Z") && !arguments(i).isEmpty()
                                && arguments(i).get(0) == held) { added.add(field.toString()); break; }
                        if (i.getOpcode().setsRegister() && firstRegister(i) == held) break;
                    }
                }
            }
            if (added.size() != 1) fail("long-press menu list method adds to " + added.size() + " button lists, expected 1");
            List<ClassDef> buttonModels = new ArrayList<>(), strings = new ArrayList<>();
            for (Method method : clean.holding("ContextMenuItemIcon(iconResId=")) if (method.getName().equals("toString")
                    && clean.classes.get(method.getDefiningClass()) != null && !buttonModels.contains(clean.classes.get(method.getDefiningClass())))
                buttonModels.add(clean.classes.get(method.getDefiningClass()));
            ClassDef buttonModel = uniqueClass(buttonModels, "long-press menu button model");
            String icon = null;
            if (buttonModel != null) for (Method method : buttonModel.getMethods()) if (method.getName().equals("<init>")
                    && method.getParameterTypes().size() == 4 && method.getParameterTypes().subList(1, 4).stream().map(Object::toString).toList()
                    .equals(List.of("I", "I", "Lkotlin/jvm/functions/Function0;"))) icon = method.getParameterTypes().get(0).toString();
            List<Method> factories = new ArrayList<>(), stylers = new ArrayList<>();
            for (ClassDef owner : clean.classes.values()) {
                if (owner.getType().startsWith(OWN)) continue;
                Set<String> statics = new HashSet<>();
                for (Field field : owner.getStaticFields()) if (field.getType().equals("I")) statics.add(field.getName());
                if (statics.contains("download") && statics.contains("contextmenu_share")) strings.add(owner);
                for (Method method : owner.getMethods()) {
                    if (!AccessFlags.STATIC.isSet(method.getAccessFlags()) || method.getImplementation() == null) continue;
                    List<String> parameters = method.getParameterTypes().stream().map(Object::toString).toList();
                    if (buttonModel != null && method.getReturnType().equals(item) && parameters.equals(List.of("Landroid/content/Context;", buttonModel.getType())))
                        factories.add(method);
                    if (method.getReturnType().equals("V") && parameters.equals(List.of(item)) && instructions(method).stream().anyMatch(i ->
                            reference(i) instanceof FieldReference field && field.getName().equals("themed_sema_color_icon_inverse"))) stylers.add(method);
                }
            }
            Method factory = unique(factories, "long-press menu button factory");
            Method styler = unique(stylers, "long-press menu button styler");
            ClassDef stringsClass = uniqueClass(strings, "long-press Download string class");
            boolean resolved = m != null && list != null && model != null && getter != null && shownFields.size() == 1 && added.size() == 1
                    && icon != null && factory != null && styler != null && stringsClass != null;

            if (resolved) {
                String own = BASE + "actions/LongPressDownload;->";
                String faceType = model.getType(), shown = shownFields.get(0).getName(), modelType = buttonModel.getType();
                stub(own + "eventPin(Ljava/lang/Object;)Ljava/lang/Object;", List.of(Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.IGET_OBJECT,
                        Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT),
                        Arrays.asList(null, event, event + "->" + model.getName() + ":" + faceType, pin, null, null, null, null));
                stub(own + "menuModel(Ljava/lang/Object;)Ljava/lang/String;", List.of(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT),
                        Arrays.asList(menuType, menuType + "->" + shown + ":Ljava/lang/String;", null));
                stub(own + "modelId(Ljava/lang/Object;)Ljava/lang/String;", List.of(Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE,
                        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), Arrays.asList(faceType, getter.toString(), null, null));
                stub(own + "menuItems(Ljava/lang/Object;)Ljava/util/ArrayList;", List.of(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT),
                        Arrays.asList(menuType, added.iterator().next(), null));
                stub(own + "layoutItems(Ljava/lang/Object;Ljava/util/List;)V", List.of(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID),
                        Arrays.asList(menuType, list.toString(), null));
                Method button = stub(own + "downloadItem(Landroid/content/Context;)Landroid/view/View;", List.of(Opcode.NEW_INSTANCE,
                        Opcode.SGET_OBJECT, Opcode.SGET, Opcode.CONST_4, Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
                        Opcode.INVOKE_STATIC, Opcode.RETURN_OBJECT), Arrays.asList(modelType, icon + "->DOWNLOAD:" + icon,
                        stringsClass.getType() + "->download:I", null, modelType + "-><init>(" + icon + "IILkotlin/jvm/functions/Function0;)V",
                        factory.toString(), null, styler.toString(), null));
                if (button != null) {
                    List<Instruction> body = instructions(button);
                    int made = firstRegister(body.get(0)), shaped = firstRegister(body.get(6));
                    if (!arguments(body.get(4)).equals(List.of(made, firstRegister(body.get(1)), firstRegister(body.get(2)), firstRegister(body.get(2)),
                            firstRegister(body.get(3)))) || ((NarrowLiteralInstruction) body.get(3)).getNarrowLiteral() != 0
                            || !arguments(body.get(5)).equals(List.of(parameter(button, 0), made))
                            || !arguments(body.get(7)).equals(List.of(shaped)) || firstRegister(body.get(8)) != shaped)
                        fail("long-press download button stub builds the button from the wrong registers");
                }
                // A button the hook put back gets its springs back: the boolean its detach handler
                // sets and the job that handler cancels, both cleared from one zero.
                String[] springs = springReset(item);
                if (springs == null) {
                    fail("long-press menu button has no single detached mark and spring driver to clear");
                    resolved = false;
                } else {
                    Method reset = stub(own + "springsReattached(Ljava/lang/Object;)V", List.of(Opcode.CHECK_CAST, Opcode.CONST_4,
                            Opcode.IPUT_BOOLEAN, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID), Arrays.asList(item, null, springs[0], springs[1], null));
                    if (reset != null) {
                        List<Instruction> body = instructions(reset);
                        int held = parameter(reset, 0), zero = firstRegister(body.get(1));
                        if (firstRegister(body.get(0)) != held || zero == held || ((NarrowLiteralInstruction) body.get(1)).getNarrowLiteral() != 0
                                || firstRegister(body.get(2)) != zero || ((TwoRegisterInstruction) body.get(2)).getRegisterB() != held
                                || firstRegister(body.get(3)) != zero || ((TwoRegisterInstruction) body.get(3)).getRegisterB() != held)
                            fail("long-press springs reset doesn't clear the button's own mark and driver from a zero");
                    }
                }
                if (!longPressCompose(c.strings.get(2), c.strings.get(3), event, faceType, pin, icon, stringsClass.getType())) resolved = false;
            }
            if (resolved) longPressButton = new String[] {icon, buttonModel.getType(), factory.toString(), styler.toString()};
            capability(c.callee, resolved);
        }

        /**
         * Long-press View (#37): the round menu's button built the way Download's is, with Pinterest's
         * full-screen icon and the label the extension hands it, and the newer list's icon and label
         * pair. A build whose icon set has no public MAXIMIZE keeps both stubs answering null, and
         * View stays out of both menus.
         */
        void longPressView(Contract c) {
            String item = c.strings.get(0), compose = c.strings.get(1), pair = "Lkotlin/Pair;";
            String[] button = longPressButton;
            ClassDef icons = button == null ? null : clean.classes.get(button[0]);
            boolean maximize = false;
            if (icons != null) for (Field f : icons.getStaticFields()) maximize |= f.getName().equals("MAXIMIZE") && f.getType().equals(button[0])
                    && AccessFlags.PUBLIC.isSet(f.getAccessFlags());
            if (!maximize) {
                for (String key : List.of(item, compose)) stub(key, List.of(Opcode.CONST_4, Opcode.RETURN_OBJECT), Arrays.asList(null, null));
                capability(c.callee, false);
                return;
            }
            String icon = button[0], model = button[1];
            Method view = stub(item, List.of(Opcode.NEW_INSTANCE, Opcode.SGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_DIRECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_OBJECT), Arrays.asList(model, icon + "->MAXIMIZE:" + icon, null,
                    model + "-><init>(" + icon + "IILkotlin/jvm/functions/Function0;)V", button[2], null, button[3], null));
            boolean built = view != null;
            if (view != null) {
                List<Instruction> body = instructions(view);
                int made = firstRegister(body.get(0)), label = parameter(view, 1), shaped = firstRegister(body.get(5));
                if (!arguments(body.get(3)).equals(List.of(made, firstRegister(body.get(1)), label, label, firstRegister(body.get(2))))
                        || ((NarrowLiteralInstruction) body.get(2)).getNarrowLiteral() != 0
                        || !arguments(body.get(4)).equals(List.of(parameter(view, 0), made))
                        || !arguments(body.get(6)).equals(List.of(shaped)) || firstRegister(body.get(7)) != shaped) {
                    fail("long-press View button stub builds the button from the wrong registers"); built = false;
                }
            }
            Method label = stub(compose, List.of(Opcode.NEW_INSTANCE, Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
                    Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT), Arrays.asList(pair, icon + "->MAXIMIZE:" + icon,
                    "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;", null, pair + "-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", null));
            boolean paired = label != null;
            if (label != null) {
                List<Instruction> body = instructions(label);
                int made = firstRegister(body.get(0)), boxed = firstRegister(body.get(3));
                if (!arguments(body.get(2)).equals(List.of(parameter(label, 0)))
                        || !arguments(body.get(4)).equals(List.of(made, firstRegister(body.get(1)), boxed)) || firstRegister(body.get(5)) != made) {
                    fail("newer long-press menu View stub pairs the wrong registers"); paired = false;
                }
            }
            capability(c.callee, built && paired);
        }

        /**
         * The newer long-press menu accounts in android_longpress_menu_v2 get in place of the round
         * one (#16, #18): one call replacing the option list the dispatcher builds, a pin read and one
         * call ahead of the tap effect's first action that skips them all when it answers true, and
         * three stubs naming the option interface, Pinterest's Download icon and label, and the enum.
         */
        /** The indices of [m]'s parameters whose class extends [event]. */
        List<Integer> eventParameters(Method m, String event) {
            List<Integer> out = new ArrayList<>();
            List<? extends CharSequence> types = m.getParameterTypes();
            for (int p = 0; p < types.size(); p++) {
                ClassDef parameter = clean.classes.get(types.get(p).toString());
                if (parameter != null && event.equals(parameter.getSuperclass())) out.add(p);
            }
            return out;
        }

        boolean longPressCompose(String itemsHook, String clickHook, String event, String model, String pin, String icon, String strings) {
            String own = BASE + "actions/LongPressDownload;->", pair = "Lkotlin/Pair;";
            List<ClassDef> faces = new ArrayList<>();
            for (ClassDef owner : clean.classes.values()) {
                if (owner.getType().startsWith(OWN) || !AccessFlags.INTERFACE.isSet(owner.getAccessFlags())
                        || !AccessFlags.PUBLIC.isSet(owner.getAccessFlags())) continue;
                Set<String> shapes = new TreeSet<>();
                int count = 0;
                for (Method method : owner.getMethods()) {
                    count++;
                    if (AccessFlags.ABSTRACT.isSet(method.getAccessFlags())) shapes.add(method.getName() + descriptor(method));
                }
                if (count == 2 && shapes.equals(Set.of("iconAndLabel()Lkotlin/Pair;", "getAnalyticsName()Ljava/lang/String;"))) faces.add(owner);
            }
            ClassDef face = uniqueClass(faces, "newer long-press menu option interface");
            List<ClassDef> enums = new ArrayList<>();
            if (face != null) for (ClassDef owner : clean.classes.values()) {
                if (!owner.getInterfaces().contains(face.getType()) || !AccessFlags.ENUM.isSet(owner.getAccessFlags())) continue;
                Set<String> names = new HashSet<>();
                for (Field field : owner.getStaticFields()) if (field.getType().equals(owner.getType())) names.add(field.getName());
                if (names.containsAll(List.of("REPIN", "SEND", "VISUAL_SEARCH"))) enums.add(owner);
            }
            ClassDef kinds = uniqueClass(enums, "newer long-press menu options");
            if (kinds == null) return false;
            String type = kinds.getType();
            String repin = type + "->REPIN:" + type, send = type + "->SEND:" + type, search = type + "->VISUAL_SEARCH:" + type;

            List<Method> dispatchers = new ArrayList<>();
            for (Method method : clean.holding("android_longpress_menu_v2")) {
                // Up to 14.43.0 the event bus handler itself, from 14.44.0 a helper it hands the
                // activity, the event and the fragment to: one parameter is the pin long-press event.
                if (AccessFlags.STATIC.isSet(method.getAccessFlags()) || !method.getReturnType().equals("V")
                        || eventParameters(method, event).size() != 1) continue;
                List<Instruction> body = instructions(method);
                // The event's pin through its getter, or (14.43.0 on, the getter inlined) straight from its field.
                if (body.stream().anyMatch(i -> reference(i) instanceof MethodReference call && call.getDefiningClass().equals(event)
                                && call.getReturnType().equals(model) && call.getParameterTypes().isEmpty()
                                || i.getOpcode() == Opcode.IGET_OBJECT && reference(i) instanceof FieldReference field
                                && field.getDefiningClass().equals(event) && field.getType().equals(model))
                        && body.stream().anyMatch(i -> i.getOpcode() == Opcode.CHECK_CAST && String.valueOf(reference(i)).equals(pin))
                        && body.stream().anyMatch(i -> String.valueOf(reference(i)).startsWith("Landroidx/compose/ui/platform/ComposeView;"))) dispatchers.add(method);
            }
            Method dispatcher = unique(dispatchers, "newer long-press menu dispatcher");
            Method shown = actual(dispatcher);
            List<Integer> sites = calls(shown, itemsHook, 1);
            if (shown != null && sites.size() == 1) {
                List<Instruction> body = instructions(shown);
                int at = sites.get(0);
                // A list past v15 takes a range call, with a copy of the event in the register after the list.
                boolean ranged = at >= 1 && body.get(at).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                        && body.get(at - 1).getOpcode() == Opcode.MOVE_OBJECT_FROM16;
                int listed = ranged ? at - 1 : at;
                Instruction built = listed < 2 ? null : body.get(listed - 1), builder = listed < 2 ? null : body.get(listed - 2);
                Method building = builder == null ? null : clean.methods.get(String.valueOf(reference(builder)));
                // The dispatcher copies its parameters into low registers first; one of those copies is the event's.
                int eventRegister = parameter(shown, eventParameters(shown, event).get(0)), alias = -1, aliases = 0;
                for (int k = 0; k < body.size() && body.get(k).getOpcode() == Opcode.MOVE_OBJECT_FROM16; k++)
                    if (((TwoRegisterInstruction) body.get(k)).getRegisterB() == eventRegister) { alias = firstRegister(body.get(k)); aliases++; }
                int list = built == null ? -1 : firstRegister(built);
                boolean handed = ranged
                        ? firstRegister(body.get(at - 1)) == list + 1 && ((TwoRegisterInstruction) body.get(at - 1)).getRegisterB() == alias
                            && arguments(body.get(at)).equals(List.of(list, list + 1))
                        : arguments(body.get(at)).equals(List.of(list, alias));
                // 14.43.0 folded the older view menu into this dispatcher, and it builds a list of its
                // own after the newer menu's ComposeView. The newer menu's is the one built before it.
                int compose = -1;
                for (int k = 0; k < body.size() && compose < 0; k++) if (body.get(k).getOpcode() == Opcode.NEW_INSTANCE
                        && String.valueOf(reference(body.get(k))).equals("Landroidx/compose/ui/platform/ComposeView;")) compose = k;
                final int composeAt = compose;
                if (building == null || instructions(building).stream().noneMatch(i -> i.getOpcode() == Opcode.CHECK_CAST && String.valueOf(reference(i)).equals(type))
                        || composeAt < at || !callSites(body, String.valueOf(reference(builder))).stream().filter(k -> k < composeAt).toList().equals(List.of(listed - 2)))
                    fail(itemsHook + " doesn't follow the dispatcher's one option list");
                else if (aliases != 1 || !isMoveResult(built.getOpcode()) || !handed
                        || !isMoveResult(body.get(at + 1).getOpcode()) || firstRegister(body.get(at + 1)) != list)
                    fail(itemsHook + " doesn't replace the option list from the list and the event in " + shown);
                remove(shown, listed, at + 2);
            }

            List<Method> effects = new ArrayList<>();
            for (Method method : clean.methods.values()) {
                if (!method.getName().equals("invokeSuspend") || method.getImplementation() == null
                        || !descriptor(method).equals("(Ljava/lang/Object;)Ljava/lang/Object;") || method.getDefiningClass().startsWith(OWN)) continue;
                List<Instruction> body = instructions(method);
                if (body.stream().anyMatch(i -> String.valueOf(reference(i)).equals(repin))
                        && body.stream().anyMatch(i -> reference(i) instanceof FieldReference field && field.getType().equals(pin))) effects.add(method);
            }
            Method effect = unique(effects, "newer long-press menu tap effect");
            Method tap = actual(effect);
            List<Integer> clicks = calls(tap, clickHook, 1);
            if (tap != null && clicks.size() == 1) {
                List<Instruction> body = instructions(tap);
                Layout layout = new Layout(tap.getImplementation());
                int at = clicks.get(0), option = -1, holder = -1;
                String pinHolder = null;
                for (Instruction instruction : body) if (reference(instruction) instanceof FieldReference field && field.getType().equals(pin)) pinHolder = field.getDefiningClass();
                for (int k = 0; k < at - 1; k++) if (body.get(k).getOpcode() == Opcode.IGET_OBJECT && reference(body.get(k)) instanceof FieldReference field) {
                    if (field.getType().equals(face.getType())) option = firstRegister(body.get(k));
                    if (field.getType().equals(pinHolder)) holder = firstRegister(body.get(k));
                }
                Instruction held = body.get(at - 1), answer = body.get(at + 1), branch = body.get(at + 2), next = body.get(at + 3);
                if (held.getOpcode() != Opcode.IGET_OBJECT || !(reference(held) instanceof FieldReference pinField) || !pinField.getType().equals(pin)
                        || !pinField.getDefiningClass().equals(pinHolder) || ((TwoRegisterInstruction) held).getRegisterB() != holder
                        || !arguments(body.get(at)).equals(List.of(option, firstRegister(held)))) fail(clickHook + " doesn't get the tapped option and its pin in " + tap);
                if (answer.getOpcode() != Opcode.MOVE_RESULT || firstRegister(held) != firstRegister(answer) || branch.getOpcode() != Opcode.IF_NEZ || firstRegister(answer) != firstRegister(branch)
                        || !String.valueOf(reference(next)).equals(repin) || firstRegister(next) != firstRegister(answer)) {
                    fail(clickHook + " doesn't borrow only the first action's own register in " + tap);
                } else {
                    Instruction target = layout.byAddress.get(layout.addresses.get(at + 2) + ((OffsetInstruction) branch).getCodeOffset());
                    if (target == null || target.getOpcode() != Opcode.SGET_OBJECT || !(reference(target) instanceof FieldReference unit)
                            || !unit.getDefiningClass().equals("Lkotlin/Unit;")) fail(clickHook + " doesn't finish on Kotlin Unit in " + tap);
                }
                remove(tap, at - 1, at + 3);
            }

            stub(own + "composeOptionType()Ljava/lang/Class;", List.of(Opcode.CONST_CLASS, Opcode.RETURN_OBJECT), Arrays.asList(face.getType(), null));
            Method label = stub(own + "composeIconAndLabel()Ljava/lang/Object;", List.of(Opcode.NEW_INSTANCE, Opcode.SGET_OBJECT, Opcode.SGET, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT), Arrays.asList(pair, icon + "->DOWNLOAD:" + icon, strings + "->download:I",
                    "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;", null, pair + "-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", null));
            if (label != null) {
                List<Instruction> body = instructions(label);
                int made = firstRegister(body.get(0)), boxed = firstRegister(body.get(4));
                if (!arguments(body.get(3)).equals(List.of(firstRegister(body.get(2))))
                        || !arguments(body.get(5)).equals(List.of(made, firstRegister(body.get(1)), boxed)) || firstRegister(body.get(6)) != made)
                    fail("newer long-press menu label stub pairs the wrong registers");
            }
            Method kind = stub(own + "composeKind(Ljava/lang/Object;)I", List.of(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.SGET_OBJECT,
                    Opcode.IF_EQ, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN,
                    Opcode.CONST_4, Opcode.RETURN), Arrays.asList(type, null, repin, null, send, null, search, null, null, null, null, null, null, null, null, null));
            if (kind != null) {
                List<Instruction> body = instructions(kind);
                Layout layout = new Layout(kind.getImplementation());
                // Each branch lands on its own answer: other 0, Save 1, Send 2, Search image 3.
                int[][] branches = {{1, 8}, {3, 10}, {5, 12}, {7, 14}};
                for (int[] pairing : branches) {
                    if (layout.addresses.get(pairing[0]) + ((OffsetInstruction) body.get(pairing[0])).getCodeOffset() != layout.addresses.get(pairing[1]))
                        fail("newer long-press menu kind stub sends a branch to the wrong answer");
                }
                for (int answer = 0; answer < 4; answer++) {
                    if (((NarrowLiteralInstruction) body.get(8 + answer * 2)).getNarrowLiteral() != answer
                            || firstRegister(body.get(9 + answer * 2)) != firstRegister(body.get(8 + answer * 2)))
                        fail("newer long-press menu kind stub answers the wrong kind");
                }
                if (((TwoRegisterInstruction) body.get(0)).getRegisterB() != parameter(kind, 0))
                    fail("newer long-press menu kind stub checks something other than its input");
            }
            return dispatcher != null && effect != null && label != null && kind != null;
        }

        /**
         * A long-press menu button's detached mark and spring driver, found the way the patch finds
         * them on the button's class chain: the one boolean its detach handler writes, and the one
         * non-array object field that the method reading that boolean both reads and writes.
         */
        String[] springReset(String item) {
            List<ClassDef> chain = new ArrayList<>();
            for (ClassDef owner = clean.classes.get(item); owner != null;
                    owner = owner.getSuperclass() == null ? null : clean.classes.get(owner.getSuperclass())) chain.add(owner);
            Set<String> types = new HashSet<>();
            List<Method> methods = new ArrayList<>();
            for (ClassDef owner : chain) {
                types.add(owner.getType());
                for (Method method : owner.getMethods())
                    if (method.getImplementation() != null && !AccessFlags.STATIC.isSet(method.getAccessFlags())) methods.add(method);
            }
            List<Method> detaches = new ArrayList<>();
            for (Method method : methods) if (method.getName().equals("onDetachedFromWindow") && method.getParameterTypes().isEmpty()
                    && method.getReturnType().equals("V")) detaches.add(method);
            if (detaches.size() != 1) return null;
            Set<String> flags = chainFields(detaches.get(0), Opcode.IPUT_BOOLEAN, types);
            if (flags.size() != 1) return null;
            String flag = flags.iterator().next();
            List<Method> starters = new ArrayList<>();
            for (Method method : methods) if (chainFields(method, Opcode.IGET_BOOLEAN, types).contains(flag)) starters.add(method);
            if (starters.size() != 1) return null;
            Set<String> drivers = chainFields(starters.get(0), Opcode.IGET_OBJECT, types);
            drivers.retainAll(chainFields(starters.get(0), Opcode.IPUT_OBJECT, types));
            drivers.removeIf(field -> field.substring(field.lastIndexOf(':') + 1).startsWith("["));
            if (drivers.size() != 1) return null;
            String driver = drivers.iterator().next();
            // Clearing the driver is only safe because the detach handler cancels it, which the
            // patch requires too: a method the handler calls reads it and cancels that value.
            Set<String> calls = new HashSet<>();
            for (Instruction i : instructions(detaches.get(0)))
                if (reference(i) instanceof MethodReference call && types.contains(call.getDefiningClass())
                        && call.getParameterTypes().isEmpty() && call.getReturnType().equals("V")) calls.add(call.getName());
            for (Method method : methods)
                if (calls.contains(method.getName()) && method.getParameterTypes().isEmpty() && cancels(method, driver))
                    return new String[]{flag, driver};
            return null;
        }

        /** Whether [m] reads [driver] and then calls a (CancellationException)V method, a Job's cancel, on the value it read. */
        boolean cancels(Method m, String driver) {
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) {
                if (body.get(at).getOpcode() != Opcode.IGET_OBJECT || !driver.equals(String.valueOf(reference(body.get(at))))) continue;
                int held = firstRegister(body.get(at));
                for (Instruction next : body.subList(at + 1, body.size())) {
                    if (reference(next) instanceof MethodReference call && call.getReturnType().equals("V")
                            && descriptor(call).equals("(Ljava/util/concurrent/CancellationException;)V")
                            && arguments(next).size() == 2 && arguments(next).get(0) == held) return true;
                    if (!next.getOpcode().canContinue() || next.getOpcode().setsRegister() && firstRegister(next) == held) break;
                }
            }
            return false;
        }

        /** The fields of [types] that [m] touches with [opcode]. */
        Set<String> chainFields(Method m, Opcode opcode, Set<String> types) {
            Set<String> found = new TreeSet<>();
            for (Instruction i : instructions(m))
                if (i.getOpcode() == opcode && reference(i) instanceof FieldReference field && types.contains(field.getDefiningClass()))
                    found.add(field.toString());
            return found;
        }

        /** An extension stub the patch filled: these opcodes, naming these references, its input cast first. */
        static final String LONG_PRESS_MENU = "Lcom/pinterest/ui/menu/ContextMenuView;", LONG_PRESS_ITEM = "Lcom/pinterest/ui/menu/ContextMenuItemView;",
                LONG_PRESS_SAVE = "context_save", LONG_PRESS_SEND = "context_share", LONG_PRESS_SEARCH = "context_visual_search",
                LONG_PRESS_CLOSEUP_SEARCH = "context_closeup_visual_search", LONG_PRESS_SEND_APP = "context_share_recent";

        /**
         * The long-press hide switches (#11, #35): buttonKind tells Save, Send, Search image and Send with an app apart by the
         * id a button's builder writes into it, compared with the ids the menu's hover test reads. Found
         * the way the patch finds them. A build without a public hover test keeps the stub's plain
         * "other" answer and the switches stay out.
         */
        void longPressChoices(Contract c) {
            String key = c.strings.get(0);
            ClassDef menu = clean.classes.get(LONG_PRESS_MENU), item = clean.classes.get(LONG_PRESS_ITEM);
            Set<String> idClasses = new TreeSet<>(), fields = new TreeSet<>();
            if (menu != null) for (Method m : menu.getMethods()) {
                List<Instruction> body = instructions(m);
                if (body.stream().noneMatch(i -> readsSearchId(i))) continue;
                for (Instruction i : body) if (reference(i) instanceof FieldReference f) {
                    if (readsSearchId(i)) idClasses.add(f.getDefiningClass());
                    if (i.getOpcode() == Opcode.IGET && f.getDefiningClass().equals(LONG_PRESS_ITEM) && f.getType().equals("I")) fields.add(f.getName());
                }
            }
            String owner = idClasses.size() == 1 ? idClasses.iterator().next() : null, field = fields.size() == 1 ? fields.iterator().next() : null;
            ClassDef ids = owner == null ? null : clean.classes.get(owner);
            boolean resolved = field != null && ids != null && item != null && AccessFlags.PUBLIC.isSet(item.getAccessFlags())
                    && AccessFlags.PUBLIC.isSet(ids.getAccessFlags()) && publicId(ids, LONG_PRESS_SAVE) && publicId(ids, LONG_PRESS_SEND)
                    && publicId(ids, LONG_PRESS_SEARCH);
            if (resolved) {
                boolean held = false;
                for (Field f : item.getFields()) held |= f.getName().equals(field) && f.getType().equals("I")
                        && AccessFlags.PUBLIC.isSet(f.getAccessFlags()) && !AccessFlags.STATIC.isSet(f.getAccessFlags());
                resolved = held;
            }
            if (!resolved) {
                Method plain = stub(key, List.of(Opcode.CONST_4, Opcode.RETURN), Arrays.asList(null, null));
                if (plain != null && ((NarrowLiteralInstruction) instructions(plain).get(0)).getNarrowLiteral() != 0)
                    fail(key + " answers something other than \"other\" with no hover test to bind it to");
                capability(c.callee, false);
                return;
            }

            // Each id and the kind it answers: Save 1, Send 2, Search image 3 for both search ids, and
            // Send with an app 4 (#35). The answers come after the ids, "other" first.
            List<String> checked = new ArrayList<>(List.of(LONG_PRESS_SAVE, LONG_PRESS_SEND, LONG_PRESS_SEARCH));
            List<Integer> kinds = new ArrayList<>(List.of(1, 2, 3));
            if (publicId(ids, LONG_PRESS_CLOSEUP_SEARCH)) { checked.add(LONG_PRESS_CLOSEUP_SEARCH); kinds.add(3); }
            if (publicId(ids, LONG_PRESS_SEND_APP)) { checked.add(LONG_PRESS_SEND_APP); kinds.add(4); }
            int answers = 5;
            List<Opcode> opcodes = new ArrayList<>(List.of(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.IGET));
            List<String> references = new ArrayList<>(Arrays.asList(LONG_PRESS_ITEM, null, LONG_PRESS_ITEM, LONG_PRESS_ITEM + "->" + field + ":I"));
            for (String id : checked) {
                opcodes.addAll(List.of(Opcode.SGET, Opcode.IF_EQ));
                references.addAll(Arrays.asList(owner + "->" + id + ":I", null));
            }
            for (int kind = 0; kind < answers; kind++) {
                opcodes.addAll(List.of(Opcode.CONST_4, Opcode.RETURN));
                references.addAll(Arrays.asList(null, null));
            }
            Method m = stub(key, opcodes, references);
            if (m != null) {
                List<Instruction> body = instructions(m);
                Layout code = new Layout(m.getImplementation());
                int input = parameter(m, 0), kept = firstRegister(body.get(3)), other = 4 + 2 * checked.size();
                // The button itself is tested, cast and read, and a non-button lands on "other".
                boolean bound = AccessFlags.STATIC.isSet(m.getAccessFlags()) && ((TwoRegisterInstruction) body.get(0)).getRegisterB() == input
                        && firstRegister(body.get(1)) == firstRegister(body.get(0)) && firstRegister(body.get(2)) == input
                        && ((TwoRegisterInstruction) body.get(3)).getRegisterB() == input
                        && code.addresses.get(1) + ((OffsetInstruction) body.get(1)).getCodeOffset() == code.addresses.get(other);
                // Each id is compared with the button's own and jumps to its own kind's answer.
                for (int n = 0; n < checked.size(); n++) {
                    int at = 4 + 2 * n, answer = other + 2 * kinds.get(n);
                    TwoRegisterInstruction test = (TwoRegisterInstruction) body.get(at + 1);
                    bound &= firstRegister(body.get(at)) != kept && test.getRegisterA() == kept && test.getRegisterB() == firstRegister(body.get(at))
                            && code.addresses.get(at + 1) + ((OffsetInstruction) body.get(at + 1)).getCodeOffset() == code.addresses.get(answer);
                }
                for (int kind = 0; kind < answers; kind++) {
                    int at = other + 2 * kind;
                    bound &= ((NarrowLiteralInstruction) body.get(at)).getNarrowLiteral() == kind && firstRegister(body.get(at + 1)) == firstRegister(body.get(at));
                }
                if (!bound) { fail(key + " doesn't answer Save, Send, Search image and Send with an app from the button's own id"); resolved = false; }
            } else resolved = false;
            capability(c.callee, resolved);
        }

        static boolean readsSearchId(Instruction i) {
            return i.getOpcode() == Opcode.SGET && reference(i) instanceof FieldReference f && f.getName().equals(LONG_PRESS_SEARCH) && f.getType().equals("I");
        }

        static boolean publicId(ClassDef ids, String name) {
            for (Field f : ids.getFields()) if (f.getName().equals(name) && f.getType().equals("I") && AccessFlags.PUBLIC.isSet(f.getAccessFlags())
                    && AccessFlags.STATIC.isSet(f.getAccessFlags())) return true;
            return false;
        }

        Method stub(String key, List<Opcode> opcodes, List<String> references) {
            Method m = actual(key);
            if (m == null) return null;
            List<Instruction> body = instructions(m);
            if (!body.stream().map(Instruction::getOpcode).toList().equals(opcodes)) { fail(key + " is not the stub the patch writes"); return null; }
            for (int at = 0; at < body.size(); at++) if (references.get(at) != null && !references.get(at).equals(String.valueOf(reference(body.get(at)))))
                fail(key + " names " + reference(body.get(at)) + " where the clean APK has " + references.get(at));
            int cast = body.get(0).getOpcode() == Opcode.CHECK_CAST ? 0 : body.get(1).getOpcode() == Opcode.CHECK_CAST ? 1 : -1;
            if (cast >= 0 && !AccessFlags.STATIC.isSet(m.getAccessFlags())) fail(key + " is no static stub");
            if (cast >= 0 && firstRegister(body.get(cast)) != parameter(m, 0)) fail(key + " casts something other than its input");
            return m;
        }

        /**
         * The full-screen overflow sheet a pin closeup opens under android_overflow_gestalt_sheet (#2):
         * one hand-over in front of each return of the method that builds its rows, one mark on its own
         * Download image row, and six stubs bound to the sheet's menu data, row list, row factory and
         * the presenter method that closes it. A build without the sheet expects none of it.
         */
        /** Whether [m] reads Pinterest's Download image title id, the row the sheet's mark goes on. */
        boolean readsDownloadTitle(Method m) {
            return instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.SGET && reference(i) instanceof FieldReference title
                    && title.getName().equals("save_to_device") && title.getType().equals("I"));
        }

        void downloadSheet(String downloads, ClassDef menu) {
            ClassDef location = clean.classes.get("Lcom/pinterest/feature/GridActionsLocation$PIN_OVERFLOW_MENU_MODAL_FRAGMENT;");
            if (location == null) return;
            Set<String> named = new TreeSet<>();
            for (Method init : location.getMethods()) if (init.getName().equals("<init>"))
                for (Instruction i : instructions(init)) if (i.getOpcode() == Opcode.CONST_CLASS) named.add(String.valueOf(reference(i)));
            ClassDef fragment = named.size() == 1 ? clean.classes.get(named.iterator().next()) : null;
            if (fragment == null) { fail("download sheet location names no single fragment"); return; }
            List<Method> builders = new ArrayList<>();
            for (Method candidate : fragment.getMethods()) if (candidate.getName().equals("onViewCreated") && candidate.getImplementation() != null
                    && descriptor(candidate).equals("(Landroid/view/View;Landroid/os/Bundle;)V")) builders.add(candidate);
            Method builder = unique(builders, "download sheet row builder");
            Method m = actual(builder);
            if (builder == null || m == null) return;
            int returns = 0;
            for (Instruction i : instructions(builder)) if (i.getOpcode() == Opcode.RETURN_VOID) returns++;
            List<Instruction> body = instructions(m);
            for (int at : calls(m, downloads + "->attachSheet(Ljava/lang/Object;)V", returns)) {
                if (at + 1 >= body.size() || body.get(at + 1).getOpcode() != Opcode.RETURN_VOID || !arguments(body.get(at)).equals(List.of(parameter(m, -1))))
                    fail("download sheet hand-over at " + at + " is not the sheet itself in front of a return");
                remove(m, at, at + 1);
            }
            // Up to 14.43.0 onViewCreated builds the rows itself; from 14.44.0 it calls a method of the
            // sheet's own that does, and the row mark goes there.
            Method rows = builder;
            if (!readsDownloadTitle(builder)) {
                List<Method> rowBuilders = new ArrayList<>();
                for (Method candidate : fragment.getMethods()) if (candidate.getImplementation() != null && readsDownloadTitle(candidate)) rowBuilders.add(candidate);
                rows = unique(rowBuilders, "download sheet row list");
                if (rows == null) return;
                String called = rows.toString();
                if (instructions(builder).stream().noneMatch(i -> reference(i) instanceof MethodReference r && r.toString().equals(called)))
                    fail("download sheet builds its rows in " + rows.getName() + ", which onViewCreated never calls");
            }
            Method marked = rows == builder ? m : actual(rows);
            List<Instruction> rowBody = marked == null ? List.of() : instructions(marked);
            List<Integer> marks = marked == null ? List.of() : calls(marked, downloads + "->nativeRow(Landroid/view/View;)V", 1);
            if (marks.size() == 1) {
                int at = marks.get(0);
                boolean titled = false;
                for (int i = Math.max(0, at - 9); i < at - 2; i++) if (reference(rowBody.get(i)) instanceof FieldReference title
                        && title.getName().equals("save_to_device")) titled = true;
                if (at < 2 || rowBody.get(at - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                        || !(reference(rowBody.get(at - 2)) instanceof MethodReference factory)
                        || !factory.getDefiningClass().equals(fragment.getType()) || !factory.getReturnType().equals("Landroid/widget/RelativeLayout;")
                        || !arguments(rowBody.get(at)).equals(List.of(firstRegister(rowBody.get(at - 1)))) || !titled)
                    fail("download sheet mark is not on the sheet's own Download image row");
                remove(marked, at, at + 1);
            }
            String type = fragment.getType();
            String pinType = "";
            if (menu != null) for (Field field : menu.getFields()) if (field.getName().equals("pin")) pinType = field.getType();
            Map<String, String> reads = new LinkedHashMap<>();
            reads.put("sheetPin(Ljava/lang/Object;)Ljava/lang/Object;", pinType);
            reads.put("sheetOrigin(Ljava/lang/Object;)Landroid/view/View;", "Landroid/view/View;");
            reads.put("sheetCloseup(Ljava/lang/Object;)Z", "Z");
            for (Map.Entry<String, String> read : reads.entrySet()) {
                Method stub = actual(downloads + "->" + read.getKey());
                if (stub == null) continue;
                List<Instruction> code = instructions(stub);
                MethodReference getter = code.size() == 5 && reference(code.get(1)) instanceof MethodReference g ? g : null;
                ClassDef data = getter == null ? null : clean.classes.get(getter.getReturnType());
                boolean described = false;
                if (data != null) for (Method method : data.getMethods()) if (method.getName().equals("toString"))
                    for (Instruction i : instructions(method)) if (reference(i) instanceof StringReference text
                            && text.getString().equals("PinOverflowMenuModalData(pin=")) described = true;
                if (getter == null || !described) { fail("download sheet stub " + read.getKey() + " reads no menu data"); continue; }
                bridge(downloads + "->" + read.getKey(), type, getter.getName(), "()" + getter.getReturnType());
                FieldReference field = reference(code.get(3)) instanceof FieldReference f ? f : null;
                boolean flag = read.getValue().equals("Z");
                if (code.get(2).getOpcode() != Opcode.MOVE_RESULT_OBJECT || field == null || !field.getDefiningClass().equals(data.getType())
                        || !field.getType().equals(read.getValue()) || code.get(3).getOpcode() != (flag ? Opcode.IGET_BOOLEAN : Opcode.IGET_OBJECT)
                        || ((TwoRegisterInstruction) code.get(3)).getRegisterB() != firstRegister(code.get(2))
                        || code.get(4).getOpcode() != (flag ? Opcode.RETURN : Opcode.RETURN_OBJECT) || firstRegister(code.get(4)) != firstRegister(code.get(3)))
                    fail("download sheet stub " + read.getKey() + " reads the wrong menu data field");
            }
            Method list = actual(downloads + "->sheetView(Ljava/lang/Object;)Landroid/view/ViewGroup;");
            if (list != null) {
                List<Instruction> code = instructions(list);
                if (code.size() != 4 || !(reference(code.get(1)) instanceof MethodReference getter)
                        || !getter.getReturnType().equals("Landroid/widget/LinearLayout;") || !getter.getParameterTypes().isEmpty()
                        || code.get(2).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(3).getOpcode() != Opcode.RETURN_OBJECT)
                    fail("download sheet list stub returns no row list");
                else bridge(downloads + "->sheetView(Ljava/lang/Object;)Landroid/view/ViewGroup;", type, getter.getName(), "()Landroid/widget/LinearLayout;");
            }
            Method row = actual(downloads + "->sheetRow(Ljava/lang/Object;Ljava/lang/String;)Landroid/view/View;");
            if (row != null) {
                List<Instruction> code = instructions(row);
                MethodReference factory = code.size() == 5 && reference(code.get(2)) instanceof MethodReference f ? f : null;
                List<String> types = factory == null ? List.of() : factory.getParameterTypes().stream().map(Object::toString).toList();
                if (factory == null || code.get(0).getOpcode() != Opcode.CHECK_CAST || !type.equals(String.valueOf(reference(code.get(0))))
                        || firstRegister(code.get(0)) != parameter(row, 0) || code.get(1).getOpcode() != Opcode.SGET_OBJECT
                        || !(reference(code.get(1)) instanceof FieldReference icon) || !icon.getName().equals("DOWNLOAD")
                        || !factory.getDefiningClass().equals(type) || !factory.getReturnType().equals("Landroid/widget/RelativeLayout;")
                        || types.size() != 2 || !types.contains("Ljava/lang/String;") || !types.contains(icon.getType())
                        || code.get(3).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(4).getOpcode() != Opcode.RETURN_OBJECT
                        || firstRegister(code.get(3)) != firstRegister(code.get(4))) fail("download sheet row stub has no native row contract");
                else {
                    List<Integer> args = types.get(0).equals("Ljava/lang/String;") ? List.of(parameter(row, 0), parameter(row, 1), firstRegister(code.get(1)))
                            : List.of(parameter(row, 0), firstRegister(code.get(1)), parameter(row, 1));
                    if (!arguments(code.get(2)).equals(args)) fail("download sheet row factory receives the wrong icon or title");
                    actual(factory.toString());
                }
            }
            Method dismiss = actual(downloads + "->dismissSheet(Ljava/lang/Object;)V");
            if (dismiss != null) {
                List<Instruction> code = instructions(dismiss);
                FieldReference held = code.size() == 5 && reference(code.get(1)) instanceof FieldReference f ? f : null;
                MethodReference closer = held != null && reference(code.get(3)) instanceof MethodReference c ? c : null;
                ClassDef presenter = held == null ? null : clean.classes.get(held.getType());
                boolean closes = false;
                if (presenter != null && closer != null) for (Method method : presenter.getMethods())
                    if (method.getName().equals(closer.getName()) && descriptor(method).equals("()V") && AccessFlags.PUBLIC.isSet(method.getAccessFlags()))
                        for (Instruction i : instructions(method)) if (i.getOpcode() == Opcode.CHECK_CAST && type.equals(String.valueOf(reference(i)))) closes = true;
                if (closer == null || code.get(0).getOpcode() != Opcode.CHECK_CAST || !type.equals(String.valueOf(reference(code.get(0))))
                        || firstRegister(code.get(0)) != parameter(dismiss, 0) || code.get(1).getOpcode() != Opcode.IGET_OBJECT
                        || !held.getDefiningClass().equals(type) || ((TwoRegisterInstruction) code.get(1)).getRegisterB() != parameter(dismiss, 0)
                        || code.get(2).getOpcode() != Opcode.IF_EQZ || firstRegister(code.get(2)) != firstRegister(code.get(1))
                        || !closer.getDefiningClass().equals(held.getType()) || !arguments(code.get(3)).equals(List.of(firstRegister(code.get(1))))
                        || code.get(4).getOpcode() != Opcode.RETURN_VOID || !closes) fail("download sheet dismissal no longer reaches the presenter method that closes it");
                else {
                    Layout layout = new Layout(dismiss.getImplementation());
                    if (layout.addresses.get(2) + ((OffsetInstruction) code.get(2)).getCodeOffset() != layout.addresses.get(4))
                        fail("download sheet dismissal lost its absent-presenter fallback");
                }
            }
        }

        void bridge(String key, String type, String name, String shape) {
            Method m = actual(key);
            if (m == null) return;
            List<Instruction> body = instructions(m);
            String nativeKey = type + "->" + name + shape;
            if (body.size() < 3 || body.get(0).getOpcode() != Opcode.CHECK_CAST || !type.equals(String.valueOf(reference(body.get(0))))
                    || firstRegister(body.get(0)) != parameter(m, 0) || !nativeKey.equals(String.valueOf(reference(body.get(1))))
                    || !arguments(body.get(1)).equals(List.of(parameter(m, 0)))) fail(key + " has no typed native bridge dispatch");
            actual(nativeKey);
        }

        void comments(Contract c) {
            String[][] resources = {{"pin_closeup_unified_comments_module", "unified_comments_module_container"},
                    {"pin_closeup_new_comments_module", "new_comments_module_container"}};
            // The unified module folds through the comments hooks. The new module shows only one quoted
            // comment, so it folds through the preview hooks, which Hide comments turns on as well.
            String[][] hooks = {{c.strings.get(0), c.strings.get(1)}, {c.strings.get(4), c.strings.get(5)}};
            for (int p = 0; p < resources.length; p++) {
                String[] pair = resources[p];
                List<ClassDef> modules = new ArrayList<>();
                for (ClassDef cd : clean.classes.values()) {
                    boolean component = false;
                    Set<String> fields = new HashSet<>();
                    for (Method method : cd.getMethods()) {
                        if (method.getName().equals("getComponentType") && fieldNames(method).contains("PIN_CLOSEUP_COMMENTS")) component = true;
                        fields.addAll(fieldNames(method));
                    }
                    if (component && fields.containsAll(Arrays.asList(pair))) modules.add(cd);
                }
                ClassDef module = uniqueClass(modules, "comments " + pair[0]);
                if (module == null) continue;
                boolean inherits = false;
                Set<String> visited = new HashSet<>();
                for (String type = module.getSuperclass(); type != null && visited.add(type); ) {
                    if (type.equals(c.strings.get(3))) { inherits = true; break; }
                    ClassDef parent = clean.classes.get(type); type = parent == null ? null : parent.getSuperclass();
                }
                if (!inherits) fail("comments target does not inherit its dedicated module");
                view(module.getType(), hooks[p][0], hooks[p][1], null);
                // The photo strip folds with the previews only where the unified module holds one, the
                // same test the patch makes before it hooks the strip, so a build without one passes.
                if (p == 0) for (Field field : module.getFields()) if (field.getType().equals(c.strings.get(6))) {
                    view(c.strings.get(6), hooks[1][0], hooks[1][1], null);
                    break;
                }
            }
            // The preview text inside the unified module is commentPreviews' own views rule, since
            // either switch folds it.
            List<Method> descriptions = new ArrayList<>();
            for (Method method : clean.holding("CommentsZone(isVisible=")) if (method.getName().equals("toString")) descriptions.add(method);
            if (!descriptions.isEmpty()) {
                Method description = unique(descriptions, "comments zone");
                List<Method> constructors = new ArrayList<>();
                if (description != null) for (Method method : clean.classes.get(description.getDefiningClass()).getMethods())
                    if (method.getName().equals("<init>") && !method.getParameterTypes().isEmpty() && method.getParameterTypes().get(0).toString().equals("Z")) constructors.add(method);
                Method zone = actual(unique(constructors, "comments zone constructor"));
                if (zone != null) prefix(zone, c.strings.get(2), List.of(parameter(zone, 0)), true);
            }
            capability(c.callee, true);
        }

        /**
         * A closeup module picked by the component type its getComponentType returns, folded through
         * a visibility and measure pair. The patch leaves the module alone, with a warning, when a
         * build has no single module of that type or it doesn't build on the closeup base module, and
         * the flag stays off then.
         */
        void closeupModule(Contract c) {
            List<ClassDef> modules = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                for (Method method : cd.getMethods()) {
                    if (method.getName().equals("getComponentType") && method.getParameterTypes().isEmpty()
                            && fieldNames(method).contains(c.strings.get(2))) { modules.add(cd); break; }
                }
            }
            ClassDef module = modules.size() == 1 ? modules.get(0) : null;
            if (module != null && clean.duplicates.contains(module.getType())) { fail(c.strings.get(2) + " module has duplicate clean classes"); return; }
            boolean inherits = false;
            Set<String> visited = new HashSet<>();
            if (module != null) for (String type = module.getSuperclass(); type != null && visited.add(type); ) {
                if (type.equals(c.strings.get(3))) { inherits = true; break; }
                ClassDef parent = clean.classes.get(type); type = parent == null ? null : parent.getSuperclass();
            }
            if (inherits) view(module.getType(), c.strings.get(0), c.strings.get(1), null);
            capability(c.callee, inherits);
        }

        int replacement(String original, String hook, String prefix, boolean fallback) {
            int total = 0;
            for (Method old : clean.methods.values()) {
                if (old.getDefiningClass().startsWith(OWN) || prefix != null && !old.getDefiningClass().startsWith(prefix)) continue;
                List<Integer> originals = callSites(instructions(old), original);
                if (originals.isEmpty()) continue;
                total += originals.size();
                Method m = actual(old);
                List<Integer> sites = calls(m, hook, originals.size());
                if (m == null) continue;
                List<Instruction> body = instructions(m);
                if (!callSites(body, original).isEmpty()) fail(original + " remains beside its replacement in " + m);
                for (int i = 0; i < Math.min(sites.size(), originals.size()); i++) {
                    int at = sites.get(i);
                    Instruction was = instructions(old).get(originals.get(i));
                    if (!arguments(body.get(at)).equals(arguments(was))) fail(hook + " changed receiver or argument registers in " + m);
                    edits.computeIfAbsent(m.toString(), k -> new FeatureEdits()).replacements.put(at, was);
                }
            }
            if (fallback && total > 0) {
                Method method = actual(hook);
                if (method != null) fallback(method, original);
            }
            return total;
        }

        void links(Contract c) {
            int intents = replacement(c.strings.get(0), c.strings.get(1), null, true)
                    + replacement(c.strings.get(2), c.strings.get(3), null, true);
            int clipboard = replacement(c.strings.get(4), c.strings.get(5), null, true);
            if (intents + clipboard == 0) fail("link tracking has no outgoing clean text boundary");
            capability(c.callee, intents > 0 && clipboard > 0);
        }

        void analytics(Contract c) {
            Set<String> paths = Set.of("v3/callback/event/", "v3/callback/ping/", "v3/callback/post_install/", "v3/callback/track_funnel/{event}/",
                    "v3/register/track_action/{event}/", "v4/log/mobile_perf/", "callback/client_network_error/", "log/", "track/");
            Set<String> covered = new HashSet<>();
            Set<String> wrappers = new HashSet<>();
            for (ClassDef cd : clean.classes.values()) if (AccessFlags.INTERFACE.isSet(cd.getAccessFlags())) for (Method endpoint : cd.getMethods()) {
                String path = null;
                for (var annotation : endpoint.getAnnotations()) for (var element : annotation.getElements())
                    if (element.getValue() instanceof StringEncodedValue && paths.contains(((StringEncodedValue) element.getValue()).getValue()))
                        path = ((StringEncodedValue) element.getValue()).getValue();
                if (path == null) continue;
                List<Method> candidates = new ArrayList<>();
                ClassDef analytics = patched.classes.get(BASE + "privacy/Analytics;");
                if (analytics != null) for (Method method : analytics.getMethods()) if (method.getName().startsWith("hushUpload")
                        && callSites(instructions(method), endpoint.toString()).size() == 1) candidates.add(method);
                if (candidates.size() != 1) { fail(endpoint + " has " + candidates.size() + " generated wrappers, expected 1"); continue; }
                Method wrapper = candidates.get(0);
                wrappers.add(wrapper.toString());
                List<CharSequence> parameters = new ArrayList<>(); parameters.add(endpoint.getDefiningClass()); parameters.addAll(endpoint.getParameterTypes());
                if (!wrapper.getParameterTypes().equals(parameters) || !wrapper.getReturnType().equals(endpoint.getReturnType())) fail(wrapper + " does not preserve its endpoint signature");
                int count = replacement(endpoint.toString(), wrapper.toString(), null, false);
                if (count > 0) covered.add(path);
                wrapperFallback(wrapper, endpoint, c.strings.get(3));
            }
            if (!covered.equals(paths)) { Set<String> missing = new TreeSet<>(paths); missing.removeAll(covered); fail("analytics has uncovered endpoint paths " + missing); }
            ClassDef analytics = patched.classes.get(BASE + "privacy/Analytics;");
            if (analytics != null) for (Method method : analytics.getMethods()) if (method.getName().startsWith("hushUpload") && !wrappers.contains(method.toString())) fail("analytics has an unrelated or duplicated wrapper " + method);
            int sdk = replacement(c.strings.get(1), c.strings.get(2), "Lcom/appsflyer/", true);
            if (sdk == 0) fail("analytics has no clean AppsFlyer transport");
            int crashes = replacement(c.strings.get(1), c.strings.get(2), "Lcom/bugsnag/", false);
            if (crashes == 0) fail("analytics has no clean Bugsnag transport");
            boolean engage = engageGateway(c.strings.get(4));
            List<ClassDef> tags = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                Set<String> fields = new HashSet<>(); for (Field f : cd.getFields()) fields.add(f.getName());
                if ("Ljava/lang/Enum;".equals(cd.getSuperclass()) && fields.containsAll(Set.of("TAG_APPSFLYER_INIT", "TAG_FIREBASE_ANALYTICS_INIT"))) tags.add(cd);
            }
            ClassDef tag = uniqueClass(tags, "analytics task tags");
            List<Method> tasks = new ArrayList<>();
            Field tagField = null;
            if (tag != null) for (ClassDef cd : clean.classes.values()) {
                boolean runnable = false; Field identity = null;
                for (Field field : cd.getFields()) {
                    if (field.getType().equals("Ljava/lang/Runnable;")) runnable = true;
                    if (field.getType().equals(tag.getType()) && !AccessFlags.STATIC.isSet(field.getAccessFlags())) identity = field;
                }
                if (!runnable || identity == null) continue;
                for (Method method : cd.getMethods()) if (!method.getName().equals("<init>") && !AccessFlags.STATIC.isSet(method.getAccessFlags())
                        && descriptor(method).equals("()V") && namedCalls(method, "put", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;").size() > 0) {
                    tasks.add(method); tagField = identity;
                }
            }
            Method task = actual(unique(tasks, "analytics task dispatch"));
            if (task != null) {
                List<Instruction> body = instructions(task);
                if (body.isEmpty() || body.get(0).getOpcode() != Opcode.IGET_OBJECT || !String.valueOf(tagField).equals(String.valueOf(reference(body.get(0))))
                        || ((TwoRegisterInstruction) body.get(0)).getRegisterB() != parameter(task, -1)) fail("analytics task guard reads the wrong task identity");
                else guard(task, c.strings.get(0), 0, List.of(firstRegister(body.get(0))), 1, false, false);
            }
            capability(c.callee, covered.equals(paths) && sdk > 0 && crashes > 0 && engage && task != null);
        }

        /**
         * The image model's rendition chooser: behind the hook it answers the original rendition the
         * model's description names, when there is one, and otherwise runs its own order unchanged.
         */
        void imageOrder(Contract c) {
            String hook = c.strings.get(0);
            List<Method> descriptions = new ArrayList<>();
            for (Method m : clean.holding("Image(largeInternal=")) if (m.getName().equals("toString")) descriptions.add(m);
            Method description = descriptions.isEmpty() ? null : unique(descriptions, "image model description");
            boolean found = false;
            if (description != null) {
                Map<String, FieldReference> labels = new LinkedHashMap<>();
                String label = null;
                for (Instruction i : instructions(description)) {
                    Reference r = reference(i);
                    if (r instanceof StringReference) label = ((StringReference) r).getString();
                    if (i.getOpcode() == Opcode.IGET_OBJECT && r instanceof FieldReference && label != null) { labels.put(label, (FieldReference) r); label = null; }
                }
                FieldReference large = labels.get("Image(largeInternal="), original = labels.get(", original=");
                List<Method> choosers = new ArrayList<>();
                if (large != null && original != null) for (Method m : clean.classes.get(description.getDefiningClass()).getMethods()) {
                    if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getParameterTypes().isEmpty() || !m.getReturnType().equals(large.getType())) continue;
                    Set<String> read = new HashSet<>();
                    for (Instruction i : instructions(m)) if (reference(i) instanceof FieldReference) read.add(String.valueOf(reference(i)));
                    if (labels.values().stream().allMatch(f -> read.contains(String.valueOf(f)))) choosers.add(m);
                }
                Method m = actual(unique(choosers, "image rendition chooser"));
                List<Integer> sites = calls(m, hook, 1);
                if (m != null && sites.size() == 1) {
                    List<Instruction> body = instructions(m);
                    Layout code = new Layout(m.getImplementation());
                    boolean shaped = sites.get(0) == 0 && body.size() > 6 && arguments(body.get(0)).isEmpty()
                            && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                            && body.get(3).getOpcode() == Opcode.IGET_OBJECT && String.valueOf(original).equals(String.valueOf(reference(body.get(3))))
                            && ((TwoRegisterInstruction) body.get(3)).getRegisterB() == parameter(m, -1)
                            && body.get(4).getOpcode() == Opcode.IF_EQZ && body.get(5).getOpcode() == Opcode.RETURN_OBJECT;
                    for (int at = 2; shaped && at <= 5; at++) shaped = firstRegister(body.get(at)) == firstRegister(body.get(1));
                    for (int at : List.of(2, 4)) shaped = shaped && code.addresses.get(at) + ((OffsetInstruction) body.get(at)).getCodeOffset() == code.addresses.get(6);
                    if (!shaped) fail(hook + " does not answer the original rendition first, behind its switch, in " + m);
                    else { remove(m, 0, 6); found = true; }
                }
            }
            capability(c.callee, found);
        }

        /**
         * Idea pin pages: the two static lookups that answer a page's picture address, each reading the
         * page's image map by the size it was asked for. The hook sits right in front of every such read
         * and may answer the method. When it has nothing, the read runs as before.
         */
        void pageImage(Contract c) {
            String hook = c.strings.get(0);
            Map<Method, List<Integer>> reads = new LinkedHashMap<>();
            for (Method m : clean.holding("1200x")) {
                List<? extends CharSequence> types = m.getParameterTypes();
                if (m.getDefiningClass().startsWith(OWN) || !AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null
                        || !m.getReturnType().equals("Ljava/lang/String;") || types.size() != 3 || !types.get(0).toString().startsWith("L")
                        || !types.get(1).toString().equals("Ljava/lang/String;") || !types.get(2).toString().equals("Ljava/lang/String;")) continue;
                int size = parameter(m, 1);
                List<Instruction> body = instructions(m);
                List<Integer> sites = new ArrayList<>();
                for (int at = 0; at < body.size() && !writes(body.get(at), size); at++) {
                    Instruction i = body.get(at);
                    if (i.getOpcode() == Opcode.INVOKE_INTERFACE && arguments(i).size() == 2 && arguments(i).get(1) == size
                            && "Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;".equals(String.valueOf(reference(i)))) sites.add(at);
                }
                if (!sites.isEmpty()) reads.put(m, sites);
            }
            boolean found = reads.size() == 2;
            if (!found) fail("found " + reads.size() + " idea pin page image lookups, expected 2");
            for (Map.Entry<Method, List<Integer>> read : reads.entrySet()) {
                Method m = actual(read.getKey());
                List<Integer> wanted = read.getValue(), sites = calls(m, hook, wanted.size());
                if (m == null || sites.size() != wanted.size()) { found = false; continue; }
                List<Instruction> was = instructions(read.getKey()), body = instructions(m);
                Layout code = new Layout(m.getImplementation());
                // Later sites shift by the four instructions put in front of each earlier one.
                for (int k = sites.size() - 1; k >= 0; k--) {
                    int at = sites.get(k), get = wanted.get(k);
                    boolean shaped = at == get + 4 * k && at > 0 && at + 4 < body.size()
                            && arguments(body.get(at)).equals(arguments(was.get(get)))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                            && body.get(at + 2).getOpcode() == Opcode.IF_EQZ && body.get(at + 3).getOpcode() == Opcode.RETURN_OBJECT
                            && firstRegister(body.get(at + 2)) == firstRegister(body.get(at + 1))
                            && firstRegister(body.get(at + 3)) == firstRegister(body.get(at + 1))
                            && body.get(at + 4).getOpcode() == Opcode.INVOKE_INTERFACE
                            && code.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset() == code.addresses.get(at + 4)
                            && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 4, at + 2);
                    if (!shaped) { fail(hook + " does not sit in front of the page image read in " + m); found = false; }
                    else remove(m, at, at + 4);
                }
            }
            capability(c.callee, found);
        }

        /** The instruction a branch at [at] lands on, or -1 when it lands between instructions. */
        private static int branchTarget(Layout code, int at) {
            return code.addresses.indexOf(code.addresses.get(at) + ((OffsetInstruction) code.instructions.get(at)).getCodeOffset());
        }

        private static final List<Opcode> ORIGINAL_RETRY = List.of(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
                Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT);

        /** True when the retry block starts at [at], asks about [response], and gives up at [at] + 15. */
        private boolean retryBlock(Method m, int at, int response) {
            List<Instruction> body = instructions(m);
            if (at < 0 || at + 15 >= body.size()) return false;
            for (int k = 0; k < ORIGINAL_RETRY.size(); k++) if (body.get(at + k).getOpcode() != ORIGINAL_RETRY.get(k)) return false;
            Layout code = new Layout(m.getImplementation());
            return ((TwoRegisterInstruction) body.get(at)).getRegisterB() == response
                    && ((TwoRegisterInstruction) body.get(at + 1)).getRegisterB() == response
                    && arguments(body.get(at + 3)).equals(List.of(firstRegister(body.get(at)), firstRegister(body.get(at + 2))))
                    && branchTarget(code, at + 5) == at + 15 && branchTarget(code, at + 8) == at + 15;
        }

        /**
         * A refused original: the network library's follow-up method opens with the hook, and the loop
         * Pinterest's Cronet client runs asks it on the path where it found no next request. Each makes
         * a request for the address the hook names. Both are found in the clean target, by the error
         * text each holds with the Location header, never from the hook.
         */
        void originalRetry(Contract c) {
            String hook = c.strings.get(0);
            List<Method> location = clean.holding("Location");
            List<Method> stocks = new ArrayList<>(clean.holding("Received HTTP_PROXY_AUTH (407) code while not using proxy"));
            stocks.retainAll(location);
            Method stock = unique(stocks, "the follow-up method");
            boolean found = stock != null && stock.getImplementation() != null && stock.getParameterTypes().size() == 2;
            if (stock != null && !found) fail("the follow-up method no longer takes the response and one other object");
            Method loop = null;
            int exit = -1, next = -1, answer = -1;
            if (found) {
                String response = stock.getParameterTypes().get(0).toString(), request = stock.getReturnType();
                List<Method> loops = new ArrayList<>();
                for (Method m : clean.holding("Too many follow-up requests: ")) if (location.contains(m) && m.getReturnType().equals(response)) loops.add(m);
                loop = unique(loops, "the follow-up loop");
                found = loop != null;
                if (found) {
                    Layout code = new Layout(loop.getImplementation());
                    List<Instruction> was = code.instructions;
                    int exits = 0;
                    for (int at = 0; at + 2 < was.size(); at++) {
                        Instruction test = was.get(at), jump = was.get(at + 1), read = was.get(at + 2);
                        if (test.getOpcode() != Opcode.IF_NEZ || !jump.getOpcode().name.startsWith("goto") || read.getOpcode() != Opcode.IGET_OBJECT
                                || branchTarget(code, at) != at + 2 || ((TwoRegisterInstruction) read).getRegisterB() != firstRegister(test)
                                || !(reference(read) instanceof FieldReference field) || !field.getDefiningClass().equals(request)) continue;
                        int end = branchTarget(code, at + 1);
                        if (end < 0 || was.get(end).getOpcode() != Opcode.RETURN_OBJECT) continue;
                        exits++;
                        exit = at + 1;
                        next = firstRegister(test);
                        answer = firstRegister(was.get(end));
                    }
                    found = exits == 1;
                    if (!found) fail("the follow-up loop has " + exits + " exits with no next request, expected 1");
                }
            }
            if (found) {
                Method m = actual(stock);
                List<Integer> sites = calls(m, hook, 1);
                List<Instruction> body = m == null ? List.of() : instructions(m);
                boolean shaped = sites.size() == 1 && sites.get(0) == 3 && retryBlock(m, 0, parameter(stock, 0))
                        && firstRegister(body.get(12)) == firstRegister(body.get(14)) && body.get(14).getOpcode() == Opcode.RETURN_OBJECT;
                if (!shaped) { fail(hook + " does not open the follow-up method " + stock); found = false; }
                else remove(m, 0, 15);
                m = actual(loop);
                sites = calls(m, hook, 1);
                body = m == null ? List.of() : instructions(m);
                int first = exit;
                shaped = sites.size() == 1 && sites.get(0) == first + 3 && retryBlock(m, first, answer) && firstRegister(body.get(first + 12)) == next
                        && body.get(first + 14).getOpcode().name.startsWith("goto") && onlyFrom(m, first, first - 1)
                        && branchTarget(new Layout(m.getImplementation()), first + 14) == first + 16;
                if (!shaped) { fail(hook + " does not sit on the follow-up loop's exit in " + loop); found = false; }
                else remove(m, first, first + 15);
            }
            capability(c.callee, found);
        }

        /**
         * The pin closeup's original image: the size set Pinterest requests with pins goes through the
         * sizes hook just before it's returned, and the closeup builder's large image goes through the
         * closeup hook, with the pin, right after the helper answers it. Both are found in the clean
         * target, never from the hooks.
         */
        void closeupImage(Contract c) {
            String sizesHook = c.strings.get(0), imageHook = c.strings.get(1);
            List<Method> builders = new ArrayList<>();
            Map<Method, int[]> helperAt = new HashMap<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || !AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null
                        || m.getParameterTypes().size() != 1 || !m.getReturnType().equals("Ljava/util/List;")) continue;
                String pin = m.getParameterTypes().get(0).toString();
                if (!pin.startsWith("L")) continue;
                List<Instruction> body = instructions(m);
                List<Integer> helpers = new ArrayList<>();
                Set<String> buckets = new HashSet<>();
                for (int at = 0; at < body.size(); at++) {
                    Instruction i = body.get(at);
                    if (i.getOpcode() != Opcode.INVOKE_STATIC || !(reference(i) instanceof MethodReference r)) continue;
                    if (r.getParameterTypes().isEmpty() && r.getReturnType().equals(r.getDefiningClass())) buckets.add(r.getDefiningClass());
                    if (r.getParameterTypes().size() == 2 && r.getParameterTypes().get(0).toString().equals(pin)) helpers.add(at);
                }
                if (helpers.size() != 2) continue;
                MethodReference first = (MethodReference) reference(body.get(helpers.get(0))), second = (MethodReference) reference(body.get(helpers.get(1)));
                String bucket = first.getParameterTypes().get(1).toString();
                if (!buckets.contains(bucket) || !second.getParameterTypes().get(1).toString().equals(bucket)
                        || !first.getReturnType().equals(second.getReturnType()) || !first.getReturnType().startsWith("L")
                        || first.getReturnType().equals(pin)) continue;
                builders.add(m);
                helperAt.put(m, new int[]{helpers.get(0)});
            }
            Method builder = unique(builders, "pin closeup image builder");
            boolean found = false;
            if (builder != null) {
                List<Instruction> was = instructions(builder);
                int helper = helperAt.get(builder)[0];
                MethodReference large = (MethodReference) reference(was.get(helper));
                String bucket = large.getParameterTypes().get(1).toString();
                int pin = parameter(builder, 0);
                boolean ready = helper + 1 < was.size() && was.get(helper + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && firstRegister(was.get(helper + 1)) != pin && arguments(was.get(helper)).get(0) == pin;
                for (int at = 0; ready && at <= helper + 1; at++) ready = !writes(was.get(at), pin);
                if (!ready) fail("the pin closeup image builder " + builder + " no longer answers its large image beside an untouched pin");
                Method m = actual(builder);
                List<Integer> sites = calls(m, imageHook, 1);
                boolean closeup = false;
                if (ready && m != null && sites.size() == 1) {
                    List<Instruction> body = instructions(m);
                    int image = firstRegister(was.get(helper + 1)), at = sites.get(0);
                    closeup = at == helper + 2 && at + 3 < body.size() && arguments(body.get(at)).equals(List.of(pin, image))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == image
                            && body.get(at + 2).getOpcode() == Opcode.CHECK_CAST && firstRegister(body.get(at + 2)) == image
                            && large.getReturnType().equals(String.valueOf(reference(body.get(at + 2))))
                            && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 3, at + 2);
                    if (!closeup) fail(imageHook + " does not take the pin and its large image, in place, in " + m);
                    else remove(m, at, at + 3);
                }
                // Pinterest's size set: the bucket's one instance method answering a HashSet from a single return.
                List<Method> sizeSets = new ArrayList<>();
                ClassDef owner = clean.classes.get(bucket);
                if (owner != null) for (Method s : owner.getMethods()) {
                    if (AccessFlags.STATIC.isSet(s.getAccessFlags()) || !s.getParameterTypes().isEmpty() || s.getImplementation() == null
                            || !s.getReturnType().equals("Ljava/util/HashSet;")) continue;
                    sizeSets.add(s);
                }
                Method sizeSet = unique(sizeSets, "pin image size set");
                boolean sizes = false;
                if (sizeSet != null) {
                    List<Instruction> set = instructions(sizeSet);
                    List<Integer> returns = new ArrayList<>();
                    for (int at = 0; at < set.size(); at++) if (set.get(at).getOpcode() == Opcode.RETURN_OBJECT) returns.add(at);
                    Method s = actual(sizeSet);
                    List<Integer> hooked = calls(s, sizesHook, 1);
                    // The hook adds to the set it's handed, so it must be one the method made this call.
                    boolean fresh = !set.isEmpty() && returns.size() == 1 && set.get(0).getOpcode() == Opcode.NEW_INSTANCE
                            && "Ljava/util/HashSet;".equals(String.valueOf(reference(set.get(0))))
                            && firstRegister(set.get(0)) == firstRegister(set.get(returns.get(0)));
                    for (int at = 1; fresh && at < set.size(); at++) fresh = !writes(set.get(at), firstRegister(set.get(returns.get(0))));
                    if (returns.size() != 1) fail("the pin image size set " + sizeSet + " has " + returns.size() + " returns, expected 1");
                    else if (!fresh) fail("the pin image size set " + sizeSet + " doesn't answer a new set each call");
                    else if (s != null && hooked.size() == 1) {
                        int exit = returns.get(0), register = firstRegister(set.get(exit)), at = hooked.get(0);
                        List<Instruction> body = instructions(s);
                        sizes = at == exit && at + 1 < body.size() && arguments(body.get(at)).equals(List.of(register))
                                && body.get(at + 1).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(at + 1)) == register
                                && onlyFrom(s, at + 1, at);
                        if (!sizes) fail(sizesHook + " does not take the size set just before its return in " + s);
                        else remove(s, at, at + 1);
                    }
                }
                found = closeup && sizes;
            }
            capability(c.callee, found);
        }

        /** True when the instruction writes [register], alone or as the high half of a wide pair. */
        static boolean writes(Instruction i, int register) {
            if (!i.getOpcode().setsRegister() || !(i instanceof OneRegisterInstruction)) return false;
            int target = ((OneRegisterInstruction) i).getRegisterA();
            return target == register || i.getOpcode().setsWideRegister() && target + 1 == register;
        }

        /** True when the instruction at [at] can be reached only by falling through from [from]. */
        boolean onlyFrom(Method m, int at, int from) {
            return onlyFrom(flow(m), at, from);
        }

        /** [onlyFrom] on a graph built outside the cache, which keys by signature and so can't hold a clean method too. */
        static boolean onlyFrom(FeatureFlow graph, int at, int from) {
            for (int k = 0; k < graph.normal.size(); k++) {
                if (k != from && graph.normal.get(k).contains(at)) return false;
                if (graph.handlers.get(k).contains(at)) return false;
            }
            return from >= 0 && graph.normal.get(from).contains(at);
        }

        /** The extra a board screen puts its board id under. */
        static final String BOARD_ID_EXTRA = "com.pinterest.EXTRA_BOARD_ID";
        static final Set<String> BOARD_OPTIONS = Set.of("Edit", "Merge", "Archive", "Unarchive", "PreviewBoard");

        /**
         * The board menu. The board screen's presenter is the one class holding the board id extra that
         * builds the menu in an instance method taking nothing, with one static call answering the option
         * group (the class whose toString writes "OptionGroup(label="), into a class whose own builder
         * reads the board options enum. The menu hook goes right after that answer is moved into its
         * register, reached only from there, with the menu and an untouched this, and its answer replaces
         * the menu, cast back to the option group. Found in the clean target, never from the hook.
         */
        void boardMenu(Contract c) {
            String hook = c.strings.get(0);
            List<Method> groups = new ArrayList<>();
            for (Method m : clean.holding("OptionGroup(label=")) if (m.getName().equals("toString")) groups.add(m);
            Method described = unique(groups, "option group");
            boolean found = false;
            if (described != null) {
                String group = described.getDefiningClass();
                List<ClassDef> presenters = new ArrayList<>();
                List<Method> builders = new ArrayList<>();
                Map<Method, Integer> callAt = new HashMap<>();
                for (ClassDef cd : clean.classesHolding(BOARD_ID_EXTRA)) {
                    if (AccessFlags.INTERFACE.isSet(cd.getAccessFlags())) continue;
                    List<Method> own = menuBuilds(cd, group, callAt);
                    if (!own.isEmpty()) {
                        presenters.add(cd);
                        builders.addAll(own);
                    }
                }
                ClassDef presenter = uniqueClass(presenters, "board screen presenter");
                Method builder = presenter == null ? null : unique(builders, "board menu builder call");
                if (builder != null) {
                    List<Instruction> was = instructions(builder);
                    int call = callAt.get(builder), self = parameter(builder, -1);
                    int menu = call + 2 < was.size() && was.get(call + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT ? firstRegister(was.get(call + 1)) : -1;
                    boolean ready = menu >= 0 && menu != self;
                    for (int at = 0; ready && at <= call + 1; at++) ready = !writes(was.get(at), self);
                    if (!ready) fail("the board screen presenter " + builder + " no longer keeps its built menu beside an untouched this");
                    Method m = actual(builder);
                    List<Integer> sites = calls(m, hook, 1);
                    if (ready && m != null && sites.size() == 1) {
                        List<Instruction> body = instructions(m);
                        int at = sites.get(0);
                        found = at == call + 2 && at + 3 < body.size() && arguments(body.get(at)).equals(List.of(menu, self))
                                && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == menu
                                && body.get(at + 2).getOpcode() == Opcode.CHECK_CAST && firstRegister(body.get(at + 2)) == menu
                                && group.equals(String.valueOf(reference(body.get(at + 2))))
                                && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 3, at + 2);
                        if (!found) fail(hook + " does not take the built board menu and this, in place, in " + m);
                        else remove(m, at, at + 3);
                    }
                }
            }
            capability(c.callee, found);
        }

        /**
         * Each instance method of [owner] taking nothing that makes a static call into a board menu
         * builder answering [group], once per call, with the call's index put in [callAt].
         */
        List<Method> menuBuilds(ClassDef owner, String group, Map<Method, Integer> callAt) {
            List<Method> out = new ArrayList<>();
            for (Method m : owner.getMethods()) {
                if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !descriptor(m).equals("()V")) continue;
                List<Instruction> body = instructions(m);
                for (int at = 0; at < body.size(); at++) {
                    Instruction i = body.get(at);
                    if ((i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE) && reference(i) instanceof MethodReference r
                            && r.getReturnType().equals(group) && takesOptions(r) && boardBuilder(r.getDefiningClass(), group)) {
                        out.add(m);
                        callAt.put(m, at);
                    }
                }
            }
            return out;
        }

        /** True for a method taking a list of options and a Function1 handler first, as the option group builders do. */
        static boolean takesOptions(MethodReference r) {
            List<? extends CharSequence> p = r.getParameterTypes();
            return p.size() >= 2 && p.get(0).toString().equals("Ljava/util/List;") && p.get(1).toString().equals("Lkotlin/jvm/functions/Function1;");
        }

        /** True when [type] has a static method answering [group] from options that reads the board options enum. */
        boolean boardBuilder(String type, String group) {
            ClassDef owner = clean.classes.get(type);
            if (owner == null) return false;
            for (Method m : owner.getMethods()) {
                if (m.getImplementation() == null || !AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals(group) || !takesOptions(m)) continue;
                for (Instruction i : instructions(m))
                    if (i.getOpcode() == Opcode.SGET_OBJECT && reference(i) instanceof FieldReference f && f.getType().equals(f.getDefiningClass())
                            && boardOptions(f.getDefiningClass())) return true;
            }
            return false;
        }

        /** True for an enum with a constant for each of [BOARD_OPTIONS]. */
        boolean boardOptions(String type) {
            ClassDef options = clean.classes.get(type);
            if (options == null || !"Ljava/lang/Enum;".equals(options.getSuperclass())) return false;
            Set<String> names = new HashSet<>();
            for (Field f : options.getFields()) if (AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getType().equals(type)) names.add(f.getName());
            return names.containsAll(BOARD_OPTIONS);
        }

        static final String SENDABLE = "Lcom/pinterest/sendshare/model/SendableObject;";

        /** Pinterest's invite logger, as the patch finds it: (SendableObject, A, B, int, String, String)V on an instance. */
        static boolean inviteLogger(Method m) {
            if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V")) return false;
            List<String> types = m.getParameterTypes().stream().map(Object::toString).toList();
            return types.size() == 6 && types.get(0).equals(SENDABLE) && types.get(3).equals("I")
                    && types.get(4).equals("Ljava/lang/String;") && types.get(5).equals("Ljava/lang/String;")
                    && types.subList(1, 3).stream().allMatch(t -> t.startsWith("L") && !t.startsWith("Ljava/") && !t.startsWith("Landroid/"));
        }

        /** True when [i] reads [register] as a value or as a call or array argument. */
        static boolean readsRegister(Instruction i, int register) {
            for (int[] read : valueReads(i)) if (read[0] == register || read[1] == 'W' && read[0] + 1 == register) return true;
            if (i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction)
                for (int argument : invokeRegisters(i)) if (argument == register) return true;
            return false;
        }

        static final String START_ACTIVITY = "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V";

        /** A share straight to one app, as the patch finds it in the clean target: where it starts the app, and with what. */
        record DirectShare(Method method, int at, int shared, int url, int intent) {}

        /** An instance call to a method of the invite logger's shape, in any class. */
        static boolean inviteLoggerCall(Instruction i) {
            if (i.getOpcode() != Opcode.INVOKE_VIRTUAL && i.getOpcode() != Opcode.INVOKE_VIRTUAL_RANGE || !(reference(i) instanceof MethodReference call)
                    || !call.getReturnType().equals("V")) return false;
            List<String> types = call.getParameterTypes().stream().map(Object::toString).toList();
            return types.size() == 6 && types.get(0).equals(SENDABLE) && types.get(3).equals("I")
                    && types.get(4).equals("Ljava/lang/String;") && types.get(5).equals("Ljava/lang/String;")
                    && types.subList(1, 3).stream().allMatch(t -> t.startsWith("L") && !t.startsWith("Ljava/") && !t.startsWith("Landroid/"));
        }

        /** True when nothing reaches the instructions after [from], up to and including [to], but [from] and they themselves. */
        static boolean enteredOnlyFrom(FeatureFlow graph, int from, int to) {
            for (int k = 0; k < graph.normal.size(); k++) {
                for (int next : graph.normal.get(k)) if (next > from && next <= to && (k < from || k >= to)) return false;
                for (int next : graph.handlers.get(k)) if (next > from && next <= to) return false;
            }
            return true;
        }

        /**
         * The shares straight to one app in the clean target. Each is a method holding "invite_url"
         * that starts the app with an intent a static builder made, then passes the shared object and
         * the invite link to an instance call of the invite logger's shape. Nothing between the start
         * and that call is entered from elsewhere or writes either value, nothing between the builder
         * and the start writes the intent, and the start itself is reached only by falling through.
         * The three registers are distinct and at most v15.
         */
        List<DirectShare> directShares() {
            List<DirectShare> out = new ArrayList<>();
            for (Method m : clean.holding("invite_url")) {
                List<Instruction> body = instructions(m);
                FeatureFlow graph = new FeatureFlow(m);
                for (int start = 0; start < body.size(); start++) {
                    Instruction call = body.get(start);
                    if (call.getOpcode() != Opcode.INVOKE_VIRTUAL || !START_ACTIVITY.equals(String.valueOf(reference(call)))) continue;
                    List<Integer> started = arguments(call);
                    int log = -1;
                    for (int k = start + 1; k < body.size() && log < 0; k++) if (inviteLoggerCall(body.get(k))) log = k;
                    if (log < 0 || started.size() != 2) continue;
                    List<Integer> logged = arguments(body.get(log));
                    if (logged.size() != 7) continue;
                    int shared = logged.get(1), url = logged.get(6), intent = started.get(1);
                    if (shared > 15 || url > 15 || intent > 15 || new HashSet<>(List.of(shared, url, intent)).size() != 3) continue;
                    if (!enteredOnlyFrom(graph, start - 1, start) || !enteredOnlyFrom(graph, start, log)) continue;
                    boolean written = false;
                    for (int k = start + 1; k < log; k++) if (writes(body.get(k), shared) || writes(body.get(k), url)) written = true;
                    if (written) continue;
                    int made = -1;
                    for (int k = start - 1; k >= 0 && made < 0; k--) if (writes(body.get(k), intent)) made = k;
                    if (made < 1 || body.get(made).getOpcode() != Opcode.MOVE_RESULT_OBJECT || !enteredOnlyFrom(graph, made, start)) continue;
                    Instruction builder = body.get(made - 1);
                    if (builder.getOpcode() != Opcode.INVOKE_STATIC && builder.getOpcode() != Opcode.INVOKE_STATIC_RANGE
                            || !(reference(builder) instanceof MethodReference built) || !built.getReturnType().equals("Landroid/content/Intent;")) continue;
                    out.add(new DirectShare(m, start, shared, url, intent));
                }
            }
            return out;
        }

        /**
         * Plain pin links. The invite logger is an instance method of a class holding "invite_url",
         * shaped (SendableObject, A, B, int, String, String)V, that a method of its own class holding
         * the string calls. Exactly one call in it builds the log event from (A, kind, B, id String,
         * int, String, String, ...), its kind and id each the result of a no-argument getter of the
         * untouched shared object right above it. The hook goes just in front of that call: the
         * logger's invite link parameter moved into a scratch local, then the hook with the call's
         * kind and id registers and the scratch. The scratch must be a local nothing in the clean
         * logger reads before writing, from the event call on, and the link parameter must still be
         * its argument there. The share straight to one app (see [directShares]) gets the second hook
         * right in front of its app start, with the shared object, link and intent registers, and
         * the two stubs it reads the shared object through call the log event's own getters. The
         * patch puts in both hooks or neither. Found in the clean target, never from the hooks.
         */
        void pinInvites(Contract c) {
            String hook = c.strings.get(0);
            List<Method> loggers = new ArrayList<>();
            for (Method caller : clean.holding("invite_url")) {
                ClassDef owner = clean.classes.get(caller.getDefiningClass());
                if (owner == null) continue;
                for (Instruction i : instructions(caller)) {
                    if (!(reference(i) instanceof MethodReference call) || !call.getDefiningClass().equals(owner.getType())) continue;
                    for (Method own : owner.getMethods())
                        if (inviteLogger(own) && own.toString().equals(call.toString()) && !loggers.contains(own)) loggers.add(own);
                }
            }
            // The patch leaves Plain pin links out of a build without exactly this shape, and so
            // expects nothing here: no flag and, through the unclaimed call check, no hook call.
            Method logger = loggers.size() == 1 ? loggers.get(0) : null;
            if (logger == null || clean.duplicates.contains(logger.toString()) || clean.duplicates.contains(logger.getDefiningClass())) {
                capability(c.callee, false);
                return;
            }
            List<Instruction> was = instructions(logger);
            List<String> types = logger.getParameterTypes().stream().map(Object::toString).toList();
            List<Integer> builds = new ArrayList<>();
            for (int at = 0; at < was.size(); at++) {
                if (!was.get(at).getOpcode().name().startsWith("INVOKE_") || !(reference(was.get(at)) instanceof MethodReference call)
                        || call.getReturnType().equals("V")) continue;
                List<String> p = call.getParameterTypes().stream().map(Object::toString).toList();
                if (p.size() >= 7 && p.get(0).equals(types.get(1)) && p.get(1).startsWith("L") && p.get(2).equals(types.get(2))
                        && p.subList(3, 7).equals(List.of("Ljava/lang/String;", "I", "Ljava/lang/String;", "Ljava/lang/String;"))) builds.add(at);
            }
            if (builds.size() != 1) { capability(c.callee, false); return; }
            int event = builds.get(0);
            Instruction call = was.get(event);
            int offset = call.getOpcode() == Opcode.INVOKE_STATIC || call.getOpcode() == Opcode.INVOKE_STATIC_RANGE ? 0 : 1;
            List<Integer> original = arguments(call);
            if (original.size() < offset + 7) { capability(c.callee, false); return; }
            int kind = original.get(offset + 1), id = original.get(offset + 3), url = parameter(logger, 5), sendable = parameter(logger, 0);
            String kindType = ((MethodReference) reference(call)).getParameterTypes().get(1).toString();
            FeatureFlow graph = new FeatureFlow(logger);
            java.util.function.IntPredicate entered = at -> {
                for (int k = 0; k < graph.normal.size(); k++)
                    if (k != at - 1 && graph.normal.get(k).contains(at) || graph.handlers.get(k).contains(at)) return true;
                return false;
            };
            boolean shaped = kind <= 15 && id <= 15 && kind != id && !entered.test(event);
            String[] getters = new String[2];
            for (int register : new int[]{kind, id}) {
                int write = -1;
                for (int k = event - 1; k >= 0 && write < 0; k--) if (writes(was.get(k), register)) write = k;
                Instruction getter = write > 0 ? was.get(write - 1) : null;
                boolean ok = getter != null && was.get(write).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && getter.getOpcode() == Opcode.INVOKE_VIRTUAL && arguments(getter).equals(List.of(sendable))
                        && reference(getter) instanceof MethodReference read && read.getDefiningClass().equals(SENDABLE)
                        && read.getParameterTypes().isEmpty() && read.getReturnType().equals(register == kind ? kindType : "Ljava/lang/String;");
                for (int k = write; ok && k <= event; k++) if (entered.test(k)) ok = false;
                if (ok && reachedAfterWrite(graph, was, sendable, write - 1)) ok = false;
                if (ok) getters[register == kind ? 0 : 1] = String.valueOf(reference(getter));
                shaped &= ok;
            }
            // The link must still be the argument at the event call, along every path there.
            if (reachedAfterWrite(graph, was, url, event)) shaped = false;
            // And some local the hook's call can name must be free from the event call on.
            boolean free = false;
            for (int scratch = 0; scratch < Math.min(16, parameter(logger, -1)) && !free; scratch++)
                free = scratch != kind && scratch != id && unread(graph, was, event, scratch);
            if (!shaped || !free) { capability(c.callee, false); return; }
            List<DirectShare> shares = directShares();
            DirectShare share = shares.size() == 1 ? shares.get(0) : null;
            if (share == null || share.method().toString().equals(logger.toString()) || clean.duplicates.contains(share.method().toString())
                    || clean.duplicates.contains(share.method().getDefiningClass())) {
                capability(c.callee, false);
                return;
            }

            Method m = actual(logger);
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                int at = sites.get(0);
                List<Instruction> body = instructions(m);
                List<Integer> passed = arguments(body.get(at));
                int scratch = passed.size() == 3 ? passed.get(2) : -1;
                Instruction move = at > 0 ? body.get(at - 1) : null;
                placed = at == event + 1 && at + 1 < body.size() && move != null && move.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                        && ((TwoRegisterInstruction) move).getRegisterA() == scratch && ((TwoRegisterInstruction) move).getRegisterB() == url
                        && passed.equals(List.of(kind, id, scratch)) && scratch >= 0 && scratch < parameter(m, -1) && scratch <= 15
                        && String.valueOf(reference(body.get(at + 1))).equals(String.valueOf(reference(call)))
                        && arguments(body.get(at + 1)).equals(original)
                        && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at) && (at - 1 == 0 || onlyFrom(m, at - 1, at - 2));
                if (!placed) fail(hook + " is not the invite link, kind and id passed right in front of the log event in " + m);
                else if (!unread(graph, was, event, scratch)) {
                    fail(hook + " borrows v" + scratch + " in " + m + ", which the logger still reads after its log event");
                    placed = false;
                }
                remove(m, at - 1, at + 1);
            }

            String direct = c.strings.get(1);
            Method sharer = actual(share.method());
            List<Integer> shareSites = calls(sharer, direct, 1);
            boolean shared = false;
            if (sharer != null && shareSites.size() == 1) {
                int at = shareSites.get(0);
                List<Instruction> body = instructions(sharer);
                Instruction start = instructions(share.method()).get(share.at());
                shared = at == share.at() && at + 1 < body.size()
                        && arguments(body.get(at)).equals(List.of(share.shared(), share.url(), share.intent()))
                        && START_ACTIVITY.equals(String.valueOf(reference(body.get(at + 1))))
                        && arguments(body.get(at + 1)).equals(arguments(start))
                        && onlyFrom(sharer, at + 1, at) && (at == 0 || onlyFrom(sharer, at, at - 1));
                if (!shared) fail(direct + " is not the shared object, invite link and intent passed right in front of the app start in " + sharer);
                remove(sharer, at, at + 1);
            }

            boolean stubs = false;
            if (placed && shared) {
                String own = BASE + "privacy/PlainPinLinks;->";
                List<Opcode> shape = List.of(Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                        Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT);
                Method kindStub = stub(own + "sharedKind(Ljava/lang/Object;)Ljava/lang/Object;", shape,
                        Arrays.asList(null, SENDABLE, getters[0], null, null, null, null));
                Method idStub = stub(own + "sharedId(Ljava/lang/Object;)Ljava/lang/String;", shape,
                        Arrays.asList(null, SENDABLE, getters[1], null, null, null, null));
                stubs = kindStub != null && idStub != null;
                for (Method read : Arrays.asList(kindStub, idStub)) {
                    if (read == null) continue;
                    List<Instruction> body = instructions(read);
                    int input = parameter(read, 0);
                    if (firstRegister(body.get(0)) != input || !flow(read).normal.get(0).contains(5) || !arguments(body.get(2)).equals(List.of(input))
                            || firstRegister(body.get(3)) != firstRegister(body.get(4)) || firstRegister(body.get(5)) != firstRegister(body.get(6))
                            || ((NarrowLiteralInstruction) body.get(5)).getNarrowLiteral() != 0) {
                        fail(read + " doesn't answer its input's getter, or null for none");
                        stubs = false;
                    }
                }
            }
            capability(c.callee, placed && shared && stubs);
        }

        /** True when no path from [from], a handler included, reads [register] before writing it. */
        static boolean unread(FeatureFlow graph, List<Instruction> body, int from, int register) {
            BitSet seen = new BitSet();
            Deque<Integer> work = new ArrayDeque<>(List.of(from));
            if (from > 0) work.addAll(graph.handlers.get(from - 1));
            while (!work.isEmpty()) {
                int k = work.poll();
                if (seen.get(k)) continue;
                seen.set(k);
                if (readsRegister(body.get(k), register)) return false;
                work.addAll(graph.handlers.get(k));
                if (!writes(body.get(k), register)) work.addAll(graph.normal.get(k));
            }
            return true;
        }

        /** True when [target] can run after some write to [register], along a branch, a loop or a handler. */
        static boolean reachedAfterWrite(FeatureFlow graph, List<Instruction> body, int register, int target) {
            BitSet seen = new BitSet();
            Deque<Integer> work = new ArrayDeque<>();
            for (int k = 0; k < body.size(); k++) if (writes(body.get(k), register)) work.addAll(graph.normal.get(k));
            while (!work.isEmpty()) {
                int k = work.poll();
                if (k == target) return true;
                if (seen.get(k)) continue;
                seen.set(k);
                work.addAll(graph.normal.get(k));
                work.addAll(graph.handlers.get(k));
            }
            return false;
        }

        /**
         * The Inbox's Updates section. The feed is the class whose constructor holds the Updates
         * endpoint, and the presenter the one class with an instance field of that type and a void
         * one-argument method of the adder's name. In that method one read of the feed field is handed,
         * alone, to a void call right after it. The hook goes right before that call, reached only from
         * the read, and a yes jumps to the instruction after the call. Found in the clean target, never
         * from the hook.
         */
        void inboxUpdates(Contract c) {
            String hook = c.strings.get(0), endpoint = c.strings.get(1), adder = c.strings.get(2);
            List<Method> constructors = new ArrayList<>();
            for (Method m : clean.holding(endpoint)) if (m.getName().equals("<init>")) constructors.add(m);
            Method constructor = unique(constructors, "Inbox Updates feed");
            boolean found = false;
            if (constructor != null) {
                String feed = constructor.getDefiningClass();
                List<Method> adders = new ArrayList<>();
                for (ClassDef cd : clean.classes.values()) {
                    if (cd.getType().startsWith(OWN)) continue;
                    boolean holds = false;
                    for (Field f : cd.getFields()) if (f.getType().equals(feed) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) holds = true;
                    if (holds) for (Method m : cd.getMethods()) if (m.getName().equals(adder) && m.getReturnType().equals("V")
                            && m.getParameterTypes().size() == 1 && m.getImplementation() != null) adders.add(m);
                }
                Method presenter = unique(adders, "Inbox presenter " + adder);
                List<Integer> adds = new ArrayList<>();
                List<Instruction> was = presenter == null ? List.of() : instructions(presenter);
                for (int at = 0; at + 1 < was.size(); at++) {
                    Instruction read = was.get(at), add = was.get(at + 1);
                    if (read.getOpcode() != Opcode.IGET_OBJECT || !(reference(read) instanceof FieldReference field) || !field.getType().equals(feed)) continue;
                    if (add.getOpcode() != Opcode.INVOKE_VIRTUAL || !(reference(add) instanceof MethodReference call)
                            || !call.getReturnType().equals("V") || call.getParameterTypes().size() != 1) continue;
                    if (arguments(add).size() == 2 && arguments(add).get(1) == firstRegister(read)) adds.add(at + 1);
                }
                if (presenter != null && adds.size() != 1) fail(presenter + " has " + adds.size() + " calls that add the Updates feed, expected 1");
                Method m = adds.size() == 1 ? actual(presenter) : null;
                List<Integer> sites = calls(m, hook, 1);
                if (m != null && sites.size() == 1) {
                    int add = adds.get(0), at = sites.get(0);
                    List<Instruction> body = instructions(m);
                    Layout layout = new Layout(m.getImplementation());
                    found = at == add && at + 4 < body.size() && arguments(body.get(at)).isEmpty()
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && body.get(at + 2).getOpcode() == Opcode.IF_NEZ
                            && firstRegister(body.get(at + 1)) == firstRegister(body.get(at + 2))
                            && String.valueOf(reference(body.get(at + 3))).equals(String.valueOf(reference(was.get(add))))
                            && arguments(body.get(at + 3)).equals(arguments(was.get(add)))
                            && layout.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset() == layout.addresses.get(at + 4)
                            && onlyFrom(m, at, at - 1);
                    if (!found) fail(hook + " does not skip only the call that adds Updates in " + m);
                    else remove(m, at, at + 3);
                }
            }
            capability(c.callee, found);
        }

        /**
         * The pin's "See more like this?" answer. The pin model is the outer class of the classes that
         * load the JSON name, the one holding a Boolean field annotated with it, and the getter is its
         * one instance method taking nothing and answering a Boolean that reads the field. The hook takes
         * the register the getter's one return hands back, right before that return, and its answer
         * replaces it, and the return is reached only through the hook. Found in the clean target, never
         * from the hook.
         */
        void feedbackFlyout(Contract c) {
            String hook = c.strings.get(0), json = c.strings.get(1);
            Set<String> owners = new TreeSet<>();
            for (Method m : clean.holding(json)) {
                String type = m.getDefiningClass();
                owners.add(type.contains("$") ? type.substring(0, type.indexOf('$')) + ";" : type);
            }
            // Like the patch, a build where nothing reads the name has no bubble to hide, and the flag stays off.
            if (owners.isEmpty()) { capability(c.callee, false); return; }
            List<Field> fields = new ArrayList<>();
            for (String owner : owners) {
                ClassDef cd = clean.classes.get(owner);
                if (cd != null) for (Field f : cd.getFields()) if (f.getType().equals("Ljava/lang/Boolean;") && jsonNamed(f, json)) fields.add(f);
            }
            boolean found = false;
            if (fields.size() != 1) fail("the pin's " + json + " field has " + fields.size() + " clean fields, expected 1");
            else {
                Field field = fields.get(0);
                List<Method> getters = new ArrayList<>();
                for (Method m : clean.classes.get(field.getDefiningClass()).getMethods()) {
                    if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getParameterTypes().isEmpty()
                            || !m.getReturnType().equals("Ljava/lang/Boolean;") || m.getImplementation() == null) continue;
                    for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.IGET_OBJECT && reference(i) instanceof FieldReference read
                            && read.getDefiningClass().equals(field.getDefiningClass()) && read.getName().equals(field.getName())
                            && read.getType().equals(field.getType())) { getters.add(m); break; }
                }
                Method getter = unique(getters, "the pin's " + json + " getter");
                List<Integer> returns = new ArrayList<>();
                List<Instruction> was = getter == null ? List.of() : instructions(getter);
                for (int at = 0; at < was.size(); at++) if (was.get(at).getOpcode() == Opcode.RETURN_OBJECT) returns.add(at);
                if (getter != null && returns.size() != 1) fail(getter + " has " + returns.size() + " returns, expected 1");
                Method m = returns.size() == 1 ? actual(getter) : null;
                List<Integer> sites = calls(m, hook, 1);
                if (m != null && sites.size() == 1) {
                    int handed = firstRegister(was.get(returns.get(0))), at = sites.get(0);
                    List<Instruction> body = instructions(m);
                    found = at == returns.get(0) && at + 2 < body.size() && arguments(body.get(at)).equals(List.of(handed))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == handed
                            && body.get(at + 2).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(at + 2)) == handed
                            && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                    if (!found) fail(hook + " does not stand between every path and the return in " + m);
                    else remove(m, at, at + 2);
                }
            }
            capability(c.callee, found);
        }

        /** True when one of [f]'s annotations names it [json], the way Pinterest's models name their JSON. */
        static boolean jsonNamed(Field f, String json) {
            for (var annotation : f.getAnnotations()) for (var element : annotation.getElements())
                if (element.getName().equals("value") && element.getValue() instanceof StringEncodedValue value && value.getValue().equals(json)) return true;
            return false;
        }

        static final String TOPIC_BINDER = "Presenter bound to BubblesListView must be of type BubblesListPresenter";

        /**
         * Pinterest's topic suggestion row. The binder that logs the row's presenter error reads an
         * int field of its own class from this and packed-switches on it. Every arm the switch starts,
         * the fall-through or a case, begins by casting the binder's view parameter to an interface, and
         * the row's arm is the one whose code reaches that log line (the fall-through in 14.39.0 and
         * 14.43.0, a case in 14.40.0). The row hook goes right after that arm's cast with the view
         * parameter, reached only from the cast. The row's view, the one class implementing the cast's
         * interface, gains an onMeasure passing itself and each spec through the measure hook before
         * its superclass measures. Both are found in the clean target, never from the hooks.
         */
        void topicSuggestions(Contract c) {
            String rowHook = c.strings.get(0), measureHook = c.strings.get(1);
            List<Method> binders = new ArrayList<>();
            for (Method m : clean.holding(TOPIC_BINDER)) if (topicBinder(m)) binders.add(m);
            Method binder = unique(binders, "topic row binder");
            boolean row = false, measured = false;
            if (binder != null) {
                List<Instruction> was = instructions(binder);
                int view = parameter(binder, 0);
                List<Integer> arms = new ArrayList<>();
                for (int start : topicArmsReachingLog(binder)) {
                    Instruction cast = was.get(start);
                    if (cast.getOpcode() == Opcode.CHECK_CAST && firstRegister(cast) == view) arms.add(start);
                }
                String face = null;
                int arm = -1;
                if (arms.size() != 1 || writes(was.get(0), view) || writes(was.get(1), view)) {
                    fail("the topic row binder " + binder + " has no one arm reaching its log line that casts its untouched view parameter");
                } else {
                    arm = arms.get(0);
                    face = String.valueOf(reference(was.get(arm)));
                }
                Method m = actual(binder);
                List<Integer> sites = calls(m, rowHook, 1);
                if (face != null && m != null && sites.size() == 1) {
                    List<Instruction> body = instructions(m);
                    int at = sites.get(0);
                    row = at == arm + 1 && arguments(body.get(at)).equals(List.of(view))
                            && body.get(arm).getOpcode() == Opcode.CHECK_CAST && firstRegister(body.get(arm)) == view
                            && face.equals(String.valueOf(reference(body.get(arm)))) && onlyFrom(m, at, arm);
                    if (!row) fail(rowHook + " does not take the view right after the topic row arm's cast in " + m);
                    else remove(m, at, at + 1);
                }
                List<ClassDef> implementers = new ArrayList<>();
                if (face != null) for (ClassDef cd : clean.classes.values())
                    if (!cd.getType().startsWith(OWN) && cd.getInterfaces().contains(face)) implementers.add(cd);
                ClassDef rowView = face == null ? null : uniqueClass(implementers, "topic row view");
                if (rowView != null) measured = rowMeasure(rowView, measureHook, "topic row");
            }
            capability(c.callee, row && measured);
        }

        /** Where the binder's switch starts an arm: right after the switch, then at each of its cases. */
        List<Integer> topicArms(Method m) {
            Layout layout = new Layout(m.getImplementation());
            List<Integer> starts = new ArrayList<>(List.of(2));
            int switchAt = layout.addresses.get(1);
            Instruction payload = layout.byAddress.get(switchAt + ((OffsetInstruction) layout.instructions.get(1)).getCodeOffset());
            if (payload instanceof SwitchPayload) for (SwitchElement element : ((SwitchPayload) payload).getSwitchElements()) {
                int index = layout.addresses.indexOf(switchAt + element.getOffset());
                if (index >= 0 && !starts.contains(index)) starts.add(index);
            }
            return starts;
        }

        /**
         * The arm starts whose code reaches the binder's TOPIC_BINDER log line, along branches, cases
         * and handlers, stopping at a return, a throw or another arm's start.
         */
        List<Integer> topicArmsReachingLog(Method m) {
            List<Instruction> body = instructions(m);
            List<Integer> starts = topicArms(m);
            FeatureFlow graph = new FeatureFlow(m);
            List<Integer> reaching = new ArrayList<>();
            for (int start : starts) {
                BitSet seen = new BitSet();
                Deque<Integer> work = new ArrayDeque<>(List.of(start));
                while (!work.isEmpty()) {
                    int k = work.poll();
                    if (seen.get(k)) continue;
                    seen.set(k);
                    if (reference(body.get(k)) instanceof StringReference s && s.getString().equals(TOPIC_BINDER)) {
                        reaching.add(start);
                        break;
                    }
                    for (int next : graph.normal.get(k)) if (!starts.contains(next)) work.add(next);
                    for (int next : graph.handlers.get(k)) if (!starts.contains(next)) work.add(next);
                }
            }
            return reaching;
        }

        /**
         * The presenter's dismissal: a new event built from one or two constants (14.40.0 added its
         * slide-out flag), then posted to the presenter's event bus.
         */
        boolean dismissal(List<Opcode> opcodes) {
            int size = opcodes.size();
            if (size < 6 || size > 7 || opcodes.get(0) != Opcode.NEW_INSTANCE) return false;
            for (int at = 1; at < size - 4; at++) if (opcodes.get(at) != Opcode.CONST_4) return false;
            return opcodes.subList(size - 4, size).equals(List.of(Opcode.INVOKE_DIRECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID));
        }

        /** The topic row binder's shape, as the patch finds it. */
        boolean topicBinder(Method m) {
            if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V")
                    || m.getParameterTypes().isEmpty() || !m.getParameterTypes().get(0).toString().startsWith("L")) return false;
            List<Instruction> body = instructions(m);
            if (body.size() <= 2 || body.get(0).getOpcode() != Opcode.IGET || !(reference(body.get(0)) instanceof FieldReference f)
                    || !f.getDefiningClass().equals(m.getDefiningClass()) || !f.getType().equals("I")
                    || ((TwoRegisterInstruction) body.get(0)).getRegisterB() != parameter(m, -1)) return false;
            return body.get(1).getOpcode() == Opcode.PACKED_SWITCH && firstRegister(body.get(1)) == firstRegister(body.get(0));
        }

        /**
         * The row view's added onMeasure: the measure hook with the view and its width spec, then with
         * the view and its height spec, each answer back in its own register, then the superclass's
         * onMeasure with both, and nothing else. [what] names the row in failures. A view that measured
         * itself in the clean target would need another hook.
         */
        boolean rowMeasure(ClassDef rowView, String measureHook, String what) {
            String type = rowView.getType(), key = type + "->onMeasure(II)V";
            if (clean.methods.containsKey(key) || !canOverride(type, "onMeasure", "(II)V")) {
                fail("the " + what + " view " + type + " has an onMeasure of its own or one it can't override");
                return false;
            }
            Method m = actual(key);
            List<Integer> sites = calls(m, measureHook, 2);
            if (m == null || sites.size() != 2) return false;
            List<Instruction> body = instructions(m);
            int self = parameter(m, -1), width = parameter(m, 0), height = parameter(m, 1);
            boolean prefix = sites.equals(List.of(0, 2)) && body.size() > 4
                    && arguments(body.get(0)).equals(List.of(self, width)) && arguments(body.get(2)).equals(List.of(self, height))
                    && isMoveResult(body.get(1).getOpcode()) && firstRegister(body.get(1)) == width
                    && isMoveResult(body.get(3).getOpcode()) && firstRegister(body.get(3)) == height;
            if (!prefix) { fail(measureHook + " does not pass the " + what + " and each spec, in place, first in " + m); return false; }
            remove(m, 0, 4);
            List<Instruction> retained = retained(m, edits.get(m.toString()));
            List<Integer> args = List.of(self, width, height);
            boolean inherited = retained.size() == 2 && retained.get(0).getOpcode().name.startsWith("invoke-super")
                    && retained.get(1).getOpcode() == Opcode.RETURN_VOID && reference(retained.get(0)) instanceof MethodReference call
                    && call.getDefiningClass().equals(rowView.getSuperclass()) && call.getName().equals("onMeasure")
                    && descriptor(call).equals("(II)V") && arguments(retained.get(0)).equals(args);
            if (!inherited) fail(m + " lost its inherited original behavior");
            return inherited;
        }

        static final String TYPEAHEAD_ROW = "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadTextCell;";
        static final String RECENT_SEARCH_PILL = "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadRecentSearchPillView;";
        static final String RECENT_ROW_BIND = "(Ljava/lang/String;Z)V";

        /**
         * The row of the screen tapping the search bar opens, which shows recent searches and
         * suggestions for typed text alike. Its (String, boolean) bind, the one abstract method of
         * that shape on the interfaces it shares with the recent-search pill, starts with the row
         * hook taking the row and that boolean, true for a row given the clear button only recent
         * searches get. The row gains an onMeasure through the measure hook like the topic row's.
         * Both are found in the clean target, never from the hooks.
         */
        void recentSearchRows(Contract c) {
            String rowHook = c.strings.get(0), measureHook = c.strings.get(1);
            ClassDef row = clean.classes.get(TYPEAHEAD_ROW), pill = clean.classes.get(RECENT_SEARCH_PILL);
            if (row == null || pill == null) {
                fail("the typing-screen row " + TYPEAHEAD_ROW + " or the recent-search pill " + RECENT_SEARCH_PILL + " is missing");
                capability(c.callee, false);
                return;
            }
            List<Method> declared = new ArrayList<>();
            for (String face : row.getInterfaces()) {
                ClassDef owner = clean.classes.get(face);
                if (owner == null || !pill.getInterfaces().contains(face) || !AccessFlags.INTERFACE.isSet(owner.getAccessFlags())) continue;
                for (Method m : owner.getMethods())
                    if (AccessFlags.ABSTRACT.isSet(m.getAccessFlags()) && descriptor(m).equals(RECENT_ROW_BIND)) declared.add(m);
            }
            Method shape = unique(declared, "recent search bind on the typing-screen row's interface");
            boolean bound = false;
            if (shape != null) {
                Method bind = clean.methods.get(TYPEAHEAD_ROW + "->" + shape.getName() + RECENT_ROW_BIND);
                if (bind == null || bind.getImplementation() == null || AccessFlags.STATIC.isSet(bind.getAccessFlags())) {
                    fail("the typing-screen row has no recent search bind " + shape.getName() + RECENT_ROW_BIND);
                } else {
                    Method m = actual(bind);
                    List<Integer> sites = calls(m, rowHook, 1);
                    if (m != null && sites.size() == 1) {
                        bound = sites.get(0) == 0 && arguments(instructions(m).get(0)).equals(List.of(parameter(m, -1), parameter(m, 1)));
                        if (!bound) fail(rowHook + " does not take the row and its clear-button flag first in " + m);
                        else remove(m, 0, 1);
                    }
                }
            }
            boolean measured = rowMeasure(row, measureHook, "typing-screen row");
            capability(c.callee, bound && measured);
        }

        static final String RECENT_SEARCH_CELL = "Lcom/pinterest/feature/search/landing/view/SlpRecentSearchCell;";
        static final String GESTALT_TEXT = "Lcom/pinterest/gestalt/text/GestaltText;";

        /**
         * The search page's Recent searches block, which holds the heading and the recent-search
         * cells. The one method building those cells keeps them in an ArrayList on the block, so the
         * block is the Android view whose ArrayList that method reads, and it holds the heading text. It folds through the cells'
         * own visibility and measure hooks, as overrides of a block with no onMeasure of its own.
         */
        void recentSearchHeading(Contract c) {
            List<Method> builders = new ArrayList<>();
            for (Method m : clean.methods.values()) if (!m.getDefiningClass().equals(RECENT_SEARCH_CELL)
                    && instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.NEW_INSTANCE && RECENT_SEARCH_CELL.equals(String.valueOf(reference(i)))))
                builders.add(m);
            Method builder = unique(builders, "the method that builds recent-search cells");
            String block = null;
            if (builder != null) {
                Set<String> owners = new TreeSet<>();
                for (Instruction i : instructions(builder)) if (reference(i) instanceof FieldReference f
                        && f.getType().equals("Ljava/util/ArrayList;") && frameworkView(f.getDefiningClass())) owners.add(f.getDefiningClass());
                if (owners.size() == 1) block = owners.iterator().next();
                else fail("the recent-search cell builder reads " + owners.size() + " view lists, expected 1: " + owners);
            }
            if (block != null) {
                boolean heading = false;
                for (Field f : clean.classes.get(block).getFields())
                    if (f.getType().equals(GESTALT_TEXT) && !AccessFlags.STATIC.isSet(f.getAccessFlags())) heading = true;
                if (!heading) {
                    fail("the recent searches block " + block + " holds no heading text, so it may be a wider view");
                    block = null;
                }
            }
            boolean folded = block != null && !clean.methods.containsKey(block + "->onMeasure(II)V")
                    && canOverride(block, "setVisibility", "(I)V") && canOverride(block, "onMeasure", "(II)V");
            if (block != null && !folded) fail("the recent searches block " + block + " measures itself or can't be overridden");
            if (folded) view(block, c.strings.get(0), c.strings.get(1), null);
            capability(c.callee, folded);
        }

        static final String CLOSEUP_BACK_ID = "closeup_back_button", CLOSEUP_LENS_ID = "flashlight_search_button",
                CLOSEUP_CAROUSEL_LENS_ID = "carousel_flashlight_button";
        static final String FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;";
        static final String GET_CLASS = "Ljava/lang/Object;->getClass()Ljava/lang/Class;";
        static final Set<Opcode> MOVE_OBJECTS = Set.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16);

        /** Where a closeup button is handed over: in front of clean instruction [at] of [method], with [register]. */
        record ButtonSite(Method method, int at, int register, String view, boolean found, String hook) {}

        /**
         * The closeup's back arrow and visual search (lens) buttons. Every clean method reading the R
         * field named for a button's id hands the button over where the patch finds it. Found: the id,
         * findViewById with it and move-result-object, then the hook with that register, reached only
         * from the move-result, and the check-cast after it, past a getClass null check, on the button
         * or a move-object copy of it, names the button's class. The picture carousel's lens is found
         * the same way when the build has one. Built: a method answering one of the APK's own framework views through a
         * single return-object, with the hook on the answered register as the only way into the
         * return. Constructed: see constructedButtons. Each button class then gains, or starts its own, setVisibility with the visibility
         * hook taking the view and the request and answering into the request.
         */
        void closeupButtons(Contract c) {
            String backHook = c.strings.get(0), lensHook = c.strings.get(1), visibilityHook = c.strings.get(2);
            List<ButtonSite> sites = new ArrayList<>();
            boolean back = buttonSites(CLOSEUP_BACK_ID, backHook, sites), lens = buttonSites(CLOSEUP_LENS_ID, lensHook, sites);
            if (!back) fail("nothing finds the closeup's back arrow");
            if (!lens) fail("nothing builds the closeup's visual search button");
            buttonSites(CLOSEUP_CAROUSEL_LENS_ID, lensHook, sites);
            Map<Method, List<ButtonSite>> byMethod = new LinkedHashMap<>();
            for (ButtonSite site : sites) byMethod.computeIfAbsent(site.method(), k -> new ArrayList<>()).add(site);
            boolean handed = back && lens;
            for (Map.Entry<Method, List<ButtonSite>> entry : byMethod.entrySet()) {
                Method m = actual(entry.getKey());
                List<ButtonSite> here = entry.getValue();
                here.sort((a, b) -> Integer.compare(a.at(), b.at()));
                for (String hook : List.of(backHook, lensHook)) {
                    long expected = here.stream().filter(s -> s.hook().equals(hook)).count();
                    if (expected > 0) calls(m, hook, (int) expected);
                }
                if (m == null) { handed = false; continue; }
                List<Instruction> body = instructions(m), was = instructions(entry.getKey());
                for (int n = 0; n < here.size(); n++) {
                    ButtonSite site = here.get(n);
                    int at = site.at() + n;
                    boolean placed = at + 1 < body.size() && site.hook().equals(String.valueOf(reference(body.get(at))))
                            && arguments(body.get(at)).equals(List.of(site.register()))
                            && body.get(at + 1).getOpcode() == was.get(site.at()).getOpcode()
                            && onlyFrom(m, at + 1, at) && (!site.found() || onlyFrom(m, at, at - 1));
                    if (!placed) { fail(site.hook() + " doesn't hand over the button in front of instruction " + site.at() + " of " + m); handed = false; }
                    else remove(m, at, at + 1);
                }
            }
            Set<String> views = new TreeSet<>();
            for (ButtonSite site : sites) views.add(site.view());
            boolean held = !sites.isEmpty() && holdsVisibility(views, visibilityHook);
            capability(c.callee, handed && held);
        }

        /** Each closeup button class already checked, and whether it held, so a class several switches share is checked once. */
        final Map<String, Boolean> heldViews = new HashMap<>();

        /**
         * Each of [types] gains, or starts its own, setVisibility with the visibility hook taking the
         * view and the request and answering into the request.
         */
        boolean holdsVisibility(Collection<String> types, String hook) {
            boolean held = true;
            for (String type : types) {
                if (!heldViews.containsKey(type)) heldViews.put(type, holdsVisibility(type, hook));
                held &= heldViews.get(type);
            }
            return held;
        }

        boolean holdsVisibility(String type, String hook) {
            ClassDef cd = clean.classes.get(type);
            if (cd == null || !frameworkView(type) || !canOverride(type, "setVisibility", "(I)V")) {
                fail("the button class " + type + " isn't a view whose setVisibility can be overridden"); return false;
            }
            Method m = actual(type + "->setVisibility(I)V");
            List<Integer> calls = calls(m, hook, 1);
            if (m == null || calls.size() != 1) return false;
            List<Instruction> body = instructions(m);
            boolean prefix = calls.get(0) == 0 && body.size() > 2
                    && arguments(body.get(0)).equals(List.of(parameter(m, -1), parameter(m, 0)))
                    && isMoveResult(body.get(1).getOpcode()) && firstRegister(body.get(1)) == parameter(m, 0);
            if (!prefix) { fail(hook + " does not pass the button and its request, in place, first in " + m); return false; }
            remove(m, 0, 2);
            inherited(cd, m, "setVisibility", "(I)V");
            return true;
        }

        static final String CLOSEUP_REMIX_ID = "collages_remix_closeup_button", CLOSEUP_COMMENTS_ID = "action_module_comments_icon",
                CLOSEUP_VISIT_SITE_ID = "clickthrough_button", BUTTON_GROUP = "/GestaltButtonGroup;";

        /**
         * The Remix button, made by a call (see madeButtons). Right after the call's move-result-object
         * comes the hook with that register, reached only from it, then the clean next instruction.
         * Its class holds its visibility like the other buttons. A build that makes no Remix button, or
         * branches into the spot after it, has no Remix switch.
         */
        void closeupRemix(Contract c) {
            String hook = c.strings.get(0), visibilityHook = c.strings.get(1);
            List<ButtonSite> sites = madeButtons(CLOSEUP_REMIX_ID, hook);
            sites.removeIf(site -> !onlyFrom(site.method(), site.at(), site.at() - 1));
            Map<Method, List<ButtonSite>> byMethod = new LinkedHashMap<>();
            for (ButtonSite site : sites) byMethod.computeIfAbsent(site.method(), k -> new ArrayList<>()).add(site);
            boolean placed = !sites.isEmpty();
            for (Map.Entry<Method, List<ButtonSite>> entry : byMethod.entrySet()) {
                Method old = entry.getKey(), m = actual(old);
                calls(m, hook, entry.getValue().size());
                if (m == null) { placed = false; continue; }
                List<Instruction> was = instructions(old), body = instructions(m);
                for (ButtonSite site : entry.getValue()) {
                    // The same call in the built method, wherever other switches' hooks moved it.
                    int at = sameCall(was, site.at() - 2, body);
                    boolean ok = at >= 0 && at + 3 < body.size() && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                            && firstRegister(body.get(at + 1)) == site.register()
                            && hook.equals(String.valueOf(reference(body.get(at + 2)))) && arguments(body.get(at + 2)).equals(List.of(site.register()))
                            && body.get(at + 3).getOpcode() == was.get(site.at()).getOpcode()
                            && onlyFrom(m, at + 2, at + 1) && onlyFrom(m, at + 3, at + 2);
                    if (!ok) { fail(hook + " doesn't hand over the button made at instruction " + (site.at() - 2) + " of " + m); placed = false; }
                    else remove(m, at + 2, at + 3);
                }
            }
            Set<String> views = new TreeSet<>();
            for (ButtonSite site : sites) views.add(site.view());
            capability(c.callee, placed && holdsVisibility(views, visibilityHook));
        }

        /**
         * Every place [id]'s button is made by a call: a clean method other than a constructor, passed
         * the id while its register still holds it, answering one of the APK's own framework views into
         * the move-result-object right after. The hook goes in after that.
         */
        List<ButtonSite> madeButtons(String id, String hook) {
            List<ButtonSite> sites = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                List<Instruction> body = instructions(m);
                for (int k = 0; k < body.size(); k++) {
                    if (!readsId(body.get(k), id)) continue;
                    int register = firstRegister(body.get(k));
                    for (int j = k + 1; j < body.size() - 1; j++) {
                        Instruction call = body.get(j);
                        if ((call instanceof FiveRegisterInstruction || call instanceof RegisterRangeInstruction)
                                && reference(call) instanceof MethodReference target && !target.getName().equals("<init>")
                                && callRegisters(call).contains(register)) {
                            String type = target.getReturnType();
                            if (body.get(j + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && clean.classes.containsKey(type) && frameworkView(type)) {
                                sites.add(new ButtonSite(m, j + 2, firstRegister(body.get(j + 1)), type, true, hook));
                                break;
                            }
                        }
                        if (writes(call, register)) break;
                    }
                }
            }
            return sites;
        }

        /** Where [body] has the call clean [was] has at [at]: the same call with the same registers, counted in order. */
        static int sameCall(List<Instruction> was, int at, List<Instruction> body) {
            String key = callKey(was.get(at));
            if (key == null) return -1;
            int ordinal = 0;
            for (int k = 0; k < at; k++) if (key.equals(callKey(was.get(k)))) ordinal++;
            for (int k = 0; k < body.size(); k++)
                if (key.equals(callKey(body.get(k))) && ordinal-- == 0) return k;
            return -1;
        }

        /** An invoke's opcode, target and registers, null for anything else. */
        static String callKey(Instruction i) {
            if (!(i instanceof FiveRegisterInstruction || i instanceof RegisterRangeInstruction) || !(reference(i) instanceof MethodReference)) return null;
            return i.getOpcode() + " " + reference(i) + " " + callRegisters(i);
        }

        /**
         * Rows handed over whole from their constructors. The row under a pin's picture is an APK
         * framework view whose constructor builds the comment button, an APK view whose own
         * constructor reads the comment id and calls setId. For [visit], every APK framework view whose
         * constructor builds a GestaltButtonGroup and a class reading the Visit site id. A row whose
         * constructors have no parentCall is left alone. Right after each row constructor's parent
         * call comes the hook with this, once, reached only from that call. The views the action row's
         * constructors build, or each Visit site row itself, hold their visibility like the buttons,
         * and a row group with a view that can't is left alone.
         */
        void closeupRows(Contract c, boolean visit) {
            String hook = c.strings.get(0), visibilityHook = c.strings.get(1);
            Set<String> marks = new HashSet<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method m : cd.getMethods()) {
                    List<Instruction> body = instructions(m);
                    boolean mark = visit ? body.stream().anyMatch(i -> readsId(i, CLOSEUP_VISIT_SITE_ID))
                            : m.getName().equals("<init>") && body.stream().anyMatch(i -> readsId(i, CLOSEUP_COMMENTS_ID))
                                    && body.stream().anyMatch(i -> reference(i) instanceof MethodReference r && r.getName().equals("setId")
                                            && r.getParameterTypes().size() == 1 && r.getParameterTypes().get(0).toString().equals("I"));
                    if (mark) marks.add(cd.getType());
                }
            }
            if (!visit) marks.removeIf(type -> !frameworkView(type));
            Map<String, List<Method>> rows = new TreeMap<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN) || !frameworkView(cd.getType())) continue;
                for (Method m : cd.getMethods()) {
                    if (!m.getName().equals("<init>")) continue;
                    List<String> built = newTypes(m);
                    if (built.stream().anyMatch(marks::contains) && (!visit || built.stream().anyMatch(t -> t.endsWith(BUTTON_GROUP))))
                        rows.computeIfAbsent(cd.getType(), k -> new ArrayList<>()).add(m);
                }
            }
            rows.values().removeIf(constructors -> !constructors.stream().allMatch(m -> parentCall(m) >= 0));
            Set<String> views = new TreeSet<>();
            if (visit) views.addAll(rows.keySet());
            else for (List<Method> constructors : rows.values()) for (Method m : constructors)
                for (String type : newTypes(m)) if (clean.classes.containsKey(type) && frameworkView(type)) views.add(type);
            if (!views.stream().allMatch(type -> heldViews.containsKey(type) || canOverride(type, "setVisibility", "(I)V"))) {
                rows.clear();
                views.clear();
            }
            boolean placed = !rows.isEmpty();
            for (List<Method> constructors : rows.values()) for (Method old : constructors) {
                Method m = actual(old);
                List<Integer> sites = calls(m, hook, 1);
                if (m == null) { placed = false; continue; }
                Instruction parent = instructions(old).get(parentCall(old));
                int at = sites.size() == 1 ? sites.get(0) : -1;
                boolean ok = at > 0 && parentCall(m) == at - 1
                        && String.valueOf(reference(instructions(m).get(at - 1))).equals(String.valueOf(reference(parent)))
                        && arguments(instructions(m).get(at)).equals(List.of(parameter(m, -1))) && onlyFrom(m, at, at - 1);
                if (!ok) { fail(hook + " doesn't hand over the row right after its parent's constructor in " + m); placed = false; }
                else remove(m, at, at + 1);
            }
            capability(c.callee, placed && holdsVisibility(views, visibilityHook));
        }

        static final String GESTALT_BUTTON = "Lcom/pinterest/gestalt/button/view/GestaltButton;",
                COMPOUND_PADDING = "Landroid/widget/TextView;->setCompoundDrawablePadding(I)V";

        /** The hooks that take a GestaltButton right after it pads its icon, one a patch. */
        static final Set<String> STYLE_HOOKS = Set.of(
                "Lapp/hushpinterest/extension/pinterest/ui/CloseupButtons;->saveButton(Landroid/view/View;)V",
                "Lapp/hushpinterest/extension/pinterest/ui/AmoledBlack;->gestaltButton(Landroid/view/View;)V");

        /** The Save button's size and color, Hide closeup buttons' hook on the button styling. */
        void closeupSaveButton(Contract c) {
            styleHook(c);
        }

        /** Black buttons, AMOLED black's hook on the same styling. */
        void blackButtons(Contract c) {
            styleHook(c);
        }

        static final String SEARCH_GUIDE = "Lcom/pinterest/gestalt/searchGuide/GestaltSearchGuide;";

        /**
         * Black buttons on the chips over search results. The search guide's one instance method
         * taking two of the same look and returning nothing hands the guide, its this, to the hook
         * right before each of its returns, and each return is reached only from its hook.
         */
        void blackSearchGuides(Contract c) {
            String hook = c.strings.get(0);
            ClassDef guide = clean.classes.get(SEARCH_GUIDE);
            List<Method> looks = new ArrayList<>();
            if (guide != null) for (Method m : guide.getMethods()) {
                List<? extends CharSequence> params = m.getParameterTypes();
                if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null && m.getReturnType().equals("V")
                        && params.size() == 2 && params.get(0).toString().equals(params.get(1).toString())
                        && params.get(0).toString().startsWith("L")) looks.add(m);
            }
            Method look = unique(looks, "The search guide's look method");
            int ends = 0;
            if (look != null) for (Instruction i : instructions(look)) if (i.getOpcode() == Opcode.RETURN_VOID) ends++;
            Method m = actual(look);
            List<Integer> sites = calls(m, hook, ends);
            boolean placed = false;
            if (m != null && ends > 0 && sites.size() == ends) {
                List<Instruction> body = instructions(m);
                int self = parameter(m, -1);
                placed = true;
                for (int at : sites) placed &= at + 1 < body.size() && body.get(at + 1).getOpcode() == Opcode.RETURN_VOID
                        && arguments(body.get(at)).equals(List.of(self)) && onlyFrom(m, at + 1, at);
                if (!placed) fail(hook + " doesn't hand the guide over right before each return of " + m);
                else for (int at : sites) remove(m, at, at + 1);
            }
            capability(c.callee, placed);
        }

        static final String SETTINGS_PROFILE_PREVIEW = "Lcom/pinterest/feature/settings/menu/view/SettingsProfilePreview;",
                CARD_VIEW = "Landroidx/cardview/widget/CardView;",
                SEARCH_BUBBLE_FILL = "rounded_rect_medium_radius_opaque_background",
                SET_BACKGROUND = "Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V";

        /**
         * Black buttons on the account card at the top of Pinterest's settings. The one store of a
         * CardView, cast just before, into the settings profile preview's field is followed by the
         * hook with the stored register, once, reached only from the store, and the instruction after
         * the hook is reached only from it.
         */
        void blackSettingsCard(Contract c) {
            List<Method> stores = new ArrayList<>();
            Map<Method, Integer> storeAt = new HashMap<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method m : cd.getMethods()) {
                    List<Instruction> body = instructions(m);
                    for (int k = 1; k < body.size(); k++) {
                        Instruction store = body.get(k), cast = body.get(k - 1);
                        if (store.getOpcode() != Opcode.IPUT_OBJECT || !(reference(store) instanceof FieldReference field)
                                || !field.getDefiningClass().equals(SETTINGS_PROFILE_PREVIEW) || !field.getType().equals(CARD_VIEW)) continue;
                        if (cast.getOpcode() != Opcode.CHECK_CAST || !String.valueOf(reference(cast)).equals(CARD_VIEW)
                                || ((OneRegisterInstruction) cast).getRegisterA() != ((TwoRegisterInstruction) store).getRegisterA()) continue;
                        stores.add(m);
                        storeAt.put(m, k);
                    }
                }
            }
            Method old = unique(stores, "The account card store");
            hookAfter(c, old, old == null ? -1 : storeAt.get(old), "store the account card");
        }

        /**
         * Black buttons on the rows of a "Refine your search" list. The one method that reads the
         * rows' rounded shape puts it on the row with setBackground, the first such call after the
         * read, and right after that call comes the hook with the row, once, reached only from the
         * call, and the instruction after the hook is reached only from it.
         */
        void blackSearchBubbles(Contract c) {
            List<Method> builders = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method m : cd.getMethods()) if (instructions(m).stream().anyMatch(i -> reference(i) instanceof FieldReference f
                        && f.getName().equals(SEARCH_BUBBLE_FILL) && f.getType().equals("I"))) builders.add(m);
            }
            Method old = unique(builders, "The Refine your search row builder");
            int at = -1;
            if (old != null) {
                List<Instruction> body = instructions(old);
                int read = -1;
                for (int k = 0; k < body.size() && read < 0; k++)
                    if (reference(body.get(k)) instanceof FieldReference f && f.getName().equals(SEARCH_BUBBLE_FILL)) read = k;
                for (int k = read; k < body.size() && at < 0; k++)
                    if (body.get(k).getOpcode() == Opcode.INVOKE_VIRTUAL && SET_BACKGROUND.equals(String.valueOf(reference(body.get(k))))) at = k;
            }
            hookAfter(c, old, at, "put the shape on the Refine your search row");
        }

        /**
         * The hook right after [old]'s instruction at [index], with the view that instruction stored
         * or called on: once, reached only from it, the instruction after the hook reached only from
         * the hook. Fails and leaves the capability off when it isn't so.
         */
        void hookAfter(Contract c, Method old, int index, String what) {
            String hook = c.strings.get(0);
            Method m = actual(old);
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && index >= 0 && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                Instruction site = instructions(old).get(index);
                int at = sites.get(0);
                int view = site.getOpcode() == Opcode.IPUT_OBJECT ? ((TwoRegisterInstruction) site).getRegisterA() : callRegisters(site).get(0);
                placed = at > 0 && at + 1 < body.size() && body.get(at - 1).getOpcode() == site.getOpcode()
                        && String.valueOf(reference(body.get(at - 1))).equals(String.valueOf(reference(site)))
                        && arguments(body.get(at)).equals(List.of(view)) && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at);
                if (!placed) fail(hook + " doesn't take the view right after the code that " + what + " in " + m);
                else remove(m, at, at + 1);
            }
            capability(c.callee, placed);
        }

        /**
         * A hook on every GestaltButton's styling. GestaltButton's one instance method taking two of
         * the same style object and returning nothing calls setCompoundDrawablePadding on its this
         * register exactly once, with nothing writing that register before it, no backward branch and
         * no try block. Right after the padding come the styling hooks with that register, in the
         * order their patches left them, each reached only from the one before. The instruction that
         * followed the padding is reached only from the last, so the branch that skips the padding
         * lands on the first hook and runs them all.
         */
        void styleHook(Contract c) {
            String hook = c.strings.get(0);
            ClassDef button = clean.classes.get(GESTALT_BUTTON);
            List<Method> styles = new ArrayList<>();
            Map<Method, Integer> padAt = new HashMap<>();
            if (button != null) for (Method m : button.getMethods()) {
                List<? extends CharSequence> params = m.getParameterTypes();
                if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null || !m.getReturnType().equals("V")
                        || params.size() != 2 || !params.get(0).toString().equals(params.get(1).toString()) || params.get(0).length() == 1) continue;
                int self = parameter(m, -1);
                List<Instruction> body = instructions(m);
                List<Integer> pads = new ArrayList<>();
                for (int k = 0; k < body.size(); k++) if (COMPOUND_PADDING.equals(String.valueOf(reference(body.get(k))))
                        && callRegisters(body.get(k)).get(0) == self) pads.add(k);
                if (pads.size() != 1) continue;
                boolean kept = m.getImplementation().getTryBlocks().isEmpty();
                for (int k = 0; kept && k < pads.get(0); k++) kept = !writes(body.get(k), self);
                for (Instruction i : body) kept &= !branchesBack(i);
                if (kept) { styles.add(m); padAt.put(m, pads.get(0)); }
            }
            Method style = unique(styles, "the GestaltButton style method that pads its icon on itself");
            Method m = actual(style);
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (style != null && m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m), was = instructions(style);
                int at = sites.get(0), self = parameter(style, -1), pad = padAt.get(style);
                int end = pad + 1;
                boolean run = true;
                while (end < body.size() && STYLE_HOOKS.contains(String.valueOf(reference(body.get(end))))) {
                    run &= arguments(body.get(end)).equals(List.of(self)) && (end == pad + 1 || onlyFrom(m, end, end - 1));
                    end++;
                }
                placed = run && at > pad && at < end && end < body.size() && COMPOUND_PADDING.equals(String.valueOf(reference(body.get(pad))))
                        && callRegisters(body.get(pad)).get(0) == self
                        && body.get(end).getOpcode() == was.get(pad + 1).getOpcode() && onlyFrom(m, end, end - 1);
                if (!placed) fail(hook + " doesn't hand over the button right after " + style + " pads its icon");
                else remove(m, at, at + 1);
            }
            capability(c.callee, placed);
        }

        static boolean branchesBack(Instruction i) {
            if (i instanceof SwitchPayload payload) return payload.getSwitchElements().stream().anyMatch(e -> e.getOffset() < 0);
            return i instanceof OffsetInstruction branch && branch.getCodeOffset() < 0;
        }

        static List<String> newTypes(Method m) {
            List<String> types = new ArrayList<>();
            for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.NEW_INSTANCE) types.add(String.valueOf(reference(i)));
            return types;
        }

        /**
         * Where the constructor calls its parent's constructor (or another of its own) on its this
         * register, or -1 when it doesn't or something else goes in that register first. D8 may reuse
         * the register once this is dead, so a row is handed over right after that call.
         */
        int parentCall(Method m) {
            if (m.getImplementation() == null) return -1;
            int self = parameter(m, -1);
            ClassDef owner = clean.classes.get(m.getDefiningClass());
            String parent = owner == null ? null : owner.getSuperclass();
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) {
                Instruction i = body.get(at);
                if ((i.getOpcode() == Opcode.INVOKE_DIRECT || i.getOpcode() == Opcode.INVOKE_DIRECT_RANGE) && reference(i) instanceof MethodReference r
                        && r.getName().equals("<init>") && (r.getDefiningClass().equals(parent) || r.getDefiningClass().equals(m.getDefiningClass()))
                        && !callRegisters(i).isEmpty() && callRegisters(i).get(0) == self) return at;
                if (writes(i, self)) return -1;
            }
            return -1;
        }

        static final String SEARCH_LABEL_FLAG = ", isVisualActionAnimated=", SEARCH_GLOW_FLAG = "isGlowAnimationEnabled=",
                SEARCH_IMAGE_TEXT = "search_image";

        /**
         * The lens's Search image label and glow. In the one clean class that reads the lens id,
         * search_image and the closeup state's label flag (see stateFlag), every read of the label or
         * glow flag gains the hook on the read's register, answered back into it, reached only from the
         * read and followed by the original next instruction. A build without that state, its glow flag,
         * a glow read in the builder or a single builder has no label switch, and its flag stays off.
         */
        void closeupSearchLabel(Contract c) {
            String hook = c.strings.get(0);
            Method state = closeupState();
            String flag = state == null ? null : stateFlag(state, SEARCH_LABEL_FLAG, false, ""),
                    glow = flag == null ? null : stateFlag(state, SEARCH_GLOW_FLAG, true, flag);
            List<ClassDef> builders = new ArrayList<>();
            if (glow != null) for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                boolean lens = false, text = false, flagged = false;
                for (Method m : cd.getMethods()) for (Instruction i : instructions(m)) {
                    lens |= readsId(i, CLOSEUP_LENS_ID);
                    text |= readsId(i, SEARCH_IMAGE_TEXT);
                    flagged |= readsFlag(i, flag);
                }
                if (lens && text && flagged) builders.add(cd);
            }
            boolean labeled = builders.size() == 1;
            if (labeled) {
                boolean glows = false;
                for (Method m : builders.get(0).getMethods()) for (Instruction i : instructions(m)) glows |= readsFlag(i, glow);
                labeled = glows;
            }
            if (labeled) for (Method old : builders.get(0).getMethods()) {
                List<Instruction> was = instructions(old);
                List<Integer> reads = new ArrayList<>();
                for (int k = 0; k < was.size(); k++) if (readsFlag(was.get(k), flag) || readsFlag(was.get(k), glow)) reads.add(k);
                if (reads.isEmpty()) continue;
                Method m = actual(old);
                calls(m, hook, reads.size());
                if (m == null) { labeled = false; continue; }
                List<Instruction> body = instructions(m);
                // The n-th read in the built method, wherever another switch's hooks moved it.
                List<Integer> built = new ArrayList<>();
                for (int k = 0; k < body.size(); k++) if (readsFlag(body.get(k), flag) || readsFlag(body.get(k), glow)) built.add(k);
                if (built.size() != reads.size()) { fail(m + " reads the label and glow flags " + built.size() + " times, not " + reads.size()); labeled = false; continue; }
                for (int n = 0; n < reads.size(); n++) {
                    int read = reads.get(n), at = built.get(n), register = ((TwoRegisterInstruction) was.get(read)).getRegisterA();
                    boolean placed = at + 3 < body.size() && read + 1 < was.size()
                            && ((TwoRegisterInstruction) body.get(at)).getRegisterA() == register
                            && hook.equals(String.valueOf(reference(body.get(at + 1)))) && arguments(body.get(at + 1)).equals(List.of(register))
                            && isMoveResult(body.get(at + 2).getOpcode()) && firstRegister(body.get(at + 2)) == register
                            && body.get(at + 3).getOpcode() == was.get(read + 1).getOpcode()
                            && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                    if (!placed) { fail(hook + " doesn't answer the label or glow flag read at instruction " + read + " of " + m); labeled = false; }
                    else remove(m, at + 1, at + 3);
                }
            }
            capability(c.callee, labeled);
        }

        /** The closeup state's toString, the single one naming isVisualActionAnimated, or null. */
        Method closeupState() {
            List<Method> described = new ArrayList<>();
            for (Method m : clean.holding(SEARCH_LABEL_FLAG)) if (m.getName().equals("toString") && m.getParameterTypes().isEmpty()) described.add(m);
            return described.size() == 1 ? described.get(0) : null;
        }

        /**
         * The first boolean other than [not] that [state] reads after the first string equal to [name]
         * (ending in it, with [suffix]), as a field descriptor, or null when there's no such string or
         * the read isn't the state's own.
         */
        String stateFlag(Method state, String name, boolean suffix, String not) {
            List<Instruction> body = instructions(state);
            int named = -1;
            for (int k = 0; k < body.size() && named < 0; k++)
                if (reference(body.get(k)) instanceof StringReference s && (suffix ? s.getString().endsWith(name) : s.getString().equals(name))) named = k;
            if (named < 0) return null;
            for (int k = named + 1; k < body.size(); k++) if (body.get(k).getOpcode() == Opcode.IGET_BOOLEAN) {
                FieldReference f = (FieldReference) reference(body.get(k));
                if (f.toString().equals(not)) continue;
                return f.getDefiningClass().equals(state.getDefiningClass()) && f.getType().equals("Z") ? f.toString() : null;
            }
            return null;
        }

        static final String CLOSEUP_MODULE = "Lcom/pinterest/activity/pin/view/modules/PinCloseupBaseModule;",
                TITLE_CHEVRON_ID = "closeup_metadata_expand_chevron", HOLISTIC_METADATA = "android_closeup_holistic_metadata";

        /**
         * The closeup title module taking its pin: the one clean instance updatePin(pin) of a closeup
         * module that checks the holistic metadata experiment, in a class whose constructor builds the
         * title row (a view whose own constructor reads the chevron's id) and adds a view. The hook
         * opens the method, a range call on the module and the pin, the frame's last two registers, with
         * only the other hook writing the same line allowed ahead of it.
         */
        void postedDate(Contract c) {
            String hook = c.strings.get(0);
            List<Method> updates = new ArrayList<>();
            for (Method m : clean.holding(HOLISTIC_METADATA)) {
                if (!m.getName().equals("updatePin") || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V")
                        || m.getParameterTypes().size() != 1) continue;
                ClassDef owner = clean.classes.get(m.getDefiningClass());
                if (owner != null && CLOSEUP_MODULE.equals(owner.getSuperclass()) && buildsTitleRow(owner)) updates.add(m);
            }
            Method m = actual(unique(updates, "closeup title module"));
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                int registers = m.getImplementation().getRegisterCount();
                placed = true;
                for (int at = 0; at <= sites.get(0); at++) {
                    Instruction i = body.get(at);
                    placed &= i.getOpcode() == Opcode.INVOKE_STATIC_RANGE && arguments(i).equals(List.of(registers - 2, registers - 1))
                            && String.valueOf(reference(i)).startsWith(OWN + "pinterest/ui/PostedDate;->");
                }
                if (!placed) fail(hook + " isn't among the first calls, on the module and its pin, in " + m);
                else remove(m, sites.get(0), sites.get(0) + 1);
            }
            capability(c.callee, placed);
        }

        /** One of the hooks that get the last word on whether a closeup module shows for its pin. */
        static boolean closeupGateCall(Instruction i) {
            String target = String.valueOf(reference(i));
            return target.startsWith(OWN) && target.endsWith("(Landroid/view/View;I)I");
        }

        /**
         * A closeup module asks itself whether it shows for its pin in the base class's updatePin, and
         * the hook rewrites that answer in place, on the module and the answer's own register. Other
         * hooks of the same shape may sit between it and Pinterest's call.
         */
        boolean closeupGatePlaced(String hook) {
            List<Method> updates = new ArrayList<>();
            ClassDef base = clean.classes.get(CLOSEUP_MODULE);
            if (base != null) for (Method m : base.getMethods()) if (m.getName().equals("updatePin") && m.getReturnType().equals("V")
                    && m.getParameterTypes().size() == 1 && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null)
                updates.add(m);
            Method m = actual(unique(updates, "closeup module's updatePin"));
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            List<Instruction> body = instructions(m);
            int at = sites.get(0), back = at - 1;
            while (back >= 2 && closeupGateCall(body.get(back - 1))) back -= 2;
            boolean placed = back >= 1 && at + 1 < body.size() && body.get(back).getOpcode() == Opcode.MOVE_RESULT
                    && reference(body.get(back - 1)) instanceof MethodReference ask && ask.getName().equals("shouldShowForPin")
                    && ask.getReturnType().equals("Z") && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT
                    && firstRegister(body.get(at + 1)) == firstRegister(body.get(back))
                    && arguments(body.get(at)).equals(List.of(parameter(m, -1), firstRegister(body.get(back))));
            if (!placed) { fail(hook + " doesn't rewrite the module's own answer in " + m); return false; }
            remove(m, at, at + 2);
            return true;
        }

        void closeupGate(Contract c) {
            capability(c.callee, closeupGatePlaced(c.strings.get(0)));
        }

        /**
         * Let the screen sleep (#47): every View.setKeepScreenOn, Window.addFlags and Window.setFlags
         * call in Pinterest goes to its hook on the same registers and in the same spot. A pin page
         * with a video holds its whole window on through addFlags. Each hook makes Pinterest's call
         * itself, with Pinterest's value whenever its switch is off.
         */
        void screenSleep(Contract c) {
            int total = 0;
            for (int pair = 0; pair < SCREEN_HOLDS.size(); pair++) {
                String original = SCREEN_HOLDS.get(pair), hook = c.strings.get(pair);
                int found = 0;
                for (ClassDef cd : clean.classes.values()) for (Method method : cd.getMethods()) {
                    if (method.getImplementation() == null || cd.getType().startsWith("Lapp/hushpinterest/extension/")) continue;
                    List<Instruction> was = instructions(method);
                    List<Integer> holds = callSites(was, original);
                    if (holds.isEmpty()) continue;
                    found += holds.size();
                    Method m = actual(method);
                    List<Integer> hooked = calls(m, hook, holds.size());
                    if (m == null) continue;
                    List<Instruction> body = instructions(m);
                    if (!callSites(body, original).isEmpty()) fail(hook + " left a screen hold in " + m);
                    for (int n = 0; n < Math.min(hooked.size(), holds.size()); n++) {
                        Instruction old = was.get(holds.get(n));
                        if (!hooked.get(n).equals(holds.get(n))) fail(hook + " moved a screen hold in " + m);
                        if (!arguments(body.get(hooked.get(n))).equals(arguments(old))) fail(hook + " changed its argument registers in " + m);
                        edits.computeIfAbsent(m.toString(), k -> new FeatureEdits()).replacements.put(hooked.get(n), old);
                    }
                }
                if (found > 0) {
                    Method stand = actual(hook);
                    if (stand != null) fallback(stand, original);
                }
                total += found;
            }
            capability(c.callee, total > 0);
        }

        /** The ring's one method taking a size and a screen position asks the hook first and stops on yes. */
        void highlightRing(Contract c) {
            List<Method> places = new ArrayList<>();
            ClassDef ring = clean.classes.get("Lcom/pinterest/education/view/EducationPulsarView;");
            if (ring != null) for (Method m : ring.getMethods()) if (descriptor(m).equals("(II[I)V")
                    && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) places.add(m);
            Method m = actual(unique(places, "the highlight ring's placement"));
            guard(m, c.strings.get(0), 0, List.of(), 0, false, false);
            capability(c.callee, m != null);
        }

        /**
         * The lens button is the one class building the one subclass of ImageStack. Each of the two pin
         * pages hands it the pin and reads the pin's crops through one static call, and the hook takes
         * every such result right where it lands and puts its answer back in the same register.
         */
        void visualSearchThumbnails(Contract c) {
            String hook = c.strings.get(0);
            List<ClassDef> stacks = new ArrayList<>();
            for (ClassDef cd : clean.classes.values())
                if ("Lcom/pinterest/design/components/images/ImageStack;".equals(cd.getSuperclass())) stacks.add(cd);
            ClassDef stack = uniqueClass(stacks, "the lens button's stack");
            ClassDef button = null;
            if (stack != null) {
                List<ClassDef> buttons = new ArrayList<>();
                for (ClassDef cd : clean.classes.values()) {
                    boolean builds = false;
                    for (Method m : cd.getMethods()) {
                        if (m.getImplementation() == null) continue;
                        for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.NEW_INSTANCE
                                && reference(i) instanceof TypeReference t && t.getType().equals(stack.getType())) builds = true;
                    }
                    if (builds) buttons.add(cd);
                }
                button = uniqueClass(buttons, "the lens button");
            }
            boolean placed = button != null;
            int pages = 0;
            if (button != null) for (ClassDef cd : clean.classes.values()) for (Method page : cd.getMethods()) {
                if (!page.getReturnType().equals("V") || page.getParameterTypes().size() != 1 || page.getImplementation() == null
                        || AccessFlags.STATIC.isSet(page.getAccessFlags())) continue;
                String pin = page.getParameterTypes().get(0).toString();
                List<Instruction> was = instructions(page);
                boolean hands = false;
                List<Integer> reads = new ArrayList<>();
                for (int at = 0; at < was.size(); at++) {
                    if (!(reference(was.get(at)) instanceof MethodReference r) || r.getParameterTypes().size() != 1
                            || !r.getParameterTypes().get(0).toString().equals(pin)) continue;
                    if (r.getDefiningClass().equals(button.getType()) && r.getReturnType().equals("V")) hands = true;
                    if (isStaticInvoke(was.get(at).getOpcode()) && r.getReturnType().equals("Ljava/util/ArrayList;")
                            && at + 1 < was.size() && was.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT) reads.add(at);
                }
                if (!hands || reads.isEmpty()) continue;
                pages++;
                Method m = actual(page);
                List<Integer> sites = calls(m, hook, reads.size());
                if (m == null || sites.size() != reads.size()) { placed = false; continue; }
                List<Instruction> body = instructions(m);
                for (int n = 0; n < sites.size(); n++) {
                    int at = sites.get(n);
                    boolean right = at == reads.get(n) + 2 + 2 * n && at + 1 < body.size()
                            && body.get(at - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                            && body.get(at).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                            && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 1))))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                            && firstRegister(body.get(at + 1)) == firstRegister(body.get(at - 1));
                    if (!right) { fail(hook + " doesn't take the crops where they land in " + m); placed = false; continue; }
                    remove(m, at, at + 2);
                }
            }
            if (button != null && pages != 2) { fail("the lens button is set up by " + pages + " pin pages, expected 2"); placed = false; }
            capability(c.callee, placed);
        }

        /** The related pins list's own answer to the question its loadData opens with, or null. */
        Method relatedListGate(String list) {
            Method load = null;
            for (String type = list; type != null && load == null; ) {
                ClassDef cd = clean.classes.get(type);
                if (cd == null) break;
                for (Method m : cd.getMethods()) if (m.getName().equals("loadData") && descriptor(m).equals("()V")
                        && m.getImplementation() != null) load = m;
                type = cd.getSuperclass();
            }
            if (load == null) { fail(list + " has no loadData"); return null; }
            if (!(reference(instructions(load).get(0)) instanceof MethodReference ask) || !ask.getReturnType().equals("Z")
                    || !ask.getParameterTypes().isEmpty()) { fail(load + " doesn't open by asking whether there's more"); return null; }
            List<Method> gates = new ArrayList<>();
            ClassDef owner = clean.classes.get(list);
            if (owner != null) for (Method m : owner.getMethods()) if (m.getName().equals(ask.getName()) && descriptor(m).equals("()Z")
                    && m.getImplementation() != null && !AccessFlags.STATIC.isSet(m.getAccessFlags())) gates.add(m);
            return unique(gates, "the related pins list's answer");
        }

        /**
         * Fold related pins (#46): the list only the pin page presenters build answers "nothing more to
         * load" while folded, ahead of its own answer. Each presenter hands itself over first thing in
         * addDataSources, and the closeup module's answer passes through the hook that places the arrow.
         */
        void relatedPinsFold(Contract c) {
            String folded = c.strings.get(0), bind = c.strings.get(1);
            List<Method> presenters = new ArrayList<>();
            Set<String> lists = new HashSet<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                String list = null;
                for (Method m : cd.getMethods()) if (m.getName().equals("getRelatedPinsPagedList") && m.getParameterTypes().isEmpty()
                        && m.getImplementation() != null && !AccessFlags.SYNTHETIC.isSet(m.getAccessFlags())
                        && !AccessFlags.BRIDGE.isSet(m.getAccessFlags())) list = m.getReturnType();
                if (list == null) continue;
                boolean adds = false;
                for (Method m : cd.getMethods()) if (m.getName().equals("addDataSources") && m.getReturnType().equals("V")
                        && m.getParameterTypes().size() == 1 && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) {
                    presenters.add(m);
                    adds = true;
                }
                if (adds) lists.add(list);
            }
            boolean placed = !presenters.isEmpty() && lists.size() == 1;
            if (!placed) fail("the pin page presenters don't share one related pins list");
            Method gate = placed ? actual(relatedListGate(lists.iterator().next())) : null;
            List<Integer> sites = calls(gate, folded, 1);
            if (gate == null || sites.size() != 1) placed = false;
            else {
                List<Instruction> body = instructions(gate);
                Layout layout = new Layout(gate.getImplementation());
                boolean right = sites.get(0) == 0 && body.size() > 5 && arguments(body.get(0)).isEmpty()
                        && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                        && body.get(3).getOpcode() == Opcode.CONST_4 && body.get(4).getOpcode() == Opcode.RETURN
                        && firstRegister(body.get(2)) == firstRegister(body.get(1))
                        && firstRegister(body.get(3)) == firstRegister(body.get(1))
                        && firstRegister(body.get(4)) == firstRegister(body.get(1))
                        && ((WideLiteralInstruction) body.get(3)).getWideLiteral() == 0
                        && layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(5);
                if (right) remove(gate, 0, 5);
                else { fail(folded + " doesn't answer no ahead of the list's own answer in " + gate); placed = false; }
            }
            for (Method presenter : presenters) {
                Method m = actual(presenter);
                List<Integer> binds = calls(m, bind, 1);
                if (m == null || binds.size() != 1) { placed = false; continue; }
                if (binds.get(0) != 0 || !arguments(instructions(m).get(0)).equals(List.of(parameter(m, -1)))) {
                    fail(bind + " isn't the first call, on the presenter, in " + m);
                    placed = false;
                    continue;
                }
                remove(m, 0, 1);
            }
            if (!closeupGatePlaced(c.strings.get(2))) placed = false;
            capability(c.callee, placed);
        }

        boolean buildsTitleRow(ClassDef owner) {
            for (Method init : owner.getMethods()) {
                if (!init.getName().equals("<init>")) continue;
                boolean adds = false, row = false;
                for (Instruction i : instructions(init)) {
                    if (reference(i) instanceof MethodReference r && r.getName().equals("addView")) adds = true;
                    if (i.getOpcode() == Opcode.NEW_INSTANCE && reference(i) instanceof TypeReference t && readsChevronWhenBuilt(t.getType())) row = true;
                }
                if (adds && row) return true;
            }
            return false;
        }

        boolean readsChevronWhenBuilt(String type) {
            ClassDef built = clean.classes.get(type);
            if (built == null) return false;
            for (Method init : built.getMethods()) {
                if (!init.getName().equals("<init>")) continue;
                for (Instruction i : instructions(init)) if (readsId(i, TITLE_CHEVRON_ID)) return true;
            }
            return false;
        }

        static final String SUGGESTED_BOARD_STATE = "SuggestedBoardItemVMState(itemId=", SHEET_HEIGHT_STATE = "Custom(percentage=";

        /** The suggested board cell's model: the one clean class whose toString holds its state text. Null when the build has none. */
        String suggestedBoardModel() {
            List<Method> found = new ArrayList<>();
            for (Method m : clean.holding(SUGGESTED_BOARD_STATE)) if (m.getName().equals("toString")) found.add(m);
            if (found.isEmpty()) return null;
            Method m = unique(found, "suggested board model");
            return m == null ? null : m.getDefiningClass();
        }

        /** Each clean method outside the extension that builds a [type], with the index of each new-instance. The class itself is left out. */
        List<Map.Entry<Method, Integer>> builders(String type) {
            List<Map.Entry<Method, Integer>> sites = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getDefiningClass().equals(type) || m.getImplementation() == null) continue;
                List<Instruction> body = instructions(m);
                for (int k = 0; k < body.size(); k++)
                    if (body.get(k).getOpcode() == Opcode.NEW_INSTANCE && reference(body.get(k)) instanceof TypeReference t && t.getType().equals(type))
                        sites.add(Map.entry(m, k));
            }
            return sites;
        }

        /** The Save to sheet: the one class that builds a suggested board's cell and has an onViewCreated(View, Bundle). Null when there's none. */
        ClassDef boardPicker() {
            String model = suggestedBoardModel();
            if (model == null) return null;
            Set<String> owners = new TreeSet<>();
            for (Map.Entry<Method, Integer> site : builders(model)) owners.add(site.getKey().getDefiningClass());
            List<ClassDef> pickers = new ArrayList<>();
            for (String type : owners) if (clean.classes.containsKey(type) && viewCreated(clean.classes.get(type)) != null) pickers.add(clean.classes.get(type));
            if (pickers.isEmpty()) return null;
            return uniqueClass(pickers, "Save to sheet");
        }

        static Method viewCreated(ClassDef owner) {
            Method found = null;
            for (Method m : owner.getMethods()) {
                if (!m.getName().equals("onViewCreated") || AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null
                        || !descriptor(m).equals("(Landroid/view/View;Landroid/os/Bundle;)V")) continue;
                if (found != null) return null;
                found = m;
            }
            return found;
        }

        /**
         * Black Save to sheet (#31): the Save to sheet's onViewCreated(View, Bundle) hands the sheet's
         * view over first, a range call on its first parameter after the fragment.
         */
        void saveSheet(Contract c) {
            String hook = c.strings.get(0);
            ClassDef picker = boardPicker();
            if (picker == null) { capability(c.callee, false); return; }
            Method m = actual(viewCreated(picker));
            List<Integer> sites = calls(m, hook, 1);
            boolean placed = false;
            if (m != null && sites.size() == 1) {
                Instruction first = instructions(m).get(0);
                placed = sites.get(0) == 0 && first.getOpcode() == Opcode.INVOKE_STATIC_RANGE && arguments(first).equals(List.of(parameter(m, 0)));
                if (!placed) fail(hook + " isn't the first call, on the sheet's view, in " + m);
                else remove(m, 0, 1);
            }
            capability(c.callee, placed);
        }

        static final String GESTALT_SHEET_HEADER = "gestalt_sheet_header", GESTALT_SHEET_COORDINATOR = "draggable_sheet_coordinator",
                LEGO_MODAL_CONTAINER = "lego_modal_container", LEGO_CLOSE_STICKY = "lego_close_container_sticky",
                PIN_DETAILS_SHEET = "metadata_drawer_bottom_sheet", PIN_DETAILS_FOOTER = "metadata_drawer_footer";

        /** The clean methods outside the extension that read both ids. */
        List<Method> readingBoth(String one, String other) {
            List<Method> found = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method m : cd.getMethods()) {
                    List<Instruction> body = instructions(m);
                    if (body.stream().anyMatch(i -> readsId(i, one)) && body.stream().anyMatch(i -> readsId(i, other))) found.add(m);
                }
            }
            return found;
        }

        boolean viewType(String type) {
            return type.startsWith("Landroid/view/") || type.startsWith("Landroid/widget/") || frameworkView(type);
        }

        /**
         * Black menus and sheets (#39). The one method reading both a Gestalt sheet's header id and its
         * coordinator's, an instance method taking just a view, hands that view over first, a range
         * call on its first parameter. The one constructor reading both a lego menu's list id and its
         * Close row's has its class's views handed over the way handedOverBuilt checks. The onCreateView
         * reading both ids of a pin's details drawer (#21) hands over the view it inherits, right after
         * receiving it. Any one turns the switch on.
         */
        void blackSheets(Contract c) {
            String sheetHook = c.strings.get(0), menuHook = c.strings.get(1), drawerHook = c.strings.get(2);
            boolean placed = false;
            List<Method> setups = readingBoth(GESTALT_SHEET_HEADER, GESTALT_SHEET_COORDINATOR);
            Method setup = setups.isEmpty() ? null : unique(setups, "Gestalt sheet setup");
            if (setup != null && !AccessFlags.STATIC.isSet(setup.getAccessFlags()) && setup.getParameterTypes().size() == 1
                    && viewType(setup.getParameterTypes().get(0).toString())) {
                Method m = actual(setup);
                List<Integer> sites = calls(m, sheetHook, 1);
                if (m != null && sites.size() == 1) {
                    Instruction first = instructions(m).get(0);
                    placed = sites.get(0) == 0 && first.getOpcode() == Opcode.INVOKE_STATIC_RANGE && arguments(first).equals(List.of(parameter(m, 0)));
                    if (!placed) fail(sheetHook + " isn't the first call, on the sheet's view, in " + m);
                    else remove(m, 0, 1);
                }
            }
            List<Method> menus = readingBoth(LEGO_MODAL_CONTAINER, LEGO_CLOSE_STICKY);
            Method menu = menus.isEmpty() ? null : unique(menus, "lego menu builder");
            if (menu != null && menu.getName().equals("<init>")) placed |= handedOverBuilt(List.of(menu.getDefiningClass()), menuHook);
            List<Method> drawers = readingBoth(PIN_DETAILS_SHEET, PIN_DETAILS_FOOTER);
            Method drawer = drawers.isEmpty() ? null : unique(drawers, "pin details drawer builder");
            if (drawer != null && drawer.getName().equals("onCreateView")) {
                Method m = actual(drawer);
                List<Integer> sites = calls(m, drawerHook, 1);
                if (m != null && sites.size() == 1) {
                    List<Instruction> body = instructions(m);
                    int at = sites.get(0);
                    boolean handed = at >= 2 && body.get(at - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                            && (body.get(at - 2).getOpcode() == Opcode.INVOKE_SUPER || body.get(at - 2).getOpcode() == Opcode.INVOKE_SUPER_RANGE)
                            && ((ReferenceInstruction) body.get(at - 2)).getReference().toString().contains("->onCreateView(")
                            && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 1))));
                    if (!handed) fail(drawerHook + " doesn't take the view " + m + " inherits, right after receiving it");
                    else {
                        remove(m, at, at + 1);
                        placed = true;
                    }
                }
            }
            capability(c.callee, placed);
        }

        /**
         * Black board and profile buttons (#39): the bar over a board, a profile's two kinds of filter
         * buttons and a board's header image, each handed over the way handedOverBuilt checks. Any one
         * of the three turns the switch on.
         */
        void blackBoards(Contract c) {
            List<String> s = c.strings;
            boolean placed = handedOverBuilt(List.of(s.get(1)), s.get(0));
            placed |= handedOverBuilt(List.of(s.get(3), s.get(4)), s.get(2));
            placed |= handedOverBuilt(List.of(s.get(6)), s.get(5));
            capability(c.callee, placed);
        }

        /**
         * Each constructor of [types] that calls the constructor of a class its type is built on hands
         * the view over right after that call, on its this register, reached only from that call. One
         * that calls another of its own class's first has no hook. When a type isn't a view, or none of
         * its constructors calls one it's built on, nothing is handed over and the answer is false.
         */
        boolean handedOverBuilt(List<String> types, String hook) {
            Map<Method, Integer> sites = new LinkedHashMap<>();
            List<Method> delegating = new ArrayList<>();
            for (String type : types) {
                ClassDef owner = clean.classes.get(type);
                if (owner == null || !frameworkView(type)) return false;
                int before = sites.size();
                for (Method m : owner.getMethods()) {
                    if (!m.getName().equals("<init>") || m.getImplementation() == null) continue;
                    int call = builtOnCall(m);
                    if (call == -2) return false;
                    if (call == -1) delegating.add(m);
                    else sites.put(m, call);
                }
                if (sites.size() == before) return false;
            }
            for (Method old : delegating) calls(actual(old), hook, 0);
            boolean placed = true;
            for (Map.Entry<Method, Integer> site : sites.entrySet()) {
                Method old = site.getKey(), m = actual(old);
                List<Integer> found = calls(m, hook, 1);
                if (m == null) { placed = false; continue; }
                int call = site.getValue(), at = found.size() == 1 ? found.get(0) : -1;
                boolean ok = at == call + 1 && builtOnCall(m) == call
                        && String.valueOf(reference(instructions(m).get(call))).equals(String.valueOf(reference(instructions(old).get(call))))
                        && arguments(instructions(m).get(at)).equals(List.of(parameter(m, -1))) && onlyFrom(m, at, call);
                if (!ok) { fail(hook + " doesn't hand over the view right after the constructor it's built on in " + m); placed = false; }
                else remove(m, at, at + 1);
            }
            return placed;
        }

        /**
         * Where the constructor calls the constructor of a class it's built on, its parent's or one
         * further up when R8 dropped the one between, on its this register before anything writes it.
         * -1 when it calls another of its own class's first, -2 when it does neither.
         */
        int builtOnCall(Method m) {
            if (m.getImplementation() == null) return -2;
            int self = parameter(m, -1);
            Set<String> ancestors = new HashSet<>();
            ClassDef owner = clean.classes.get(m.getDefiningClass());
            String up = owner == null ? null : owner.getSuperclass();
            while (up != null && ancestors.add(up)) {
                ClassDef parent = clean.classes.get(up);
                up = parent == null ? null : parent.getSuperclass();
            }
            // A constructor passing its arguments on as a register range calls another of its own
            // from a copy of this (14.44.0's PillView(Context): move-object v0, v6), so copies count.
            Set<Integer> copies = new HashSet<>(Set.of(self));
            List<Instruction> body = instructions(m);
            for (int at = 0; at < body.size(); at++) {
                Instruction i = body.get(at);
                if ((i.getOpcode() == Opcode.INVOKE_DIRECT || i.getOpcode() == Opcode.INVOKE_DIRECT_RANGE) && reference(i) instanceof MethodReference r
                        && r.getName().equals("<init>") && !callRegisters(i).isEmpty() && copies.contains(callRegisters(i).get(0))) {
                    if (r.getDefiningClass().equals(m.getDefiningClass())) return -1;
                    if (ancestors.contains(r.getDefiningClass()) && callRegisters(i).get(0) == self) return at;
                }
                if (writes(i, self)) return -2;
                boolean fromThis = (i.getOpcode() == Opcode.MOVE_OBJECT || i.getOpcode() == Opcode.MOVE_OBJECT_FROM16 || i.getOpcode() == Opcode.MOVE_OBJECT_16)
                        && copies.contains(((TwoRegisterInstruction) i).getRegisterB());
                copies.removeIf(register -> writes(i, register));
                if (fromThis) copies.add(((TwoRegisterInstruction) i).getRegisterA());
            }
            return -2;
        }

        /**
         * Hide suggested boards (#32): the one add(Object) right after the suggested board's cell is
         * built, on a list and that cell with nothing reading its answer, becomes the hook on the same
         * two registers.
         */
        void suggestedBoard(Contract c) {
            String hook = c.strings.get(0);
            String model = suggestedBoardModel();
            if (model == null) { capability(c.callee, false); return; }
            List<Method> adds = new ArrayList<>();
            Map<String, Integer> addAt = new HashMap<>();
            for (Map.Entry<Method, Integer> site : builders(model)) {
                int at = suggestedAdd(site.getKey(), site.getValue(), model);
                if (at < 0) continue;
                adds.add(site.getKey());
                addAt.put(site.getKey().toString(), at);
            }
            Method old = unique(adds, "suggested board add");
            Method m = actual(old);
            List<Integer> sites = calls(m, hook, 1);
            boolean swapped = false;
            if (m != null && sites.size() == 1) {
                int at = addAt.get(old.toString());
                Instruction was = instructions(old).get(at);
                swapped = sites.get(0) == at && instructions(m).get(at).getOpcode() == Opcode.INVOKE_STATIC
                        && arguments(instructions(m).get(at)).equals(arguments(was));
                if (!swapped) fail(hook + " doesn't take the suggested board's add, on the same list and cell, in " + m);
                else edits.computeIfAbsent(m.toString(), k -> new FeatureEdits()).replacements.put(at, was);
            }
            capability(c.callee, swapped);
        }

        /** The index of the add(Object) that puts the cell built at [built] into a list, or -1 when that isn't the shape. */
        static int suggestedAdd(Method m, int built, String model) {
            List<Instruction> body = instructions(m);
            int cell = firstRegister(body.get(built)), init = -1;
            for (int k = built + 1; k < body.size() && init < 0; k++)
                if (reference(body.get(k)) instanceof MethodReference r && r.getDefiningClass().equals(model) && r.getName().equals("<init>")) init = k;
            if (init < 0 || init + 1 >= body.size() || DexDiff.firstRegister(body.get(init)) != cell) return -1;
            Instruction add = body.get(init + 1);
            if ((add.getOpcode() != Opcode.INVOKE_VIRTUAL && add.getOpcode() != Opcode.INVOKE_INTERFACE)
                    || !(reference(add) instanceof MethodReference r) || !r.getName().equals("add")
                    || !descriptor(r).equals("(Ljava/lang/Object;)Z") || arguments(add).size() != 2 || arguments(add).get(1) != cell) return -1;
            if (init + 2 < body.size() && isMoveResult(body.get(init + 2).getOpcode())) return -1;
            return init + 1;
        }

        static final String MAIN_ACTIVITY = "Lcom/pinterest/activityLibrary/activity/task/activity/MainActivity;";

        /**
         * Hide offline banner (#48): the main activity's one (Z)V connection handler, the one that
         * calls two or more ()V methods on its offline bar (the activity field whose class is a
         * FrameLayout built from the activity and a view), asks first with whether you're online and
         * returns when the answer is yes, ahead of everything Pinterest's handler does.
         */
        void offlineBanner(Contract c) {
            ClassDef activity = clean.classes.get(MAIN_ACTIVITY);
            if (activity == null) { capability(c.callee, false); return; }
            Set<String> bars = new HashSet<>();
            for (Field f : activity.getFields()) {
                ClassDef type = clean.classes.get(f.getType());
                if (type == null || !"Landroid/widget/FrameLayout;".equals(type.getSuperclass())) continue;
                for (Method m : type.getMethods()) if (m.getName().equals("<init>")
                        && descriptor(m).equals("(" + MAIN_ACTIVITY + "Landroid/view/View;)V")) bars.add(type.getType());
            }
            if (bars.size() != 1) { capability(c.callee, false); return; }
            String bar = bars.iterator().next();
            List<Method> handlers = new ArrayList<>();
            for (Method m : activity.getMethods()) if (m.getImplementation() != null && descriptor(m).equals("(Z)V")
                    && instructions(m).stream().filter(i -> reference(i) instanceof MethodReference r && r.getDefiningClass().equals(bar)
                    && descriptor(r).equals("()V")).count() >= 2) handlers.add(m);
            if (handlers.size() != 1 || handlers.get(0).getImplementation().getRegisterCount() - 2 < 1) { capability(c.callee, false); return; }
            Method m = actual(handlers.get(0));
            guard(m, c.strings.get(0), 0, m == null ? List.of() : List.of(parameter(m, 0)), 0, false, false);
            capability(c.callee, m != null);
        }

        static final String REFRESH_PROMPT_STUB = "stub_refresh_prompt";

        /**
         * Hide the refresh pill (#48): Home's one onEventMainThread that reads the pill's stub hands
         * its event to the presenter (a (Object)V call) before it reads the stub, and the hook asks
         * right after that call, returning before the pill or its timer when the answer is yes. The
         * answer borrows a register nothing reads after the hook.
         */
        void refreshPill(Contract c) {
            List<Method> handlers = clean.methods.values().stream().filter(m -> !m.getDefiningClass().startsWith(OWN)
                    && m.getName().equals("onEventMainThread") && m.getImplementation() != null
                    && instructions(m).stream().anyMatch(i -> readsId(i, REFRESH_PROMPT_STUB))).toList();
            if (handlers.size() != 1) { capability(c.callee, false); return; }
            Method original = handlers.get(0);
            List<Instruction> was = instructions(original);
            int taken = -1;
            for (int k = 0; k < was.size() && taken < 0; k++) if (was.get(k).getOpcode() == Opcode.INVOKE_VIRTUAL
                    && reference(was.get(k)) instanceof MethodReference r && descriptor(r).equals("(Ljava/lang/Object;)V")) taken = k;
            final int from = taken + 1;
            if (taken < 0 || was.subList(from, was.size()).stream().noneMatch(i -> readsId(i, REFRESH_PROMPT_STUB))) {
                capability(c.callee, false); return;
            }
            Method m = actual(original);
            List<Integer> sites = calls(m, c.strings.get(0), 1);
            if (m != null && sites.size() == 1) {
                int answer = from + 1 < instructions(m).size() ? firstRegister(instructions(m).get(from + 1)) : -1;
                if (answer < 0 || !unread(new FeatureFlow(original), was, from, answer))
                    fail(c.strings.get(0) + " borrows a register Home's pill handler still reads in " + m);
            }
            guard(m, c.strings.get(0), from, List.of(), 0, false, false);
            capability(c.callee, m != null && sites.size() == 1);
        }

        /**
         * Hide pop-up banners: the education container's one static show method, the one that wires the
         * banner's four click listeners, loads the container from its first parameter, reads the banner
         * field and hands it to the hook right in front of its only return, which nothing else reaches.
         */
        void popupBanners(Contract c) {
            String hook = c.strings.get(0);
            ClassDef container = clean.classes.get(EDUCATION_CONTAINER);
            if (container == null) { capability(c.callee, false); return; }
            List<Field> fields = new ArrayList<>();
            for (Field f : container.getFields()) if (f.getType().equals(BANNER_OVERLAY)) fields.add(f);
            List<Method> shows = new ArrayList<>();
            for (Method m : container.getMethods()) if (AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null
                    && m.getReturnType().equals("V") && !m.getParameterTypes().isEmpty()
                    && m.getParameterTypes().get(0).toString().equals(EDUCATION_CONTAINER)
                    && instructions(m).stream().anyMatch(i -> reference(i) instanceof MethodReference r && r.getDefiningClass().equals(BANNER_OVERLAY)
                    && r.getReturnType().equals("V") && r.getParameterTypes().size() == 4
                    && r.getParameterTypes().stream().allMatch(p -> p.toString().equals("Landroid/view/View$OnClickListener;")))) shows.add(m);
            if (fields.size() != 1 || shows.size() != 1) { capability(c.callee, false); return; }
            String banner = EDUCATION_CONTAINER + "->" + fields.get(0).getName() + ":" + BANNER_OVERLAY;
            Method m = actual(shows.get(0));
            List<Integer> sites = calls(m, hook, 1);
            boolean handed = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                int at = sites.get(0);
                int view = at >= 2 ? firstRegister(body.get(at - 2)) : -1;
                handed = at >= 2 && at + 1 < body.size()
                        && body.get(at - 2).getOpcode() == Opcode.MOVE_OBJECT_FROM16
                        && ((TwoRegisterInstruction) body.get(at - 2)).getRegisterB() == parameter(m, 0)
                        && body.get(at - 1).getOpcode() == Opcode.IGET_OBJECT && firstRegister(body.get(at - 1)) == view
                        && ((TwoRegisterInstruction) body.get(at - 1)).getRegisterB() == view
                        && String.valueOf(reference(body.get(at - 1))).equals(banner)
                        && arguments(body.get(at)).equals(List.of(view))
                        && body.get(at + 1).getOpcode() == Opcode.RETURN_VOID
                        && body.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count() == 1
                        && onlyFrom(m, at + 1, at) && onlyFrom(m, at, at - 1) && onlyFrom(m, at - 1, at - 2);
                if (!handed) fail(hook + " doesn't take the banner " + m + " shows, from its first parameter, right in front of its only return");
                else remove(m, at - 2, at + 1);
            }
            capability(c.callee, handed);
        }

        /**
         * Hide related pins (#41): every pin page presenter's addDataSources asks the hook right in
         * front of each call that adds a related pins list (the grid, its filtered form, or the
         * refinement delegate's list), and a yes jumps right past that one call. The answer's local
         * is one nothing in the clean presenter reads from that call on.
         */
        void relatedPins(Contract c) {
            String hook = c.strings.get(0);
            List<Method> presenters = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                boolean related = false;
                for (Method m : cd.getMethods()) if (RELATED_PIN_GETTERS.contains(m.getName()) && m.getImplementation() != null) related = true;
                if (related) for (Method m : cd.getMethods()) if (m.getName().equals("addDataSources") && m.getReturnType().equals("V")
                        && m.getParameterTypes().size() == 1 && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null)
                    presenters.add(m);
            }
            boolean found = !presenters.isEmpty();
            if (!found) fail("no pin page presenter adds its sections");
            for (Method presenter : presenters) {
                List<Instruction> was = instructions(presenter);
                List<Integer> adds = new ArrayList<>();
                for (int at = 2; at < was.size(); at++) if (relatedAdd(was, at)) adds.add(at);
                if (adds.isEmpty()) { fail(presenter + " adds no related pins list"); found = false; continue; }
                Method m = actual(presenter);
                List<Integer> sites = calls(m, hook, adds.size());
                if (m == null || sites.size() != adds.size()) { found = false; continue; }
                List<Instruction> body = instructions(m);
                Layout layout = new Layout(m.getImplementation());
                FeatureFlow graph = new FeatureFlow(presenter);
                // Fold related pins hands the presenter over first, ahead of everything here.
                int lead = String.valueOf(reference(body.get(0))).startsWith(OWN + "pinterest/ui/RelatedPinsFold;->bind(") ? 1 : 0;
                for (int n = 0; n < sites.size(); n++) {
                    int at = sites.get(n), add = adds.get(n);
                    boolean skips = at == add + lead + 3 * n && at + 4 < body.size() && arguments(body.get(at)).isEmpty()
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && body.get(at + 2).getOpcode() == Opcode.IF_NEZ
                            && firstRegister(body.get(at + 1)) == firstRegister(body.get(at + 2))
                            && String.valueOf(reference(body.get(at + 3))).equals(String.valueOf(reference(was.get(add))))
                            && arguments(body.get(at + 3)).equals(arguments(was.get(add)))
                            && layout.addresses.get(at + 2) + ((OffsetInstruction) body.get(at + 2)).getCodeOffset() == layout.addresses.get(at + 4)
                            && onlyFrom(m, at, at - 1);
                    if (!skips) { fail(hook + " does not skip only a call that adds related pins in " + m); found = false; continue; }
                    if (!unread(graph, was, add, firstRegister(body.get(at + 1)))) {
                        fail(hook + " borrows v" + firstRegister(body.get(at + 1)) + " in " + m + ", which the presenter still reads");
                        found = false;
                    }
                    remove(m, at, at + 3);
                }
            }
            if (!relatedLoading(c.strings.get(1), c.strings.get(2))) found = false;
            capability(c.callee, found);
        }

        /**
         * The pin page's loading indicator, found by the check its start logs: a yes from the hook
         * ends both wait states (its fields whose type has a COMPLETE of its own) the way the page's
         * own module event does, redraws the loading section through the indicator's one other
         * view-taking method when the section list the start checks is set, and returns. A no lands
         * on the clean start's first instruction.
         */
        boolean relatedLoading(String hook, String check) {
            Method watch = null;
            ClassDef indicator = null;
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method mm : cd.getMethods()) {
                    if (mm.getImplementation() == null || AccessFlags.STATIC.isSet(mm.getAccessFlags())
                            || !mm.getReturnType().equals("V") || mm.getParameterTypes().isEmpty()) continue;
                    boolean logs = false;
                    for (Instruction i : instructions(mm)) if (reference(i) instanceof StringReference s && s.getString().equals(check)) logs = true;
                    if (!logs) continue;
                    if (watch != null) { fail("more than one pin page loading indicator start"); return false; }
                    watch = mm;
                    indicator = cd;
                }
            }
            if (watch == null) { fail("no pin page loading indicator"); return false; }
            Method m = actual(watch);
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            List<Instruction> was = instructions(watch), body = instructions(m);
            Set<String> states = new HashSet<>();
            for (Field f : indicator.getFields()) {
                ClassDef type = clean.classes.get(f.getType());
                if (AccessFlags.STATIC.isSet(f.getAccessFlags()) || type == null) continue;
                for (Field constant : type.getFields()) if (constant.getName().equals("COMPLETE") && constant.getType().equals(f.getType())
                        && AccessFlags.STATIC.isSet(constant.getAccessFlags())) states.add(f.getName());
            }
            String sections = null;
            for (Instruction i : was) {
                if (reference(i) instanceof StringReference) break;
                if (i.getOpcode() == Opcode.IGET_OBJECT && reference(i) instanceof FieldReference f && f.getDefiningClass().equals(indicator.getType())) {
                    sections = f.toString();
                    break;
                }
            }
            int self = parameter(m, -1), view = parameter(m, 0);
            boolean ok = sites.get(0) == 0 && states.size() == 2 && sections != null && body.size() == was.size() + 11
                    && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                    && firstRegister(body.get(1)) == firstRegister(body.get(2)) && firstRegister(body.get(1)) < self;
            Layout layout = new Layout(m.getImplementation());
            int scratch = ok ? firstRegister(body.get(1)) : -1;
            Set<String> ended = new HashSet<>();
            for (int k = 0; ok && k < 2; k++) {
                Instruction read = body.get(3 + 2 * k), write = body.get(4 + 2 * k);
                ok = read.getOpcode() == Opcode.SGET_OBJECT && reference(read) instanceof FieldReference constant
                        && constant.getName().equals("COMPLETE") && write.getOpcode() == Opcode.IPUT_OBJECT
                        && reference(write) instanceof FieldReference state && state.getDefiningClass().equals(indicator.getType())
                        && state.getType().equals(constant.getType()) && constant.getDefiningClass().equals(constant.getType())
                        && firstRegister(read) == scratch && firstRegister(write) == scratch
                        && ((TwoRegisterInstruction) write).getRegisterB() == self && ended.add(state.getName());
            }
            ok = ok && ended.equals(states)
                    && body.get(7).getOpcode() == Opcode.IGET_OBJECT && String.valueOf(reference(body.get(7))).equals(sections)
                    && firstRegister(body.get(7)) == scratch && ((TwoRegisterInstruction) body.get(7)).getRegisterB() == self
                    && body.get(8).getOpcode() == Opcode.IF_EQZ && firstRegister(body.get(8)) == scratch
                    && layout.addresses.get(8) + ((OffsetInstruction) body.get(8)).getCodeOffset() == layout.addresses.get(10)
                    && body.get(9).getOpcode() == Opcode.INVOKE_VIRTUAL && reference(body.get(9)) instanceof MethodReference redraw
                    && redraw.getDefiningClass().equals(indicator.getType()) && !redraw.getName().equals(watch.getName())
                    && redraw.getReturnType().equals("V")
                    && redraw.getParameterTypes().size() == 1 && redraw.getParameterTypes().get(0).toString().equals(watch.getParameterTypes().get(0).toString())
                    && arguments(body.get(9)).equals(List.of(self, view))
                    && body.get(10).getOpcode() == Opcode.RETURN_VOID
                    && layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(11);
            if (!ok) { fail(hook + " does not end only the loading indicator's related pins wait in " + m); return false; }
            remove(m, 0, 11);
            return true;
        }

        /**
         * True when [at] adds a related pins list: a one-argument void call whose argument is what the
         * call right before it returned, from a related grid getter or from the refinement delegate's
         * one getter.
         */
        static boolean relatedAdd(List<Instruction> body, int at) {
            Instruction add = body.get(at), result = body.get(at - 1), source = body.get(at - 2);
            if (add.getOpcode() != Opcode.INVOKE_VIRTUAL || !(reference(add) instanceof MethodReference call)
                    || !call.getReturnType().equals("V") || call.getParameterTypes().size() != 1 || arguments(add).size() != 2) return false;
            if (result.getOpcode() != Opcode.MOVE_RESULT_OBJECT || firstRegister(result) != arguments(add).get(1)) return false;
            if (!(reference(source) instanceof MethodReference getter)) return false;
            if (RELATED_PIN_GETTERS.contains(getter.getName())) return true;
            if (at < 4 || source.getOpcode() != Opcode.INVOKE_VIRTUAL || arguments(source).size() != 1) return false;
            Instruction delegate = body.get(at - 3);
            return delegate.getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(delegate) == arguments(source).get(0)
                    && reference(body.get(at - 4)) instanceof MethodReference owner && owner.getName().equals(RELATED_REFINEMENT_GETTER);
        }

        /**
         * Hide creator name on pins (#41): the collector that draws the pin page's creator row hands
         * the row's avatar to the hook where every branch of that drawing meets, right in front of the
         * row's padding, so the padding is reached only through the hook. The avatar's local is one
         * nothing in the clean collector reads from there on.
         */
        void creatorName(Contract c) {
            String hook = c.strings.get(0);
            ClassDef row = clean.classes.get(CREATOR_ATTRIBUTION);
            if (row == null) { capability(c.callee, false); return; }
            List<Field> avatars = new ArrayList<>();
            for (Field f : row.getFields()) if (f.getType().equals(GESTALT_AVATAR)) avatars.add(f);
            List<Method> collectors = new ArrayList<>();
            List<Integer> pads = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) for (Method m : cd.getMethods()) {
                if (m.getImplementation() == null) continue;
                List<Instruction> body = instructions(m);
                if (body.stream().noneMatch(i -> reference(i) instanceof FieldReference f && f.getDefiningClass().equals(CREATOR_ATTRIBUTION))) continue;
                for (int at = 0; at < body.size(); at++) if (padsCreatorRow(body, at)) { collectors.add(m); pads.add(at); }
            }
            if (avatars.size() != 1 || collectors.size() != 1) { capability(c.callee, false); return; }
            String avatar = CREATOR_ATTRIBUTION + "->" + avatars.get(0).getName() + ":" + GESTALT_AVATAR;
            Method collector = collectors.get(0);
            int pad = pads.get(0);
            List<Instruction> was = instructions(collector);
            int view = ((TwoRegisterInstruction) was.get(pad)).getRegisterB();
            Method m = actual(collector);
            List<Integer> sites = calls(m, hook, 1);
            boolean handed = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                int at = sites.get(0);
                int scratch = at >= 1 ? firstRegister(body.get(at - 1)) : -1;
                handed = at == pad + 1 && at + 1 < body.size()
                        && body.get(at - 1).getOpcode() == Opcode.IGET_OBJECT
                        && String.valueOf(reference(body.get(at - 1))).equals(avatar)
                        && ((TwoRegisterInstruction) body.get(at - 1)).getRegisterB() == view
                        && scratch != view && scratch >= 0 && scratch <= 15 && scratch < parameter(m, -1)
                        && arguments(body.get(at)).equals(List.of(scratch))
                        && padsCreatorRow(body, at + 1)
                        && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at);
                if (!handed) fail(hook + " doesn't take the creator row's avatar where every branch meets before its padding in " + m);
                else if (!unread(new FeatureFlow(collector), was, pad, scratch)) {
                    fail(hook + " borrows v" + scratch + " in " + m + ", which the collector still reads after the padding");
                    handed = false;
                }
                remove(m, at - 1, at + 1);
            }
            capability(c.callee, handed);
        }

        /**
         * True when [at] starts the creator row's padding: its outer layout and top padding read from
         * the same register, a zero, then setPaddingRelative on the layout with that top and the zero
         * as its bottom. 14.45.0 works out the start and end sizes earlier.
         */
        static boolean padsCreatorRow(List<Instruction> body, int at) {
            if (at < 0 || at + 3 >= body.size()) return false;
            Instruction layout = body.get(at), top = body.get(at + 1), zero = body.get(at + 2), pad = body.get(at + 3);
            if (layout.getOpcode() != Opcode.IGET_OBJECT || top.getOpcode() != Opcode.IGET) return false;
            if (!(reference(layout) instanceof FieldReference outer) || !(reference(top) instanceof FieldReference topSize)) return false;
            if (!outer.getDefiningClass().equals(CREATOR_ATTRIBUTION) || !topSize.getDefiningClass().equals(CREATOR_ATTRIBUTION)
                    || !outer.getType().equals("Landroid/widget/LinearLayout;") || !topSize.getType().equals("I")) return false;
            if (((TwoRegisterInstruction) layout).getRegisterB() != ((TwoRegisterInstruction) top).getRegisterB()) return false;
            if (zero.getOpcode() != Opcode.CONST_4 || ((NarrowLiteralInstruction) zero).getNarrowLiteral() != 0) return false;
            if (pad.getOpcode() != Opcode.INVOKE_VIRTUAL || !String.valueOf(reference(pad)).equals("Landroid/view/View;->setPaddingRelative(IIII)V")) return false;
            List<Integer> padding = arguments(pad);
            return padding.size() == 5 && padding.get(0) == firstRegister(layout) && padding.get(2) == firstRegister(top)
                    && padding.get(4) == firstRegister(zero);
        }

        /**
         * Custom save sound (#41): every MediaPlayer.create on a raw resource whose id the instruction
         * right before it reads from the save chime's R field goes to the hook, on the same registers
         * and in the same spot, so the move-result after it still takes the player. Every other sound
         * stays Pinterest's call, and the hook falls back to that call when its switch is off.
         */
        void saveSound(Contract c) {
            String hook = c.strings.get(0);
            int total = 0;
            for (ClassDef cd : clean.classes.values()) for (Method method : cd.getMethods()) {
                if (method.getImplementation() == null) continue;
                List<Instruction> was = instructions(method);
                List<Integer> raw = callSites(was, MEDIA_PLAYER_CREATE);
                List<Integer> chimes = new ArrayList<>();
                for (int at : raw) if (makesSaveChime(was, at)) chimes.add(at);
                if (chimes.isEmpty()) continue;
                total += chimes.size();
                Method m = actual(method);
                List<Integer> hooked = calls(m, hook, chimes.size());
                if (m == null) continue;
                List<Instruction> body = instructions(m);
                if (callSites(body, MEDIA_PLAYER_CREATE).size() != raw.size() - chimes.size())
                    fail(hook + " left the save chime's player, or took another sound's, in " + m);
                for (int n = 0; n < Math.min(hooked.size(), chimes.size()); n++) {
                    Instruction old = was.get(chimes.get(n));
                    if (!arguments(body.get(hooked.get(n))).equals(arguments(old))) fail(hook + " changed its argument registers in " + m);
                    edits.computeIfAbsent(m.toString(), k -> new FeatureEdits()).replacements.put(hooked.get(n), old);
                }
            }
            if (total > 0) {
                Method stand = actual(hook);
                if (stand != null) fallback(stand, MEDIA_PLAYER_CREATE);
            }
            capability(c.callee, total > 0);
        }

        /** True when the call at [at] makes a player on two registers from the save chime's R field read just before it. */
        static boolean makesSaveChime(List<Instruction> body, int at) {
            if (at < 1 || body.get(at).getOpcode() != Opcode.INVOKE_STATIC || arguments(body.get(at)).size() != 2) return false;
            Instruction read = body.get(at - 1);
            return read.getOpcode() == Opcode.SGET && reference(read) instanceof FieldReference f
                    && f.getName().equals("success_2") && f.getType().equals("I")
                    && firstRegister(read) == arguments(body.get(at)).get(1);
        }

        /**
         * Expand board list (#33): the Save to sheet's height, the one class it builds whose toString
         * starts with the height's state text, asks the hook for its percentage right in front of the
         * getter's only return, and the answer goes back where the percentage was.
         */
        static final String DEFAULT_BOARD_SORT = "alphabetical", BOARD_PICKER_FIELDS = "BOARD_PICKER_FRAGMENT",
                BOARD_SORT_UTILS = "BoardSortUtils: myUser is null, Fail to update board sort option",
                BOARD_SORT_BY_KEY = "getOptionByApiKey";

        /**
         * The board picker's request for all your boards in [m]: the first call after the picker's
         * fields are named that takes four strings, its sort (filter, sort, fields, page size) in the
         * register DEFAULT_BOARD_SORT went into. -1 when [m] has none, like the board section picker,
         * which sets its sort as a query value.
         */
        static int boardRequestCall(Method m) {
            List<Instruction> body = instructions(m);
            int fields = -1;
            for (int at = 0; at < body.size() && fields < 0; at++)
                if (reference(body.get(at)) instanceof FieldReference f && f.getName().equals(BOARD_PICKER_FIELDS)) fields = at;
            if (fields < 0) return -1;
            for (int at = fields; at < body.size(); at++) {
                Instruction i = body.get(at);
                if (!i.getOpcode().name().startsWith("INVOKE") || !(reference(i) instanceof MethodReference called)
                        || !descriptor(called).startsWith("(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)")) continue;
                List<Integer> passed = arguments(i);
                int sort = passed.size() > (i.getOpcode().name().startsWith("INVOKE_STATIC") ? 1 : 2)
                        ? passed.get(i.getOpcode().name().startsWith("INVOKE_STATIC") ? 1 : 2) : -1;
                for (int k = 0; k < at; k++) {
                    Instruction load = body.get(k);
                    if (load.getOpcode() == Opcode.CONST_STRING && firstRegister(load) == sort
                            && reference(load) instanceof StringReference s && s.getString().equals(DEFAULT_BOARD_SORT)) return at;
                }
                return -1;
            }
            return -1;
        }

        /**
         * Board order when saving (#48). The board picker's request for all your boards hands its
         * sort to the extension right in front of the call and gets the answer back in the same
         * register. The signed-in user's getter hands the extension the user's board order key in
         * front of each return, and skips that when there's no user.
         */
        void boardOrder(Contract c) {
            String pickerHook = c.strings.get(0), profileHook = c.strings.get(1);
            List<Method> requests = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                if (clean.texts.getOrDefault(m.toString(), Set.of()).contains(DEFAULT_BOARD_SORT)
                        && fieldNames(m).contains(BOARD_PICKER_FIELDS) && boardRequestCall(m) >= 0) requests.add(m);
            }
            Method request = unique(requests, "Board picker request for your boards");
            Method m = actual(request);
            List<Integer> sites = calls(m, pickerHook, 1);
            boolean asked = false;
            if (request != null && m != null && sites.size() == 1) {
                List<Instruction> before = instructions(request), body = instructions(m);
                Instruction stock = before.get(boardRequestCall(request));
                int at = sites.get(0);
                List<Integer> passed = arguments(body.get(at));
                int sort = passed.size() == 1 ? passed.get(0) : -1;
                Instruction call = at + 2 < body.size() ? body.get(at + 2) : null;
                asked = sort >= 0 && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == sort
                        && call != null && call.getOpcode() == stock.getOpcode()
                        && String.valueOf(reference(call)).equals(String.valueOf(reference(stock)))
                        && arguments(call).equals(arguments(stock)) && arguments(stock).contains(sort)
                        && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                if (asked) remove(m, at, at + 2);
                else fail(pickerHook + " doesn't take the board picker's sort right in front of its request in " + m);
            }

            List<Method> readers = new ArrayList<>();
            Set<String> owners = new TreeSet<>();
            for (Method r : clean.methods.values())
                if (!r.getDefiningClass().startsWith(OWN) && clean.texts.getOrDefault(r.toString(), Set.of()).contains(BOARD_SORT_UTILS))
                    owners.add(r.getDefiningClass());
            for (Method r : clean.methods.values()) {
                if (!owners.contains(r.getDefiningClass()) || r.getImplementation() == null) continue;
                for (Instruction i : instructions(r))
                    if (reference(i) instanceof MethodReference called && called.getName().equals(BOARD_SORT_BY_KEY)) { readers.add(r); break; }
            }
            Method reader = unique(readers, "Profile board order reader");
            MethodReference sortKey = null, user = null;
            if (reader != null) {
                List<Instruction> body = instructions(reader);
                int byKey = -1;
                for (int at = 0; at < body.size() && byKey < 0; at++)
                    if (reference(body.get(at)) instanceof MethodReference called && called.getName().equals(BOARD_SORT_BY_KEY)) byKey = at;
                if (byKey >= 2 && reference(body.get(byKey - 2)) instanceof MethodReference key && key.getParameterTypes().isEmpty()
                        && key.getReturnType().equals("Ljava/lang/String;")) sortKey = key;
                for (int at = 0; sortKey != null && user == null && at < byKey; at++)
                    if (reference(body.get(at)) instanceof MethodReference got && got.getParameterTypes().isEmpty()
                            && got.getReturnType().equals(sortKey.getDefiningClass())) user = got;
            }
            Method getter = user == null ? null : clean.methods.get(user.toString());
            if (reader != null && getter == null) fail("the signed-in user's getter the profile's board order reads isn't in the clean APK");
            Method g = actual(getter);
            int returns = 0;
            if (getter != null) for (Instruction i : instructions(getter)) if (i.getOpcode() == Opcode.RETURN_OBJECT) returns++;
            List<Integer> tells = calls(g, profileHook, returns);
            boolean told = g != null && returns > 0 && tells.size() == returns;
            if (told) {
                List<Instruction> body = instructions(g);
                Layout layout = new Layout(g.getImplementation());
                for (int site : tells) {
                    int at = site - 3;
                    boolean placed = at >= 0 && site + 1 < body.size() && body.get(at).getOpcode() == Opcode.IF_EQZ
                            && body.get(site + 1).getOpcode() == Opcode.RETURN_OBJECT;
                    if (placed) {
                        int answer = firstRegister(body.get(site + 1));
                        placed = firstRegister(body.get(at)) == answer
                                && layout.addresses.get(at) + ((OffsetInstruction) body.get(at)).getCodeOffset() == layout.addresses.get(site + 1)
                                && String.valueOf(reference(body.get(at + 1))).equals(String.valueOf(sortKey))
                                && arguments(body.get(at + 1)).equals(List.of(answer))
                                && body.get(at + 2).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                                && arguments(body.get(site)).equals(List.of(firstRegister(body.get(at + 2))))
                                && firstRegister(body.get(at + 2)) != answer;
                    }
                    if (placed) remove(g, at, site + 1);
                    else { told = false; fail(profileHook + " isn't told the user's board order key in front of a return in " + g); }
                }
            }
            capability(c.callee, asked && told);
        }

        static final String ORGANIC_CLOSEUP = "Lcom/pinterest/feature/pin/closeup/presenter/OrganicPinCloseupPresenter;",
                PROMOTED_CLOSEUP = "Lcom/pinterest/feature/pin/closeup/presenter/PromotedPinCloseupPresenter;",
                UNBIND_RESET = "onUnbind$lambda$0",
                VIDEO_MODULE = "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;",
                LOAD_SAVED_MUTE_STATE = "loadSavedMuteState",
                ROUNDED_CORNERS_LAYOUT = "Lcom/pinterest/design/widget/RoundedCornersLayout;",
                PINCH_CONTEXT = "Lcom/pinterest/feature/search/visual/PinchToZoomTransitionContext;",
                PINCH_HANDLER = "onHandleTransitionFromPinchToZoom", PINCH_SOURCE = "p2z";

        /** The saved video state getter the organic pin page's unbind reads its pin's state with, right before its one reset. */
        MethodReference videoStateGetter() {
            Method unbind = clean.methods.get(ORGANIC_CLOSEUP + "->onUnbind()V");
            if (unbind == null || unbind.getImplementation() == null) return null;
            List<Instruction> body = instructions(unbind);
            MethodReference found = null;
            int resets = 0;
            for (int at = 2; at < body.size(); at++) {
                if (body.get(at).getOpcode() != Opcode.INVOKE_STATIC || !(reference(body.get(at)) instanceof MethodReference reset)
                        || !reset.getDefiningClass().equals(ORGANIC_CLOSEUP) || !reset.getName().equals(UNBIND_RESET)) continue;
                resets++;
                if (body.get(at - 2).getOpcode() == Opcode.INVOKE_STATIC && reference(body.get(at - 2)) instanceof MethodReference got
                        && descriptor(got).startsWith("(Ljava/lang/String;)") && descriptor(reset).equals("(" + got.getReturnType() + ")Lkotlin/Unit;"))
                    found = got;
            }
            return resets == 1 ? found : null;
        }

        /** The return of the fresh state [m] builds when the saved one it cast to [state] is null, in one straight run. -1 when there's none. */
        int freshReturn(Method m, String state) {
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            int cast = -1, casts = 0;
            for (int at = 0; at < body.size(); at++)
                if (body.get(at).getOpcode() == Opcode.CHECK_CAST && reference(body.get(at)) instanceof TypeReference t && t.getType().equals(state)) {
                    cast = at;
                    casts++;
                }
            if (casts != 1 || cast + 1 >= body.size() || body.get(cast + 1).getOpcode() != Opcode.IF_EQZ
                    || firstRegister(body.get(cast + 1)) != firstRegister(body.get(cast))) return -1;
            int start = branchTarget(layout, cast + 1);
            if (start < 0) return -1;
            FeatureFlow graph = new FeatureFlow(m);
            for (int at = start; at < body.size(); at++) {
                if (at > start && !onlyFrom(graph, at, at - 1)) return -1;
                if (body.get(at).getOpcode() == Opcode.RETURN_OBJECT) return at;
                if (body.get(at) instanceof OffsetInstruction || body.get(at).getOpcode() == Opcode.THROW) return -1;
            }
            return -1;
        }

        /**
         * The index of the play in [m] when [m] is the idea pin page's start of its video: no
         * parameters, it reads and clears another class's pending flag, seeks the video to a time
         * and plays it. -1 otherwise.
         */
        int ideaPinPlay(Method m) {
            if (m.getImplementation() == null || !m.getParameterTypes().isEmpty() || !m.getReturnType().equals("V")) return -1;
            List<Instruction> body = instructions(m);
            int play = -1, plays = 0;
            for (int at = 0; at < body.size(); at++)
                if (body.get(at).getOpcode() == Opcode.INVOKE_INTERFACE && reference(body.get(at)) instanceof MethodReference r
                        && r.getName().equals("play") && descriptor(r).equals("()V")) {
                    play = at;
                    plays++;
                }
            if (plays != 1 || play < 1 || play + 1 >= body.size()) return -1;
            MethodReference played = (MethodReference) reference(body.get(play));
            if (body.get(play - 1).getOpcode() != Opcode.INVOKE_INTERFACE || !(reference(body.get(play - 1)) instanceof MethodReference seek)
                    || !seek.getDefiningClass().equals(played.getDefiningClass()) || !descriptor(seek).equals("(JZ)V")
                    || arguments(body.get(play)).size() != 1 || arguments(body.get(play - 1)).isEmpty()
                    || !arguments(body.get(play - 1)).get(0).equals(arguments(body.get(play)).get(0))) return -1;
            Set<String> read = new HashSet<>(), cleared = new HashSet<>();
            for (int at = 0; at < play; at++) {
                if (!(reference(body.get(at)) instanceof FieldReference f) || f.getDefiningClass().equals(m.getDefiningClass())) continue;
                if (body.get(at).getOpcode() == Opcode.IGET_BOOLEAN) read.add(f.toString());
                if (body.get(at).getOpcode() == Opcode.IPUT_BOOLEAN) cleared.add(f.toString());
            }
            read.retainAll(cleared);
            return read.isEmpty() ? -1 : play;
        }

        /**
         * Pin video playback (#48), Don't autoplay pin videos. The saved video state getter asks the
         * hook right in front of returning the fresh state it builds for a video with nothing saved,
         * and stores the answer in that state's paused flag. Each pin page's unbind reset stores the
         * hook's answer in place of its false. The idea pin page's start asks right in front of its
         * play and skips only the play on yes.
         */
        void pinVideoAutoplay(Contract c) {
            String hook = c.strings.get(0);
            MethodReference getter = videoStateGetter();
            if (getter == null) fail("the organic pin page's unbind no longer reads its video's saved state right before its reset");
            String state = getter == null ? null : getter.getReturnType();
            boolean ok = getter != null;
            String paused = null;
            for (String type : List.of(ORGANIC_CLOSEUP, PROMOTED_CLOSEUP)) {
                Method reset = state == null ? null : clean.methods.get(type + "->" + UNBIND_RESET + "(" + state + ")Lkotlin/Unit;");
                if (reset == null || reset.getImplementation() == null) {
                    if (state != null) fail(type + " has no reset of its video's saved state");
                    ok = false;
                    continue;
                }
                List<Instruction> before = instructions(reset);
                int store = -1, stores = 0;
                for (int at = 0; at < before.size(); at++) if (before.get(at).getOpcode() == Opcode.IPUT_BOOLEAN) { store = at; stores++; }
                if (stores != 1 || store < 1 || before.get(store - 1).getOpcode() != Opcode.CONST_4
                        || ((NarrowLiteralInstruction) before.get(store - 1)).getNarrowLiteral() != 0
                        || firstRegister(before.get(store - 1)) != firstRegister(before.get(store))) {
                    fail(type + "'s reset no longer stores a false in its video's saved state");
                    ok = false;
                    continue;
                }
                String flag = String.valueOf(reference(before.get(store)));
                if (paused == null) paused = flag;
                else if (!paused.equals(flag)) { fail("the two pin pages reset different flags"); ok = false; }
                Method m = actual(reset);
                List<Integer> sites = calls(m, hook, 1);
                if (m == null || sites.size() != 1) { ok = false; continue; }
                List<Instruction> body = instructions(m);
                int at = sites.get(0), register = firstRegister(before.get(store - 1));
                boolean placed = at == store && at + 2 < body.size() && arguments(body.get(at)).isEmpty()
                        && body.get(at - 1).getOpcode() == Opcode.CONST_4
                        && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && firstRegister(body.get(at + 1)) == register
                        && body.get(at + 2).getOpcode() == Opcode.IPUT_BOOLEAN && firstRegister(body.get(at + 2)) == register
                        && String.valueOf(reference(body.get(at + 2))).equals(flag)
                        && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                if (placed) remove(m, at, at + 2);
                else { fail(hook + " doesn't hand its answer to the flag " + m + " clears"); ok = false; }
            }

            Method stock = getter == null ? null : clean.methods.get(getter.toString());
            if (getter != null && (stock == null || stock.getImplementation() == null)) { fail("the video state getter " + getter + " isn't in the clean APK"); ok = false; }
            int fresh = stock == null || stock.getImplementation() == null ? -1 : freshReturn(stock, state);
            if (stock != null && stock.getImplementation() != null && fresh < 0) {
                fail("the video state getter's fresh state isn't built and returned in one straight run");
                ok = false;
            }
            Method g = fresh < 0 ? null : actual(stock);
            List<Integer> asked = calls(g, hook, 1);
            if (g != null && asked.size() == 1 && paused != null) {
                List<Instruction> body = instructions(g);
                int at = asked.get(0), returned = firstRegister(instructions(stock).get(fresh));
                boolean placed = at == fresh && at + 3 < body.size() && arguments(body.get(at)).isEmpty()
                        && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && firstRegister(body.get(at + 1)) != returned
                        && body.get(at + 2).getOpcode() == Opcode.IPUT_BOOLEAN && firstRegister(body.get(at + 2)) == firstRegister(body.get(at + 1))
                        && ((TwoRegisterInstruction) body.get(at + 2)).getRegisterB() == returned
                        && String.valueOf(reference(body.get(at + 2))).equals(paused)
                        && body.get(at + 3).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(at + 3)) == returned
                        && onlyFrom(g, at + 1, at) && onlyFrom(g, at + 2, at + 1) && onlyFrom(g, at + 3, at + 2);
                if (placed) remove(g, at, at + 3);
                else { fail(hook + " doesn't set the paused flag of the fresh state " + g + " returns"); ok = false; }
            } else ok = false;

            List<Method> starts = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (!ROUNDED_CORNERS_LAYOUT.equals(cd.getSuperclass())) continue;
                for (Method m : cd.getMethods()) if (ideaPinPlay(m) >= 0) starts.add(m);
            }
            Method start = unique(starts, "The idea pin page's start of its video");
            Method s = actual(start);
            List<Integer> skipped = calls(s, hook, 1);
            if (start != null && s != null && skipped.size() == 1) {
                int play = ideaPinPlay(start);
                List<Instruction> before = instructions(start), body = instructions(s);
                Layout layout = new Layout(s.getImplementation());
                int at = skipped.get(0);
                boolean placed = at == play && at + 4 < body.size() && arguments(body.get(at)).isEmpty()
                        && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT
                        && body.get(at + 2).getOpcode() == Opcode.IF_NEZ && firstRegister(body.get(at + 2)) == firstRegister(body.get(at + 1))
                        && branchTarget(layout, at + 2) == at + 4
                        && body.get(at + 3).getOpcode() == before.get(play).getOpcode()
                        && String.valueOf(reference(body.get(at + 3))).equals(String.valueOf(reference(before.get(play))))
                        && arguments(body.get(at + 3)).equals(arguments(before.get(play)))
                        && !arguments(before.get(play)).contains(firstRegister(body.get(at + 1)))
                        && onlyFrom(s, at + 1, at) && onlyFrom(s, at + 2, at + 1) && onlyFrom(s, at + 3, at + 2);
                if (placed) remove(s, at, at + 3);
                else { fail(hook + " doesn't guard only the play in " + s); ok = false; }
            } else ok = false;
            capability(c.callee, ok);
        }

        /** A method with no parameters that starts by reading [flag] and stores it twice or more: the idea pin page's sound setter. */
        boolean setsSound(Method m, String flag) {
            if (m.getImplementation() == null || !m.getParameterTypes().isEmpty() || !m.getReturnType().equals("V")) return false;
            List<Instruction> body = instructions(m);
            if (body.isEmpty() || body.get(0).getOpcode() != Opcode.SGET_BOOLEAN || !String.valueOf(reference(body.get(0))).equals(flag)) return false;
            int stores = 0;
            for (Instruction i : body) if (i.getOpcode() == Opcode.SPUT_BOOLEAN && String.valueOf(reference(i)).equals(flag)) stores++;
            return stores >= 2;
        }

        /**
         * Pin video playback (#48), Start pin videos muted. Each pin page asks the hook first thing
         * where it takes its sound from Pinterest's app-wide sound flag, and on yes stores the answer
         * in the flag: the regular video pin page's loadSavedMuteState, which starts by reading the
         * flag, and the idea pin presenter's start, the one method with no parameters outside the
         * idea pin page that calls the page's sound setter. Pinterest's first instruction follows.
         */
        void pinVideoSound(Contract c) {
            String hook = c.strings.get(0);
            MethodReference getter = videoStateGetter();
            Method video = clean.methods.get(VIDEO_MODULE + "->" + LOAD_SAVED_MUTE_STATE + "()V");
            List<Instruction> start = video == null || video.getImplementation() == null ? List.of() : instructions(video);
            String flag = null;
            if (getter != null && !start.isEmpty() && start.get(0).getOpcode() == Opcode.SGET_BOOLEAN
                    && reference(start.get(0)) instanceof FieldReference f && f.getType().equals("Z")
                    && f.getDefiningClass().equals(getter.getDefiningClass())) flag = f.toString();
            if (flag == null) {
                fail("the video pin page's " + LOAD_SAVED_MUTE_STATE + " no longer starts by reading Pinterest's sound flag");
                capability(c.callee, false);
                return;
            }
            List<Method> setters = new ArrayList<>();
            for (Method m : clean.methods.values()) if (!m.getDefiningClass().startsWith(OWN) && setsSound(m, flag)) setters.add(m);
            Method setter = unique(setters, "The idea pin page's sound setter");
            List<Method> starts = new ArrayList<>();
            if (setter != null)
                for (Method m : clean.methods.values())
                    if (!m.getDefiningClass().startsWith(OWN) && !m.getDefiningClass().equals(setter.getDefiningClass())
                            && m.getImplementation() != null && m.getParameterTypes().isEmpty() && m.getReturnType().equals("V")
                            && !callSites(instructions(m), setter.toString()).isEmpty()) starts.add(m);
            Method idea = setter == null ? null : unique(starts, "The idea pin presenter's start");
            boolean placed = setter != null && idea != null;
            for (Method page : Arrays.asList(video, idea)) {
                if (page == null) continue;
                Method m = actual(page);
                List<Integer> sites = calls(m, hook, 1);
                boolean here = false;
                if (m != null && sites.size() == 1) {
                    List<Instruction> before = instructions(page), body = instructions(m);
                    Layout layout = new Layout(m.getImplementation());
                    int answer = body.size() > 1 ? firstRegister(body.get(1)) : -1;
                    here = sites.get(0) == 0 && body.size() > 4 && arguments(body.get(0)).isEmpty()
                            && body.get(1).getOpcode() == Opcode.MOVE_RESULT
                            && body.get(2).getOpcode() == Opcode.IF_EQZ && firstRegister(body.get(2)) == answer && branchTarget(layout, 2) == 4
                            && body.get(3).getOpcode() == Opcode.SPUT_BOOLEAN && firstRegister(body.get(3)) == answer
                            && String.valueOf(reference(body.get(3))).equals(flag)
                            && body.get(4).getOpcode() == before.get(0).getOpcode()
                            && firstRegister(body.get(4)) == firstRegister(before.get(0))
                            && String.valueOf(reference(body.get(4))).equals(String.valueOf(reference(before.get(0))))
                            && onlyFrom(m, 1, 0) && onlyFrom(m, 2, 1) && onlyFrom(m, 3, 2);
                    if (here) remove(m, 0, 4);
                }
                if (m != null && !here) fail(hook + " doesn't set Pinterest's sound flag first thing in " + m);
                placed &= here;
            }
            capability(c.callee, placed);
        }

        /**
         * Pinch to zoom only (#48). The organic pin page's pinch handler starts by reading its
         * context's source and comparing it with the pinch's, then hands the hook its pin and returns
         * on yes. Anything but a pinch, and no, go on to Pinterest's own handler.
         */
        void pinchZoom(Contract c) {
            String hook = c.strings.get(0);
            Method handler = clean.methods.get(ORGANIC_CLOSEUP + "->" + PINCH_HANDLER + "(" + PINCH_CONTEXT + ")V");
            if (handler == null || handler.getImplementation() == null) {
                fail("the pin page's pinch handler isn't in the clean APK");
                capability(c.callee, false);
                return;
            }
            Set<String> sources = new TreeSet<>();
            for (Instruction i : instructions(handler)) {
                if (!(reference(i) instanceof FieldReference f) || !f.getDefiningClass().equals(PINCH_CONTEXT)) continue;
                ClassDef type = clean.classes.get(f.getType());
                if (type != null) for (Field field : type.getFields())
                    if (field.getName().equals(PINCH_SOURCE) && field.getType().equals(f.getType()) && AccessFlags.STATIC.isSet(field.getAccessFlags()))
                        sources.add(f.toString());
            }
            if (sources.size() != 1) {
                fail("the pinch handler reads " + sources.size() + " pinch sources, expected 1");
                capability(c.callee, false);
                return;
            }
            String source = sources.iterator().next();
            String sourceType = source.substring(source.lastIndexOf(':') + 1);
            Method m = actual(handler);
            List<Instruction> body = m == null ? List.of() : instructions(m);
            List<Integer> sites = callSites(body, hook);
            boolean placed = false;
            int value = body.isEmpty() ? -1 : firstRegister(body.get(0));
            if (m != null && sites.size() == 1 && sites.get(0) == 6 && body.size() > 10) {
                Layout layout = new Layout(m.getImplementation());
                int self = parameter(m, -1), context = parameter(m, 0), pinch = firstRegister(body.get(2));
                placed = body.get(0).getOpcode() == Opcode.MOVE_OBJECT_FROM16 && ((TwoRegisterInstruction) body.get(0)).getRegisterB() == context
                        && body.get(1).getOpcode() == Opcode.IGET_OBJECT && firstRegister(body.get(1)) == value
                        && ((TwoRegisterInstruction) body.get(1)).getRegisterB() == value && String.valueOf(reference(body.get(1))).equals(source)
                        && body.get(2).getOpcode() == Opcode.SGET_OBJECT && pinch != value
                        && String.valueOf(reference(body.get(2))).equals(sourceType + "->" + PINCH_SOURCE + ":" + sourceType)
                        && body.get(3).getOpcode() == Opcode.IF_NE && firstRegister(body.get(3)) == value
                        && ((TwoRegisterInstruction) body.get(3)).getRegisterB() == pinch && branchTarget(layout, 3) == 10
                        && body.get(4).getOpcode() == Opcode.MOVE_OBJECT_FROM16 && firstRegister(body.get(4)) == value
                        && ((TwoRegisterInstruction) body.get(4)).getRegisterB() == self
                        && body.get(5).getOpcode() == Opcode.IGET_OBJECT && firstRegister(body.get(5)) == value
                        && ((TwoRegisterInstruction) body.get(5)).getRegisterB() == value
                        && reference(body.get(5)) instanceof FieldReference pin && pin.getDefiningClass().equals(ORGANIC_CLOSEUP) && pin.getName().equals("pin");
            }
            if (m != null && !placed) fail(hook + " isn't handed the pin after a check for a pinch at the start of " + m);
            guard(m, hook, 0, List.of(value), 6, false, false);
            capability(c.callee, placed);
        }

        /** The API paths Like and comment history follows, as the patch names them. */
        static final String HISTORY_REACT_PATH = "pins/{pinUid}/react/",
                HISTORY_PIN_COMMENT_PATH = "aggregated_pin_data/{aggregatedPinDataId}/comment/",
                HISTORY_REPLY_PATH = "aggregated_comments/{aggregatedCommentId}/reply/",
                HISTORY_STRING = "Ljava/lang/String;";
        static final Set<String> HISTORY_COMMENT_PATHS =
                Set.of(HISTORY_PIN_COMMENT_PATH, "did_it/{didItId}/comments/", HISTORY_REPLY_PATH);

        /** The clean APK's reaction and comment API methods by signature, and the calls to each, once [indexHistory] ran. */
        Map<String, Method> historyEndpoints;
        Map<String, List<FeatureSite>> historyCalls;

        void indexHistory() {
            if (historyEndpoints != null) return;
            historyEndpoints = new LinkedHashMap<>();
            historyCalls = new LinkedHashMap<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN) || !AccessFlags.INTERFACE.isSet(cd.getAccessFlags())) continue;
                for (Method m : cd.getMethods()) if (historyPath(m) != null) historyEndpoints.put(m.toString(), m);
            }
            if (historyEndpoints.isEmpty()) return;
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                int at = 0;
                for (Instruction i : m.getImplementation().getInstructions()) {
                    if ((i.getOpcode() == Opcode.INVOKE_INTERFACE || i.getOpcode() == Opcode.INVOKE_INTERFACE_RANGE)
                            && reference(i) instanceof MethodReference called && historyEndpoints.containsKey(called.toString()))
                        historyCalls.computeIfAbsent(called.toString(), k -> new ArrayList<>()).add(new FeatureSite(m, at));
                    at++;
                }
            }
        }

        /** The reaction or comment path on an API method, or null. */
        static String historyPath(Method m) {
            for (var annotation : m.getAnnotations()) for (var element : annotation.getElements())
                if (element.getName().equals("value") && element.getValue() instanceof StringEncodedValue s
                        && (s.getValue().equals(HISTORY_REACT_PATH) || HISTORY_COMMENT_PATHS.contains(s.getValue()))) return s.getValue();
            return null;
        }

        /** The declared parameters of [m] whose request value is named [name], of [type] or any type when null. */
        static List<Integer> historyParameters(Method m, String name, String type) {
            List<Integer> found = new ArrayList<>();
            for (int k = 0; k < m.getParameters().size(); k++) {
                var p = m.getParameters().get(k);
                if (type != null && !p.getType().equals(type)) continue;
                boolean named = false;
                for (var annotation : p.getAnnotations()) for (var element : annotation.getElements())
                    if (element.getName().equals("value") && element.getValue() instanceof StringEncodedValue s && s.getValue().equals(name)) named = true;
                if (named) found.add(k);
            }
            return found;
        }

        /** The register [call] passes declared parameter [parameter] of [endpoint] in, or -1. */
        static int historyArgument(Method endpoint, Instruction call, int parameter) {
            int slot = 1;
            for (int k = 0; k < parameter; k++) slot += slots(endpoint.getParameterTypes().get(k));
            List<Integer> passed = arguments(call);
            return slot < passed.size() ? passed.get(slot) : -1;
        }

        /** The declared parameter [m] copies into a local and casts there among its first few instructions, or -1 unless exactly one. */
        int historyCastParameter(Method m) {
            List<Instruction> body = instructions(m);
            int found = -1;
            for (int k = 0; k < m.getParameterTypes().size(); k++) {
                int register = parameter(m, k);
                boolean cast = false;
                for (int at = 0; at < Math.min(4, body.size() - 1) && !cast; at++) {
                    Instruction copy = body.get(at), next = body.get(at + 1);
                    cast = (copy.getOpcode() == Opcode.MOVE_OBJECT || copy.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                            || copy.getOpcode() == Opcode.MOVE_OBJECT_16) && ((TwoRegisterInstruction) copy).getRegisterB() == register
                            && next.getOpcode() == Opcode.CHECK_CAST && firstRegister(next) == firstRegister(copy);
                }
                if (cast && found >= 0) return -1;
                if (cast) found = k;
            }
            return found;
        }

        /**
         * Like and comment history's likes (#48). In front of the one call that sends a reaction on
         * a pin, the pin model parameter goes into a free local and on to the extension with the
         * pin's id and the reaction type the call passes. In front of the one call that takes a
         * reaction back goes the pin's id it passes. A build without exactly one of each, or with
         * the pin or type out of a call's reach, gets neither.
         */
        void likeHistory(Contract c) {
            String sentHook = c.strings.get(0), removedHook = c.strings.get(1);
            indexHistory();
            List<Method> reacts = new ArrayList<>(), unreacts = new ArrayList<>();
            for (Method e : historyEndpoints.values()) {
                if (!HISTORY_REACT_PATH.equals(historyPath(e)) || historyParameters(e, "pinUid", HISTORY_STRING).size() != 1) continue;
                if (historyParameters(e, "reaction_type", "I").size() == 1) reacts.add(e);
                else if (historyParameters(e, "reaction_type", null).isEmpty()) unreacts.add(e);
            }
            Method react = reacts.size() == 1 ? reacts.get(0) : null, unreact = unreacts.size() == 1 ? unreacts.get(0) : null;
            List<FeatureSite> sent = react == null ? List.of() : historyCalls.getOrDefault(react.toString(), List.of());
            List<FeatureSite> taken = unreact == null ? List.of() : historyCalls.getOrDefault(unreact.toString(), List.of());
            if (sent.size() != 1 || taken.size() != 1) { capability(c.callee, false); return; }
            FeatureSite send = sent.get(0), take = taken.get(0);
            Instruction stock = instructions(send.method).get(send.at);
            int model = historyCastParameter(send.method);
            int pin = historyArgument(react, stock, historyParameters(react, "pinUid", HISTORY_STRING).get(0));
            int type = historyArgument(react, stock, historyParameters(react, "reaction_type", "I").get(0));
            if (model < 0 || pin < 0 || pin > 15 || type < 0 || type > 15) { capability(c.callee, false); return; }

            Method m = actual(send.method);
            List<Integer> hooks = calls(m, sentHook, 1);
            boolean liked = false;
            if (m != null && hooks.size() == 1) {
                List<Instruction> body = instructions(m);
                int at = hooks.get(0);
                List<Integer> passed = arguments(body.get(at));
                Instruction copy = at > 0 ? body.get(at - 1) : null;
                Instruction call = at + 1 < body.size() ? body.get(at + 1) : null;
                liked = passed.size() == 3 && copy != null && copy.getOpcode() == Opcode.MOVE_OBJECT_FROM16
                        && firstRegister(copy) == passed.get(0) && ((TwoRegisterInstruction) copy).getRegisterB() == parameter(m, model)
                        && passed.get(0) < parameter(m, -1) && !arguments(stock).contains(passed.get(0))
                        && passed.subList(1, 3).equals(List.of(pin, type))
                        && call != null && call.getOpcode() == stock.getOpcode()
                        && String.valueOf(reference(call)).equals(String.valueOf(reference(stock))) && arguments(call).equals(arguments(stock))
                        && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at);
                if (liked) remove(m, at - 1, at + 1);
                else fail(sentHook + " doesn't take the pin model, its id and the reaction type right in front of the reaction call in " + m);
            }

            Method u = actual(take.method);
            List<Integer> drops = calls(u, removedHook, 1);
            boolean unliked = false;
            if (u != null && drops.size() == 1) {
                List<Instruction> body = instructions(u);
                Instruction was = instructions(take.method).get(take.at);
                int at = drops.get(0);
                int dropped = historyArgument(unreact, was, historyParameters(unreact, "pinUid", HISTORY_STRING).get(0));
                Instruction call = at + 1 < body.size() ? body.get(at + 1) : null;
                unliked = dropped >= 0 && arguments(body.get(at)).equals(List.of(dropped)) && call != null
                        && call.getOpcode() == was.getOpcode() && String.valueOf(reference(call)).equals(String.valueOf(reference(was)))
                        && arguments(call).equals(arguments(was)) && onlyFrom(u, at + 1, at);
                if (unliked) remove(u, at, at + 1);
                else fail(removedHook + " doesn't take the pin's id right in front of the call that takes a reaction back in " + u);
            }
            capability(c.callee, liked && unliked);
        }

        /**
         * Like and comment history's comments (#48). In front of every call that posts a comment on
         * a pin or a "did it" photo goes the comment hook, and in front of every reply the reply
         * hook, each with the pin's id and the text the call passes. A build that posts no comment on
         * a pin, or passes one out of a call's reach, gets none.
         */
        void commentHistory(Contract c) {
            String commentHook = c.strings.get(0), replyHook = c.strings.get(1);
            indexHistory();
            Map<String, List<FeatureSite>> byMethod = new LinkedHashMap<>();
            Map<FeatureSite, Method> endpointOf = new HashMap<>();
            boolean onPin = false;
            for (Method e : historyEndpoints.values()) {
                String path = historyPath(e);
                if (path == null || !HISTORY_COMMENT_PATHS.contains(path) || historyParameters(e, "pin", HISTORY_STRING).size() != 1
                        || historyParameters(e, "text", HISTORY_STRING).size() != 1) continue;
                for (FeatureSite site : historyCalls.getOrDefault(e.toString(), List.of())) {
                    Instruction stock = instructions(site.method).get(site.at);
                    int pin = historyArgument(e, stock, historyParameters(e, "pin", HISTORY_STRING).get(0));
                    int text = historyArgument(e, stock, historyParameters(e, "text", HISTORY_STRING).get(0));
                    if (pin < 0 || text < 0 || (pin > 15 || text > 15) && text != pin + 1) { capability(c.callee, false); return; }
                    byMethod.computeIfAbsent(site.method.toString(), k -> new ArrayList<>()).add(site);
                    endpointOf.put(site, e);
                    onPin |= path.equals(HISTORY_PIN_COMMENT_PATH);
                }
            }
            if (!onPin) { capability(c.callee, false); return; }
            boolean posted = true;
            for (List<FeatureSite> sites : byMethod.values()) {
                sites.sort((a, b) -> Integer.compare(a.at, b.at));
                Method was = sites.get(0).method;
                Method m = actual(was);
                int comments = 0, replies = 0;
                for (FeatureSite site : sites) {
                    if (HISTORY_REPLY_PATH.equals(historyPath(endpointOf.get(site)))) replies++;
                    else comments++;
                }
                List<Integer> commentCalls = calls(m, commentHook, comments);
                List<Integer> replyCalls = calls(m, replyHook, replies);
                if (m == null || commentCalls.size() != comments || replyCalls.size() != replies) { posted = false; continue; }
                List<Integer> hooks = new ArrayList<>(commentCalls);
                hooks.addAll(replyCalls);
                hooks.sort(null);
                List<Instruction> before = instructions(was), body = instructions(m);
                for (int k = 0; k < sites.size(); k++) {
                    FeatureSite site = sites.get(k);
                    Method e = endpointOf.get(site);
                    Instruction stock = before.get(site.at);
                    int at = hooks.get(k);
                    String hook = HISTORY_REPLY_PATH.equals(historyPath(e)) ? replyHook : commentHook;
                    List<Integer> want = List.of(historyArgument(e, stock, historyParameters(e, "pin", HISTORY_STRING).get(0)),
                            historyArgument(e, stock, historyParameters(e, "text", HISTORY_STRING).get(0)));
                    Instruction call = at + 1 < body.size() ? body.get(at + 1) : null;
                    boolean placed = String.valueOf(reference(body.get(at))).equals(hook) && arguments(body.get(at)).equals(want)
                            && call != null && call.getOpcode() == stock.getOpcode()
                            && String.valueOf(reference(call)).equals(String.valueOf(reference(stock)))
                            && arguments(call).equals(arguments(stock)) && onlyFrom(m, at + 1, at);
                    if (placed) remove(m, at, at + 1);
                    else {
                        posted = false;
                        fail(hook + " doesn't take the pin's id and the text right in front of the comment call at " + site.at + " in " + m);
                    }
                }
            }
            capability(c.callee, posted);
        }

        void boardListHeight(Contract c) {
            String hook = c.strings.get(0);
            ClassDef picker = boardPicker();
            if (picker == null) { capability(c.callee, false); return; }
            Set<String> built = new TreeSet<>();
            for (Method m : picker.getMethods()) for (Instruction i : instructions(m))
                if (i.getOpcode() == Opcode.NEW_INSTANCE && reference(i) instanceof TypeReference t) built.add(t.getType());
            List<ClassDef> heights = new ArrayList<>();
            for (String type : built) {
                ClassDef cd = clean.classes.get(type);
                if (cd == null) continue;
                boolean height = false;
                for (Method m : cd.getMethods()) if (m.getName().equals("toString"))
                    for (String text : clean.texts.getOrDefault(m.toString(), Set.of())) height |= text.startsWith(SHEET_HEIGHT_STATE);
                if (height) heights.add(cd);
            }
            ClassDef height = uniqueClass(heights, "Save to sheet height");
            List<Method> getters = new ArrayList<>();
            if (height != null) for (Method m : height.getMethods())
                if (!m.getName().equals("hashCode") && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null
                        && descriptor(m).equals("()I")) getters.add(m);
            Method m = actual(height == null ? null : unique(getters, "Save to sheet height percentage"));
            List<Integer> sites = calls(m, hook, 1);
            boolean asked = false;
            if (m != null && sites.size() == 1) {
                List<Instruction> body = instructions(m);
                int at = sites.get(0);
                asked = at + 2 < body.size() && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && body.get(at + 2).getOpcode() == Opcode.RETURN
                        && body.stream().filter(i -> i.getOpcode() == Opcode.RETURN).count() == 1
                        && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at + 2))))
                        && firstRegister(body.get(at + 1)) == firstRegister(body.get(at + 2)) && onlyFrom(m, at + 2, at + 1);
                if (!asked) fail(hook + " doesn't take the percentage " + m + " answers, right in front of its only return");
                else remove(m, at, at + 2);
            }
            capability(c.callee, asked);
        }

        static boolean readsFlag(Instruction i, String flag) {
            return i.getOpcode() == Opcode.IGET_BOOLEAN && String.valueOf(reference(i)).equals(flag);
        }

        /** Adds each site where [id]'s button is found or built to [sites]. True when there's at least one. */
        boolean buttonSites(String id, String hook, List<ButtonSite> sites) {
            int before = sites.size();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                List<Instruction> body = instructions(m);
                List<Integer> reads = new ArrayList<>();
                for (int k = 0; k < body.size(); k++) if (readsId(body.get(k), id)) reads.add(k);
                if (reads.isEmpty()) continue;
                List<ButtonSite> found = new ArrayList<>();
                for (int k : reads) {
                    ButtonSite site = foundButton(m, body, k, hook);
                    if (site != null) found.add(site);
                }
                if (!found.isEmpty()) { sites.addAll(found); continue; }
                List<Integer> returns = new ArrayList<>();
                for (int k = 0; k < body.size(); k++) if (body.get(k).getOpcode() == Opcode.RETURN_OBJECT) returns.add(k);
                String type = m.getReturnType();
                if (returns.size() == 1 && clean.classes.containsKey(type) && frameworkView(type)) {
                    int at = returns.get(0), button = firstRegister(body.get(at));
                    if (tiedToId(body, reads, button)) { sites.add(new ButtonSite(m, at, button, type, false, hook)); continue; }
                }
                constructedButtons(m, body, reads, hook, sites);
            }
            return sites.size() > before;
        }

        /**
         * Built in place: one of the APK's own framework views constructed from an argument whose own
         * constructor took the id (the second closeup's lens in 14.40.0). The hook goes right after the
         * view's constructor and, like a found button's, is reached only from there.
         */
        void constructedButtons(Method m, List<Instruction> body, List<Integer> reads, String hook, List<ButtonSite> sites) {
            Set<Integer> ids = new HashSet<>(), holders = new HashSet<>();
            for (int k : reads) ids.add(firstRegister(body.get(k)));
            for (int k = reads.get(0) + 1; k < body.size(); k++) {
                Instruction call = body.get(k);
                if (!(call instanceof FiveRegisterInstruction || call instanceof RegisterRangeInstruction)
                        || !(reference(call) instanceof MethodReference method) || !method.getName().equals("<init>")) continue;
                List<Integer> registers = callRegisters(call);
                if (registers.isEmpty()) continue;
                List<Integer> passed = registers.subList(1, registers.size());
                if (passed.stream().anyMatch(ids::contains)) { holders.add(registers.get(0)); continue; }
                if (passed.stream().noneMatch(holders::contains)) continue;
                String type = method.getDefiningClass();
                if (clean.classes.containsKey(type) && frameworkView(type)) sites.add(new ButtonSite(m, k + 1, registers.get(0), type, true, hook));
            }
        }

        /** The view in [button] takes the id: setId with it, or a constructor argument whose own constructor took it. */
        static boolean tiedToId(List<Instruction> body, List<Integer> reads, int button) {
            Set<Integer> ids = new HashSet<>(), holders = new HashSet<>();
            for (int k : reads) ids.add(firstRegister(body.get(k)));
            // [reads] come in body order, so the first is the earliest.
            for (int k = reads.get(0) + 1; k < body.size(); k++) {
                Instruction call = body.get(k);
                if (!(call instanceof FiveRegisterInstruction || call instanceof RegisterRangeInstruction)
                        || !(reference(call) instanceof MethodReference method)) continue;
                List<Integer> registers = callRegisters(call);
                if (registers.isEmpty()) continue;
                List<Integer> passed = registers.subList(1, registers.size());
                boolean takesId = passed.stream().anyMatch(ids::contains);
                if (method.getName().equals("setId") && method.getParameterTypes().size() == 1
                        && method.getParameterTypes().get(0).toString().equals("I") && registers.get(0) == button && takesId) return true;
                if (!method.getName().equals("<init>")) continue;
                if (takesId) holders.add(registers.get(0));
                if (registers.get(0) == button && passed.stream().anyMatch(holders::contains)) return true;
            }
            return false;
        }

        static boolean readsId(Instruction i, String id) {
            return i.getOpcode() == Opcode.SGET && reference(i) instanceof FieldReference f && f.getName().equals(id) && f.getType().equals("I");
        }

        ButtonSite foundButton(Method m, List<Instruction> body, int read, String hook) {
            if (read + 2 >= body.size() || !(body.get(read + 1) instanceof FiveRegisterInstruction find)
                    || find.getOpcode() != Opcode.INVOKE_VIRTUAL || !FIND_VIEW.equals(String.valueOf(reference(find)))
                    || find.getRegisterCount() != 2 || find.getRegisterD() != firstRegister(body.get(read))
                    || body.get(read + 2).getOpcode() != Opcode.MOVE_RESULT_OBJECT) return null;
            int button = firstRegister(body.get(read + 2)), next = read + 3;
            if (next < body.size() && body.get(next) instanceof FiveRegisterInstruction check && check.getOpcode() == Opcode.INVOKE_VIRTUAL
                    && check.getRegisterCount() == 1 && check.getRegisterC() == button && GET_CLASS.equals(String.valueOf(reference(check)))) next++;
            int copy = button;
            if (next < body.size() && MOVE_OBJECTS.contains(body.get(next).getOpcode())
                    && ((TwoRegisterInstruction) body.get(next)).getRegisterB() == button) copy = firstRegister(body.get(next++));
            if (next >= body.size() || body.get(next).getOpcode() != Opcode.CHECK_CAST || firstRegister(body.get(next)) != copy) {
                fail(m + " finds the button without casting it to its class");
                return null;
            }
            return new ButtonSite(m, read + 3, button, String.valueOf(reference(body.get(next))), true, hook);
        }

        /** True when the first ancestor of [type] outside the clean target is one of Android's view classes. */
        boolean frameworkView(String type) {
            Set<String> seen = new HashSet<>();
            String at = type;
            while (clean.classes.containsKey(at) && seen.add(at)) at = clean.classes.get(at).getSuperclass();
            return at != null && !at.equals(type) && (at.startsWith("Landroid/view/") || at.startsWith("Landroid/widget/"));
        }

        static final String SURVEY_DECLINE = "SURVEY_IN_BROWSER_PROMPT_DECLINE_BUTTON", SURVEY_DECLINE_COUNTER = "%s_%s_%d_%d";
        static final String ALERT_DISMISS_REASON = "Lcom/pinterest/component/alert/AlertContainer$a;";
        static final String FUNCTION1 = "Lkotlin/jvm/functions/Function1;";
        static final String SPONSORED_POLL = "ANDROID_IN_APP_BRAND_SURVEY", POLL_VIEW = "Lcom/pinterest/expressSurvey/view/ExpressSurveyView;";

        /**
         * Each sponsored poll check in [m] as {arm start, branch target}: a sget-object of the
         * ANDROID_IN_APP_BRAND_SURVEY constant typed as its own class, a static two-argument check
         * answering a boolean that takes it second, the move-result and an if-eqz on that answer.
         */
        static List<int[]> sponsoredPollArms(Method m) {
            List<int[]> arms = new ArrayList<>();
            if (m.getImplementation() == null) return arms;
            Layout layout = new Layout(m.getImplementation());
            List<Instruction> body = layout.instructions;
            for (int k = 0; k + 3 < body.size(); k++) {
                Instruction read = body.get(k), check = body.get(k + 1), answer = body.get(k + 2), branch = body.get(k + 3);
                if (read.getOpcode() != Opcode.SGET_OBJECT || !(reference(read) instanceof FieldReference f)
                        || !f.getName().equals(SPONSORED_POLL) || !f.getType().equals(f.getDefiningClass())) continue;
                if (check.getOpcode() != Opcode.INVOKE_STATIC || !(reference(check) instanceof MethodReference callee)
                        || !callee.getReturnType().equals("Z") || callee.getParameterTypes().size() != 2
                        || !callee.getParameterTypes().get(1).toString().equals(f.getType())
                        || arguments(check).size() != 2 || arguments(check).get(1) != firstRegister(read)) continue;
                if (answer.getOpcode() != Opcode.MOVE_RESULT || branch.getOpcode() != Opcode.IF_EQZ
                        || firstRegister(branch) != firstRegister(answer)) continue;
                int target = layout.addresses.indexOf(layout.addresses.get(k + 3) + ((OffsetInstruction) branch).getCodeOffset());
                if (target > k + 4) arms.add(new int[]{k + 4, target});
            }
            return arms;
        }

        /** The survey invite launcher's shape, as the patch finds it: (String, Context, A, ScreenLocation, B, C, Bundle)V on an instance. */
        static boolean surveyLauncher(Method m) {
            if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V")) return false;
            List<String> t = m.getParameterTypes().stream().map(Object::toString).toList();
            return t.size() == 7 && t.get(0).equals("Ljava/lang/String;") && t.get(1).equals("Landroid/content/Context;")
                    && t.get(3).equals("Lcom/pinterest/framework/screens/ScreenLocation;") && t.get(6).equals("Landroid/os/Bundle;")
                    && List.of(2, 4, 5).stream().allMatch(k -> t.get(k).startsWith("L") && !t.get(k).startsWith("Ljava/") && !t.get(k).startsWith("Landroid/"));
        }

        /** An alert's dismiss notifier for [field]: an instance method taking only a dismiss reason that reads the field and invokes it. */
        static boolean alertNotifier(Method m, FieldReference field) {
            if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !m.getReturnType().equals("V")
                    || m.getParameterTypes().size() != 1 || !m.getParameterTypes().get(0).toString().equals(ALERT_DISMISS_REASON)) return false;
            boolean reads = false, invokes = false;
            for (Instruction i : instructions(m)) {
                if (i.getOpcode() == Opcode.IGET_OBJECT && String.valueOf(reference(i)).equals(field.toString())) reads = true;
                if (String.valueOf(reference(i)).equals(FUNCTION1 + "->invoke(Ljava/lang/Object;)Ljava/lang/Object;")) invokes = true;
            }
            return reads && invokes;
        }

        /**
         * Pinterest's "Got a minute?" survey invite. Its Maybe later handler is the one class whose
         * methods holding the "%s_%s_%d_%d" counter read SURVEY_IN_BROWSER_PROMPT_DECLINE_BUTTON, an
         * enum constant typed as its own class, and the one launcher with the patch's shape builds it.
         * The launcher's one store of a Function1 field whose class has exactly one notifier is the
         * alert's dismiss listener, built new right above the store, and its invoke reads
         * CONFIRM_BUTTON_CLICK. The hook goes right after the store, reached only from it: its answer
         * in a local the clean launcher doesn't read from there on, a branch to the original next
         * instruction, CANCEL_BUTTON_CLICK in the same local, the notifier with the alert and that
         * reason, then return-void. Found in the clean target, never from the hook.
         *
         * Advertiser sponsored polls: the one launcher caller with a sponsored poll check whose arm
         * builds a class that builds ExpressSurveyView, and whose skipped part still calls the
         * launcher. The second hook opens that arm, reached only from the check's if-eqz: its answer
         * in a local the clean caller doesn't read from there on, a branch to the arm's original
         * first instruction, then return-void.
         */
        void surveyPrompts(Contract c) {
            String hook = c.strings.get(0), pollHook = c.strings.get(1);
            Set<String> declines = new TreeSet<>();
            for (Method m : clean.holding(SURVEY_DECLINE_COUNTER)) for (Instruction i : instructions(m))
                if (reference(i) instanceof FieldReference f && f.getName().equals(SURVEY_DECLINE) && f.getType().equals(f.getDefiningClass()))
                    declines.add(m.getDefiningClass());
            if (declines.size() != 1) fail("the survey Maybe later handler has " + declines.size() + " clean classes, expected 1");
            List<Method> launchers = new ArrayList<>();
            for (Method m : clean.methods.values()) if (!m.getDefiningClass().startsWith(OWN) && surveyLauncher(m)) launchers.add(m);
            Method launcher = unique(launchers, "survey invite launcher");
            ClassDef reason = clean.classes.get(ALERT_DISMISS_REASON);
            boolean cancel = false;
            if (reason != null) for (Field f : reason.getFields()) if (f.getName().equals("CANCEL_BUTTON_CLICK")
                    && f.getType().equals(ALERT_DISMISS_REASON) && AccessFlags.STATIC.isSet(f.getAccessFlags())) cancel = true;
            if (!cancel) fail(ALERT_DISMISS_REASON + " has no CANCEL_BUTTON_CLICK in the clean target");
            boolean placed = false;
            if (launcher != null && declines.size() == 1 && cancel) {
                String decline = declines.iterator().next();
                List<Instruction> was = instructions(launcher);
                if (was.stream().noneMatch(i -> i.getOpcode() == Opcode.NEW_INSTANCE && String.valueOf(reference(i)).equals(decline)))
                    fail("the survey invite launcher " + launcher + " no longer builds the Maybe later handler " + decline);
                List<Integer> stores = new ArrayList<>();
                List<Method> notifiers = new ArrayList<>();
                for (int at = 0; at < was.size(); at++) {
                    if (was.get(at).getOpcode() != Opcode.IPUT_OBJECT || !(reference(was.get(at)) instanceof FieldReference f)
                            || !f.getType().equals(FUNCTION1) || clean.classes.get(f.getDefiningClass()) == null) continue;
                    List<Method> own = new ArrayList<>();
                    for (Method n : clean.classes.get(f.getDefiningClass()).getMethods()) if (alertNotifier(n, f)) own.add(n);
                    if (own.size() == 1) { stores.add(at); notifiers.add(own.get(0)); }
                }
                if (stores.size() != 1) fail("the survey alert's dismiss listener has " + stores.size() + " clean stores, expected 1");
                else {
                    int store = stores.get(0);
                    Method notifier = notifiers.get(0);
                    TwoRegisterInstruction put = (TwoRegisterInstruction) was.get(store);
                    Instruction built = store >= 2 ? was.get(store - 2) : null;
                    String listener = built != null && built.getOpcode() == Opcode.NEW_INSTANCE && firstRegister(built) == put.getRegisterA()
                            ? String.valueOf(reference(built)) : null;
                    ClassDef listening = listener == null ? null : clean.classes.get(listener);
                    boolean confirm = false;
                    if (listening != null) for (Method n : listening.getMethods()) if (n.getName().equals("invoke") && n.getImplementation() != null)
                        for (Instruction i : instructions(n)) if (i.getOpcode() == Opcode.SGET_OBJECT
                                && String.valueOf(reference(i)).equals(ALERT_DISMISS_REASON + "->CONFIRM_BUTTON_CLICK:" + ALERT_DISMISS_REASON)) confirm = true;
                    boolean confirms = confirm && reference(was.get(store - 1)) instanceof MethodReference ctor
                            && ctor.getName().equals("<init>") && ctor.getDefiningClass().equals(listener);
                    int alert = put.getRegisterB();
                    if (!confirms) fail("the survey alert's dismiss listener in " + launcher + " no longer tells its primary button from the rest");
                    if (alert > 15) fail("the survey alert is in v" + alert + ", out of reach of a plain invoke in " + launcher);
                    Method m = actual(launcher);
                    List<Integer> sites = calls(m, hook, 1);
                    if (confirms && alert <= 15 && m != null && sites.size() == 1) {
                        List<Instruction> body = instructions(m);
                        Layout layout = new Layout(m.getImplementation());
                        int at = sites.get(0);
                        int scratch = at + 1 < body.size() ? firstRegister(body.get(at + 1)) : -1;
                        Instruction branch = at + 2 < body.size() ? body.get(at + 2) : null;
                        placed = at == store + 1 && at + 6 < body.size() && arguments(body.get(at)).isEmpty()
                                && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT
                                && branch.getOpcode() == Opcode.IF_EQZ && firstRegister(branch) == scratch
                                && layout.addresses.get(at + 2) + ((OffsetInstruction) branch).getCodeOffset() == layout.addresses.get(at + 6)
                                && body.get(at + 3).getOpcode() == Opcode.SGET_OBJECT && firstRegister(body.get(at + 3)) == scratch
                                && String.valueOf(reference(body.get(at + 3))).equals(ALERT_DISMISS_REASON + "->CANCEL_BUTTON_CLICK:" + ALERT_DISMISS_REASON)
                                && body.get(at + 4).getOpcode() == Opcode.INVOKE_VIRTUAL && arguments(body.get(at + 4)).equals(List.of(alert, scratch))
                                && String.valueOf(reference(body.get(at + 4))).equals(notifier.toString())
                                && body.get(at + 5).getOpcode() == Opcode.RETURN_VOID
                                && scratch >= 0 && scratch <= 15 && scratch != alert && scratch < parameter(m, -1)
                                && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 6, at + 2);
                        if (!placed) fail(hook + " is not the survey alert's Maybe later dismissal right after its dismiss listener in " + m);
                        else if (!unread(new FeatureFlow(launcher), was, store + 1, scratch)) {
                            fail(hook + " borrows v" + scratch + " in " + m + ", which the launcher still reads after its dismiss listener");
                            placed = false;
                        }
                        remove(m, at, at + 6);
                    }
                }
            }
            boolean pollPlaced = false;
            if (launcher != null) {
                String launch = launcher.toString();
                List<Method> runners = new ArrayList<>();
                List<int[]> arms = new ArrayList<>();
                for (Map.Entry<String, Method> entry : clean.methods.entrySet()) {
                    Method m = entry.getValue();
                    if (entry.getKey().equals(launch) || m.getDefiningClass().startsWith(OWN)) continue;
                    boolean reads = false;
                    for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.SGET_OBJECT
                            && reference(i) instanceof FieldReference f && f.getName().equals(SPONSORED_POLL)) { reads = true; break; }
                    if (!reads || callSites(instructions(m), launch).isEmpty()) continue;
                    for (int[] arm : sponsoredPollArms(m)) { runners.add(m); arms.add(arm); }
                }
                Method runner = unique(runners, "advertiser sponsored poll check");
                if (runner != null) {
                    int start = arms.get(0)[0], target = arms.get(0)[1];
                    List<Instruction> was = instructions(runner);
                    boolean opens = false;
                    for (int k = start; k < target; k++) if (was.get(k).getOpcode() == Opcode.NEW_INSTANCE) {
                        ClassDef modal = clean.classes.get(String.valueOf(reference(was.get(k))));
                        if (modal != null) for (Method n : modal.getMethods()) for (Instruction i : instructions(n))
                            if (i.getOpcode() == Opcode.NEW_INSTANCE && String.valueOf(reference(i)).equals(POLL_VIEW)) opens = true;
                    }
                    boolean passes = !callSites(was.subList(target, was.size()), launch).isEmpty();
                    boolean returnsNothing = runner.getReturnType().equals("V");
                    if (!opens) fail("the sponsored poll check in " + runner + " no longer opens the poll's own pop-up");
                    if (!passes) fail("the sponsored poll check in " + runner + " no longer leaves other surveys to the invite launcher");
                    if (!returnsNothing) fail("the sponsored poll check is in " + runner + ", which answers a value");
                    Method m = actual(runner);
                    List<Integer> sites = calls(m, pollHook, 1);
                    if (opens && passes && returnsNothing && m != null && sites.size() == 1) {
                        List<Instruction> body = instructions(m);
                        Layout layout = new Layout(m.getImplementation());
                        int at = sites.get(0);
                        int scratch = at + 1 < body.size() ? firstRegister(body.get(at + 1)) : -1;
                        Instruction branch = at + 2 < body.size() ? body.get(at + 2) : null;
                        pollPlaced = at == start && at + 4 < body.size() && arguments(body.get(at)).isEmpty()
                                && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT
                                && branch.getOpcode() == Opcode.IF_EQZ && firstRegister(branch) == scratch
                                && layout.addresses.get(at + 2) + ((OffsetInstruction) branch).getCodeOffset() == layout.addresses.get(at + 4)
                                && body.get(at + 3).getOpcode() == Opcode.RETURN_VOID
                                && scratch >= 0 && scratch < parameter(m, -1)
                                && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 4, at + 2);
                        if (!pollPlaced) fail(pollHook + " doesn't open the sponsored poll arm of " + m);
                        else if (!unread(new FeatureFlow(runner), was, start, scratch)) {
                            fail(pollHook + " borrows v" + scratch + " in " + m + ", which the sponsored poll arm still reads");
                            pollPlaced = false;
                        }
                        remove(m, at, at + 4);
                    }
                }
            }
            capability(c.callee, placed && pollPlaced);
        }

        /** Getter and hook pairs: each value a getter returns goes through its hook first, in the same register. */
        void answers(Contract c) {
            Set<Opcode> exits = Set.of(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.RETURN_VOID);
            boolean all = true;
            for (int n = 0; n + 1 < c.strings.size(); n += 2) {
                String getter = c.strings.get(n), hook = c.strings.get(n + 1);
                Method old = clean.methods.get(getter);
                if (old == null || old.getImplementation() == null) { fail(getter + " is absent from the clean target"); all = false; continue; }
                List<Instruction> was = instructions(old);
                List<Integer> returns = new ArrayList<>();
                for (int at = 0; at < was.size(); at++) if (exits.contains(was.get(at).getOpcode())) returns.add(at);
                Method m = actual(old);
                List<Integer> sites = calls(m, hook, returns.size());
                if (m == null || returns.isEmpty() || sites.size() != returns.size()) { all = false; continue; }
                List<Instruction> body = instructions(m);
                for (int k = 0; k < sites.size(); k++) {
                    int at = sites.get(k);
                    Instruction exit = was.get(returns.get(k));
                    int register = firstRegister(exit);
                    if (exit.getOpcode() == Opcode.RETURN_VOID || exit.getOpcode() == Opcode.RETURN_WIDE || at != returns.get(k) + 2 * k
                            || at + 2 >= body.size() || !arguments(body.get(at)).equals(List.of(register))
                            || !isMoveResult(body.get(at + 1).getOpcode()) || firstRegister(body.get(at + 1)) != register
                            || body.get(at + 2).getOpcode() != exit.getOpcode() || firstRegister(body.get(at + 2)) != register) {
                        fail(hook + " does not filter the answer before every return in " + m); all = false; continue;
                    }
                    remove(m, at, at + 2);
                }
            }
            capability(c.callee, all);
        }

        /**
         * Firebase's request header builder, found by its texts: the certificate header's value goes
         * through the hook, with the connection, between the header's name and its write, and the
         * method is otherwise untouched.
         */
        void firebaseCertificate(Contract c) {
            String hook = c.strings.get(0);
            List<Method> builders = new ArrayList<>();
            for (Method m : clean.holding("X-Android-Cert")) if (m.getReturnType().equals("Ljava/net/HttpURLConnection;")
                    && clean.texts.get(m.toString()).containsAll(List.of("X-Android-Package", "x-goog-api-key", "SHA1",
                    "Could not get fingerprint hash for package: "))) builders.add(m);
            Method builder = unique(builders, "Firebase request header builder");
            boolean found = false;
            if (builder != null) {
                List<Instruction> was = instructions(builder);
                List<Integer> names = new ArrayList<>();
                for (int at = 0; at < was.size(); at++)
                    if (reference(was.get(at)) instanceof StringReference s && s.getString().equals("X-Android-Cert")) names.add(at);
                Method m = actual(builder);
                List<Integer> sites = calls(m, hook, 1);
                if (m != null && sites.size() == 1 && names.size() == 1 && names.get(0) + 1 < was.size()) {
                    int at = sites.get(0);
                    List<Integer> write = arguments(was.get(names.get(0) + 1));
                    List<Instruction> body = instructions(m);
                    boolean shaped = at == names.get(0) + 1 && write.size() == 3 && body.size() == was.size() + 2
                            && arguments(body.get(at)).equals(List.of(write.get(0), write.get(2)))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == write.get(2)
                            && arguments(body.get(at + 2)).equals(write)
                            && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                    if (!shaped) fail(hook + " doesn't take the certificate header's value between its name and its write in " + m);
                    else { remove(m, at, at + 2); found = true; }
                }
            }
            capability(c.callee, found);
        }

        static final String TYPEFACE = "Landroid/graphics/Typeface;";
        static final String CUSTOM_FONT = "Lapp/hushpinterest/extension/pinterest/ui/CustomFont;";
        /** Android's default fonts and the extension's stand-in each read of one goes to. */
        static final Map<String, String> TYPEFACE_DEFAULTS = Map.of(
                TYPEFACE + "->DEFAULT:" + TYPEFACE, CUSTOM_FONT + "->androidDefault:" + TYPEFACE,
                TYPEFACE + "->SANS_SERIF:" + TYPEFACE, CUSTOM_FONT + "->androidSansSerif:" + TYPEFACE,
                TYPEFACE + "->DEFAULT_BOLD:" + TYPEFACE, CUSTOM_FONT + "->androidDefaultBold:" + TYPEFACE);

        /** True for ResourcesCompat's static font loader shape: context, id, value, style, a callback and two flags. */
        static boolean isFontLoader(Method m) {
            List<String> shape = new ArrayList<>();
            for (CharSequence p : m.getParameterTypes()) shape.add(p.toString());
            return AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getReturnType().equals(TYPEFACE) && shape.size() == 7
                    && shape.get(0).equals("Landroid/content/Context;") && shape.get(1).equals("I")
                    && shape.get(2).equals("Landroid/util/TypedValue;") && shape.get(3).equals("I")
                    && shape.get(4).startsWith("L") && shape.get(5).equals("Z") && shape.get(6).equals("Z");
        }

        /**
         * Custom font (#51), a whole family: ResourcesCompat's font loader, found by its message for a
         * font it can't load and its shape, hands what it returns to the hook with the font's id, back
         * into the same register, right at its only return. Every read of Android's default fonts in
         * Pinterest's code reads the extension's stand-in into the same register instead, and the
         * methods are otherwise untouched.
         */
        void fontResource(Contract c) {
            String hook = c.strings.get(0);
            List<Method> loaders = new ArrayList<>();
            for (Method m : clean.holding("Font resource ID #0x")) if (isFontLoader(m)) loaders.add(m);
            Method loader = unique(loaders, "ResourcesCompat font loader");
            int exit = -1;
            if (loader != null) {
                List<Instruction> was = instructions(loader);
                List<Integer> returns = new ArrayList<>();
                for (int at = 0; at < was.size(); at++) if (was.get(at).getOpcode() == Opcode.RETURN_OBJECT) returns.add(at);
                Method m = actual(loader);
                List<Integer> sites = calls(m, hook, 1);
                if (returns.size() != 1) fail("ResourcesCompat font loader returns from " + returns.size() + " places, expected 1");
                else if (m != null && sites.size() == 1) {
                    int at = sites.get(0);
                    exit = returns.get(0);
                    int result = firstRegister(was.get(exit));
                    List<Instruction> body = instructions(m);
                    boolean shaped = at == exit && at + 2 < body.size() && body.size() == was.size() + 2
                            && arguments(body.get(at)).equals(List.of(result, parameter(m, 1)))
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == result
                            && body.get(at + 2).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(at + 2)) == result
                            && onlyFrom(m, at + 1, at) && onlyFrom(m, at + 2, at + 1);
                    if (!shaped) fail(hook + " doesn't take the font loader's typeface and font id right at its return in " + m);
                    else remove(m, at, at + 2);
                }
            }
            int reads = 0;
            for (Method original : clean.methods.values()) {
                if (original.getDefiningClass().startsWith(OWN) || original.getImplementation() == null) continue;
                List<Instruction> was = instructions(original);
                List<Integer> at = new ArrayList<>();
                for (int k = 0; k < was.size(); k++)
                    if (was.get(k).getOpcode() == Opcode.SGET_OBJECT && TYPEFACE_DEFAULTS.containsKey(String.valueOf(reference(was.get(k))))) at.add(k);
                if (at.isEmpty()) continue;
                Method m = actual(original);
                if (m == null) continue;
                List<Instruction> body = instructions(m);
                // Only the loader gains instructions, the hook's two at its return.
                int shift = original.equals(loader) ? 2 : 0;
                for (int k : at) {
                    Instruction old = was.get(k);
                    int now = k + (k >= exit && shift > 0 ? shift : 0);
                    Instruction read = now < body.size() ? body.get(now) : null;
                    if (read == null || read.getOpcode() != Opcode.SGET_OBJECT || firstRegister(read) != firstRegister(old)
                            || !TYPEFACE_DEFAULTS.get(String.valueOf(reference(old))).equals(String.valueOf(reference(read))))
                        fail("Custom font left a read of Android's default font, or moved it, in " + m);
                    else edits.computeIfAbsent(m.toString(), e -> new FeatureEdits()).replacements.put(now, old);
                    reads++;
                }
            }
            if (reads == 0) fail("Pinterest's code reads none of Android's default fonts for Custom font to stand in for");
        }

        /** The authority a literal names: a content:// address's host, or the literal itself; null unless it's under Pinterest's package. */
        static String ownAuthority(String literal) {
            String authority = literal;
            if (literal.startsWith("content://")) {
                authority = literal.substring("content://".length());
                for (char end : new char[] {'/', '?', '#'}) if (authority.indexOf(end) >= 0) authority = authority.substring(0, authority.indexOf(end));
            }
            return authority.startsWith("com.pinterest.") ? authority : null;
        }

        static String loadedString(Instruction i) {
            return (i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO)
                    && reference(i) instanceof StringReference s ? s.getString() : null;
        }

        /**
         * Change package name's own providers: Pinterest's code spells their authorities out, and the
         * patch hands each load of one to the hook, a range call on the register the load wrote, with
         * the answer moved back into it. An authority routed once is routed at every load in
         * Pinterest's code, and the methods are otherwise untouched. The patch itself refuses a
         * build that routes none, since only the manifest knows which literals are providers.
         */
        void ownAuthorities(Contract c) {
            String hook = c.strings.get(0);
            Set<String> routed = new HashSet<>();
            for (FeatureSite site : patched.ownCalls.getOrDefault(hook, List.of())) {
                List<Instruction> body = instructions(site.method);
                String literal = site.at > 0 ? loadedString(body.get(site.at - 1)) : null;
                String authority = literal == null ? null : ownAuthority(literal);
                if (authority == null) fail(hook + " doesn't take a literal naming one of Pinterest's own providers in " + site.method);
                else routed.add(authority);
            }
            for (Method original : clean.methods.values()) {
                if (original.getDefiningClass().startsWith(OWN) || original.getImplementation() == null) continue;
                List<Instruction> was = instructions(original);
                List<Integer> loads = new ArrayList<>();
                for (int at = 0; at < was.size(); at++) {
                    String literal = loadedString(was.get(at));
                    if (literal != null && routed.contains(ownAuthority(literal))) loads.add(at);
                }
                if (loads.isEmpty()) continue;
                Method m = actual(original);
                List<Integer> sites = calls(m, hook, loads.size());
                if (m == null || sites.size() != loads.size()) continue;
                List<Instruction> body = instructions(m);
                for (int k = 0; k < loads.size(); k++) {
                    int at = sites.get(k);
                    int register = firstRegister(was.get(loads.get(k)));
                    boolean shaped = at == loads.get(k) + 2 * k + 1 && body.get(at).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                            && arguments(body.get(at)).equals(List.of(register)) && at + 1 < body.size()
                            && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == register
                            && onlyFrom(m, at, at - 1) && onlyFrom(m, at + 1, at);
                    if (!shaped) fail(hook + " doesn't take the authority straight from its load, into the same register, in " + m);
                    else remove(m, at, at + 2);
                }
            }
        }

        static final String RECAPTCHA_SDK = "Lcom/google/android/recaptcha/";
        static final Set<String> PACKAGE_OWNERS = Set.of("Landroid/content/Context;", "Landroid/content/ContextWrapper;", "Landroid/app/Application;");

        /**
         * Whether body[at] sends the app's package to reCAPTCHA: getPackageName and its move-result,
         * with the result reaching, within ten instructions and before a write over it or a jump,
         * a two-argument put inside the SDK (the token's signals) or a one-String setter of an SDK
         * class (request fields, the init request's among them; R8 moves those builders anywhere).
         */
        static boolean reportsPackage(List<Instruction> body, int at, String owner) {
            if (at + 2 >= body.size()) return false;
            Instruction call = body.get(at);
            if (call.getOpcode() != Opcode.INVOKE_VIRTUAL || !(reference(call) instanceof MethodReference asked)
                    || !asked.getName().equals("getPackageName") || !asked.getParameterTypes().isEmpty()
                    || !PACKAGE_OWNERS.contains(asked.getDefiningClass())) return false;
            Instruction kept = body.get(at + 1);
            if (kept.getOpcode() != Opcode.MOVE_RESULT_OBJECT) return false;
            int value = firstRegister(kept);
            for (int j = at + 2; j < Math.min(body.size(), at + 10); j++) {
                Instruction next = body.get(j);
                if (reference(next) instanceof MethodReference to && next instanceof FiveRegisterInstruction) {
                    List<Integer> args = arguments(next);
                    boolean put = (next.getOpcode() == Opcode.INVOKE_VIRTUAL || next.getOpcode() == Opcode.INVOKE_INTERFACE)
                            && to.getName().equals("put") && to.getParameterTypes().size() == 2 && args.size() == 3
                            && args.get(2) == value && owner.startsWith(RECAPTCHA_SDK);
                    boolean setter = next.getOpcode() == Opcode.INVOKE_VIRTUAL && to.getDefiningClass().startsWith(RECAPTCHA_SDK)
                            && args.size() == 2 && args.get(1) == value && to.getParameterTypes().size() == 1
                            && to.getParameterTypes().get(0).toString().equals("Ljava/lang/String;") && to.getReturnType().equals("V");
                    if (put || setter) return true;
                }
                Opcode op = next.getOpcode();
                if (!op.canContinue() || next instanceof OffsetInstruction) return false;
                if (op.setsRegister() && next instanceof OneRegisterInstruction w
                        && (w.getRegisterA() == value || (op.setsWideRegister() && w.getRegisterA() + 1 == value))) return false;
            }
            return false;
        }

        /**
         * Change package name's reCAPTCHA report: wherever the SDK sends the app's package (its init
         * request's field, the token's signals), the hook takes the getPackageName call's place,
         * static, on the same register, and nothing else in the method moves. The patch refuses a
         * build with none.
         */
        void reportedPackage(Contract c) {
            String hook = c.strings.get(0);
            int sites = 0;
            for (Method original : clean.methods.values()) {
                if (original.getImplementation() == null) continue;
                List<Instruction> was = instructions(original);
                List<Integer> at = new ArrayList<>();
                for (int k = 0; k < was.size(); k++) if (reportsPackage(was, k, original.getDefiningClass())) at.add(k);
                if (at.isEmpty()) continue;
                Method m = actual(original);
                List<Integer> found = calls(m, hook, at.size());
                if (m == null || found.size() != at.size()) continue;
                List<Instruction> body = instructions(m);
                for (int n = 0; n < at.size(); n++) {
                    int k = at.get(n);
                    Instruction old = was.get(k);
                    boolean shaped = found.get(n) == k && body.size() == was.size() && arguments(body.get(k)).equals(arguments(old));
                    if (!shaped) fail(hook + " doesn't take the place of reCAPTCHA's getPackageName, on its register, in " + m);
                    else edits.computeIfAbsent(m.toString(), e -> new FeatureEdits()).replacements.put(k, old);
                    sites++;
                }
            }
            if (sites == 0) fail("reCAPTCHA reports the app's package nowhere Change package name looks");
        }

        static final String BLOCK_STORE = "Lcom/google/android/gms/auth/blockstore/";

        /**
         * A Block Store wrapper's instance read, save and delete of a keyed record, the same shape the
         * patch looks for, or null unless the class has exactly one of each on one continuation type.
         */
        static Method[] blockStore(ClassDef cd) {
            Method read = null, save = null, delete = null;
            int reads = 0, saves = 0, deletes = 0;
            Set<String> continuations = new HashSet<>();
            for (Method m : cd.getMethods()) {
                if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null) continue;
                if (storeCall(m, List.of("Ljava/lang/String;"), "Ljava/io/Serializable;", BLOCK_STORE + "RetrieveBytesRequest;")) { read = m; reads++; }
                else if (storeCall(m, List.of("Ljava/lang/String;", "[B"), "Ljava/lang/Object;", BLOCK_STORE + "StoreBytesData;")) { save = m; saves++; }
                else if (storeCall(m, List.of("Ljava/util/List;"), "Ljava/lang/Object;", BLOCK_STORE + "DeleteBytesRequest;")) { delete = m; deletes++; }
                else continue;
                continuations.add(m.getParameterTypes().get(m.getParameterTypes().size() - 1).toString());
            }
            return reads == 1 && saves == 1 && deletes == 1 && continuations.size() == 1 ? new Method[]{read, save, delete} : null;
        }

        static boolean storeCall(Method m, List<String> leading, String returns, String request) {
            List<String> types = new ArrayList<>();
            for (CharSequence p : m.getParameterTypes()) types.add(p.toString());
            if (!m.getReturnType().equals(returns) || types.size() != leading.size() + 1
                    || !types.subList(0, leading.size()).equals(leading) || !types.get(leading.size()).startsWith("L")) return false;
            for (Instruction i : instructions(m)) {
                Reference r = reference(i);
                if (r instanceof TypeReference && ((TypeReference) r).getType().equals(request)) return true;
                if (r instanceof MethodReference && (((MethodReference) r).getDefiningClass().equals(request)
                        || ((MethodReference) r).getReturnType().equals(request)
                        || ((MethodReference) r).getParameterTypes().stream().anyMatch(p -> p.toString().equals(request)))) return true;
                if (r instanceof FieldReference && (((FieldReference) r).getDefiningClass().equals(request)
                        || ((FieldReference) r).getType().equals(request))) return true;
            }
            return false;
        }

        /**
         * androidx's failure listener for the Sign in with Google request: the extension gets the
         * exception ahead of the listener's own first instruction. A build with no listener has nothing to claim.
         */
        void signInFailure(Contract c) {
            String hook = c.strings.get(0);
            List<Method> listeners = new ArrayList<>();
            for (Method m : clean.holding("During get sign-in intent, failure response from one tap: "))
                if (m.getDefiningClass().equals("Landroidx/credentials/playservices/HiddenActivity;") && m.getReturnType().equals("V")
                        && AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getParameterTypes().size() == 2
                        && m.getParameterTypes().get(0).toString().equals(m.getDefiningClass())
                        && m.getParameterTypes().get(1).toString().equals("Ljava/lang/Exception;")) listeners.add(m);
            if (listeners.isEmpty()) { capability(c.callee, false); return; }
            Method m = actual(unique(listeners, "Google sign-in failure listener"));
            List<Integer> sites = calls(m, hook, 1);
            boolean found = false;
            if (m != null && sites.size() == 1) {
                found = sites.get(0) == 0 && arguments(instructions(m).get(0)).equals(List.of(parameter(m, 1)));
                if (found) remove(m, 0, 1);
                else fail(hook + " doesn't get the exception ahead of " + m);
            }
            if (found) found = frameworkProvider(c.strings.get(1)) && providerChoice(c.strings.get(2));
            capability(c.callee, found);
        }

        /**
         * Credential Manager's framework provider, the one instance isAvailableOnDevice()Z on a class
         * holding an android.credentials.CredentialManager: the extension's answer comes first, true
         * returns unavailable from a local register, and false branches to the untouched original body.
         */
        boolean frameworkProvider(String hook) {
            List<Method> providers = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                boolean holds = false;
                for (Field f : cd.getInstanceFields()) holds |= f.getType().equals("Landroid/credentials/CredentialManager;");
                if (holds) for (Method m : cd.getMethods())
                    if (m.getName().equals("isAvailableOnDevice") && m.getReturnType().equals("Z") && m.getParameterTypes().isEmpty()
                            && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getImplementation() != null) providers.add(m);
            }
            Method m = actual(unique(providers, "Credential Manager framework provider"));
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            int answer = body.size() > 4 ? firstRegister(body.get(1)) : -1;
            boolean shaped = sites.get(0) == 0 && arguments(body.get(0)).isEmpty() && body.size() > 5
                    && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                    && body.get(3).getOpcode() == Opcode.CONST_4 && body.get(4).getOpcode() == Opcode.RETURN
                    && answer >= 0 && answer < parameter(m, -1) && firstRegister(body.get(2)) == answer
                    && firstRegister(body.get(3)) == answer && firstRegister(body.get(4)) == answer
                    && body.get(3) instanceof NarrowLiteralInstruction && ((NarrowLiteralInstruction) body.get(3)).getNarrowLiteral() == 0
                    && body.get(2) instanceof OffsetInstruction
                    && layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(5);
            for (int at = 1; shaped && at < 5; at++) shaped = onlyFrom(m, at, at - 1);
            FeatureFlow graph = flow(m);
            for (int k = 0; shaped && k < graph.normal.size(); k++) shaped = !graph.normal.get(k).contains(0) && !graph.handlers.get(k).contains(0);
            if (!shaped) { fail(hook + " doesn't answer unavailable ahead of the untouched body of " + m); return false; }
            remove(m, 0, 5);
            return true;
        }

        /**
         * Credential Manager's provider choice, the one static method taking its own class and the request
         * that builds the framework provider and asks it isAvailableOnDevice()Z. A request whose options are
         * all Sign in with Google goes to the class's own Play services lookup, and anything else (another
         * option, an empty list, another request type) branches to the untouched original body. The prefix
         * writes only the two locals below the parameters and reads the request's own list field and the
         * option's one String field, both named by the clean body.
         */
        boolean providerChoice(String hook) {
            List<Method> choices = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) {
                if (cd.getType().startsWith(OWN)) continue;
                for (Method m : cd.getMethods()) {
                    if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null || !m.getReturnType().startsWith("L")
                            || m.getParameterTypes().size() != 2 || !m.getParameterTypes().get(0).toString().equals(cd.getType())
                            || !m.getParameterTypes().get(1).toString().equals("Ljava/lang/Object;")) continue;
                    boolean builds = false, asks = false;
                    for (Instruction i : instructions(m)) {
                        Reference r = reference(i);
                        if (i.getOpcode() == Opcode.NEW_INSTANCE && holdsCredentialManager(r.toString())) builds = true;
                        if (r instanceof MethodReference called && called.getName().equals("isAvailableOnDevice")
                                && called.getReturnType().equals("Z") && called.getParameterTypes().isEmpty()) asks = true;
                    }
                    if (builds && asks) choices.add(m);
                }
            }
            Method original = unique(choices, "Credential Manager provider choice");
            Method m = actual(original);
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            int self = parameter(m, 0), request = parameter(m, 1);
            Set<String> requests = new TreeSet<>(), lists = new TreeSet<>(), casts = new TreeSet<>(), lookups = new TreeSet<>();
            for (Instruction i : instructions(original)) {
                Reference r = reference(i);
                if (i.getOpcode() == Opcode.INSTANCE_OF && ((TwoRegisterInstruction) i).getRegisterB() == request) requests.add(r.toString());
                if (i.getOpcode() == Opcode.IGET_OBJECT && ((FieldReference) r).getType().equals("Ljava/util/List;")) lists.add(r.toString());
                if (i.getOpcode() == Opcode.CHECK_CAST) casts.add(r.toString());
                if ((i.getOpcode() == Opcode.INVOKE_VIRTUAL || i.getOpcode() == Opcode.INVOKE_DIRECT) && r instanceof MethodReference called
                        && called.getDefiningClass().equals(m.getDefiningClass()) && called.getParameterTypes().isEmpty()
                        && called.getReturnType().equals(m.getReturnType())) lookups.add(i.getOpcode().name + " " + r);
            }
            casts.removeAll(requests);
            String typeField = null;
            ClassDef option = casts.size() == 1 ? clean.classes.get(casts.iterator().next()) : null;
            if (option != null) {
                List<Field> types = new ArrayList<>();
                for (Field f : option.getInstanceFields()) if (f.getType().equals("Ljava/lang/String;")) types.add(f);
                if (types.size() == 1 && AccessFlags.PUBLIC.isSet(types.get(0).getAccessFlags()))
                    typeField = option.getType() + "->" + types.get(0).getName() + ":Ljava/lang/String;";
            }
            List<Instruction> body = instructions(m);
            boolean shaped = requests.size() == 1 && lists.size() == 1 && typeField != null && lookups.size() == 1
                    && sites.get(0) == 17 && body.size() > 24;
            int a = shaped ? firstRegister(body.get(0)) : -1, b = shaped ? firstRegister(body.get(6)) : -1;
            shaped &= a >= 0 && b >= 0 && a != b && a < parameter(m, -1) && b < parameter(m, -1);
            if (shaped) {
                String requestType = requests.iterator().next(), lookup = lookups.iterator().next();
                String[] opcodes = {"instance-of", "if-eqz", "move-object", "check-cast", "iget-object", "invoke-interface", "move-result",
                        "if-nez", "invoke-interface", "move-result-object", "invoke-interface", "move-result", "if-eqz", "invoke-interface",
                        "move-result-object", "check-cast", "iget-object", "invoke-static", "move-result", "if-eqz", "goto",
                        lookup.substring(0, lookup.indexOf(' ')), "move-result-object", "return-object"};
                // a and b are the two locals, r the request and s the class's own instance; "(x)" is an invoke's only argument.
                String[] registers = {"a r", "a", "a r", "a", "a a", "(a)", "b", "b", "(a)", "a", "(a)", "b", "b", "(a)",
                        "b", "b", "b b", "(b)", "b", "b", "", "(s)", "a", "a"};
                Map<Integer, String> references = Map.ofEntries(Map.entry(0, requestType), Map.entry(3, requestType),
                        Map.entry(4, lists.iterator().next()), Map.entry(5, "Ljava/util/List;->isEmpty()Z"),
                        Map.entry(8, "Ljava/util/List;->iterator()Ljava/util/Iterator;"), Map.entry(10, "Ljava/util/Iterator;->hasNext()Z"),
                        Map.entry(13, "Ljava/util/Iterator;->next()Ljava/lang/Object;"), Map.entry(15, option.getType()),
                        Map.entry(16, typeField), Map.entry(21, lookup.substring(lookup.indexOf(' ') + 1)));
                int[][] next = {{1}, {2, 24}, {3}, {4}, {5}, {6}, {7}, {8, 24}, {9}, {10}, {11}, {12}, {13, 21}, {14}, {15}, {16},
                        {17}, {18}, {19}, {20, 24}, {10}, {22}, {23}, {}};
                Map<Character, Integer> named = Map.of('a', a, 'b', b, 'r', request, 's', self);
                FeatureFlow graph = flow(m);
                for (int at = 0; shaped && at < 24; at++) {
                    Instruction i = body.get(at);
                    String op = i.getOpcode().name, want = registers[at];
                    shaped = op.equals(opcodes[at]) || op.startsWith(opcodes[at] + "/") && !opcodes[at].startsWith("invoke");
                    if (shaped && references.containsKey(at)) shaped = references.get(at).equals(String.valueOf(reference(i)));
                    if (shaped && want.startsWith("(")) shaped = arguments(i).equals(List.of(named.get(want.charAt(1))));
                    else if (shaped && !want.isEmpty()) {
                        shaped = firstRegister(i) == named.get(want.charAt(0));
                        if (shaped && want.length() > 1) shaped = i instanceof TwoRegisterInstruction
                                && ((TwoRegisterInstruction) i).getRegisterB() == named.get(want.charAt(2));
                    }
                    Set<Integer> edges = new TreeSet<>();
                    for (int target : next[at]) edges.add(target);
                    if (shaped) shaped = new TreeSet<>(graph.normal.get(at)).equals(edges) && graph.handlers.get(at).isEmpty();
                }
                for (int k = 24; shaped && k < graph.normal.size(); k++) {
                    for (int target : graph.normal.get(k)) shaped &= target >= 24;
                    for (int target : graph.handlers.get(k)) shaped &= target >= 24;
                }
            }
            if (!shaped) { fail(hook + " doesn't send only Google-only requests to the Play services lookup ahead of the untouched body of " + m); return false; }
            remove(m, 0, 24);
            return true;
        }

        boolean holdsCredentialManager(String type) {
            ClassDef cd = clean.classes.get(type);
            if (cd == null || cd.getType().startsWith(OWN)) return false;
            for (Field f : cd.getInstanceFields()) if (f.getType().equals("Landroid/credentials/CredentialManager;")) return true;
            return false;
        }

        /**
         * Save pins you download and Download pins you save: the extension gets the pin ahead of the
         * method every save goes through and each new quick-save helper in front of its constructor's
         * return, and two stubs make the quick save and read the pin's saved state. The closeup
         * presenter names those classes, so a build without it has nothing to claim.
         */
        void saveAndDownload(Contract c) {
            ClassDef presenter = clean.classes.get(c.strings.get(2));
            if (presenter == null) { capability(c.callee, false); return; }
            homeFields();
            String helperType = null, actionType = null, pin = null;
            for (Field f : presenter.getFields()) {
                if (f.getName().equals("repinUtils")) helperType = f.getType();
                if (f.getName().equals("pinAction")) actionType = f.getType();
            }
            ClassDef menu = clean.classes.get(PIN_MENU);
            if (menu != null) for (Field f : menu.getFields()) if (f.getName().equals("pin")) pin = f.getType();
            ClassDef helper = helperType == null ? null : clean.classes.get(helperType);
            ClassDef action = actionType == null ? null : clean.classes.get(actionType);
            if (helper == null || action == null || pin == null) { fail("the save route's classes aren't in the clean APK"); return; }

            List<Method> saves = new ArrayList<>();
            for (Method m : presenter.getMethods()) if (m.getName().equals("repinToBoard"))
                for (Instruction i : instructions(m)) if (reference(i) instanceof MethodReference called && called.getDefiningClass().equals(actionType)
                        && !called.getParameterTypes().isEmpty() && called.getParameterTypes().get(0).toString().equals(pin))
                    for (Method candidate : action.getMethods()) if (candidate.toString().equals(called.toString()) && !saves.contains(candidate)) saves.add(candidate);
            Method save = actual(unique(saves, "method every save goes through"));
            List<Integer> sites = calls(save, c.strings.get(0), 1);
            boolean saving = false;
            if (save != null && sites.size() == 1) {
                saving = sites.get(0) == 0 && arguments(instructions(save).get(0)).equals(List.of(parameter(save, 0)));
                if (saving) remove(save, 0, 1);
                else fail(c.strings.get(0) + " doesn't get the pin ahead of " + save);
            }

            List<Method> constructors = new ArrayList<>();
            for (Method m : helper.getMethods()) if (m.getName().equals("<init>") && m.getImplementation() != null) constructors.add(m);
            Method built = unique(constructors, "quick save constructor");
            Method init = actual(built);
            boolean kept = false;
            if (built != null && init != null) {
                int returns = 0;
                for (Instruction i : instructions(built)) if (i.getOpcode() == Opcode.RETURN_VOID) returns++;
                List<Instruction> body = instructions(init);
                List<Integer> hands = calls(init, c.strings.get(1), returns);
                kept = returns > 0 && hands.size() == returns;
                for (int at : hands) {
                    if (at + 1 >= body.size() || body.get(at + 1).getOpcode() != Opcode.RETURN_VOID || !arguments(body.get(at)).equals(List.of(parameter(init, -1)))) {
                        fail(c.strings.get(1) + " at " + at + " is not the helper itself in front of a return");
                        kept = false;
                    }
                    remove(init, at, at + 1);
                }
            }

            List<String> shape = List.of(pin, "Z", "Ljava/lang/String;", "Z", "Z", "Lkotlin/jvm/functions/Function1;", "Ljava/lang/String;");
            List<Method> quickSaves = new ArrayList<>();
            for (Method m : helper.getMethods()) if (m.getReturnType().equals("V") && m.getParameterTypes().size() == 8 && AccessFlags.PUBLIC.isSet(m.getAccessFlags())
                    && !AccessFlags.STATIC.isSet(m.getAccessFlags()) && m.getParameterTypes().subList(0, 7).stream().map(Object::toString).toList().equals(shape)) quickSaves.add(m);
            Method quickSave = unique(quickSaves, "quick save");
            List<Method> writers = new ArrayList<>();
            for (Method m : clean.holding("pinned_to_profile")) if (m.getReturnType().equals("V") && m.getParameterTypes().size() > 1
                    && m.getParameterTypes().get(1).toString().equals(pin)) writers.add(m);
            Method writer = unique(writers, "pin writer");
            String board = pinAccessor(writer, "pinned_to_board", pin);
            String profile = pinAccessor(writer, "pinned_to_profile", pin);
            if (quickSave == null || board == null || profile == null) return;
            String reason = quickSave.getParameterTypes().get(7).toString();
            Method saved = stub(BASE + "actions/SaveAndDownload;->savePin(Ljava/lang/Object;Ljava/lang/Object;)V",
                    List.of(Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4,
                            Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_4, Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.RETURN_VOID),
                    Arrays.asList(helperType, pin, null, null, null, null, null, null, null, null, reason + "->UNKNOWN:" + reason, quickSave.toString(), null));
            Method read = stub(BASE + "actions/SaveAndDownload;->alreadySaved(Ljava/lang/Object;)Z",
                    List.of(Opcode.CHECK_CAST, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ,
                            Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN),
                    Arrays.asList(pin, board, null, null, profile, null, null, "Ljava/lang/Boolean;->booleanValue()Z", null, null, null, null, null, null));
            capability(c.callee, saving && kept && saved != null && read != null);
        }

        /** Home's request, or nothing in a build without one. */
        List<Method> homeRequests() {
            List<Method> requests = new ArrayList<>();
            for (Method m : clean.holding("android_hf_api_request_get_to_post")) if (m.getDefiningClass().startsWith("Lcom/pinterest/feature/home/model/")
                    && clean.texts.get(m.toString()).contains("compressed_fields")) requests.add(m);
            return requests;
        }

        /**
         * Home's request hands the field list it has just read to the extension and keeps what comes
         * back. Hide pins you've already saved and Save pins you download share that one call, so both
         * of their rules claim it here. A build without the request has nothing to claim.
         */
        boolean homeFields() {
            String hook = BASE + "ads/SavedPins;->homeFields(Ljava/lang/String;)Ljava/lang/String;";
            List<Method> requests = homeRequests();
            if (requests.isEmpty()) return false;
            Method request = unique(requests, "Home's request");
            Method after = actual(request);
            String set = null;
            if (request != null) for (Instruction i : instructions(request))
                if (reference(i) instanceof FieldReference named && named.getName().equals("DYNAMIC_GRID_FEED_WITH_BOARD_FIELDS")) set = named.getType();
            List<Integer> sites = calls(after, hook, 1);
            if (after == null || set == null || sites.size() != 1) return false;
            List<Instruction> body = instructions(after);
            int at = sites.get(0);
            int kept = at > 1 && body.get(at - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT ? firstRegister(body.get(at - 1)) : -1;
            boolean hooked = kept >= 0 && at + 1 < body.size()
                    && reference(body.get(at - 2)) instanceof MethodReference list && list.getReturnType().equals("Ljava/lang/String;")
                    && list.getParameterTypes().size() == 1 && list.getParameterTypes().get(0).toString().equals(set)
                    && arguments(body.get(at)).equals(List.of(kept))
                    && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == kept;
            if (hooked) remove(after, at, at + 2);
            else fail(hook + " doesn't get Home's field list as it's read");
            return hooked;
        }

        /**
         * Each page of Home goes through the extension as soon as the callback holds it as the feed's own
         * type, and a stub reads the page's items. A build without the callback has nothing to claim.
         * Home's callback hands the page to Home's own model; up to 14.42.0 it sat in that package, and
         * 14.43.0 merged it into a shared lambda class elsewhere, so the call picks it, not the package.
         */
        void homePage(Contract c) {
            String feed = c.strings.get(2), home = c.strings.get(1);
            List<Method> callbacks = homeCallbacks(home, feed);
            if (callbacks.isEmpty() || homeRequests().isEmpty()) { capability(c.callee, false); return; }
            boolean asked = homeFields();
            Method after = actual(unique(callbacks, "Home's page callback"));
            List<Integer> sites = calls(after, c.strings.get(0), 1);
            boolean hooked = false;
            if (after != null && sites.size() == 1) {
                List<Instruction> body = instructions(after);
                int at = sites.get(0);
                hooked = at > 0 && body.get(at - 1).getOpcode() == Opcode.CHECK_CAST && feed.equals(String.valueOf(reference(body.get(at - 1))))
                        && arguments(body.get(at)).equals(List.of(firstRegister(body.get(at - 1))));
                if (hooked) remove(after, at, at + 1);
                else fail(c.strings.get(0) + " doesn't get Home's page right after its cast");
            }
            ClassDef page = clean.classes.get(feed);
            List<Method> lists = new ArrayList<>();
            if (page != null) for (Method m : page.getMethods()) if (m.getReturnType().equals("Ljava/util/List;") && m.getParameterTypes().isEmpty()
                    && AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && !AccessFlags.STATIC.isSet(m.getAccessFlags())) lists.add(m);
            Method items = unique(lists, "Home's page items");
            if (items == null) return;
            Method read = stub(BASE + "ads/SavedPins;->pageItems(Ljava/lang/Object;)Ljava/util/List;",
                    List.of(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                    Arrays.asList(feed, items.toString(), null, null));
            capability(c.callee, asked && hooked && read != null);
        }

        /** Home's page callbacks: an invoke that casts the page, hands it back and passes it to Home's own model first. */
        List<Method> homeCallbacks(String home, String feed) {
            List<Method> callbacks = new ArrayList<>();
            for (ClassDef owner : clean.classes.values()) if (!owner.getType().startsWith(OWN))
                for (Method m : owner.getMethods()) if (m.getName().equals("invoke") && m.getImplementation() != null && handsBack(m, feed)
                        && instructions(m).stream().anyMatch(i -> reference(i) instanceof MethodReference call && call.getDefiningClass().startsWith(home)
                        && call.getParameterTypes().stream().anyMatch(p -> p.toString().equals(feed)))) callbacks.add(m);
            return callbacks;
        }

        /**
         * Hide pins you've already seen (#52): every pin grid cell, a class declaring its own getPin()
         * of a pin model and its own markImpressionStart() that isn't the Object bridge, hands itself to
         * the extension first thing there, and the stub reads the pin through each cell's getter, by
         * class name. It rides on Home's page hook, so a build without Home's callback and request, or
         * without such a cell, claims nothing. A cell that isn't public is skipped, as the patch skips it.
         */
        void seenPins(Contract c) {
            String hook = c.strings.get(0), pinOf = c.strings.get(1), home = c.strings.get(2), feed = c.strings.get(3);
            TreeMap<String, Method[]> cells = new TreeMap<>();
            for (ClassDef owner : clean.classes.values()) {
                if (owner.getType().startsWith(OWN) || AccessFlags.INTERFACE.isSet(owner.getAccessFlags())) continue;
                List<Method> pins = new ArrayList<>(), starts = new ArrayList<>();
                for (Method m : owner.getMethods()) {
                    if (m.getImplementation() == null || !m.getParameterTypes().isEmpty() || AccessFlags.STATIC.isSet(m.getAccessFlags())
                            || AccessFlags.ABSTRACT.isSet(m.getAccessFlags())) continue;
                    if (m.getName().equals("getPin") && m.getReturnType().startsWith("Lcom/pinterest/api/model/")) pins.add(m);
                    if (m.getName().equals("markImpressionStart") && !m.getReturnType().equals("Ljava/lang/Object;")) starts.add(m);
                }
                if (pins.size() != 1 || starts.size() != 1) continue;
                if (!AccessFlags.PUBLIC.isSet(owner.getAccessFlags()) || !AccessFlags.PUBLIC.isSet(pins.get(0).getAccessFlags())) continue;
                cells.put(owner.getType(), new Method[]{pins.get(0), starts.get(0)});
            }
            if (cells.isEmpty() || homeCallbacks(home, feed).isEmpty() || homeRequests().isEmpty()) { capability(c.callee, false); return; }
            boolean hooked = true;
            List<Opcode> opcodes = new ArrayList<>();
            List<String> references = new ArrayList<>();
            for (Method[] cell : cells.values()) {
                Method after = actual(cell[1]);
                List<Integer> sites = calls(after, hook, 1);
                if (after == null || sites.size() != 1) { hooked = false; continue; }
                int at = sites.get(0);
                if (at != 0 || !arguments(instructions(after).get(at)).equals(List.of(parameter(after, -1)))) {
                    fail(hook + " isn't the first thing " + cell[1] + " does, with the cell");
                    hooked = false;
                    continue;
                }
                remove(after, at, at + 1);
                opcodes.addAll(List.of(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL,
                        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT));
                references.addAll(Arrays.asList(cell[0].getDefiningClass(), null, cell[0].getDefiningClass(), cell[0].toString(), null, null));
            }
            opcodes.addAll(List.of(Opcode.CONST_4, Opcode.RETURN_OBJECT));
            references.addAll(Arrays.asList(null, null));
            Method read = hooked ? stub(pinOf, opcodes, references) : null;
            capability(c.callee, hooked && read != null);
        }

        static final String SEARCH_FIELD_SET = "SEARCH_PIN_FEED", RELATED_FIELD_SET = "RELATED_PIN_FIELDS",
                RELATED_FILTER = "Lcom/pinterest/feature/pin/closeup/datasource/RelatedModulesModelFilter;";

        /**
         * Hide saved pins in search and More to explore (#34): every search and More to explore request
         * hands the field list it has just read to the extension and keeps what comes back, search's
         * results list hands each page through first thing, and More to explore's item filter lets the
         * extension drop a saved pin before it judges the item. Found the way the patch finds them, and
         * a half the build lacks claims nothing and keeps its capability off.
         */
        void savedElsewhere(Contract c) {
            String fieldsHook = c.strings.get(0), pageHook = c.strings.get(1), dropHook = c.strings.get(2);
            // The enum of field sets: the class naming SEARCH_PIN_FEED as a static field of its own type.
            Set<String> sets = new TreeSet<>();
            for (Method m : clean.holding(SEARCH_FIELD_SET)) {
                ClassDef owner = clean.classes.get(m.getDefiningClass());
                if (owner != null) for (Field f : owner.getStaticFields())
                    if (f.getName().equals(SEARCH_FIELD_SET) && f.getType().equals(owner.getType())) sets.add(owner.getType());
            }
            if (sets.size() > 1) fail("the request field sets have " + sets.size() + " clean classes, expected 1");
            if (sets.size() != 1) { capability("feedSavedSearch", false); capability("feedSavedRelated", false); return; }
            String set = sets.iterator().next();
            Set<String> both = Set.of(SEARCH_FIELD_SET, RELATED_FIELD_SET);
            List<Method> searchReaders = new ArrayList<>(), relatedReaders = new ArrayList<>();
            for (ClassDef owner : clean.classes.values()) {
                if (owner.getType().equals(set)) continue;
                for (Method m : owner.getMethods()) {
                    if (m.getImplementation() == null) continue;
                    Set<String> read = new HashSet<>();
                    for (Instruction i : instructions(m)) if (reference(i) instanceof FieldReference f && f.getDefiningClass().equals(set)
                            && f.getType().equals(set)) read.add(f.getName());
                    if (read.isEmpty() || fieldListReads(instructions(m), set, both).isEmpty()) continue;
                    if (read.contains(SEARCH_FIELD_SET)) searchReaders.add(m);
                    if (read.contains(RELATED_FIELD_SET)) relatedReaders.add(m);
                }
            }
            List<ClassDef> lists = new ArrayList<>();
            for (Method m : searchReaders) {
                ClassDef owner = clean.classes.get(m.getDefiningClass());
                if (owner == null || lists.contains(owner)) continue;
                for (Method page : owner.getMethods()) if (takesPage(page)) { lists.add(owner); break; }
            }
            ClassDef search = lists.isEmpty() ? null : uniqueClass(lists, "search's results list");
            List<Method> pages = new ArrayList<>();
            if (search != null) for (Method m : search.getMethods()) if (takesPage(m)) pages.add(m);
            ClassDef filterClass = clean.classes.get(RELATED_FILTER);
            List<Method> filters = new ArrayList<>();
            if (filterClass != null) for (Method m : filterClass.getMethods()) if (m.getImplementation() != null && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && m.getReturnType().equals("Z") && m.getParameterTypes().size() == 1 && !m.getParameterTypes().get(0).toString().equals("Ljava/lang/String;")) filters.add(m);
            Method filter = filterClass == null ? null : unique(filters, "More to explore's item filter");

            // Which field sets each request's reads were hooked for: search's own requests on the search
            // half, every More to explore request on the related half.
            Map<Method, Set<String>> wanted = new LinkedHashMap<>();
            boolean searchHalf = false, relatedHalf = false;
            if (search != null && !pages.isEmpty()) for (Method m : searchReaders) if (m.getDefiningClass().equals(search.getType())
                    && !fieldListReads(instructions(m), set, Set.of(SEARCH_FIELD_SET)).isEmpty()) {
                wanted.computeIfAbsent(m, k -> new HashSet<>()).add(SEARCH_FIELD_SET);
                searchHalf = true;
            }
            if (filter != null) for (Method m : relatedReaders) if (!fieldListReads(instructions(m), set, Set.of(RELATED_FIELD_SET)).isEmpty()) {
                wanted.computeIfAbsent(m, k -> new HashSet<>()).add(RELATED_FIELD_SET);
                relatedHalf = true;
            }
            boolean searchOk = searchHalf, relatedOk = relatedHalf;
            for (Map.Entry<Method, Set<String>> entry : wanted.entrySet()) {
                Method original = entry.getKey(), after = actual(original);
                int count = fieldListReads(instructions(original), set, entry.getValue()).size();
                List<Integer> sites = calls(after, fieldsHook, count);
                boolean hooked = after != null && sites.size() == count;
                if (hooked) {
                    List<Instruction> body = instructions(after);
                    List<int[]> reads = fieldListReads(body, set, entry.getValue());
                    List<Integer> places = new ArrayList<>();
                    for (int[] read : reads) places.add(read[0]);
                    hooked = places.equals(sites);
                    for (int n = 0; hooked && n < reads.size(); n++) {
                        int at = reads.get(n)[0], kept = reads.get(n)[1];
                        hooked = arguments(body.get(at)).equals(List.of(kept)) && at + 1 < body.size()
                                && body.get(at + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT && firstRegister(body.get(at + 1)) == kept;
                    }
                    if (hooked) for (int at : sites) remove(after, at, at + 2);
                    else fail(fieldsHook + " doesn't get each field list right as it's read in " + after);
                }
                if (!hooked) {
                    if (entry.getValue().contains(SEARCH_FIELD_SET)) searchOk = false;
                    if (entry.getValue().contains(RELATED_FIELD_SET)) relatedOk = false;
                }
            }
            if (searchHalf) for (Method page : pages) {
                Method after = actual(page);
                int before = findings.size();
                if (after != null) prefix(after, pageHook, List.of(parameter(after, 0)), true);
                if (after == null || findings.size() != before) searchOk = false;
            }
            if (relatedHalf) {
                Method after = actual(filter);
                List<Integer> sites = calls(after, dropHook, 1);
                boolean dropped = after != null && sites.size() == 1 && sites.get(0) == 0;
                if (dropped) {
                    List<Instruction> body = instructions(after);
                    Layout layout = new Layout(after.getImplementation());
                    int answer = body.size() > 4 ? firstRegister(body.get(1)) : -1;
                    dropped = answer >= 0 && arguments(body.get(0)).equals(List.of(parameter(after, 0)))
                            && body.get(1).getOpcode() == Opcode.MOVE_RESULT && body.get(2).getOpcode() == Opcode.IF_EQZ
                            && firstRegister(body.get(2)) == answer && body.get(3).getOpcode() == Opcode.RETURN && firstRegister(body.get(3)) == answer
                            && layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() == layout.addresses.get(4)
                            // The answer borrows a register the filter's own body never reads before writing.
                            && unread(new FeatureFlow(filter), instructions(filter), 0, answer);
                    if (dropped) remove(after, 0, 4);
                }
                if (!dropped) { fail(dropHook + " doesn't drop a saved pin ahead of More to explore's own filter in " + after); relatedOk = false; }
            }
            capability("feedSavedSearch", searchOk);
            capability("feedSavedRelated", relatedOk);
        }

        /**
         * Each static call in [body] asking for the list one of the [wanted] fields of [set] spells out,
         * as {where its kept answer is next used, the register it's kept in}. The set handed over is the
         * one last loaded into the call's register, so search's board and people requests stay out.
         */
        static List<int[]> fieldListReads(List<Instruction> body, String set, Set<String> wanted) {
            List<int[]> out = new ArrayList<>();
            for (int at = 0; at + 1 < body.size(); at++) {
                Instruction i = body.get(at);
                if (i.getOpcode() != Opcode.INVOKE_STATIC && i.getOpcode() != Opcode.INVOKE_STATIC_RANGE) continue;
                if (!(reference(i) instanceof MethodReference called) || !called.getReturnType().equals("Ljava/lang/String;")
                        || called.getParameterTypes().size() != 1 || !called.getParameterTypes().get(0).toString().equals(set)) continue;
                int handed = arguments(i).isEmpty() ? -1 : arguments(i).get(0);
                Instruction loaded = null;
                for (int k = at - 1; k >= 0 && loaded == null; k--) {
                    Instruction before = body.get(k);
                    if (before.getOpcode().setsRegister() && before instanceof OneRegisterInstruction one && one.getRegisterA() == handed) loaded = before;
                }
                if (loaded == null || loaded.getOpcode() != Opcode.SGET_OBJECT || !(reference(loaded) instanceof FieldReference named)
                        || !named.getDefiningClass().equals(set) || !wanted.contains(named.getName())) continue;
                if (body.get(at + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                out.add(new int[] {at + 2, firstRegister(body.get(at + 1))});
            }
            return out;
        }

        /** A results list's page method: (List, boolean), handing the page on to its parent's own. */
        boolean takesPage(Method m) {
            if (m.getImplementation() == null || AccessFlags.STATIC.isSet(m.getAccessFlags()) || !descriptor(m).equals("(Ljava/util/List;Z)V")) return false;
            boolean handsOn = false, parent = false;
            for (Instruction i : instructions(m)) {
                if (reference(i) instanceof MethodReference call && call.getName().equals(m.getName()) && descriptor(call).equals("(Ljava/util/List;Z)V")) handsOn = true;
                if (i.getOpcode() == Opcode.INVOKE_SUPER || i.getOpcode() == Opcode.INVOKE_SUPER_RANGE) parent = true;
            }
            return handsOn && parent;
        }

        /**
         * Back leaves Home right away (#36): Home's Back handler asks the extension where its jump to
         * the top starts, and on a yes goes to the target of its own branch, the false it answers for a
         * feed near the top. The answer borrows a register neither path reads before writing. A build
         * whose handler isn't the shape the patch looks for keeps the jump and claims nothing.
         */
        void homeBack(Contract c) {
            String hook = c.strings.get(0);
            ClassDef home = clean.classes.get(HOME_FEED_FRAGMENT);
            List<Method> handlers = new ArrayList<>();
            if (home != null) for (Method m : home.getMethods()) if (m.getImplementation() != null && !AccessFlags.STATIC.isSet(m.getAccessFlags())
                    && descriptor(m).equals("()Z") && !homeRefreshCalls(m).isEmpty() && instructions(m).stream().anyMatch(i ->
                    reference(i) instanceof MethodReference r && r.getName().equals("computeVerticalScrollOffset"))) handlers.add(m);
            Method handler = handlers.size() == 1 ? handlers.get(0) : null;
            int branch = -1, leave = -1;
            FeatureFlow graph = handler == null ? null : new FeatureFlow(handler);
            List<Instruction> body = handler == null ? List.of() : instructions(handler);
            if (handler != null) {
                int offset = -1;
                for (int at = 0; at < body.size() && offset < 0; at++)
                    if (reference(body.get(at)) instanceof MethodReference r && r.getName().equals("computeVerticalScrollOffset")) offset = at;
                List<Integer> branches = new ArrayList<>();
                for (int at = offset + 1; at < body.size(); at++) if (body.get(at).getOpcode() == Opcode.IF_LE) branches.add(at);
                if (branches.size() == 1) {
                    branch = branches.get(0);
                    for (int next : graph.normal.get(branch)) if (next != branch + 1) leave = next;
                }
            }
            // The patch's own rules: a refresh after the fall-through, which only the branch reaches,
            // and a target that runs straight to returning the false loaded before the branch.
            boolean shaped = leave >= 0 && onlyFrom(graph, branch + 1, branch)
                    && body.subList(branch + 1, body.size()).stream().anyMatch(i -> (i.getOpcode() == Opcode.INVOKE_STATIC || i.getOpcode() == Opcode.INVOKE_STATIC_RANGE)
                    && reference(i) instanceof MethodReference r && descriptor(r).equals("(" + r.getDefiningClass() + "Ljava/util/HashMap;I)V"));
            if (shaped) {
                int returned = -1;
                for (int at = leave; at < body.size() && returned < 0; at++) if (body.get(at).getOpcode() == Opcode.RETURN) returned = at;
                int answer = returned < 0 ? -1 : firstRegister(body.get(returned));
                for (int at = leave; shaped && returned >= 0 && at < returned; at++)
                    shaped = graph.normal.get(at).equals(List.of(at + 1)) && !writes(body.get(at), answer);
                Instruction loaded = null;
                for (int at = branch - 1; at >= 0 && loaded == null && answer >= 0; at--) if (writes(body.get(at), answer)) loaded = body.get(at);
                shaped &= returned >= 0 && loaded != null && loaded.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) loaded).getNarrowLiteral() == 0;
            }
            if (!shaped) { capability(c.callee, false); return; }
            Method after = actual(handler);
            List<Integer> sites = calls(after, hook, 1);
            boolean hooked = after != null && sites.size() == 1;
            if (hooked) {
                List<Instruction> patchedBody = instructions(after);
                Layout layout = new Layout(after.getImplementation());
                int at = sites.get(0), target = leave > branch ? leave + 3 : leave;
                int answer = at + 2 < patchedBody.size() ? firstRegister(patchedBody.get(at + 1)) : -1;
                hooked = at == branch + 1 && arguments(patchedBody.get(at)).isEmpty() && answer >= 0
                        && patchedBody.get(at + 1).getOpcode() == Opcode.MOVE_RESULT && patchedBody.get(at + 2).getOpcode() == Opcode.IF_NEZ
                        && firstRegister(patchedBody.get(at + 2)) == answer
                        && layout.addresses.get(at + 2) + ((OffsetInstruction) patchedBody.get(at + 2)).getCodeOffset() == layout.addresses.get(target)
                        && unread(graph, body, branch + 1, answer) && unread(graph, body, leave, answer);
                if (hooked) remove(after, at, at + 3);
                else fail(hook + " doesn't let Back go on from the start of Home's jump to the top in " + after);
            }
            capability(c.callee, hooked);
        }

        /** Whether [m] casts something to [type] and returns that register, unlike a callback that only logs it. */
        private boolean handsBack(Method m, String type) {
            Set<Integer> returned = new HashSet<>();
            for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.RETURN_OBJECT) returned.add(firstRegister(i));
            for (Instruction i : instructions(m)) if (i.getOpcode() == Opcode.CHECK_CAST && type.equals(String.valueOf(reference(i))) && returned.contains(firstRegister(i))) return true;
            return false;
        }

        /** The pin's own static accessor that a pin writer reads right after naming [label]. */
        private String pinAccessor(Method writer, String label, String pin) {
            if (writer == null) return null;
            boolean named = false;
            for (Instruction i : instructions(writer)) {
                if (!named) { named = reference(i) instanceof StringReference text && text.getString().equals(label); continue; }
                if (i.getOpcode() == Opcode.INVOKE_STATIC && reference(i) instanceof MethodReference accessor && accessor.getDefiningClass().equals(pin)
                        && accessor.getParameterTypes().size() == 1 && accessor.getParameterTypes().get(0).toString().equals(pin)) return accessor.toString();
            }
            fail("the pin writer has no accessor for " + label);
            return null;
        }

        /**
         * Pinterest's browser ID in Block Store: the read answers no record when its hook says so and
         * the save returns what its hook hands back unless that's null, both ahead of the method's own
         * first instruction, and the extension's delete stub calls the wrapper's own delete.
         */
        void browserId(Contract c) {
            List<ClassDef> stores = new ArrayList<>();
            for (ClassDef cd : clean.classes.values()) if (!cd.getType().startsWith(OWN) && blockStore(cd) != null) stores.add(cd);
            ClassDef owner = uniqueClass(stores, "Block Store wrapper");
            if (owner == null) { capability(c.callee, false); return; }
            Method[] store = blockStore(owner);
            boolean read = browserIdPrefix(actual(store[0]), c.strings.get(0), true);
            boolean save = browserIdPrefix(actual(store[1]), c.strings.get(1), false);
            String continuation = store[0].getParameterTypes().get(1).toString();
            Method stub = stub(BASE + "privacy/AdvertisingId;->deleteBrowserId(Ljava/lang/Object;Ljava/util/List;Ljava/lang/Object;)Ljava/lang/Object;",
                    List.of(Opcode.CHECK_CAST, Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                    Arrays.asList(owner.getType(), continuation, store[2].toString(), null, null));
            boolean deletes = stub != null;
            if (stub != null) {
                List<Instruction> body = instructions(stub);
                if (firstRegister(body.get(1)) != parameter(stub, 2)
                        || !arguments(body.get(2)).equals(List.of(parameter(stub, 0), parameter(stub, 1), parameter(stub, 2)))
                        || firstRegister(body.get(3)) != firstRegister(body.get(4))) {
                    fail(stub + " doesn't hand its store, keys and continuation to " + store[2]); deletes = false;
                }
            }
            capability(c.callee, read && save && deletes);
        }

        /**
         * The hook call at index 0, then a move-result and an if-eqz on one local that lands on the
         * original first instruction. The read hook takes the key and its enabled arm answers null;
         * the save hook takes this, key, bytes and continuation and its enabled arm returns its answer.
         */
        boolean browserIdPrefix(Method m, String hook, boolean read) {
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            List<Instruction> body = instructions(m);
            Layout layout = new Layout(m.getImplementation());
            int resume = read ? 5 : 4;
            List<Integer> expected = read ? List.of(parameter(m, 0))
                    : List.of(parameter(m, -1), parameter(m, 0), parameter(m, 1), parameter(m, 2));
            int register = body.size() > 1 ? firstRegister(body.get(1)) : -1;
            Instruction branch = body.size() > 2 ? body.get(2) : null;
            boolean placed = sites.get(0) == 0 && body.size() > resume && arguments(body.get(0)).equals(expected)
                    && body.get(1).getOpcode() == (read ? Opcode.MOVE_RESULT : Opcode.MOVE_RESULT_OBJECT)
                    && branch.getOpcode() == Opcode.IF_EQZ && firstRegister(branch) == register
                    && layout.addresses.get(2) + ((OffsetInstruction) branch).getCodeOffset() == layout.addresses.get(resume)
                    && register >= 0 && register < parameter(m, -1);
            if (placed && read) placed = body.get(3).getOpcode() == Opcode.CONST_4 && firstRegister(body.get(3)) == register
                    && ((NarrowLiteralInstruction) body.get(3)).getNarrowLiteral() == 0
                    && body.get(4).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(4)) == register;
            if (placed && !read) placed = body.get(3).getOpcode() == Opcode.RETURN_OBJECT && firstRegister(body.get(3)) == register;
            // Nothing else may jump into the prefix.
            for (int at = 1; placed && at < resume; at++) placed = onlyFrom(m, at, at - 1);
            if (!placed) { fail(hook + " isn't a guarded prefix with " + (read ? "a null" : "its own") + " answer ahead of " + m); return false; }
            remove(m, 0, resume);
            return true;
        }

        /** Engage's one client gateway: the service read, the pass-through hook, then the SDK's own null test. */
        boolean engageGateway(String hook) {
            List<Method> gateways = new ArrayList<>();
            for (ClassDef cd : clean.classesHolding("com.google.android.engage.BIND_APP_ENGAGE_SERVICE")) {
                boolean client = false;
                for (Method m : cd.getMethods()) if (m.getName().equals("<clinit>")
                        && clean.holding("com.google.android.engage.BIND_APP_ENGAGE_SERVICE").contains(m)) client = true;
                if (client) for (Method m : cd.getMethods()) if (engageTest(m) >= 0) gateways.add(m);
            }
            Method gateway = unique(gateways, "Google Engage service gateway");
            Method m = actual(gateway);
            List<Integer> sites = calls(m, hook, 1);
            if (m == null || sites.size() != 1) return false;
            int test = engageTest(gateway);
            Instruction read = instructions(gateway).get(test - 1);
            int register = firstRegister(read);
            String type = ((FieldReference) reference(read)).getType();
            List<Instruction> body = instructions(m);
            int at = sites.get(0);
            if (at != test || at + 3 >= body.size() || !arguments(body.get(at)).equals(List.of(register))
                    || body.get(at + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || firstRegister(body.get(at + 1)) != register
                    || body.get(at + 2).getOpcode() != Opcode.CHECK_CAST || firstRegister(body.get(at + 2)) != register
                    || !type.equals(String.valueOf(reference(body.get(at + 2))))
                    || body.get(at + 3).getOpcode() != Opcode.IF_NEZ || firstRegister(body.get(at + 3)) != register) {
                fail(hook + " is not a service pass-through before Engage's null test in " + m); return false;
            }
            remove(m, at, at + 3);
            return true;
        }

        /** The index of the null test that follows an instance read and precedes Engage's unavailable exception, or -1. */
        int engageTest(Method m) {
            if (AccessFlags.STATIC.isSet(m.getAccessFlags()) || m.getImplementation() == null
                    || !m.getReturnType().equals("Lcom/google/android/gms/tasks/Task;")) return -1;
            List<Instruction> body = instructions(m);
            int found = -1;
            for (int at = 1; at + 1 < body.size(); at++) {
                Instruction read = body.get(at - 1), test = body.get(at), refusal = body.get(at + 1);
                if (read.getOpcode() != Opcode.IGET_OBJECT || ((TwoRegisterInstruction) read).getRegisterB() != parameter(m, -1)
                        || test.getOpcode() != Opcode.IF_NEZ || firstRegister(test) != firstRegister(read)
                        || refusal.getOpcode() != Opcode.NEW_INSTANCE
                        || !"Lcom/google/android/engage/service/AppEngageException;".equals(String.valueOf(reference(refusal)))) continue;
                if (found >= 0) return -1;
                found = at;
            }
            return found;
        }

        void wrapperFallback(Method wrapper, Method endpoint, String hook) {
            List<Instruction> body = instructions(wrapper);
            Layout layout = new Layout(wrapper.getImplementation());
            List<Integer> calls = callSites(body, endpoint.toString());
            if (body.size() < 6 || calls.size() != 1 || !hook.equals(String.valueOf(reference(body.get(0))))
                    || body.get(1).getOpcode() != Opcode.MOVE_RESULT || body.get(2).getOpcode() != Opcode.IF_EQZ
                    || firstRegister(body.get(1)) != firstRegister(body.get(2))) { fail(wrapper + " lost its upload switch guard"); return; }
            int at = calls.get(0);
            if (layout.addresses.get(2) + ((OffsetInstruction) body.get(2)).getCodeOffset() != layout.addresses.get(at)
                    || at < 4 || body.get(at - 1).getOpcode() != Opcode.RETURN_OBJECT
                    || body.get(at).getOpcode() != Opcode.INVOKE_INTERFACE_RANGE || at + 3 != body.size()
                    || body.get(at + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || body.get(at + 2).getOpcode() != Opcode.RETURN_OBJECT
                    || firstRegister(body.get(at + 1)) != firstRegister(body.get(at + 2))) fail(wrapper + " has no guarded original endpoint fallback");
            List<Integer> args = new ArrayList<>();
            for (int p = parameter(wrapper, 0); p < wrapper.getImplementation().getRegisterCount(); p++) args.add(p);
            if (!arguments(body.get(at)).equals(args)) fail(wrapper + " changes original endpoint arguments");
            controls(actual(hook), true);
        }

        Method inherited(String type, String name, String shape) {
            Set<String> seen = new HashSet<>();
            for (ClassDef cd = clean.classes.get(type); cd != null && seen.add(cd.getType()); cd = clean.classes.get(cd.getSuperclass()))
                for (Method m : cd.getMethods()) if (m.getName().equals(name) && descriptor(m).equals(shape) && m.getImplementation() != null) return m;
            fail("settings lifecycle target is absent: " + type + "->" + name + shape); return null;
        }

        void settings(Contract c) {
            String entry = c.strings.get(2);
            Method app = actual(inherited(c.strings.get(0), "onCreate", "()V"));
            if (app != null) {
                prefix(app, "Lapp/hushpinterest/extension/shared/Utils;->setContext(Landroid/content/Context;)V", List.of(parameter(app, -1)), false);
                int count = 0;
                Method old = clean.methods.get(app.toString());
                for (Instruction i : instructions(old)) if (i.getOpcode() == Opcode.RETURN_VOID) count++;
                if (count == 0) fail("settings application lifecycle has no original return");
                for (int at : calls(app, entry + "->onApplicationCreate(Landroid/content/Context;)V", count)) {
                    List<Instruction> body = instructions(app);
                    if (at + 1 >= body.size() || body.get(at + 1).getOpcode() != Opcode.RETURN_VOID
                            || !arguments(body.get(at)).equals(List.of(parameter(app, -1)))) fail("settings application hook is not before its original return");
                    remove(app, at, at + 1);
                }
            }
            Method create = actual(inherited(c.strings.get(1), "onCreate", "(Landroid/os/Bundle;)V"));
            if (create != null) prefix(create, entry + "->onActivityCreate(Landroid/app/Activity;)V", List.of(parameter(create, -1)), false);
            Set<String> intentMethods = new HashSet<>();
            for (String activity : List.of(c.strings.get(1), c.strings.get(3))) {
                Method intent = actual(inherited(activity, "onNewIntent", "(Landroid/content/Intent;)V"));
                if (intent == null || !intentMethods.add(intent.toString())) continue;
                String hook = entry + "->onNewIntent(Landroid/app/Activity;Landroid/content/Intent;)V";
                List<Integer> sites = calls(intent, hook, 1);
                if (sites.size() == 1) {
                    int at = sites.get(0);
                    if (at != 0 || !arguments(instructions(intent).get(at)).equals(List.of(parameter(intent, -1), parameter(intent, 0)))) fail("settings intent hook is not a parameter-preserving prefix");
                    remove(intent, at, at + 1);
                }
            }
            String manager = "Landroid/content/pm/ShortcutManager;";
            String[] names = {"pushDynamicShortcut", "addDynamicShortcuts", "setDynamicShortcuts", "updateShortcuts", "removeAllDynamicShortcuts"};
            for (String name : names) {
                String parameters = name.equals("pushDynamicShortcut") ? "Landroid/content/pm/ShortcutInfo;" : name.equals("removeAllDynamicShortcuts") ? "" : "Ljava/util/List;";
                String answer = name.equals("pushDynamicShortcut") || name.equals("removeAllDynamicShortcuts") ? "V" : "Z";
                replacement(manager + "->" + name + "(" + parameters + ")" + answer, entry + "->" + name + "(" + manager + parameters + ")" + answer, null, true);
            }
            greetingHeader(entry + "->onGreetingHeader(Landroid/view/View;)V");
            tabLongPress(entry + "->onTabLongPress(Landroid/view/View$OnLongClickListener;)Landroid/view/View$OnLongClickListener;");
            nativeSettings(entry);
        }

        /** The owned row and click are anchored in the clean native list, never a shared URL or safety label. */
        void nativeSettings(String entry) {
            List<Method> builders = clean.methods.values().stream().filter(m -> instructions(m).stream().anyMatch(i ->
                    readsId(i, "settings_main_header_settings")) && instructions(m).stream().anyMatch(i ->
                    readsId(i, "settings_main_header_account"))).toList();
            if (builders.isEmpty()) return; // Framework-only verifier fixtures have no native settings model.
            Method originalBuilder = unique(builders, "native settings list");
            if (originalBuilder == null) return;
            List<ClassDef> external = clean.classes.values().stream().filter(cd -> {
                for (Method m : cd.getMethods()) if (m.getName().equals("<init>") && instructions(m).stream().anyMatch(i ->
                        readsId(i, "settings_menu_teen_safety_resources"))) return true;
                return false;
            }).toList();
            ClassDef externalClass = uniqueClass(external, "native external settings row");
            if (externalClass == null) return;
            String parent = externalClass.getSuperclass(), owned = BASE + "settings/NativeSettingsItem;";
            ClassDef row = patched.classes.get(owned);
            Method constructor = actual(owned + "-><init>()V"), viewType = actual(owned + "->getViewType()I");
            if (row == null || !parent.equals(row.getSuperclass()) || !AccessFlags.PUBLIC.isSet(row.getAccessFlags())
                    || !row.getInterfaces().containsAll(externalClass.getInterfaces())) {
                fail("native settings row has no owned public identity with its native superclass"); return;
            }
            List<Instruction> viewBody = instructions(viewType);
            if (viewBody.size() != 2 || !(viewBody.get(0) instanceof NarrowLiteralInstruction literal) || literal.getNarrowLiteral() != 13
                    || viewBody.get(1).getOpcode() != Opcode.RETURN || firstRegister(viewBody.get(0)) != firstRegister(viewBody.get(1))) {
                fail("owned settings row does not use native external-row view type 13");
            }
            calls(constructor, entry + "->nativeTitleId()I", 1);
            List<Instruction> ctorBody = instructions(constructor);
            if (ctorBody.size() != 9 || !ctorBody.get(5).getOpcode().name.startsWith("invoke-static")
                    || !String.valueOf(reference(ctorBody.get(5))).equals(entry + "->nativeTitleId()I")
                    || ctorBody.get(6).getOpcode() != Opcode.MOVE_RESULT || ctorBody.get(7).getOpcode() != Opcode.INVOKE_DIRECT
                    || !(reference(ctorBody.get(7)) instanceof MethodReference baseInit) || !baseInit.getDefiningClass().equals(parent)
                    || !baseInit.getName().equals("<init>") || baseInit.getParameterTypes().size() != 2
                    || !baseInit.getParameterTypes().get(0).equals("I")
                    || !arguments(ctorBody.get(7)).equals(List.of(parameter(constructor, -1), firstRegister(ctorBody.get(6)), firstRegister(ctorBody.get(3))))
                    || ctorBody.get(8).getOpcode() != Opcode.RETURN_VOID) {
                fail("native settings constructor doesn't supply its owned title to the native superclass");
            }
            Method builder = actual(originalBuilder);
            List<Instruction> body = instructions(builder);
            int header = -1;
            for (int at = 0; at < body.size(); at++) if (readsId(body.get(at), "settings_main_header_account")) header = at;
            int at = header + 4;
            String init = owned + "-><init>()V";
            List<Integer> constructors = callSites(body, init);
            for (int site : constructors) claimed.add(builder + "@" + site);
            if (header < 0 || at + 2 >= body.size() || constructors.size() != 1 || constructors.get(0) != at + 1
                    || body.get(at).getOpcode() != Opcode.NEW_INSTANCE || !owned.equals(String.valueOf(reference(body.get(at))))
                    || body.get(at + 1).getOpcode() != Opcode.INVOKE_DIRECT
                    || !arguments(body.get(at + 1)).equals(List.of(firstRegister(body.get(at))))
                    || body.get(at + 2).getOpcode() != Opcode.INVOKE_VIRTUAL
                    || !"Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z".equals(String.valueOf(reference(body.get(at + 2))))
                    || !arguments(body.get(at + 2)).equals(List.of(arguments(body.get(header + 3)).get(0), firstRegister(body.get(at))))) {
                fail("native settings row is missing, duplicated or detached from the guaranteed header");
            } else remove(builder, at, at + 3);

            List<Method> clickers = clean.methods.values().stream().filter(m -> instructions(m).stream().anyMatch(i ->
                    reference(i) instanceof FieldReference field && field.getName().equals("TEEN_SAFETY_RESOURCES_LINK"))
                    && instructions(m).stream().anyMatch(i -> i.getOpcode() == Opcode.INSTANCE_OF && parent.equals(String.valueOf(reference(i))))).toList();
            Method oldClick = unique(clickers, "native external settings click");
            if (oldClick == null) return;
            Method click = actual(oldClick);
            List<Integer> sites = calls(click, entry + "->open(Landroid/app/Activity;)Z", 1);
            body = instructions(click);
            int checkAt = -1;
            for (int k = 0; k < body.size(); k++) if (body.get(k).getOpcode() == Opcode.INSTANCE_OF
                    && parent.equals(String.valueOf(reference(body.get(k))))) checkAt = k;
            at = checkAt + 2;
            if (checkAt < 0 || at + 8 >= body.size() || sites.size() != 1 || sites.get(0) != at + 4) {
                fail("owned settings click is not confined to the native external-row branch"); return;
            }
            int scratch = firstRegister(body.get(at));
            Layout layout = new Layout(click.getImplementation());
            Instruction guard = body.get(at + 1);
            if (body.get(at).getOpcode() != Opcode.INSTANCE_OF || !owned.equals(String.valueOf(reference(body.get(at))))
                    || ((TwoRegisterInstruction) body.get(at)).getRegisterB() != ((TwoRegisterInstruction) body.get(checkAt)).getRegisterB()
                    || guard.getOpcode() != Opcode.IF_EQZ || firstRegister(guard) != scratch
                    || layout.addresses.get(at + 1) + ((OffsetInstruction) guard).getCodeOffset() != layout.addresses.get(at + 7)
                    || !"Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;".equals(String.valueOf(reference(body.get(at + 2))))
                    || !arguments(body.get(at + 2)).equals(arguments(instructions(oldClick).get(checkAt + 5)))
                    || body.get(at + 3).getOpcode() != Opcode.MOVE_RESULT_OBJECT || firstRegister(body.get(at + 3)) != scratch
                    || !arguments(body.get(at + 4)).equals(List.of(scratch))
                    || body.get(at + 5).getOpcode() != Opcode.SGET_OBJECT || firstRegister(body.get(at + 5)) != scratch
                    || !(reference(body.get(at + 5)) instanceof FieldReference unit) || !unit.getType().equals("Lkotlin/Unit;")
                    || body.get(at + 6).getOpcode() != Opcode.RETURN_OBJECT || firstRegister(body.get(at + 6)) != scratch
                    || body.get(at + 7).getOpcode() != Opcode.NOP) {
                fail("owned settings click lost its identity guard, Activity argument or native fallback"); return;
            }
            remove(click, at, at + 8);
        }

        static final String GREETING_HEADER_ID = "home_feed_greeting_header_view";
        static final String BOTTOM_BAR = "Lcom/pinterest/navigation/view/FloatingBottomNavBar;";

        /**
         * Every bottom bar tab's long press goes through the settings entry, which opens the screen
         * for the Home tab alone (#48): in each bottom bar method that gives a tab its id
         * (View.setId) and then a two-register setOnLongClickListener, the listener register goes
         * into the hook and its answer back into that register right in front of the call, wherever
         * other features' hooks earlier in the method moved that call. A build
         * whose bar has no such call is left as it was. Found in the clean target, never from the hook.
         */
        void tabLongPress(String hook) {
            ClassDef bar = clean.classes.get(BOTTOM_BAR);
            if (bar == null) return;
            for (Method original : bar.getMethods()) {
                if (original.getImplementation() == null) continue;
                List<Instruction> was = instructions(original);
                int id = -1;
                for (int k = 0; k < was.size() && id < 0; k++) if ("Landroid/view/View;->setId(I)V".equals(String.valueOf(reference(was.get(k))))) id = k;
                if (id < 0) continue;
                List<Integer> sites = new ArrayList<>();
                for (int k = id + 1; k < was.size(); k++) if (was.get(k) instanceof FiveRegisterInstruction set
                        && (set.getOpcode() == Opcode.INVOKE_VIRTUAL || set.getOpcode() == Opcode.INVOKE_INTERFACE) && set.getRegisterCount() == 2
                        && reference(set) instanceof MethodReference r && r.getName().equals("setOnLongClickListener")
                        && descriptor(r).equals("(Landroid/view/View$OnLongClickListener;)V")) sites.add(k);
                if (sites.isEmpty()) continue;
                Method m = actual(original);
                List<Integer> at = calls(m, hook, sites.size());
                if (m == null || at.size() != sites.size()) continue;
                List<Instruction> body = instructions(m);
                for (int n = 0; n < sites.size(); n++) {
                    int site = sites.get(n), k = at.get(n), listener = ((FiveRegisterInstruction) was.get(site)).getRegisterD();
                    // Other features' hooks earlier in the same method (the navigation binding after
                    // setId, for one) move this one down, so the stock call is matched by what it is.
                    if (k < site + 2 * n || !arguments(body.get(k)).equals(List.of(listener)) || k + 2 >= body.size()
                            || body.get(k + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || firstRegister(body.get(k + 1)) != listener
                            || !String.valueOf(reference(body.get(k + 2))).equals(String.valueOf(reference(was.get(site))))
                            || !arguments(body.get(k + 2)).equals(arguments(was.get(site)))
                            || !onlyFrom(m, k + 1, k) || !onlyFrom(m, k + 2, k + 1)) {
                        fail(hook + " doesn't hand over the tab's long press in front of instruction " + site + " of " + m);
                        continue;
                    }
                    remove(m, k, k + 2);
                }
            }
        }

        record HeaderSite(Method method, int at, int register) {}

        /**
         * The home feed header goes to the settings entry right after Pinterest finds it (its R field
         * read, findViewById with it, move-result-object), so the Pinterest logo's long press opens the
         * screen. The patch hooks only a single such site that nothing else branches into, and leaves
         * a build without one as it was. Found in the clean target, never from the hook.
         */
        void greetingHeader(String hook) {
            List<HeaderSite> sites = new ArrayList<>();
            for (Method m : clean.methods.values()) {
                if (m.getDefiningClass().startsWith(OWN) || m.getImplementation() == null) continue;
                List<Instruction> body = instructions(m);
                for (int k = 0; k + 2 < body.size(); k++) {
                    if (!readsId(body.get(k), GREETING_HEADER_ID) || !(body.get(k + 1) instanceof FiveRegisterInstruction find)
                            || find.getOpcode() != Opcode.INVOKE_VIRTUAL || !FIND_VIEW.equals(String.valueOf(reference(find)))
                            || find.getRegisterCount() != 2 || find.getRegisterD() != firstRegister(body.get(k))
                            || body.get(k + 2).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                    sites.add(new HeaderSite(m, k + 3, firstRegister(body.get(k + 2))));
                }
            }
            if (sites.size() != 1 || !onlyFrom(new FeatureFlow(sites.get(0).method()), sites.get(0).at(), sites.get(0).at() - 1)) return;
            HeaderSite site = sites.get(0);
            Method m = actual(site.method());
            List<Integer> at = calls(m, hook, 1);
            if (m == null || at.size() != 1) return;
            int k = at.get(0);
            List<Instruction> body = instructions(m), was = instructions(site.method());
            if (k != site.at() || !arguments(body.get(k)).equals(List.of(site.register())) || k + 1 >= body.size()
                    || body.get(k + 1).getOpcode() != was.get(site.at()).getOpcode() || !onlyFrom(m, k + 1, k) || !onlyFrom(m, k, k - 1)) {
                fail(hook + " doesn't hand over the home feed header in front of instruction " + site.at() + " of " + m);
                return;
            }
            remove(m, k, k + 1);
        }

        List<String> normalized(Method m, FeatureEdits e) {
            List<String> out = new ArrayList<>();
            if (m == null || m.getImplementation() == null) return out;
            Layout layout = new Layout(m.getImplementation());
            Map<Integer, Integer> positions = new HashMap<>();
            int position = 0;
            for (int at = 0; at < layout.instructions.size(); at++) {
                positions.put(layout.addresses.get(at), position);
                if ((e == null || !e.removed.contains(at)) && layout.instructions.get(at).getOpcode() != Opcode.NOP) position++;
            }
            positions.put(layout.size, position);
            Map<Integer, Integer> switches = new HashMap<>();
            for (int at = 0; at < layout.instructions.size(); at++) {
                Instruction i = layout.instructions.get(at);
                if ((i.getOpcode() == Opcode.PACKED_SWITCH || i.getOpcode() == Opcode.SPARSE_SWITCH) && i instanceof OffsetInstruction)
                    switches.put(layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset(), layout.addresses.get(at));
            }
            for (int at = 0; at < layout.instructions.size(); at++) {
                if (e != null && e.removed.contains(at)) continue;
                Instruction i = e == null ? layout.instructions.get(at) : e.replacements.getOrDefault(at, layout.instructions.get(at));
                if (i.getOpcode() == Opcode.NOP) continue;
                String text = render(i).replace("const-string/jumbo", "const-string");
                if (e != null) text = gmsCoreOriginal(i, text);
                if (i instanceof OffsetInstruction) {
                    String raw = String.format("%+d", ((OffsetInstruction) i).getCodeOffset());
                    int target = layout.addresses.get(at) + ((OffsetInstruction) i).getCodeOffset();
                    text = text.replace(", " + raw + " |maxreg=", ", target=" + originalTarget(m, layout, e, positions, target) + " |maxreg=");
                    if (i.getOpcode().name.startsWith("goto")) text = text.replaceFirst("goto(?:/16|/32)?", "goto");
                }
                if (i instanceof SwitchPayload) {
                    text = i.getOpcode().name;
                    Integer owner = switches.get(layout.addresses.get(at));
                    for (SwitchElement element : ((SwitchPayload) i).getSwitchElements()) text += " " + element.getKey() + "->" + (owner == null ? "missing" : originalTarget(m, layout, e, positions, owner + element.getOffset()));
                }
                out.add(text);
            }
            for (TryBlock<? extends ExceptionHandler> block : m.getImplementation().getTryBlocks()) {
                String text = "try " + positions.get(block.getStartCodeAddress()) + ":" + positions.get(block.getStartCodeAddress() + block.getCodeUnitCount());
                for (ExceptionHandler handler : block.getExceptionHandlers()) text += " " + handler.getExceptionType() + "->" + originalTarget(m, layout, e, positions, handler.getHandlerCodeAddress());
                out.add(text);
            }
            return out;
        }

        /**
         * GmsCore support renames Play services strings in every method, hooked ones included
         * (Firebase's token request is one Fix push notifications hooks). Installed, its
         * app.revanced text reads as the com.google text it replaced, so only that exact swap
         * passes and any other changed string still fails.
         */
        String gmsCoreOriginal(Instruction i, String text) {
            if (!flag("gmsCoreSupport") || !(i instanceof ReferenceInstruction)) return text;
            Reference r = ((ReferenceInstruction) i).getReference();
            if (!(r instanceof StringReference)) return text;
            String s = ((StringReference) r).getString();
            String was = null;
            for (String scheme : List.of("", "content://"))
                if (s.startsWith(scheme + "app.revanced")) was = scheme + "com.google" + s.substring((scheme + "app.revanced").length());
            return was == null ? text : text.replace(", " + s + " |maxreg=", ", " + was + " |maxreg=");
        }

        Integer originalTarget(Method m, Layout layout, FeatureEdits e, Map<Integer, Integer> positions, int target) {
            if (e != null) {
                int index = layout.addresses.indexOf(target);
                if (index > 0 && e.removed.contains(index) && e.removed.contains(index - 1))
                    fail(m + " routes an original branch or handler into the middle of an injected block");
            }
            return positions.get(target);
        }

        void run(List<Contract> rules) {
            ClassDef status = patched.classes.get(STATUS);
            if (status == null || !AccessFlags.PUBLIC.isSet(status.getAccessFlags())) fail("compiled SettingsStatus class is absent or inaccessible");
            Set<String> names = new HashSet<>();
            names.add("HushPinterest settings");
            // The patcher reports unnamed dependencies using their two concrete patch kinds.
            names.add("BytecodePatch");
            names.add("ResourcePatch");
            for (Contract c : rules) if (c.kind.equals("family")) {
                if (!names.add(c.target) || flags.containsKey(c.callee)) { fail("duplicate family " + c.target); continue; }
                readFlag(c.callee);
                if (c.strings.get(0).isEmpty()) wholeFamilies.add(c.callee);
                for (String cap : c.strings.get(0).split(",")) {
                    if (cap.isEmpty()) continue;
                    if (owners.putIfAbsent(cap, c.callee) != null) fail("duplicate capability " + cap);
                    readFlag(cap);
                    if (!flag(c.callee) && flag(cap)) fail(cap + " is installed without " + c.callee);
                }
                if (selected != null) {
                    boolean selectedFamily = selected.contains(c.target);
                    boolean optionalAbsent = c.callee.equals("disableUpdateNag") && updateTargets().isEmpty()
                            && clean.classes.keySet().stream().noneMatch(t -> t.startsWith("Lcom/google/android/play/core/appupdate/"));
                    if (flag(c.callee) != (selectedFamily && !optionalAbsent)) fail(c.target + " installed flag disagrees with selected patches and clean capability");
                }
            }
            if (selected != null) for (String name : selected) if (!names.contains(name)) fail("unknown selected patch " + name);
            if (status != null) for (Method m : status.getMethods()) if (descriptor(m).equals("()Z") && !flags.containsKey(m.getName()))
                fail("compiled status flag has no family contract: " + m.getName());
            Set<String> coveredCapabilities = new HashSet<>();
            for (Contract c : rules) if (c.kind.equals("mutation")) {
                for (String cap : c.callee.split(",")) {
                    coveredCapabilities.add(cap);
                    if (!owners.containsKey(cap) && !cap.equals("settings") && !wholeFamilies.contains(cap)) fail("unowned mutation capability " + cap);
                }
                if (!active(c)) continue;
                featureControls = !c.target.equals("settings");
                switch (c.target) {
                    case "feed": feed(c); break;
                    case "views": views(c); break;
                    case "guard": simpleGuard(c); break;
                    case "refresh": refresh(c); break;
                    case "draw": draw(c); break;
                    case "drawWash": draw(c); break;
                    case "builtView": builtView(c); break;
                    case "navigation": navigation(c); break;
                    case "menu": menu(c); break;
                    case "downloads": downloads(c); break;
                    case "longPress": longPress(c); break;
                    case "longPressChoices": longPressChoices(c); break;
                    case "longPressView": longPressView(c); break;
                    case "savedElsewhere": savedElsewhere(c); break;
                    case "homeBack": homeBack(c); break;
                    case "comments": comments(c); break;
                    case "closeupModule": closeupModule(c); break;
                    case "links": links(c); break;
                    case "analytics": analytics(c); break;
                    case "answers": answers(c); break;
                    case "browserId": browserId(c); break;
                    case "signInFailure": signInFailure(c); break;
                    case "saveAndDownload": saveAndDownload(c); break;
                    case "homePage": homePage(c); break;
                    case "seenPins": seenPins(c); break;
                    case "firebaseCertificate": firebaseCertificate(c); break;
                    case "ownAuthorities": ownAuthorities(c); break;
                    case "reportedPackage": reportedPackage(c); break;
                    case "fontResource": fontResource(c); break;
                    case "imageOrder": imageOrder(c); break;
                    case "closeupImage": closeupImage(c); break;
                    case "pageImage": pageImage(c); break;
                    case "originalRetry": originalRetry(c); break;
                    case "topicSuggestions": topicSuggestions(c); break;
                    case "inboxUpdates": inboxUpdates(c); break;
                    case "feedbackFlyout": feedbackFlyout(c); break;
                    case "recentSearchRows": recentSearchRows(c); break;
                    case "recentSearchHeading": recentSearchHeading(c); break;
                    case "closeupButtons": closeupButtons(c); break;
                    case "closeupSearchLabel": closeupSearchLabel(c); break;
                    case "closeupRemix": closeupRemix(c); break;
                    case "closeupActionBar": closeupRows(c, false); break;
                    case "closeupVisitSite": closeupRows(c, true); break;
                    case "closeupSaveButton": closeupSaveButton(c); break;
                    case "blackButtons": blackButtons(c); break;
                    case "blackSearchGuides": blackSearchGuides(c); break;
                    case "blackSettingsCard": blackSettingsCard(c); break;
                    case "blackSearchBubbles": blackSearchBubbles(c); break;
                    case "postedDate": postedDate(c); break;
                    case "closeupGate": closeupGate(c); break;
                    case "highlightRing": highlightRing(c); break;
                    case "screenSleep": screenSleep(c); break;
                    case "visualSearchThumbnails": visualSearchThumbnails(c); break;
                    case "relatedPinsFold": relatedPinsFold(c); break;
                    case "saveSheet": saveSheet(c); break;
                    case "blackSheets": blackSheets(c); break;
                    case "blackBoards": blackBoards(c); break;
                    case "suggestedBoard": suggestedBoard(c); break;
                    case "boardListHeight": boardListHeight(c); break;
                    case "boardOrder": boardOrder(c); break;
                    case "pinVideoAutoplay": pinVideoAutoplay(c); break;
                    case "pinVideoSound": pinVideoSound(c); break;
                    case "pinchZoom": pinchZoom(c); break;
                    case "boardMenu": boardMenu(c); break;
                    case "surveyPrompts": surveyPrompts(c); break;
                    case "popupBanners": popupBanners(c); break;
                    case "offlineBanner": offlineBanner(c); break;
                    case "refreshPill": refreshPill(c); break;
                    case "relatedPins": relatedPins(c); break;
                    case "creatorName": creatorName(c); break;
                    case "saveSound": saveSound(c); break;
                    case "pinInvites": pinInvites(c); break;
                    case "likeHistory": likeHistory(c); break;
                    case "commentHistory": commentHistory(c); break;
                    case "downloadToasts": downloadToasts(c); break;
                    case "blackToasts": blackToasts(c); break;
                    case "homeTabs": homeTabs(c); break;
                    case "searchLanding": searchLanding(c); break;
                    case "searchSuggestions": searchSuggestions(c); break;
                    case "experimentGroup": experimentGroup(c); break;
                    case "searchKeyboard": searchKeyboard(c); break;
                    case "pinMenuRows": pinMenuRows(c); break;
                    case "boardTabHeader": boardTabHeader(c); break;
                    case "boardTabCovers": boardTabCovers(c); break;
                    case "settings": settings(c); break;
                    default: fail("unknown mutation kind " + c.target);
                }
            }
            for (String cap : owners.keySet()) if (!coveredCapabilities.contains(cap)) fail("capability has no compiled mutation contract: " + cap);
            for (Map.Entry<String, List<FeatureSite>> entry : patched.ownCalls.entrySet()) for (FeatureSite site : entry.getValue())
                if (!claimed.contains(site.key())) fail("unselected, duplicated or misrouted call " + entry.getKey() + " in " + site.method);
            for (Map.Entry<String, FeatureEdits> entry : edits.entrySet()) {
                Method original = clean.methods.get(entry.getKey());
                Method changed = patched.methods.get(entry.getKey());
                if (original != null && !normalized(original, null).equals(normalized(changed, entry.getValue())))
                    fail(entry.getKey() + " changed original instructions, branches or exception ranges beyond its validated mutations");
            }
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 4 || args.length > 7) {
            System.err.println("usage: DexDiff <cleanApk> <patchedApk> <reportFile> <removalAllowlist> [<contracts> [<signedBase> [<selectedPatches>]]]");
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
        Set<String> selected = null;
        if (args.length > 6 && !args[6].equals("-")) {
            File file = new File(args[6]);
            if (!file.isFile()) throw new IllegalArgumentException("Selected patch file not found: " + file);
            selected = new TreeSet<>();
            for (String line : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
                String name = line.trim();
                if (name.isEmpty() || name.startsWith("#")) continue;
                if (!selected.add(name)) throw new IllegalArgumentException("Duplicated selected patch: " + name);
            }
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
        if (contracts.stream().anyMatch(c -> c.kind.equals("family"))) {
            FeatureIndex featurePatched = new FeatureIndex(patched);
            System.out.println("[diff] checking compiled family flags, capabilities and original fallbacks"
                    + (selected == null ? " (selection file not supplied)" : " against " + selected.size() + " selected patches"));
            FeatureCheck check = new FeatureCheck(new FeatureIndex(clean), featurePatched, selected);
            check.run(contracts);
            structural.computeIfAbsent("contract", k -> new ArrayList<>()).addAll(check.findings);
        } else if (selected != null) {
            structural.computeIfAbsent("contract", k -> new ArrayList<>()).add("contract: selected patches supplied without family contracts");
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
