package app.morphe.patches.shared.morphe.java.lang

import kotlin.String

object Object {
    override fun toString(): String = Any::class.java.descriptorString()
}
