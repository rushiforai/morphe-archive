package com.google.firebase.crashlytics.internal.common;

/* loaded from: classes3.dex */
public class BuildIdInfo {
    private final String arch;
    private final String buildId;
    private final String libraryName;

    public BuildIdInfo(String str, String str2, String str3) {
        this.libraryName = str;
        this.arch = str2;
        this.buildId = str3;
    }

    public String getArch() {
        return this.arch;
    }

    public String getBuildId() {
        return this.buildId;
    }

    public String getLibraryName() {
        return this.libraryName;
    }
}
