/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.spoof.requests;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.shared.settings.preference.SpoofClientListPreference;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.MwebSiteSession;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class SpoofClientRoutesTest {
    private static final String VIDEO = "abcdefghijk";

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
    }

    @Test
    public void newClientsRequireExplicitSelectionAndPreserveNativeFallbackOrder() {
        var nativeFallback = List.of(ClientType.VISIONOS_1_02, ClientType.ANDROID_MUSIC_REEL);
        var candidates = List.of(ClientType.MWEB, ClientType.ANDROID_VR_EXPERIMENTAL, ClientType.VISIONOS_1_06,
                ClientType.VISIONOS_1_02, ClientType.ANDROID_MUSIC_REEL);
        assertEquals(nativeFallback, StreamOrDetailsDataRequest.buildClientOrder(candidates, ClientType.VISIONOS_1_02));
        assertEquals(List.of(ClientType.MWEB, ClientType.VISIONOS_1_02, ClientType.ANDROID_MUSIC_REEL),
                StreamOrDetailsDataRequest.buildClientOrder(candidates, ClientType.MWEB));
        assertEquals(List.of(ClientType.ANDROID_VR_EXPERIMENTAL, ClientType.VISIONOS_1_02,
                        ClientType.ANDROID_MUSIC_REEL),
                StreamOrDetailsDataRequest.buildClientOrder(candidates, ClientType.ANDROID_VR_EXPERIMENTAL));
        assertEquals(List.of(ClientType.TV_SABR, ClientType.TV_SABR_WII_U),
                StreamOrDetailsDataRequest.buildClientOrder(List.of(), ClientType.TV_SABR));
    }

    @Test
    public void missingMediaBridgeHidesOnlyMobileWebAndRetainsTheNativeDefault() {
        assertFalse(MwebSiteSession.isSupported());
        var choices = SpoofClientListPreference.filter(new String[]{"Mobile Web", "VR", "visionOS"},
                new String[]{"MWEB", "ANDROID_VR_EXPERIMENTAL", "VISIONOS_1_02"});
        assertArrayEquals(new String[]{"VR", "visionOS"}, choices.entries());
        assertArrayEquals(new String[]{"ANDROID_VR_EXPERIMENTAL", "VISIONOS_1_02"}, choices.values());
        assertEquals(ClientType.VISIONOS_1_02,
                MwebSiteSession.selectAvailable(ClientType.MWEB, ClientType.VISIONOS_1_02));
        assertEquals(ClientType.VISIONOS_1_06,
                MwebSiteSession.selectAvailable(ClientType.VISIONOS_1_06, ClientType.VISIONOS_1_02));
    }

    @Test
    public void experimentalVrAndXrKeepSabrAndSerializeTheirOwnVersionAndDevice() throws Exception {
        for (ClientType type : List.of(ClientType.ANDROID_VR_EXPERIMENTAL, ClientType.ANDROID_XR_EXPERIMENTAL)) {
            JSONObject request = body(type);
            JSONObject client = client(request);
            assertTrue(type.requireSABR);
            assertTrue(type.requireLogin);
            assertTrue(type.supportsOAuth2);
            assertEquals("ANDROID_VR", client.getString("clientName"));
            assertEquals("1.91.10", client.getString("clientVersion"));
            assertEquals(type == ClientType.ANDROID_VR_EXPERIMENTAL ? "A8110" : "SM-I610",
                    client.getString("deviceModel"));
            assertEquals(VIDEO, request.getString("videoId"));
            assertFalse(request.has("playerRequest"));
        }
    }

    @Test
    public void experimentalVisionOsUsesItsDashVersionAndKeepsAv1DeviceDistinct() throws Exception {
        for (ClientType type : List.of(ClientType.VISIONOS_1_06, ClientType.VISIONOS_1_06_AV1)) {
            JSONObject client = client(body(type));
            assertFalse(type.requireSABR);
            assertFalse(type.requireLogin);
            assertEquals("VISIONOS", client.getString("clientName"));
            assertEquals("1.06", client.getString("clientVersion"));
            assertEquals("27.2", client.getString("osVersion"));
            assertEquals(type == ClientType.VISIONOS_1_06 ? "RealityDevice14,1" : "RealityDevice17,1",
                    client.getString("deviceModel"));
        }
    }

    @Test
    public void mobileWebMetadataRequestHasWebIdentityAndNoAppIntegrityToken() throws Exception {
        JSONObject request = new JSONObject(PlayerRoutes.createInnertubeBody(
                ClientType.MWEB, VIDEO, "fixture-visitor", 20_777));
        JSONObject client = client(request);
        assertTrue(ClientType.MWEB.requireSABR);
        assertFalse(ClientType.MWEB.canLogin);
        assertFalse(ClientType.MWEB.supportsOAuth2);
        assertEquals("MWEB", client.getString("clientName"));
        assertEquals("2.20261110.07.00", client.getString("clientVersion"));
        assertEquals("fixture-visitor", client.getString("visitorData"));
        assertTrue(client.getString("userAgent").contains("Mobile Safari"));
        assertFalse(client.has("deviceModel"));
        assertFalse(client.has("platform"));
        assertFalse(request.has("serviceIntegrityDimensions"));
        assertEquals("https://m.youtube.com/watch?v=" + VIDEO, request.getJSONObject("playbackContext")
                .getJSONObject("contentPlaybackContext").getString("referer"));
    }

    @Test
    public void mobileWebUsesTheCapturedTimestampEvenWithoutVisitorData() throws Exception {
        JSONObject request = new JSONObject(PlayerRoutes.createInnertubeBody(ClientType.MWEB, VIDEO, "", 20_777));
        assertFalse(client(request).has("visitorData"));
        assertEquals(20_777, request.getJSONObject("playbackContext")
                .getJSONObject("contentPlaybackContext").getInt("signatureTimestamp"));
    }

    private static JSONObject body(ClientType client) throws Exception {
        return new JSONObject(PlayerRoutes.createInnertubeBody(client, VIDEO, "fixture-visitor"));
    }

    private static JSONObject client(JSONObject request) throws Exception {
        return request.getJSONObject("context").getJSONObject("client");
    }
}
