/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import java.util.List;

import app.fakh.extension.shared.Features;

/** The labels drawn under the title of an issue or pull request. */
@SuppressWarnings("unused")
public final class HeaderLabels {
    private HeaderLabels() {
    }

    /**
     * The labels the header draws.
     *
     * @param labels The labels of the issue or pull request.
     * @return Those labels, or null with the switch off, which draws no row.
     */
    public static List<?> labels(List<?> labels) {
        return Features.on("fakh_header_labels") ? labels : null;
    }
}
