package app.morphe.patches.shared.morphe.java.lang

import kotlin.Boolean
import kotlin.String

object Boolean {
    override fun toString(): String = Boolean::class.javaObjectType.descriptorString()
}
