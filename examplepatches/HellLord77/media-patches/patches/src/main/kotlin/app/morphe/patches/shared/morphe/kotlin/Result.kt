package app.morphe.patches.shared.morphe.kotlin

import kotlin.Result

object Result {
    override fun toString(): String = Result::class.java.descriptorString()

    object Companion {
        override fun toString(): String = Result.Companion::class.java.descriptorString()
    }
}
