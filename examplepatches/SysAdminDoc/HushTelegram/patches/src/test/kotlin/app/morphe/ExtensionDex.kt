/*
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

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.value.LongEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.nio.ByteBuffer
import app.morphe.util.names.origName
import app.morphe.util.names.origType

/**
 * The Telegram extension as the bundle carries it: the dex R8 wrote, which the Morphe plugin puts
 * among this module's resources as `extensions/telegram.mpe`, so every test run reads the one built
 * from the current sources. A test that reads it sees the descriptors and constants the patched app
 * gets, not the Java that compiles to them.
 */
internal object ExtensionDex {
    private const val PAYLOAD = "extensions/telegram.mpe"
    private const val SHARED_PAYLOAD = "extensions/shared.mpe"

    private val dex: DexBackedDexFile by lazy { read(PAYLOAD) }
    private val shared: DexBackedDexFile by lazy { read(SHARED_PAYLOAD) }

    private fun read(payload: String): DexBackedDexFile {
        val bytes = ExtensionDex::class.java.classLoader.getResourceAsStream(payload)?.use { it.readBytes() }
            ?: throw AssertionError("$payload is not on the test classpath. :patches:processResources copies it there.")
        return DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes))
    }

    /**
     * Every class in the shared extension (Utils, the settings framework), which the patcher merges
     * in beside the Telegram one, minus any the Telegram payload already carries.
     */
    fun sharedClasses(): List<ClassDef> {
        val own = dex.classes.mapTo(HashSet()) { it.type }
        return shared.classes.filter { it.origType !in own }
    }

    /** The class of [type] in the payload. */
    fun classDef(type: String): ClassDef =
        dex.classes.firstOrNull { it.origType == type } ?: throw AssertionError("$PAYLOAD holds no $type")

    /** Every class in the payload, as the patcher sees them merged into the app. */
    fun classes(): List<ClassDef> = dex.classes.toList()

    /** The value a static final String field of [type] starts with, as javac wrote it into the class. */
    fun stringConstant(type: String, field: String): String {
        val declared = classDef(type).staticFields.firstOrNull { it.origName == field }
            ?: throw AssertionError("$type in $PAYLOAD has no static field $field")
        return (declared.initialValue as? StringEncodedValue)?.value
            ?: throw AssertionError("$type.$field in $PAYLOAD starts with no string: ${declared.initialValue}")
    }

    /** The value a static final long field of [type] starts with, as javac wrote it into the class. */
    fun longConstant(type: String, field: String): Long {
        val declared = classDef(type).staticFields.firstOrNull { it.origName == field }
            ?: throw AssertionError("$type in $PAYLOAD has no static field $field")
        return (declared.initialValue as? LongEncodedValue)?.value
            ?: throw AssertionError("$type.$field in $PAYLOAD starts with no long: ${declared.initialValue}")
    }
}
