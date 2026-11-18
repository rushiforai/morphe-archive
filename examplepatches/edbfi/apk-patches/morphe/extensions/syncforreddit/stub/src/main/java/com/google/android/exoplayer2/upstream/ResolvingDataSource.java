// SPDX-License-Identifier: AGPL-3.0-or-later
package com.google.android.exoplayer2.upstream;

import android.net.Uri;
import java.io.IOException;

/** Compile-only stand-in for ExoPlayer's resolving data source bundled in the app. */
public final class ResolvingDataSource {
    /** The app's copy has both methods abstract: implement both. */
    public interface Resolver {
        DataSpec resolveDataSpec(DataSpec dataSpec) throws IOException;

        Uri resolveReportedUri(Uri uri);
    }

    public static final class Factory implements DataSource.Factory {
        public Factory(DataSource.Factory upstreamFactory, Resolver resolver) {
            throw new UnsupportedOperationException("stub");
        }

        @Override
        public DataSource createDataSource() {
            throw new UnsupportedOperationException("stub");
        }
    }
}
