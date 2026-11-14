extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "semicoloncolonel.mobilestream.extension"
}

dependencies {
    // OkHttp is bundled in the target apps at runtime. It is only needed here
    // to compile TrackerBlocker's interceptor.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
    // Google Play's Task API is bundled in every app that asks for a Play
    // review. It is only needed here to compile RatingPromptBlocker.
    compileOnly("com.google.android.gms:play-services-tasks:18.2.0")
}

// The YouTube TV (Android TV) shell patch injects the scripts in src/main/js into the
// youtube.com/tv web app through Cobalt. They are joined (runtime.js first, then the rest in
// name order) and embedded as the Java string constant TvScriptsPayload.SCRIPT, which
// yttvshell/TvScripts reads. Generator idea from ysamjo/morphe-patches and jair1c/farotv-patches
// (both GPLv3); see the NOTICE file.
abstract class GenerateTvScriptsPayload : DefaultTask() {
    @get:InputDirectory
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val scripts: DirectoryProperty

    @get:OutputDirectory
    abstract val outputDirectory: DirectoryProperty

    @TaskAction
    fun generate() {
        val files = scripts.get().asFile.listFiles { f -> f.name.endsWith(".js") }!!
            .sortedWith(compareBy({ it.name != "runtime.js" }, { it.name }))
        val lines = files.flatMap { file ->
            listOf("// ---- ${file.name}") + file.readText(Charsets.UTF_8).lines()
        }
        // Non-ASCII characters become \uXXXX escapes, so the generated Java file does not depend
        // on the compiler's source encoding.
        fun escape(line: String) = buildString {
            for (c in line) when {
                c == '\\' -> append("\\\\")
                c == '"' -> append("\\\"")
                c == '\t' -> append("    ")
                c.code < 32 -> {}
                c.code < 128 -> append(c)
                else -> append("\\u%04x".format(c.code))
            }
        }
        val literal = lines.joinToString("\n                + ") { line -> "\"" + escape(line) + "\\n\"" }
        val target = outputDirectory.file(
            "semicoloncolonel/mobilestream/extension/yttvshell/TvScripts.java",
        ).get().asFile
        target.parentFile.mkdirs()
        // The whole TvScripts class is generated with the script baked in, so the YouTube TV shell
        // patch depends on exactly one extension class (no separate payload class, which morphe
        // could leave behind when copying the extension into the patched app).
        target.writeText(TV_SCRIPTS_HEAD + literal + TV_SCRIPTS_TAIL)
    }

    companion object {
        private val TV_SCRIPTS_HEAD = """
            /* Generated. Injects src/main/js into the YouTube TV web app via Cobalt's
             * WebContents.evaluateJavaScript. Technique from ysamjo/morphe-patches (GPLv3),
             * DylanDuff/utv-runtime (MIT) and jair1c/farotv-patches (GPLv3); see NOTICE. */
            package semicoloncolonel.mobilestream.extension.yttvshell;

            import android.util.Log;
            import java.lang.reflect.Field;
            import java.lang.reflect.Method;

            @SuppressWarnings("unused")
            public final class TvScripts {
                static final String TAG = "MSP-YTTV-SHELL";
                private static final String LOG_PREFIX = "tvp:";
                private static Object webContents;
                private static Field pointerField;
                private static Method evaluateJavaScript;

                private TvScripts() {}

                public static void setWebContents(Object contents) {
                    webContents = contents;
                    pointerField = null;
                }

                public static void onPageEvent(String event) {
                    if (inject()) Log.d(TAG, "scripts injected (" + event + ")");
                }

                public static void onTitle(String title) {
                    if (title != null && title.startsWith(LOG_PREFIX)) Log.i(TAG, title.substring(LOG_PREFIX.length()));
                }

                private static boolean inject() {
                    return evaluate(script());
                }

                static boolean evaluate(String javaScript) {
                    try {
                        Object contents = webContents;
                        if (contents == null) return false;
                        if (pointerField == null) pointerField = findNativePointerField(contents);
                        if (pointerField == null) { Log.w(TAG, "native pointer field not found"); return false; }
                        long pointer = pointerField.getLong(contents);
                        if (pointer == 0L) return false;
                        if (evaluateJavaScript == null) evaluateJavaScript = findEvaluateJavaScript();
                        if (evaluateJavaScript == null) { Log.w(TAG, "evaluateJavaScript native not found"); return false; }
                        evaluateJavaScript.invoke(null, pointer, javaScript, null);
                        return true;
                    } catch (Throwable t) {
                        Log.w(TAG, "script injection failed", t);
                        return false;
                    }
                }

                private static Field findNativePointerField(Object contents) {
                    for (Class<?> type = contents.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
                        for (Field field : type.getDeclaredFields()) {
                            if (field.getType() != long.class) continue;
                            try { field.setAccessible(true); if (field.getLong(contents) != 0L) return field; } catch (Throwable ignored) {}
                        }
                    }
                    return null;
                }

                private static Method findEvaluateJavaScript() throws ClassNotFoundException {
                    Class<?> genJni = Class.forName("org.jni_zero.GEN_JNI");
                    for (Method method : genJni.getDeclaredMethods()) {
                        if (!method.getName().endsWith("WebContentsImpl_evaluateJavaScript")) continue;
                        Class<?>[] parameters = method.getParameterTypes();
                        if (parameters.length == 3 && parameters[0] == long.class) { method.setAccessible(true); return method; }
                    }
                    return null;
                }

                private static String script() {
                    return
        """.trimIndent() + "\n                "
        private val TV_SCRIPTS_TAIL = ";\n    }\n}\n"
    }
}

androidComponents.onVariants { variant ->
    val task = tasks.register<GenerateTvScriptsPayload>(
        "generate${variant.name.replaceFirstChar { it.uppercaseChar() }}TvScriptsPayload",
    ) {
        scripts.set(layout.projectDirectory.dir("src/main/js"))
    }
    variant.sources.java?.addGeneratedSourceDirectory(task, GenerateTvScriptsPayload::outputDirectory)
}
