/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Application;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * Profile enhancements: showing a "Follows you" row when a user follows the signed-in account, and opening a user's
 * location in Maps when tapped.
 */
@SuppressWarnings("unused")
public final class ProfileExtras {
    private static final String TAG = "FakhProfile";

    private ProfileExtras() {
    }

    /** Whether the given {@code UserOrOrganization} model represents another user who follows the signed-in account. */
    public static boolean isFollowingViewer(Object user) {
        if (user == null) return false;
        String text = String.valueOf(user);
        return text.contains(", isFollowingViewer=true, isViewer=false,")
                && text.contains(", isOrganization=false,");
    }

    /** Whether to show the "Follows you" indicator on user profiles. */
    public static boolean followsYouEnabled() {
        return Features.on("fakh_follows_you");
    }

    /** Localized label for the "Follows you" row. */
    public static String followsYouText() {
        return I18n.tr("Follows you");
    }

    /** Drawable resource id for the "Follows you" icon. */
    @SuppressWarnings("DiscouragedApi")
    public static int followsYouIcon() {
        Application app = AppRuntime.application();
        return app.getResources().getIdentifier("ic_people_16", "drawable", app.getPackageName());
    }

    /** Whether tapping a user's location on their profile opens Maps. */
    public static boolean linkifyLocationEnabled() {
        return Features.on("fakh_linkify_location");
    }

    /**
     * Opens the given location string in Google Maps (or the user's maps/browser handler).
     *
     * @param location The location text from the user's profile.
     */
    public static void openLocation(String location) {
        if (location == null || location.trim().isEmpty()) return;
        Application app = AppRuntime.application();
        if (app == null) return;
        Uri uri = Uri.parse("https://www.google.com/maps/search/?api=1&query=" + Uri.encode(location.trim()));
        Intent intent = new Intent(Intent.ACTION_VIEW, uri).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            app.startActivity(intent);
        } catch (ActivityNotFoundException error) {
            Log.w(TAG, "Location link", error);
        }
    }
}
