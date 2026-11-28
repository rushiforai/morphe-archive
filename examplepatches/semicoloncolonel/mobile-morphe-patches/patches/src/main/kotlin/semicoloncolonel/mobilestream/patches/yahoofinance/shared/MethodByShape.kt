package semicoloncolonel.mobilestream.patches.yahoofinance.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

// Yahoo Finance's code is renamed by R8, and the letters shift between
// releases: the Sponsored Moments fetcher was fetcher/g in 26.22.2 and is
// fetcher/f in 26.23.0. Method names and the shape of each signature stay the
// same, so these patches find a method by its package, name, and signature,
// where a package ("Lcom/example/") stands for any class directly in it.

private fun String.fits(type: String): Boolean =
    if (endsWith("/")) type.startsWith(this) && type.indexOf('/', length) < 0 else type == this

/**
 * The one method named [name], in a class directly in [packageName], whose parameters and return
 * type fit [parameters] and [returnType]. Each type is a descriptor, or a package for any class
 * directly in it.
 */
internal fun BytecodePatchContext.methodByShape(
    packageName: String,
    name: String,
    parameters: List<String>,
    returnType: String,
): MutableMethod {
    val matches = mutableListOf<Triple<String, List<String>, String>>()
    classDefForEach { classDef ->
        if (!packageName.fits(classDef.type)) return@classDefForEach
        classDef.methods.forEach { method ->
            val types = method.parameterTypes.map { it.toString() }
            if (method.name == name && types.size == parameters.size &&
                parameters.zip(types).all { (expected, type) -> expected.fits(type) } &&
                returnType.fits(method.returnType)
            ) {
                matches += Triple(classDef.type, types, method.returnType)
            }
        }
    }
    val (type, types, returns) = matches.singleOrNull()
        ?: throw PatchException("$packageName$name: expected 1 method, found ${matches.size}")
    // The return type too: a bridge method can share the name and parameters.
    return mutableClassDefBy(type).methods.first { method ->
        method.name == name && method.returnType == returns && method.parameterTypes.map { it.toString() } == types
    }
}
