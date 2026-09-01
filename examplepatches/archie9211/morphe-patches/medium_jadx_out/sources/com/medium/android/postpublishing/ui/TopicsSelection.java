package com.medium.android.postpublishing.ui;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.ka1;
import defpackage.tfd;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0081\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\r\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\u0007¢\u0006\u0004\b\u000e\u0010\u000fJ\u0016\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J \u0010\u0012\u001a\u00020\u00002\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u0017\u0010\tJ\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u001d\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001e\u0010\u0011¨\u0006\u001f"}, d2 = {"Lcom/medium/android/postpublishing/ui/TopicsSelection;", "Landroid/os/Parcelable;", "", "Lcom/medium/android/postpublishing/ui/TopicData;", "topics", "<init>", "(Ljava/util/List;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/util/List;", "copy", "(Ljava/util/List;)Lcom/medium/android/postpublishing/ui/TopicsSelection;", "", "toString", "()Ljava/lang/String;", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/util/List;", "getTopics", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TopicsSelection implements Parcelable {
    public static final int $stable = 8;
    public static final Parcelable.Creator<TopicsSelection> CREATOR = new tfd(2);
    private final List<TopicData> topics;

    public TopicsSelection(List<TopicData> list) {
        list.getClass();
        this.topics = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ TopicsSelection copy$default(TopicsSelection topicsSelection, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            list = topicsSelection.topics;
        }
        return topicsSelection.copy(list);
    }

    public final List<TopicData> component1() {
        return this.topics;
    }

    public final TopicsSelection copy(List<TopicData> topics) {
        topics.getClass();
        return new TopicsSelection(topics);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof TopicsSelection) && g76.L(this.topics, ((TopicsSelection) other).topics);
    }

    public final List<TopicData> getTopics() {
        return this.topics;
    }

    public int hashCode() {
        return this.topics.hashCode();
    }

    public String toString() {
        return ka1.t("TopicsSelection(topics=", ")", this.topics);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        List<TopicData> list = this.topics;
        dest.writeInt(list.size());
        Iterator<TopicData> it2 = list.iterator();
        while (it2.hasNext()) {
            it2.next().writeToParcel(dest, flags);
        }
    }
}
