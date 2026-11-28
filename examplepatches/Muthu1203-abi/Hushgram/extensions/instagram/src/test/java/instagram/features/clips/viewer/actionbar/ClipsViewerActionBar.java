/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package instagram.features.clips.viewer.actionbar;

import android.content.Context;
import android.widget.RelativeLayout;

import com.instagram.clips.intf.ClipsViewerSource;

/**
 * Stands in for the Reels viewer's top bar in tests. The extension finds it by this class name, as
 * it does Instagram's, and reads where its viewer was opened from out of its config objects. On
 * Instagram 450 the bar holds two, each with one source, bound after the bar is inflated, under
 * names each build picks for itself.
 */
public final class ClipsViewerActionBar extends RelativeLayout {
    /** Shaped like the bar's config: a few fields, one of them the viewer's source. */
    public static final class Config {
        public final boolean centered;
        public final ClipsViewerSource A05;
        public final String title;

        public Config(ClipsViewerSource source) {
            this.centered = true;
            this.A05 = source;
            this.title = "Reels";
        }
    }

    /** Shaped like the bar's second config. */
    public static final class State {
        public final ClipsViewerSource A02;
        public final int padding;

        public State(ClipsViewerSource source) {
            this.A02 = source;
            this.padding = 4;
        }
    }

    public Config A01;
    public State A02;
    public final java.util.Map<Object, Object> A0A = new java.util.LinkedHashMap<>();

    public ClipsViewerActionBar(Context context) {
        super(context);
    }

    /** Binds the bar to where its viewer was opened from, as Instagram does after inflating it. */
    public ClipsViewerActionBar bind(ClipsViewerSource source) {
        A01 = new Config(source);
        A02 = new State(source);
        return this;
    }
}
