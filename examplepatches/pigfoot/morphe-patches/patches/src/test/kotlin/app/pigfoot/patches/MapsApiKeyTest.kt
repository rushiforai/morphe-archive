package app.pigfoot.patches

import app.pigfoot.patches.shared.maps.*
import org.junit.Assert.*
import org.junit.Test
import javax.xml.parsers.DocumentBuilderFactory

class MapsApiKeyTest {
    private val old="AIza"+"A".repeat(35)
    private val replacement="AIza"+"B".repeat(35)
    @Test fun utf8AndUtf16EditsKeepEveryOtherByteAndExactlyReverse() {
        for(enc in listOf(Charsets.UTF_8,Charsets.UTF_16LE)) {
            val width=if(enc==Charsets.UTF_8)1 else 2
            val bytes=byteArrayOf(3,0,8,0,12,34)+old.toByteArray(enc)+ByteArray(width)+byteArrayOf(56,78)
            val pin=setOf(mapsSha256(bytes))
            assertArrayEquals(bytes,replaceMapsKeyBytes(bytes,pin,mapsSha256(old.toByteArray()),""))
            val changed=replaceMapsKeyBytes(bytes,pin,mapsSha256(old.toByteArray())," $replacement ")
            assertEquals(bytes.size,changed.size);assertArrayEquals(bytes.take(6).toByteArray(),changed.take(6).toByteArray())
            assertArrayEquals(bytes.takeLast(width+2).toByteArray(),changed.takeLast(width+2).toByteArray())
            assertEquals(replacement,changed.copyOfRange(6,6+39*width).toString(enc))
            assertArrayEquals(bytes,replaceMapsKeyBytes(changed,setOf(mapsSha256(changed)),mapsSha256(replacement.toByteArray()),old))
            assertEquals(old,bytes.copyOfRange(6,6+39*width).toString(enc))
        }
    }
    @Test fun malformedModifiedMissingDuplicateAndWrongValuePinsRejectWithoutMutation() {
        val normal=old.toByteArray()+byteArrayOf(0);val missing="other".toByteArray();val duplicate=normal+normal
        for(bytes in listOf(missing,duplicate)) {
            val before=bytes.copyOf()
            assertThrows(IllegalArgumentException::class.java){replaceMapsKeyBytes(bytes,setOf(mapsSha256(bytes)),mapsSha256(old.toByteArray()),replacement)}
            assertArrayEquals(before,bytes)
        }
        for(test in listOf(0,1,2)) {
            val before=normal.copyOf()
            assertThrows(IllegalArgumentException::class.java) {
                replaceMapsKeyBytes(normal,if(test==0)setOf("0".repeat(64)) else setOf(mapsSha256(normal)),
                    if(test==1)"0".repeat(64) else mapsSha256(old.toByteArray()),if(test==2)"bad" else replacement)
            };assertArrayEquals(before,normal)
        }
    }

    private fun manifest(vararg values: Pair<String,String>) = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument().also { d ->
        val root=d.createElement("manifest");d.appendChild(root);val app=d.createElement("application");root.appendChild(app)
        for((name,value) in values) app.appendChild(d.createElement("meta-data").also { it.setAttribute("android:name",name);it.setAttribute("android:value",value) })
    }
    private val keyName="com.google.android.geo.API_KEY"
    @Test fun decodedManifestEditChangesOnlyTheSingleMatchingKeyElement() {
        val pin=mapsSha256(old.toByteArray())
        val doc=manifest("other" to "keep",keyName to old)
        replaceMapsKeyInManifest(doc,pin," $replacement ")
        val values=(0 until 2).map { (doc.getElementsByTagName("meta-data").item(it) as org.w3c.dom.Element).getAttribute("android:value") }
        assertEquals(listOf("keep",replacement),values)
        val blank=manifest(keyName to old);replaceMapsKeyInManifest(blank,pin,"")
        assertEquals(old,(blank.getElementsByTagName("meta-data").item(0) as org.w3c.dom.Element).getAttribute("android:value"))
    }
    @Test fun decodedManifestEditRejectsMissingDuplicateWrongValueAndBadInputBeforeMutation() {
        val pin=mapsSha256(old.toByteArray())
        for(doc in listOf(manifest("other" to "x"),manifest(keyName to old,keyName to old),manifest(keyName to replacement))) {
            val before=(0 until doc.getElementsByTagName("meta-data").length).map { (doc.getElementsByTagName("meta-data").item(it) as org.w3c.dom.Element).getAttribute("android:value") }
            assertThrows(IllegalArgumentException::class.java){replaceMapsKeyInManifest(doc,pin,replacement)}
            val after=(0 until doc.getElementsByTagName("meta-data").length).map { (doc.getElementsByTagName("meta-data").item(it) as org.w3c.dom.Element).getAttribute("android:value") }
            assertEquals(before,after)
        }
        assertThrows(IllegalArgumentException::class.java){replaceMapsKeyInManifest(manifest(keyName to old),pin,"bad")}
        assertThrows(IllegalArgumentException::class.java){replaceMapsKeyInManifest(manifest(keyName to old),"0",replacement)}
    }
}
