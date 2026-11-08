package app.pigfoot.patches

import app.pigfoot.patches.shared.maps.*
import org.junit.Assert.*
import org.junit.Test

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
}
