package dev.jason.gboardpatches.extension.quickjs;

import android.content.Context;
import android.os.Build;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.security.MessageDigest;

import dev.jason.gboardpatches.extension.toprowswipe.quickjs.QuickJsNgNativePayload;

final class QuickJsNgLibraryLoader {
    private static final String SUPPORTED_ABI = "arm64-v8a";
    private static final String PAYLOAD_DIR = "quickjs-ng";

    private static boolean loaded;

    private QuickJsNgLibraryLoader() {
    }

    static synchronized void load() {
        if (loaded) {
            return;
        }
        verifySupportedAbi();
        Context context = applicationContext();
        if (context == null) {
            throw new UnsatisfiedLinkError("Application context unavailable for QuickJS payload");
        }
        File payloadFile = materializePayload(context);
        System.load(payloadFile.getAbsolutePath());
        loaded = true;
    }

    private static void verifySupportedAbi() {
        String[] supportedAbis = Build.SUPPORTED_ABIS;
        if (supportedAbis == null) {
            throw new UnsatisfiedLinkError("SUPPORTED_ABIS unavailable");
        }
        for (String abi : supportedAbis) {
            if (SUPPORTED_ABI.equals(abi)) {
                return;
            }
        }
        throw new UnsatisfiedLinkError("QuickJS payload only supports " + SUPPORTED_ABI);
    }

    private static Context applicationContext() {
        Context context = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (context != null) {
            return context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
        }
        context = reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
        if (context != null) {
            return context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
        }
        return null;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Method method = owner.getDeclaredMethod(methodName);
            Object application = method.invoke(null);
            return application instanceof Context context ? context : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static File materializePayload(Context context) {
        File payloadDirectory = new File(context.getDir(PAYLOAD_DIR, Context.MODE_PRIVATE),
                QuickJsNgNativePayload.abi());
        if (!payloadDirectory.exists() && !payloadDirectory.mkdirs()) {
            throw new UnsatisfiedLinkError("Failed to create QuickJS payload directory");
        }
        File targetFile = new File(payloadDirectory, QuickJsNgNativePayload.libraryName());
        if (targetFile.isFile() && QuickJsNgNativePayload.sha256().equals(sha256(targetFile))) {
            return targetFile;
        }

        byte[] payloadBytes = decodeBase64(QuickJsNgNativePayload.base64());
        File tempFile = new File(payloadDirectory,
                QuickJsNgNativePayload.libraryName() + ".tmp");
        try (FileOutputStream outputStream = new FileOutputStream(tempFile, false)) {
            outputStream.write(payloadBytes);
            outputStream.flush();
        } catch (Throwable throwable) {
            throw new UnsatisfiedLinkError("Failed to write QuickJS payload: "
                    + throwable.getMessage());
        }
        if (targetFile.exists() && !targetFile.delete()) {
            throw new UnsatisfiedLinkError("Failed to replace QuickJS payload");
        }
        if (!tempFile.renameTo(targetFile)) {
            throw new UnsatisfiedLinkError("Failed to finalize QuickJS payload");
        }
        return targetFile;
    }

    private static byte[] decodeBase64(String value) {
        try {
            return android.util.Base64.decode(value, android.util.Base64.DEFAULT);
        } catch (Throwable ignored) {
            try {
                Class<?> base64Class = Class.forName("java.util.Base64");
                Object decoder = base64Class.getDeclaredMethod("getDecoder").invoke(null);
                return (byte[]) decoder.getClass()
                        .getDeclaredMethod("decode", String.class)
                        .invoke(decoder, value);
            } catch (Throwable throwable) {
                throw new UnsatisfiedLinkError("Failed to decode QuickJS payload");
            }
        }
    }

    private static String sha256(File file) {
        try {
            byte[] bytes = java.nio.file.Files.readAllBytes(file.toPath());
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
            StringBuilder builder = new StringBuilder(digest.length * 2);
            for (byte value : digest) {
                builder.append(String.format("%02x", value));
            }
            return builder.toString();
        } catch (Throwable ignored) {
            return "";
        }
    }
}
