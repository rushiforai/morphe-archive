package app.badfella.extension.linkedin;

/** Injection points of Keep feed on reopen and Anonymous profile viewing. */
@SuppressWarnings("unused")
public final class LinkedInHooks {
    private LinkedInHooks() {
    }

    /**
     * Injection point, where the feeds read when the app last went to the background. With Keep feed on reopen
     * the answer is "just now", so neither the server driven feed's rule nor the classic 7 minute rule reloads it.
     */
    public static long feedBackgroundTime(long timestamp) {
        return Settings.keepFeed() && timestamp > 0 ? System.currentTimeMillis() : timestamp;
    }

    /**
     * Injection point, before each return of HomeNavTabsManager.getHomeNavTabs(): the tabs of the bottom bar.
     *
     * @return the tabs without My Network and Jobs when they are hidden. The list is returned as it was when it
     * would end up with fewer than three tabs or the tabs can't be told apart, so the bar can't break.
     */
    public static java.util.List<?> bottomTabs(java.util.List<?> tabs) {
        try {
            boolean network = Settings.hideTabNetwork();
            boolean jobs = Settings.hideTabJobs();
            if (tabs == null || (!network && !jobs)) return tabs;
            java.util.List<Object> kept = new java.util.ArrayList<>();
            for (Object tab : tabs) {
                java.lang.reflect.Field f = tab.getClass().getDeclaredField("trackingControlName");
                f.setAccessible(true);
                Object name = f.get(tab);
                if (network && "nav_people".equals(name)) continue;
                if (jobs && "nav_jobs".equals(name)) continue;
                kept.add(tab);
            }
            return kept.size() >= 3 ? kept : tabs;
        } catch (Throwable t) {
            Diagnostics.error("bottomTabs failed", t);
            return tabs;
        }
    }

    /**
     * Injection point, at the start of SduiRepository.makeStreamingNetworkCall(namespace, name, request, route, ...):
     * every request of the server driven screens and actions. Only written with diagnostic logging, to find the
     * request that records a profile visit.
     */
    public static void onSduiRequest(Object namespace, Object name, Object request, Object route) {
        try {
            if (!Settings.debug()) return;
            String body = String.valueOf(request);
            if (body.length() > 240) body = body.substring(0, 240) + "...";
            Settings.debugLog("sdui request on " + SduiMediaDownload.resumedScreen().replaceAll(".*\\.", "")
                    + ": " + namespace + " / " + name + " / " + route + " / "
                    + (request == null ? "null" : request.getClass().getSimpleName()) + " " + body.replace('\n', ' '));
        } catch (Throwable t) {
            Diagnostics.error("onSduiRequest failed", t);
        }
    }

    /** Injection point, at the start of Tracker.sendViaLiTracker(eventName, event, ...). */
    public static boolean dropLiTrackerEvent(Object eventName, Object event) {
        return dropOutgoingEvent(eventName, event, "LiTracker");
    }

    /** Injection point, at the start of MetricQueue.sendViaTfe(eventName, bytes, event). */
    public static boolean dropTfeEvent(Object eventName, Object bytes, Object event) {
        return dropOutgoingEvent(eventName, event, "TFE");
    }

    /**
     * Every analytics event leaves the app through one of LinkedIn's two senders, as a map with its page. With
     * Anonymous profile viewing, every event of a profile page is dropped (its page view, impressions and any profile
     * view event), so nothing the app sends says a profile was seen.
     *
     * @return true to drop the event.
     */
    private static boolean dropOutgoingEvent(Object eventName, Object event, String route) {
        try {
            String name = String.valueOf(eventName);
            String page = findString(event, 0);
            boolean profile = name.contains("ProfileView") || (page != null && page.toLowerCase().contains("profile"));
            boolean drop = profile && Settings.anonymousProfileViewing();
            if (profile && Settings.debug()) {
                Settings.debugLog("tracking out " + route + ": " + name + " page=" + page + (drop ? " dropped" : " sent"));
            }
            return drop;
        } catch (Throwable t) {
            Diagnostics.error("dropOutgoingEvent failed", t);
            return false;
        }
    }

    /** The first pageUrn or pageKey string in an event map, a few levels deep. */
    private static String findString(Object value, int depth) {
        if (!(value instanceof java.util.Map) || depth > 4) return null;
        java.util.Map<?, ?> map = (java.util.Map<?, ?>) value;
        for (String key : new String[]{"pageUrn", "pageKey"}) {
            Object found = map.get(key);
            if (found instanceof String) return (String) found;
        }
        for (Object child : map.values()) {
            String found = findString(child, depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    private static final java.util.Map<Class<?>, Boolean> profileViewEvents =
            new java.util.concurrent.ConcurrentHashMap<>();

    /**
     * Injection point, at the start of Tracker.send(event, pageInstance, trackingControl): every analytics event goes
     * through it. The ProfileViewEvent (the one with the viewee's member urn) is dropped with Anonymous profile
     * viewing, whichever screen sends it, since LinkedIn's new profile screen does not use
     * ProfileTrackingFeatureImpl.
     *
     * @return true to drop the event.
     */
    public static boolean dropTrackingEvent(Object event) {
        try {
            if (event == null) return false;
            Class<?> type = event.getClass();
            Boolean profileView = profileViewEvents.get(type);
            if (profileView == null) {
                profileView = hasField(type, "vieweeMemberUrn");
                profileViewEvents.put(type, profileView);
            }
            if (Settings.debug() && (profileView || SduiMediaDownload.resumedScreen().contains(".profile."))) {
                Settings.debugLog("tracking event: " + type.getSimpleName() + (profileView ? " (profile view)" : ""));
            }
            if (profileView && Settings.anonymousProfileViewing()) {
                Settings.debugLog("profile view event not sent");
                return true;
            }
        } catch (Throwable t) {
            Diagnostics.error("dropTrackingEvent failed", t);
        }
        return false;
    }

    private static boolean hasField(Class<?> type, String name) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                c.getDeclaredField(name);
                return true;
            } catch (NoSuchFieldException ignored) {
            }
        }
        return false;
    }

    /**
     * Injection point, at the start of ProfileTrackingFeatureImpl.sendCustomProfileViewEvent: the event behind
     * "Who viewed your profile". Skipping it doesn't send the visit, so it doesn't change your own privacy mode.
     */
    public static boolean skipProfileViewEvent() {
        boolean skip = Settings.anonymousProfileViewing();
        Settings.debugLog(skip ? "profile view event not sent"
                : "profile view event sent (Anonymous profile viewing is off)");
        return skip;
    }
}
