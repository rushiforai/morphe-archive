/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.patches;

import androidx.annotation.Nullable;

import com.google.android.libraries.youtube.media.interfaces.HttpHeader;

import java.util.ArrayList;

/** Additional media request operations, linked only if the native header shape is recognized. */
public interface WebMediaRequest extends MediaHttpRequest {
    @Nullable
    ArrayList<HttpHeader> patch_getHeaders();

    MediaHttpRequest patch_withBodyAndHeaders(byte[] body, ArrayList<HttpHeader> headers);
}
