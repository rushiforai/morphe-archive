package aosp.androidx.core.content;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.content.res.XmlResourceParser;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.webkit.MimeTypeMap;
import b.c0;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import j8.a;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.dex */
public class FileProvider extends ContentProvider {

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f15399c = {"_display_name", "_size"};

    /* renamed from: d, reason: collision with root package name */
    public static final File f15400d = new File("/");

    /* renamed from: e, reason: collision with root package name */
    public static final HashMap f15401e = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public String f15402a;

    /* renamed from: b, reason: collision with root package name */
    public a f15403b;

    public static a a(Context context, String str) {
        a aVarC;
        HashMap map = f15401e;
        synchronized (map) {
            try {
                aVarC = (a) map.get(str);
                if (aVarC == null) {
                    try {
                        try {
                            aVarC = c(context, str);
                            map.put(str, aVarC);
                        } catch (IOException e3) {
                            throw new IllegalArgumentException("Failed to parse android.support.FILE_PROVIDER_PATHS meta-data", e3);
                        }
                    } catch (XmlPullParserException e11) {
                        throw new IllegalArgumentException("Failed to parse android.support.FILE_PROVIDER_PATHS meta-data", e11);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return aVarC;
    }

    public static a c(Context context, String str) throws XmlPullParserException, IOException {
        a aVar = new a(str);
        ProviderInfo providerInfoResolveContentProvider = context.getPackageManager().resolveContentProvider(str, 128);
        if (providerInfoResolveContentProvider == null) {
            throw new IllegalArgumentException(c0.k("Couldn't find meta-data for provider with authority ", str));
        }
        XmlResourceParser xmlResourceParserLoadXmlMetaData = providerInfoResolveContentProvider.loadXmlMetaData(context.getPackageManager(), "android.support.FILE_PROVIDER_PATHS");
        if (xmlResourceParserLoadXmlMetaData == null) {
            throw new IllegalArgumentException("Missing android.support.FILE_PROVIDER_PATHS meta-data");
        }
        while (true) {
            int next = xmlResourceParserLoadXmlMetaData.next();
            if (next == 1) {
                return aVar;
            }
            if (next == 2) {
                String name = xmlResourceParserLoadXmlMetaData.getName();
                File externalCacheDir = null;
                String attributeValue = xmlResourceParserLoadXmlMetaData.getAttributeValue(null, PendingUpgradeStore.KEY_NAME);
                String attributeValue2 = xmlResourceParserLoadXmlMetaData.getAttributeValue(null, "path");
                if ("root-path".equals(name)) {
                    externalCacheDir = f15400d;
                } else if ("files-path".equals(name)) {
                    externalCacheDir = context.getFilesDir();
                } else if ("cache-path".equals(name)) {
                    externalCacheDir = context.getCacheDir();
                } else if ("external-path".equals(name)) {
                    externalCacheDir = Environment.getExternalStorageDirectory();
                } else if ("external-files-path".equals(name)) {
                    File[] externalFilesDirs = context.getExternalFilesDirs(null);
                    if (externalFilesDirs.length > 0) {
                        externalCacheDir = externalFilesDirs[0];
                    }
                } else if ("external-cache-path".equals(name)) {
                    externalCacheDir = context.getExternalCacheDir();
                } else if ("external-media-path".equals(name)) {
                    File[] externalMediaDirs = context.getExternalMediaDirs();
                    if (externalMediaDirs.length > 0) {
                        externalCacheDir = externalMediaDirs[0];
                    }
                }
                if (externalCacheDir != null) {
                    String str2 = new String[]{attributeValue2}[0];
                    if (str2 != null) {
                        externalCacheDir = new File(externalCacheDir, str2);
                    }
                    aVar.a(externalCacheDir, attributeValue);
                }
            }
        }
    }

    @Override // android.content.ContentProvider
    public final void attachInfo(Context context, ProviderInfo providerInfo) {
        super.attachInfo(context, providerInfo);
        if (providerInfo.exported) {
            throw new SecurityException("Provider must not be exported");
        }
        if (!providerInfo.grantUriPermissions) {
            throw new SecurityException("Provider must grant uri permissions");
        }
        this.f15402a = providerInfo.authority;
    }

    public final a b() {
        synchronized (this.f15402a) {
            try {
                if (this.f15403b == null) {
                    this.f15403b = a(getContext(), this.f15402a);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return this.f15403b;
    }

    @Override // android.content.ContentProvider
    public final int delete(Uri uri, String str, String[] strArr) {
        return b().b(uri).delete() ? 1 : 0;
    }

    @Override // android.content.ContentProvider
    public final String getType(Uri uri) throws IOException {
        File fileB = b().b(uri);
        int iLastIndexOf = fileB.getName().lastIndexOf(46);
        if (iLastIndexOf < 0) {
            return "application/octet-stream";
        }
        String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileB.getName().substring(iLastIndexOf + 1));
        return mimeTypeFromExtension != null ? mimeTypeFromExtension : "application/octet-stream";
    }

    @Override // android.content.ContentProvider
    public final Uri insert(Uri uri, ContentValues contentValues) {
        throw new UnsupportedOperationException("No external inserts");
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        return true;
    }

    @Override // android.content.ContentProvider
    public final ParcelFileDescriptor openFile(Uri uri, String str) throws IOException {
        int i5;
        File fileB = b().b(uri);
        if ("r".equals(str)) {
            i5 = 268435456;
        } else if ("w".equals(str) || "wt".equals(str)) {
            i5 = 738197504;
        } else if ("wa".equals(str)) {
            i5 = 704643072;
        } else if ("rw".equals(str)) {
            i5 = 939524096;
        } else {
            if (!"rwt".equals(str)) {
                throw new IllegalArgumentException(c0.k("Invalid mode: ", str));
            }
            i5 = 1006632960;
        }
        return ParcelFileDescriptor.open(fileB, i5);
    }

    @Override // android.content.ContentProvider
    public final Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) throws IOException {
        File fileB = b().b(uri);
        if (strArr == null) {
            strArr = f15399c;
        }
        String[] strArr3 = new String[strArr.length];
        Object[] objArr = new Object[strArr.length];
        int i5 = 0;
        for (String str3 : strArr) {
            if ("_display_name".equals(str3)) {
                strArr3[i5] = "_display_name";
                String name = fileB.getName();
                String queryParameter = uri.getQueryParameter("shareName");
                if (!TextUtils.isEmpty(queryParameter)) {
                    name = queryParameter;
                }
                objArr[i5] = name;
                i5++;
            } else if ("_size".equals(str3)) {
                strArr3[i5] = "_size";
                objArr[i5] = Long.valueOf(fileB.length());
                i5++;
            }
        }
        String[] strArr4 = new String[i5];
        System.arraycopy(strArr3, 0, strArr4, 0, i5);
        Object[] objArr2 = new Object[i5];
        System.arraycopy(objArr, 0, objArr2, 0, i5);
        MatrixCursor matrixCursor = new MatrixCursor(strArr4, 1);
        matrixCursor.addRow(objArr2);
        return matrixCursor;
    }

    @Override // android.content.ContentProvider
    public final int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        throw new UnsupportedOperationException("No external updates");
    }
}
