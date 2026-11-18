package app.revanced.patches.rif.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.iface.ClassDef

// Morphe only: the ReVanced patcher API our patches are written against, on top of Morphe's.
// ReVanced has `classes` (all classes, extension included) and `proxy(classDef).mutableClass`;
// Morphe has classDefForEach and mutableClassDefBy. dev/morphe-sync.py adds the imports.

/** Every class in the app and the merged extension, like ReVanced's `classes`. */
internal val BytecodePatchContext.classes: List<ClassDef>
    get() {
        val all = ArrayList<ClassDef>()
        classDefForEach { all.add(it) }
        return all
    }

/** Stand-in for ReVanced's ClassProxy; its mutableClass is Morphe's mutableClassDefBy. */
internal class MorpheClassProxy(val mutableClass: MutableClass)

internal fun BytecodePatchContext.proxy(classDef: ClassDef) = MorpheClassProxy(mutableClassDefBy(classDef))
