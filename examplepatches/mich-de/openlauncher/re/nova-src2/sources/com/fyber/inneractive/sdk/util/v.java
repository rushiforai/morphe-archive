package com.fyber.inneractive.sdk.util;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.ref.Reference;
import java.nio.ByteBuffer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class v {
    public static byte[] a(InputStream inputStream) throws IOException {
        ByteBuffer byteBufferAllocateDirect = (ByteBuffer) f.f31185b.f31186a.poll();
        if (byteBufferAllocateDirect == null) {
            byteBufferAllocateDirect = ByteBuffer.allocateDirect(ReaderJsonLexerKt.BATCH_SIZE);
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArrArray = (byteBufferAllocateDirect == null || !byteBufferAllocateDirect.hasArray()) ? new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE] : byteBufferAllocateDirect.array();
        while (true) {
            int i5 = inputStream.read(bArrArray, 0, bArrArray.length);
            if (i5 == -1) {
                byteArrayOutputStream.flush();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                b(byteArrayOutputStream);
                f.f31185b.f31186a.offer(byteBufferAllocateDirect);
                return byteArray;
            }
            byteArrayOutputStream.write(bArrArray, 0, i5);
        }
    }

    public static StringBuffer b(InputStream inputStream) throws IOException {
        if (inputStream == null) {
            throw new IllegalArgumentException("stream required");
        }
        ByteBuffer byteBufferAllocateDirect = (ByteBuffer) f.f31185b.f31186a.poll();
        if (byteBufferAllocateDirect == null) {
            byteBufferAllocateDirect = ByteBuffer.allocateDirect(ReaderJsonLexerKt.BATCH_SIZE);
        }
        StringBuffer stringBuffer = new StringBuffer();
        byte[] bArrArray = (byteBufferAllocateDirect == null || !byteBufferAllocateDirect.hasArray()) ? new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE] : byteBufferAllocateDirect.array();
        int i5 = 0;
        while (i5 != -1) {
            stringBuffer.append(new String(bArrArray, 0, i5));
            i5 = inputStream.read(bArrArray);
        }
        f.f31185b.f31186a.offer(byteBufferAllocateDirect);
        return stringBuffer;
    }

    public static void b(Closeable closeable) throws IOException {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException unused) {
        }
    }

    public static String b(Throwable th2) {
        try {
            StringWriter stringWriter = new StringWriter();
            th2.printStackTrace(new PrintWriter(stringWriter));
            return "------\r\n" + stringWriter.toString() + "------\r\n";
        } catch (Exception unused) {
            return "bad stackToString";
        }
    }

    public static void a(InputStream inputStream, FileOutputStream fileOutputStream) throws IOException {
        if (inputStream != null) {
            byte[] bArr = new byte[SQLiteDatabase.OPEN_FULLMUTEX];
            int i5 = 0;
            while (true) {
                int i11 = inputStream.read(bArr);
                if (i11 != -1) {
                    i5 += i11;
                    fileOutputStream.write(bArr, 0, i11);
                } else {
                    IAlog.a("Copied stream content length = %d", Integer.valueOf(i5));
                    return;
                }
            }
        } else {
            throw new IOException("Unable to copy from or to a null stream.");
        }
    }

    public static void a(View view) {
        if (view == null || view.getParent() == null) {
            return;
        }
        try {
            if (view.getParent() instanceof ViewGroup) {
                ((ViewGroup) view.getParent()).removeView(view);
            }
        } catch (Exception unused) {
        }
    }

    public static RelativeLayout.LayoutParams a(int i5, int i11, int... iArr) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i5, i11);
        if (iArr.length > 0) {
            for (int i12 : iArr) {
                layoutParams.addRule(i12);
            }
        }
        return layoutParams;
    }

    public static Object a(Reference reference) {
        if (reference == null) {
            return null;
        }
        return reference.get();
    }

    public static int a(String str, int i5) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException unused) {
            }
        }
        return i5;
    }

    public static void a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable unused) {
            }
        }
    }

    public static int a(int i5, int i11) {
        return Integer.compare(i5, i11);
    }

    public static String a(Throwable th2) {
        String message;
        if (th2 == null) {
            return null;
        }
        do {
            message = th2.getMessage();
            th2 = th2.getCause();
        } while (th2 != null);
        return message;
    }

    public static boolean a(String str) {
        return (TextUtils.isEmpty(str) || str.trim().isEmpty()) ? false : true;
    }

    public static String a(JSONObject jSONObject, String str) {
        return (jSONObject == null || jSONObject.isNull(str)) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : jSONObject.optString(str);
    }
}
