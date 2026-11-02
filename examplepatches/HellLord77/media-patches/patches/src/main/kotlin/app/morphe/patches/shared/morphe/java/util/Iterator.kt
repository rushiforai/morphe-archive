package app.morphe.patches.shared.morphe.java.util

import kotlin.collections.Iterator

object Iterator {
    override fun toString(): String = Iterator::class.java.descriptorString()
}
