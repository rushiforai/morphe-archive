/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import com.sun.jna.Native;
import com.sun.jna.Pointer;
import com.sun.jna.WString;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.win32.StdCallLibrary;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

/** An owned, short-lived stand-in for a tool holding its output descriptor open. */
public final class CodecPipeTool {
    public static void main(String[] args) throws Exception {
        String mode = args[0];
        File marker = new File(args[1]);
        Class<?> handle = Class.forName("java.lang.ProcessHandle");
        long pid = (Long) handle.getMethod("pid").invoke(handle.getMethod("current").invoke(null));
        Files.write(marker.toPath(), (pid + "\n").getBytes(StandardCharsets.UTF_8), StandardOpenOption.APPEND);
        if (mode.equals("arguments")) {
            String[] observed = File.separatorChar == '\\' ? windowsArguments(args.length) : args;
            System.out.write(String.join("\n", Arrays.copyOfRange(observed, 2, observed.length)).getBytes(StandardCharsets.UTF_8));
            System.out.flush();
            return;
        }
        if (mode.equals("success")) {
            byte[] bytes = new byte[1024 * 1024];
            for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) ('a' + i % 26);
            System.out.write(bytes);
            System.out.flush();
            return;
        }
        if (mode.equals("fail")) {
            System.out.println("encoder-error");
            System.exit(7);
        }
        if (mode.equals("child") || mode.equals("branch") || mode.equals("orphan-branch")) {
            if (!mode.equals("child")) {
                if (mode.equals("orphan-branch")) {
                    // Start the grandchild after the actual parent exit, not an assumed delay.
                    Optional<?> parent = (Optional<?>) handle.getMethod("of", long.class)
                            .invoke(null, Long.parseLong(args[2]));
                    if (parent.isPresent()) {
                        CompletableFuture<?> exited = (CompletableFuture<?>) handle.getMethod("onExit").invoke(parent.get());
                        exited.get(6, TimeUnit.SECONDS);
                    }
                }
                File java = new File(System.getProperty("java.home"), "bin/" + (File.separatorChar == '\\' ? "java.exe" : "java"));
                File classes = new File(CodecPipeTool.class.getProtectionDomain().getCodeSource().getLocation().toURI());
                new ProcessBuilder(java.getPath(), "-cp", classes.getPath(), CodecPipeTool.class.getName(), "child", marker.getPath())
                        .inheritIO().start();
            } else {
                // Only the final output-holding descendant reports readiness after recording its PID.
                System.out.println("child-ready");
                System.out.flush();
            }
        } else {
            System.out.println("parent-ready");
            if (mode.equals("tree") || mode.equals("orphan")) {
                File java = new File(System.getProperty("java.home"), "bin/" + (File.separatorChar == '\\' ? "java.exe" : "java"));
                File classes = new File(CodecPipeTool.class.getProtectionDomain().getCodeSource().getLocation().toURI());
                String branch = mode.equals("orphan") ? "orphan-branch" : "branch";
                new ProcessBuilder(java.getPath(), "-cp", classes.getPath(), CodecPipeTool.class.getName(), branch,
                        marker.getPath(), Long.toString(pid))
                        .inheritIO().start();
                if (mode.equals("orphan")) return;
            }
        }
        System.out.flush();
        // Even a regressed test helper cannot leave these tools running indefinitely.
        Thread.sleep(8_000);
    }

    private static String[] windowsArguments(int expectedCount) throws IOException {
        // java.exe converts its native UTF-16 command line to CP_ACP before building main's args.
        // Read the argv actually received by this process, not the launcher's command file.
        // https://github.com/openjdk/jdk/blob/jdk-25-ga/src/java.base/share/native/launcher/main.c
        Kernel kernel = Native.load("kernel32", Kernel.class);
        IntByReference count = new IntByReference();
        Pointer values = Native.load("shell32", Shell.class).CommandLineToArgvW(
                new WString(kernel.GetCommandLineW().getWideString(0)), count);
        if (values == null) throw new IOException("read native tool arguments failed: " + Native.getLastError());
        try {
            int first = count.getValue() - expectedCount;
            if (first < 1 || !CodecPipeTool.class.getName().equals(
                    values.getPointer((long) (first - 1) * Native.POINTER_SIZE).getWideString(0)))
                throw new IOException("native tool argument count differs from main's args");
            String[] args = new String[expectedCount];
            for (int i = 0; i < args.length; i++)
                args[i] = values.getPointer((long) (first + i) * Native.POINTER_SIZE).getWideString(0);
            return args;
        } finally {
            if (kernel.LocalFree(values) != null)
                throw new IOException("free native tool arguments failed: " + Native.getLastError());
        }
    }

    public interface Kernel extends StdCallLibrary {
        Pointer GetCommandLineW();
        Pointer LocalFree(Pointer memory);
    }

    public interface Shell extends StdCallLibrary {
        Pointer CommandLineToArgvW(WString command, IntByReference count);
    }
}
