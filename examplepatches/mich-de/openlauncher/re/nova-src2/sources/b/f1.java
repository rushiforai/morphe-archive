package b;

import ads_mobile_sdk.ga3;
import ads_mobile_sdk.pg;
import ads_mobile_sdk.qm1;
import ads_mobile_sdk.rm2;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.vm3;
import ads_mobile_sdk.wm3;
import ads_mobile_sdk.xm3;
import ads_mobile_sdk.yk0;
import ads_mobile_sdk.yl0;
import ads_mobile_sdk.zm3;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final /* synthetic */ class f1 implements vk.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15842a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15843b;

    public /* synthetic */ f1(Object obj, int i5) {
        this.f15842a = i5;
        this.f15843b = obj;
    }

    @Override // vk.g
    public final Object apply(Object obj) throws IOException {
        int i5 = this.f15842a;
        Object obj2 = this.f15843b;
        switch (i5) {
            case 0:
                return (n) obj2;
            case 1:
                n nVar = (n) obj;
                ((ga3) obj2).f3752f.set(nVar);
                return nVar;
            case 2:
                pg pgVar = (pg) obj2;
                String str = (String) obj;
                if (!vk.l.a(str)) {
                    return str;
                }
                File file = new File(pgVar.f8263a.getPackageResourcePath());
                if (!file.exists() || !file.canRead()) {
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                try {
                    FileInputStream fileInputStream = new FileInputStream(file);
                    try {
                        byte[] bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                        MessageDigest messageDigest = MessageDigest.getInstance("SHA256");
                        for (int i11 = fileInputStream.read(bArr); i11 != -1; i11 = fileInputStream.read(bArr)) {
                            messageDigest.update(bArr, 0, i11);
                        }
                        String strC = zk.d.f98549f.f().c(messageDigest.digest());
                        fileInputStream.close();
                        return strC;
                    } finally {
                    }
                } catch (IOException | UnsupportedOperationException | NoSuchAlgorithmException unused) {
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
            case 3:
                return Boolean.valueOf(((l1) obj2).a((rm2) obj));
            case 4:
                yl0 yl0Var = (yl0) obj;
                vi3 vi3Var = ((zm3) obj2).f12594d;
                switch (c0.F(yl0Var.q$1())) {
                    case 0:
                    case 4:
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                        yk0 yk0Var = yk0.EVENT_ID_UNSPECIFIED;
                        ((qm1) vi3Var.f10792a).a(1004, -1L, c0.F(yl0Var.q$1()) + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                        throw new wm3(ed.i("r: ", c0.F(yl0Var.q$1())));
                    case 1:
                    case 2:
                        return yl0Var;
                    case 3:
                        yk0 yk0Var2 = yk0.EVENT_ID_UNSPECIFIED;
                        ((qm1) vi3Var.f10792a).a(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, -1L, c0.F(yl0Var.q$1()) + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                        throw new xm3(ed.i("r: ", c0.F(yl0Var.q$1())));
                    case 12:
                        yk0 yk0Var3 = yk0.EVENT_ID_UNSPECIFIED;
                        ((qm1) vi3Var.f10792a).a(1004, -1L, c0.F(yl0Var.q$1()) + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, null);
                        throw new vm3(ed.i("r: ", c0.F(yl0Var.q$1())));
                    default:
                        throw new IncompatibleClassChangeError();
                }
            default:
                se.p pVar = (se.p) obj;
                ((se.i) obj2).getClass();
                return pVar;
        }
    }
}
