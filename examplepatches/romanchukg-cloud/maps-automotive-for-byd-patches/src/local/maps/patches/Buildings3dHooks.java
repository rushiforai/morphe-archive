// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.*;
import kotlin.Unit;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Enables the single native 3D-settings experiment consistently at its pinned reads.
 * Native user preferences, eligibility, thermal protection and rendering algorithms stay intact.
 * Applied before the other hooks so schema checks refer to the exact original26.10 input.
 * 26.10 reads the flag (26.09 alkj.m, now aljc.m) in nine places: the eight 26.09 consumers plus
 * ier.d(ViewGroup), the map-manager setup. 26.09 igc.d always wrapped the layer controller in nyk;
 * 26.10 ier.d wraps it in nyq (the same wrapper) only while this flag is on.
 */
final class Buildings3dHooks {
    private static final String FLAG = "Laljc;->m:Z";
    private static final String CLUSTER = "Lcom/google/android/apps/gmm/car/embedded/auxiliarymap/EmbeddedClusterActivity;";
    private static final String CAMERA_PARAMETERS = "[Lwtl;, Lwmp;, Lqxn;, Lzhv;, Ltoi;, Lwuq;, Lxbe;, Lqjg;, Lrya;, Ladpa;, Lxbz;, Lugc;, Luip;, Lfnj;, Lolf;, Lmxu;, Lnyw;, Lpph;, Lfmx;, Lamgu;, Ljava/util/concurrent/Executor;, Lqfq;, Lgbd;, Ljhf;, Lxct;, Ljcj;, Lqlk;, Lmha;, Lpgc;, Lgtx;, Lalme;, Lgys;, Lmwj;, Lmwg;, Ljds;, Lhpp;, Lxbw;, Lpgc;, Lnyt;, Lxgb;, Lnie;, Llvp;, Lqqi;, Ladpa;, Lalme;, Lixo;, Lfhn;, Lqfo;, Lwwn;, Lrvr;, Lvvi;, Lpnd;, Lamgu;, Lxdd;, Lakct;, Lxcy;, Lrws;, Lxcp;, Lxcr;, Ljdo;, Ljet;]";
    record Site(String type, String key, int registers, int count,
                int index, int address, int output, int owner) {}
    /** The eight 26.09 consumers, in 26.09 order (onStart, hrq.h, igc.f, myz.Q, nui.f, wxh.c, itk x2). */
    static final List<Site> LEGACY = List.of(
        new Site(CLUSTER, "onStart[]V", 41, 402, 68, 147, 14, 6),
        new Site("Lhpq;", "h[]Z", 1, 10, 4, 8, 0, 0),
        new Site("Lier;", "f[Z]V", 16, 541, 312, 620, 2, 2),
        new Site("Lmyr;", "U[Lajkp;]Z", 3, 35, 3, 6, 0, 0),
        new Site("Loal;", "e[Lrlw;, Laddm;, Lqqi;]Lnyt;", 16, 71, 22, 46, 15, 15),
        new Site("Luff;", "a[]Lufe;", 5, 25, 6, 12, 1, 1),
        new Site("Lirs;", "<init>" + CAMERA_PARAMETERS + "V", 97, 348, 93, 192, 9, 9),
        new Site("Lirs;", "<init>" + CAMERA_PARAMETERS + "V", 97, 348, 119, 239, 2, 2)
    );
    /** New in 26.10: map-manager setup; on = layer controller wrapped in nyq as in 26.09. */
    static final Site LAYER_WRAPPER = new Site("Lier;", "d[Landroid/view/ViewGroup;]V", 34, 739, 93, 189, 3, 3);
    /** Owner decision 2026-10-20: 9/9, the ninth read is enabled too (layer wrapper as in 26.09/52A). */
    static final boolean ENABLE_LAYER_WRAPPER = true;
    static final List<Site> SITES;
    static final List<Site> ENABLED;
    static {
        List<Site> all = new ArrayList<>(LEGACY);
        all.add(LAYER_WRAPPER);
        SITES = List.copyOf(all);
        ENABLED = ENABLE_LAYER_WRAPPER ? SITES : LEGACY;
    }
    static String key(Method m) {
        return m.getName() + m.getParameterTypes() + m.getReturnType();
    }
    private static String reference(Instruction i) {
        return i instanceof ReferenceInstruction ? ((ReferenceInstruction) i).getReference().toString() : "";
    }
    private static void require(boolean condition, String message) {
        if (!condition) throw new IllegalStateException("Native 3D Buildings schema: " + message);
    }
    /** Audit every read before mutating anything: fail closed on an extra consumer,
     * changed method, opcode, register, address or instruction count. */
    static void audit(Iterable<? extends ClassDef> classes) {
        Set<Site> seen = new HashSet<>();
        for (var c : classes) {
            for (var m : c.getMethods()) {
                var body = m.getImplementation();
                if (body == null) continue;
                List<Instruction> code = new ArrayList<>();
                body.getInstructions().forEach(code::add);
                int address = 0;
                for (int index = 0; index < code.size(); index++) {
                    var instruction = code.get(index);
                    if (reference(instruction).equals(FLAG)) {
                        require(instruction.getOpcode() == Opcode.IGET_BOOLEAN
                            && instruction.getCodeUnits() == 2, "unexpected flag access");
                        var read = (TwoRegisterInstruction) instruction;
                        var site = new Site(c.getType(), key(m), body.getRegisterCount(), code.size(),
                            index, address, read.getRegisterA(), read.getRegisterB());
                        require(SITES.contains(site) && seen.add(site), "unexpected/duplicate flag read: " + site);
                    }
                    address += instruction.getCodeUnits();
                }
            }
        }
        require(seen.size() == SITES.size(), "expected nine experiment reads, found " + seen.size());
    }
    /** Same two code units as the native IGET_BOOLEAN. Registers, branch targets,
     * switches and try/catch boundaries remain in their original positions. */
    static void patch(MutableMethod method, Site site) {
        require(method.getDefiningClass().equals(site.type()) && key(method).equals(site.key()), "site method");
        var body = method.getImplementation();
        require(body.getRegisterCount() == site.registers() && body.getInstructions().size() == site.count(), "site method shape");
        var read = body.getInstructions().get(site.index());
        require(read.getOpcode() == Opcode.IGET_BOOLEAN && reference(read).equals(FLAG)
            && ((TwoRegisterInstruction) read).getRegisterA() == site.output(), "site read");
        body.replaceInstruction(site.index(), new BuilderInstruction21s(Opcode.CONST_16, site.output(), 1));
    }
    static void apply(BytecodePatchContext context) {
        List<ClassDef> classes = new ArrayList<>();
        context.classDefForEach(c -> { classes.add(c); return Unit.INSTANCE; });
        audit(classes);
        for (var site : ENABLED) {
            MutableMethod method = null;
            for (var m : context.mutableClassDefBy(site.type()).getMethods()) {
                if (!key(m).equals(site.key())) continue;
                require(method == null, "ambiguous method");
                method = m;
            }
            require(method != null, "method disappeared");
            patch(method, site);
        }
        System.out.println("Native 3D Buildings: enabled one settings experiment at " + ENABLED.size() + " of nine audited reads"
            + (ENABLE_LAYER_WRAPPER ? " (incl. layer wrapper ier.d)" : " (ier.d layer wrapper stays native)")
            + "; native requested/active state, thermal and satellite rules preserved");
    }
    private Buildings3dHooks() {}
}
