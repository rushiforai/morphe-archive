package com.medium.android.core.fragments;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.medium.android.core.navigation.s;
import defpackage.ak4;
import defpackage.dm2;
import defpackage.g76;
import defpackage.ht2;
import defpackage.j15;
import defpackage.km4;
import defpackage.n1b;
import defpackage.p13;
import defpackage.s1b;
import defpackage.uld;
import defpackage.wld;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b'\u0018\u00002\u00020\u0001:\u0001\u0004B\t\b\u0016¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/core/fragments/AbstractMediumFragment;", "Lj15;", "<init>", "()V", "BundleInfo", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public abstract class AbstractMediumFragment extends j15 {
    public boolean m0;
    public p13 n0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0017\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u001f\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\r\u0010\u000eR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Landroid/os/Parcelable;", "", "referrerSource", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "Ljava/lang/String;", "getReferrerSource", "()Ljava/lang/String;", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static class BundleInfo implements Parcelable {
        public static final int $stable = 0;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        public BundleInfo(String str) {
            str.getClass();
            this.referrerSource = str;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        public String getReferrerSource() {
            return this.referrerSource;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
        }
    }

    @Override // defpackage.j15
    public void A(Bundle bundle) {
        super.A(bundle);
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onCreate"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onCreate");
        }
    }

    @Override // defpackage.j15
    public View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onCreateView"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onCreateView");
        }
        return null;
    }

    @Override // defpackage.j15
    public void C() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onDestroy"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onDestroy");
        }
        this.E = true;
    }

    @Override // defpackage.j15
    public void D() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onDestroyView"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onDestroyView");
        }
        this.E = true;
    }

    @Override // defpackage.j15
    public void H() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onPause"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onPause");
        }
        this.E = true;
    }

    @Override // defpackage.j15
    public void I() {
        this.E = true;
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onResume"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onResume");
        }
    }

    @Override // defpackage.j15
    public final void K() {
        this.E = true;
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onStart"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onStart");
        }
    }

    @Override // defpackage.j15
    public final void L() {
        uld uldVar = wld.a;
        Class<?> cls = getClass();
        s1b s1bVar = n1b.a;
        uldVar.j(km4.y(s1bVar.b(cls).j(), " onStop"), new Object[0]);
        if (this.m0) {
            ak4.a().b(s1bVar.b(getClass()).j() + " onStop");
        }
        this.E = true;
    }

    public BundleInfo Y() {
        return (BundleInfo) ((Parcelable) ht2.r0(dm2.F(this), "bundle_info", BundleInfo.class));
    }

    public final s Z() {
        p13 p13Var = this.n0;
        if (p13Var != null) {
            return p13Var;
        }
        g76.g0("router");
        throw null;
    }
}
