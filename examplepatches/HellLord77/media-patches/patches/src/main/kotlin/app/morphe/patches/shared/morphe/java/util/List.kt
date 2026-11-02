package app.morphe.patches.shared.morphe.java.util

import kotlin.collections.List

object List {
    override fun toString(): String = List::class.java.descriptorString()
}
