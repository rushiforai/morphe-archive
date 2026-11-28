/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

/**
 * Click callback for a user's profile location row. The patch adds the obfuscated {@code Function0} interface and its
 * {@code invoke} method at patch time.
 */
@SuppressWarnings("unused")
public final class FakhLocationClick {
    public final String location;

    public FakhLocationClick(String location) {
        this.location = location;
    }
}
