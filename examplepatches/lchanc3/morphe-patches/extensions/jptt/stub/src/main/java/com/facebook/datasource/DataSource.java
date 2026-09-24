package com.facebook.datasource;

import java.util.Map;
import java.util.concurrent.Executor;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public interface DataSource {
    boolean close();

    Map getExtras();

    Throwable getFailureCause();

    float getProgress();

    Object getResult();

    boolean hasFailed();

    boolean hasMultipleResults();

    boolean hasResult();

    boolean isFinished();

    void subscribe(DataSubscriber dataSubscriber, Executor executor);
}
