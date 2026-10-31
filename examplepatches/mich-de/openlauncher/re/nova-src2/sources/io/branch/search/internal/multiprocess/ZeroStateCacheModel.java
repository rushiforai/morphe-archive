package io.branch.search.internal.multiprocess;

import a2.c;
import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.search.internal.C3309p1;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import y40.d0;
import y40.g;
import y40.i;

@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0015\b\u0087\b\u0018\u0000 H2\u00020\u0001:\u0001IBu\u0012\u0012\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u000e¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0016\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\u0016\u0010\u0017J\r\u0010\u0018\u001a\u00020\u0000¢\u0006\u0004\b\u0018\u0010\u0019J\u001c\u0010\u001a\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJ\u0012\u0010\u001f\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001dJ\u0012\u0010 \u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b \u0010\u001dJ\u0012\u0010!\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b!\u0010\u001dJ\u0012\u0010\"\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b&\u0010%J\u0010\u0010'\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b'\u0010%J\u008c\u0001\u0010(\u001a\u00020\u00002\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0010\u001a\u00020\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u000eHÆ\u0001¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b*\u0010#J\u0010\u0010+\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b+\u0010,J\u001a\u0010/\u001a\u00020\u000e2\b\u0010.\u001a\u0004\u0018\u00010-HÖ\u0003¢\u0006\u0004\b/\u00100J\u0010\u00101\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b1\u0010,J \u00106\u001a\u0002052\u0006\u00103\u001a\u0002022\u0006\u00104\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b6\u00107J\u0017\u00108\u001a\u00020\f2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002¢\u0006\u0004\b8\u00109J\u000f\u0010:\u001a\u00020\fH\u0002¢\u0006\u0004\b:\u0010#R#\u0010\u0005\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010;\u001a\u0004\b<\u0010\u001bR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010=\u001a\u0004\b>\u0010\u001dR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\b\u0010=\u001a\u0004\b?\u0010\u001dR\u0019\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\t\u0010=\u001a\u0004\b@\u0010\u001dR\u0019\u0010\n\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\n\u0010=\u001a\u0004\bA\u0010\u001dR\u0019\u0010\u000b\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u000b\u0010=\u001a\u0004\bB\u0010\u001dR\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u0010C\u001a\u0004\bD\u0010#R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010E\u001a\u0004\bF\u0010%R\u0017\u0010\u0010\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u0010\u0010E\u001a\u0004\b\u0010\u0010%R\u0017\u0010\u0011\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u0011\u0010E\u001a\u0004\bG\u0010%¨\u0006J"}, d2 = {"Lio/branch/search/internal/multiprocess/ZeroStateCacheModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/branch/search/ui/BranchContainer;", "Lio/branch/search/ui/BranchEntity;", "results", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "suggestedAppsRowCount", "suggestedAppsItemPerRow", "suggestedLinksRowCount", "suggestedInstallsRowCount", "suggestedInstallsItemPerRow", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "requestId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "forCacheUpdate", "isDeliveredToClient", "disableOrganicZeroState", "<init>", "(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;ZZZ)V", "Ly40/d0;", "request", "matchesRequest", "(Ly40/d0;)Z", "asClientDeliveredResult", "()Lio/branch/search/internal/multiprocess/ZeroStateCacheModel;", "component1", "()Ljava/util/List;", "component2", "()Ljava/lang/Integer;", "component3", "component4", "component5", "component6", "component7", "()Ljava/lang/String;", "component8", "()Z", "component9", "component10", "copy", "(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;ZZZ)Lio/branch/search/internal/multiprocess/ZeroStateCacheModel;", "toString", "hashCode", "()I", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "describeContents", "Landroid/os/Parcel;", "parcel", "flags", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "writeToParcel", "(Landroid/os/Parcel;I)V", "formatRequestConfig", "(Ly40/d0;)Ljava/lang/String;", "formatModelConfig", "Ljava/util/List;", "getResults", "Ljava/lang/Integer;", "getSuggestedAppsRowCount", "getSuggestedAppsItemPerRow", "getSuggestedLinksRowCount", "getSuggestedInstallsRowCount", "getSuggestedInstallsItemPerRow", "Ljava/lang/String;", "getRequestId", "Z", "getForCacheUpdate", "getDisableOrganicZeroState", k.O, "a", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class ZeroStateCacheModel implements Parcelable {

    @NotNull
    private static final String TAG = "ZeroStateCacheModel";
    private final boolean disableOrganicZeroState;
    private final boolean forCacheUpdate;
    private final boolean isDeliveredToClient;

    @Nullable
    private final String requestId;

    @NotNull
    private final List<BranchContainer<BranchEntity>> results;

    @Nullable
    private final Integer suggestedAppsItemPerRow;

    @Nullable
    private final Integer suggestedAppsRowCount;

    @Nullable
    private final Integer suggestedInstallsItemPerRow;

    @Nullable
    private final Integer suggestedInstallsRowCount;

    @Nullable
    private final Integer suggestedLinksRowCount;

    @NotNull
    public static final Parcelable.Creator<ZeroStateCacheModel> CREATOR = new b();

    public static final class b implements Parcelable.Creator<ZeroStateCacheModel> {
        @Override // android.os.Parcelable.Creator
        public final ZeroStateCacheModel createFromParcel(Parcel parcel) {
            boolean z11;
            Intrinsics.g(parcel, "parcel");
            int i5 = parcel.readInt();
            ArrayList arrayList = new ArrayList(i5);
            for (int i11 = 0; i11 != i5; i11++) {
                arrayList.add(parcel.readParcelable(ZeroStateCacheModel.class.getClassLoader()));
            }
            Integer numValueOf = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
            Integer numValueOf2 = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
            Integer numValueOf3 = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
            Integer numValueOf4 = parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt());
            Integer numValueOf5 = parcel.readInt() != 0 ? Integer.valueOf(parcel.readInt()) : null;
            String string = parcel.readString();
            boolean z12 = true;
            if (parcel.readInt() != 0) {
                z11 = true;
            } else {
                z11 = true;
                z12 = false;
            }
            return new ZeroStateCacheModel(arrayList, numValueOf, numValueOf2, numValueOf3, numValueOf4, numValueOf5, string, z12, parcel.readInt() != 0 ? z11 : false, parcel.readInt() != 0 ? z11 : false);
        }

        @Override // android.os.Parcelable.Creator
        public final ZeroStateCacheModel[] newArray(int i5) {
            return new ZeroStateCacheModel[i5];
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ZeroStateCacheModel(@NotNull List<? extends BranchContainer<BranchEntity>> results, @Nullable Integer num, @Nullable Integer num2, @Nullable Integer num3, @Nullable Integer num4, @Nullable Integer num5, @Nullable String str, boolean z11, boolean z12, boolean z13) {
        Intrinsics.g(results, "results");
        this.results = results;
        this.suggestedAppsRowCount = num;
        this.suggestedAppsItemPerRow = num2;
        this.suggestedLinksRowCount = num3;
        this.suggestedInstallsRowCount = num4;
        this.suggestedInstallsItemPerRow = num5;
        this.requestId = str;
        this.forCacheUpdate = z11;
        this.isDeliveredToClient = z12;
        this.disableOrganicZeroState = z13;
    }

    public static /* synthetic */ ZeroStateCacheModel copy$default(ZeroStateCacheModel zeroStateCacheModel, List list, Integer num, Integer num2, Integer num3, Integer num4, Integer num5, String str, boolean z11, boolean z12, boolean z13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            list = zeroStateCacheModel.results;
        }
        if ((i5 & 2) != 0) {
            num = zeroStateCacheModel.suggestedAppsRowCount;
        }
        if ((i5 & 4) != 0) {
            num2 = zeroStateCacheModel.suggestedAppsItemPerRow;
        }
        if ((i5 & 8) != 0) {
            num3 = zeroStateCacheModel.suggestedLinksRowCount;
        }
        if ((i5 & 16) != 0) {
            num4 = zeroStateCacheModel.suggestedInstallsRowCount;
        }
        if ((i5 & 32) != 0) {
            num5 = zeroStateCacheModel.suggestedInstallsItemPerRow;
        }
        if ((i5 & 64) != 0) {
            str = zeroStateCacheModel.requestId;
        }
        if ((i5 & 128) != 0) {
            z11 = zeroStateCacheModel.forCacheUpdate;
        }
        if ((i5 & 256) != 0) {
            z12 = zeroStateCacheModel.isDeliveredToClient;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            z13 = zeroStateCacheModel.disableOrganicZeroState;
        }
        boolean z14 = z12;
        boolean z15 = z13;
        String str2 = str;
        boolean z16 = z11;
        Integer num6 = num4;
        Integer num7 = num5;
        return zeroStateCacheModel.copy(list, num, num2, num3, num6, num7, str2, z16, z14, z15);
    }

    private final String formatModelConfig() {
        return this.suggestedAppsRowCount + '/' + this.suggestedAppsItemPerRow + '/' + this.suggestedLinksRowCount + '/' + this.suggestedInstallsRowCount + '/' + this.suggestedInstallsItemPerRow + "/organics=" + this.disableOrganicZeroState;
    }

    private final String formatRequestConfig(d0 request) {
        StringBuilder sb2 = new StringBuilder();
        g gVar = request.f96660b;
        sb2.append(gVar != null ? Integer.valueOf(gVar.f96669c) : null);
        sb2.append('/');
        g gVar2 = request.f96660b;
        sb2.append(gVar2 != null ? Integer.valueOf(gVar2.f96670d) : null);
        sb2.append('/');
        y40.k kVar = request.f96661c;
        sb2.append(kVar != null ? Integer.valueOf(kVar.f96674c) : null);
        sb2.append('/');
        i iVar = request.f96662d;
        sb2.append(iVar != null ? Integer.valueOf(iVar.f96671c) : null);
        sb2.append('/');
        i iVar2 = request.f96662d;
        sb2.append(iVar2 != null ? Integer.valueOf(iVar2.f96672d) : null);
        sb2.append("/organics=");
        sb2.append(request.f96664f);
        return sb2.toString();
    }

    @NotNull
    public final ZeroStateCacheModel asClientDeliveredResult() {
        return new ZeroStateCacheModel(this.results, this.suggestedAppsRowCount, this.suggestedAppsItemPerRow, this.suggestedLinksRowCount, this.suggestedInstallsRowCount, this.suggestedInstallsItemPerRow, this.requestId, this.forCacheUpdate, true, this.disableOrganicZeroState);
    }

    @NotNull
    public final List<BranchContainer<BranchEntity>> component1() {
        return this.results;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getDisableOrganicZeroState() {
        return this.disableOrganicZeroState;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final Integer getSuggestedAppsRowCount() {
        return this.suggestedAppsRowCount;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final Integer getSuggestedAppsItemPerRow() {
        return this.suggestedAppsItemPerRow;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Integer getSuggestedLinksRowCount() {
        return this.suggestedLinksRowCount;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final Integer getSuggestedInstallsRowCount() {
        return this.suggestedInstallsRowCount;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final Integer getSuggestedInstallsItemPerRow() {
        return this.suggestedInstallsItemPerRow;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final String getRequestId() {
        return this.requestId;
    }

    /* renamed from: component8, reason: from getter */
    public final boolean getForCacheUpdate() {
        return this.forCacheUpdate;
    }

    /* renamed from: component9, reason: from getter */
    public final boolean getIsDeliveredToClient() {
        return this.isDeliveredToClient;
    }

    @NotNull
    public final ZeroStateCacheModel copy(@NotNull List<? extends BranchContainer<BranchEntity>> results, @Nullable Integer suggestedAppsRowCount, @Nullable Integer suggestedAppsItemPerRow, @Nullable Integer suggestedLinksRowCount, @Nullable Integer suggestedInstallsRowCount, @Nullable Integer suggestedInstallsItemPerRow, @Nullable String requestId, boolean forCacheUpdate, boolean isDeliveredToClient, boolean disableOrganicZeroState) {
        Intrinsics.g(results, "results");
        return new ZeroStateCacheModel(results, suggestedAppsRowCount, suggestedAppsItemPerRow, suggestedLinksRowCount, suggestedInstallsRowCount, suggestedInstallsItemPerRow, requestId, forCacheUpdate, isDeliveredToClient, disableOrganicZeroState);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ZeroStateCacheModel)) {
            return false;
        }
        ZeroStateCacheModel zeroStateCacheModel = (ZeroStateCacheModel) other;
        return Intrinsics.b(this.results, zeroStateCacheModel.results) && Intrinsics.b(this.suggestedAppsRowCount, zeroStateCacheModel.suggestedAppsRowCount) && Intrinsics.b(this.suggestedAppsItemPerRow, zeroStateCacheModel.suggestedAppsItemPerRow) && Intrinsics.b(this.suggestedLinksRowCount, zeroStateCacheModel.suggestedLinksRowCount) && Intrinsics.b(this.suggestedInstallsRowCount, zeroStateCacheModel.suggestedInstallsRowCount) && Intrinsics.b(this.suggestedInstallsItemPerRow, zeroStateCacheModel.suggestedInstallsItemPerRow) && Intrinsics.b(this.requestId, zeroStateCacheModel.requestId) && this.forCacheUpdate == zeroStateCacheModel.forCacheUpdate && this.isDeliveredToClient == zeroStateCacheModel.isDeliveredToClient && this.disableOrganicZeroState == zeroStateCacheModel.disableOrganicZeroState;
    }

    public final boolean getDisableOrganicZeroState() {
        return this.disableOrganicZeroState;
    }

    public final boolean getForCacheUpdate() {
        return this.forCacheUpdate;
    }

    @Nullable
    public final String getRequestId() {
        return this.requestId;
    }

    @NotNull
    public final List<BranchContainer<BranchEntity>> getResults() {
        return this.results;
    }

    @Nullable
    public final Integer getSuggestedAppsItemPerRow() {
        return this.suggestedAppsItemPerRow;
    }

    @Nullable
    public final Integer getSuggestedAppsRowCount() {
        return this.suggestedAppsRowCount;
    }

    @Nullable
    public final Integer getSuggestedInstallsItemPerRow() {
        return this.suggestedInstallsItemPerRow;
    }

    @Nullable
    public final Integer getSuggestedInstallsRowCount() {
        return this.suggestedInstallsRowCount;
    }

    @Nullable
    public final Integer getSuggestedLinksRowCount() {
        return this.suggestedLinksRowCount;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int hashCode() {
        int iHashCode = this.results.hashCode() * 31;
        Integer num = this.suggestedAppsRowCount;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.suggestedAppsItemPerRow;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.suggestedLinksRowCount;
        int iHashCode4 = (iHashCode3 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Integer num4 = this.suggestedInstallsRowCount;
        int iHashCode5 = (iHashCode4 + (num4 == null ? 0 : num4.hashCode())) * 31;
        Integer num5 = this.suggestedInstallsItemPerRow;
        int iHashCode6 = (iHashCode5 + (num5 == null ? 0 : num5.hashCode())) * 31;
        String str = this.requestId;
        int iHashCode7 = (iHashCode6 + (str != null ? str.hashCode() : 0)) * 31;
        boolean z11 = this.forCacheUpdate;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode7 + i5) * 31;
        boolean z12 = this.isDeliveredToClient;
        int i12 = z12;
        if (z12 != 0) {
            i12 = 1;
        }
        int i13 = (i11 + i12) * 31;
        boolean z13 = this.disableOrganicZeroState;
        return i13 + (z13 ? 1 : z13 ? 1 : 0);
    }

    public final boolean isDeliveredToClient() {
        return this.isDeliveredToClient;
    }

    public final boolean matchesRequest(@NotNull d0 request) {
        Intrinsics.g(request, "request");
        g gVar = request.f96660b;
        boolean zB = Intrinsics.b(gVar != null ? Integer.valueOf(gVar.f96669c) : null, this.suggestedAppsRowCount);
        g gVar2 = request.f96660b;
        boolean zB2 = Intrinsics.b(gVar2 != null ? Integer.valueOf(gVar2.f96670d) : null, this.suggestedAppsItemPerRow);
        y40.k kVar = request.f96661c;
        boolean zB3 = Intrinsics.b(kVar != null ? Integer.valueOf(kVar.f96674c) : null, this.suggestedLinksRowCount);
        i iVar = request.f96662d;
        boolean zB4 = Intrinsics.b(iVar != null ? Integer.valueOf(iVar.f96671c) : null, this.suggestedInstallsRowCount);
        i iVar2 = request.f96662d;
        boolean zB5 = Intrinsics.b(iVar2 != null ? Integer.valueOf(iVar2.f96672d) : null, this.suggestedInstallsItemPerRow);
        boolean z11 = request.f96664f == this.disableOrganicZeroState;
        if (zB && zB2 && zB3 && zB4 && zB5 && z11) {
            return true;
        }
        if (!z11) {
            C3309p1.b(TAG, "Cache miss due to organics mismatch - request.disableOrganics=" + request.f96664f + ", cache.disableOrganics=" + this.disableOrganicZeroState);
        }
        C3309p1.b(TAG, "ZeroStateCacheModel doesn't match request - requestConfig=" + formatRequestConfig(request) + " modelConfig=" + formatModelConfig());
        return false;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ZeroStateCacheModel(results=");
        sb2.append(this.results);
        sb2.append(", suggestedAppsRowCount=");
        sb2.append(this.suggestedAppsRowCount);
        sb2.append(", suggestedAppsItemPerRow=");
        sb2.append(this.suggestedAppsItemPerRow);
        sb2.append(", suggestedLinksRowCount=");
        sb2.append(this.suggestedLinksRowCount);
        sb2.append(", suggestedInstallsRowCount=");
        sb2.append(this.suggestedInstallsRowCount);
        sb2.append(", suggestedInstallsItemPerRow=");
        sb2.append(this.suggestedInstallsItemPerRow);
        sb2.append(", requestId=");
        sb2.append(this.requestId);
        sb2.append(", forCacheUpdate=");
        sb2.append(this.forCacheUpdate);
        sb2.append(", isDeliveredToClient=");
        sb2.append(this.isDeliveredToClient);
        sb2.append(", disableOrganicZeroState=");
        return c.p(sb2, this.disableOrganicZeroState, ')');
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int flags) {
        Intrinsics.g(parcel, "out");
        Iterator itK = fq.c.k(this.results, parcel);
        while (itK.hasNext()) {
            parcel.writeParcelable((Parcelable) itK.next(), flags);
        }
        Integer num = this.suggestedAppsRowCount;
        if (num == null) {
            parcel.writeInt(0);
        } else {
            fq.c.q(parcel, 1, num);
        }
        Integer num2 = this.suggestedAppsItemPerRow;
        if (num2 == null) {
            parcel.writeInt(0);
        } else {
            fq.c.q(parcel, 1, num2);
        }
        Integer num3 = this.suggestedLinksRowCount;
        if (num3 == null) {
            parcel.writeInt(0);
        } else {
            fq.c.q(parcel, 1, num3);
        }
        Integer num4 = this.suggestedInstallsRowCount;
        if (num4 == null) {
            parcel.writeInt(0);
        } else {
            fq.c.q(parcel, 1, num4);
        }
        Integer num5 = this.suggestedInstallsItemPerRow;
        if (num5 == null) {
            parcel.writeInt(0);
        } else {
            fq.c.q(parcel, 1, num5);
        }
        parcel.writeString(this.requestId);
        parcel.writeInt(this.forCacheUpdate ? 1 : 0);
        parcel.writeInt(this.isDeliveredToClient ? 1 : 0);
        parcel.writeInt(this.disableOrganicZeroState ? 1 : 0);
    }

    public /* synthetic */ ZeroStateCacheModel(List list, Integer num, Integer num2, Integer num3, Integer num4, Integer num5, String str, boolean z11, boolean z12, boolean z13, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, num, num2, num3, num4, num5, str, (i5 & 128) != 0 ? false : z11, (i5 & 256) != 0 ? false : z12, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? false : z13);
    }
}
