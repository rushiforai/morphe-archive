/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import app.fakh.extension.shared.Features;

/**
 * The sort of an issue or pull request filter: the app's default, and the one it reads back from its database. The app
 * saves the sort of every list it opens, Newest included, so without the latter a list opened earlier keeps Newest.
 */
@SuppressWarnings("unused")
public final class DefaultSort {
    private DefaultSort() {
    }

    /**
     * Turns a Newest sort into Recently updated while the switch is on. Any other sort stays.
     *
     * @param sort A constant of the app's sort enum.
     * @return Recently updated for Newest, otherwise {@code sort} itself.
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object saved(Object sort) {
        if (Features.on("fakh_recently_updated") && sort instanceof Enum && "CreatedDescending".equals(((Enum<?>) sort).name())) {
            return Enum.valueOf((Class) ((Enum<?>) sort).getDeclaringClass(), "UpdatedDescending");
        }
        return sort;
    }
}
