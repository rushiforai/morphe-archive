import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.File;
import java.util.*;

/** Private three-method spike; production patch bindings are a separate deliverable. */
public final class ApplyVelaFence {
    private static final String HELPER = "Lnl/johninnl/warningprobe/TaggedSpeechFence;";
    private static BuilderInstruction3rc call(String name, int register, String result) {
        return new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
                new ImmutableMethodReference(HELPER, name, List.of("Ljava/lang/Object;"), result));
    }
    public static void main(String[] args) throws Exception {
        var container = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        if (!new TreeSet<>(container.getDexEntryNames()).equals(new TreeSet<>(List.of("classes.dex", "classes2.dex"))))
            throw new IllegalArgumentException("Private Vela spike expects the pinned two DEX entries");
        var dex = container.getEntry("classes.dex").getDexFile();
        List<ClassDef> classes = new ArrayList<>();
        List<ClassDef> relocated = new ArrayList<>();
        Set<String> changed = new TreeSet<>();
        for (var cls : dex.getClasses()) {
            if (cls.getType().equals(HELPER)) throw new IllegalArgumentException("Already patched spike input");
            List<Method> methods = new ArrayList<>();
            for (var method : cls.getMethods()) {
                boolean constructor = cls.getType().equals("Lpn1;") && method.getName().equals("<init>");
                boolean dispatch = cls.getType().equals("Lpn1;") && method.getName().equals("invoke");
                boolean stop = method.toString().equals("Lwy4;->n()V");
                if (!(constructor || dispatch || stop)) { methods.add(method); continue; }
                var implementation = new MutableMethodImplementation(method.getImplementation());
                int parameters = 1;
                for (var type : method.getParameterTypes()) parameters += type.equals("J") || type.equals("D") ? 2 : 1;
                int receiver = implementation.getRegisterCount() - parameters;
                if (constructor) {
                    int end = implementation.getInstructions().size() - 1;
                    if (implementation.getInstructions().get(end).getOpcode() != Opcode.RETURN_VOID)
                        throw new IllegalArgumentException("Changed pn1 constructor return");
                    implementation.addInstruction(end, call("capture", receiver, "V"));
                } else if (stop) {
                    implementation.addInstruction(0, call("invalidate", receiver, "V"));
                } else {
                    if (receiver != 9) throw new IllegalArgumentException("Changed pn1 invoke receiver register");
                    implementation.addInstruction(0, call("allow", receiver, "Z"));
                    implementation.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
                    implementation.addInstruction(2, new BuilderInstruction10x(Opcode.NOP));
                    implementation.addInstruction(3, new BuilderInstruction21c(Opcode.SGET_OBJECT, 0,
                            new ImmutableFieldReference("Ler4;", "a", "Ler4;")));
                    implementation.addInstruction(4, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
                    // Keep the original switch/payload alignment unchanged (10 added code units).
                    implementation.addInstruction(5, new BuilderInstruction10x(Opcode.NOP));
                    implementation.replaceInstruction(2, new BuilderInstruction21t(Opcode.IF_NEZ, 0,
                            implementation.newLabelForIndex(6)));
                }
                changed.add(method.toString());
                methods.add(new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(),
                        method.getReturnType(), method.getAccessFlags(), method.getAnnotations(),
                        method.getHiddenApiRestrictions(), implementation));
            }
            var output = new ImmutableClassDef(cls.getType(), cls.getAccessFlags(), cls.getSuperclass(), cls.getInterfaces(),
                    cls.getSourceFile(), cls.getAnnotations(), cls.getFields(), methods);
            if (cls.getType().equals("Lwy4;") || cls.getType().equals("Lpn1;")) relocated.add(output);
            else classes.add(output);
        }
        if (changed.size() != 3) throw new IllegalArgumentException("Unexpected private spike edit set " + changed);
        DexPool.writeTo(args[1], new ImmutableDexFile(dex.getOpcodes(), classes));
        var helpers = DexFileFactory.loadDexFile(new File(args[2]), Opcodes.getDefault());
        relocated.addAll(helpers.getClasses());
        DexPool.writeTo(args[3], new ImmutableDexFile(dex.getOpcodes(), relocated));
        System.out.println("Private Vela candidate edits: " + changed);
    }
}
