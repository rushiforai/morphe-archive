package app.morphe.patches.shared.morphe.java.lang

import kotlin.CharSequence
import kotlin.String

object CharSequence {
    override fun toString(): String = CharSequence::class.java.descriptorString()
}
