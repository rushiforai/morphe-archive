package app.hushmessenger.patches

import app.morphe.patcher.patch.classDefForEach
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** Where the HushMessenger extension's classes live once it's merged into the APK. */
internal const val EXTENSION_PACKAGE = "Lapp/hushmessenger/extension/"

/**
 * Whether [this] is one of the extension's own classes rather than Messenger's. Every scan that rewrites code it finds
 * by a string or a shape skips these: the extension carries the same strings (CloneCompat builds the running copy's
 * names out of them), and rewriting them there breaks the extension itself.
 */
internal fun ClassDef.isExtension(): Boolean = type.startsWith(EXTENSION_PACKAGE)

/** Whether [this] belongs to one of the extension's own classes, for scans that walk methods rather than classes. */
internal fun Method.isExtension(): Boolean = definingClass.startsWith(EXTENSION_PACKAGE)

/**
 * Messenger's own classes, without the extension's. Every patch that searches the whole app for code to rewrite reads
 * these, so it sees the same classes in a real patch as the real-APK tests do, which read the stock dex alone.
 */
internal fun messengerClasses(): List<ClassDef> =
    mutableListOf<ClassDef>().apply { classDefForEach { if (!it.isExtension()) add(it) } }
