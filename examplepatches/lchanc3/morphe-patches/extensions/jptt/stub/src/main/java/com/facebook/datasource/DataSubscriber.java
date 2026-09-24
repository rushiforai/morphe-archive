package com.facebook.datasource;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public interface DataSubscriber {
    void onCancellation(DataSource dataSource);

    void onFailure(DataSource dataSource);

    void onNewResult(DataSource dataSource);

    void onProgressUpdate(DataSource dataSource);
}
