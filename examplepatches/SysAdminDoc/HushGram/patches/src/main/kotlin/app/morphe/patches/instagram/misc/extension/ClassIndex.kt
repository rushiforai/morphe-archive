/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.iface.ClassDef

/*
 * Instagram 449 has about 200,000 classes, and a walk over every one of them, reading each
 * method's instructions, takes a second or two on a desktop and many times that on a phone. The
 * patches used to make dozens of those walks, which is most of why patching in Manager was slow
 * (#60). The patcher indexes every class's string constants and literals once; these narrow a
 * search to the classes the index names, and the caller still checks each method itself, so what
 * a patch finds doesn't change.
 */

/**
 * The classes outside the extension whose code loads every one of [strings] as a string
 * constant, in the app's order. A method that holds all of them is in one of these classes.
 */
internal fun BytecodePatchContext.classesHolding(vararg strings: String): List<ClassDef> {
    require(strings.isNotEmpty()) { "no string to look for" }
    val sets = strings.map { string -> classDefByStrings(string) }
    val smallest = sets.minBy { it.size }
    val others = sets.filter { it !== smallest }.map { set -> set.mapTo(HashSet()) { it.type } }
    return smallest.filter { classDef -> !classDef.type.startsWith(EXTENSION_ROOT) && others.all { classDef.type in it } }
}

/**
 * The classes outside the extension whose code loads [literal] (a `const` or `const-wide` value),
 * in the app's order. The patcher's literal index picks the classes to read; a class a patch has
 * changed since it indexed the app is always read.
 */
internal fun BytecodePatchContext.classesLoading(literal: Long): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(literal(literal))))

/**
 * The classes outside the extension whose code calls [name] on [definingClass], in the app's
 * order. The patcher's index of the types each class refers to picks the classes to read; a class
 * a patch has changed since it indexed the app is always read.
 */
internal fun BytecodePatchContext.classesCalling(definingClass: String, name: String): List<ClassDef> =
    classesMatching(Fingerprint(filters = listOf(methodCall(definingClass = definingClass, name = name))))

/**
 * The types of the classes outside the extension holding a purge marker (see [markers]) named one
 * of [names]. A marker named X is a string ending in `_X`, so a class this leaves out holds none.
 * Filter a class walk by it to keep the app's order.
 */
internal fun BytecodePatchContext.typesMarked(vararg names: String): Set<String> {
    require(names.isNotEmpty()) { "no marker to look for" }
    return names.flatMapTo(HashSet()) { name -> classDefByStrings("_$name", StringComparisonType.ENDS_WITH).map { it.type } }
        .filterNotTo(HashSet()) { it.startsWith(EXTENSION_ROOT) }
}

/** The classes outside the extension holding a method [fingerprint] matches, in the app's order. */
private fun BytecodePatchContext.classesMatching(fingerprint: Fingerprint): List<ClassDef> =
    fingerprint.matchAllOrNull().orEmpty().map { it.originalMethod.definingClass }.distinct()
        .filterNot { it.startsWith(EXTENSION_ROOT) }
        .map { classDefBy(it) }
