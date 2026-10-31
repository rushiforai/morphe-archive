package yp;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import b.c0;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.LoginActivity;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import m.w;

/* loaded from: classes4.dex */
public final class a implements xp.a {

    /* renamed from: a, reason: collision with root package name */
    public b f97397a;

    /* JADX WARN: Removed duplicated region for block: B:28:0x007e A[LOOP:0: B:3:0x000d->B:28:0x007e, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0081 A[EDGE_INSN: B:44:0x0081->B:29:0x0081 BREAK  A[LOOP:0: B:3:0x000d->B:28:0x007e], SYNTHETIC] */
    @Override // xp.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(LoginActivity loginActivity, AuthorizationRequest authorizationRequest) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        String strA;
        this.f97397a = new b(loginActivity, authorizationRequest);
        String[] strArr = b.f97398b;
        Intent intent = null;
        for (int i5 = 0; i5 < 4; i5++) {
            String strK = c0.k("com.spotify.music", strArr[i5]);
            Intent intent2 = new Intent("com.spotify.sso.action.START_AUTH_FLOW");
            intent2.setPackage(strK);
            ComponentName componentNameResolveActivity = intent2.resolveActivity(loginActivity.getPackageManager());
            if (componentNameResolveActivity == null) {
                intent = null;
                if (intent == null) {
                    break;
                }
            } else {
                try {
                    Signature[] signatureArr = loginActivity.getPackageManager().getPackageInfo(componentNameResolveActivity.getPackageName(), 64).signatures;
                    if (signatureArr != null) {
                        for (Signature signature : signatureArr) {
                            String charsString = signature.toCharsString();
                            try {
                                MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                                byte[] bytes = charsString.getBytes("UTF-8");
                                messageDigest.update(bytes, 0, bytes.length);
                                strA = b.a(messageDigest.digest());
                            } catch (UnsupportedEncodingException | NoSuchAlgorithmException unused) {
                                strA = null;
                            }
                            String[] strArr2 = b.f97399c;
                            for (int i11 = 0; i11 < 6; i11++) {
                                if (strArr2[i11].equals(strA)) {
                                    intent = intent2;
                                    break;
                                }
                            }
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused2) {
                }
                intent = null;
                if (intent == null) {
                }
            }
        }
        if (intent == null) {
            return false;
        }
        intent.putExtra("VERSION", 1);
        intent.putExtra("CLIENT_ID", authorizationRequest.f42405a);
        intent.putExtra("REDIRECT_URI", authorizationRequest.f42407c);
        intent.putExtra("RESPONSE_TYPE", authorizationRequest.f42406b);
        intent.putExtra("SCOPES", authorizationRequest.f42409e);
        intent.putExtra("STATE", authorizationRequest.f42408d);
        try {
            loginActivity.startActivityForResult(intent, 1138);
            return true;
        } catch (ActivityNotFoundException unused3) {
            return false;
        }
    }

    @Override // xp.a
    public final void b(w wVar) {
    }

    @Override // xp.a
    public final void stop() {
        b bVar = this.f97397a;
        if (bVar != null) {
            bVar.f97401a.finishActivity(1138);
        }
    }
}
