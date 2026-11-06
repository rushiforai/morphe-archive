package io.github.jordanwoodson.patches.rumble.shared

import com.android.tools.smali.dexlib2.iface.ClassDef
import io.github.jordanwoodson.patches.shared.compose.toStringGetter

/** The getter of the field a Kotlin data class prints after [label] in its toString() (see patches/shared/compose). */
internal fun ClassDef.toStringGetter(label: String): String = toStringGetter(RUMBLE, label)
