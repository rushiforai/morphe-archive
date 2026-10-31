package com.bytedance.sdk.component.fby.zb;

/* loaded from: classes2.dex */
public abstract class sya implements Comparable<sya>, Runnable {
    public static final int EIGHTH_PRIORITY = 8;
    public static final int FIFTH_PRIORITY = 5;
    public static final int FOURTH_PRIORITY = 4;
    public static final int MAX_PRIORITY = 10;
    public static final int MIN_PRIORITY = 1;
    public static final int NINTH_PRIORITY = 9;
    public static final int SECOND_PRIORITY = 2;
    public static final int SEVENTH_PRIORITY = 7;
    public static final int SIXTH_PRIORITY = 6;
    public static final int THIRD_PRIORITY = 3;

    /* renamed from: dj, reason: collision with root package name */
    private long f23753dj;

    /* renamed from: lt, reason: collision with root package name */
    private long f23754lt;
    private long lud;
    private Runnable sya;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f23755zb;

    public sya(String str) {
        this.ycx = 5;
        this.f23755zb = str;
    }

    public long getAfterTimestamp() {
        return this.f23754lt;
    }

    public long getBeforeTimestamp() {
        return this.lud;
    }

    public String getName() {
        return this.f23755zb;
    }

    public int getPriority() {
        return this.ycx;
    }

    public long getRunTime() {
        return this.f23754lt - this.lud;
    }

    public long getSubmitTimestamp() {
        return this.f23753dj;
    }

    public Runnable getTarget() {
        return this.sya;
    }

    public long getWaitTime() {
        return this.lud - this.f23753dj;
    }

    public void setAfterTimestamp(long j11) {
        this.f23754lt = j11;
    }

    public void setBeforeTimestamp(long j11) {
        this.lud = j11;
    }

    public void setPriority(int i5) {
        this.ycx = i5;
    }

    public void setSubmitTimestamp(long j11) {
        this.f23753dj = j11;
    }

    public void setTarget(Runnable runnable) {
        this.sya = runnable;
    }

    @Override // java.lang.Comparable
    public int compareTo(sya syaVar) {
        if (getPriority() < syaVar.getPriority()) {
            return 1;
        }
        return getPriority() >= syaVar.getPriority() ? -1 : 0;
    }

    public sya(String str, int i5) {
        this.ycx = i5;
        this.f23755zb = str;
    }

    public sya(int i5, String str, Runnable runnable) {
        this.ycx = i5;
        this.f23755zb = str;
        this.sya = runnable;
    }

    public sya(String str, Runnable runnable) {
        this.ycx = 5;
        this.f23755zb = str;
        this.sya = runnable;
    }
}
