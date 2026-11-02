package app.morphe.patches.shared.morphe.java.lang

import kotlin.String
import kotlin.collections.Iterable

object Iterable {
    override fun toString(): String = Iterable::class.java.descriptorString()
}
