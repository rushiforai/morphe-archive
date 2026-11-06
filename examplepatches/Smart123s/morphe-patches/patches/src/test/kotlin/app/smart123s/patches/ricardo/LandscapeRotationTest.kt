package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

internal class LandscapeRotationTest {
    @Test
    fun `rotation preserves unrelated manifest attributes and activities`() {
        for (activityName in listOf(".MainActivity", "MainActivity", "ricardonemlopot.nemlopot.MainActivity")) {
            val xml = """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="ricardonemlopot.nemlopot">
                    <application>
                        <activity android:name="$activityName" android:screenOrientation="landscape"
                            android:configChanges="keyboard|keyboardHidden|orientation|screenSize" android:exported="true"/>
                        <activity android:name=".OtherActivity" android:screenOrientation="portrait"/>
                    </application>
                </manifest>
            """.trimIndent()
            val document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                .parse(ByteArrayInputStream(xml.toByteArray()))
            document.enableRicardoLandscapeRotation()

            val activities = document.getElementsByTagName("activity")
            val main = activities.item(0).attributes
            assertEquals("sensorLandscape", main.getNamedItem("android:screenOrientation").nodeValue)
            assertEquals("keyboard|keyboardHidden|orientation|screenSize", main.getNamedItem("android:configChanges").nodeValue)
            assertEquals("true", main.getNamedItem("android:exported").nodeValue)
            assertEquals("portrait", activities.item(1).attributes.getNamedItem("android:screenOrientation").nodeValue)
        }
    }

    @Test
    fun `an absent MainActivity is rejected`() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
            .parse(ByteArrayInputStream("<manifest package=\"ricardonemlopot.nemlopot\"><application/></manifest>".toByteArray()))
        assertFailsWith<PatchException> { document.enableRicardoLandscapeRotation() }
    }
}
