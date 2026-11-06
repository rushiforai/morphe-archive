/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/** A bounded private document. It is never registered as a setting or included in a report. */
final class RootPostMuteStore {
    static final int MAX_ROOTS = 500;
    static final int MAX_ACCOUNTS = 8;
    static final int MAX_BYTES = 256 * 1024;
    private final LinkedHashMap<String, Set<String>> accounts;

    RootPostMuteStore() { accounts = new LinkedHashMap<>(); }
    private RootPostMuteStore(LinkedHashMap<String, Set<String>> accounts) { this.accounts = accounts; }

    static final String REBLOGS = "reblogs:", ORIGINALS = "originals:";

    static boolean validRoot(String id) { return id != null && id.matches("[1-9][0-9]{0,29}"); }
    /** One blog's reblogs or its originals. Blog names are stored lowercased, as Tumblr sends them. */
    static boolean validBlogRule(String entry) { return entry != null && BLOG_RULE.matcher(entry).matches(); }
    private static final Pattern BLOG_RULE = Pattern.compile("(reblogs|originals):[a-z0-9-]{1,64}");
    /** Whether [entries] hold a blog rule, read without a pattern since every dashboard page asks. */
    static boolean anyBlogRule(Set<String> entries) {
        for (String entry : entries) if (entry.startsWith(REBLOGS) || entry.startsWith(ORIGINALS)) return true;
        return false;
    }
    /** A list entry is a post's root ID or a blog rule. The colon keeps the two apart. */
    static boolean validEntry(String entry) { return validRoot(entry) || validBlogRule(entry); }
    static boolean reblogRule(String rule) { return rule.startsWith(REBLOGS); }
    static String ruleBlog(String rule) { return rule.substring(rule.indexOf(':') + 1); }
    private static boolean validAccount(String key) { return key != null && key.matches("[0-9a-f]{64}"); }

    Set<String> roots(String account) {
        Set<String> roots = accounts.get(account);
        return roots == null ? Collections.emptySet() : roots;
    }

    RootPostMuteStore withRoots(String account, Set<String> roots) {
        if (!validAccount(account) || roots.size() > MAX_ROOTS || !roots.stream().allMatch(RootPostMuteStore::validEntry)) {
            throw new IllegalArgumentException("Invalid private mute document");
        }
        LinkedHashMap<String, Set<String>> next = new LinkedHashMap<>(accounts);
        next.remove(account);
        if (!roots.isEmpty()) next.put(account, Collections.unmodifiableSet(new LinkedHashSet<>(roots)));
        while (next.size() > MAX_ACCOUNTS) next.remove(next.keySet().iterator().next());
        return new RootPostMuteStore(next);
    }

    String encode() throws JSONException {
        JSONArray entries = new JSONArray();
        for (Map.Entry<String, Set<String>> account : accounts.entrySet()) {
            JSONArray roots = new JSONArray();
            for (String root : account.getValue()) roots.put(root);
            entries.put(new JSONObject().put("account", account.getKey()).put("roots", roots));
        }
        return new JSONObject().put("version", 1).put("accounts", entries).toString();
    }

    static RootPostMuteStore decode(String text) throws JSONException {
        JSONObject document = new JSONObject(text);
        if (document.length() != 2 || document.getInt("version") != 1) throw invalid();
        JSONArray entries = document.getJSONArray("accounts");
        if (entries.length() > MAX_ACCOUNTS) throw invalid();
        LinkedHashMap<String, Set<String>> accounts = new LinkedHashMap<>();
        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.getJSONObject(i);
            Object key = entry.get("account");
            if (entry.length() != 2 || !(key instanceof String) || !validAccount((String) key) || accounts.containsKey(key)) throw invalid();
            JSONArray ids = entry.getJSONArray("roots");
            if (ids.length() > MAX_ROOTS) throw invalid();
            LinkedHashSet<String> roots = new LinkedHashSet<>();
            for (int j = 0; j < ids.length(); j++) {
                Object id = ids.get(j);
                if (!(id instanceof String) || !validEntry((String) id) || !roots.add((String) id)) throw invalid();
            }
            accounts.put((String) key, Collections.unmodifiableSet(roots));
        }
        return new RootPostMuteStore(accounts);
    }

    private static JSONException invalid() { return new JSONException("Invalid private mute document"); }
}
