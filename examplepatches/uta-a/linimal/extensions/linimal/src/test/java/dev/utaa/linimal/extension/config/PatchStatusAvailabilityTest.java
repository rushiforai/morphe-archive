package dev.utaa.linimal.extension.config;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

import dev.utaa.linimal.extension.status.PatchStatusReadResult;
import dev.utaa.linimal.extension.status.PatchStatusRepository;

public final class PatchStatusAvailabilityTest {
    /** 必須 patch が登録済みの feature でないと利用可能にならないため、実在の ID を使います。 */
    @Test
    public void onlyFullyAppliedFeaturesAreAvailable() {
        FeatureAvailability availability = PatchStatusAvailability.of(read(
                "{\"schemaVersion\":1,\"patches\":["
                        + patch("linimal.patch.premium-unsend", "linimal.premium", "OK", 1, 1) + ","
                        + patch("linimal.patch.premium-settings-row", "linimal.premium-settings-row",
                                "PARTIAL", 2, 1)
                        + "]}"));

        assertTrue(availability.isAvailable("linimal.premium"));
        assertFalse(availability.isAvailable("linimal.premium-settings-row"));
    }

    @Test
    public void featuresMissingFromTheReportAreUnavailable() {
        FeatureAvailability availability = PatchStatusAvailability.of(read(
                "{\"schemaVersion\":1,\"patches\":["
                        + patch("linimal.patch.premium-unsend", "linimal.premium", "OK", 1, 1)
                        + "]}"));

        assertFalse(availability.isAvailable("linimal.unrecorded"));
        assertFalse(availability.isAvailable(null));
    }

    @Test
    public void unreadableReportMakesEveryFeatureUnavailable() {
        FeatureAvailability broken = PatchStatusAvailability.of(
                read("{\"schemaVersion\":1,\"patches\":["));

        assertFalse(broken.isAvailable("linimal.premium"));
        assertFalse(PatchStatusAvailability.of(null).isAvailable("linimal.premium"));
    }

    @Test
    public void unreadSuppressionRequiresTheSessionBoundaryPatch() {
        String featureId = "linimal.read-without-receipt";
        String existing = patch("linimal.patch.read-without-receipt-menu-label-resource",
                featureId, "OK", 1, 1) + ","
                + patch("linimal.patch.read-without-receipt-compose-menu-row",
                        featureId, "OK", 1, 1) + ","
                + patch("linimal.patch.read-without-receipt-mark-as-read-block",
                        featureId, "OK", 1, 1) + ","
                + patch("linimal.patch.read-without-receipt-local-read-block",
                        featureId, "OK", 1, 1) + ","
                + patch("linimal.patch.read-without-receipt-send", featureId, "OK", 1, 1) + ","
                + patch("linimal.patch.read-without-receipt-manual-read", featureId, "OK", 1, 1);

        assertFalse(PatchStatusAvailability.of(read(
                "{\"schemaVersion\":1,\"patches\":[" + existing + "]}"))
                .isAvailable(featureId));
        assertTrue(PatchStatusAvailability.of(read(
                "{\"schemaVersion\":1,\"patches\":[" + existing + ","
                        + patch("linimal.patch.read-without-receipt-session",
                                featureId, "OK", 2, 2) + "]}"))
                .isAvailable(featureId));
    }

    @Test
    public void unreadSuppressionRequiresManualBridge() {
        String featureId = LinimalFeature.READ_WITHOUT_RECEIPT.getFeatureId();
        String[] patchIds = {
                "linimal.patch.read-without-receipt-menu-label-resource",
                "linimal.patch.read-without-receipt-compose-menu-row",
                "linimal.patch.read-without-receipt-mark-as-read-block",
                "linimal.patch.read-without-receipt-local-read-block",
                "linimal.patch.read-without-receipt-session",
                "linimal.patch.read-without-receipt-send",
                "linimal.patch.read-without-receipt-manual-read"
        };
        assertTrue(featureAvailability(featureId, patchIds, -1, false).isAvailable(featureId));
        for (int index = 6; index < patchIds.length; index++) {
            assertFalse(featureAvailability(featureId, patchIds, index, false).isAvailable(featureId));
            assertFalse(featureAvailability(featureId, patchIds, index, true).isAvailable(featureId));
        }
    }

    @Test
    public void notificationUnreadSuppressionRequiresOnlyItsEntryAndSharedReadPaths() {
        String featureId = LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT.getFeatureId();
        String[] patchIds = {
                "linimal.patch.notification-read-without-receipt-entry",
                "linimal.patch.notification-read-without-receipt-mark-as-read-block",
                "linimal.patch.notification-read-without-receipt-local-read-block",
                "linimal.patch.notification-read-without-receipt-session",
                "linimal.patch.notification-read-without-receipt-send",
                "linimal.patch.notification-read-without-receipt-manual-read"
        };
        // メニューや navigation の patch を含めず、通知入口と実際の既読経路だけで利用可能です。
        assertTrue(notificationAvailability(patchIds, -1, false).isAvailable(featureId));
        for (int index = 0; index < patchIds.length; index++) {
            assertFalse(patchIds[index],
                    notificationAvailability(patchIds, index, false).isAvailable(featureId));
            assertFalse(patchIds[index],
                    notificationAvailability(patchIds, index, true).isAvailable(featureId));
        }
    }

    private static FeatureAvailability notificationAvailability(
            String[] patchIds, int unavailableIndex, boolean partial) {
        return featureAvailability(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT.getFeatureId(),
                patchIds, unavailableIndex, partial);
    }

    private static FeatureAvailability featureAvailability(
            String featureId, String[] patchIds, int unavailableIndex, boolean partial) {
        StringBuilder patches = new StringBuilder();
        for (int index = 0; index < patchIds.length; index++) {
            if (index == unavailableIndex && !partial) {
                continue;
            }
            if (patches.length() > 0) {
                patches.append(',');
            }
            boolean applied = index != unavailableIndex;
            patches.append(patch(patchIds[index], featureId,
                    applied ? "OK" : "PARTIAL", 1, applied ? 1 : 0));
        }
        return PatchStatusAvailability.of(read(
                "{\"schemaVersion\":1,\"patches\":[" + patches + "]}"));
    }

    private static PatchStatusReadResult read(String json) {
        return PatchStatusRepository.read(
                new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8)));
    }

    private static String patch(
            String patchId, String featureId, String status, int expected, int actual) {
        return "{\"patchId\":\"" + patchId + "\",\"featureId\":\"" + featureId + "\","
                + "\"status\":\"" + status + "\",\"expectedTargetCount\":" + expected + ","
                + "\"actualTargetCount\":" + actual + "}";
    }
}
