package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicInteger;

public final class GboardAiWritingToolsBackendFactoryRuntime {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-writing-tools-17.7.7] ";
    private static final String SERVER_HANDLER_CLASS = "njl";
    private static final String AICORE_HANDLER_CLASS = "njr";
    private static final String ASTREA_HANDLER_CLASS = "njt";
    private static final String HANDLER_INTERFACE_CLASS = "njz";
    private static final String REQUEST_CONFIG_CLASS = "oxe";
    private static final String FAILED_FUTURE_FACTORY_CLASS = "vme";
    private static final String FAILED_FUTURE_FACTORY_METHOD = "aK";
    private static final AtomicInteger LOG_COUNT = new AtomicInteger(0);

    private GboardAiWritingToolsBackendFactoryRuntime() {
    }

    public static Object replaceUnsupportedServerFallback(Object serverResult,
            Context context, Object requestConfig) {
        if (serverResult == null
                || !SERVER_HANDLER_CLASS.equals(serverResult.getClass().getName())) {
            return serverResult;
        }
        ClassLoader targetClassLoader = serverResult.getClass().getClassLoader();
        Context effectiveContext = context != null
                ? context
                : GboardAiWritingToolsRuntime.resolveContext();
        if (effectiveContext == null) {
            serverResult = null;
            return failClosedUnavailable(
                    targetClassLoader,
                    "PRIVATE_INFERENCE_CONTEXT",
                    new IllegalStateException("application Context is unavailable"));
        }
        GboardAiWritingToolsSettings.Snapshot settings;
        try {
            settings = GboardAiWritingToolsSettings.snapshot(effectiveContext);
        } catch (Throwable settingsFailure) {
            serverResult = null;
            return failClosedUnavailable(
                    targetClassLoader,
                    "PRIVATE_INFERENCE_SETTINGS",
                    settingsFailure);
        }
        if (!settings.featureEnabled
                || GboardAiWritingToolsSettings.BACKEND_GBOARD_SERVER.equals(
                settings.backendType)) {
            return serverResult;
        }

        serverResult = null;
        try {
            Object replacement = newPrivateHandler(
                    targetClassLoader,
                    settings.backendType,
                    effectiveContext,
                    requestConfig);
            logLimited("replaced unsupported server fallback=njl -> "
                    + replacement.getClass().getName()
                    + ", backendType=" + settings.backendType);
            return replacement;
        } catch (Throwable constructionFailure) {
            Throwable cause = unwrap(constructionFailure);
            try {
                Object unavailable = newUnavailableHandler(
                        targetClassLoader,
                        settings.backendType,
                        cause);
                logLimited("blocked unsupported server fallback=njl -> fail-closed "
                        + unavailable.getClass().getName()
                        + ", backendType=" + settings.backendType
                        + ", reason=" + cause.getClass().getName());
                return unavailable;
            } catch (Throwable proxyFailure) {
                logLimited("blocked unsupported server fallback=njl -> null"
                        + ", backendType=" + settings.backendType
                        + ", constructorFailure=" + cause.getClass().getName()
                        + ", proxyFailure=" + unwrap(proxyFailure).getClass().getName());
                return null;
            }
        }
    }

    private static Object failClosedUnavailable(ClassLoader targetClassLoader,
            String backendName, Throwable cause) {
        try {
            Object unavailable = newUnavailableHandler(
                    targetClassLoader,
                    backendName,
                    cause);
            logLimited("blocked unsupported server fallback=njl -> fail-closed "
                    + unavailable.getClass().getName()
                    + ", reason=" + cause.getClass().getName());
            return unavailable;
        } catch (Throwable proxyFailure) {
            logLimited("blocked unsupported server fallback=njl -> null"
                    + ", reason=" + cause.getClass().getName()
                    + ", proxyFailure=" + unwrap(proxyFailure).getClass().getName());
            return null;
        }
    }

    private static Object newPrivateHandler(ClassLoader targetClassLoader,
            String backendType, Context context, Object requestConfig) throws Throwable {
        Class<?> handlerType = resolveClass(targetClassLoader, HANDLER_INTERFACE_CLASS);
        if (!handlerType.isInterface()) {
            throw new IllegalStateException("njz is not an interface");
        }
        if (GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_AICORE.equals(backendType)) {
            Class<?> requestConfigType = resolveClass(targetClassLoader, REQUEST_CONFIG_CLASS);
            if (requestConfig == null || !requestConfigType.isInstance(requestConfig)) {
                throw new IllegalArgumentException("request config is not target oxe");
            }
            Class<?> handlerClass = resolveClass(targetClassLoader, AICORE_HANDLER_CLASS);
            validateHandlerType(handlerType, handlerClass);
            Constructor<?> constructor = handlerClass.getDeclaredConstructor(
                    Context.class,
                    requestConfigType);
            constructor.setAccessible(true);
            return constructor.newInstance(context, requestConfig);
        }
        if (GboardAiWritingToolsSettings.BACKEND_PRIVATE_INFERENCE_ASTREA.equals(backendType)) {
            Class<?> handlerClass = resolveClass(targetClassLoader, ASTREA_HANDLER_CLASS);
            validateHandlerType(handlerType, handlerClass);
            Constructor<?> constructor = handlerClass.getDeclaredConstructor(Context.class);
            constructor.setAccessible(true);
            return constructor.newInstance(context);
        }
        throw new IllegalArgumentException("unsupported private backend " + backendType);
    }

    private static Object newUnavailableHandler(ClassLoader targetClassLoader,
            String backendType, Throwable cause) throws Throwable {
        Class<?> handlerType = resolveClass(targetClassLoader, HANDLER_INTERFACE_CLASS);
        Class<?> futureFactoryClass = resolveClass(
                targetClassLoader,
                FAILED_FUTURE_FACTORY_CLASS);
        Method failedFutureFactory = futureFactoryClass.getDeclaredMethod(
                FAILED_FUTURE_FACTORY_METHOD,
                Throwable.class);
        if (!handlerType.isInterface()
                || !Modifier.isStatic(failedFutureFactory.getModifiers())
                || failedFutureFactory.getReturnType() == void.class) {
            throw new IllegalStateException("invalid fail-closed target binding");
        }
        failedFutureFactory.setAccessible(true);
        Class<?> failedFutureType = failedFutureFactory.getReturnType();
        for (Method method : handlerType.getMethods()) {
            Class<?> returnType = method.getReturnType();
            if (returnType != void.class
                    && returnType != String.class
                    && returnType != failedFutureType) {
                throw new IllegalStateException(
                        "unsupported fail-closed return type " + returnType.getName());
            }
        }
        Object failedFuture = failedFutureFactory.invoke(null, cause);
        return Proxy.newProxyInstance(
                handlerType.getClassLoader(),
                new Class<?>[]{handlerType},
                new UnavailableHandler(
                        backendType + "_UNAVAILABLE",
                        failedFutureType,
                        failedFuture));
    }

    private static void validateHandlerType(Class<?> handlerType, Class<?> handlerClass) {
        if (!handlerType.isAssignableFrom(handlerClass)) {
            throw new IllegalStateException(handlerClass.getName() + " is not njz");
        }
    }

    private static Class<?> resolveClass(ClassLoader classLoader, String name)
            throws ClassNotFoundException {
        return Class.forName(name, false, classLoader);
    }

    private static Throwable unwrap(Throwable throwable) {
        if (throwable instanceof InvocationTargetException
                && throwable.getCause() != null) {
            return throwable.getCause();
        }
        return throwable;
    }

    private static void logLimited(String message) {
        if (LOG_COUNT.incrementAndGet() > 40) {
            return;
        }
        try {
            Log.w(TAG, LOG_PREFIX + message);
        } catch (Throwable ignored) {
            // Host-side unit tests do not provide android.util.Log.
        }
    }

    private static final class UnavailableHandler implements InvocationHandler {
        private final String backendName;
        private final Class<?> failedFutureType;
        private final Object failedFuture;

        private UnavailableHandler(String backendName, Class<?> failedFutureType,
                Object failedFuture) {
            this.backendName = backendName;
            this.failedFutureType = failedFutureType;
            this.failedFuture = failedFuture;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            if (method.getDeclaringClass() == Object.class) {
                if ("equals".equals(method.getName())) {
                    return Boolean.valueOf(args != null
                            && args.length == 1
                            && proxy == args[0]);
                }
                if ("hashCode".equals(method.getName())) {
                    return Integer.valueOf(System.identityHashCode(proxy));
                }
                if ("toString".equals(method.getName())) {
                    return "UnavailableWritingToolsHandler(" + backendName + ")";
                }
            }
            if (method.getReturnType() == void.class) {
                return null;
            }
            if (method.getReturnType() == String.class) {
                return backendName;
            }
            if (method.getReturnType() == failedFutureType) {
                return failedFuture;
            }
            throw new UnsupportedOperationException(
                    "unsupported fail-closed method " + method);
        }
    }
}
