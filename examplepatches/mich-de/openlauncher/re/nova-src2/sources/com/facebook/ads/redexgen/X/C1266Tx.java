package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.facebook.ads.androidx.media3.common.Tracks;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Tx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1266Tx implements InterfaceC1018Jt {

    @MetaExoPlayerCustomization
    public final List<C1267Ty> A00;
    public static String[] A01 = {"qTnNakj11OlxalpZdIiDZRScWp865Pd2", "McSRvhk5clHIPF5wy44HV3YVMaKeIV4V", "iv8hZYOO3UJBUod5FjeGVT41Gd", "q2FrAzj5zs", "vNsamz6waVDU3ZSgNjs6hdE425YV8KWd", "Xm1FltMlfKyUoH102uDTHcKvxizQYvTd", "bLpbtnQJnEQh9ZbBLzjWJutL8haQRFex", "GgGUiRJ0mk"};
    public static final C1266Tx A03 = new C1266Tx(new ArrayList());
    public static final String A04 = N1.A0h(0);
    public static final InterfaceC1017Js<C1266Tx> A02 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.U0
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1266Tx.A00(bundle);
        }
    };

    public C1266Tx(List<C1267Ty> list) {
        this.A00 = XR.A03((C1267Ty[]) list.toArray(new C1267Ty[0]));
    }

    public static /* synthetic */ C1266Tx A00(Bundle bundle) {
        List<Tracks.Group> groups;
        List<Tracks.Group> groups2 = bundle.getParcelableArrayList(A04);
        if (groups2 == null) {
            groups = Collections.emptyList();
        } else {
            groups = C1068Lt.A01(C1267Ty.A05, groups2);
        }
        return new C1266Tx(groups);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            if (A01[2].length() != 26) {
                throw new RuntimeException();
            }
            A01[2] = "enX3qzABvO6let27ufhB4eZN4i";
            return true;
        }
        if (obj == null) {
            return false;
        }
        Class<?> cls = getClass();
        Class<?> cls2 = obj.getClass();
        String[] strArr = A01;
        if (strArr[7].length() != strArr[3].length()) {
            A01[6] = "NQhMp3y770hSZ75uzmbcy3n2bZGADG5A";
            if (cls != cls2) {
                return false;
            }
        } else {
            A01[5] = "UX1etuUlkSTNoTslOpnk24L7LOmDF98O";
            if (cls != cls2) {
                return false;
            }
        }
        return this.A00.equals(((C1266Tx) obj).A00);
    }

    public final int hashCode() {
        return this.A00.hashCode();
    }
}
