package defpackage;

import com.medium.proto.model.PlaybackModel;
import gen.model.Quote;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ak3 {
    public final String a;
    public final String b;
    public final Quote c;
    public final String d;
    public final int e;
    public final PlaybackModel f;
    public final List g;
    public final List h;
    public final long i;

    public ak3(String str, String str2, Quote quote, String str3, int i, PlaybackModel playbackModel, List list, List list2, long j) {
        playbackModel.getClass();
        this.a = str;
        this.b = str2;
        this.c = quote;
        this.d = str3;
        this.e = i;
        this.f = playbackModel;
        this.g = list;
        this.h = list2;
        this.i = j;
    }

    public static ak3 a(ak3 ak3Var, String str, String str2, int i, PlaybackModel playbackModel, ArrayList arrayList, List list, int i2) {
        String str3 = (i2 & 1) != 0 ? ak3Var.a : null;
        if ((i2 & 2) != 0) {
            str = ak3Var.b;
        }
        String str4 = str;
        Quote quote = (i2 & 4) != 0 ? ak3Var.c : null;
        String str5 = (i2 & 8) != 0 ? ak3Var.d : str2;
        int i3 = (i2 & 16) != 0 ? ak3Var.e : i;
        PlaybackModel playbackModel2 = (i2 & 32) != 0 ? ak3Var.f : playbackModel;
        List list2 = (i2 & 64) != 0 ? ak3Var.g : arrayList;
        List list3 = (i2 & 128) != 0 ? ak3Var.h : list;
        long j = ak3Var.i;
        playbackModel2.getClass();
        return new ak3(str3, str4, quote, str5, i3, playbackModel2, list2, list3, j);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ak3)) {
            return false;
        }
        ak3 ak3Var = (ak3) obj;
        return g76.L(this.a, ak3Var.a) && g76.L(this.b, ak3Var.b) && g76.L(this.c, ak3Var.c) && g76.L(this.d, ak3Var.d) && this.e == ak3Var.e && g76.L(this.f, ak3Var.f) && this.g.equals(ak3Var.g) && this.h.equals(ak3Var.h) && this.i == ak3Var.i;
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Quote quote = this.c;
        int iHashCode3 = (iHashCode2 + (quote == null ? 0 : quote.hashCode())) * 31;
        String str3 = this.d;
        int iP = wgd.p(wgd.p((this.f.hashCode() + ((((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31) + this.e) * 31)) * 31, 31, this.g), 31, this.h);
        long j = this.i;
        return iP + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Draft(clientPostId=", this.a, ", responseParentId=", this.b, ", responseParentQuote=");
        sbU.append(this.c);
        sbU.append(", postId=");
        sbU.append(this.d);
        sbU.append(", serverRev=");
        sbU.append(this.e);
        sbU.append(", serverModel=");
        sbU.append(this.f);
        sbU.append(", normalizingDeltas=");
        sbU.append(this.g);
        sbU.append(", pendingDeltas=");
        sbU.append(this.h);
        sbU.append(", editorSessionStartedAt=");
        return ev6.t(this.i, ")", sbU);
    }
}
