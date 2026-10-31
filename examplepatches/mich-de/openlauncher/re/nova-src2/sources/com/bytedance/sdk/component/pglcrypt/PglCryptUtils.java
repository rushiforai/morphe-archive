package com.bytedance.sdk.component.pglcrypt;

import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.util.Pair;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class PglCryptUtils {
    public static final int BASE64_FAILED = 504;
    public static final int COMPRESS_FAILED = 503;
    public static final int CRYPT_OK = 0;
    public static final int CYPHER_VERSION = 4;
    public static final int DECRYPT_FAILED = 506;
    public static final int ENCRYPT_FAILED = 505;
    public static final int INPUT_INVALID = 502;
    public static final String KEY_CYPHER = "cypher";
    public static final String KEY_MESSAGE = "message";
    public static final int LOAD_SO_FAILED = 501;
    public static final int UNKNOWN_ERR = 507;
    private static volatile PglCryptUtils ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile boolean f24055zb = true;

    private PglCryptUtils() {
    }

    public static native byte[] bc(int i5, byte[] bArr);

    public static PglCryptUtils getInstance() {
        if (ycx == null) {
            synchronized (PglCryptUtils.class) {
                try {
                    if (ycx == null) {
                        try {
                            System.loadLibrary("pglarmor");
                        } catch (Throwable th2) {
                            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "XOs5vA2vfcaOSdI=", 41);
                            f24055zb = false;
                        }
                        ycx = new PglCryptUtils();
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
        return ycx;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0074 A[Catch: Exception -> 0x0070, TRY_LEAVE, TryCatch #0 {Exception -> 0x0070, blocks: (B:35:0x006c, B:39:0x0074), top: B:44:0x006c }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x006c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static byte[] ycx(String str) throws Throwable {
        ByteArrayOutputStream byteArrayOutputStream;
        GZIPOutputStream gZIPOutputStream;
        GZIPOutputStream gZIPOutputStream2 = null;
        if (str == null || str.length() == 0) {
            return null;
        }
        try {
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
                    try {
                        try {
                            gZIPOutputStream.write(str.getBytes("utf-8"));
                            gZIPOutputStream.close();
                            byte[] byteArray = byteArrayOutputStream.toByteArray();
                            byteArrayOutputStream.close();
                            return byteArray;
                        } catch (Exception e3) {
                            e = e3;
                            sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "WOEghRG5etTSbc1UnA==", 228);
                            Log.e("ARMOR", e.toString());
                            if (gZIPOutputStream != null) {
                                gZIPOutputStream.close();
                            }
                            if (byteArrayOutputStream == null) {
                                return null;
                            }
                            byte[] byteArray2 = byteArrayOutputStream.toByteArray();
                            byteArrayOutputStream.close();
                            return byteArray2;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        gZIPOutputStream2 = gZIPOutputStream;
                        if (gZIPOutputStream2 != null) {
                            try {
                                gZIPOutputStream2.close();
                            } catch (Exception e11) {
                                sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "WOEghRG5etTSbc1UnA==", 239);
                                Log.e("ARMOR", e11.toString());
                                throw th;
                            }
                        }
                        if (byteArrayOutputStream != null) {
                            byteArrayOutputStream.toByteArray();
                            byteArrayOutputStream.close();
                        }
                        throw th;
                    }
                } catch (Exception e12) {
                    e = e12;
                    gZIPOutputStream = null;
                } catch (Throwable th3) {
                    th = th3;
                    if (gZIPOutputStream2 != null) {
                    }
                    if (byteArrayOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Exception e13) {
                sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "WOEghRG5etTSbc1UnA==", 239);
                Log.e("ARMOR", e13.toString());
                return null;
            }
        } catch (Exception e14) {
            e = e14;
            byteArrayOutputStream = null;
            gZIPOutputStream = null;
        } catch (Throwable th4) {
            th = th4;
            byteArrayOutputStream = null;
        }
    }

    public Pair<Integer, String> cypher4Decrypt(String str) throws Throwable {
        byte[] bArrBc;
        if (!f24055zb) {
            return new Pair<>(Integer.valueOf(LOAD_SO_FAILED), null);
        }
        if (str == null || str.length() == 0) {
            return new Pair<>(Integer.valueOf(INPUT_INVALID), null);
        }
        byte[] bArrDecode = Base64.decode(str, 0);
        if (bArrDecode == null || bArrDecode.length == 0) {
            return new Pair<>(Integer.valueOf(BASE64_FAILED), null);
        }
        try {
            bArrBc = bc(TTAdConstant.IMAGE_MODE_1011, bArrDecode);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "WPc9nQauPeOFScVEnAU=", 144);
            Log.e("ARMOR", th2.toString());
            bArrBc = null;
        }
        if (bArrBc == null || bArrBc.length == 0) {
            return new Pair<>(Integer.valueOf(DECRYPT_FAILED), null);
        }
        String strYcx = ycx(bArrBc);
        return TextUtils.isEmpty(strYcx) ? new Pair<>(Integer.valueOf(COMPRESS_FAILED), null) : new Pair<>(0, strYcx);
    }

    public Pair<Integer, JSONObject> cypher4Encrypt(JSONObject jSONObject) throws Throwable {
        Pair<Integer, String> pairCypher4EncryptWithNoWrapBase64 = cypher4EncryptWithNoWrapBase64(jSONObject.toString());
        if (pairCypher4EncryptWithNoWrapBase64 == null) {
            return new Pair<>(Integer.valueOf(UNKNOWN_ERR), null);
        }
        if (((Integer) pairCypher4EncryptWithNoWrapBase64.first).intValue() != 0) {
            return new Pair<>(pairCypher4EncryptWithNoWrapBase64.first, null);
        }
        JSONObject jSONObject2 = new JSONObject();
        String str = (String) pairCypher4EncryptWithNoWrapBase64.second;
        if (TextUtils.isEmpty(str)) {
            return new Pair<>(Integer.valueOf(BASE64_FAILED), null);
        }
        jSONObject2.put(KEY_MESSAGE, str);
        jSONObject2.put("cypher", 4);
        return new Pair<>(0, jSONObject2);
    }

    public Pair<Integer, String> cypher4EncryptWithNoWrapBase64(String str) throws Throwable {
        if (!f24055zb) {
            return new Pair<>(Integer.valueOf(LOAD_SO_FAILED), null);
        }
        if (TextUtils.isEmpty(str)) {
            return new Pair<>(Integer.valueOf(INPUT_INVALID), null);
        }
        byte[] bArrYcx = ycx(str);
        if (bArrYcx == null || bArrYcx.length == 0) {
            return new Pair<>(Integer.valueOf(COMPRESS_FAILED), null);
        }
        Pair<Integer, byte[]> pairCypher4Encrypt = cypher4Encrypt(bArrYcx);
        if (pairCypher4Encrypt == null) {
            return new Pair<>(Integer.valueOf(UNKNOWN_ERR), null);
        }
        if (((Integer) pairCypher4Encrypt.first).intValue() != 0) {
            return new Pair<>(pairCypher4Encrypt.first, null);
        }
        String strEncodeToString = Base64.encodeToString((byte[]) pairCypher4Encrypt.second, 2);
        return TextUtils.isEmpty(strEncodeToString) ? new Pair<>(Integer.valueOf(BASE64_FAILED), null) : new Pair<>(0, strEncodeToString);
    }

    public Pair<Integer, byte[]> cypher4Encrypt(byte[] bArr) {
        byte[] bArrBc;
        if (!f24055zb) {
            return new Pair<>(Integer.valueOf(LOAD_SO_FAILED), null);
        }
        if (bArr != null && bArr.length != 0) {
            try {
                bArrBc = bc(TTAdConstant.IMAGE_MODE_1010, bArr);
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "WPc9nQauPeKOScVEnAU=", 113);
                Log.e("ARMOR", th2.toString());
                bArrBc = null;
            }
            if (bArrBc != null && bArrBc.length != 0) {
                return new Pair<>(0, bArrBc);
            }
            return new Pair<>(Integer.valueOf(ENCRYPT_FAILED), null);
        }
        return new Pair<>(Integer.valueOf(INPUT_INVALID), null);
    }

    private static String ycx(byte[] bArr) throws Throwable {
        GZIPInputStream gZIPInputStream;
        Throwable th2;
        ByteArrayOutputStream byteArrayOutputStream;
        Exception exc;
        String str;
        GZIPInputStream gZIPInputStream2 = null;
        String string = null;
        gZIPInputStream2 = null;
        gZIPInputStream2 = null;
        if (bArr == null || bArr.length == 0) {
            return null;
        }
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                try {
                    gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
                } catch (Exception e3) {
                    exc = e3;
                    str = null;
                }
            } catch (Throwable th3) {
                gZIPInputStream = gZIPInputStream2;
                th2 = th3;
            }
            try {
                byte[] bArr2 = new byte[1024];
                while (true) {
                    int i5 = gZIPInputStream.read(bArr2);
                    if (i5 != -1) {
                        byteArrayOutputStream.write(bArr2, 0, i5);
                    } else {
                        string = byteArrayOutputStream.toString("utf-8");
                        byteArrayInputStream.close();
                        try {
                            gZIPInputStream.close();
                            byteArrayOutputStream.close();
                            return string;
                        } catch (Exception e11) {
                            sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "X+sumg6se8KTWfFPgxyHMlL+", 278);
                            Log.e("ARMOR", e11.toString());
                            return string;
                        }
                    }
                }
            } catch (Exception e12) {
                str = string;
                gZIPInputStream2 = gZIPInputStream;
                exc = e12;
                sya.ycx(exc, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "X+sumg6se8KTWfFPgxyHMlL+", 268);
                Log.e("ARMOR", exc.toString());
                if (gZIPInputStream2 != null) {
                    try {
                        gZIPInputStream2.close();
                    } catch (Exception e13) {
                        sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "X+sumg6se8KTWfFPgxyHMlL+", 278);
                        Log.e("ARMOR", e13.toString());
                        return str;
                    }
                }
                if (byteArrayOutputStream != null) {
                    byteArrayOutputStream.close();
                }
                return str;
            } catch (Throwable th4) {
                th2 = th4;
                if (gZIPInputStream != null) {
                    try {
                        gZIPInputStream.close();
                    } catch (Exception e14) {
                        sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5wWrCtJ9z2B", "a+khthGledO1Xt5Rnw==", "X+sumg6se8KTWfFPgxyHMlL+", 278);
                        Log.e("ARMOR", e14.toString());
                        throw th2;
                    }
                }
                if (byteArrayOutputStream != null) {
                    byteArrayOutputStream.close();
                }
                throw th2;
            }
        } catch (Exception e15) {
            byteArrayOutputStream = null;
            exc = e15;
            str = null;
        } catch (Throwable th5) {
            gZIPInputStream = null;
            th2 = th5;
            byteArrayOutputStream = null;
        }
    }
}
