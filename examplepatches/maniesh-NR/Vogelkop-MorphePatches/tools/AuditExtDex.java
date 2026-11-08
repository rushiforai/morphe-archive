import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

/**
 * Audits an extension DEX against the REAL Android framework:
 *
 *   javac -cp dexlib2.jar tools/AuditExtDex.java
 *   java  -cp .:dexlib2.jar:android-all.jar AuditExtDex extension.mpe
 *
 * The extension is compiled without the Android SDK, against a framework jar
 * (Robolectric's android-all). Every android/* class, method, field and
 * superclass referenced by the DEX is checked to exist on the real framework
 * via reflection, and every call's static/instance kind is checked against the
 * real method's modifiers. A reference that only exists in a compile-time stub
 * therefore fails here before it can ship.
 *
 * This is the guard for the v1.2.0 bug: android.util.Base64 was modeled as a
 * Kotlin object in tools/android-stubs, so the extension called a nonexistent
 * Base64.INSTANCE field and an instance decode(String, int) method. On device
 * that threw NoSuchFieldError inside SignatureHookApp's static initializer ->
 * ExceptionInInitializerError -> the app crashed at startup with a black
 * screen, before any UI.
 *
 * Exits non-zero if any reference does not resolve.
 */
public final class AuditExtDex {

    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("usage: AuditExtDex <dex-or-mpe-file>");
            System.exit(2);
        }
        DexFile dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(
                new File(args[0]), Opcodes.getDefault());

        List<String> problems = new ArrayList<>();
        int checkedTypes = 0;
        int checkedMethods = 0;
        int checkedFields = 0;

        for (ClassDef cls : dex.getClasses()) {
            if (cls.getSuperclass() != null) {
                checkedTypes++;
                checkClass(cls.getSuperclass(), "superclass of " + cls.getType(), problems);
            }
            for (String iface : cls.getInterfaces()) {
                checkedTypes++;
                checkClass(iface, "interface of " + cls.getType(), problems);
            }

            for (Method method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                for (Instruction insn : method.getImplementation().getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction)) continue;
                    Object ref = ((ReferenceInstruction) insn).getReference();
                    Opcode op = insn.getOpcode();

                    if (ref instanceof MethodReference) {
                        MethodReference mref = (MethodReference) ref;
                        if (!mref.getDefiningClass().startsWith("Landroid/")) continue;
                        checkedMethods++;
                        checkMethod(mref, op, problems);
                    } else if (ref instanceof FieldReference) {
                        FieldReference fref = (FieldReference) ref;
                        if (!fref.getDefiningClass().startsWith("Landroid/")) continue;
                        checkedFields++;
                        checkField(fref, problems);
                    }
                }
            }
        }

        System.out.printf(
                "Audited %d class refs, %d method refs, %d field refs into android/*.%n",
                checkedTypes, checkedMethods, checkedFields);

        if (!problems.isEmpty()) {
            System.err.println("FAIL: " + problems.size() + " unresolved reference(s):");
            for (String p : problems) System.err.println("  - " + p);
            System.exit(1);
        }
        System.out.println("PASS: every android/* reference resolves on the real framework.");
    }

    // ----- checks -----------------------------------------------------------

    private static void checkClass(String type, String where, List<String> problems) {
        if (!type.startsWith("L")) return; // primitives have no class object
        try {
            Class.forName(binaryName(type), false, AuditExtDex.class.getClassLoader());
        } catch (Throwable t) {
            problems.add(where + ": class " + type + " not found (" + t + ")");
        }
    }

    private static void checkMethod(MethodReference ref, Opcode op, List<String> problems) {
        Class<?> clazz = resolve(ref.getDefiningClass(), problems);
        if (clazz == null) return;

        List<? extends CharSequence> paramDescs = ref.getParameterTypes();
        Class<?>[] params = new Class[paramDescs.size()];
        for (int i = 0; i < params.length; i++) {
            Class<?> p = type(paramDescs.get(i).toString(), problems);
            if (p == null) return;
            params[i] = p;
        }

        StringBuilder paramList = new StringBuilder();
        for (CharSequence p : paramDescs) {
            if (paramList.length() > 0) paramList.append(',');
            paramList.append(p);
        }
        String pretty = ref.getDefiningClass() + "->" + ref.getName()
                + "(" + paramList + ")" + ref.getReturnType();

        if (ref.getName().equals("<init>")) {
            try {
                Constructor<?> c = clazz.getDeclaredConstructor(params);
                if (Modifier.isAbstract(clazz.getModifiers())) {
                    problems.add(pretty + ": cannot instantiate abstract class " + clazz.getName());
                }
                if (op == Opcode.INVOKE_STATIC) {
                    problems.add(pretty + ": constructor invoked with invoke-static (malformed dex)");
                }
            } catch (NoSuchMethodException e) {
                problems.add(pretty + ": no such constructor on " + clazz.getName());
            }
            return;
        }

        java.lang.reflect.Method found = findMethod(clazz, ref.getName(), params);
        if (found == null) {
            problems.add(pretty + ": no such method on " + clazz.getName()
                    + " (or its superclasses) - stub/framework shape mismatch");
            return;
        }

        boolean callIsStatic = op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE;
        boolean methodIsStatic = Modifier.isStatic(found.getModifiers());
        if (callIsStatic && !methodIsStatic) {
            problems.add(pretty + ": called statically but is an INSTANCE method on the real"
                    + " framework (the extension was compiled against a wrong-shaped stub)");
        } else if (!callIsStatic && methodIsStatic) {
            problems.add(pretty + ": called on an instance but is a STATIC method on the real"
                    + " framework (the extension was compiled against a wrong-shaped stub)");
        }
    }

    private static void checkField(FieldReference ref, List<String> problems) {
        Class<?> clazz = resolve(ref.getDefiningClass(), problems);
        if (clazz == null) return;

        String pretty = ref.getDefiningClass() + "->" + ref.getName() + ":" + ref.getType();

        if (ref.getName().equals("INSTANCE")) {
            problems.add(pretty + ": platform classes have no Kotlin-object INSTANCE field;"
                    + " compile the extension against the real framework, not an object stub");
        }

        for (Class<?> c = clazz; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(ref.getName());
                Class<?> want = type(ref.getType(), problems);
                if (want != null && !f.getType().equals(want)) {
                    problems.add(pretty + ": real field is " + f.getType().getName()
                            + ", the dex expects " + want.getName());
                }
                return; // found; the INSTANCE problem above (if any) was already recorded
            } catch (NoSuchFieldException ignored) {
                // walk up
            }
        }
        problems.add(pretty + ": no such field on " + clazz.getName());
    }

    // ----- helpers ----------------------------------------------------------

    private static java.lang.reflect.Method findMethod(Class<?> clazz, String name, Class<?>[] params) {
        for (Class<?> c = clazz; c != null; c = c.getSuperclass()) {
            for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                if (m.getName().equals(name) && java.util.Arrays.equals(m.getParameterTypes(), params)) {
                    return m;
                }
            }
        }
        return null;
    }

    private static Class<?> resolve(String type, List<String> problems) {
        try {
            return Class.forName(binaryName(type), false, AuditExtDex.class.getClassLoader());
        } catch (Throwable t) {
            problems.add("class " + type + " not found (" + t + ")");
            return null;
        }
    }

    private static Class<?> type(String desc, List<String> problems) {
        try {
            switch (desc) {
                case "V": return void.class;
                case "Z": return boolean.class;
                case "B": return byte.class;
                case "S": return short.class;
                case "C": return char.class;
                case "I": return int.class;
                case "J": return long.class;
                case "F": return float.class;
                case "D": return double.class;
                default:
                    if (desc.startsWith("[")) return Class.forName(desc.replace('/', '.'));
                    return Class.forName(binaryName(desc), false, AuditExtDex.class.getClassLoader());
            }
        } catch (Throwable t) {
            problems.add("cannot load type " + desc + " (" + t + ")");
            return null;
        }
    }

    private static String binaryName(String typeDesc) {
        return typeDesc.substring(1, typeDesc.length() - 1).replace('/', '.');
    }

    private AuditExtDex() {}
}
