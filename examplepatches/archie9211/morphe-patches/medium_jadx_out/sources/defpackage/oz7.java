package defpackage;

import android.util.Log;
import androidx.work.impl.yX.VrhD;
import com.drew.metadata.mov.QuickTimeAtomTypes;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class oz7 {
    public static final Charset b = Charset.forName("UTF-8");
    public final bh4 a;

    public oz7(bh4 bh4Var) {
        this.a = bh4Var;
    }

    public static HashMap a(String str) {
        JSONObject jSONObject = new JSONObject(str);
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strOptString = null;
            if (!jSONObject.isNull(next)) {
                strOptString = jSONObject.optString(next, null);
            }
            map.put(next, strOptString);
        }
        return map;
    }

    public static ArrayList b(String str) throws JSONException {
        JSONArray jSONArray = new JSONObject(str).getJSONArray("rolloutsState");
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            String string = jSONArray.getString(i);
            try {
                arrayList.add(wkb.a(string));
            } catch (Exception e) {
                Log.w("FirebaseCrashlytics", "Failed de-serializing rollouts state. " + string, e);
            }
        }
        return arrayList;
    }

    public static String e(List list) {
        HashMap map = new HashMap();
        JSONArray jSONArray = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            try {
                jSONArray.put(new JSONObject(wkb.a.I(list.get(i))));
            } catch (JSONException e) {
                Log.w("FirebaseCrashlytics", "Exception parsing rollout assignment!", e);
            }
        }
        map.put("rolloutsState", jSONArray);
        return new JSONObject(map).toString();
    }

    public static void f(File file) {
        if (file.exists() && file.delete()) {
            Log.i("FirebaseCrashlytics", "Deleted corrupt file: " + file.getAbsolutePath(), null);
        }
    }

    public static void g(File file, String str) {
        if (file.exists() && file.delete()) {
            Log.i("FirebaseCrashlytics", lv8.r("Deleted corrupt file: ", file.getAbsolutePath(), "\nReason: ", str), null);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v2 */
    /* JADX WARN: Type inference failed for: r7v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r8v4, types: [int] */
    public final Map c(String str, boolean z) throws Throwable {
        ?? r8;
        FileInputStream fileInputStream;
        Exception e;
        bh4 bh4Var = this.a;
        File fileB = z ? bh4Var.b(str, "internal-keys") : bh4Var.b(str, QuickTimeAtomTypes.ATOM_KEYS);
        if (!fileB.exists() || fileB.length() == 0) {
            g(fileB, "The file has a length of zero for session: " + str);
            return Collections.EMPTY_MAP;
        }
        ?? r7 = 0;
        try {
            try {
                fileInputStream = new FileInputStream(fileB);
                try {
                    HashMap mapA = a(gx1.c0(fileInputStream));
                    gx1.D(fileInputStream, "Failed to close user metadata file.");
                    return mapA;
                } catch (Exception e2) {
                    e = e2;
                    Log.w("FirebaseCrashlytics", "Error deserializing user metadata.", e);
                    f(fileB);
                    gx1.D(fileInputStream, "Failed to close user metadata file.");
                    return Collections.EMPTY_MAP;
                }
            } catch (Throwable th) {
                th = th;
                r7 = r8;
                gx1.D(r7, "Failed to close user metadata file.");
                throw th;
            }
        } catch (Exception e3) {
            fileInputStream = null;
            e = e3;
        } catch (Throwable th2) {
            th = th2;
            gx1.D(r7, "Failed to close user metadata file.");
            throw th;
        }
    }

    public final void i(String str, String str2) {
        String string;
        BufferedWriter bufferedWriter;
        File fileB = this.a.b(str, "user-data");
        BufferedWriter bufferedWriter2 = null;
        try {
            try {
                nz7 nz7Var = new nz7();
                nz7Var.put("userId", str2);
                string = nz7Var.toString();
                bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileB), b));
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            bufferedWriter.write(string);
            bufferedWriter.flush();
            gx1.D(bufferedWriter, "Failed to close user metadata file.");
        } catch (Exception e2) {
            e = e2;
            bufferedWriter2 = bufferedWriter;
            Log.w("FirebaseCrashlytics", "Error serializing user metadata.", e);
            gx1.D(bufferedWriter2, "Failed to close user metadata file.");
        } catch (Throwable th2) {
            th = th2;
            bufferedWriter2 = bufferedWriter;
            gx1.D(bufferedWriter2, "Failed to close user metadata file.");
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v2, types: [int] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.io.Closeable] */
    public final String d(String str) throws Throwable {
        FileInputStream fileInputStream;
        File fileB = this.a.b(str, "user-data");
        boolean zExists = fileB.exists();
        String str2 = AEVqIoD.WZRXW;
        ?? r5 = 0;
        if (zExists) {
            ?? r2 = (fileB.length() > 0L ? 1 : (fileB.length() == 0L ? 0 : -1));
            try {
                if (r2 != 0) {
                    try {
                        fileInputStream = new FileInputStream(fileB);
                        try {
                            JSONObject jSONObject = new JSONObject(gx1.c0(fileInputStream));
                            String strOptString = !jSONObject.isNull("userId") ? jSONObject.optString("userId", null) : null;
                            String str3 = "Loaded userId " + strOptString + " for session " + str;
                            if (Log.isLoggable(str2, 3)) {
                                Log.d(str2, str3, null);
                            }
                            gx1.D(fileInputStream, "Failed to close user metadata file.");
                            return strOptString;
                        } catch (Exception e) {
                            e = e;
                            Log.w(str2, "Error deserializing user metadata.", e);
                            f(fileB);
                            gx1.D(fileInputStream, "Failed to close user metadata file.");
                            return null;
                        }
                    } catch (Exception e2) {
                        e = e2;
                        fileInputStream = null;
                    } catch (Throwable th) {
                        th = th;
                        gx1.D(r5, "Failed to close user metadata file.");
                        throw th;
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                r5 = r2;
            }
        }
        String strR = ka1.r("No userId set for session ", str);
        if (Log.isLoggable(str2, 3)) {
            Log.d(str2, strR, null);
        }
        f(fileB);
        return null;
    }

    public final void h(String str, Map map, boolean z) {
        BufferedWriter bufferedWriter;
        Exception e;
        bh4 bh4Var = this.a;
        File fileB = z ? bh4Var.b(str, VrhD.QNArkLCLyTDZ) : bh4Var.b(str, QuickTimeAtomTypes.ATOM_KEYS);
        BufferedWriter bufferedWriter2 = null;
        try {
            String string = new JSONObject(map).toString();
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileB), b));
            try {
                try {
                    bufferedWriter.write(string);
                    bufferedWriter.flush();
                    gx1.D(bufferedWriter, "Failed to close key/value metadata file.");
                } catch (Exception e2) {
                    e = e2;
                    Log.w("FirebaseCrashlytics", "Error serializing key/value metadata.", e);
                    f(fileB);
                    gx1.D(bufferedWriter, "Failed to close key/value metadata file.");
                }
            } catch (Throwable th) {
                th = th;
                bufferedWriter2 = bufferedWriter;
                gx1.D(bufferedWriter2, "Failed to close key/value metadata file.");
                throw th;
            }
        } catch (Exception e3) {
            bufferedWriter = null;
            e = e3;
        } catch (Throwable th2) {
            th = th2;
            gx1.D(bufferedWriter2, "Failed to close key/value metadata file.");
            throw th;
        }
    }
}
