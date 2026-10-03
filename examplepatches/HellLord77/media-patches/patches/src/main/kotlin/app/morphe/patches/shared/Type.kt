package app.morphe.patches.shared

import kotlin.coroutines.Continuation

@Suppress("unused")
object Type {
    val boolean: String = Boolean::class.javaPrimitiveType!!.descriptorString()
    val char: String = Char::class.javaPrimitiveType!!.descriptorString()
    val byte: String = Byte::class.javaPrimitiveType!!.descriptorString()
    val short: String = Short::class.javaPrimitiveType!!.descriptorString()
    val int: String = Int::class.javaPrimitiveType!!.descriptorString()
    val float: String = Float::class.javaPrimitiveType!!.descriptorString()
    val long: String = Long::class.javaPrimitiveType!!.descriptorString()
    val double: String = Double::class.javaPrimitiveType!!.descriptorString()
    val void: String = Void::class.javaPrimitiveType!!.descriptorString()

    val BOOLEAN: String = Boolean::class.javaObjectType.descriptorString()
    val CHAR: String = Char::class.javaObjectType.descriptorString()
    val BYTE: String = Byte::class.javaObjectType.descriptorString()
    val SHORT: String = Short::class.javaObjectType.descriptorString()
    val INT: String = Int::class.javaObjectType.descriptorString()
    val FLOAT: String = Float::class.javaObjectType.descriptorString()
    val LONG: String = Long::class.javaObjectType.descriptorString()
    val DOUBLE: String = Double::class.javaObjectType.descriptorString()
    val VOID: String = Void::class.javaObjectType.descriptorString()

    val OBJECT: String = Any::class.java.descriptorString()
    val STRING: String = String::class.java.descriptorString()
    val CONTINUATION: String = Continuation::class.java.descriptorString()

    const val BUNDLE: String = "Landroid/os/Bundle;"
    const val CONTEXT: String = "Landroid/content/Context;"
}