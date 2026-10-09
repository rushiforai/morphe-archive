package android.content.pm
class PackageInfo { val versionName = "1.1.0-beta.5" }
class PackageManager {
    fun getPackageInfo(name: String, flags: Int) = PackageInfo()
}
