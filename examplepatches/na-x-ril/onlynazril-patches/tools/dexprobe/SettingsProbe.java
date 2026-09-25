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

import java.util.TreeSet;

/**
 * Maps the structure of TikTok's Settings screen so the patches can add their own
 * "Extra" section with a deterministic position instead of guessing indices.
 *
 * Answers:
 *  1. every SECTION_HEADER / OPEN_DEBUG singleton (declaring class + type) — is there one
 *     header per group, or one shared by all of them?
 *  2. the *GroupVM classes that make up the settings screen;
 *  3. the state class behind SupportGroupVM.defaultState plus its static singletons;
 *  4. how the rows list is assembled and sorted.
 */
public class SettingsProbe {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String SETTING_PKG = "com.ss.android.ugc.aweme.setting.ui.rvmpcompose";

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            singletons(bridge, "SECTION_HEADER");
            singletons(bridge, "OPEN_DEBUG");
            groupViewModels(bridge);
            orderedAssembler(bridge);
        }
    }

    private static void singletons(DexKitBridge bridge, String fieldName) {
        FieldDataList fields = bridge.findField(FindField.create()
                .matcher(FieldMatcher.create().name(fieldName)));
        System.out.println("\n### static field '" + fieldName + "' : " + fields.size() + " hit(s)");
        for (FieldData f : fields) {
            System.out.println("  " + f.getDeclaredClassName() + "->" + f.getName()
                    + " : " + f.getTypeName()
                    + "  static=" + ((f.getModifiers() & 0x8) != 0)
                    + "  readers=" + f.getReaders().size()
                    + "  writers=" + f.getWriters().size());
        }
    }

    private static void groupViewModels(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create().searchPackages(SETTING_PKG));
        TreeSet<String> groups = new TreeSet<>();
        TreeSet<String> cells = new TreeSet<>();
        for (ClassData c : classes) {
            String n = c.getName();
            if (n.endsWith("GroupVM")) groups.add(n);
            else if (n.endsWith("CellVM")) cells.add(n);
        }
        System.out.println("\n### '" + SETTING_PKG + "' : " + classes.size() + " classes");
        System.out.println("  -- *GroupVM (" + groups.size() + ")");
        for (String g : groups) System.out.println("     " + g);
        System.out.println("  -- *CellVM (" + cells.size() + ")");
        for (String c : cells) System.out.println("     " + c);
    }

    /** SupportGroupVM.defaultState builds the state object; its statics are the cell singletons. */
    private static void orderedAssembler(DexKitBridge bridge) {
        ClassDataList support = bridge.findClass(FindClass.create().searchPackages(SETTING_PKG)
                .matcher(ClassMatcher.create().className(SETTING_PKG + ".group.support.SupportGroupVM")));
        for (ClassData c : support) {
            System.out.println("\n### " + c.getName() + " (super="
                    + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()) + ")");
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                System.out.println("   method " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
                if (!m.getName().equals("defaultState")) continue;
                for (MethodData invoked : m.getInvokes()) {
                    System.out.println("     invoke " + invoked.getDeclaredClassName() + "#" + invoked.getName()
                            + " -> " + invoked.getReturnTypeName());
                }
            }
        }

        MethodDataList sorters = bridge.findMethod(FindMethod.create().searchPackages(SETTING_PKG)
                .matcher(MethodMatcher.create().returnType("java.util.List")));
        System.out.println("\n### methods in " + SETTING_PKG + " returning java.util.List : " + sorters.size());
        for (MethodData m : sorters) {
            System.out.println("   " + m.getDeclaredClassName() + "#" + m.getName() + " " + m.getParamTypeNames());
        }
    }
}
