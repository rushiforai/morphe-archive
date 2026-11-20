/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.settings.preference;

import android.content.Context;
import android.util.AttributeSet;

import org.apache.commons.lang3.ArrayUtils;

import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.MwebSiteSession;

/** Excludes Mobile Web from the picker when the isolated WebView or its native bridge is unavailable. */
@SuppressWarnings("unused")
public final class SpoofClientListPreference extends SortedListPreference {
    public static final String SETTING_KEY = "morphe_spoof_video_streams_client_type";

    public SpoofClientListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        Choices<CharSequence> choices = filter(getEntries(), getEntryValues());
        setEntries(choices.entries());
        setEntryValues(choices.values());
    }

    public record Choices<T extends CharSequence>(T[] entries, T[] values) {
    }

    public static <T extends CharSequence> Choices<T> filter(T[] entries, T[] values) {
        int index = ArrayUtils.indexOf(values, ClientType.MWEB.name());
        if (index >= 0 && !MwebSiteSession.isSupported()) {
            return new Choices<>(ArrayUtils.remove(entries, index), ArrayUtils.remove(values, index));
        }
        return new Choices<>(entries, values);
    }
}
