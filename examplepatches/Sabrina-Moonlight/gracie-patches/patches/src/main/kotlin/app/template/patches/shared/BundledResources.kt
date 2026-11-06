package app.template.patches.shared

import java.io.InputStream

internal fun inputStreamFromBundledResource(folder: String, name: String): InputStream? {
    val path = "$folder/$name"
    return Thread.currentThread().contextClassLoader?.getResourceAsStream(path)
        ?: object {}.javaClass.classLoader?.getResourceAsStream(path)
        ?: ClassLoader.getSystemResourceAsStream(path)
}
