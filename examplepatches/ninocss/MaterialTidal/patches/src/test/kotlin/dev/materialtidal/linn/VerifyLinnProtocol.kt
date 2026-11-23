package dev.materialtidal.linn

import java.io.ByteArrayOutputStream
import java.io.DataOutputStream
import java.io.File
import java.io.OutputStream
import java.net.ServerSocket
import java.net.URLClassLoader
import java.nio.ByteBuffer
import java.nio.charset.StandardCharsets
import java.util.concurrent.atomic.AtomicReference
import kotlin.concurrent.thread

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyLinnProtocolKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testRawHttpClientXmlAndLoopback(loader)
    testOpenHomeSourceXmlAndSoap(loader)
    testOpenHomeV4ServicesAndFastStop(loader)
    testDidlMetadataBuilder(loader)
    testDashFlacRemuxer(loader)

    println("ALL LINN PROTOCOL UNIT TESTS PASSED.")
}

private fun testRawHttpClientXmlAndLoopback(loader: ClassLoader) {
    val httpCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnRawHttpClient")
    val escape = httpCls.getMethod("escapeXml", String::class.java)
    val unescape = httpCls.getMethod("unescapeXml", String::class.java)
    val extract = httpCls.getMethod("extractTagValue", String::class.java, String::class.java)

    val raw = "Björk &Friends <Live> \"24/96\" 'HQ'"
    val escaped = escape.invoke(null, raw) as String
    check(escaped == "Björk &amp;Friends &lt;Live&gt; &quot;24/96&quot; &apos;HQ&apos;") {
        "Unexpected escapeXml: $escaped"
    }
    check((unescape.invoke(null, escaped) as String) == raw) { "unescapeXml round-trip mismatch" }

    val soapResp = """
        <?xml version="1.0"?>
        <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
          <s:Body>
            <u:InsertResponse xmlns:u="urn:av-openhome-org:service:Playlist:1">
              <NewId>42</NewId>
            </u:InsertResponse>
          </s:Body>
        </s:Envelope>
    """.trimIndent()
    check((extract.invoke(null, soapResp, "NewId") as String) == "42") { "extractTagValue failed" }

    // Real TCP loopback test covering chunked transfer encoding & SOAPACTION header verification.
    val receivedAction = AtomicReference<String?>()
    ServerSocket(0).use { server ->
        val port = server.localPort
        val t = thread(isDaemon = true) {
            server.accept().use { sock ->
                val reader = sock.getInputStream().bufferedReader(StandardCharsets.US_ASCII)
                var line: String?
                while (reader.readLine().also { line = it } != null && line!!.isNotEmpty()) {
                    if (line!!.startsWith("SOAPACTION:", ignoreCase = true)) {
                        receivedAction.set(line!!.substringAfter(':').trim())
                    }
                }
                val chunk1 = "<s:Envelope><s:Body><u:VolumeResponse>"
                val chunk2 = "<Value>37</Value></u:VolumeResponse></s:Body></s:Envelope>"
                val resp = buildString {
                    append("HTTP/1.1 200 OK\r\n")
                    append("Transfer-Encoding: chunked\r\n")
                    append("Content-Type: text/xml\r\n\r\n")
                    append(chunk1.toByteArray().size.toString(16)).append("\r\n").append(chunk1).append("\r\n")
                    append(chunk2.toByteArray().size.toString(16)).append("\r\n").append(chunk2).append("\r\n")
                    append("0\r\n\r\n")
                }
                sock.getOutputStream().write(resp.toByteArray(StandardCharsets.UTF_8))
                sock.getOutputStream().flush()
            }
        }

        val soapPost = httpCls.getMethod(
            "soapPost",
            String::class.java,
            String::class.java,
            String::class.java,
            String::class.java,
        )
        val responseObj = soapPost.invoke(
            null,
            "http://127.0.0.1:$port/Volume/control",
            "urn:av-openhome-org:service:Volume:1",
            "Volume",
            "",
        )
        t.join(3000)

        val respCls = responseObj.javaClass
        val ok = respCls.getMethod("isSuccessful").invoke(responseObj) as Boolean
        val body = respCls.getField("body").get(responseObj) as String
        check(ok) { "Expected 200 OK from chunked SOAP loopback" }
        check((extract.invoke(null, body, "Value") as String) == "37") { "Chunked SOAP body mismatch: $body" }
        check(receivedAction.get() == "\"urn:av-openhome-org:service:Volume:1#Volume\"") {
            "Unexpected SOAPACTION header: ${receivedAction.get()}"
        }
    }
    println("PASS: LinnRawHttpClient XML & chunked SOAP loopback")
}

private fun testOpenHomeSourceXmlAndSoap(loader: ClassLoader) {
    val ohCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnOpenHomeClient")
    val devCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnDevice")

    val findPlaylist = ohCls.getMethod("findPlaylistSourceIndex", String::class.java)
    val sourceXml = """
        <SourceList>
          <Source><Name>Spotify</Name><Type>Spotify</Type><Visible>true</Visible></Source>
          <Source><Name>HDMI 1</Name><Type>Hdmi</Type><Visible>true</Visible></Source>
          <Source><Name>TIDAL Streaming</Name><Type>Playlist</Type><Visible>true</Visible></Source>
          <Source><Name>Bluetooth</Name><Type>Bluetooth</Type><Visible>true</Visible></Source>
        </SourceList>
    """.trimIndent()
    check((findPlaylist.invoke(null, sourceXml) as Int) == 2) {
        "Expected Playlist source at index 2"
    }
    check((findPlaylist.invoke(null, "<SourceList><Source><Name>TV</Name><Type>Hdmi</Type></Source></SourceList>") as Int) == -1) {
        "Expected -1 when no Playlist source exists"
    }

    // End-to-end ensureAwakeAndPlaylistSource + VolumeCharacteristics over loopback sockets.
    val standbyState = booleanArrayOf(true)
    val sourceIdx = intArrayOf(0)
    ServerSocket(0).use { server ->
        val port = server.localPort
        val worker = thread(isDaemon = true) {
            repeat(12) {
                try {
                    val sock = server.accept()
                    sock.use {
                        val reader = sock.getInputStream().bufferedReader(StandardCharsets.US_ASCII)
                        var soapAction = ""
                        var contentLen = 0
                        var line: String?
                        while (reader.readLine().also { line = it } != null && line!!.isNotEmpty()) {
                            if (line!!.startsWith("SOAPACTION:", ignoreCase = true)) {
                                soapAction = line!!.substringAfter(':').trim().trim('"')
                            } else if (line!!.startsWith("Content-Length:", ignoreCase = true)) {
                                contentLen = line!!.substringAfter(':').trim().toIntOrNull() ?: 0
                            }
                        }
                        val bodyChars = CharArray(contentLen)
                        var read = 0
                        while (read < contentLen) {
                            val r = reader.read(bodyChars, read, contentLen - read)
                            if (r < 0) break
                            read += r
                        }
                        val reqBody = String(bodyChars, 0, read)
                        val action = soapAction.substringAfter('#')
                        val innerResp = when (action) {
                            "Room" -> "<Value>Wohnzimmer</Value>"
                            "Standby" -> "<Value>${if (standbyState[0]) "1" else "0"}</Value>"
                            "SetStandby" -> {
                                standbyState[0] = reqBody.contains(">1<")
                                ""
                            }
                            "SourceXml" -> {
                                val esc = sourceXml.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                                "<Value>$esc</Value>"
                            }
                            "SourceIndex" -> "<Value>${sourceIdx[0]}</Value>"
                            "SetSourceIndex" -> {
                                val m = Regex("<Value>(\\d+)</Value>").find(reqBody)
                                sourceIdx[0] = m?.groupValues?.get(1)?.toInt() ?: sourceIdx[0]
                                ""
                            }
                            "Characteristics" -> "<VolumeMax>100</VolumeMax><VolumeLimit>82</VolumeLimit>"
                            else -> ""
                        }
                        val payload = "<s:Envelope><s:Body><u:${action}Response>$innerResp</u:${action}Response></s:Body></s:Envelope>"
                        val bytes = payload.toByteArray(StandardCharsets.UTF_8)
                        val http = "HTTP/1.1 200 OK\r\nContent-Length: ${bytes.size}\r\nConnection: close\r\n\r\n"
                        sock.getOutputStream().write(http.toByteArray(StandardCharsets.US_ASCII))
                        sock.getOutputStream().write(bytes)
                        sock.getOutputStream().flush()
                    }
                } catch (_: Exception) {
                    return@thread
                }
            }
        }

        val ctor = devCls.getConstructor(
            String::class.java, String::class.java, String::class.java,
            String::class.java, String::class.java, String::class.java,
            Int::class.javaPrimitiveType,
            String::class.java, String::class.java, String::class.java,
            String::class.java, String::class.java, String::class.java,
        )
        val base = "http://127.0.0.1:$port"
        val dev = ctor.newInstance(
            "linn-test-udn", "Linn Majik DSM", "Wohnzimmer", "Majik DSM", "Linn",
            "127.0.0.1", port, "$base/description.xml",
            "$base/Product/control", "$base/Playlist/control", "$base/Volume/control",
            "$base/Time/control", "$base/Info/control",
        )
        val roomName = ohCls.getMethod("getRoomName", devCls).invoke(null, dev) as String
        val resolvedIdx = ohCls.getMethod("ensureAwakeAndPlaylistSource", devCls).invoke(null, dev) as Int
        val vc = ohCls.getMethod("getVolumeCharacteristics", devCls).invoke(null, dev)
        worker.interrupt()

        check(roomName == "Wohnzimmer") { "Expected Room 'Wohnzimmer', got '$roomName'" }
        check(resolvedIdx == 2) { "Expected Playlist index 2, got $resolvedIdx" }
        check(!standbyState[0]) { "Expected device to wake from standby" }
        check(sourceIdx[0] == 2) { "Expected source index switched to 2, got ${sourceIdx[0]}" }
        val effectiveMax = vc.javaClass.getField("effectiveMax").getInt(vc)
        check(effectiveMax == 82) { "Expected VolumeLimit 82 clamped effectiveMax, got $effectiveMax" }
    }
    println("PASS: LinnOpenHomeClient auto-wake, source-switch & volume-limit")
}

private fun testOpenHomeV4ServicesAndFastStop(loader: ClassLoader) {
    val ohCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnOpenHomeClient")
    val devCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnDevice")
    val discCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnSsdpDiscovery")

    // Verify SSDP device description XML parser captures exact :4 service types from real Majik DSM XML.
    val v4Xml = """
        <?xml version="1.0" encoding="utf-8"?>
        <root xmlns="urn:schemas-upnp-org:device-1-0">
          <device>
            <friendlyName>Linn Wohnzimmer</friendlyName>
            <manufacturer>Linn Products Ltd</manufacturer>
            <modelName>Majik DSM</modelName>
            <UDN>uuid:4c494e4e-test-v4</UDN>
            <serviceList>
              <service>
                <serviceType>urn:av-openhome-org:service:Product:4</serviceType>
                <controlURL>/dev/av.openhome.org-Product-4/control</controlURL>
              </service>
              <service>
                <serviceType>urn:av-openhome-org:service:Volume:4</serviceType>
                <controlURL>/dev/av.openhome.org-Volume-4/control</controlURL>
              </service>
              <service>
                <serviceType>urn:av-openhome-org:service:Playlist:1</serviceType>
                <controlURL>/dev/av.openhome.org-Playlist-1/control</controlURL>
              </service>
              <service>
                <serviceType>urn:av-openhome-org:service:Time:1</serviceType>
                <controlURL>/dev/av.openhome.org-Time-1/control</controlURL>
              </service>
            </serviceList>
          </device>
        </root>
    """.trimIndent()
    val parsedDev = discCls.getMethod("parseDeviceDescriptionXml", String::class.java, String::class.java)
        .invoke(null, "http://192.168.2.121:55178/dev/device.xml", v4Xml)
    check(parsedDev != null) { "Expected parsed v4 LinnDevice" }
    check(devCls.getField("productServiceType").get(parsedDev) == "urn:av-openhome-org:service:Product:4") {
        "Expected Product:4 serviceType"
    }
    check(devCls.getField("volumeServiceType").get(parsedDev) == "urn:av-openhome-org:service:Volume:4") {
        "Expected Volume:4 serviceType"
    }

    val recordedActions = mutableListOf<String>()
    ServerSocket(0).use { server ->
        val port = server.localPort
        val worker = thread(isDaemon = true) {
            repeat(4) {
                try {
                    server.accept().use { sock ->
                        val reader = sock.getInputStream().bufferedReader(StandardCharsets.US_ASCII)
                        var soapAction = ""
                        var contentLen = 0
                        var line: String?
                        while (reader.readLine().also { line = it } != null && line!!.isNotEmpty()) {
                            if (line!!.startsWith("SOAPACTION:", ignoreCase = true)) {
                                soapAction = line!!.substringAfter(':').trim().trim('"')
                            } else if (line!!.startsWith("Content-Length:", ignoreCase = true)) {
                                contentLen = line!!.substringAfter(':').trim().toIntOrNull() ?: 0
                            }
                        }
                        if (contentLen > 0) {
                            val buf = CharArray(contentLen)
                            var r = 0
                            while (r < contentLen) {
                                val n = reader.read(buf, r, contentLen - r)
                                if (n < 0) break
                                r += n
                            }
                        }
                        synchronized(recordedActions) {
                            recordedActions.add(soapAction)
                        }
                        val action = soapAction.substringAfter('#')
                        val innerResp = when (action) {
                            "Product" -> "<Room>Wohnzimmer</Room><Name>Linn Wohnzimmer</Name>"
                            "Characteristics" -> "<VolumeMax>100</VolumeMax><VolumeUnity>80</VolumeUnity><VolumeSteps>1</VolumeSteps>"
                            "VolumeLimit" -> "<Value>76</Value>"
                            "Stop" -> ""
                            else -> ""
                        }
                        val payload = "<s:Envelope><s:Body><u:${action}Response>$innerResp</u:${action}Response></s:Body></s:Envelope>"
                        val bytes = payload.toByteArray(StandardCharsets.UTF_8)
                        val http = "HTTP/1.1 200 OK\r\nContent-Length: ${bytes.size}\r\nConnection: close\r\n\r\n"
                        sock.getOutputStream().write(http.toByteArray(StandardCharsets.US_ASCII))
                        sock.getOutputStream().write(bytes)
                        sock.getOutputStream().flush()
                    }
                } catch (_: Exception) {
                    return@thread
                }
            }
        }

        val ctor17 = devCls.getConstructor(
            String::class.java, String::class.java, String::class.java,
            String::class.java, String::class.java, String::class.java,
            Int::class.javaPrimitiveType,
            String::class.java, String::class.java, String::class.java,
            String::class.java, String::class.java, String::class.java,
            String::class.java, String::class.java, String::class.java, String::class.java,
        )
        val base = "http://127.0.0.1:$port"
        val dev = ctor17.newInstance(
            "linn-v4-udn", "Linn Wohnzimmer", "", "Majik DSM", "Linn",
            "127.0.0.1", port, "$base/device.xml",
            "$base/Product4/control", "$base/Playlist1/control", "$base/Volume4/control",
            "$base/Time1/control", "$base/Info1/control",
            "urn:av-openhome-org:service:Product:4",
            "urn:av-openhome-org:service:Playlist:1",
            "urn:av-openhome-org:service:Volume:4",
            "urn:av-openhome-org:service:Time:1",
        )

        val roomName = ohCls.getMethod("getRoomName", devCls).invoke(null, dev) as String
        val vc = ohCls.getMethod("getVolumeCharacteristics", devCls).invoke(null, dev)
        ohCls.getMethod("playlistStopFast", devCls).invoke(null, dev)
        worker.join(3000)

        check(roomName == "Wohnzimmer") { "Expected Room from Product:4#Product, got '$roomName'" }
        val effectiveMax = vc.javaClass.getField("effectiveMax").getInt(vc)
        check(effectiveMax == 76) { "Expected VolumeLimit fallback 76, got $effectiveMax" }
        check(recordedActions.contains("urn:av-openhome-org:service:Product:4#Product")) {
            "Missing Product:4#Product SOAPACTION in $recordedActions"
        }
        check(recordedActions.contains("urn:av-openhome-org:service:Volume:4#Characteristics")) {
            "Missing Volume:4#Characteristics SOAPACTION in $recordedActions"
        }
        check(recordedActions.contains("urn:av-openhome-org:service:Volume:4#VolumeLimit")) {
            "Missing Volume:4#VolumeLimit SOAPACTION in $recordedActions"
        }
        check(recordedActions.contains("urn:av-openhome-org:service:Playlist:1#Stop")) {
            "Missing Playlist:1#Stop SOAPACTION in $recordedActions"
        }
    }
    println("PASS: LinnOpenHomeClient v4 services, VolumeLimit fallback & fast stop")
}

private fun testDidlMetadataBuilder(loader: ClassLoader) {
    val didlCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnDidlMetadataBuilder")
    val build = didlCls.getMethod(
        "buildDidlLite",
        String::class.java, String::class.java, String::class.java,
        String::class.java, String::class.java, Int::class.javaPrimitiveType,
        String::class.java, String::class.java, Int::class.javaPrimitiveType, Int::class.javaPrimitiveType,
    )
    val xml = build.invoke(
        null,
        "123456",
        "Größenwahn & Rock <24>",
        "AC/DC",
        "Live \"2024\"",
        "abcd-1234-ef56",
        245_000,
        "http://192.168.1.10:8123/stream/abc.flac",
        "audio/flac",
        192000,
        24,
    ) as String

    check(xml.contains("<dc:title>Größenwahn &amp; Rock &lt;24&gt;</dc:title>")) { "Title escaping failed: $xml" }
    check(xml.contains("<upnp:album>Live &quot;2024&quot;</upnp:album>")) { "Album escaping failed: $xml" }
    check(xml.contains("<upnp:albumArtURI>https://resources.tidal.com/images/abcd/1234/ef56/640x640.jpg</upnp:albumArtURI>")) {
        "Cover URL mismatch: $xml"
    }
    check(xml.contains("duration=\"0:04:05\"")) { "Duration mismatch: $xml" }
    check(xml.contains("sampleFrequency=\"192000\" bitsPerSample=\"24\"")) { "Audio format attrs missing: $xml" }
    println("PASS: LinnDidlMetadataBuilder XML escaping & metadata")
}

private fun testDashFlacRemuxer(loader: ClassLoader) {
    val remuxCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnDashFlacRemuxer")
    val parseHeader = remuxCls.getMethod("parseAndBuildHeader", ByteArray::class.java, Long::class.javaPrimitiveType)
    val writeFrames = remuxCls.getMethod("writeMediaSegmentFrames", ByteArray::class.java, OutputStream::class.java)

    // Build valid 34-byte STREAMINFO for 192000 Hz, 2ch, 24-bit, total_samples = 0.
    val streamInfo = ByteArray(34)
    // bytes 10..13: sampleRate(20 bits)=192000 (0x2EE00), ch-1(3 bits)=1, bps-1(5 bits)=23 (0x17), totalSamplesTop4=0
    val packed = (192000L shl 12) or (1L shl 9) or (23L shl 4)
    streamInfo[10] = ((packed ushr 24) and 0xFF).toByte()
    streamInfo[11] = ((packed ushr 16) and 0xFF).toByte()
    streamInfo[12] = ((packed ushr 8) and 0xFF).toByte()
    streamInfo[13] = (packed and 0xFF).toByte()

    val vorbisComment = "vendor=test".toByteArray(StandardCharsets.UTF_8)

    val dflaPayload = ByteArrayOutputStream().apply {
        write(byteArrayOf(0, 0, 0, 0)) // dfLa FullBox version/flags
        // Metadata block 0: STREAMINFO (type 0), 34 bytes
        write(byteArrayOf(0x00, 0x00, 0x00, 34.toByte()))
        write(streamInfo)
        // Metadata block 1: VORBIS_COMMENT (type 4, deliberately NOT marked last=0x80 to test normalization)
        write(byteArrayOf(0x04, 0x00, 0x00, vorbisComment.size.toByte()))
        write(vorbisComment)
    }.toByteArray()

    fun box(type: String, payload: ByteArray): ByteArray {
        val out = ByteArrayOutputStream()
        val dos = DataOutputStream(out)
        dos.writeInt(8 + payload.size)
        dos.write(type.toByteArray(StandardCharsets.US_ASCII))
        dos.write(payload)
        return out.toByteArray()
    }

    val dflaBox = box("dfLa", dflaPayload)
    val flacSampleEntryPayload = ByteArray(28) + dflaBox
    val flacBox = box("fLaC", flacSampleEntryPayload)
    val stsdPayload = byteArrayOf(0, 0, 0, 0, 0, 0, 0, 1) + flacBox
    val moovBox = box("moov", box("trak", box("mdia", box("minf", box("stbl", box("stsd", stsdPayload))))))
    val initSeg = box("ftyp", ByteArray(8)) + moovBox

    val expectedSamples = 192000L * 10L
    val infoObj = parseHeader.invoke(null, initSeg, expectedSamples)
    val headerBytes = infoObj.javaClass.getField("headerBytes").get(infoObj) as ByteArray
    val sr = infoObj.javaClass.getField("sampleRate").getInt(infoObj)
    val bd = infoObj.javaClass.getField("bitDepth").getInt(infoObj)
    val ts = infoObj.javaClass.getField("totalSamples").getLong(infoObj)

    check(String(headerBytes, 0, 4, StandardCharsets.US_ASCII) == "fLaC") { "Missing fLaC stream magic" }
    check(sr == 192000) { "Expected 192000 Hz, got $sr" }
    check(bd == 24) { "Expected 24-bit, got $bd" }
    check(ts == expectedSamples) { "Expected patched totalSamples=$expectedSamples, got $ts" }
    check((headerBytes[4].toInt() and 0x80) == 0) { "First metadata block should NOT have last-block flag set" }
    val secondBlockHeaderOffset = 4 + 4 + 34
    check((headerBytes[secondBlockHeaderOffset].toInt() and 0x80) != 0) {
        "Final metadata block MUST have 0x80 last-block flag set"
    }
    // Verify 36-bit patched total_samples inside STREAMINFO payload.
    val sOff = 8
    val parsedSamples = ((headerBytes[sOff + 13].toLong() and 0x0F) shl 32) or
        ((headerBytes[sOff + 14].toLong() and 0xFF) shl 24) or
        ((headerBytes[sOff + 15].toLong() and 0xFF) shl 16) or
        ((headerBytes[sOff + 16].toLong() and 0xFF) shl 8) or
        (headerBytes[sOff + 17].toLong() and 0xFF)
    check(parsedSamples == expectedSamples) { "Patched STREAMINFO samples mismatch: $parsedSamples != $expectedSamples" }

    // Test mdat frame extraction (32-bit box + 64-bit largesize box).
    val fakeFlacFrames = byteArrayOf(0xFF.toByte(), 0xF8.toByte(), 0x6A, 0x0C, 0x01, 0x02, 0x03, 0x04)
    val mdat64Header = ByteBuffer.allocate(16)
        .putInt(1)
        .put("mdat".toByteArray(StandardCharsets.US_ASCII))
        .putLong((16 + fakeFlacFrames.size).toLong())
        .array()
    val segBytes = box("moof", byteArrayOf(9, 9, 9, 9)) + box("mdat", fakeFlacFrames) + mdat64Header + fakeFlacFrames

    val extracted = ByteArrayOutputStream()
    writeFrames.invoke(null, segBytes, extracted)
    val expectedExtracted = fakeFlacFrames + fakeFlacFrames
    check(extracted.toByteArray().contentEquals(expectedExtracted)) {
        "Extracted mdat frames mismatch"
    }
    println("PASS: LinnDashFlacRemuxer header & mdat remuxing")
}
