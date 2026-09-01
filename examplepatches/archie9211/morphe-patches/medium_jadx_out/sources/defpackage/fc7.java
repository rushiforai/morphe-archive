package defpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.util.Base64;
import com.drew.imaging.eps.ld.PdtluglzAX;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class fc7 {
    public static final HashMap a = new HashMap();
    public static final HashSet b = new HashSet();
    public static final byte[] c = {80, 75, 3, 4};
    public static final byte[] d = {31, -117, 8};

    public static vc7 a(td6 td6Var, String str, boolean z) {
        bc7 bc7VarA;
        try {
            if (str == null) {
                bc7VarA = null;
            } else {
                try {
                    bc7VarA = cc7.b.a(str);
                } catch (Exception e) {
                    vc7 vc7Var = new vc7(e);
                    if (z) {
                        gpe.b(td6Var);
                    }
                    return vc7Var;
                }
            }
            if (bc7VarA != null) {
                vc7 vc7Var2 = new vc7(bc7VarA);
                if (z) {
                    gpe.b(td6Var);
                }
                return vc7Var2;
            }
            bc7 bc7VarA2 = gc7.a(td6Var);
            if (str != null) {
                cc7.b.a.l(str, bc7VarA2);
            }
            vc7 vc7Var3 = new vc7(bc7VarA2);
            if (z) {
                gpe.b(td6Var);
            }
            return vc7Var3;
        } catch (Throwable th) {
            if (z) {
                gpe.b(td6Var);
            }
            throw th;
        }
    }

    public static Boolean c(yua yuaVar, byte[] bArr) {
        try {
            yua yuaVarPeek = yuaVar.peek();
            for (byte b2 : bArr) {
                if (yuaVarPeek.readByte() != b2) {
                    return Boolean.FALSE;
                }
            }
            yuaVarPeek.close();
            return Boolean.TRUE;
        } catch (Exception unused) {
            h87.a.getClass();
            t90 t90Var = xn6.a;
            return Boolean.FALSE;
        } catch (NoSuchMethodError unused2) {
            return Boolean.FALSE;
        }
    }

    public static void d() {
        ArrayList arrayList = new ArrayList(b);
        if (arrayList.size() <= 0) {
            return;
        }
        arrayList.get(0).getClass();
        rd6.m();
    }

    public static vc7 b(Context context, ZipInputStream zipInputStream, String str) {
        bc7 bc7VarA;
        tc7 tc7Var;
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        if (str == null) {
            bc7VarA = null;
        } else {
            try {
                bc7VarA = cc7.b.a(str);
            } catch (IOException e) {
                return new vc7(e);
            }
        }
        if (bc7VarA != null) {
            return new vc7(bc7VarA);
        }
        ZipEntry nextEntry = zipInputStream.getNextEntry();
        bc7 bc7Var = null;
        while (nextEntry != null) {
            String name = nextEntry.getName();
            if (name.contains("__MACOSX")) {
                zipInputStream.closeEntry();
            } else if (nextEntry.getName().equalsIgnoreCase("manifest.json")) {
                zipInputStream.closeEntry();
            } else if (nextEntry.getName().contains(".json")) {
                yua yuaVar = new yua(vo7.N(zipInputStream));
                String[] strArr = id6.e;
                bc7Var = a(new td6(yuaVar), null, false).a;
            } else if (name.contains(".png") || name.contains(".webp") || name.contains(".jpg") || name.contains(".jpeg")) {
                String[] strArrSplit = name.split("/");
                map.put(strArrSplit[strArrSplit.length - 1], BitmapFactory.decodeStream(zipInputStream));
            } else if (name.contains(".ttf") || name.contains(".otf")) {
                String[] strArrSplit2 = name.split("/");
                String str2 = strArrSplit2[strArrSplit2.length - 1];
                String str3 = str2.split("\\.")[0];
                if (context == null) {
                    return new vc7(new IllegalStateException("Unable to extract font " + str3 + " please pass a non-null Context parameter"));
                }
                File file = new File(context.getCacheDir(), str2);
                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    try {
                        FileOutputStream fileOutputStream2 = new FileOutputStream(file);
                        try {
                            byte[] bArr = new byte[4096];
                            while (true) {
                                int i = zipInputStream.read(bArr);
                                if (i == -1) {
                                    break;
                                }
                                fileOutputStream2.write(bArr, 0, i);
                            }
                            fileOutputStream2.flush();
                            fileOutputStream2.close();
                            fileOutputStream.close();
                        } catch (Throwable th) {
                            try {
                                fileOutputStream2.close();
                            } catch (Throwable th2) {
                                th.addSuppressed(th2);
                            }
                            throw th;
                        }
                    } finally {
                    }
                } catch (Throwable th3) {
                    h87.b("Unable to save font " + str3 + " to the temporary file: " + str2 + ". ", th3);
                }
                Typeface typefaceCreateFromFile = Typeface.createFromFile(file);
                if (!file.delete()) {
                    h87.a("Failed to delete temp font file " + file.getAbsolutePath() + ".");
                }
                map2.put(str3, typefaceCreateFromFile);
            } else {
                zipInputStream.closeEntry();
            }
            nextEntry = zipInputStream.getNextEntry();
        }
        if (bc7Var == null) {
            return new vc7(new IllegalArgumentException("Unable to parse composition"));
        }
        for (Map.Entry entry : map.entrySet()) {
            String str4 = (String) entry.getKey();
            Iterator it2 = ((HashMap) bc7Var.c()).values().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    tc7Var = null;
                    break;
                }
                tc7Var = (tc7) it2.next();
                if (tc7Var.d.equals(str4)) {
                    break;
                }
            }
            if (tc7Var != null) {
                tc7Var.f = gpe.d((Bitmap) entry.getValue(), tc7Var.a, tc7Var.b);
            }
        }
        for (Map.Entry entry2 : map2.entrySet()) {
            boolean z = false;
            for (vy4 vy4Var : bc7Var.f.values()) {
                if (vy4Var.a.equals(entry2.getKey())) {
                    vy4Var.d = (Typeface) entry2.getValue();
                    z = true;
                }
            }
            if (!z) {
                h87.a("Parsed font for " + ((String) entry2.getKey()) + " however it was not found in the animation.");
            }
        }
        if (map.isEmpty()) {
            Iterator it3 = ((HashMap) bc7Var.c()).entrySet().iterator();
            while (it3.hasNext()) {
                tc7 tc7Var2 = (tc7) ((Map.Entry) it3.next()).getValue();
                if (tc7Var2 == null) {
                    return null;
                }
                String str5 = tc7Var2.d;
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inScaled = true;
                options.inDensity = 160;
                if (str5.startsWith("data:") && str5.indexOf("base64,") > 0) {
                    try {
                        byte[] bArrDecode = Base64.decode(str5.substring(str5.indexOf(44) + 1), 0);
                        Bitmap bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length, options);
                        if (bitmapDecodeByteArray != null) {
                            tc7Var2.f = gpe.d(bitmapDecodeByteArray, tc7Var2.a, tc7Var2.b);
                        }
                    } catch (IllegalArgumentException e2) {
                        h87.b(PdtluglzAX.JHZk, e2);
                        return null;
                    }
                }
            }
        }
        if (str != null) {
            cc7.b.a.l(str, bc7Var);
        }
        return new vc7(bc7Var);
    }
}
