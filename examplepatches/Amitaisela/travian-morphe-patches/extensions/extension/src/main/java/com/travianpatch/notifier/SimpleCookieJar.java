package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import okhttp3.Cookie;
import okhttp3.CookieJar;
import okhttp3.HttpUrl;

/**
 * Minimal in-memory cookie jar, keyed by host. Good enough for the small,
 * fixed set of hosts (identity/lobby/gameworld) Travian's client talks to.
 */
public class SimpleCookieJar implements CookieJar {
    private final Map<String, List<Cookie>> store = new HashMap<String, List<Cookie>>();

    @Override
    public synchronized void saveFromResponse(HttpUrl url, List<Cookie> cookies) {
        List<Cookie> existing = store.get(url.host());
        if (existing == null) {
            existing = new ArrayList<Cookie>();
            store.put(url.host(), existing);
        }
        for (Cookie fresh : cookies) {
            for (int i = existing.size() - 1; i >= 0; i--) {
                if (existing.get(i).name().equals(fresh.name())) {
                    existing.remove(i);
                }
            }
            existing.add(fresh);
        }
    }

    @Override
    public synchronized List<Cookie> loadForRequest(HttpUrl url) {
        List<Cookie> cookies = store.get(url.host());
        if (cookies == null) {
            return new ArrayList<Cookie>();
        }
        long now = System.currentTimeMillis();
        List<Cookie> result = new ArrayList<Cookie>();
        for (Cookie c : cookies) {
            if (c.expiresAt() > now) {
                result.add(c);
            }
        }
        return result;
    }
}
