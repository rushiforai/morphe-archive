package o4;

import android.net.Uri;
import android.text.TextUtils;
import b.c0;
import h6.c1;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public final class c implements b {

    /* renamed from: a, reason: collision with root package name */
    public final String f79515a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f79516b = new HashMap();

    public c(String str) {
        this.f79515a = str;
    }

    public static boolean b(String str, String str2) {
        String strAccess$000 = d.access$000(str);
        String strAccess$0002 = d.access$000(str2);
        if (strAccess$000.equals(strAccess$0002)) {
            return true;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(strAccess$0002);
        sb2.append('/');
        return strAccess$000.startsWith(sb2.toString());
    }

    public final void a(File file, String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("Name must not be empty");
        }
        try {
            this.f79516b.put(str, file.getCanonicalFile());
        } catch (IOException e3) {
            throw new IllegalArgumentException(c1.q(file, "Failed to resolve canonical path for "), e3);
        }
    }

    public final File c(Uri uri) {
        String encodedPath = uri.getEncodedPath();
        int iIndexOf = encodedPath.indexOf(47, 1);
        String strDecode = Uri.decode(encodedPath.substring(1, iIndexOf));
        String strDecode2 = Uri.decode(encodedPath.substring(iIndexOf + 1));
        File file = (File) this.f79516b.get(strDecode);
        if (file == null) {
            throw new IllegalArgumentException(c1.p(uri, "Unable to find configured root for "));
        }
        File file2 = new File(file, strDecode2);
        try {
            File canonicalFile = file2.getCanonicalFile();
            if (b(canonicalFile.getPath(), file.getPath())) {
                return canonicalFile;
            }
            throw new SecurityException("Resolved path jumped beyond configured root");
        } catch (IOException unused) {
            throw new IllegalArgumentException(c1.q(file2, "Failed to resolve canonical path for "));
        }
    }

    public final Uri d(File file) throws IOException {
        try {
            String canonicalPath = file.getCanonicalPath();
            Map.Entry entry = null;
            for (Map.Entry entry2 : this.f79516b.entrySet()) {
                String path = ((File) entry2.getValue()).getPath();
                if (b(canonicalPath, path) && (entry == null || path.length() > ((File) entry.getValue()).getPath().length())) {
                    entry = entry2;
                }
            }
            if (entry == null) {
                throw new IllegalArgumentException(c0.k("Failed to find configured root that contains ", canonicalPath));
            }
            String path2 = ((File) entry.getValue()).getPath();
            return new Uri.Builder().scheme("content").authority(this.f79515a).encodedPath(Uri.encode((String) entry.getKey()) + '/' + Uri.encode(path2.endsWith("/") ? canonicalPath.substring(path2.length()) : canonicalPath.substring(path2.length() + 1), "/")).build();
        } catch (IOException unused) {
            throw new IllegalArgumentException(c1.q(file, "Failed to resolve canonical path for "));
        }
    }
}
