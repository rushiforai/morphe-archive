// SPDX-License-Identifier: AGPL-3.0-or-later
package com.google.android.exoplayer2.upstream;

/** Compile-only stand-in for ExoPlayer's data source bundled in the app. */
public interface DataSource {
    interface Factory {
        DataSource createDataSource();
    }
}
