/*
 * Dry-run compatibility report for Messenger APKs, and the source of each build's profile.
 *
 * Checks whether a given APK is compatible with every HushMessenger patch
 * without modifying the file. Prints package, version code, ABI, signer and
 * PASS/FAIL per patch, then exits non-zero on any failure.
 *
 * Every supported build is recorded in scripts/profiles/<version code>.txt: its
 * version, SHA-256, hooks, the other values ControlProfile pins and the permission
 * loads. This report compares an APK with its recorded build, and the Python
 * scripts read their version and checksum tables from the same files. A Gradle
 * test checks each record against the Kotlin profiles, so the copies can't drift.
 *
 * The report's code is in scripts/compat, one file per family of patches, with
 * compat.CompatReport holding the tables and main. This file compiles that folder
 * in memory and runs it, so it starts the same way the single file did.
 *
 * Adding a build:
 *   CompatReport <apk> --save <profiles dir> <desktop.jar> <bundle.mpp>
 *                                     records the build only after Desktop applies
 *                                     and rebuilds every patch, then prints Kotlin.
 *   CompatReport --kotlin <record.txt>  prints the Kotlin for a recorded build again.
 *
 * Run the source file directly:
 *   java -cp <dexlib2.jar>;<guava.jar> scripts/CompatReport.java <apk>
 * or compile once:
 *   javac -cp <dexlib2.jar>;<guava.jar> -d scripts scripts/compat/*.java
 *   java -cp <dexlib2.jar>;<guava.jar>;scripts compat.CompatReport <apk>
 *
 * Requires: JDK 21+, smali-dexlib2-3.0.9.jar, guava-33.x-jre.jar,
 *           aapt2 and apksigner from Android Build Tools.
 */

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.ProtectionDomain;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;
import javax.tools.DiagnosticCollector;
import javax.tools.FileObject;
import javax.tools.ForwardingJavaFileManager;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.SimpleJavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

public class CompatReport {

    public static void main(String[] args) throws Throwable {
        Path sources = scriptDir().resolve("compat");
        List<Path> files;
        try (Stream<Path> listing = Files.list(sources)) {
            files = listing.filter(p -> p.getFileName().toString().endsWith(".java")).sorted().toList();
        } catch (IOException e) {
            System.err.println(sources + ": can't read the report's sources (" + e.getMessage() + ")");
            System.exit(2);
            return;
        }
        Map<String, byte[]> classes = compile(files);
        // The fresh classes come first, so compat classes compiled earlier onto the classpath can't stand in for them, and
        // they share this file's code source, which the report reads its folder from when this file runs compiled.
        ProtectionDomain domain = CompatReport.class.getProtectionDomain();
        ClassLoader loader = new ClassLoader(CompatReport.class.getClassLoader()) {
            @Override
            protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                synchronized (getClassLoadingLock(name)) {
                    Class<?> loaded = findLoadedClass(name);
                    if (loaded == null) {
                        byte[] bytes = classes.get(name);
                        loaded = bytes != null ? defineClass(name, bytes, 0, bytes.length, domain) : super.loadClass(name, false);
                    }
                    if (resolve) resolveClass(loaded);
                    return loaded;
                }
            }
        };
        var report = loader.loadClass("compat.CompatReport").getMethod("main", String[].class);
        try {
            report.invoke(null, (Object) args);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    /** The compiled classes of scripts/compat by binary name, compiled against this JVM's classpath. */
    static Map<String, byte[]> compile(List<Path> files) {
        JavaCompiler javac = ToolProvider.getSystemJavaCompiler();
        if (javac == null) {
            System.err.println("This Java has no compiler. Run the report with a JDK 21 or newer.");
            System.exit(2);
        }
        var diagnostics = new DiagnosticCollector<JavaFileObject>();
        StandardJavaFileManager standard = javac.getStandardFileManager(diagnostics, null, StandardCharsets.UTF_8);
        Map<String, ByteArrayOutputStream> written = new HashMap<>();
        var memory = new ForwardingJavaFileManager<StandardJavaFileManager>(standard) {
            @Override
            public JavaFileObject getJavaFileForOutput(Location location, String className, JavaFileObject.Kind kind,
                                                       FileObject sibling) {
                URI uri = URI.create("memory:///" + className.replace('.', '/') + kind.extension);
                return new SimpleJavaFileObject(uri, kind) {
                    @Override
                    public OutputStream openOutputStream() {
                        var out = new ByteArrayOutputStream();
                        written.put(className, out);
                        return out;
                    }
                };
            }
        };
        List<String> options = List.of("-proc:none", "-nowarn", "-encoding", "UTF-8",
            "-cp", System.getProperty("java.class.path", ""));
        boolean compiled = javac.getTask(null, memory, diagnostics, options, null,
            standard.getJavaFileObjectsFromPaths(files)).call();
        if (!compiled) {
            diagnostics.getDiagnostics().forEach(d -> System.err.println(d));
            System.exit(2);
        }
        Map<String, byte[]> classes = new HashMap<>();
        written.forEach((name, out) -> classes.put(name, out.toByteArray()));
        return classes;
    }

    /** The directory this report was started from, as a source file or as a compiled class. */
    static Path scriptDir() {
        String source = System.getProperty("jdk.launcher.sourcefile");
        if (source != null) return Path.of(source).toAbsolutePath().getParent();
        try {
            return Path.of(CompatReport.class.getProtectionDomain().getCodeSource().getLocation().toURI());
        } catch (Exception e) {
            return Path.of("scripts");
        }
    }
}
