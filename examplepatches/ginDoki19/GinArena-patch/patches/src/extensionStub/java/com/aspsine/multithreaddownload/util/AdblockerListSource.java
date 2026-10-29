package com.aspsine.multithreaddownload.util;

public class AdblockerListSource {
    public static final String MANUAL_FILTER_SOURCE_UUID = "MFSU";

    public String getUuid() { throw new RuntimeException(); }
    public boolean isEnabled() { throw new RuntimeException(); }
    public boolean isOneDMSource() { throw new RuntimeException(); }
    public boolean isLocalFileExists() { throw new RuntimeException(); }
    public String getLocalPath(boolean fallback) { throw new RuntimeException(); }
    public int getTotalFilterCount() { throw new RuntimeException(); }
    public long getLocalSize() { throw new RuntimeException(); }
    public long getSourceSize() { throw new RuntimeException(); }
    public long getLocalLastUpdated() { throw new RuntimeException(); }

    public AdblockerListSource setLocalPath(String path) { throw new RuntimeException(); }
    public AdblockerListSource setLocalFileExists(boolean exists) { throw new RuntimeException(); }
    public AdblockerListSource setTotalFilterCount(int count) { throw new RuntimeException(); }
    public AdblockerListSource setLocalSize(long size) { throw new RuntimeException(); }
    public AdblockerListSource setSourceSize(long size) { throw new RuntimeException(); }
    public AdblockerListSource setLocalLastUpdated(long ts) { throw new RuntimeException(); }
    public AdblockerListSource setLastStatusText(String status) { throw new RuntimeException(); }
}
