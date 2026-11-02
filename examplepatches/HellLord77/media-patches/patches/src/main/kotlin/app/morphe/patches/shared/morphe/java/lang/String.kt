package app.morphe.patches.shared.morphe.java.lang

import kotlin.String

object String {
    override fun toString(): String = String::class.java.descriptorString()
}
