import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

/**
 * Every method that loads a given resource id, so a view can be traced from the layout name to the
 * components that resolve it.
 *
 * The header write looks its time view up by id (`tv_post_time`, and `tv_create_time` as a
 * fallback). If a surface renders its post time in a view with a different id, its component is
 * named here and the writer can be extended to it.
 *
 *   tools/dexprobe/run.sh ViewIdProbe "<apk>" 0x7f0a9356 0x7f0a8feb ...
 */
public class ViewIdProbe {
    static { System.loadLibrary("dexkit"); }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            for (int i = 1; i < args.length; i++) {
                long id = Long.decode(args[i]);
                MethodDataList methods = bridge.findMethod(FindMethod.create()
                        .matcher(MethodMatcher.create().addUsingNumber(id)));
                System.out.println("\n### " + args[i] + " (" + id + ") : " + methods.size()
                        + " method(s)");
                for (MethodData m : methods) {
                    System.out.println("    " + m.getDeclaredClassName() + "#" + m.getName()
                            + " " + m.getParamTypeNames() + " -> " + m.getReturnTypeName());
                }
            }
        }
    }
}
