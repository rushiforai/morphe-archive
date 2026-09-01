package defpackage;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import androidx.core.content.FileProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ip extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ s26 c;
    public final /* synthetic */ Bitmap d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ip(s26 s26Var, Bitmap bitmap, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = s26Var;
        this.d = bitmap;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Bitmap bitmap = this.d;
        s26 s26Var = this.c;
        switch (i) {
            case 0:
                return new ip(s26Var, bitmap, n92Var, 0);
            default:
                return new ip(s26Var, bitmap, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((ip) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws IOException {
        FileOutputStream fileOutputStream;
        OutputStream outputStreamOpenOutputStream;
        int i = this.b;
        Bitmap bitmap = this.d;
        s26 s26Var = this.c;
        Boolean boolValueOf = null;
        switch (i) {
            case 0:
                br7.v(obj);
                Context context = (Context) s26Var.b;
                new File(context.getCacheDir().getPath(), "images").mkdirs();
                File externalFilesDir = context.getExternalFilesDir(Environment.DIRECTORY_PICTURES);
                if (externalFilesDir == null) {
                    ay0.e("External files directory is null");
                    return null;
                }
                File file = new File(b09.y(externalFilesDir.getAbsolutePath(), File.separator, "shared_image.jpg"));
                fileOutputStream = new FileOutputStream(file);
                try {
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 90, fileOutputStream);
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    return FileProvider.c(context, "com.medium.reader.fileprovider", file);
                } finally {
                }
            default:
                br7.v(obj);
                ContentResolver contentResolver = ((Context) s26Var.b).getContentResolver();
                String strX = b09.x("img_", ".jpg", System.currentTimeMillis());
                if (Build.VERSION.SDK_INT >= 29) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("_display_name", strX);
                    contentValues.put("mime_type", "image/jpeg");
                    contentValues.put("relative_path", "Pictures/Medium/");
                    Uri uriInsert = contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues);
                    if (uriInsert != null && (outputStreamOpenOutputStream = contentResolver.openOutputStream(uriInsert)) != null) {
                        try {
                            boolValueOf = Boolean.valueOf(bitmap.compress(Bitmap.CompressFormat.JPEG, 90, outputStreamOpenOutputStream));
                            outputStreamOpenOutputStream.close();
                        } catch (Throwable th) {
                            try {
                                throw th;
                            } catch (Throwable th2) {
                                k50.X(outputStreamOpenOutputStream, th);
                                throw th2;
                            }
                        }
                    }
                } else {
                    String strY = b09.y(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString(), File.separator, strX);
                    File file2 = new File(strY);
                    if (!file2.exists()) {
                        file2.mkdir();
                    }
                    fileOutputStream = new FileOutputStream(new File(strY, strX));
                    try {
                        boolValueOf = Boolean.valueOf(bitmap.compress(Bitmap.CompressFormat.JPEG, 90, fileOutputStream));
                        fileOutputStream.close();
                    } finally {
                    }
                }
                return boolValueOf;
        }
    }
}
