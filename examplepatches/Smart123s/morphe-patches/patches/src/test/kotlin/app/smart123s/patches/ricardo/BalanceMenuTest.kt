package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import com.google.gson.JsonParser
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal class BalanceMenuTest {
    private val original = """
        {"body":[{"name":"other"},{"name":"bg","fixture":[{"name":"existing"}]}],
         "image":[{"name":"icons","file":"tuning_icons.png","body":1,
                   "center":{"x":-13.4,"y":-29.5},"filter":1}],
         "joint":[{"bodyA":0,"bodyB":1}],"gravity":{"x":0,"y":-10}}
    """.trimIndent()

    @Test
    fun `coin and sensor follow the tuning background without changing existing scene items`() {
        val before = JsonParser.parseString(original).asJsonObject
        val after = JsonParser.parseString(RicardoBalanceMenu.addButton(original)).asJsonObject
        val bodies = after.getAsJsonArray("body")
        val images = after.getAsJsonArray("image")
        assertEquals(2, bodies.size())
        assertEquals(2, images.size())
        val image = images[1].asJsonObject
        val fixture = bodies[1].asJsonObject.getAsJsonArray("fixture")[1].asJsonObject
        assertEquals("coin.png", image["file"].asString)
        assertEquals(1, image["body"].asInt) // Resolve the anchor; never assume body 38.
        assertEquals(RicardoBalanceMenu.BUTTON, fixture["name"].asString)
        assertTrue(fixture["sensor"].asBoolean)
        assertEquals(0, fixture["filter-maskBits"].asInt)
        assertEquals(image["center"], fixture.getAsJsonObject("circle")["center"])
        assertEquals(-18.5, image.getAsJsonObject("center")["x"].asDouble, 0.001)
        assertEquals(-32.0, image.getAsJsonObject("center")["y"].asDouble, 0.001)
        val corners = image.getAsJsonObject("corners")
        assertEquals(3.5, corners.getAsJsonArray("x")[1].asDouble - corners.getAsJsonArray("x")[0].asDouble, 0.001)
        assertEquals(3.5, corners.getAsJsonArray("y")[2].asDouble - corners.getAsJsonArray("y")[1].asDouble, 0.001)
        images.remove(1)
        bodies[1].asJsonObject.getAsJsonArray("fixture").remove(1)
        assertEquals(before, after)
    }

    @Test
    fun `refuses duplicate buttons and unsupported menu layouts`() {
        assertFailsWith<PatchException> {
            RicardoBalanceMenu.addButton(RicardoBalanceMenu.addButton(original))
        }
        assertFailsWith<PatchException> {
            RicardoBalanceMenu.addButton(original.replace("tuning_icons.png", "unknown.png"))
        }
        assertFailsWith<PatchException> {
            RicardoBalanceMenu.addButton(original.replace("\"bg\"", "\"different\""))
        }
    }
}
