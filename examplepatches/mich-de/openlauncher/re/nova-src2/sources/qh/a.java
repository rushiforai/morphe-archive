package qh;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final ex.a f84068a = new ex.a(4);

    public static boolean a(Context context) throws NoSuchAlgorithmException {
        Signature[] signatureArr;
        String strEncodeToString;
        ex.a aVar = f84068a;
        try {
        } catch (PackageManager.NameNotFoundException unused) {
            aVar.g("Play Store package is not found.");
        }
        if (!context.getPackageManager().getApplicationInfo("com.android.vending", 0).enabled) {
            aVar.g("Play Store package is disabled.");
            return false;
        }
        try {
            signatureArr = context.getPackageManager().getPackageInfo("com.android.vending", 64).signatures;
        } catch (PackageManager.NameNotFoundException unused2) {
            aVar.g("Play Store package is not found.");
        }
        if (signatureArr == null || (signatureArr.length) == 0) {
            aVar.g("Play Store package is not signed -- possibly self-built package. Could not verify.");
            return false;
        }
        ArrayList arrayList = new ArrayList();
        for (Signature signature : signatureArr) {
            byte[] byteArray = signature.toByteArray();
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                messageDigest.update(byteArray);
                strEncodeToString = Base64.encodeToString(messageDigest.digest(), 11);
            } catch (NoSuchAlgorithmException unused3) {
                strEncodeToString = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            arrayList.add(strEncodeToString);
            if ("8P1sW0EPJcslw7UzRsiXL64w-O50Ed-RBICtay1g24M".equals(strEncodeToString)) {
                return true;
            }
            String str = Build.TAGS;
            if ((str.contains("dev-keys") || str.contains("test-keys")) && "GXWy8XF3vIml3_MfnmSmyuKBpT3B0dWbHRR_4cgq-gA".equals(strEncodeToString)) {
                return true;
            }
        }
        StringBuilder sb2 = new StringBuilder();
        Iterator it = arrayList.iterator();
        if (it.hasNext()) {
            while (true) {
                sb2.append((CharSequence) it.next());
                if (!it.hasNext()) {
                    break;
                }
                sb2.append((CharSequence) ", ");
            }
        }
        aVar.g("Play Store package certs are not valid. Found these sha256 certs: [" + sb2.toString() + "].");
        return false;
    }
}
