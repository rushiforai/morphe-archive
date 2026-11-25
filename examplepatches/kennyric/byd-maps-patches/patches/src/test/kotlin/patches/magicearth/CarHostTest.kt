package patches.magicearth

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

class CarHostTest {
    private val ns = "http://schemas.android.com/apk/res/android"
    @Test fun removesOnlyTheIncomingBindingGate() {
        val xml = """<manifest xmlns:android="$ns">
          <uses-permission android:name="androidx.car.app.ACCESS_SURFACE"/>
          <application><service android:name="com.generalmagic.magicearth.car_connectivity_plugin.AndroidAutoService"
              android:permission="androidx.car.app.ACCESS_SURFACE" android:exported="true">
            <intent-filter><action android:name="androidx.car.app.CarAppService"/>
              <category android:name="androidx.car.app.category.NAVIGATION"/></intent-filter>
          </service><service android:name="unrelated" android:permission="keep.this"/></application></manifest>"""
        val doc = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder().parse(xml.byteInputStream())
        allowCustomCarHostBinding(doc)
        val services = doc.getElementsByTagName("service")
        assertFalse((services.item(0) as org.w3c.dom.Element).hasAttributeNS(ns, "permission"))
        assertEquals("keep.this", (services.item(1) as org.w3c.dom.Element).getAttributeNS(ns, "permission"))
        assertEquals(1, doc.getElementsByTagName("uses-permission").length)
        assertEquals(1, doc.getElementsByTagName("category").length)
        assertThrows(IllegalStateException::class.java) { allowCustomCarHostBinding(doc) }
    }

    @Test fun nativeCarNavigationGetsLocalEligibilityWithoutRewritingPreferences() {
        val path = System.getenv("MAGIC_EARTH_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val owner = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type == CAR_UTILS }
        val original = owner.methods.single { it.name == "checkSubscriptionStatus" }
        val output = enableNativeCarControls(original)
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), output.implementation!!.instructions.map { it.opcode })
        assertThrows(IllegalStateException::class.java) { enableNativeCarControls(output) }
    }
}
