package patches.shared

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Document
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory

class CarParkedAppManifestTest {
    private fun document(xml: String): Document =
        DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
            .newDocumentBuilder().parse(ByteArrayInputStream(xml.toByteArray()))

    private fun documentWith(vararg extraActivities: String): Document = document("""
        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
            <application android:label="Game">
                <activity android:name=".Main">
                    <intent-filter>
                        <action android:name="android.intent.action.MAIN"/>
                        <category android:name="android.intent.category.LAUNCHER"/>
                    </intent-filter>
                </activity>
                ${extraActivities.joinToString("\n")}
            </application>
        </manifest>
    """)

    private fun categories(document: Document, tag: String, name: String): List<String> {
        val android = "http://schemas.android.com/apk/res/android"
        val component = document.getElementsByTagName(tag).let { components ->
            (0 until components.length).map { components.item(it) as org.w3c.dom.Element }
                .single { it.getAttributeNS(android, "name") == name }
        }
        return (0 until component.getElementsByTagName("category").length).map {
            component.getElementsByTagName("category").item(it).attributes
                .getNamedItemNS(android, "name").nodeValue
        }
    }

    @Test fun launcherFiltersReceiveTheCategoryOnce() {
        val manifest = documentWith(
            """<activity-alias android:name=".Alias" android:targetActivity=".Main">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                </intent-filter>
            </activity-alias>""",
            """<activity android:name=".Car">
                <intent-filter>
                    <action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/>
                    <category android:name="android.intent.category.CAR_LAUNCHER"/>
                </intent-filter>
            </activity>""",
            """<activity android:name=".Viewer">
                <intent-filter>
                    <action android:name="android.intent.action.VIEW"/>
                    <category android:name="android.intent.category.BROWSABLE"/>
                </intent-filter>
            </activity>""",
        )
        assertEquals(2, ensureCarParkedAppDeclaration(manifest, "game"))
        assertEquals(
            listOf("android.intent.category.LAUNCHER", "android.intent.category.CAR_LAUNCHER"),
            categories(manifest, "activity", ".Main"),
        )
        assertEquals(
            listOf("android.intent.category.LAUNCHER", "android.intent.category.CAR_LAUNCHER"),
            categories(manifest, "activity-alias", ".Alias"),
        )
        assertEquals(
            listOf("android.intent.category.LAUNCHER", "android.intent.category.CAR_LAUNCHER"),
            categories(manifest, "activity", ".Car"),
        )
        assertEquals(
            listOf("android.intent.category.BROWSABLE"),
            categories(manifest, "activity", ".Viewer"),
        )
    }

    @Test fun appCategoryIsSetOnlyWhenMissing() {
        val missing = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <application android:label="Game">
                    <activity android:name=".Main">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                        </intent-filter>
                    </activity>
                </application>
            </manifest>
        """)
        ensureCarParkedAppDeclaration(missing, "game")
        assertEquals("game", (missing.getElementsByTagName("application").item(0)
            as org.w3c.dom.Element).getAttributeNS("http://schemas.android.com/apk/res/android", "appCategory"))

        val existing = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <application android:appCategory="game">
                    <activity android:name=".Main">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                        </intent-filter>
                    </activity>
                </application>
            </manifest>
        """)
        ensureCarParkedAppDeclaration(existing, "game")
        assertEquals("game", (existing.getElementsByTagName("application").item(0)
            as org.w3c.dom.Element).getAttributeNS("http://schemas.android.com/apk/res/android", "appCategory"))
    }

    @Test fun onlyRequiredAutomotiveHardwareIsMadeOptional() {
        val automotive = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <uses-feature android:name="android.hardware.type.automotive" android:required="true"/>
                <uses-feature android:name="android.hardware.wifi" android:required="true"/>
                <application android:appCategory="game">
                    <activity android:name=".Main">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                        </intent-filter>
                    </activity>
                </application>
            </manifest>
        """)
        assertEquals(1, allowInstallOutsideAutomotive(automotive))
        val android = "http://schemas.android.com/apk/res/android"
        val features = automotive.getElementsByTagName("uses-feature")
        val byName = (0 until features.length).associate { index ->
            val feature = features.item(index) as org.w3c.dom.Element
            feature.getAttributeNS(android, "name") to feature.getAttributeNS(android, "required")
        }
        assertEquals("false", byName["android.hardware.type.automotive"])
        assertEquals("true", byName["android.hardware.wifi"])

        val alreadyOptional = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <uses-feature android:name="android.hardware.type.automotive" android:required="false"/>
            </manifest>
        """)
        assertEquals(0, allowInstallOutsideAutomotive(alreadyOptional))

        assertEquals(0, allowInstallOutsideAutomotive(documentWith()))
    }

    @Test fun appliedManifestsAndManifestsWithoutLaunchersAreRejected() {
        val applied = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <application android:appCategory="game">
                    <activity android:name=".Main">
                        <intent-filter>
                            <action android:name="android.intent.action.MAIN"/>
                            <category android:name="android.intent.category.LAUNCHER"/>
                            <category android:name="android.intent.category.CAR_LAUNCHER"/>
                        </intent-filter>
                    </activity>
                    <activity android:name=".Viewer">
                        <intent-filter>
                            <action android:name="android.intent.action.VIEW"/>
                            <category android:name="android.intent.category.BROWSABLE"/>
                        </intent-filter>
                    </activity>
                </application>
            </manifest>
        """)
        assertThrows(IllegalStateException::class.java) {
            ensureCarParkedAppDeclaration(applied, "game")
        }

        val noLauncher = document("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                <application android:appCategory="game">
                    <activity android:name=".Viewer">
                        <intent-filter>
                            <action android:name="android.intent.action.VIEW"/>
                            <category android:name="android.intent.category.BROWSABLE"/>
                        </intent-filter>
                    </activity>
                </application>
            </manifest>
        """)
        assertThrows(IllegalStateException::class.java) {
            ensureCarParkedAppDeclaration(noLauncher, "game")
        }
    }
}
