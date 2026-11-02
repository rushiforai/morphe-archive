package app.morphe.patches.shared.morphe.java.lang

import java.lang.Class
import kotlin.String

object Class {
    override fun toString(): String = Class::class.java.descriptorString()
}
