package app.morphe.util

fun String.toJavaClass(): String = drop(1)
    .dropLast(1)
    .replace("/", ".")

fun isAndroid(): Boolean {
    try {
        Class.forName("android.os.Build")
        return true
    } catch (_: ClassNotFoundException) {
    }
    return false
}

fun isTermux(): Boolean {
    val userName = System.getProperty("user.home")
    return userName != null && userName.contains("com.termux")
}