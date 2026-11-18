package app.template.patches.calendar.widget

import java.io.File
import java.util.Base64
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Element
import app.morphe.patcher.patch.PatchException

/** Android 16 drawable overrides: immutable pixels avoid mutable shape geometry. */
internal object ScheduleTileShapes {
    private const val ANDROID = "http://schemas.android.com/apk/res/android"
    // xxxhdpi (4 px/dp); 12dp event/task corners and 1dp outline.
    // The centre stretches; corners and stroke thickness do not.
    // aapt2-compiled PNGs include npTc; Morphe copies binary resources without
    // compiling raw .9.png borders and uses the single extension for resource IDs.
    private const val FILL = "iVBORw0KGgoAAAANSUhEUgAAAHAAAABwCAQAAABs6TzAAAAAGG5wT2wAAAAAAAAAAAAAAAAAAAAA+TE/Qv8AAADhMgeyAAAAVG5wVGMAAgIJIAAAACgAAAAAAAAAAAAAAAAAAAAAAAAAMAAAAAAAADQAAAA8AAAANAAAADwAAAAB/////wAAAAH///////////////8AAAAB/////wAAAAEb9cMTAAAFQElEQVR42u2dz2sUZxjHP8/7bry4bYiBgrSHBiEpWCraRiiotdU014KYg94C6sG/QRQF8SzowaMnwUvBi1ZtaVQKpkWsFZqFYg8tgcImpMaL7sy3h5n9MdndSJrE7LzOcwkhZOb95Pk17+z7fGOsyuRwyKL0u/f4mGE+ZCdbKPPRCi70O4vM8Yg/qfCb/ZNez2PEFq9mhbYKOA8Jmt5nlL18zjCDrN6qVPiJe0zb39n7vDFAGY7YBPqAMb7hS96p/wghDLAVXVsIENbye8/5gW+5bX+13vENmHz6dUxXtaDEanqlmmKthcXp1RJb0FWNZe+8rnAy0CZN6kEDba3AOoHWMR9oUptAto6Q9YtrUk8aC1gftKWYyV2eaLL5R16nwNQB3Un9FulNWpT68o4OrEuwqgTq18UNgVsKeVH9yYrWLjQdaFwzLTfZKEv+uDMaB7k1CdU0NE9Lkl6pFyxZxek1CVV50KBuSoo2KDA7B2sk6aYGV4moPtCoKj3ju6V+rGg0WeX/epKRt0ij3GKAGiV6z2qUmGfcpuW7P8q57nXTIk1wiwGinsSDEhED3NKERSuuqeoDHUrjvZctWd2h7oFqywbnu4Cnty0C/u0eqNZpj2exPuM7Boi7h3APWYxjnq/tZ7n2vaN12ArBFqYZIup57zW96HnGKHOwdEvV7iFn4hpD1HKDB54aQ1wztfO4DrXzDAd7tDEsV1FrHNSZ9npqbcXlALeJc+S91kB1jNndbLGxTPYZm3nEtpwUl07F5g928gI1M9Flsi/mAtuIcokHjohtXLCMeywTnvv4MUe1s1s9/cKmmmHqMjuHc4Rg51p3GK7pP46yL+f+A0/EPo5aVIe0RnPv41eGUU7zr7XUGBU+4VXS9F2juR9hJKfVc2mpiRnhSL3pu/S9MpxEhGLiZEqFA3mLtZ9dKOf518xDsUv7LZZvVtHjOOJgPBjjOJ4WGZlJW6mwmVV91tRjIQovGLZZmcMD45SJg8EDI6bMOOAdAg4Toh1OO6C2UqGcfqoXTh01Fhm2WQfspkwUFB4YEWV2J1V0b71nBGVKyJxK7IEAnmA6vavYo5JjkOGAGkR2IzjMoGOE/sAKTB1Q9DPi2I4LMAOTLHRsdwwFWWLqZWbIsSPIDKxn4Q63JmeTetcGHeWgPVg2KWgPBtjgC8ACsAAsAAvAArAALAALwAKwACwAC8ACsAAsAAvAHgCcIeQ32zOOxaABFx3VoCO06ngctAcfO54R8qv7Z46nQZ2QyQLGPHXMsIAFeQjBWGDGUaVCqKcsKlSd1bgPAR3Eq1sM3LeaA+4R6imLe8mj2kMW8YEFqfAs8hCcvM0yFVyQxsCUzco7DLgeZJu4Dlj4B2JN8jbLDYwoGN9FGDdsVt5U3w9eCWKkoLkJjLnSLKbJUOs0n+Z0rK7df45fbDQZeHUNzEtBndm+VHfe2zHaY8LZS84H8dAtjPP2EpcMSbbMDwLf537+LMIzxVdNHa/WWcmIU0Fk4KnWGV7XxJO3KS7jc9wPIzyXW+c/364hZRNmzzmRirjlsbyIE/Yca1VDyHjKIpXsLmfx1HKHV8Nz1u6qlJXsaNey8Bbpdu60EGqUuGNj7Yokb59YhwmzKhPM43OyCY7xzDNh1Wz2dfFgI0wDEczp2A4sUp9Ncwzf816M8XiO2bT6VqhBqhJoQnPSBmvhLa+TJ81pYjkhwOBlx5b3YgDCca9DDFv6r7GNCle8MWn9QctvttTUUAVUM6EaqgRuGqohixjX/RiwDHU2WPMiJB68FHwh5v8ayJ7/dwz/AftYszGn0Vn3AAAAAElFTkSuQmCC"
    private const val OUTLINE = "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"

    fun install(resolve: (String) -> File) {
        val xml = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        val layout = xml.newDocumentBuilder().parse(resolve("res/layout/widgetschedule_chip_background.xml"))
        val view = layout.documentElement
        requireShape(view.tagName == "ImageView" &&
            view.getAttributeNS(ANDROID, "id") == "@id/agenda_item_color" &&
            view.getAttributeNS(ANDROID, "src") == "@drawable/widget_chip_fill" &&
            view.getAttributeNS(ANDROID, "scaleType") == "fitXY", "schedule background layout changed")

        val dimensionDocument = xml.newDocumentBuilder().parse(resolve("res/values/dimens.xml"))
        val dimensionNodes = dimensionDocument.getElementsByTagName("dimen")
        val dimensions = (0 until dimensionNodes.length).map { dimensionNodes.item(it) as Element }
            .associate { it.getAttribute("name") to it.textContent.trim() }
        requireShape(dimensionDp("@dimen/widget_chip_corner_radius", dimensions) == 12.0,
            "native tile radius changed: ${dimensions["widget_chip_corner_radius"]}")

        val specs = listOf(
            Triple("widget_chip_fill", FILL, "?widget_blue"),
            Triple("widget_chip_outline", OUTLINE, "?widget_blue"),
        )
        // Validate every input before writing. Only shapes used by the agenda
        // are replaced; icon/date circles and the month widget stay native.
        val documents = specs.map { (name, _, _) ->
            val document = xml.newDocumentBuilder().parse(resolve("res/drawable/$name.xml"))
            val shapes = document.getElementsByTagName("shape")
            requireShape(shapes.length == if (name == "widget_chip_fill") 2 else 1,
                "$name shape count changed")
            for (i in 0 until shapes.length) {
                val shape = shapes.item(i) as Element
                requireShape(shape.getAttributeNS(ANDROID, "shape") == "rectangle",
                    "$name is no longer rectangular")
                val corners = shape.getElementsByTagName("corners")
                requireShape(corners.length == 1, "$name corner definition changed")
                val radius = (corners.item(0) as Element).getAttributeNS(ANDROID, "radius")
                // Resource decoders can emit dp/dip, inline the value, or retain
                // a dimension reference. Compare resolved geometry, not XML spelling.
                requireShape(dimensionDp(radius, dimensions) == 12.0,
                    "$name radius changed: '$radius' (expected 12dp)")
            }
            document
        }
        // Refuse qualified alternatives rather than silently leaving a mutable
        // night/size-specific shape behind. These are absent in the supported APK.
        val res = resolve("res")
        for (directory in res.listFiles().orEmpty().filter { it.name.startsWith("drawable-") }) {
            for ((name, _, _) in specs) requireShape(!File(directory, "$name.xml").exists(),
                "$name has an unexpected qualified variant")
        }
        for ((name, _, _) in specs) {
            requireShape(!resolve("res/drawable-xxxhdpi/dudeks_${name}_pixels.png").exists(),
                "input already contains tile pixels; use a clean APK")
            requireShape(!resolve("res/drawable-v36/$name.xml").exists(),
                "input already contains tile overrides; use a clean APK")
        }
        for ((index, spec) in specs.withIndex()) {
            val (name, pixels, tint) = spec
            val pixelName = "dudeks_${name}_pixels"
            val png = resolve("res/drawable-xxxhdpi/$pixelName.png")
            png.parentFile.mkdirs()
            png.writeBytes(Base64.getDecoder().decode(pixels))
            val document = documents[index]
            val shapes = document.getElementsByTagName("shape")
            // The NodeList is live; replace from the end. Preserve the fill's
            // layer-list/ripple and its native highlight color and mask gravity.
            for (i in shapes.length - 1 downTo 0) {
                val shape = shapes.item(i) as Element
                val replacement = document.createElement("nine-patch")
                replacement.setAttributeNS(ANDROID, "android:src", "@drawable/$pixelName")
                replacement.setAttributeNS(ANDROID, "android:tint", if (i == 1) "@android:color/black" else tint)
                replacement.setAttributeNS(ANDROID, "android:dither", "false")
                shape.parentNode.replaceChild(replacement, shape)
            }
            val output = resolve("res/drawable-v36/$name.xml")
            output.parentFile.mkdirs()
            TransformerFactory.newInstance().newTransformer().transform(DOMSource(document), StreamResult(output))
        }
    }

    private fun dimensionDp(raw: String, dimensions: Map<String, String>,
                            visited: Set<String> = emptySet()): Double? {
        val value = raw.trim()
        if (value.startsWith("@dimen/")) {
            val name = value.removePrefix("@dimen/")
            if (name in visited) return null
            return dimensions[name]?.let { dimensionDp(it, dimensions, visited + name) }
        }
        val match = Regex("([+]?(?:[0-9]+(?:[.][0-9]*)?|[.][0-9]+))(?:dp|dip)")
            .matchEntire(value) ?: return null
        return match.groupValues[1].toDoubleOrNull()?.takeIf { it.isFinite() }
    }

    private fun requireShape(ok: Boolean, message: String) {
        if (!ok) throw PatchException("Stabilize schedule widget: $message")
    }
}
