package com.medium.android.donkey.post;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.data.post.TargetPost;
import com.medium.android.donkey.main.MainActivity;
import defpackage.ak4;
import defpackage.cn5;
import defpackage.g76;
import defpackage.i03;
import defpackage.ka1;
import defpackage.li9;
import defpackage.mi9;
import defpackage.mz1;
import defpackage.py2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yj8;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/donkey/post/PostPageFragment2;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostPageFragment2 extends cn5 {
    public py2 u0;
    public i03 v0;
    public final vq6 w0;
    public final mi9 x0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0081\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0007\u001a\u00020\u00068\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0007\u0010 \u001a\u0004\b!\u0010\u0012¨\u0006\""}, d2 = {"Lcom/medium/android/donkey/post/PostPageFragment2$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/data/post/TargetPost;", "post", "Lcom/medium/android/core/models/ReadingContext;", "readingContext", "", "referrerSource", "<init>", "(Lcom/medium/android/data/post/TargetPost;Lcom/medium/android/core/models/ReadingContext;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/data/post/TargetPost;", "getPost", "()Lcom/medium/android/data/post/TargetPost;", "Lcom/medium/android/core/models/ReadingContext;", "getReadingContext", "()Lcom/medium/android/core/models/ReadingContext;", "Ljava/lang/String;", "getReferrerSource", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final TargetPost post;
        private final ReadingContext readingContext;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((TargetPost) parcel.readParcelable(BundleInfo.class.getClassLoader()), (ReadingContext) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(TargetPost targetPost, ReadingContext readingContext, String str) {
            super(str);
            targetPost.getClass();
            readingContext.getClass();
            str.getClass();
            this.post = targetPost;
            this.readingContext = readingContext;
            this.referrerSource = str;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.post, bundleInfo.post) && g76.L(this.readingContext, bundleInfo.readingContext) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final TargetPost getPost() {
            return this.post;
        }

        public final ReadingContext getReadingContext() {
            return this.readingContext;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + ((this.readingContext.hashCode() + (this.post.hashCode() * 31)) * 31);
        }

        public String toString() {
            TargetPost targetPost = this.post;
            ReadingContext readingContext = this.readingContext;
            String str = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(post=");
            sb.append(targetPost);
            sb.append(", readingContext=");
            sb.append(readingContext);
            sb.append(", referrerSource=");
            return ka1.v(sb, str, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.post, flags);
            dest.writeParcelable(this.readingContext, flags);
            dest.writeString(this.referrerSource);
        }
    }

    public PostPageFragment2() {
        super(3);
        this.w0 = vx0.d0(yw6.NONE, new yj8(10, this));
        this.x0 = new mi9(this);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new li9(this, 0), true, -2094553861));
        return composeView;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void H() {
        ((MainActivity) Q()).x(true);
        super.H();
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void I() {
        super.I();
        if (this.m0) {
            ak4.a().c("postId", ((BundleInfo) this.w0.getValue()).getPost().getId());
        }
        ((MainActivity) Q()).x(false);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment
    public final AbstractMediumFragment.BundleInfo Y() {
        return (BundleInfo) this.w0.getValue();
    }
}
