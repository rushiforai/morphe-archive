/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** java -cp cli.jar CheckChromeBindings.java version patched.apk [version patched.apk ...] */
class CheckChromeBindings {
    private static final String EXTENSION = "Lapp/morphe/extension/youtube/patches/";
    private static final String MENU_HOOK = EXTENSION + "general/GeneralPatch;"
            + "->hideToolbarMessagesButton(Ljava/lang/Enum;Landroid/view/MenuItem;)V";
    private static final String WINDOW_HOOK = EXTENSION + "general/NavigationButtonsPatch;"
            + "->getSystemNavigationBarColor(Landroid/view/Window;I)I";
    private static final String EDUCATION_HOOK = EXTENSION + "shorts/ShortsPatch;"
            + "->getShortsSpeedEducationStub(Landroid/view/ViewStub;)Landroid/view/ViewStub;";
    private static final Map<String, Stock> TARGETS = Map.of(
            "20.05.46", new Stock("Lmdh;", "Lasuo;", "Lhxm;", null, 0),
            "21.13.164", new Stock("Lobq;", "Lbaqd;", "Laurc;", null, 0),
            "21.39.525", new Stock("Lpls;", "Lbfhp;", "Laxla;", "Lmka;", 0x7F0B11CA),
            "21.45.90", new Stock("Lpwd;", "Lbgrj;", "Layvd;", "Lmrz;", 0x7F0B11EC));

    private record Stock(String toolbar, String iconEnum, String window, String shorts, int educationId) { }

    public static void main(String[] args) throws Exception {
        check(args.length > 0 && args.length % 2 == 0, "Pass version/APK pairs");
        for (int index = 0; index < args.length; index += 2) {
            String version = args[index];
            Stock stock = TARGETS.get(version);
            check(stock != null, "Unverified stock version: " + version);
            checkBindings(new File(args[index + 1]), stock);
            System.out.println(version + ": Messages and system navigation bindings verified; Shorts tutorial "
                    + (stock.educationId() == 0 ? "not hooked" : "bound to the education stub only"));
        }
    }

    private static void checkBindings(File apk, Stock stock) throws Exception {
        int toolbarCount = 0, windowCount = 0, shortsCount = 0;
        var dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (var type : dex.getEntry(entry).getDexFile().getClasses()) {
                for (Method method : type.getMethods()) {
                    if (method.getImplementation() == null) continue;
                    var code = new ArrayList<Instruction>();
                    method.getImplementation().getInstructions().forEach(code::add);
                    for (int index = 0; index < code.size(); index++) {
                        switch (reference(code.get(index))) {
                            case MENU_HOOK -> {
                                checkToolbar(method, code, index, stock);
                                toolbarCount++;
                            }
                            case WINDOW_HOOK -> {
                                checkWindow(method, code, index, stock);
                                windowCount++;
                            }
                            case EDUCATION_HOOK -> {
                                checkEducation(method, code, index, stock);
                                shortsCount++;
                            }
                        }
                    }
                }
            }
        }
        check(toolbarCount == 1 && windowCount == 1 && shortsCount == (stock.educationId() == 0 ? 0 : 1),
                "Unexpected native hook counts in " + apk + ": " + toolbarCount + "/" + windowCount + "/" + shortsCount);
    }

    private static void checkToolbar(Method method, List<Instruction> code, int index, Stock stock) {
        check(method.getDefiningClass().equals(stock.toolbar()), "Messages hook is outside the toolbar binder");
        check(reference(code.get(index - 2)).startsWith(stock.iconEnum() + "->")
                        && code.get(index - 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT,
                "Messages hook does not follow the native icon enum conversion");
        var invoke = (FiveRegisterInstruction) code.get(index);
        check(invoke.getRegisterC() == ((OneRegisterInstruction) code.get(index - 1)).getRegisterA()
                        && invoke.getRegisterD() == method.getImplementation().getRegisterCount()
                        - method.getParameterTypes().size(),
                "Messages hook does not receive the actual icon and MenuItem");
    }

    private static void checkWindow(Method method, List<Instruction> code, int index, Stock stock) {
        check(method.getDefiningClass().equals(stock.window()), "Window hook is outside the themed color setter");
        var invoke = (FiveRegisterInstruction) code.get(index);
        check(code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT
                        && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == invoke.getRegisterD()
                        && reference(code.get(index + 2)).equals("Landroid/view/Window;->getNavigationBarColor()I")
                        && ((FiveRegisterInstruction) code.get(index + 2)).getRegisterC() == invoke.getRegisterC(),
                "Window color is not transformed before the native equality check on the same window");
    }

    private static void checkEducation(Method method, List<Instruction> code, int index, Stock stock) {
        check(method.getDefiningClass().equals(stock.shorts()) && method.getName().equals("<init>"),
                "Education hook is outside the Shorts stub binder");
        check(code.get(index - 4) instanceof WideLiteralInstruction literal
                        && literal.getWideLiteral() == stock.educationId()
                        && reference(code.get(index - 3)).endsWith("->findViewById(I)Landroid/view/View;")
                        && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT_OBJECT
                        && code.get(index + 2).getOpcode() == Opcode.IPUT_OBJECT,
                "Education hook modifies something other than the education stub field");
    }

    private static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ref ? ref.getReference().toString() : "";
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
