package app.morphe.patches.shared.morphe.kotlin

import kotlin.Lazy

object Lazy {
    override fun toString(): String = Lazy::class.java.descriptorString()
}
