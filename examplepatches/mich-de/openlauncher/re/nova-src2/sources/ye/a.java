package ye;

import com.google.android.exoplayer2.metadata.Metadata;
import com.google.android.exoplayer2.metadata.dvbsi.AppInfoTable;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import ke.x;
import p6.u;
import vk.e;
import xe.c;

/* loaded from: classes3.dex */
public final class a extends u {
    @Override // p6.u
    public final Metadata m(c cVar, ByteBuffer byteBuffer) {
        if (byteBuffer.get() == 116) {
            x xVar = new x(byteBuffer.array(), byteBuffer.limit());
            xVar.r(12);
            int iF = (xVar.f() + xVar.i(12)) - 4;
            xVar.r(44);
            xVar.s(xVar.i(12));
            xVar.r(16);
            ArrayList arrayList = new ArrayList();
            while (xVar.f() < iF) {
                xVar.r(48);
                int i5 = xVar.i(8);
                xVar.r(4);
                int iF2 = xVar.f() + xVar.i(12);
                String str = null;
                String str2 = null;
                while (xVar.f() < iF2) {
                    int i11 = xVar.i(8);
                    int i12 = xVar.i(8);
                    int iF3 = xVar.f() + i12;
                    if (i11 == 2) {
                        int i13 = xVar.i(16);
                        xVar.r(8);
                        if (i13 == 3) {
                            while (xVar.f() < iF3) {
                                int i14 = xVar.i(8);
                                Charset charset = e.f92807a;
                                byte[] bArr = new byte[i14];
                                xVar.k(i14, bArr);
                                str = new String(bArr, charset);
                                int i15 = xVar.i(8);
                                for (int i16 = 0; i16 < i15; i16++) {
                                    xVar.s(xVar.i(8));
                                }
                            }
                        }
                    } else if (i11 == 21) {
                        Charset charset2 = e.f92807a;
                        byte[] bArr2 = new byte[i12];
                        xVar.k(i12, bArr2);
                        str2 = new String(bArr2, charset2);
                    }
                    xVar.o(iF3 * 8);
                }
                xVar.o(iF2 * 8);
                if (str != null && str2 != null) {
                    arrayList.add(new AppInfoTable(i5, str.concat(str2)));
                }
            }
            if (!arrayList.isEmpty()) {
                return new Metadata(arrayList);
            }
        }
        return null;
    }
}
