/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;

/** An owned, short-lived stand-in for a tool holding its output descriptor open. */
public final class CodecPipeTool {
    public static void main(String[] args) throws Exception {
        String mode = args[0];
        File marker = new File(args[1]);
        Class<?> handle = Class.forName("java.lang.ProcessHandle");
        long pid = (Long) handle.getMethod("pid").invoke(handle.getMethod("current").invoke(null));
        Files.write(marker.toPath(), (pid + "\n").getBytes(StandardCharsets.UTF_8), StandardOpenOption.APPEND);
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
        if (mode.equals("child") || mode.equals("branch")) {
            System.out.println("child-ready");
            System.out.flush();
            if (mode.equals("branch")) {
                // The orphan's parent exits before this grandchild exists.
                Thread.sleep(600);
                File java = new File(System.getProperty("java.home"), "bin/" + (File.separatorChar == '\\' ? "java.exe" : "java"));
                File classes = new File(CodecPipeTool.class.getProtectionDomain().getCodeSource().getLocation().toURI());
                new ProcessBuilder(java.getPath(), "-cp", classes.getPath(), CodecPipeTool.class.getName(), "child", marker.getPath())
                        .inheritIO().start();
            }
        } else {
            System.out.println("parent-ready");
            if (mode.equals("tree") || mode.equals("orphan")) {
                File java = new File(System.getProperty("java.home"), "bin/" + (File.separatorChar == '\\' ? "java.exe" : "java"));
                File classes = new File(CodecPipeTool.class.getProtectionDomain().getCodeSource().getLocation().toURI());
                new ProcessBuilder(java.getPath(), "-cp", classes.getPath(), CodecPipeTool.class.getName(), "branch", marker.getPath())
                        .inheritIO().start();
                if (mode.equals("orphan")) { Thread.sleep(300); return; }
            }
        }
        System.out.flush();
        // Even a regressed test helper cannot leave these tools running indefinitely.
        Thread.sleep(8_000);
    }
}
