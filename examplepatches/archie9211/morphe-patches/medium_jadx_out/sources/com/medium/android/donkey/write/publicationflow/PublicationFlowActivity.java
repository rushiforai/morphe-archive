package com.medium.android.donkey.write.publicationflow;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.postpublishing.ui.PublicationFlowFragment;
import com.medium.reader.R;
import defpackage.d3d;
import defpackage.fo3;
import defpackage.fy3;
import defpackage.g01;
import defpackage.g76;
import defpackage.hy2;
import defpackage.ka1;
import defpackage.km0;
import defpackage.m6d;
import defpackage.wgd;
import defpackage.wld;
import defpackage.xm5;
import defpackage.y30;
import defpackage.ygf;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class PublicationFlowActivity extends xm5 {
    public static final /* synthetic */ int p = 0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0013\u0010\nJ\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u0012R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\u0012R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0019\u001a\u0004\b\u001c\u0010\u0012¨\u0006\u001d"}, d2 = {"Lcom/medium/android/donkey/write/publicationflow/PublicationFlowActivity$BundleInfo;", "Landroid/os/Parcelable;", "", "postId", "referrerSource", "destination", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getReferrerSource", "getDestination", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo implements Parcelable {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String destination;
        private final String postId;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        public BundleInfo(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.postId = str;
            this.referrerSource = str2;
            this.destination = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.postId, bundleInfo.postId) && g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.destination, bundleInfo.destination);
        }

        public final String getDestination() {
            return this.destination;
        }

        public final String getPostId() {
            return this.postId;
        }

        public final String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            int iO = wgd.o(this.postId.hashCode() * 31, 31, this.referrerSource);
            String str = this.destination;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public String toString() {
            String str = this.postId;
            String str2 = this.referrerSource;
            return ka1.v(y30.u("BundleInfo(postId=", str, ", referrerSource=", str2, ", destination="), this.destination, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeString(this.referrerSource);
            dest.writeString(this.destination);
        }
    }

    public PublicationFlowActivity() {
        super(2);
    }

    @Override // defpackage.xm5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        fo3.a(this, new m6d(0, 0, new d3d(4)), 1);
        super.onCreate(bundle);
        setContentView(R.layout.activity_publication_flow);
        if (bundle == null) {
            String stringExtra = getIntent().getStringExtra("POST_ID_KEY");
            String stringExtra2 = getIntent().getStringExtra("REFERRER_SOURCE_KEY");
            if (stringExtra == null || stringExtra2 == null) {
                wld.a.e(null, "Missing postId or referrerSource in PublicationFlowActivity.", new Object[0]);
                hy2 hy2Var = g01.y;
                if (hy2Var != null) {
                    hy2Var.a("Missing postId or referrerSource in PublicationFlowActivity.", null, fy3.a);
                }
                finish();
                return;
            }
            String stringExtra3 = getIntent().getStringExtra("DESTINATION_KEY");
            km0 km0Var = new km0(m());
            PublicationFlowFragment publicationFlowFragment = new PublicationFlowFragment();
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("bundle_info", new PublicationFlowFragment.BundleInfo(stringExtra, stringExtra2, stringExtra3));
            publicationFlowFragment.V(bundle2);
            km0Var.e(R.id.container, publicationFlowFragment, null, 2);
            if (km0Var.g) {
                ygf.f("This transaction is already being added to the back stack");
            } else {
                km0Var.h = false;
                km0Var.q.z(km0Var, false);
            }
        }
    }
}
