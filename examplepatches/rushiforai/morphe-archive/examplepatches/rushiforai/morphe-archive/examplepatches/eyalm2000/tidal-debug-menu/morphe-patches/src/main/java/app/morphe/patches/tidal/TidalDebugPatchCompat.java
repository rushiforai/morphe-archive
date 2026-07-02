package app.morphe.patches.tidal;

import app.tidal.shared.TidalPatchCore;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class TidalDebugPatchCompat {
    private static final String[] TIDAL_PACKAGES = {"com.aspiro.tidal"};
    private static final String INSTRUCTION_EXTENSIONS = "app.morphe.patcher.extensions.InstructionExtensions";

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
        Class<?> patchKtClass = Class.forName("app.morphe.patcher.patch.PatchKt");
        Method bytecodePatch = findPatchFactory(patchKtClass, "bytecodePatch");

        return createPatchWithApplyBlock(
            bytecodePatch,
            "Unlock Debug Menu",
            "Enables the internal debug menu in Tidal settings.",
            new ContextAction() {
                @Override
                public void run(Object context) throws Exception {
                    forceDebugMenuReturnTrueMorphe(context);
                }
            }
        );
    }

    private static Object createExportActivityPatch() throws Exception {
        Class<?> patchKtClass = Class.forName("app.morphe.patcher.patch.PatchKt");
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

    private static void forceDebugMenuReturnTrueMorphe(Object context) throws Exception {
        Object targetClass = findTargetClassMorphe(context);

        Method mutableClassDefBy = null;
        for (Method method : context.getClass().getMethods()) {
            if (method.getName().equals("mutableClassDefBy") && method.getParameterCount() == 1) {
                if (method.getParameterTypes()[0].isAssignableFrom(targetClass.getClass())) {
                    mutableClassDefBy = method;
                    break;
                }
            }
        }
        if (mutableClassDefBy == null) {
            throw new IllegalStateException("Could not locate mutableClassDefBy(ClassDef) method.");
        }

        Object mutableClass = mutableClassDefBy.invoke(context, targetClass);
        Iterable<?> methods = (Iterable<?>) invokeNoArg(mutableClass, "getMethods");

        Object targetMethod = null;
        Object fallbackNoArgBooleanMethod = null;
        for (Object method : methods) {
            String name = (String) invokeNoArg(method, "getName");
            String returnType = (String) invokeNoArg(method, "getReturnType");
            java.util.List<?> parameterTypes = (java.util.List<?>) invokeNoArg(method, "getParameterTypes");
            int paramCount = parameterTypes.size();

            if ("Z".equals(returnType) && paramCount == 0 && fallbackNoArgBooleanMethod == null) {
                fallbackNoArgBooleanMethod = method;
            }

            if (!"a".equals(name) || !"Z".equals(returnType)) continue;
            if (paramCount == 0) {
                targetMethod = method;
                break;
            }
            if (paramCount == 1 && "Ljava/lang/String;".equals(parameterTypes.get(0))) {
                targetMethod = method;
                break;
            }
        }
        if (targetMethod == null) {
            targetMethod = fallbackNoArgBooleanMethod;
        }
        if (targetMethod == null) {
            throw new IllegalStateException("Could not locate a suitable boolean gate method in DebugFeatureInteractorDefault.");
        }

        Class<?> instructionExtensionsClass = Class.forName(INSTRUCTION_EXTENSIONS);
        Object instructionExtensions = instructionExtensionsClass.getField("INSTANCE").get(null);

        Method addInstructions = null;
        for (Method method : instructionExtensionsClass.getMethods()) {
            if (!method.getName().equals("addInstructions")) continue;
            if (method.getParameterCount() != 3) continue;
            if (!Modifier.isPublic(method.getModifiers())) continue;
            Class<?>[] paramTypes = method.getParameterTypes();
            if (paramTypes[1] != int.class) continue;
            if (paramTypes[2] != String.class) continue;
            if (!paramTypes[0].isInstance(targetMethod)) continue;
            addInstructions = method;
            break;
        }

        if (addInstructions == null) {
            throw new IllegalStateException("Could not locate InstructionExtensions.addInstructions for MutableMethod.");
        }

        addInstructions.invoke(
            instructionExtensions,
            targetMethod,
            0,
            "const/4 v0, 0x1\nreturn v0"
        );
    }

    private static Object findTargetClassMorphe(Object context) throws Exception {
        Method classDefByOrNullString = null;
        Method classDefForEach = null;
        for (Method method : context.getClass().getMethods()) {
            if (method.getName().equals("classDefByOrNull") && method.getParameterCount() == 1 && method.getParameterTypes()[0] == String.class) {
                classDefByOrNullString = method;
            }
            if (method.getName().equals("classDefForEach") && method.getParameterCount() == 1) {
                classDefForEach = method;
            }
        }

        if (classDefByOrNullString != null) {
            Object target = classDefByOrNullString.invoke(context, "Lcom/tidal/android/features/debugmenu/debugfeatureinteractor/DebugFeatureInteractorDefault;");
            if (target != null) {
                return target;
            }
        }

        if (classDefForEach != null) {
            final Object[] targetHolder = new Object[1];
            Function1<Object, Unit> visitor = new Function1<>() {
                @Override
                public Unit invoke(Object classDef) {
                    if (targetHolder[0] != null) return Unit.INSTANCE;
                    try {
                        String type = (String) invokeNoArg(classDef, "getType");
                        if (type.contains("DebugFeatureInteractorDefault") && !type.contains("$")) {
                            targetHolder[0] = classDef;
                        }
                    } catch (Exception ignored) {
                    }
                    return Unit.INSTANCE;
                }
            };
            classDefForEach.invoke(context, visitor);

            if (targetHolder[0] != null) {
                return targetHolder[0];
            }
        }

        throw new IllegalStateException("Could not locate DebugFeatureInteractorDefault class.");
    }

    private static Object invokeNoArg(Object target, String methodName) throws Exception {
        Method method = target.getClass().getMethod(methodName);
        return method.invoke(target);
    }

    private interface ContextAction {
        void run(Object context) throws Exception;
    }
}
