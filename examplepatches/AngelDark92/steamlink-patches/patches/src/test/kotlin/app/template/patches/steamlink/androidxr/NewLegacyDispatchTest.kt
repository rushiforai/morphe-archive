package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.isMouseOnlySteamLinkBuild
import app.template.patches.shared.Constants.isTwoProjectionSteamLinkBuild
import app.template.patches.steamlink.identity.deviceIdentityPatch
import app.template.patches.steamlink.identity.resolveDeviceIdentityProfile
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class NewLegacyDispatchTest {
    private val newLegacyBuilds = listOf("2.0.20" to "5001812", "2.0.21" to "5001968")

    @Test
    fun `new legacy bases select the verified 2 projection payload and mouse only JNI wrappers`() {
        (listOf("2.0.20" to "5001712") + newLegacyBuilds).forEach { (version, code) ->
            assertTrue(isTwoProjectionSteamLinkBuild(version, code), "$version/$code")
            assertTrue(isMouseOnlySteamLinkBuild(version, code), "$version/$code")
            assertEquals(
                ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY,
                androidSurfaceTriggerResourceLibraryForBuild(version, code),
                "$version/$code",
            )
            assertEquals(
                XrPointerRouteMethods("routeXrPointerAsMouse5001712", "routeXrPointerAsMouseGeneric5001712"),
                xrPointerRouteMethodsFor(version, code),
                "$version/$code",
            )
        }
    }

    @Test
    fun `later bases and mismatched pairs retain standard projection and input dispatch`() {
        listOf(
            "2.0.22" to "5002244",
            "2.0.23" to "5002363",
            "2.0.20" to "5001968",
            "2.0.21" to "5001812",
            "2.0.22" to "5001812",
            "2.0.22" to "5001968",
            "2.0.20" to "5001813",
            "2.0.21" to "5001969",
        ).forEach { (version, code) ->
            assertFalse(isTwoProjectionSteamLinkBuild(version, code), "$version/$code")
            assertFalse(isMouseOnlySteamLinkBuild(version, code), "$version/$code")
            assertEquals(
                ANDROID_SURFACE_TRIGGER_LIBRARY,
                androidSurfaceTriggerResourceLibraryForBuild(version, code),
                "$version/$code",
            )
            assertEquals(
                XrPointerRouteMethods("routeXrPointerAsMouse", "routeXrPointerAsMouseGeneric"),
                xrPointerRouteMethodsFor(version, code),
                "$version/$code",
            )
        }
    }

    @Test
    fun `new legacy bases preserve requested extensions arrays in every identity payload`() {
        listOf(
            "/steamlink/androidxr/hmd_config.json",
            "/steamlink/identity/hmd_config_meta_quest_pro.json",
            "/steamlink/identity/hmd_config_pico_4_pro.json",
        ).forEach { resource ->
            val original = requireNotNull(javaClass.getResource(resource)).readBytes()
            assertTrue(Regex("\"requestedExtensions\"\\s*:\\s*\\[").containsMatchIn(original.decodeToString()))
            newLegacyBuilds.forEach { (version, code) ->
                assertContentEquals(
                    original,
                    adaptLegacyHmdConfigForBuild(original, version, code),
                    "$resource: $version/$code",
                )
            }
        }
    }

    @Test
    fun `recommended identity resolves to Quest Pro without changing explicit choices or option defaults`() {
        newLegacyBuilds.forEach { (version, code) ->
            assertEquals("meta-quest-pro", resolveDeviceIdentityProfile("recommended", version, code))
            listOf("samsung-galaxy-xr", "meta-quest-pro", "pico-4-pro", "stock-no-change").forEach { profile ->
                assertEquals(profile, resolveDeviceIdentityProfile(profile, version, code))
            }
        }
        listOf("2.0.20" to "5001968", "2.0.21" to "5001812").forEach { (version, code) ->
            assertEquals("samsung-galaxy-xr", resolveDeviceIdentityProfile("recommended", version, code))
        }
        assertEquals("recommended", deviceIdentityPatch.options["profile"].default)
    }
}
