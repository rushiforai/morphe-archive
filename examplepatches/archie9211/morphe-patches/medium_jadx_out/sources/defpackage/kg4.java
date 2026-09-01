package defpackage;

import android.os.AsyncTask;
import com.pairip.VMRunner;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class kg4 extends AsyncTask {
    public final String a;
    public final File b;
    public final jg4 c;

    public kg4(String str, File file, jg4 jg4Var) {
        str.getClass();
        this.a = str;
        this.b = file;
        this.c = jg4Var;
    }

    public final Boolean a(String... strArr) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            strArr.getClass();
            try {
                URL url = new URL(this.a);
                int contentLength = url.openConnection().getContentLength();
                DataInputStream dataInputStream = new DataInputStream(url.openStream());
                byte[] bArr = new byte[contentLength];
                dataInputStream.readFully(bArr);
                dataInputStream.close();
                DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(this.b));
                dataOutputStream.write(bArr);
                dataOutputStream.flush();
                dataOutputStream.close();
                return Boolean.TRUE;
            } catch (Exception unused) {
                return Boolean.FALSE;
            }
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return VMRunner.invoke("6iK0Rri3MvEWTCmY", new Object[]{this, objArr});
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            boolean zBooleanValue = ((Boolean) obj).booleanValue();
            if (!set.contains(this) && zBooleanValue) {
                try {
                    this.c.b(this.b);
                } catch (Throwable th) {
                    ec2.a(this, th);
                }
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }
}
