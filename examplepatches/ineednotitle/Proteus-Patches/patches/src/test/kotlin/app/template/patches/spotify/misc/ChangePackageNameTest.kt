package app.template.patches.spotify.misc

/** Run by the testSpotifyClone Gradle task; no Android device is needed. */
object ChangePackageNameTest {
    @JvmStatic
    fun main(args: Array<String>) {
        renamedMovesPackageDerivedValues()
        renamedAuthorityPrefixesForeignAuthorities()
        transformRewritesBareContentAndPackageStrings()
        transformLeavesClassNamesAndForeignStringsAlone()

        println("Spotify clone string helpers passed")
    }

    private val oldPackage = "com.spotify.music"
    private val newPackage = "com.spotify.music.morphe.kirdee"
    private val rewrites = listOf(
        oldPackage to newPackage,
        "com.spotify.music.providers.core" to "$newPackage.providers.core",
        "com.spotify.mobile.android.mediaapi" to "$newPackage.com.spotify.mobile.android.mediaapi",
        "com.spotify.music.permission.INTERNAL" to "$newPackage.permission.INTERNAL",
    )

    private fun renamed(value: String) = spotifyRenamed(oldPackage, newPackage, value)

    private fun renamedMovesPackageDerivedValues() {
        check(renamed("com.spotify.music.permission.INTERNAL") == "$newPackage.permission.INTERNAL")
        check(renamed("com.other.permission") == "com.other.permission")
    }

    private fun renamedAuthorityPrefixesForeignAuthorities() {
        check(spotifyRenamedAuthority(oldPackage, newPackage, "com.spotify.music.providers.core")
            == "$newPackage.providers.core")
        check(spotifyRenamedAuthority(oldPackage, newPackage, "com.spotify.mobile.android.mediaapi")
            == "$newPackage.com.spotify.mobile.android.mediaapi")
    }

    private fun transformRewritesBareContentAndPackageStrings() {
        check(spotifyStringTransform(oldPackage, rewrites, oldPackage) == newPackage)
        check(spotifyStringTransform("com.spotify.mobile.android.mediaapi", rewrites, oldPackage)
            == "$newPackage.com.spotify.mobile.android.mediaapi")
        check(spotifyStringTransform("content://com.spotify.music.providers.core/x", rewrites, oldPackage)
            == "content://$newPackage.providers.core/x")
        check(spotifyStringTransform("com.spotify.music.permission.INTERNAL", rewrites, oldPackage)
            == "$newPackage.permission.INTERNAL")
    }

    private fun transformLeavesClassNamesAndForeignStringsAlone() {
        // A class-name string that merely starts like an authority must stay
        // untouched — only bare identifiers and content:// URIs are rewritten.
        check(spotifyStringTransform("com.spotify.music.providers.core.Helper", rewrites, oldPackage) == null)
        check(spotifyStringTransform("com.spotify.music.MainActivity", rewrites, oldPackage) == null)
        check(spotifyStringTransform("https://open.spotify.com/", rewrites, oldPackage) == null)
    }
}
