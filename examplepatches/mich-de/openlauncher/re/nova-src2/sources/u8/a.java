package u8;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.Uri;
import c9.g;
import h6.c1;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import r70.k;
import x8.n;
import x80.w;

/* loaded from: classes.dex */
public final class a implements b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90675a;

    public /* synthetic */ a(int i5) {
        this.f90675a = i5;
    }

    @Override // u8.b
    public final Object a(Object obj, n nVar) throws PackageManager.NameNotFoundException {
        String scheme;
        String authority;
        switch (this.f90675a) {
            case 0:
                return ByteBuffer.wrap((byte[]) obj);
            case 1:
                Uri uri = (Uri) obj;
                if (!g.d(uri) && ((scheme = uri.getScheme()) == null || scheme.equals("file"))) {
                    String path = uri.getPath();
                    if (path == null) {
                        path = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    if (k.k1(path, '/') && ((String) b70.g.Y0(uri.getPathSegments())) != null) {
                        if (!Intrinsics.b(uri.getScheme(), "file")) {
                            return new File(uri.toString());
                        }
                        String path2 = uri.getPath();
                        if (path2 != null) {
                            return new File(path2);
                        }
                    }
                }
                return null;
            case 2:
                return ((w) obj).f95633i;
            case 3:
                int iIntValue = ((Number) obj).intValue();
                Context context = nVar.f95352a;
                try {
                    if (context.getResources().getResourceEntryName(iIntValue) != null) {
                        Uri uri2 = Uri.parse("android.resource://" + context.getPackageName() + '/' + iIntValue);
                        Intrinsics.f(uri2, "parse(this)");
                        return uri2;
                    }
                } catch (Resources.NotFoundException unused) {
                }
                return null;
            case 4:
                Uri uri3 = (Uri) obj;
                if (!Intrinsics.b(uri3.getScheme(), "android.resource") || (authority = uri3.getAuthority()) == null || k.U0(authority) || uri3.getPathSegments().size() != 2) {
                    return null;
                }
                String authority2 = uri3.getAuthority();
                if (authority2 == null) {
                    authority2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                Resources resourcesForApplication = nVar.f95352a.getPackageManager().getResourcesForApplication(authority2);
                List<String> pathSegments = uri3.getPathSegments();
                int identifier = resourcesForApplication.getIdentifier(pathSegments.get(1), pathSegments.get(0), authority2);
                if (identifier == 0) {
                    throw new IllegalStateException(c1.p(uri3, "Invalid android.resource URI: ").toString());
                }
                Uri uri4 = Uri.parse("android.resource://" + authority2 + '/' + identifier);
                Intrinsics.f(uri4, "parse(this)");
                return uri4;
            default:
                Uri uri5 = Uri.parse((String) obj);
                Intrinsics.f(uri5, "parse(this)");
                return uri5;
        }
    }
}
