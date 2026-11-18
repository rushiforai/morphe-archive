// SPDX-License-Identifier: AGPL-3.0-or-later
package com.google.android.exoplayer2.upstream;

import android.net.Uri;

/** Compile-only stand-in for ExoPlayer's data spec bundled in the app. */
public final class DataSpec {
    public final Uri uri = null;

    public DataSpec withUri(Uri uri) {
        throw new UnsupportedOperationException("stub");
    }
}
