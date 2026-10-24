import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Binary wiring regression check; does not claim UI/runtime verification. */
public final class VerifyResponseArchiveMenu {
    static final String ARCHIVE = "Lapp/morphe/extension/chmate/ResponseArchive;";
    static Map<String, ClassDef> classes = new HashMap<>();
    static void check(boolean ok, String label) { if (!ok) throw new AssertionError(label); }
    static boolean calls(String owner, String method, String target, String name) {
        ClassDef cls = classes.get(owner);
        if (cls == null) return false;
        for (Method m : cls.getMethods()) {
            if (method != null && !method.equals(m.getName()) || m.getImplementation() == null) continue;
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref
                        && ref.getDefiningClass().equals(target) && ref.getName().equals(name)) return true;
        }
        return false;
    }
    public static void main(String[] args) throws Exception {
        String version = args[0];
        try (ZipFile apk = new ZipFile(args[1])) {
            for (var entries = apk.entries(); entries.hasMoreElements();) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes(?:[0-9]+)?\\.dex")) continue;
                try (var input = new BufferedInputStream(apk.getInputStream(entry))) {
                    for (var cls : DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input).getClasses())
                        classes.put(cls.getType(), cls);
                }
            }
        }
        check(classes.containsKey(ARCHIVE), "archive extension exists");
        Set<String> labels = new HashSet<>();
        for (var m : classes.get(ARCHIVE).getMethods()) if (m.getImplementation() != null)
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s)
                    labels.add(s.getString());
        check(labels.contains("保存済みレスを見る"), "browse label bundled");
        check(!labels.contains("過去レスを見る"), "obsolete browse label removed");
        check(labels.contains("このレスをアーカイブに保存"), "save label bundled");
        check(calls(ARCHIVE, "handle", ARCHIVE, "showList"), "browse dispatch opens list");
        String wacchoi = "Lapp/morphe/extension/chmate/WacchoiLongPressMenu;";
        check(calls(wacchoi, "dispatchSuffixNgItem", ARCHIVE, "handle"), "custom popup dispatch retained");
        if (version.equals("191")) {
            String dialog = "Lo/r8lambdafLXKIgI8H4VR9SponZBKnK7_9gE;";
            check(calls(dialog, "c", dialog, "haiagaruBuildResponseMenu"), "ordinary 191 builder wrapped");
            check(calls(dialog, "c", ARCHIVE, "appendDialog"), "ordinary 191 menu amended after native return");
            for (Method m : classes.get(dialog).getMethods()) if (m.getName().equals("c")) {
                int returns=0;
                for (var i : m.getImplementation().getInstructions()) {
                    String opcode=i.getOpcode().name();
                    check(!opcode.startsWith("IF_") && !opcode.startsWith("GOTO"), "191 wrapper has no branch bypass");
                    if(opcode.equals("RETURN_OBJECT"))returns++;
                }
                check(returns==1,"191 wrapper has one successful exit");
            }
        } else if (version.equals("226")) {
            check(calls("Lo/GNk;", "d", "Ljava/lang/Math;", "min"), "226 closed selected tab chooses remaining neighbour");
            check(calls("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;", null, wacchoi, "appendForCurrentDialog"), "226 native response menu hooked");
            check(calls(wacchoi, "appendForCurrentDialog", ARCHIVE, "appendDialog"), "226 archive menu connected");
            String collector = "Lo/QWA$5$5$5;";
            check(calls(collector, "emit", collector, "haiagaruApplyPaneState"), "226 state application wrapped");
            check(calls(collector, "emit", "Lo/QWA;", "h"), "226 previous guard preserved");
            check(calls(collector, "emit", "Lo/QWA;", "d"), "226 guard setter connected");
            for (Method m : classes.get(collector).getMethods()) if (m.getName().equals("emit")) {
                check(m.getImplementation().getTryBlocks().size() == 1, "226 finally handler present");
                check(m.getImplementation().getTryBlocks().get(0).getExceptionHandlers().get(0).getExceptionType() == null,
                        "226 restores guard on every throwable");
            }
        } else if (version.equals("242")) {
            check(calls("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;", "b", ARCHIVE, "appendSheet"), "242 response sheet hooked");
            check(calls("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;", "g", ARCHIVE, "appendDialog242"), "242 ordinary response menu hooked");
            check(calls(ARCHIVE, "appendDialog242", ARCHIVE, "append"), "242 ordinary selected response connected");
            check(calls("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;", "c", ARCHIVE, "handle"), "242 ordinary click dispatch connected");
        } else throw new IllegalArgumentException("Unsupported verification version");
        System.out.println("PASS " + version + " native response menu wiring, save/browse labels and list dispatch");
    }
}
