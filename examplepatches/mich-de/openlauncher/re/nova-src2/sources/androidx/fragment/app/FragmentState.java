package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
final class FragmentState implements Parcelable {
    public static final Parcelable.Creator<FragmentState> CREATOR = new b(4);

    /* renamed from: a, reason: collision with root package name */
    public final String f14466a;

    /* renamed from: b, reason: collision with root package name */
    public final String f14467b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f14468c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f14469d;

    /* renamed from: e, reason: collision with root package name */
    public final int f14470e;

    /* renamed from: f, reason: collision with root package name */
    public final int f14471f;

    /* renamed from: g, reason: collision with root package name */
    public final String f14472g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f14473h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f14474i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f14475j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f14476k;

    /* renamed from: l, reason: collision with root package name */
    public final int f14477l;

    /* renamed from: m, reason: collision with root package name */
    public final String f14478m;
    public final int n;
    public final boolean o;

    public FragmentState(h0 h0Var) {
        this.f14466a = h0Var.getClass().getName();
        this.f14467b = h0Var.mWho;
        this.f14468c = h0Var.mFromLayout;
        this.f14469d = h0Var.mInDynamicContainer;
        this.f14470e = h0Var.mFragmentId;
        this.f14471f = h0Var.mContainerId;
        this.f14472g = h0Var.mTag;
        this.f14473h = h0Var.mRetainInstance;
        this.f14474i = h0Var.mRemoving;
        this.f14475j = h0Var.mDetached;
        this.f14476k = h0Var.mHidden;
        this.f14477l = h0Var.mMaxState.ordinal();
        this.f14478m = h0Var.mTargetWho;
        this.n = h0Var.mTargetRequestCode;
        this.o = h0Var.mUserVisibleHint;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder(128);
        sb2.append("FragmentState{");
        sb2.append(this.f14466a);
        sb2.append(" (");
        sb2.append(this.f14467b);
        sb2.append(")}:");
        if (this.f14468c) {
            sb2.append(" fromLayout");
        }
        if (this.f14469d) {
            sb2.append(" dynamicContainer");
        }
        int i5 = this.f14471f;
        if (i5 != 0) {
            sb2.append(" id=0x");
            sb2.append(Integer.toHexString(i5));
        }
        String str = this.f14472g;
        if (str != null && !str.isEmpty()) {
            sb2.append(" tag=");
            sb2.append(str);
        }
        if (this.f14473h) {
            sb2.append(" retainInstance");
        }
        if (this.f14474i) {
            sb2.append(" removing");
        }
        if (this.f14475j) {
            sb2.append(" detached");
        }
        if (this.f14476k) {
            sb2.append(" hidden");
        }
        String str2 = this.f14478m;
        if (str2 != null) {
            sb2.append(" targetWho=");
            sb2.append(str2);
            sb2.append(" targetRequestCode=");
            sb2.append(this.n);
        }
        if (this.o) {
            sb2.append(" userVisibleHint");
        }
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f14466a);
        parcel.writeString(this.f14467b);
        parcel.writeInt(this.f14468c ? 1 : 0);
        parcel.writeInt(this.f14469d ? 1 : 0);
        parcel.writeInt(this.f14470e);
        parcel.writeInt(this.f14471f);
        parcel.writeString(this.f14472g);
        parcel.writeInt(this.f14473h ? 1 : 0);
        parcel.writeInt(this.f14474i ? 1 : 0);
        parcel.writeInt(this.f14475j ? 1 : 0);
        parcel.writeInt(this.f14476k ? 1 : 0);
        parcel.writeInt(this.f14477l);
        parcel.writeString(this.f14478m);
        parcel.writeInt(this.n);
        parcel.writeInt(this.o ? 1 : 0);
    }

    public FragmentState(Parcel parcel) {
        this.f14466a = parcel.readString();
        this.f14467b = parcel.readString();
        this.f14468c = parcel.readInt() != 0;
        this.f14469d = parcel.readInt() != 0;
        this.f14470e = parcel.readInt();
        this.f14471f = parcel.readInt();
        this.f14472g = parcel.readString();
        this.f14473h = parcel.readInt() != 0;
        this.f14474i = parcel.readInt() != 0;
        this.f14475j = parcel.readInt() != 0;
        this.f14476k = parcel.readInt() != 0;
        this.f14477l = parcel.readInt();
        this.f14478m = parcel.readString();
        this.n = parcel.readInt();
        this.o = parcel.readInt() != 0;
    }
}
