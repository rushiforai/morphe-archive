package com.medium.android.donkey.susi;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import defpackage.a3;
import defpackage.a4d;
import defpackage.bx6;
import defpackage.doc;
import defpackage.ev6;
import defpackage.g76;
import defpackage.iq1;
import defpackage.j3d;
import defpackage.lig;
import defpackage.n1b;
import defpackage.o41;
import defpackage.p13;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.xm5;
import defpackage.yw6;
import defpackage.zzb;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class SusiActivity extends xm5 {
    public static final /* synthetic */ int v = 0;
    public p13 p;
    public String q;
    public lig r;
    public o41 s;
    public final vq6 t;
    public final iq1 u;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0001\u0002\u0082\u0001\u0001\u0003¨\u0006\u0004À\u0006\u0003"}, d2 = {"Lcom/medium/android/donkey/susi/SusiActivity$RouteTo;", "Landroid/os/Parcelable;", "MagicLinkConfirmation", "Lcom/medium/android/donkey/susi/SusiActivity$RouteTo$MagicLinkConfirmation;", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public interface RouteTo extends Parcelable {

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0006¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0010J\u0010\u0010\u0014\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0014\u0010\bJ\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/donkey/susi/SusiActivity$RouteTo$MagicLinkConfirmation;", "Lcom/medium/android/donkey/susi/SusiActivity$RouteTo;", "", "token", "<init>", "(Ljava/lang/String;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;)Lcom/medium/android/donkey/susi/SusiActivity$RouteTo$MagicLinkConfirmation;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getToken", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class MagicLinkConfirmation implements RouteTo {
            public static final int $stable = 0;
            public static final Parcelable.Creator<MagicLinkConfirmation> CREATOR = new b();
            private final String token;

            public MagicLinkConfirmation(String str) {
                str.getClass();
                this.token = str;
            }

            public static /* synthetic */ MagicLinkConfirmation copy$default(MagicLinkConfirmation magicLinkConfirmation, String str, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = magicLinkConfirmation.token;
                }
                return magicLinkConfirmation.copy(str);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getToken() {
                return this.token;
            }

            public final MagicLinkConfirmation copy(String token) {
                token.getClass();
                return new MagicLinkConfirmation(token);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof MagicLinkConfirmation) && g76.L(this.token, ((MagicLinkConfirmation) other).token);
            }

            public final String getToken() {
                return this.token;
            }

            public int hashCode() {
                return this.token.hashCode();
            }

            public String toString() {
                return ev6.x("MagicLinkConfirmation(token=", this.token, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.token);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SusiActivity() {
        super(3);
        this.t = vx0.d0(yw6.NONE, new doc(4, this));
        a3 a3Var = new a3(this, new zzb(9, this), false, 28);
        this.u = new iq1(n1b.a.b(a4d.class), new j3d(this, 1), new j3d(this, 0 == true ? 1 : 0), new bx6(a3Var, this));
    }

    @Override // defpackage.m15, defpackage.xy1, android.app.Activity
    public final void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        o41 o41Var = this.s;
        if (o41Var != null) {
            o41Var.a(i, i2, intent);
        } else {
            g76.g0("facebookCallbackManager");
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x00c6  */
    @Override // defpackage.xm5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onCreate(android.os.Bundle r11) {
        /*
            Method dump skipped, instruction units count: 282
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.susi.SusiActivity.onCreate(android.os.Bundle):void");
    }

    @Override // defpackage.n1
    public final boolean q() {
        return false;
    }
}
