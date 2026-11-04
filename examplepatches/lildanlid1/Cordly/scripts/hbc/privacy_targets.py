"""Print the HbcPrivacy target lists for the pinned bundle (functions located by name and module)."""
import sys, os, hashlib
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from hbc import Bundle

# Each tuple is (module_path_or_None, function_id_in_351_11, function_name, promise)
# When porting to a new Discord build, pass --locate to resolve functions by (module_path, function_name)
# automatically instead of hardcoded function IDs.
G = {
    'analytics': [
        ('MonitoringAgent.tsx', 36109, 'increment', False),
        ('MonitoringAgent.tsx', 36110, 'distribution', False),
        ('MonitoringAgent.tsx', 36111, '_flush', False),
        ('utils/AnalyticsUtils.tsx', 24603, 'track', True),
        ('../discord_common/js/packages/analytics-utils/AnalyticsUtils.tsx', 86596, 'track', True),
        ('AnalyticsTrackingStore.tsx', 86600, 'drainEventsQueue', True),
        ('AnalyticsTrackingStore.tsx', 86601, 'submitEventsImmediately', True),
        ('AnalyticsTrackingStore.tsx', 86602, 'flushQueuedEvents', True),
        ('AnalyticsTrackingStore.tsx', 86603, 'sendTelemetryEvent', True),
        ('AnalyticsTrackingStore.tsx', 86599, 'scheduleDrain', False),
        ('utils/AnalyticsUtils.tsx', 24606, 'startRecordingAnalyticsEvents', False),
        ('utils/AnalyticsUtils.tsx', 24538, 'addBreadcrumb', False),
        ('utils/AnalyticsUtils.tsx', 24539, 'expandEventProperties', False),
        ('utils/AnalyticsUtils.tsx', 24540, 'debugLogEvent', False),
        ('utils/AnalyticsUtils.tsx', 24611, 'trackNetworkAction', False),
        ('ImpressionStore.tsx', 24614, 'setCurrentImpression', False),
        ('ImpressionStore.tsx', 24615, 'cleanupImpression', False),
        ('ImpressionStore.tsx', 24616, 'setDebugTrackedData', False),
        ('ImpressionStore.tsx', 24617, 'getLocation', False),
        ('SessionHeartbeatScheduler.tsx', 42449, '_trackHeartbeat', False),
        ('Clickstream.tsx', 42469, 'isClickstreamEnabled', False),
        ('ClickstreamExperiment.tsx', 42472, 'clickstreamExperimentEnabled', False),
        ('useTrackImpression.tsx', 50084, 'trackImpression', False),
        ('useTrackImpression.tsx', 50085, 'useTrackImpression', False),
        ('useTrackImpression.tsx', 50086, 'useTrackImpression', False),
        ('modules/search/native/tracking/Tracking.tsx', 63072, 'trackSearchOpened', False),
        ('modules/search/native/tracking/Tracking.tsx', 63073, 'trackSearchStarted', False),
        ('modules/search/native/tracking/Tracking.tsx', 63074, 'trackSearchResultClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 63075, 'trackSearchResultReturned', False),
        ('modules/search/native/tracking/Tracking.tsx', 63076, 'trackSearchEmptyResult', False),
        ('modules/search/native/tracking/Tracking.tsx', 63077, 'trackSearchEmptyMessageResult', False),
        ('modules/search/native/tracking/Tracking.tsx', 63078, 'trackSearchClosed', False),
        ('modules/search/native/tracking/Tracking.tsx', 63079, 'trackSearchIndexing', False),
        ('modules/search/native/tracking/Tracking.tsx', 63080, 'trackSearchHistoryClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 63081, 'trackSuggestedSearchClicked', False),
        ('modules/search/native/tracking/Tracking.tsx', 63082, 'trackSearchFilterAdd', False),
        ('modules/search/native/tracking/Tracking.tsx', 63083, 'trackSearchFilterRemove', False),
        ('modules/search/native/tracking/Tracking.tsx', 63084, 'trackSearchTabSelected', False),
        ('GatewaySocketAnalytics.tsx', 68010, 'logReadyPayloadReceived', False),
        ('GatewaySocketAnalytics.tsx', 68012, 'getReadyPayloadByteSizeAnalytics', False),
        ('GatewaySocketAnalytics.tsx', 68013, 'logGatewayConnected', False),
        ('GatewaySocketAnalytics.tsx', 68015, 'logResumeAnalytics', False),
        ('AutoAnalytics.tsx', 78388, 'componentDidMount', False),
        ('AutoAnalytics.tsx', 78389, 'componentDidUpdate', False),
        ('AutoAnalytics.tsx', 78391, '_trackWithMetadata', False),
        ('AppAnalyticsManager.tsx', 80334, '_initialize', False),
        ('AppAnalyticsManager.tsx', 80336, '_trackStartSpeaking', False),
        ('AppAnalyticsManager.tsx', 80337, '_trackStartListening', False),
    ],
    'telemetry': [
        ('libdiscoreExperiments.tsx', 20991, 'shouldCollectMetrics', False),
        ('websocketTelemetryHook.android.tsx', 82451, 'installWebsocketTelemetryHook', False),
        ('BaseTelemetryChannel.tsx', 26581, 'append', False),
        ('TelemetryRingNative.android.tsx', 26584, 'append', False),
        ('AppStartPerformance.tsx', 19294, 'isTracing', False),
        ('TelemetryRingLifecycle.tsx', 24484, '_initialize', False),
        ('ZoomedInTelemetry.tsx', 26559, 'shouldRun', False),
        ('ZoomedInAnalyticsExperiment.tsx', 26564, 'isZoomedExperimentEnabled', False),
        ('BaseTelemetryExportChannel.tsx', 26570, 'start', False),
        ('BaseTelemetryExportChannel.tsx', 26576, '_kick', True),
        ('TTIAnalyticsUtils.tsx', 42488, '_trackAppUIViewed', False),
        ('TTIAnalyticsUtils.tsx', 42492, 'trackAppOpened', False),
        ('TTIAnalyticsUtils.tsx', 42493, 'trackAppUIViewed', False),
        ('TTIAnalyticsUtils.tsx', 42495, 'trackAppLaunchCompleted', False),
        ('timeRequire.native.tsx', 42637, 'timeRequire', False),
        ('PerformanceAnalyticsActionCreators.tsx', 43915, 'ttiRecorded', False),
        ('ArtProfileAnalytics.android.tsx', 43917, 'trackAndroidArtProfileSnapshot', False),
        ('TouchEventAnalyticsManager.android.tsx', 71035, '_initialize', False),
        ('isJankScreenReportingEnabled.tsx', 75857, 'isJankScreenReportingEnabled', False),
        ('navigationTTIEnabled.tsx', 77651, 'isNavigationTTIEnabled', False),
        ('NavigationSpanTracker.tsx', 61861, 'beginNavigation', False),
        ('NavigationSpanTracker.tsx', 61862, 'recordComponentSpan', False),
        ('NavigationSpanTracker.tsx', 61870, 'recordLateComponentLayout', False),
        ('NavigationSpanTracker.tsx', 61874, 'flush', False),
        ('trackHttpRequest.tsx', 80134, 'trackHttpRequest', False),
        ('JankSessionManager.android.tsx', 80619, '_initialize', False),
        ('JankSessionManager.android.tsx', 80622, 'deliverPendingSessions', False),
        ('JankNavigationReporter.android.tsx', 80624, 'attach', False),
        ('JankNavigationReporter.android.tsx', 80625, 'handleDispatch', False),
        ('JankNavigationReporter.android.tsx', 80626, 'handleStateSettled', False),
        ('JankStatsManager.android.tsx', 80633, 'handleAppStateUpdate', False),
        ('JankStatsManager.android.tsx', 80634, 'handleConnectionOpenSupplemental', False),
        ('JankStatsManager.android.tsx', 80635, 'scheduleReport', False),
        ('JankStatsManager.android.tsx', 80636, 'sendReport', False),
        ('NavigationTTIDispatcherManager.tsx', 82345, 'handleChannelSelect', False),
        ('modules/libdiscore/timerUtils.tsx', 82491, 'flushDelayLogs', False),
        ('modules/libdiscore/timerUtils.tsx', 82492, 'onTimersDelayCallback', False),
        ('modules/libdiscore/timerUtils.tsx', 82493, 'setupLibdiscoreTimersMonitor', False),
    ],
    'crash': [
        (None, 84727, 'send', True),
        (None, 113271, 'send', True),
        ('SentryInitUtils.tsx', 24481, 'initSentry', False),
        ('addSentryBreadcrumb.native.tsx', 21453, 'addSentryBreadcrumb', False),
        ('SentryUtils.native.tsx', 24462, 'setUser', False),
        ('SentryUtils.native.tsx', 24463, 'clearUser', False),
        ('SentryUtils.native.tsx', 24464, 'setTags', False),
        ('SentryUtils.native.tsx', 24465, 'setExtra', False),
        ('SentryUtils.native.tsx', 24466, 'captureException', False),
        ('SentryUtils.native.tsx', 24467, 'captureCrash', False),
        ('SentryUtils.native.tsx', 24468, 'captureMessage', False),
        ('SentryUtils.native.tsx', 24469, 'addFeatureFlag', False),
        ('SentryUtils.native.tsx', 24470, 'addBreadcrumb', False),
        ('SentryUtils.native.tsx', 24475, 'getLastCrashReport', True),
        ('SentryInitUtils.tsx', 24480, 'trackCrash', False),
        ('AppCrashedFatalReport.android.tsx', 82494, 'init', False),
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
