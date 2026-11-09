/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherProgress
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.io.File

/**
 * A patcher context over a handful of classes and no APK, so a test can run a patch's execute block
 * as the patcher does and read what it left in each class.
 *
 * The patcher fills its class pool from an APK's dex files, and what takes a pool directly is
 * internal to it: the context's constructor, the pool's class and its setter. They are reached by
 * their JVM names, pinned to morphe-patcher 2.3.0. A bump that renames one fails here, naming it,
 * rather than leaving a test that never ran the patch. Nothing is written to disk: the context only
 * names its work folders until something compiles the dex, which no test here asks for.
 *
 * Fingerprint validation is on, as it is in verify-all-patches.ps1's `--validate` run: a fingerprint
 * that fits two methods throws instead of taking the first, whether a patch reads it through
 * `match()`, `method` or `methodOrNull`, so an optional hook that fits twice fails its patch too.
 * `matchAll()` is unaffected, and so is a fingerprint that fits nothing.
 */
internal object PatchContexts {
    fun of(classes: Collection<ClassDef>): BytecodePatchContext {
        val work = File(System.getProperty("java.io.tmpdir"), "hushthreads-patch-context")
        val config = PatcherConfig(apkFile = File(work, "none.apk"), temporaryFilesPath = work, validate = true)
        val metadataType = Class.forName("app.morphe.patcher.PackageMetadata")
        val metadata = metadataType.getConstructor(
            String::class.java, String::class.java, String::class.java,
            Class.forName("com.reandroid.archive.block.ApkSignatureBlock"),
        ).newInstance("com.instagram.barcelona", "0", "0", null)
        val context = BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, metadataType)
            .newInstance(config, metadata)
        val poolType = Class.forName("app.morphe.patcher.util.PatchClasses")
        // Patcher 2.3.0 hands PatchClasses a PatcherProgress beside the classes; tests report none.
        val pool = poolType.getConstructor(Set::class.java, PatcherProgress::class.java).newInstance(classes.toSet(), null)
        BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", poolType).invoke(context, pool)
        BytecodePatchContext::class.java.getMethod("setOpcodes\$morphe_patcher", Opcodes::class.java)
            .invoke(context, Opcodes.getDefault())
        makeCurrent(context, metadata, work)
        return context
    }

    /**
     * Patcher 2.3.0 answers fingerprints and class lookups from one patcher-wide context, the one an
     * APK is being patched in, rather than from the context a call is made with. Its constructor reads
     * that APK, so the test allocates one without it, hands it [context] as its bytecode side and makes
     * it the current one. Each [of] replaces the one before, so a test reads a context before building
     * the next.
     */
    private fun makeCurrent(context: BytecodePatchContext, metadata: Any, work: File) {
        val type = Class.forName("app.morphe.patcher.PatcherContext")
        val unsafe = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe").apply { isAccessible = true }.get(null)
        val current = unsafe.javaClass.getMethod("allocateInstance", Class::class.java).invoke(unsafe, type)
        fun set(field: String, value: Any) = type.getDeclaredField(field).apply { isAccessible = true }.set(current, value)
        set("bytecodeContext", context)
        set("packageMetadata", metadata)
        set("fileWorkspace", work)
        set("executablePatches", LinkedHashSet<Any>())
        set("allPatches", LinkedHashSet<Any>())
        val companion = type.getField("Companion").get(null)
        companion.javaClass.getMethod("setCurrent\$morphe_patcher", type).invoke(companion, current)
    }
}
