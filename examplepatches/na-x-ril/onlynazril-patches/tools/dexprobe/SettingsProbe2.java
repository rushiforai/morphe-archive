import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.FindField;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.query.matchers.FieldMatcher;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.FieldDataList;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Second pass: is the section header something we can build ourselves?
 *
 * Checks the state class that carries OPEN_DEBUG (per-group singleton container) — its
 * static singletons, constructors and the strings baked into <clinit> — and finds where
 * the settings screen gathers its *GroupVM list, so we know whether a whole new group can
 * be appended or whether we must live inside an existing one.
 */
public class SettingsProbe2 {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String SETTING_PKG = "com.ss.android.ugc.aweme.setting.ui.rvmpcompose";

    public static void main(String[] args) {
        String stateClass = args.length > 1 ? args[1] : null;
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            if (stateClass == null) {
                FieldDataList open = bridge.findField(FindField.create()
                        .matcher(FieldMatcher.create().name("OPEN_DEBUG")));
                stateClass = open.get(0).getDeclaredClassName();
                System.out.println("OPEN_DEBUG lives on " + stateClass
                        + " (type " + open.get(0).getTypeName() + ")");
            }
            stateClassShape(bridge, stateClass);
            groupAssembly(bridge);
        }
    }

    private static void stateClassShape(DexKitBridge bridge, String stateClass) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(stateClass)));
        for (ClassData c : classes) {
            System.out.println("\n### " + c.getName()
                    + " (super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()) + ")");
            System.out.println("  -- fields");
            for (FieldData f : c.getFields()) {
                boolean isStatic = (f.getModifiers() & 0x8) != 0;
                System.out.println("     " + (isStatic ? "static " : "") + f.getTypeName() + " " + f.getName());
            }
            System.out.println("  -- constructors");
            for (MethodData m : c.getMethods()) {
                if (m.getName().equals("<init>")) {
                    System.out.println("     <init> " + m.getParamTypeNames());
                }
            }
            MethodDataList declared = c.getMethods();
            System.out.println("  -- methods (" + declared.size() + ")");
            for (MethodData m : declared) {
                if (m.getName().startsWith("<")) continue;
                System.out.println("     " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            }
            System.out.println("  -- all strings used by the class");
            Set<String> strings = new LinkedHashSet<>();
            for (MethodData m : declared) strings.addAll(m.getUsingStrings());
            System.out.println("     " + strings);
        }
    }

    /** Where do the *GroupVM instances come from, and is the list appendable? */
    private static void groupAssembly(DexKitBridge bridge) {
        MethodDataList g63 = bridge.findMethod(FindMethod.create().searchPackages(SETTING_PKG)
                .matcher(MethodMatcher.create().name("G63")));
        System.out.println("\n### G63 (group list) : " + g63.size() + " hit(s)");
        for (MethodData m : g63) {
            System.out.println("  " + m.getDeclaredClassName() + "#G63 " + m.getParamTypeNames()
                    + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            Set<String> invokes = new LinkedHashSet<>();
            for (MethodData invoked : m.getInvokes()) {
                invokes.add(invoked.getDeclaredClassName() + "#" + invoked.getName()
                        + " -> " + invoked.getReturnTypeName());
            }
            int shown = 0;
            for (String s : invokes) {
                if (shown++ >= 25) break;
                System.out.println("     invoke " + s);
            }
        }

        ClassDataList fragment = bridge.findClass(FindClass.create().searchPackages(SETTING_PKG)
                .matcher(ClassMatcher.create().className(SETTING_PKG + ".SettingsComposeRvmpFragment")));
        for (ClassData c : fragment) {
            System.out.println("\n### " + c.getName() + " super="
                    + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                Set<String> groupRefs = new LinkedHashSet<>();
                for (MethodData invoked : m.getInvokes()) {
                    String cn = invoked.getDeclaredClassName();
                    if (cn.endsWith("GroupVM") || cn.endsWith("GroupSettingsVM")) {
                        groupRefs.add(cn + "#" + invoked.getName());
                    }
                }
                if (groupRefs.isEmpty()) continue;
                System.out.println("   " + m.getName() + " " + m.getParamTypeNames() + " -> " + m.getReturnTypeName());
                for (String r : groupRefs) System.out.println("      " + r);
            }
        }
    }
}
