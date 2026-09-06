package io.github.liongalahad.nuviotv.extension.shared.playback;

import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.DefaultDataSource;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Dispatch local URI schemes before delegating network streams to Nuvio's upstream factory. */
public final class UriDataSourceFactory {
    private UriDataSourceFactory() {}

    public static DataSource.Factory wrap(DataSource.Factory upstream) {
        return new DefaultDataSource.Factory(MorpheSettingsRuntime.applicationContext(), upstream);
    }
}
