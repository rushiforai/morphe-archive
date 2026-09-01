package com.medium.android.unsplash.data;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.b09;
import defpackage.ev6;
import defpackage.g76;
import defpackage.gb6;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\b\b\u0001\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0002\u0012\u000e\b\u0001\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\b\u0010\tJ\r\u0010\n\u001a\u00020\u0002¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u000bJ\u0010\u0010\u0013\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u000bJ\u0016\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J4\u0010\u0016\u001a\u00020\u00002\b\b\u0003\u0010\u0003\u001a\u00020\u00022\b\b\u0003\u0010\u0004\u001a\u00020\u00022\u000e\b\u0003\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0019\u001a\u00020\u0018HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001b\u0010\u000bJ\u001a\u0010\u001f\u001a\u00020\u001e2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001cHÖ\u0003¢\u0006\u0004\b\u001f\u0010 R \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0003\u0010!\u0012\u0004\b#\u0010$\u001a\u0004\b\"\u0010\u000bR \u0010\u0004\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0004\u0010!\u0012\u0004\b&\u0010$\u001a\u0004\b%\u0010\u000bR&\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0007\u0010'\u0012\u0004\b)\u0010$\u001a\u0004\b(\u0010\u0015¨\u0006*"}, d2 = {"Lcom/medium/android/unsplash/data/SearchResponse;", "Landroid/os/Parcelable;", "", "total", "totalPages", "", "Lcom/medium/android/unsplash/data/UnsplashPhoto;", "results", "<init>", "(IILjava/util/List;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "component2", "component3", "()Ljava/util/List;", "copy", "(IILjava/util/List;)Lcom/medium/android/unsplash/data/SearchResponse;", "", "toString", "()Ljava/lang/String;", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "I", "getTotal", "getTotal$annotations", "()V", "getTotalPages", "getTotalPages$annotations", "Ljava/util/List;", "getResults", "getResults$annotations", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SearchResponse implements Parcelable {
    public static final int $stable = 8;
    public static final Parcelable.Creator<SearchResponse> CREATOR = new Creator();
    private final List<UnsplashPhoto> results;
    private final int total;
    private final int totalPages;

    public SearchResponse(@gb6(name = "total") int i, @gb6(name = "total_pages") int i2, @gb6(name = "results") List<UnsplashPhoto> list) {
        list.getClass();
        this.total = i;
        this.totalPages = i2;
        this.results = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ SearchResponse copy$default(SearchResponse searchResponse, int i, int i2, List list, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = searchResponse.total;
        }
        if ((i3 & 2) != 0) {
            i2 = searchResponse.totalPages;
        }
        if ((i3 & 4) != 0) {
            list = searchResponse.results;
        }
        return searchResponse.copy(i, i2, list);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getTotal() {
        return this.total;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getTotalPages() {
        return this.totalPages;
    }

    public final List<UnsplashPhoto> component3() {
        return this.results;
    }

    public final SearchResponse copy(@gb6(name = "total") int total, @gb6(name = "total_pages") int totalPages, @gb6(name = "results") List<UnsplashPhoto> results) {
        results.getClass();
        return new SearchResponse(total, totalPages, results);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SearchResponse)) {
            return false;
        }
        SearchResponse searchResponse = (SearchResponse) other;
        return this.total == searchResponse.total && this.totalPages == searchResponse.totalPages && g76.L(this.results, searchResponse.results);
    }

    public final List<UnsplashPhoto> getResults() {
        return this.results;
    }

    public final int getTotal() {
        return this.total;
    }

    public final int getTotalPages() {
        return this.totalPages;
    }

    public final int hashCode() {
        return this.results.hashCode() + (((this.total * 31) + this.totalPages) * 31);
    }

    public final String toString() {
        int i = this.total;
        int i2 = this.totalPages;
        return b09.B(ev6.B(i, i2, "SearchResponse(total=", ", totalPages=", ", results="), this.results, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeInt(this.total);
        dest.writeInt(this.totalPages);
        List<UnsplashPhoto> list = this.results;
        dest.writeInt(list.size());
        Iterator<UnsplashPhoto> it2 = list.iterator();
        while (it2.hasNext()) {
            it2.next().writeToParcel(dest, flags);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements Parcelable.Creator<SearchResponse> {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final SearchResponse createFromParcel(Parcel parcel) {
            parcel.getClass();
            int i = parcel.readInt();
            int i2 = parcel.readInt();
            int i3 = parcel.readInt();
            ArrayList arrayList = new ArrayList(i3);
            for (int i4 = 0; i4 != i3; i4++) {
                arrayList.add(UnsplashPhoto.CREATOR.createFromParcel(parcel));
            }
            return new SearchResponse(i, i2, arrayList);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public final SearchResponse[] newArray(int i) {
            return new SearchResponse[i];
        }

        @Override // android.os.Parcelable.Creator
        public final SearchResponse[] newArray(int i) {
            return new SearchResponse[i];
        }
    }

    @gb6(name = "results")
    public static /* synthetic */ void getResults$annotations() {
    }

    @gb6(name = "total")
    public static /* synthetic */ void getTotal$annotations() {
    }

    @gb6(name = "total_pages")
    public static /* synthetic */ void getTotalPages$annotations() {
    }
}
