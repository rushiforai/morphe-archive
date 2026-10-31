package l1;

import android.app.Notification;
import android.app.RemoteInput;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.security.keystore.KeyGenParameterSpec;
import android.util.Base64;
import android.util.Log;
import android.util.Pair;
import androidx.core.graphics.drawable.IconCompat;
import androidx.webkit.WebViewStartUpResult;
import com.google.android.play.core.hsdp.service.HsdpShimActivity;
import com.instabridge.ai.auth.AndroidKeystoreSecretCipher;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.chromium.support_lib_boundary.WebViewStartUpResultBoundaryInterface;

/* loaded from: classes2.dex */
public final class a2 implements mk.a, WebViewStartUpResult {

    /* renamed from: a, reason: collision with root package name */
    public Object f73007a;

    /* renamed from: b, reason: collision with root package name */
    public Object f73008b;

    /* renamed from: c, reason: collision with root package name */
    public Object f73009c;

    /* renamed from: d, reason: collision with root package name */
    public Object f73010d;

    public a2(int i5) {
        switch (i5) {
            case 5:
                this.f73007a = new CopyOnWriteArrayList();
                this.f73008b = new CopyOnWriteArrayList();
                this.f73009c = new CopyOnWriteArrayList();
                this.f73010d = new CopyOnWriteArrayList();
                break;
            case 9:
                this.f73007a = null;
                rc.a.a("%s : create specs", "KeyGeneratorSpecCreator");
                this.f73010d = new KeyGenParameterSpec.Builder("dtx_ignite_service_storage", 3).setBlockModes("GCM").setEncryptionPaddings("NoPadding").setRandomizedEncryptionRequired(false).build();
                break;
            default:
                this.f73007a = new fa.t(10, 6);
                this.f73008b = new z.c1(0);
                this.f73009c = new ArrayList();
                this.f73010d = new HashSet();
                break;
        }
    }

    public Pair a(String str) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, IOException, InvalidAlgorithmParameterException {
        if (((w.a) this.f73008b) == null) {
            return null;
        }
        SecretKey secretKey = (SecretKey) this.f73007a;
        byte[] bArrGenerateSeed = new SecureRandom().generateSeed(12);
        Cipher cipher = Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
        cipher.init(1, secretKey, new GCMParameterSpec(128, bArrGenerateSeed));
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        CipherOutputStream cipherOutputStream = new CipherOutputStream(byteArrayOutputStream, cipher);
        cipherOutputStream.write(str.getBytes("UTF-8"));
        cipherOutputStream.close();
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.close();
        return new Pair(Base64.encodeToString(bArrGenerateSeed, 0), Base64.encodeToString(byteArray, 0));
    }

    public String b(String str, byte[] bArr) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, IOException, InvalidAlgorithmParameterException {
        if (((vu.q) this.f73009c) == null) {
            return null;
        }
        SecretKey secretKey = (SecretKey) this.f73007a;
        Cipher cipher = Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
        cipher.init(2, secretKey, new GCMParameterSpec(128, bArr));
        CipherInputStream cipherInputStream = new CipherInputStream(new ByteArrayInputStream(Base64.decode(str, 0)), cipher);
        ArrayList arrayList = new ArrayList();
        while (true) {
            int i5 = cipherInputStream.read();
            if (i5 == -1) {
                break;
            }
            arrayList.add(Byte.valueOf((byte) i5));
        }
        byte[] bArr2 = new byte[arrayList.size()];
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            bArr2[i11] = ((Byte) arrayList.get(i11)).byteValue();
        }
        return new String(bArr2, "UTF-8");
    }

    public void c() throws NoSuchAlgorithmException, UnrecoverableKeyException, IOException, KeyStoreException, CertificateException, NoSuchProviderException, InvalidAlgorithmParameterException {
        rc.a.a("%s : init", "EncryptionManager");
        KeyStore keyStore = KeyStore.getInstance(AndroidKeystoreSecretCipher.ANDROID_KEYSTORE);
        keyStore.load(null);
        if (!keyStore.containsAlias("dtx_ignite_service_storage")) {
            KeyGenerator keyGenerator = KeyGenerator.getInstance("AES", AndroidKeystoreSecretCipher.ANDROID_KEYSTORE);
            keyGenerator.init((KeyGenParameterSpec) this.f73010d);
            keyGenerator.generateKey();
        }
        Key key = keyStore.getKey("dtx_ignite_service_storage", null);
        if (key instanceof SecretKey) {
            this.f73007a = (SecretKey) key;
            this.f73008b = new w.a();
            this.f73009c = new vu.q();
        }
    }

    public void d(n4.l lVar) {
        IconCompat iconCompatA = lVar.a();
        boolean z11 = lVar.f77821d;
        Bundle bundle = lVar.f77818a;
        Notification.Action.Builder builder = new Notification.Action.Builder(iconCompatA != null ? iconCompatA.f(null) : null, lVar.f77824g, lVar.f77825h);
        n4.s0[] s0VarArr = lVar.f77820c;
        if (s0VarArr != null) {
            RemoteInput[] remoteInputArr = new RemoteInput[s0VarArr.length];
            if (s0VarArr.length > 0) {
                n4.s0 s0Var = s0VarArr[0];
                throw null;
            }
            for (RemoteInput remoteInput : remoteInputArr) {
                builder.addRemoteInput(remoteInput);
            }
        }
        Bundle bundle2 = bundle != null ? new Bundle(bundle) : new Bundle();
        bundle2.putBoolean("android.support.allowGeneratedReplies", z11);
        int i5 = Build.VERSION.SDK_INT;
        builder.setAllowGeneratedReplies(z11);
        bundle2.putInt("android.support.action.semanticAction", 0);
        if (i5 >= 28) {
            n4.h0.c(builder);
        }
        if (i5 >= 29) {
            n4.g.d(builder);
        }
        if (i5 >= 31) {
            n4.i0.a(builder);
        }
        bundle2.putBoolean("android.support.action.showsUserInterface", lVar.f77822e);
        builder.addExtras(bundle2);
        ((Notification.Builder) this.f73008b).addAction(builder.build());
    }

    public ql.c e() throws GeneralSecurityException {
        ql.b bVar = ql.b.f84112e;
        ql.b bVar2 = (ql.b) this.f73007a;
        if (bVar2 == null) {
            throw new GeneralSecurityException("signature encoding is not set");
        }
        ql.a aVar = (ql.a) this.f73008b;
        if (aVar == null) {
            throw new GeneralSecurityException("EC curve type is not set");
        }
        ql.b bVar3 = (ql.b) this.f73009c;
        if (bVar3 == null) {
            throw new GeneralSecurityException("hash type is not set");
        }
        ql.b bVar4 = (ql.b) this.f73010d;
        if (bVar4 == null) {
            throw new GeneralSecurityException("variant is not set");
        }
        if (aVar == ql.a.f84100c && bVar3 != ql.b.f84110c) {
            throw new GeneralSecurityException("NIST_P256 requires SHA256");
        }
        if (aVar == ql.a.f84101d && bVar3 != ql.b.f84111d && bVar3 != bVar) {
            throw new GeneralSecurityException("NIST_P384 requires SHA384 or SHA512");
        }
        if (aVar != ql.a.f84102e || bVar3 == bVar) {
            return new ql.c(bVar2, aVar, bVar3, bVar4);
        }
        throw new GeneralSecurityException("NIST_P521 requires SHA512");
    }

    public void f(Object obj, ArrayList arrayList, HashSet hashSet) {
        if (arrayList.contains(obj)) {
            return;
        }
        if (hashSet.contains(obj)) {
            throw new RuntimeException("This graph contains cyclic dependencies");
        }
        hashSet.add(obj);
        ArrayList arrayList2 = (ArrayList) ((z.c1) this.f73008b).get(obj);
        if (arrayList2 != null) {
            int size = arrayList2.size();
            for (int i5 = 0; i5 < size; i5++) {
                f(arrayList2.get(i5), arrayList, hashSet);
            }
        }
        hashSet.remove(obj);
        arrayList.add(obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object g(ContinuationImpl continuationImpl) {
        t5.i iVar;
        a2 a2Var;
        t5.c cVar;
        t5.c0 c0Var = (t5.c0) this.f73010d;
        if (continuationImpl instanceof t5.i) {
            iVar = (t5.i) continuationImpl;
            int i5 = iVar.f88606w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f88606w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new t5.i(this, continuationImpl);
            }
        }
        Object objF = iVar.f88604u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f88606w;
        if (i11 == 0) {
            ResultKt.b(objF);
            List list = (List) this.f73009c;
            if (list == null || list.isEmpty()) {
                iVar.f88603t = this;
                iVar.f88606w = 1;
                objF = t5.c0.f(c0Var, false, iVar);
                if (objF != coroutineSingletons) {
                    a2Var = this;
                    cVar = (t5.c) objF;
                }
            } else {
                t5.p0 p0VarG = c0Var.g();
                t5.l lVar = new t5.l(c0Var, this, null);
                iVar.f88603t = this;
                iVar.f88606w = 2;
                objF = p0VarG.e(lVar, iVar);
                if (objF != coroutineSingletons) {
                    a2Var = this;
                    cVar = (t5.c) objF;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            a2Var = iVar.f88603t;
            ResultKt.b(objF);
            cVar = (t5.c) objF;
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            a2Var = iVar.f88603t;
            ResultKt.b(objF);
            cVar = (t5.c) objF;
        }
        ((t5.c0) a2Var.f73010d).f88550h.K(cVar);
        return Unit.f71706a;
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public Long getMaxTimePerTaskInUiThreadMillis() {
        return ((WebViewStartUpResultBoundaryInterface) this.f73010d).getMaxTimePerTaskInUiThreadMillis();
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public List getNonUiThreadBlockingStartUpLocations() {
        return (List) this.f73008b;
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public Long getTotalTimeInUiThreadMillis() {
        return ((WebViewStartUpResultBoundaryInterface) this.f73010d).getTotalTimeInUiThreadMillis();
    }

    @Override // androidx.webkit.WebViewStartUpResult
    public List getUiThreadBlockingStartUpLocations() {
        return (ArrayList) this.f73007a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v5, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object h(ContinuationImpl continuationImpl) throws Throwable {
        t5.b1 b1Var;
        c80.d dVar;
        a2 a2Var;
        c80.a aVar;
        Throwable th2;
        a2 a2Var2;
        if (continuationImpl instanceof t5.b1) {
            b1Var = (t5.b1) continuationImpl;
            int i5 = b1Var.f88540x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b1Var.f88540x = i5 - Integer.MIN_VALUE;
            } else {
                b1Var = new t5.b1(this, continuationImpl);
            }
        }
        Object obj = b1Var.f88538v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b1Var.f88540x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (((t70.s) this.f73008b).isCompleted()) {
                    return Unit.f71706a;
                }
                dVar = (c80.d) this.f73007a;
                b1Var.f88536t = this;
                b1Var.f88537u = dVar;
                b1Var.f88540x = 1;
                if (dVar.e(b1Var) != coroutineSingletons) {
                    a2Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = b1Var.f88537u;
                a2Var2 = b1Var.f88536t;
                try {
                    ResultKt.b(obj);
                    t70.s sVar = (t70.s) a2Var2.f73008b;
                    Unit unit = Unit.f71706a;
                    sVar.X(unit);
                    ((c80.d) aVar).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((c80.d) aVar).g(null);
                    throw th2;
                }
            }
            ?? r22 = b1Var.f88537u;
            a2Var = b1Var.f88536t;
            ResultKt.b(obj);
            dVar = r22;
            if (((t70.s) a2Var.f73008b).isCompleted()) {
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                return unit2;
            }
            b1Var.f88536t = a2Var;
            b1Var.f88537u = dVar;
            b1Var.f88540x = 2;
            if (a2Var.g(b1Var) != coroutineSingletons) {
                aVar = dVar;
                a2Var2 = a2Var;
                t70.s sVar2 = (t70.s) a2Var2.f73008b;
                Unit unit3 = Unit.f71706a;
                sVar2.X(unit3);
                ((c80.d) aVar).g(null);
                return unit3;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            aVar = dVar;
            th2 = th4;
            ((c80.d) aVar).g(null);
            throw th2;
        }
    }

    @Override // mk.a
    public void onDismissed(Bundle bundle) {
        HsdpShimActivity hsdpShimActivity = (HsdpShimActivity) this.f73010d;
        if (Log.isLoggable("HsdpShimActivity", 4)) {
            Log.i("HsdpShimActivity", "HSDP service based UI dismissed. hasBeenShown=" + hsdpShimActivity.f34554b);
        }
        boolean z11 = bundle.getBoolean("dldpRedirect", false);
        if (!hsdpShimActivity.f34554b && !z11) {
            Log.i("HsdpShimActivity", "Ignore dismiss before shown (likely temporary reuse cleanup)");
            return;
        }
        Log.i("HsdpShimActivity", "Finish the shim activity.");
        hsdpShimActivity.f34553a = null;
        hsdpShimActivity.finish();
    }

    @Override // mk.a
    public void onError(Bundle bundle) {
        Log.e("HsdpShimActivity", "HSDP service based UI error: " + String.valueOf(bundle) + ". Finish the shim activity.");
        String str = (String) this.f73007a;
        String str2 = (String) this.f73008b;
        Map map = (Map) this.f73009c;
        HsdpShimActivity hsdpShimActivity = (HsdpShimActivity) this.f73010d;
        hsdpShimActivity.startActivityForResult(ex.i.R(str, str2, map), 0);
        hsdpShimActivity.f34553a = null;
        hsdpShimActivity.f34554b = false;
        hsdpShimActivity.finish();
    }

    @Override // mk.a
    public void onShown(Bundle bundle) {
        Log.i("HsdpShimActivity", "HSDP service based UI shown");
        ((HsdpShimActivity) this.f73010d).f34554b = true;
    }

    public a2(Context context) {
        this.f73007a = context;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(context.getPackageName());
        sb2.append("_preferences");
    }
}
