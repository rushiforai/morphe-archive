import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.MethodHandleType;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.iface.value.*;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import javax.xml.stream.*;

/**
 * Resolves new DEX method/field uses against the compiled merged host and the Android public SDK.
 * Run alongside DexDiff, which remains responsible for register, control-flow and removal checks.
 *
 * java -cp desktop-cli.jar scripts/HostReferences.java clean.apk patched.apk report.txt
 *      android.jar api-versions.xml minSdk [host-reference-contracts.txt]
 *
 * No host-library prefix is exempt. Every added extension body is checked in full. Other bodies
 * are checked for opcode/reference occurrences absent from the clean method's multiset, so an
 * unchanged stock reference does not become a new extension failure. Supply the same merged clean
 * APK used for patching. SDK class files are read as metadata, never loaded or executed on the JDK.
 */
public class HostReferences {
    private static final String OWN = "Lapp/hushpinterest/extension/";
    private static final String OBJECT = "Ljava/lang/Object;";
    private static final String SDK_INT = "Landroid/os/Build$VERSION;->SDK_INT:I";
    private static String methodKey(MethodReference r) {
        StringBuilder b = new StringBuilder(r.getName()).append('(');
        for (CharSequence p : r.getParameterTypes()) b.append(p);
        return b.append(')').append(r.getReturnType()).toString();
    }
    private static String fieldKey(FieldReference r) { return r.getName() + ':' + r.getType(); }
    private static String descriptor(String internal) { return 'L' + internal + ';'; }
    private static boolean flag(int flags, AccessFlags wanted) { return wanted.isSet(flags); }
    private static String pkg(String type) {
        int slash = type.lastIndexOf('/');
        return slash < 0 ? "" : type.substring(0, slash);
    }

    private static final class Member {
        final String owner, key;
        final int flags;
        Member(String owner, String key, int flags) { this.owner = owner; this.key = key; this.flags = flags; }
    }
    private static final class Type {
        final String name, parent;
        final int flags;
        final List<String> interfaces;
        final Map<String, Member> methods = new TreeMap<>(), fields = new TreeMap<>();
        Type(String name, int flags, String parent, List<String> interfaces) {
            this.name = name; this.flags = flags; this.parent = parent; this.interfaces = interfaces;
        }
        boolean isInterface() { return flag(flags, AccessFlags.INTERFACE); }
        String shape() {
            StringBuilder b = new StringBuilder(name).append('/').append(flags).append('/').append(parent).append(interfaces);
            methods.forEach((k, v) -> b.append(" M").append(k).append(':').append(v.flags));
            fields.forEach((k, v) -> b.append(" F").append(k).append(':').append(v.flags));
            return b.toString();
        }
    }
    private static final class Body {
        final String entry;
        final Method method;
        final List<Instruction> code = new ArrayList<>();
        final List<Integer> pcs = new ArrayList<>();
        boolean loaded;
        Body(String entry, Method method) {
            this.entry = entry; this.method = method;
        }
        void load() {
            if (loaded) return;
            loaded = true;
            if (method.getImplementation() != null) {
                int pc = 0;
                for (Instruction i : method.getImplementation().getInstructions()) {
                    code.add(i); pcs.add(pc); pc += i.getCodeUnits();
                }
            }
        }
        void discardCode() { code.clear(); pcs.clear(); loaded = false; }
        String sig() { return method.getDefiningClass() + "->" + methodKey(method); }
    }
    private static final class Dex {
        final Map<String, Type> types = new HashMap<>();
        final Map<String, List<Body>> methods = new HashMap<>();
        final List<Body> bodies = new ArrayList<>();
        Dex(File input) throws Exception {
            // getDefault() is API 20 in the pinned library. Let the DEX header choose its
            // opcode table, or DEX 039 method handles become NOPs and escape the checks.
            MultiDexContainer<? extends DexFile> container = DexFileFactory.loadDexContainer(input, null);
            List<String> entries = new ArrayList<>(container.getDexEntryNames());
            Collections.sort(entries);
            for (String entry : entries) for (ClassDef c : container.getEntry(entry).getDexFile().getClasses()) {
                Type type = new Type(c.getType(), c.getAccessFlags(), c.getSuperclass(), new ArrayList<>(c.getInterfaces()));
                for (Field f : c.getFields()) type.fields.put(fieldKey(f), new Member(c.getType(), fieldKey(f), f.getAccessFlags()));
                for (Method m : c.getMethods()) {
                    String key = methodKey(m);
                    type.methods.put(key, new Member(c.getType(), key, m.getAccessFlags()));
                    Body body = new Body(entry, m);
                    bodies.add(body); methods.computeIfAbsent(body.sig(), unused -> new ArrayList<>()).add(body);
                }
                Type old = types.putIfAbsent(type.name, type);
                if (old != null && !old.shape().equals(type.shape()))
                    throw new IllegalArgumentException("Conflicting class declarations for " + type.name + " in " + entry);
            }
            if (types.isEmpty()) throw new IllegalArgumentException("No DEX classes in " + input);
        }
    }

    /** Reads only the class-file declaration tables. This works with the SDK's stub JAR on JDK 21. */
    private static Type classFile(InputStream stream) throws Exception {
        DataInputStream in = new DataInputStream(new BufferedInputStream(stream));
        if (in.readInt() != 0xcafebabe) throw new IOException("Invalid SDK class file");
        in.readUnsignedShort(); in.readUnsignedShort();
        Object[] pool = new Object[in.readUnsignedShort()];
        for (int p = 1; p < pool.length; p++) {
            int tag = in.readUnsignedByte();
            switch (tag) {
                case 1: pool[p] = in.readUTF(); break;
                case 7: pool[p] = in.readUnsignedShort(); break;
                case 3: case 4: case 9: case 10: case 11: case 12: case 17: case 18: in.skipNBytes(4); break;
                case 5: case 6: in.skipNBytes(8); p++; break;
                case 8: case 16: case 19: case 20: in.skipNBytes(2); break;
                case 15: in.skipNBytes(3); break;
                default: throw new IOException("Unsupported SDK constant-pool tag " + tag);
            }
        }
        int flags = in.readUnsignedShort(), own = in.readUnsignedShort(), parent = in.readUnsignedShort();
        String name = descriptor((String) pool[(Integer) pool[own]]);
        String base = parent == 0 ? null : descriptor((String) pool[(Integer) pool[parent]]);
        List<String> interfaces = new ArrayList<>();
        for (int n = in.readUnsignedShort(); n > 0; n--) interfaces.add(descriptor((String) pool[(Integer) pool[in.readUnsignedShort()]]));
        Type type = new Type(name, flags, base, interfaces);
        for (int table = 0; table < 2; table++) for (int n = in.readUnsignedShort(); n > 0; n--) {
            int access = in.readUnsignedShort();
            String member = (String) pool[in.readUnsignedShort()], signature = (String) pool[in.readUnsignedShort()];
            String key = member + (table == 0 ? ":" : "") + signature;
            (table == 0 ? type.fields : type.methods).put(key, new Member(name, key, access));
            for (int attributes = in.readUnsignedShort(); attributes > 0; attributes--) {
                in.readUnsignedShort(); in.skipNBytes(Integer.toUnsignedLong(in.readInt()));
            }
        }
        return type;
    }

    private static final class Api {
        final int since, removed;
        Api(int since, int removed) { this.since = since; this.removed = removed; }
    }
    private static final class Platform implements AutoCloseable {
        final ZipFile jar;
        final Map<String, Type> types = new HashMap<>();
        final Map<String, Api> history = new HashMap<>();
        final Set<String> absent = new HashSet<>();
        Platform(File androidJar, File apiVersions) throws Exception {
            jar = new ZipFile(androidJar);
            XMLInputFactory factory = XMLInputFactory.newFactory();
            factory.setProperty(XMLInputFactory.SUPPORT_DTD, false);
            factory.setProperty("javax.xml.stream.isSupportingExternalEntities", false);
            try (InputStream in = Files.newInputStream(apiVersions.toPath())) {
                XMLStreamReader xml = factory.createXMLStreamReader(in);
                String type = null; int since = 1;
                while (xml.hasNext()) {
                    int event = xml.next();
                    if (event == XMLStreamConstants.END_ELEMENT && xml.getLocalName().equals("class")) type = null;
                    if (event != XMLStreamConstants.START_ELEMENT) continue;
                    String tag = xml.getLocalName();
                    if (tag.equals("class")) {
                        type = descriptor(xml.getAttributeValue(null, "name")); since = number(xml, "since", 1);
                        history.put(type, new Api(since, number(xml, "removed", Integer.MAX_VALUE)));
                    } else if (type != null && (tag.equals("method") || tag.equals("field"))) {
                        history.put(type + "->" + xml.getAttributeValue(null, "name"),
                                new Api(number(xml, "since", since), number(xml, "removed", Integer.MAX_VALUE)));
                    }
                }
                xml.close();
            }
            if (history.isEmpty()) throw new IllegalArgumentException("No API class history in " + apiVersions);
        }
        static int number(XMLStreamReader xml, String name, int fallback) {
            String value = xml.getAttributeValue(null, name); return value == null ? fallback : Integer.parseInt(value);
        }
        Type get(String type) throws Exception {
            if (types.containsKey(type)) return types.get(type);
            if (absent.contains(type) || !type.startsWith("L") || !type.endsWith(";")) return null;
            ZipEntry entry = jar.getEntry(type.substring(1, type.length() - 1) + ".class");
            if (entry == null) { absent.add(type); return null; }
            try (InputStream in = jar.getInputStream(entry)) {
                Type found = classFile(in); types.put(type, found); return found;
            }
        }
        Api member(Member member, boolean field) throws Exception {
            return member(member.owner, member.key, field, new HashSet<>());
        }
        Api member(String owner, String key, boolean field, Set<String> seen) throws Exception {
            if (owner == null || !seen.add(owner)) return null;
            Api type = history.get(owner);
            if (type == null) return null;
            String historyKey = field ? key.substring(0, key.indexOf(':')) : key;
            Api api = history.get(owner + "->" + historyKey);
            // API history elides overrides available through an inherited public declaration.
            // Resolve that declaration's history rather than treating an absent row as API 1.
            if (api == null && !field && !key.startsWith("<")) {
                Type declaration = get(owner);
                if (declaration != null) {
                    api = member(declaration.parent, key, false, seen);
                    for (String parent : declaration.interfaces) {
                        Api inherited = member(parent, key, false, seen);
                        if (inherited != null && (api == null || inherited.since < api.since)) api = inherited;
                    }
                }
            }
            if (api == null) return null;
            return new Api(Math.max(api.since, type.since), Math.min(api.removed, type.removed));
        }
        public void close() throws IOException { jar.close(); }
    }

    private static final class Use {
        final Body body;
        final int index;
        final String op;
        final Reference ref;
        Use(Body body, int index, String op, Reference ref) { this.body = body; this.index = index; this.op = op; this.ref = ref; }
        String owner() { return ref instanceof FieldReference ? ((FieldReference) ref).getDefiningClass() : ((MethodReference) ref).getDefiningClass(); }
        String key() { return op + " " + ref; }
        String where() {
            String original = body.code.get(index).getOpcode().name;
            return body.sig() + " [" + body.entry + " pc=" + body.pcs.get(index) + "] "
                    + (original.equals(op) ? "" : original + " -> ") + key();
        }
    }
    private static void uses(Body body, int index, String op, Reference ref, List<Use> uses) {
        if (ref instanceof MethodReference || ref instanceof FieldReference) uses.add(new Use(body, index, op, ref));
        else if (ref instanceof MethodHandleReference) {
            MethodHandleReference h = (MethodHandleReference) ref;
            String kind;
            switch (h.getMethodHandleType()) {
                case MethodHandleType.STATIC_GET: kind = "sget-handle"; break;
                case MethodHandleType.STATIC_PUT: kind = "sput-handle"; break;
                case MethodHandleType.INSTANCE_GET: kind = "iget-handle"; break;
                case MethodHandleType.INSTANCE_PUT: kind = "iput-handle"; break;
                case MethodHandleType.INVOKE_STATIC: kind = "invoke-static-handle"; break;
                case MethodHandleType.INVOKE_INSTANCE: kind = "invoke-virtual-handle"; break;
                case MethodHandleType.INVOKE_INTERFACE: kind = "invoke-interface-handle"; break;
                case MethodHandleType.INVOKE_CONSTRUCTOR: kind = "invoke-direct-constructor-handle"; break;
                case MethodHandleType.INVOKE_DIRECT: kind = "invoke-direct-handle"; break;
                default: throw new IllegalArgumentException("Unknown method-handle type in " + body.sig());
            }
            uses(body, index, kind, h.getMemberReference(), uses);
        } else if (ref instanceof CallSiteReference) {
            CallSiteReference site = (CallSiteReference) ref;
            uses(body, index, op, site.getMethodHandle(), uses);
            for (EncodedValue value : site.getExtraArguments()) {
                if (value instanceof MethodHandleEncodedValue) uses(body, index, op, ((MethodHandleEncodedValue) value).getValue(), uses);
                else if (value instanceof MethodEncodedValue) uses(body, index, "unknown-method-handle", ((MethodEncodedValue) value).getValue(), uses);
                else if (value instanceof FieldEncodedValue) uses(body, index, "unknown-field-handle", ((FieldEncodedValue) value).getValue(), uses);
            }
        }
    }
    private static List<Use> references(Body body) {
        body.load();
        List<Use> uses = new ArrayList<>();
        for (int i = 0; i < body.code.size(); i++) if (body.code.get(i) instanceof ReferenceInstruction) {
            ReferenceInstruction instruction = (ReferenceInstruction) body.code.get(i);
            uses(body, i, instruction.getOpcode().name, instruction.getReference(), uses);
            if (instruction instanceof DualReferenceInstruction)
                uses(body, i, instruction.getOpcode().name, ((DualReferenceInstruction) instruction).getReference2(), uses);
        }
        return uses;
    }

    private static final class Resolver {
        final Dex dex;
        final Platform platform;
        Resolver(Dex dex, Platform platform) { this.dex = dex; this.platform = platform; }
        Type get(String name) throws Exception {
            if (name.startsWith("[")) {
                Type array = new Type(name, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT,
                        List.of("Ljava/lang/Cloneable;", "Ljava/io/Serializable;"));
                array.methods.put("clone()Ljava/lang/Object;", new Member(name, "clone()Ljava/lang/Object;", AccessFlags.PUBLIC.getValue()));
                return array;
            }
            Type own = dex.types.get(name); return own == null ? platform.get(name) : own;
        }
        boolean subtype(String child, String parent) throws Exception {
            return subtype(child, parent, new HashSet<>());
        }
        boolean subtype(String child, String parent, Set<String> seen) throws Exception {
            if (child == null || !seen.add(child)) return false;
            if (child.equals(parent)) return true;
            Type t = get(child); if (t == null) return false;
            if (subtype(t.parent, parent, seen)) return true;
            for (String i : t.interfaces) if (subtype(i, parent, seen)) return true;
            return false;
        }
        Member find(String owner, String key, boolean field, Set<String> seen) throws Exception {
            if (owner == null || !seen.add(owner)) return null;
            Type type = get(owner);
            if (type == null) throw new IllegalArgumentException("missing declaring class or ancestor " + owner);
            Member direct = (field ? type.fields : type.methods).get(key);
            if (direct != null) return direct;
            if (!field && (key.startsWith("<init>(") || key.startsWith("<clinit>("))) return null;
            if (field) for (String i : type.interfaces) { Member hit = find(i, key, true, seen); if (hit != null) return hit; }
            Member parent = find(type.parent, key, field, seen); if (parent != null) return parent;
            if (!field) for (String i : type.interfaces) {
                Member hit = find(i, key, false, seen);
                if (hit != null && !flag(hit.flags, AccessFlags.STATIC) && !flag(hit.flags, AccessFlags.PRIVATE)) return hit;
            }
            return null;
        }
        void visible(int flags, String owner, String caller, String what) throws Exception {
            if (flag(flags, AccessFlags.PUBLIC) || caller.equals(owner)) return;
            if (flag(flags, AccessFlags.PRIVATE)) throw new IllegalArgumentException(what + " is private to " + owner);
            if (pkg(owner).equals(pkg(caller))) return;
            if (flag(flags, AccessFlags.PROTECTED) && subtype(caller, owner)) return;
            throw new IllegalArgumentException(what + " is inaccessible from " + caller);
        }
        Member resolve(Use use) throws Exception {
            boolean field = use.ref instanceof FieldReference;
            String owner = use.owner();
            String key = field ? fieldKey((FieldReference) use.ref) : methodKey((MethodReference) use.ref);
            Type declared = get(owner);
            if (declared == null) throw new IllegalArgumentException("missing declaring class " + owner);
            String caller = use.body.method.getDefiningClass();
            visible(declared.flags, owner, caller, "referenced class");
            Member target = find(owner, key, field, new HashSet<>());
            if (target == null) throw new IllegalArgumentException("missing " + (field ? "field " : "method ") + owner + "->" + key);
            visible(target.flags, target.owner, caller, "target");
            boolean isStatic = flag(target.flags, AccessFlags.STATIC);
            if (field) {
                if (!use.op.startsWith("sget") && !use.op.startsWith("sput") && !use.op.startsWith("iget") && !use.op.startsWith("iput"))
                    throw new IllegalArgumentException("unsupported field reference opcode " + use.op);
                if (isStatic != use.op.startsWith("s")) throw new IllegalArgumentException("static/instance field shape mismatch for " + target.owner + "->" + key);
                String value = ((FieldReference) use.ref).getType();
                String suffix = value.startsWith("L") || value.startsWith("[") ? "-object" : value.equals("J") || value.equals("D") ? "-wide"
                        : value.equals("Z") ? "-boolean" : value.equals("B") ? "-byte" : value.equals("C") ? "-char" : value.equals("S") ? "-short" : "";
                if (!use.op.endsWith("-handle") && !use.op.substring(4).equals(suffix)) throw new IllegalArgumentException("field value shape mismatch: " + value + " requires " + use.op.substring(0, 4) + suffix);
                if (use.op.contains("put") && flag(target.flags, AccessFlags.FINAL)
                        && (!caller.equals(target.owner) || !use.body.method.getName().equals(isStatic ? "<clinit>" : "<init>")))
                    throw new IllegalArgumentException("final field write outside its initializer");
            } else {
                if (!use.op.startsWith("invoke-")) throw new IllegalArgumentException("unsupported method reference opcode " + use.op);
                if (isStatic != use.op.startsWith("invoke-static")) throw new IllegalArgumentException("static/instance invocation shape mismatch for " + target.owner + "->" + key);
                if (key.startsWith("<clinit>(")) throw new IllegalArgumentException("class initializer cannot be invoked");
                boolean direct = use.op.startsWith("invoke-direct"), constructor = key.startsWith("<init>(");
                if (use.op.equals("invoke-direct-constructor-handle") && !constructor) throw new IllegalArgumentException("constructor handle must name <init>");
                if (constructor && !direct) throw new IllegalArgumentException("constructor requires invoke-direct");
                if (direct && !constructor && !flag(target.flags, AccessFlags.PRIVATE)) throw new IllegalArgumentException("invoke-direct target is neither private nor a constructor");
                if (!direct && !isStatic && flag(target.flags, AccessFlags.PRIVATE)) throw new IllegalArgumentException("private instance method requires invoke-direct");
                if (use.op.startsWith("invoke-interface") && !declared.isInterface()) throw new IllegalArgumentException("invoke-interface owner is a class");
                if (use.op.startsWith("invoke-virtual") && declared.isInterface()) throw new IllegalArgumentException("invoke-virtual owner is an interface");
                if (use.op.startsWith("invoke-super")) {
                    if (caller.equals(owner) || !subtype(caller, owner)) throw new IllegalArgumentException("invoke-super owner is not a superclass or superinterface");
                    Type callingType = get(caller);
                    if (!declared.isInterface()) target = find(callingType.parent, key, false, new HashSet<>());
                    if (target == null || flag(target.flags, AccessFlags.ABSTRACT)) throw new IllegalArgumentException("invoke-super has no concrete target");
                }
                if (!use.op.endsWith("-handle")) {
                    int words = isStatic ? 0 : 1;
                    Instruction i = use.body.code.get(use.index);
                    List<? extends CharSequence> parameters = ((MethodReference) use.ref).getParameterTypes();
                    if (use.op.startsWith("invoke-polymorphic")) {
                        if ((!owner.equals("Ljava/lang/invoke/MethodHandle;") && !owner.equals("Ljava/lang/invoke/VarHandle;"))
                                || !flag(target.flags, AccessFlags.NATIVE) || !flag(target.flags, AccessFlags.VARARGS)
                                || !(i instanceof DualReferenceInstruction) || !(((DualReferenceInstruction) i).getReference2() instanceof MethodProtoReference))
                            throw new IllegalArgumentException("invoke-polymorphic target or prototype is incompatible");
                        parameters = ((MethodProtoReference) ((DualReferenceInstruction) i).getReference2()).getParameterTypes();
                    }
                    for (CharSequence p : parameters) words += p.toString().equals("J") || p.toString().equals("D") ? 2 : 1;
                    int count = i instanceof FiveRegisterInstruction ? ((FiveRegisterInstruction) i).getRegisterCount()
                            : i instanceof RegisterRangeInstruction ? ((RegisterRangeInstruction) i).getRegisterCount() : -1;
                    if (count != words) throw new IllegalArgumentException("invocation needs " + words + " register words but has " + count);
                }
            }
            return target;
        }
    }

    /** Conservative SDK_INT provenance and lower bounds, merged across normal and exception edges. */
    private static final class State {
        static final int UNKNOWN = Integer.MIN_VALUE, SDK = Integer.MAX_VALUE;
        int api;
        final int[] regs;
        State(int api, int count) { this.api = api; regs = new int[count]; Arrays.fill(regs, UNKNOWN); }
        State(State old) { api = old.api; regs = old.regs.clone(); }
        boolean merge(State incoming) {
            boolean changed = false;
            if (incoming.api < api) { api = incoming.api; changed = true; }
            for (int i = 0; i < regs.length; i++) if (regs[i] != incoming.regs[i] && regs[i] != UNKNOWN) {
                regs[i] = UNKNOWN; changed = true;
            }
            return changed;
        }
        int read(int register) { return register >= 0 && register < regs.length ? regs[register] : UNKNOWN; }
        void write(int register, int value) { if (register >= 0 && register < regs.length) regs[register] = value; }
    }
    private static final class Flow {
        final Body body;
        final State[] before;
        final Map<Integer, Integer> positions = new HashMap<>();
        final ArrayDeque<Integer> pending = new ArrayDeque<>();
        Flow(Body body, int floor) {
            this.body = body; before = new State[body.code.size()];
            for (int i = 0; i < body.pcs.size(); i++) positions.put(body.pcs.get(i), i);
            if (body.code.isEmpty()) return;
            offer(0, new State(floor, body.method.getImplementation().getRegisterCount()));
            while (!pending.isEmpty()) {
                int index = pending.removeFirst(), pc = body.pcs.get(index);
                Instruction instruction = body.code.get(index);
                State start = before[index], out = new State(start);
                String op = instruction.getOpcode().name;
                if (instruction.getOpcode().setsRegister() && instruction instanceof OneRegisterInstruction) {
                    int register = ((OneRegisterInstruction) instruction).getRegisterA(), value = State.UNKNOWN;
                    if (instruction instanceof NarrowLiteralInstruction && op.startsWith("const") && !op.startsWith("const-wide"))
                        value = ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                    else if (op.equals("sget") && instruction instanceof ReferenceInstruction
                            && ((ReferenceInstruction) instruction).getReference().toString().equals(SDK_INT)) value = State.SDK;
                    else if (op.startsWith("move") && instruction instanceof TwoRegisterInstruction && !op.startsWith("move-wide"))
                        value = start.read(((TwoRegisterInstruction) instruction).getRegisterB());
                    out.write(register, value);
                    if (instruction.getOpcode().setsWideRegister()) out.write(register + 1, State.UNKNOWN);
                }
                if (instruction.getOpcode().canThrow()) for (TryBlock<? extends ExceptionHandler> block : body.method.getImplementation().getTryBlocks()) {
                    if (pc >= block.getStartCodeAddress() && pc < block.getStartCodeAddress() + block.getCodeUnitCount())
                        for (ExceptionHandler handler : block.getExceptionHandlers()) at(handler.getHandlerCodeAddress(), start);
                }
                if (op.startsWith("goto")) at(pc + ((OffsetInstruction) instruction).getCodeOffset(), out);
                else if (op.startsWith("if-")) {
                    State taken = new State(out), fall = new State(out);
                    bound(instruction, start, taken, fall);
                    at(pc + ((OffsetInstruction) instruction).getCodeOffset(), taken);
                    if (index + 1 < before.length) offer(index + 1, fall);
                } else if (instruction instanceof OffsetInstruction && (op.equals("packed-switch") || op.equals("sparse-switch"))) {
                    Integer payload = positions.get(pc + ((OffsetInstruction) instruction).getCodeOffset());
                    if (payload == null || !(body.code.get(payload) instanceof SwitchPayload))
                        throw new IllegalArgumentException("Invalid switch payload in " + body.sig() + " at " + pc);
                    for (SwitchElement element : ((SwitchPayload) body.code.get(payload)).getSwitchElements()) {
                        State branch = new State(out);
                        if (start.read(((OneRegisterInstruction) instruction).getRegisterA()) == State.SDK)
                            branch.api = Math.max(branch.api, element.getKey());
                        at(pc + element.getOffset(), branch);
                    }
                    if (index + 1 < before.length) offer(index + 1, out);
                } else if (instruction.getOpcode().canContinue() && index + 1 < before.length) offer(index + 1, out);
            }
        }
        void at(int pc, State state) {
            Integer index = positions.get(pc);
            if (index == null) throw new IllegalArgumentException("Invalid flow target " + pc + " in " + body.sig());
            offer(index, state);
        }
        void offer(int index, State state) {
            if (before[index] == null) { before[index] = new State(state); pending.add(index); }
            else if (before[index].merge(state)) pending.add(index);
        }
        static void bound(Instruction instruction, State state, State taken, State fall) {
            String op = instruction.getOpcode().name;
            int a = state.read(((OneRegisterInstruction) instruction).getRegisterA());
            int b = instruction instanceof TwoRegisterInstruction ? state.read(((TwoRegisterInstruction) instruction).getRegisterB()) : 0;
            if (a != State.SDK && b == State.SDK) {
                int tmp = a; a = b; b = tmp;
                if (op.startsWith("if-lt")) op = "if-gt";
                else if (op.startsWith("if-le")) op = "if-ge";
                else if (op.startsWith("if-gt")) op = "if-lt";
                else if (op.startsWith("if-ge")) op = "if-le";
            }
            if (a != State.SDK || b == State.UNKNOWN || b == State.SDK || b < 1 || b > 10000) return;
            if (op.startsWith("if-ge") || op.startsWith("if-eq")) taken.api = Math.max(taken.api, b);
            else if (op.startsWith("if-gt")) taken.api = Math.max(taken.api, b + 1);
            if (op.startsWith("if-lt") || op.startsWith("if-ne")) fall.api = Math.max(fall.api, b);
            else if (op.startsWith("if-le")) fall.api = Math.max(fall.api, b + 1);
        }
        int apiAt(int index, int fallback) { return before[index] == null ? fallback : before[index].api; }
    }

    /**
     * Private helpers and synthetic static helpers have a closed set of direct DEX callers.
     * Start at minSdk, then raise a helper only when every caller proves the same higher floor.
     * Starting low prevents a recursive group from inventing its own guard. A method handle
     * escapes that closed call graph, so its target stays at minSdk. RequiresApi annotations
     * alone are deliberately not accepted as evidence of a runtime guard.
     */
    private static final class Guards {
        final int floor;
        final Map<String, Integer> reviewed;
        final Set<String> escaped = new TreeSet<>();
        final Map<String, Integer> entries = new HashMap<>();
        final Map<String, List<Use>> callers = new TreeMap<>();
        final Map<Body, Flow> flows = new IdentityHashMap<>();
        final Map<Body, Integer> flowEntries = new IdentityHashMap<>();
        Guards(Dex dex, List<Use> checked, int floor, Map<String, Integer> reviewed) {
            this.floor = floor; this.reviewed = reviewed;
            reviewed.forEach((method, api) -> entries.put(method, Math.max(floor, api)));
            Set<String> closed = new HashSet<>();
            for (Body b : dex.bodies) if (b.method.getDefiningClass().startsWith(OWN) && !b.method.getName().startsWith("<")) {
                int flags = b.method.getAccessFlags();
                Type type = dex.types.get(b.method.getDefiningClass());
                if (flag(flags, AccessFlags.PRIVATE) || flag(flags, AccessFlags.STATIC)
                        && (flag(flags, AccessFlags.SYNTHETIC) || flag(type.flags, AccessFlags.SYNTHETIC))) closed.add(b.sig());
            }
            for (Use use : checked) if (use.ref instanceof MethodReference) {
                String target = ((MethodReference) use.ref).getDefiningClass() + "->" + methodKey((MethodReference) use.ref);
                if (closed.contains(target) || reviewed.containsKey(target)) {
                    callers.computeIfAbsent(target, unused -> new ArrayList<>()).add(use);
                    if (use.op.endsWith("-handle")) escaped.add(target);
                }
            }
            boolean changed;
            do {
                changed = false;
                for (Map.Entry<String, List<Use>> e : callers.entrySet()) if (!escaped.contains(e.getKey()) && !reviewed.containsKey(e.getKey())) {
                    int minimum = Integer.MAX_VALUE;
                    for (Use caller : e.getValue()) minimum = Math.min(minimum, at(caller));
                    if (minimum > entries.getOrDefault(e.getKey(), floor)) {
                        entries.put(e.getKey(), minimum); changed = true;
                    }
                }
            } while (changed);
        }
        int at(Use use) {
            int entry = entries.getOrDefault(use.body.sig(), floor);
            if (!flows.containsKey(use.body) || flowEntries.get(use.body) != entry) {
                flows.put(use.body, new Flow(use.body, entry)); flowEntries.put(use.body, entry);
            }
            return flows.get(use.body).apiAt(use.index, entry);
        }
        List<String> reviews() {
            List<String> review = new ArrayList<>();
            for (String method : escaped) for (Use caller : callers.get(method)) if (caller.op.endsWith("-handle"))
                review.add(method + " retains minSdk " + floor + " because it escapes through " + caller.where());
            new TreeMap<>(entries).forEach((method, minimum) -> {
                StringBuilder b = new StringBuilder(method).append(" entry SDK >= ").append(minimum);
                b.append(reviewed.containsKey(method) ? " (explicit API-entry contract)" : " from every direct caller");
                List<Use> incoming = callers.getOrDefault(method, List.of());
                if (incoming.isEmpty()) b.append(" (no direct callers)");
                for (Use caller : incoming) b.append("; ").append(caller.body.sig()).append(" pc=").append(caller.body.pcs.get(caller.index)).append(" SDK >= ").append(at(caller));
                review.add(b.toString());
            });
            return review;
        }
    }

    private static Map<String, Integer> contracts(File file, Dex dex, int floor) throws Exception {
        Map<String, Integer> entries = new TreeMap<>();
        int row = 0;
        for (String raw : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
            row++; String line = raw.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            String[] parts = line.split("\\s+");
            if (parts.length != 4 || !parts[0].equals("api-entry") || !parts[2].equals("since"))
                throw new IllegalArgumentException("Invalid API-entry contract at line " + row);
            int since = Integer.parseInt(parts[3]);
            List<Body> bodies = dex.methods.get(parts[1]);
            if (since < 1 || !parts[1].startsWith(OWN) || bodies == null || bodies.size() != 1
                    || !flag(bodies.get(0).method.getAccessFlags(), AccessFlags.STATIC) || entries.putIfAbsent(parts[1], since) != null)
                throw new IllegalArgumentException("Stale, duplicate or invalid API-entry contract at line " + row + ": " + parts[1]);
        }
        return entries;
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 6 || args.length > 7) throw new IllegalArgumentException("Usage: HostReferences.java clean.apk patched.apk report.txt android.jar api-versions.xml minSdk [contracts]");
        File report = new File(args[2]);
        List<String> findings = new ArrayList<>(), guarded = new ArrayList<>(), entries = new ArrayList<>();
        int checked = 0, framework = 0, host = 0;
        try (Platform platform = new Platform(new File(args[3]), new File(args[4]))) {
            int floor = Integer.parseInt(args[5]);
            if (floor < 1) throw new IllegalArgumentException("minSdk must be positive");
            Dex clean = new Dex(new File(args[0])), patched = new Dex(new File(args[1]));
            if (clean.types.keySet().stream().anyMatch(t -> t.startsWith(OWN))) throw new IllegalArgumentException("Clean input already contains extension classes");
            if (patched.types.keySet().stream().noneMatch(t -> t.startsWith(OWN))) throw new IllegalArgumentException("Patched input contains no extension classes");
            Resolver resolver = new Resolver(patched, platform);
            List<Use> inserted = new ArrayList<>();
            for (Map.Entry<String, List<Body>> entry : patched.methods.entrySet()) {
                Map<String, Integer> oldUses = new HashMap<>();
                for (Body body : clean.methods.getOrDefault(entry.getKey(), List.of())) {
                    for (Use use : references(body)) oldUses.merge(use.key(), 1, Integer::sum);
                    body.discardCode();
                }
                for (Body body : entry.getValue()) {
                    boolean keep = false;
                    for (Use use : references(body)) {
                        if (!body.method.getDefiningClass().startsWith(OWN) && oldUses.getOrDefault(use.key(), 0) > 0) {
                            oldUses.computeIfPresent(use.key(), (key, count) -> count - 1); continue;
                        }
                        inserted.add(use); keep = true;
                    }
                    if (!keep) body.discardCode();
                }
            }
            Map<String, Integer> reviewed = args.length == 7 ? contracts(new File(args[6]), patched, floor) : Map.of();
            Guards guards = new Guards(patched, inserted, floor, reviewed);
            entries.addAll(guards.reviews());
            for (Use use : inserted) {
                checked++;
                try {
                    Member target = resolver.resolve(use);
                    Integer requirement = reviewed.get(target.owner + "->" + target.key);
                    if (requirement != null && (use.op.endsWith("-handle") || guards.at(use) < requirement))
                        throw new IllegalArgumentException("API-entry contract requires SDK >= " + requirement + "; caller proves " + guards.at(use));
                    String owner = use.owner();
                    boolean frameworkOwner = !patched.types.containsKey(owner) && !owner.startsWith("[");
                    boolean frameworkTarget = !patched.types.containsKey(target.owner) && !target.owner.startsWith("[");
                    if (frameworkOwner || frameworkTarget) {
                        framework++;
                        // Inherited members still require the class named by the DEX reference.
                        Api api = frameworkOwner ? platform.history.get(owner) : null;
                        if (frameworkOwner && api == null) throw new IllegalArgumentException("SDK referenced class has no API history: " + owner);
                        if (frameworkTarget) {
                            Api declaration = platform.member(target, use.ref instanceof FieldReference);
                            if (declaration == null) throw new IllegalArgumentException("SDK declaration has no API history: " + target.owner + "->" + target.key);
                            api = api == null ? declaration : new Api(Math.max(api.since, declaration.since), Math.min(api.removed, declaration.removed));
                        }
                        if (api.removed != Integer.MAX_VALUE) throw new IllegalArgumentException("SDK member removed at API " + api.removed);
                        if (api.since > floor) {
                            int proven = guards.at(use);
                            if (proven < api.since) throw new IllegalArgumentException("requires API " + api.since + " above minSdk " + floor + "; proven SDK >= " + proven + ", no sufficient SDK guard");
                            guarded.add(use.where() + " => available since API " + api.since + ", proven SDK >= " + proven);
                        }
                    } else host++;
                } catch (IllegalArgumentException e) { findings.add(use.where() + " => " + e.getMessage()); }
            }
            if (checked == 0) throw new IllegalArgumentException("No inserted method or field references were checked");
        } catch (Exception e) {
            findings.add("input: " + e.getClass().getSimpleName() + ": " + e.getMessage());
        }
        Collections.sort(findings); Collections.sort(guarded);
        List<String> lines = new ArrayList<>();
        lines.add("[host-references] checked=" + checked + " merged=" + host + " framework=" + framework + " guarded=" + guarded.size() + " findings=" + findings.size());
        for (String review : entries) lines.add("entry: " + review);
        for (String review : guarded) lines.add("guarded: " + review);
        for (String finding : findings) lines.add("FAIL: " + finding);
        Files.write(report.toPath(), lines, StandardCharsets.UTF_8);
        System.out.println(lines.get(0));
        for (String finding : findings.subList(0, Math.min(20, findings.size()))) System.out.println("[host-references] FAIL: " + finding);
        if (findings.size() > 20) System.out.println("[host-references] Remaining findings are in " + report);
        System.exit(findings.isEmpty() ? 0 : 1);
    }
}
