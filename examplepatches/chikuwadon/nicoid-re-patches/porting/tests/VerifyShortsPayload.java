import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Check the real patched DEX contracts, including native menu and cookie access. */
public final class VerifyShortsPayload {
    static final Map<String,ClassDef> classes = new HashMap<>();
    static String key(MethodReference m) { return m.getName() + m.getParameterTypes() + m.getReturnType(); }
    static Method method(String type, String name, String ret, String... parameters) {
        for (Method m : classes.get(type).getMethods())
            if (m.getName().equals(name) && m.getReturnType().equals(ret) && m.getParameterTypes().equals(Arrays.asList(parameters))) return m;
        throw new AssertionError(type + name);
    }
    static void calls(Method m, String type, String name) {
        for (Instruction i : m.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction) {
            Object r = ((ReferenceInstruction)i).getReference();
            if (r instanceof MethodReference && ((MethodReference)r).getDefiningClass().equals(type) && ((MethodReference)r).getName().equals(name)) return;
        }
        throw new AssertionError(m.getName() + " missing " + type + name);
    }
    public static void main(String[] args) throws Exception {
        MultiDexContainer<? extends DexFile> d = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : d.getDexEntryNames()) for (ClassDef c : d.getEntry(entry).getDexFile().getClasses()) classes.put(c.getType(), c);
        String helper = "Le/e/a/ModernShorts;", player = "Lcom/sauzask/nicoid/NicoidVideoActivity;", top = "Lcom/sauzask/nicoid/NicoidTopActivity;";
        Method create = method(player, "onCreate", "V", "Landroid/os/Bundle;");
        calls(create, helper, "bootstrap"); calls(create, helper, "attach");
        Method touch = method(player, "dispatchTouchEvent", "Z", "Landroid/view/MotionEvent;");
        calls(touch, helper, "touch"); calls(touch, "Landroid/app/Activity;", "dispatchTouchEvent");
        calls(method(top, "a", "Landroid/widget/ListView;", "Landroid/content/Context;", "Landroid/widget/ListView;", "Z"), helper, "addMenu");
        calls(method("Lcom/sauzask/nicoid/NicoidSetting;", "onCreate", "V", "Landroid/os/Bundle;"), helper, "settings");
        Method menu = method(top, "a", "V", "Ljava/util/ArrayList;", "Z", "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/content/Intent;", "I");
        if ((menu.getAccessFlags() & 9) != 9) throw new AssertionError("reflective menu method must be public static");
        method("Le/e/a/v0;", "a", "Ljava/lang/String;", "Lorg/apache/http/client/CookieStore;");
        boolean cookie = false;
        for (Field f : classes.get("Le/e/a/v0;").getFields()) if (f.getName().equals("b") && f.getType().equals("Lorg/apache/http/client/CookieStore;") && (f.getAccessFlags() & 9) == 9) cookie = true;
        if (!cookie) throw new AssertionError("native cookie field");
        int refs = 0;
        for (ClassDef c : classes.values()) for (Method m : c.getMethods()) if (m.getImplementation() != null)
            for (Instruction i : m.getImplementation().getInstructions()) if (i instanceof ReferenceInstruction) {
                Object r = ((ReferenceInstruction)i).getReference(); if (!(r instanceof MethodReference)) continue;
                MethodReference ref = (MethodReference)r;
                if (!Arrays.asList(helper, "Le/e/a/ShortsRules;", "Le/e/a/PullRefresh;").contains(ref.getDefiningClass())) continue;
                boolean exists = false;
                for (Method target : classes.get(ref.getDefiningClass()).getMethods()) if (key(target).equals(key(ref))) exists = true;
                if (!exists) throw new AssertionError("missing helper method " + ref); refs++;
            }
        System.out.println("Short hooks, menu/cookie contracts and " + refs + " helper references verified");
    }
}
