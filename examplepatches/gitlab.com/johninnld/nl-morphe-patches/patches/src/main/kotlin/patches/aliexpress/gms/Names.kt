package patches.aliexpress.gms

internal fun String.toJavaClassName(): String = removePrefix("L").removeSuffix(";").replace('/', '.')
