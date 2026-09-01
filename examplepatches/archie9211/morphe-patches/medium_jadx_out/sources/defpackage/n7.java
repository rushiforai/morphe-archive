package defpackage;

import android.os.Handler;
import android.os.Looper;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import gen.model.ApiReferences$Companion$ADAPTER$1;
import java.util.UUID;
import kotlin.KotlinNothingValueException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n7 implements m45 {
    public final /* synthetic */ int a;

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return Integer.valueOf(msa.b.f().nextInt(2147418112) + ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
            case 1:
                return UUID.randomUUID().toString();
            case 2:
                jy8 jy8Var = qd.a;
                return gx2.a;
            case 3:
                return ApiReferences$Companion$ADAPTER$1.a();
            case 4:
                return ApiReferences$Companion$ADAPTER$1.d();
            case 5:
                return ApiReferences$Companion$ADAPTER$1.c();
            case 6:
                return ApiReferences$Companion$ADAPTER$1.b();
            case 7:
                sn3 sn3Var = a10.a;
                return z13.a;
            case 8:
                sn3 sn3Var2 = a10.a;
                return c33.a;
            case 9:
                return new vod(-3.4028235E38f, 0.0f, 0.0f);
            case 10:
                return new dkc(op8.j(1308617531));
            case 11:
                return null;
            case 12:
            case 13:
            case 14:
                return c1eVar;
            case 15:
                return iv1.e(0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, -1);
            case 16:
                long jL = op8.l(4284612846L);
                long jL2 = op8.l(4281794739L);
                long jL3 = op8.l(4278442694L);
                long jL4 = op8.l(4278290310L);
                long j = uu1.d;
                long jL5 = op8.l(4289724448L);
                long j2 = uu1.b;
                return new sv1(jL, jL2, jL3, jL4, j, j, jL5, j, j2, j2, j2, j, true);
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
                return c1eVar;
            case 23:
                return null;
            case 24:
                b22.b("Unexpected call to default provider");
                throw new KotlinNothingValueException();
            case 25:
                return Float.valueOf(1.0f);
            case 26:
                vv8 vv8Var = new vv8();
                ex7 ex7Var = new ex7();
                zh8 zh8Var = vv8Var;
                while (true) {
                    ex7 ex7Var2 = zh8Var.a;
                    if (ex7Var2 == null) {
                        zh8Var.a = ex7Var;
                        return vv8Var;
                    }
                    zh8Var = ex7Var2;
                }
                break;
            case 27:
                return Float.valueOf(1.0f);
            case 28:
                return new Handler(Looper.getMainLooper());
            default:
                return c1eVar;
        }
    }

    public /* synthetic */ n7(int i) {
        this.a = i;
    }
}
