package nl.johninnl.reolink.calls

import java.lang.reflect.InvocationTargetException
import java.util.concurrent.ConcurrentHashMap

/** The patch verifies this private app ABI against the original APK before injecting callers. */
internal object NativeApi {
    private val methods = ConcurrentHashMap<String, java.lang.reflect.Method>()
    fun type(name: String): Class<*> = Class.forName(name)
    fun singleton(name: String): Any = type(name).getField("INSTANCE").get(null)!!
    fun instance(name: String): Any = type(name).getMethod("getInstance").invoke(null)!!
    fun call(target: Any, name: String, vararg args: Any?): Any? {
        val key = target.javaClass.name + "#" + name + args.joinToString { it?.javaClass?.name ?: "null" }
        val method = methods.getOrPut(key) {
            target.javaClass.methods.single { candidate ->
                candidate.name == name && candidate.parameterCount == args.size &&
                    candidate.parameterTypes.zip(args).all { (type, value) ->
                        value == null && !type.isPrimitive || value != null &&
                            (type.isInstance(value) || type == Integer.TYPE && value is Int ||
                                type == java.lang.Boolean.TYPE && value is Boolean ||
                                type == java.lang.Long.TYPE && value is Long)
                    }
            }
        }
        try { return method.invoke(target, *args) }
        catch (error: InvocationTargetException) { throw error.targetException }
    }
}
