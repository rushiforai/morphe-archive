package com.medium.android.admin.stagebranch;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import defpackage.g76;
import defpackage.gb6;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B'\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\u0014\b\u0001\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0015\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\u0014\b\u0003\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u001c\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\b\u0010\t\u001a\u0004\b\n\u0010\u000bR(\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u00058\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\f\u0010\t\u001a\u0004\b\r\u0010\u000e¨\u0006\u0018"}, d2 = {"Lcom/medium/android/admin/stagebranch/StageBranchData;", "", "timeToLive", "", "services", "", "<init>", "(Ljava/lang/String;Ljava/util/Map;)V", "getTimeToLive$annotations", "()V", "getTimeToLive", "()Ljava/lang/String;", "getServices$annotations", "getServices", "()Ljava/util/Map;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "admin_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class StageBranchData {
    public static final int $stable = 8;
    private final Map<String, String> services;
    private final String timeToLive;

    public StageBranchData(@gb6(name = "ttl") String str, @gb6(name = "tags") Map<String, String> map) {
        str.getClass();
        map.getClass();
        this.timeToLive = str;
        this.services = map;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ StageBranchData copy$default(StageBranchData stageBranchData, String str, Map map, int i, Object obj) {
        if ((i & 1) != 0) {
            str = stageBranchData.timeToLive;
        }
        if ((i & 2) != 0) {
            map = stageBranchData.services;
        }
        return stageBranchData.copy(str, map);
    }

    @gb6(name = "tags")
    public static /* synthetic */ void getServices$annotations() {
    }

    @gb6(name = "ttl")
    public static /* synthetic */ void getTimeToLive$annotations() {
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTimeToLive() {
        return this.timeToLive;
    }

    public final Map<String, String> component2() {
        return this.services;
    }

    public final StageBranchData copy(@gb6(name = "ttl") String timeToLive, @gb6(name = "tags") Map<String, String> services) {
        timeToLive.getClass();
        services.getClass();
        return new StageBranchData(timeToLive, services);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof StageBranchData)) {
            return false;
        }
        StageBranchData stageBranchData = (StageBranchData) other;
        return g76.L(this.timeToLive, stageBranchData.timeToLive) && g76.L(this.services, stageBranchData.services);
    }

    public final Map<String, String> getServices() {
        return this.services;
    }

    public final String getTimeToLive() {
        return this.timeToLive;
    }

    public int hashCode() {
        return this.services.hashCode() + (this.timeToLive.hashCode() * 31);
    }

    public String toString() {
        return "StageBranchData(timeToLive=" + this.timeToLive + kSWQKWZ.sTTInON + this.services + ")";
    }
}
