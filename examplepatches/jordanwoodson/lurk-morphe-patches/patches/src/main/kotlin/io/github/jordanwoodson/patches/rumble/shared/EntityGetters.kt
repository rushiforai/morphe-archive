package io.github.jordanwoodson.patches.rumble.shared

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.jordanwoodson.patches.shared.compose.toStringField
import io.github.jordanwoodson.patches.shared.compose.toStringGetter

/** The getter of the field a Kotlin data class prints after [label] in its toString() (see patches/shared/compose). */
internal fun ClassDef.toStringGetter(label: String): String = toStringGetter(RUMBLE, label)

/** The field a Kotlin data class prints after [label] in its toString(), for fields R8 left without a getter. */
internal fun ClassDef.toStringField(label: String): FieldReference = toStringField(RUMBLE, label)
