/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.HashMap;

/** Stands in for Telegram's send of a message, since the unpatched app never calls {@link LinkPreviewRules}. */
public final class LinkPreviewRulesForTests implements LinkPreviewRules.Params {
    public String text;
    public long peer = 42;
    public HashMap<String, String> extras;
    public String chosen;
    /** Where the preview was pointed, or null while the send was left alone. */
    public String pointed;

    public LinkPreviewRulesForTests(String text) {
        this.text = text;
    }

    @Override public String text() { return text; }
    @Override public long peer() { return peer; }
    @Override public HashMap<String, String> extras() { return extras; }
    @Override public String chosen() { return chosen; }
    @Override public void point(String address) { pointed = address; }

    /** Whether a message holding an x.com link would get its preview from another site. */
    public static boolean on() {
        LinkPreviewRulesForTests send = new LinkPreviewRulesForTests("look https://x.com/a/status/1");
        LinkPreviewRules.send(send);
        return send.pointed != null;
    }
}
