package app.tidal.shared;

import java.io.Closeable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public final class TidalPatchCore {
    private static final String ANDROID_NS = "http://schemas.android.com/apk/res/android";
    private static final String DEBUG_ACTIVITY = "com.tidal.android.debugmenu.DebugMenuActivity";

    private TidalPatchCore() {
    }

    public static void ensureDebugActivityExported(Object context) throws Exception {
        Method documentMethod = context.getClass().getMethod("document", String.class);
        Object documentObject = documentMethod.invoke(context, "AndroidManifest.xml");
        Document document = (Document) documentObject;

        NodeList activities = document.getElementsByTagName("activity");
        boolean found = false;

        for (int index = 0; index < activities.getLength(); index++) {
            Element activity = (Element) activities.item(index);
            String activityName = activity.getAttributeNS(ANDROID_NS, "name");
            if (activityName == null || activityName.isEmpty()) {
                activityName = activity.getAttribute("android:name");
            }
            if (!DEBUG_ACTIVITY.equals(activityName)) continue;

            activity.setAttributeNS(ANDROID_NS, "android:exported", "true");
            found = true;
            break;
        }

        if (documentObject instanceof Closeable closeable) {
            closeable.close();
        }

        if (!found) {
            throw new IllegalStateException("Could not locate " + DEBUG_ACTIVITY + " in AndroidManifest.xml.");
        }
    }

    public static void forceDebugMenuReturnTrue(Object context, String instructionExtensionsClassName) throws Exception {
        Object targetClass = findTargetClass(context);
        Object mutableClass = resolveMutableClass(context, targetClass);
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

        Class<?> instructionExtensionsClass = Class.forName(instructionExtensionsClassName);
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
            throw new IllegalStateException("Could not locate InstructionExtensions.addInstructions.");
        }

        addInstructions.invoke(
            instructionExtensions,
            targetMethod,
            0,
            "const/4 v0, 0x1\nreturn v0"
        );
    }

    private static Object resolveMutableClass(Object context, Object targetClass) throws Exception {
        Method proxyMethod = findMethod(context.getClass(), "proxy", 1);
        if (proxyMethod != null) {
            Object proxy = proxyMethod.invoke(context, targetClass);
            return invokeNoArg(proxy, "getMutableClass");
        }

        Method mutableClassDefByMethod = findMethod(context.getClass(), "mutableClassDefBy", 1);
        if (mutableClassDefByMethod != null) {
            return mutableClassDefByMethod.invoke(context, targetClass);
        }

        throw new IllegalStateException("Could not locate a mutable class resolver (proxy/mutableClassDefBy).");
    }

    private static Object findTargetClass(Object context) throws Exception {
        Method getClassesMethod = findMethod(context.getClass(), "getClasses", 0);
        if (getClassesMethod != null) {
            Object classes = getClassesMethod.invoke(context);

            Object targetClass = null;
            for (Object classDef : (Iterable<?>) classes) {
                String type = (String) invokeNoArg(classDef, "getType");
                if (type.endsWith("/DebugFeatureInteractorDefault;") && !type.contains("$")) {
                    targetClass = classDef;
                    break;
                }
            }
            if (targetClass == null) {
                for (Object classDef : (Iterable<?>) classes) {
                    String type = (String) invokeNoArg(classDef, "getType");
                    if (type.contains("DebugFeatureInteractorDefault") && !type.contains("$")) {
                        targetClass = classDef;
                        break;
                    }
                }
            }
            if (targetClass != null) {
                return targetClass;
            }
        }

        Method classDefByOrNull = findMethod(context.getClass(), "classDefByOrNull", 1);
        if (classDefByOrNull != null) {
            Object byPath = classDefByOrNull.invoke(context, "Lcom/tidal/android/features/debugmenu/debugfeatureinteractor/DebugFeatureInteractorDefault;");
            if (byPath != null) {
                return byPath;
            }
        }

        throw new IllegalStateException("Could not locate DebugFeatureInteractorDefault class.");
    }

    private static Method findMethod(Class<?> type, String name, int parameterCount) {
        for (Method method : type.getMethods()) {
            if (!method.getName().equals(name)) continue;
            if (method.getParameterCount() != parameterCount) continue;
            return method;
        }
        return null;
    }

    private static Object invokeNoArg(Object target, String methodName) throws Exception {
        Method method = target.getClass().getMethod(methodName);
        return method.invoke(target);
    }
}
