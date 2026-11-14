/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.PatcherProgress
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.io.File
import java.lang.ref.WeakReference

/**
 * A patcher context over a handful of classes and no APK, so a test can run a patch's execute block
 * as the patcher does and read what it left in each class.
 *
 * The patcher fills its class pool from an APK's dex files, and what takes a pool directly is
 * internal to it: the context's constructor, the pool's class and its setter. They are reached by
 * their JVM names, pinned to morphe-patcher 2.3.0. A bump that renames one fails here, naming it,
 * rather than leaving a test that never ran the patch. Nothing is written to disk: the context only
 * names its work folders until something compiles the dex, which no test here asks for.
 */
internal object PatchContexts {
    fun of(classes: Collection<ClassDef>): BytecodePatchContext {
        // Production starts each APK with fresh matches. Synthetic contexts must do the same:
        // a fingerprint otherwise retains a method belonging to the previous fixture.
        // The pinned patcher's bulk reset also empties its registry, which would miss reused
        // singleton fingerprints on a third context. Clear matches without removing entries.
        val fingerprints = Fingerprint::class.java.getDeclaredField("fingerprintList").apply { isAccessible = true }
        @Suppress("UNCHECKED_CAST")
        (fingerprints.get(null) as List<WeakReference<Fingerprint>>).forEach { it.get()?.clearMatch() }
        val work = File(System.getProperty("java.io.tmpdir"), "hushpinterest-patch-context")
        val config = PatcherConfig(apkFile = File(work, "none.apk"), temporaryFilesPath = work)
        val metadataType = Class.forName("app.morphe.patcher.PackageMetadata")
        val metadata = metadataType.getConstructor(
            String::class.java, String::class.java, String::class.java,
            Class.forName("com.reandroid.archive.block.ApkSignatureBlock"),
        ).newInstance("com.pinterest", "0", "0", null)
        val context = BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, metadataType)
            .newInstance(config, metadata)
        val poolType = Class.forName("app.morphe.patcher.util.PatchClasses")
        // Patcher 2.3.0 hands PatchClasses a PatcherProgress beside the classes; tests report none.
        val pool = poolType.getConstructor(Set::class.java, PatcherProgress::class.java).newInstance(classes.toSet(), null)
        BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", poolType).invoke(context, pool)
        BytecodePatchContext::class.java.getMethod("setOpcodes\$morphe_patcher", Opcodes::class.java)
            .invoke(context, Opcodes.getDefault())
        makeCurrent(context, metadata)
        return context
    }

    /**
     * Patcher 2.3.0's global lookups (classDefBy and the rest) read the patcher's current context,
     * which only its own run sets. A context built here becomes current the same way, through an
     * instance that skips the constructor's APK reading and holds just the bytecode context and
     * package metadata. The newest context built is the current one, as in the patcher.
     */
    private fun makeCurrent(context: BytecodePatchContext, metadata: Any) {
        val unsafeField = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe").apply { isAccessible = true }
        val unsafe = unsafeField.get(null)
        val patcher = unsafe.javaClass.getMethod("allocateInstance", Class::class.java)
            .invoke(unsafe, PatcherContext::class.java)
        PatcherContext::class.java.getDeclaredField("bytecodeContext").apply { isAccessible = true }.set(patcher, context)
        PatcherContext::class.java.getDeclaredField("packageMetadata").apply { isAccessible = true }.set(patcher, metadata)
        PatcherContext::class.java.getDeclaredField("current").apply { isAccessible = true }.set(null, patcher)
    }
}
