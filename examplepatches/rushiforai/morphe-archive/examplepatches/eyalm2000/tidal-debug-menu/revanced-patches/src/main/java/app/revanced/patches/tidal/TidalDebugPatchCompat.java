package app.revanced.patches.tidal;

import app.tidal.shared.TidalPatchCore;
import java.lang.reflect.Method;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class TidalDebugPatchCompat {
    private static final String[] TIDAL_PACKAGES = {"com.aspiro.tidal"};
    private static final String INSTRUCTION_EXTENSIONS = "app.revanced.patcher.extensions.InstructionExtensions";

    private TidalDebugPatchCompat() {
    }

    // Public static, non-parameterized method so patch loaders can discover it.
    public static Object unlockDebugMenuPatch() {
        try {
            return createPatch();
        } catch (Exception e) {
            throw new RuntimeException("Failed to create Tidal debug patch", e);
        }
    }

    // Public static, non-parameterized method so patch loaders can discover it.
    public static Object exportDebugActivityPatch() {
        try {
            return createExportActivityPatch();
        } catch (Exception e) {
            throw new RuntimeException("Failed to create export debug activity patch", e);
        }
    }

    private static Object createPatch() throws Exception {
        Class<?> patchKtClass = Class.forName("app.revanced.patcher.patch.PatchKt");
        Method bytecodePatch = findPatchFactory(patchKtClass, "bytecodePatch");

        return createPatchWithApplyBlock(
            bytecodePatch,
            "Unlock Debug Menu",
            "Enables the internal debug menu in Tidal settings.",
            new ContextAction() {
                @Override
                public void run(Object context) throws Exception {
                    TidalPatchCore.forceDebugMenuReturnTrue(context, INSTRUCTION_EXTENSIONS);
                }
            }
        );
    }

    private static Object createExportActivityPatch() throws Exception {
        Class<?> patchKtClass = Class.forName("app.revanced.patcher.patch.PatchKt");
        Method resourcePatch = findPatchFactory(patchKtClass, "resourcePatch");

        return createPatchWithApplyBlock(
            resourcePatch,
            "Export Debug Activity",
            "Ensures the Tidal debug activity is exported in AndroidManifest.xml.",
            new ContextAction() {
                @Override
                public void run(Object context) throws Exception {
                    TidalPatchCore.ensureDebugActivityExported(context);
                }
            }
        );
    }

    private static Object createPatchWithApplyBlock(Method patchFactory, String name, String description, final ContextAction action) throws Exception {
        Function1<Object, Unit> builderBlock = new Function1<>() {
            @Override
            public Unit invoke(Object builder) {
                try {
                    enforceTidalCompatibility(builder);
                    attachApplyOrExecute(builder, action);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                return Unit.INSTANCE;
            }
        };

        return patchFactory.invoke(null, name, description, true, builderBlock);
    }

    private static void enforceTidalCompatibility(Object builder) throws Exception {
        Method compatibleWith = builder.getClass().getMethod("compatibleWith", String[].class);
        compatibleWith.invoke(builder, (Object) TIDAL_PACKAGES);
    }

    private static Method findPatchFactory(Class<?> patchKtClass, String factoryName) {
        for (Method method : patchKtClass.getDeclaredMethods()) {
            if (!method.getName().equals(factoryName)) continue;
            Class<?>[] paramTypes = method.getParameterTypes();
            if (paramTypes.length != 4) continue;
            if (paramTypes[0] != String.class || paramTypes[1] != String.class || paramTypes[2] != boolean.class) continue;
            if (!Function1.class.isAssignableFrom(paramTypes[3])) continue;

            method.setAccessible(true);
            return method;
        }

        throw new IllegalStateException("Could not locate PatchKt." + factoryName + "(String, String, boolean, Function1).");
    }

    private static void attachApplyOrExecute(Object builder, final ContextAction action) throws Exception {
        Function1<Object, Unit> applyBlock = new Function1<>() {
            @Override
            public Unit invoke(Object context) {
                try {
                    action.run(context);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                return Unit.INSTANCE;
            }
        };

        Method applyOrExecute = null;
        for (Method method : builder.getClass().getMethods()) {
            if (method.getParameterCount() != 1) continue;
            if (!Function1.class.isAssignableFrom(method.getParameterTypes()[0])) continue;
            if (method.getName().equals("apply") || method.getName().equals("execute")) {
                applyOrExecute = method;
                break;
            }
        }

        if (applyOrExecute == null) {
            throw new IllegalStateException("Could not locate apply/execute method on bytecode patch builder.");
        }

        applyOrExecute.invoke(builder, applyBlock);
    }

    private interface ContextAction {
        void run(Object context) throws Exception;
    }
}
