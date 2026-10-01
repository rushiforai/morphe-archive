package app.hushmessenger.patches.controls

import java.nio.file.Path
import kotlin.io.path.readText
import kotlin.test.*

class MaterialYouPatchTest {
    private val scheme = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;"

    private fun tokenMethod(name: String, token: String, call: String, callOwner: String = token) =
        fixtureMethod("$scheme->$name($token)I", """
            const/4 v0, 0x0
            invoke-static {p1, v0}, LX/33W;->A0j(Ljava/lang/Object;I)V
            invoke-interface {p1}, $callOwner->$call()I
            move-result v0
            return v0
        """.trimIndent(), 3)

    private val integerOverload = fixtureMethod("$scheme->Asy(Ljava/lang/Integer;)I", """
        invoke-virtual {p1}, Ljava/lang/Number;->intValue()I
        move-result v0
        return v0
    """.trimIndent(), 3)

    @Test fun findsTheTokenResolverUnderEveryNamingGroupsNames() {
        // How 346013440, 346013372, 346013423, 346013357 and 346013374 name the method, the token and its call.
        val groups = listOf(
            Triple("DCz", "LX/4r6;", "ApL"),
            Triple("DCt", "LX/4rB;", "ApN"),
            Triple("DEL", "LX/4uQ;", "ApV"),
            Triple("DCy", "LX/4r0;", "ApM"),
            Triple("DCs", "LX/4sy;", "ApJ"),
        )
        for ((name, token, call) in groups) {
            val resolver = tokenMethod(name, token, call)
            assertSame(resolver, listOf(integerOverload, resolver).filter(::isTokenColorMethod).single(), name)
        }
    }

    @Test fun skipsMethodsThatDoNotReadTheColourFromTheirOwnToken() {
        assertFalse(isTokenColorMethod(integerOverload))
        assertFalse(isTokenColorMethod(tokenMethod("DCz", "LX/4r6;", "ApL", callOwner = "LX/9zz;")))
        val withArgument = fixtureMethod("$scheme->DCz(LX/4r6;)I", """
            const/4 v0, 0x1
            invoke-interface {p1, v0}, LX/4r6;->ApL(I)I
            move-result v0
            return v0
        """.trimIndent(), 3)
        assertFalse(isTokenColorMethod(withArgument))
    }

    @Test fun compatReportChecksWhatThePatchRewrites() {
        // scripts/CompatReport.java checks every build for these; a value changed on one side only fails here.
        val report = Path.of("../scripts/CompatReport.java").readText()
        assertContains(report, "DARK_SCHEME = \"$DARK_SCHEME\";")
        assertContains(report, "FDS_COLORS = \"$FDS_COLORS\";")
        fun javaSet(name: String) = assertNotNull(Regex("""$name = Set\.of\((.*?)\);""", RegexOption.DOT_MATCHES_ALL).find(report), name).groupValues[1]
        assertEquals(materialYouSurfaces.keys, javaSet("DARK_SURFACES").split(",").map { it.trim().removePrefix("0x").toLong(16).toInt() }.toSet())
        assertEquals(materialYouColorCalls.keys, Regex("\"([^\"]+)\"").findAll(javaSet("COLOR_CALLS")).map { it.groupValues[1] }.toSet())
    }
}
