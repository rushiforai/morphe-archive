package androidx.core.app;

import android.app.PendingIntent;
import android.os.Parcel;
import android.text.TextUtils;
import androidx.core.graphics.drawable.IconCompat;
import defpackage.nse;
import defpackage.ose;
import defpackage.pse;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RemoteActionCompatParcelizer {
    public static RemoteActionCompat read(nse nseVar) {
        RemoteActionCompat remoteActionCompat = new RemoteActionCompat();
        pse pseVarH = remoteActionCompat.a;
        boolean z = true;
        if (nseVar.e(1)) {
            pseVarH = nseVar.h();
        }
        remoteActionCompat.a = (IconCompat) pseVarH;
        CharSequence charSequence = remoteActionCompat.b;
        if (nseVar.e(2)) {
            charSequence = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(((ose) nseVar).e);
        }
        remoteActionCompat.b = charSequence;
        CharSequence charSequence2 = remoteActionCompat.c;
        if (nseVar.e(3)) {
            charSequence2 = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(((ose) nseVar).e);
        }
        remoteActionCompat.c = charSequence2;
        remoteActionCompat.d = (PendingIntent) nseVar.g(remoteActionCompat.d, 4);
        boolean z2 = remoteActionCompat.e;
        if (nseVar.e(5)) {
            z2 = ((ose) nseVar).e.readInt() != 0;
        }
        remoteActionCompat.e = z2;
        boolean z3 = remoteActionCompat.f;
        if (!nseVar.e(6)) {
            z = z3;
        } else if (((ose) nseVar).e.readInt() == 0) {
            z = false;
        }
        remoteActionCompat.f = z;
        return remoteActionCompat;
    }

    public static void write(RemoteActionCompat remoteActionCompat, nse nseVar) {
        nseVar.getClass();
        IconCompat iconCompat = remoteActionCompat.a;
        nseVar.i(1);
        nseVar.l(iconCompat);
        CharSequence charSequence = remoteActionCompat.b;
        nseVar.i(2);
        Parcel parcel = ((ose) nseVar).e;
        TextUtils.writeToParcel(charSequence, parcel, 0);
        CharSequence charSequence2 = remoteActionCompat.c;
        nseVar.i(3);
        TextUtils.writeToParcel(charSequence2, parcel, 0);
        nseVar.k(remoteActionCompat.d, 4);
        boolean z = remoteActionCompat.e;
        nseVar.i(5);
        parcel.writeInt(z ? 1 : 0);
        boolean z2 = remoteActionCompat.f;
        nseVar.i(6);
        parcel.writeInt(z2 ? 1 : 0);
    }
}
