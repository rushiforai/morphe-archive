package androidx.core.app;

import android.app.PendingIntent;
import android.os.Parcel;
import android.text.TextUtils;
import androidx.core.graphics.drawable.IconCompat;
import java.lang.reflect.InvocationTargetException;
import k7.a;
import k7.b;
import k7.c;

/* loaded from: classes2.dex */
public class RemoteActionCompatParcelizer {
    public static RemoteActionCompat read(a aVar) {
        RemoteActionCompat remoteActionCompat = new RemoteActionCompat();
        c cVarH = remoteActionCompat.f14218a;
        boolean z11 = true;
        if (aVar.e(1)) {
            cVarH = aVar.h();
        }
        remoteActionCompat.f14218a = (IconCompat) cVarH;
        CharSequence charSequence = remoteActionCompat.f14219b;
        if (aVar.e(2)) {
            charSequence = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(((b) aVar).f71185e);
        }
        remoteActionCompat.f14219b = charSequence;
        CharSequence charSequence2 = remoteActionCompat.f14220c;
        if (aVar.e(3)) {
            charSequence2 = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(((b) aVar).f71185e);
        }
        remoteActionCompat.f14220c = charSequence2;
        remoteActionCompat.f14221d = (PendingIntent) aVar.g(remoteActionCompat.f14221d, 4);
        boolean z12 = remoteActionCompat.f14222e;
        if (aVar.e(5)) {
            z12 = ((b) aVar).f71185e.readInt() != 0;
        }
        remoteActionCompat.f14222e = z12;
        boolean z13 = remoteActionCompat.f14223f;
        if (!aVar.e(6)) {
            z11 = z13;
        } else if (((b) aVar).f71185e.readInt() == 0) {
            z11 = false;
        }
        remoteActionCompat.f14223f = z11;
        return remoteActionCompat;
    }

    public static void write(RemoteActionCompat remoteActionCompat, a aVar) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        aVar.getClass();
        IconCompat iconCompat = remoteActionCompat.f14218a;
        aVar.i(1);
        aVar.l(iconCompat);
        CharSequence charSequence = remoteActionCompat.f14219b;
        aVar.i(2);
        Parcel parcel = ((b) aVar).f71185e;
        TextUtils.writeToParcel(charSequence, parcel, 0);
        CharSequence charSequence2 = remoteActionCompat.f14220c;
        aVar.i(3);
        TextUtils.writeToParcel(charSequence2, parcel, 0);
        aVar.k(remoteActionCompat.f14221d, 4);
        boolean z11 = remoteActionCompat.f14222e;
        aVar.i(5);
        parcel.writeInt(z11 ? 1 : 0);
        boolean z12 = remoteActionCompat.f14223f;
        aVar.i(6);
        parcel.writeInt(z12 ? 1 : 0);
    }
}
