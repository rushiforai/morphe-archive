package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dtf extends k2 {
    public static final Parcelable.Creator<dtf> CREATOR = new rkf(21);
    public static final byte[] b = "WebAuthn PRF\u0000".getBytes(StandardCharsets.UTF_8);
    public final byte[][] a;

    public dtf(byte[][] bArr) {
        vp7.l(bArr != null);
        vp7.l(1 == ((bArr.length & 1) ^ 1));
        int i = 0;
        while (i < bArr.length) {
            vp7.l(i == 0 || bArr[i] != null);
            int i2 = i + 1;
            vp7.l(bArr[i2] != null);
            int length = bArr[i2].length;
            vp7.l(length == 32 || length == 64);
            i += 2;
        }
        this.a = bArr;
    }

    public static dtf d(JSONObject jSONObject, boolean z) throws JSONException {
        ArrayList arrayList = new ArrayList();
        try {
            if (jSONObject.has("eval")) {
                arrayList.add(null);
                if (z) {
                    arrayList.add(h(jSONObject.getJSONObject("eval")));
                } else {
                    arrayList.add(i(jSONObject.getJSONObject("eval")));
                }
            }
            if (jSONObject.has("evalByCredential")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("evalByCredential");
                Iterator<String> itKeys = jSONObject2.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    arrayList.add(op8.S(next));
                    if (z) {
                        arrayList.add(h(jSONObject2.getJSONObject(next)));
                    } else {
                        arrayList.add(i(jSONObject2.getJSONObject(next)));
                    }
                }
            }
            return new dtf((byte[][]) arrayList.toArray(new byte[0][]));
        } catch (IllegalArgumentException unused) {
            throw new JSONException("invalid base64url value");
        }
    }

    public static JSONObject e(byte[] bArr) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (bArr.length == 32) {
            jSONObject.put("first", Base64.encodeToString(bArr, 11));
            return jSONObject;
        }
        jSONObject.put("first", Base64.encodeToString(bArr, 0, 32, 11));
        jSONObject.put("second", Base64.encodeToString(bArr, 32, 32, 11));
        return jSONObject;
    }

    public static byte[] g(byte[] bArr) {
        p4g p4gVar;
        int i = l4g.a;
        w4g w4gVar = k4g.a;
        int i2 = w4gVar.f;
        MessageDigest messageDigest = w4gVar.e;
        if (w4gVar.g) {
            try {
                p4gVar = new p4g((MessageDigest) messageDigest.clone(), i2, 0);
            } catch (CloneNotSupportedException unused) {
                try {
                    p4gVar = new p4g(MessageDigest.getInstance(messageDigest.getAlgorithm()), i2, 0);
                } catch (NoSuchAlgorithmException e) {
                    ay0.d(e);
                    return null;
                }
            }
        } else {
            p4gVar = new p4g(MessageDigest.getInstance(messageDigest.getAlgorithm()), i2, 0);
        }
        byte[] bArr2 = b;
        bArr2.getClass();
        int length = bArr2.length;
        if (p4gVar.c) {
            ygf.f("Cannot re-use a Hasher after calling hash() on it");
            return null;
        }
        MessageDigest messageDigest2 = p4gVar.a;
        messageDigest2.update(bArr2, 0, length);
        bArr.getClass();
        int length2 = bArr.length;
        if (p4gVar.c) {
            ygf.f("Cannot re-use a Hasher after calling hash() on it");
            return null;
        }
        messageDigest2.update(bArr, 0, length2);
        if (p4gVar.c) {
            ygf.f("Cannot re-use a Hasher after calling hash() on it");
            return null;
        }
        p4gVar.c = true;
        int digestLength = messageDigest2.getDigestLength();
        int i3 = p4gVar.b;
        return (byte[]) (i3 == digestLength ? new g4g(messageDigest2.digest()) : new g4g(Arrays.copyOf(messageDigest2.digest(), i3))).b.clone();
    }

    public static byte[] h(JSONObject jSONObject) throws JSONException {
        byte[] bArrS = op8.S(jSONObject.getString("first"));
        if (bArrS.length != 32) {
            throw new JSONException("hashed PRF value with wrong length");
        }
        if (!jSONObject.has("second")) {
            return bArrS;
        }
        byte[] bArrS2 = op8.S(jSONObject.getString("second"));
        if (bArrS2.length == 32) {
            return to7.D(bArrS, bArrS2);
        }
        throw new JSONException("hashed PRF value with wrong length");
    }

    public static byte[] i(JSONObject jSONObject) {
        byte[] bArrG = g(op8.S(jSONObject.getString("first")));
        return !jSONObject.has("second") ? bArrG : to7.D(bArrG, g(op8.S(jSONObject.getString("second"))));
    }

    public final boolean equals(Object obj) {
        if (obj instanceof dtf) {
            return Arrays.deepEquals(this.a, ((dtf) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = 0;
        for (byte[] bArr : this.a) {
            if (bArr != null) {
                iHashCode ^= Arrays.hashCode(new Object[]{bArr});
            }
        }
        return iHashCode;
    }

    public final String toString() {
        byte[][] bArr = this.a;
        try {
            JSONObject jSONObject = new JSONObject();
            JSONObject jSONObject2 = null;
            for (int i = 0; i < bArr.length; i += 2) {
                if (bArr[i] == null) {
                    jSONObject.put("eval", e(bArr[i + 1]));
                } else {
                    if (jSONObject2 == null) {
                        jSONObject2 = new JSONObject();
                        jSONObject.put("evalByCredential", jSONObject2);
                    }
                    jSONObject2.put(op8.U(bArr[i]), e(bArr[i + 1]));
                }
            }
            return "PrfExtension{" + jSONObject.toString() + "}";
        } catch (JSONException e) {
            return ev6.x("PrfExtension{Exception:", e.getMessage(), "}");
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        byte[][] bArr = this.a;
        if (bArr != null) {
            int iC02 = fo7.c0(1, parcel);
            parcel.writeInt(bArr.length);
            for (byte[] bArr2 : bArr) {
                parcel.writeByteArray(bArr2);
            }
            fo7.d0(iC02, parcel);
        }
        fo7.d0(iC0, parcel);
    }
}
