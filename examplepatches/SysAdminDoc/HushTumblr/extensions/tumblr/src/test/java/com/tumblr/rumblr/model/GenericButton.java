/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model;

import com.tumblr.rumblr.model.link.Link;

/**
 * Stands in for Tumblr's GenericButton, a lone button between items, with the getters the filter
 * reads by name down to the link a tap follows.
 */
public final class GenericButton implements Timelineable {
    private final Button button;

    public GenericButton(Link tap) {
        button = new Button(new Button.Links(tap));
    }

    public Button getButton() {
        return button;
    }

    @Override
    public String getId() {
        return "button";
    }

    @Override
    public TimelineObjectType getTimelineObjectType() {
        return TimelineObjectType.BUTTON;
    }

    public static final class Button {
        private final Links links;

        Button(Links links) {
            this.links = links;
        }

        public Links getLinks() {
            return links;
        }

        public static final class Links {
            private final Link tap;

            Links(Link tap) {
                this.tap = tap;
            }

            public Link getTap() {
                return tap;
            }
        }
    }
}
