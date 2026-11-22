package app.template.patches.shared.misc.gms

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test
import org.w3c.dom.Document
import javax.xml.parsers.DocumentBuilderFactory

class GmsCorePackageQueriesTest {

    @Test
    fun `adds queries when missing and includes every supported package`() {
        val document = manifest()

        document.addGmsCorePackageQueries()

        assertEquals(GMS_CORE_QUERY_PACKAGES.toList(), queriedPackages(document))
    }

    @Test
    fun `preserves existing queries and does not add duplicate entries`() {
        val document = manifest(
            """
                <queries>
                    <package android:name="org.microg.gms" />
                    <package android:name="org.example.existing" />
                </queries>
            """.trimIndent(),
        )

        document.addGmsCorePackageQueries()
        document.addGmsCorePackageQueries()

        assertEquals(
            listOf(
                "org.microg.gms",
                "org.example.existing",
                "app.revanced.android.gms",
                "com.mgoogle.android.gms",
            ),
            queriedPackages(document),
        )
    }

    private fun manifest(queries: String = ""): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                    $queries
                </manifest>
            """.trimIndent().byteInputStream(),
        )

    private fun queriedPackages(document: Document): List<String> {
        val queries = document.getElementsByTagName("queries").item(0)
        assertNotNull(queries, "manifest has no queries element")
        val packages = (queries as org.w3c.dom.Element).getElementsByTagName("package")
        return (0 until packages.length).map {
            (packages.item(it) as org.w3c.dom.Element).getAttribute("android:name")
        }
    }
}
