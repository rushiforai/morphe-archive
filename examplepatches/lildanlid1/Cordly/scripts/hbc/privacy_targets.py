"""Print the HbcPrivacy target lists for the pinned bundle (functions located by name and module)."""
import sys, os, hashlib
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from hbc import Bundle

# Each tuple is (module_path_or_None, function_id_in_350_8, function_name, promise)
# When porting to a new Discord build, pass --locate to resolve functions by (module_path, function_name)
# automatically instead of hardcoded function IDs.
G = {
    'analytics': [
        ('MonitoringAgent.tsx', 35581, 'increment', False),
        ('MonitoringAgent.tsx', 35582, 'distribution', False),
        ('MonitoringAgent.tsx', 35583, '_flush', False),
        ('utils/AnalyticsUtils.tsx', 24188, 'track', True),
        ('../discord_common/js/packages/analytics-utils/AnalyticsUtils.tsx', 85418, 'track', True),
        ('AnalyticsTrackingStore.tsx', 85422, 'drainEventsQueue', True),
        ('AnalyticsTrackingStore.tsx', 85423, 'submitEventsImmediately', True),
        ('AnalyticsTrackingStore.tsx', 85424, 'flushQueuedEvents', True),
        ('AnalyticsTrackingStore.tsx', 85425, 'sendTelemetryEvent', True),
        ('AnalyticsTrackingStore.tsx', 85421, 'scheduleDrain', False),
        ('utils/AnalyticsUtils.tsx', 24191, 'startRecordingAnalyticsEvents', False),
        ('utils/AnalyticsUtils.tsx', 24123, 'addBreadcrumb', False),
        ('utils/AnalyticsUtils.tsx', 24124, 'expandEventProperties', False),
        ('utils/AnalyticsUtils.tsx', 24125, 'debugLogEvent', False),
        ('utils/AnalyticsUtils.tsx', 24196, 'trackNetworkAction', False),
        ('ImpressionStore.tsx', 24199, 'setCurrentImpression', False),
        ('ImpressionStore.tsx', 24200, 'cleanupImpression', False),
        ('ImpressionStore.tsx', 24201, 'setDebugTrackedData', False),
        ('ImpressionStore.tsx', 24202, 'getLocation', False),
        ('SessionHeartbeatScheduler.tsx', 41734, '_trackHeartbeat', False),
        ('Clickstream.tsx', 41754, 'isClickstreamEnabled', False),
        ('Clickstream.tsx', 41757, 'clickstreamExperimentEnabled', False),
        ('useTrackImpression.tsx', 49336, 'trackImpression', False),
        ('useTrackImpression.tsx', 49337, 'useTrackImpression', False),
        ('useTrackImpression.tsx', 49338, 'useTrackImpression', False),
        ('modules/search/native/tracking/Tracking.tsx', 59315, 'trackSearchOpened', False),
        ('modules/search/native/tracking/Tracking.tsx', 59316, 'trackSearchStarted', False),
        ('modules/search/native/tracking/Tracking.tsx', 59317, 'trackSearchResultClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 59318, 'trackSearchResultReturned', False),
        ('modules/search/native/tracking/Tracking.tsx', 59319, 'trackSearchEmptyResult', False),
        ('modules/search/native/tracking/Tracking.tsx', 59320, 'trackSearchEmptyMessageResult', False),
        ('modules/search/native/tracking/Tracking.tsx', 59321, 'trackSearchClosed', False),
        ('modules/search/native/tracking/Tracking.tsx', 59322, 'trackSearchIndexing', False),
        ('modules/search/native/tracking/Tracking.tsx', 59323, 'trackSearchHistoryClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 59324, 'trackSuggestedSearchClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 59325, 'trackSearchFilterAdd', False),
        ('modules/search/native/tracking/Tracking.tsx', 59326, 'trackSearchFilterRemove', False),
        ('modules/search/native/tracking/Tracking.tsx', 59327, 'trackSearchTabSelected', False),
        ('GatewaySocketAnalytics.tsx', 65609, 'logReadyPayloadReceived', False),
        ('GatewaySocketAnalytics.tsx', 65611, 'getReadyPayloadByteSizeAnalytics', False),
        ('GatewaySocketAnalytics.tsx', 65612, 'logGatewayConnected', False),
        ('GatewaySocketAnalytics.tsx', 65614, 'logResumeAnalytics', False),
        ('AutoAnalytics.tsx', 77285, 'componentDidMount', False),
        ('AutoAnalytics.tsx', 77286, 'componentDidUpdate', False),
        ('AutoAnalytics.tsx', 77288, '_trackWithMetadata', False),
        ('AppAnalyticsManager.tsx', 79192, '_initialize', False),
        ('AppAnalyticsManager.tsx', 79194, '_trackStartSpeaking', False),
        ('AppAnalyticsManager.tsx', 79195, '_trackStartListening', False),
    ],
    'telemetry': [
        ('libdiscoreExperiments.tsx', 20592, 'shouldCollectMetrics', False),
        ('websocketTelemetryHook.android.tsx', 81287, 'installWebsocketTelemetryHook', False),
        ('BaseTelemetryChannel.tsx', 26164, 'append', False),
        ('TelemetryRingNative.android.tsx', 26167, 'append', False),
        ('AppStartPerformance.tsx', 18895, 'isTracing', False),
        ('TelemetryRingLifecycle.tsx', 24069, '_initialize', False),
        ('ZoomedInTelemetry.tsx', 26142, 'shouldRun', False),
        ('ZoomedInAnalyticsExperiment.tsx', 26147, 'isZoomedExperimentEnabled', False),
        ('BaseTelemetryExportChannel.tsx', 26153, 'start', False),
        ('BaseTelemetryExportChannel.tsx', 26159, '_kick', True),
        ('TTIAnalyticsUtils.tsx', 41773, '_trackAppUIViewed', False),
        ('TTIAnalyticsUtils.tsx', 41777, 'trackAppOpened', False),
        ('TTIAnalyticsUtils.tsx', 41778, 'trackAppUIViewed', False),
        ('TTIAnalyticsUtils.tsx', 41780, 'trackAppLaunchCompleted', False),
        ('timeRequire.native.tsx', 41922, 'timeRequire', False),
        ('PerformanceAnalyticsActionCreators.tsx', 43200, 'ttiRecorded', False),
        ('ArtProfileAnalytics.android.tsx', 43202, 'trackAndroidArtProfileSnapshot', False),
        ('TouchEventAnalyticsManager.android.tsx', 68623, '_initialize', False),
        ('isJankScreenReportingEnabled.tsx', 73591, 'isJankScreenReportingEnabled', False),
        ('navigationTTIEnabled.tsx', 75541, 'isNavigationTTIEnabled', False),
        ('NavigationSpanTracker.tsx', 57478, 'beginNavigation', False),
        ('NavigationSpanTracker.tsx', 57479, 'recordComponentSpan', False),
        ('NavigationSpanTracker.tsx', 57487, 'recordLateComponentLayout', False),
        ('NavigationSpanTracker.tsx', 57491, 'flush', False),
        ('trackHttpRequest.tsx', 78993, 'trackHttpRequest', False),
        ('JankSessionManager.android.tsx', 79477, '_initialize', False),
        ('JankSessionManager.android.tsx', 79480, 'deliverPendingSessions', False),
        ('JankNavigationReporter.android.tsx', 79482, 'attach', False),
        ('JankNavigationReporter.android.tsx', 79483, 'handleDispatch', False),
        ('JankNavigationReporter.android.tsx', 79484, 'handleStateSettled', False),
        ('JankStatsManager.android.tsx', 79491, 'handleAppStateUpdate', False),
        ('JankStatsManager.android.tsx', 79492, 'handleConnectionOpenSupplemental', False),
        ('JankStatsManager.android.tsx', 79493, 'scheduleReport', False),
        ('JankStatsManager.android.tsx', 79494, 'sendReport', False),
        ('NavigationTTIDispatcherManager.tsx', 81187, 'handleChannelSelect', False),
        ('modules/libdiscore/timerUtils.tsx', 81327, 'flushDelayLogs', False),
        ('modules/libdiscore/timerUtils.tsx', 81328, 'onTimersDelayCallback', False),
        ('modules/libdiscore/timerUtils.tsx', 81329, 'setupLibdiscoreTimersMonitor', False),
    ],
    'crash': [
        (None, 83562, 'send', True),
        (None, 108009, 'send', True),
        ('SentryInitUtils.tsx', 24066, 'initSentry', False),
        ('addSentryBreadcrumb.native.tsx', 21053, 'addSentryBreadcrumb', False),
        ('SentryUtils.native.tsx', 24047, 'setUser', False),
        ('SentryUtils.native.tsx', 24048, 'clearUser', False),
        ('SentryUtils.native.tsx', 24049, 'setTags', False),
        ('SentryUtils.native.tsx', 24050, 'setExtra', False),
        ('SentryUtils.native.tsx', 24051, 'captureException', False),
        ('SentryUtils.native.tsx', 24052, 'captureCrash', False),
        ('SentryUtils.native.tsx', 24053, 'captureMessage', False),
        ('SentryUtils.native.tsx', 24054, 'addFeatureFlag', False),
        ('SentryUtils.native.tsx', 24055, 'addBreadcrumb', False),
        ('SentryUtils.native.tsx', 24060, 'getLastCrashReport', True),
        ('SentryInitUtils.tsx', 24065, 'trackCrash', False),
        ('AppCrashedFatalReport.android.tsx', 81330, 'init', False),
    ],
}

def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    locate = '--locate' in sys.argv[1:]
    B = Bundle(args[0] if args else 'work/new/assets/index.android.bundle')
    h = B.h
    b = h.b
    path_to_mid = {}
    for mid, p in B.paths().items():
        path_to_mid[p] = mid
        path_to_mid[os.path.basename(p)] = mid

    # Hermes deduplicates identical bytecode; a stub on a shared body also replaces the other functions (#93).
    owners = {}
    for fid in range(h.h['functionCount']):
        owners[h.func(fid)['offset']] = owners.get(h.func(fid)['offset'], 0) + 1

    for g, ts in G.items():
        print(f"    val {g} = listOf(")
        for mod, i, n, p in ts:
            if locate and mod and (i >= h.h['functionCount'] or h.fname(i) != n or not h.func(i)['expanded'] or (h.func(i)['flags'] & 0xc8 != 0)):
                mid = path_to_mid.get(mod) or path_to_mid.get(os.path.basename(mod))
                if mid is not None:
                    matches = [f for f in B.tree(mid) if h.fname(f) == n and h.func(f)['expanded'] and (h.func(f)['flags'] & 0xc8 == 0)]
                    if len(matches) == 1:
                        i = matches[0]
            f = h.func(i)
            assert h.fname(i) == n and f['expanded'], (i, n, h.fname(i))
            assert f['flags'] & 0xc8 == 0, f"#{i} ({n}) has exception handler or non-normal flags: 0x{f['flags']:02x}"
            assert owners[f['offset']] == 1, f"#{i} ({n}) shares its body with {owners[f['offset']] - 1} other function(s)"
            body = hashlib.sha256(b[f['offset']:f['offset'] + f['size']]).hexdigest()
            exp = hashlib.sha256(b[f['header']:f['header'] + 40]).hexdigest()
            print(f'        Target({i}, "{n}", {f["offset"]}, {f["size"]}, "{b[128+i*12:140+i*12].hex()}", "{body}", {"true" if p else "false"}, "{exp}"),')
        print("    )")


if __name__ == '__main__':
    main()
