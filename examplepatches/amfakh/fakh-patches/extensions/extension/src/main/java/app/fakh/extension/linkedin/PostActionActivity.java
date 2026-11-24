/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;

/**
 * The screen LinkedIn opens when an item Fakh Patches added to a post menu is tapped. It has no layout: it runs the
 * action named by the item's {@code fakhpatches://post/...} link and closes at once.
 */
@SuppressWarnings("unused")
public final class PostActionActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Uri link = getIntent().getData();
        try {
            if (link != null && PostMenu.SCHEME.equals(link.getScheme()) && PostMenu.HOST.equals(link.getHost())) {
                PostMenu.perform(this, link);
            }
        } catch (Throwable t) {
            Diagnostics.error("post action failed", t);
        } finally {
            finish();
            overridePendingTransition(0, 0);
        }
    }
}
