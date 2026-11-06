package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Runtime access to the reviewed, generated Gboard target contract. */
final class GboardCustomThemeTargetContract {
    private GboardCustomThemeTargetContract() {
    }

    static Object peerFromFragment(Object fragment) throws ReflectiveOperationException {
        return readField(fragment, GboardCustomThemeVersionBindings.RESULT_CLASS,
                GboardCustomThemeVersionBindings.FRAGMENT_PEER_FIELD);
    }

    static Object contextFromPeer(Object peer) throws ReflectiveOperationException {
        return readField(peer, GboardCustomThemeVersionBindings.PEER_CLASS,
                GboardCustomThemeVersionBindings.PEER_CONTEXT_FIELD);
    }

    static void invokeStockPlus(Object plusItem, Object peer, Object adapter, int position)
            throws ReflectiveOperationException {
        ClassLoader loader = plusItem.getClass().getClassLoader();
        Class<?> plusClass = targetClass(loader, GboardCustomThemeVersionBindings.PLUS_CLASS);
        Class<?> peerClass = targetClass(loader, GboardCustomThemeVersionBindings.PEER_CLASS);
        Class<?> adapterClass = targetClass(loader, GboardCustomThemeVersionBindings.ADAPTER_CLASS);
        requireInstance(plusItem, plusClass);
        requireInstance(peer, peerClass);
        requireInstance(adapter, adapterClass);
        Method method = plusClass.getDeclaredMethod(
                GboardCustomThemeVersionBindings.PLUS_METHOD,
                peerClass, adapterClass, Integer.TYPE);
        method.setAccessible(true);
        method.invoke(plusItem, peer, adapter, position);
    }

    static void deliverImportedTheme(Object peer, Intent result)
            throws ReflectiveOperationException {
        ClassLoader loader = peer.getClass().getClassLoader();
        Class<?> peerClass = targetClass(loader, GboardCustomThemeVersionBindings.PEER_CLASS);
        requireInstance(peer, peerClass);
        Method method = peerClass.getDeclaredMethod(
                GboardCustomThemeVersionBindings.PEER_RESULT_METHOD, Intent.class);
        method.setAccessible(true);
        method.invoke(peer, result);
    }

    static void launchActivityForResult(Object peer, Intent intent, int requestCode, Bundle options)
            throws ReflectiveOperationException {
        ClassLoader loader = peer.getClass().getClassLoader();
        Object launcher = readField(peer, GboardCustomThemeVersionBindings.PEER_CLASS,
                GboardCustomThemeVersionBindings.PEER_LAUNCHER_FIELD);
        Class<?> launcherClass = targetClass(loader,
                GboardCustomThemeVersionBindings.LAUNCHER_CLASS);
        requireInstance(launcher, launcherClass);
        Method method = launcherClass.getDeclaredMethod(
                GboardCustomThemeVersionBindings.LAUNCHER_METHOD,
                Intent.class, Integer.TYPE, Bundle.class);
        method.setAccessible(true);
        method.invoke(launcher, intent, requestCode, options);
    }

    static boolean validateThemeArchive(Context context, File archive)
            throws ReflectiveOperationException {
        Class<?> validatorClass = targetClass(context.getClassLoader(),
                GboardCustomThemeVersionBindings.VALIDATOR_CLASS);
        Method method = validatorClass.getDeclaredMethod(
                GboardCustomThemeVersionBindings.VALIDATOR_METHOD, File.class);
        if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != Boolean.TYPE) {
            throw new NoSuchMethodException("Theme validator shape mismatch");
        }
        method.setAccessible(true);
        return Boolean.TRUE.equals(method.invoke(null, archive));
    }

    private static Object readField(Object receiver, String ownerName, String fieldName)
            throws ReflectiveOperationException {
        Class<?> owner = targetClass(receiver.getClass().getClassLoader(), ownerName);
        requireInstance(receiver, owner);
        Field field = owner.getDeclaredField(fieldName);
        field.setAccessible(true);
        return field.get(receiver);
    }

    private static Class<?> targetClass(ClassLoader loader, String name)
            throws ClassNotFoundException {
        return Class.forName(name, false, loader);
    }

    private static void requireInstance(Object value, Class<?> expected) {
        if (value == null || !expected.isInstance(value)) {
            throw new IllegalArgumentException("Gboard target contract instance mismatch: "
                    + expected.getName());
        }
    }
}
