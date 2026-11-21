import java.text.SimpleDateFormat
import java.util.Date

// Version: yy.MM.dd.<sequence>, where <sequence> is 1 + the highest last segment of the release
// tags. CI always passes the exact version in (F4T_VERSION / -Pf4t.version), so the bundle, the
// source manifest and the tag agree.
val versionOverride: String? =
    providers.gradleProperty("f4t.version").orNull?.takeIf { it.isNotBlank() }
        ?: System.getenv("F4T_VERSION")?.takeIf { it.isNotBlank() }

val localVersion: String by lazy {
    val tagSequence = runCatching {
        ProcessBuilder("git", "tag", "-l", "v*")
            .directory(rootDir)
            .redirectErrorStream(true)
            .start()
            .inputStream.bufferedReader()
            .readLines()
            .mapNotNull { tag -> tag.removePrefix("v").substringAfterLast('.').toIntOrNull() }
            .maxOrNull() ?: 0
    }.getOrDefault(0)

    "${SimpleDateFormat("yy.MM.dd").format(Date())}.${tagSequence + 1}"
}

allprojects {
    version = versionOverride ?: localVersion
}
