package app.morphe.patches.shared.morphe.java.util

import kotlin.collections.Set

object Set {
    override fun toString(): String = Set::class.java.descriptorString()
}
