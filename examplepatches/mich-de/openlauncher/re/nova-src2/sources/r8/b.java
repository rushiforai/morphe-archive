package r8;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.VectorDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.webkit.MimeTypeMap;
import e10.z2;
import h6.c1;
import j7.o;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import m90.d0;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import org.xmlpull.v1.XmlPullParserException;
import p10.c0;

/* loaded from: classes2.dex */
public final class b implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85614a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f85615b;

    /* renamed from: c, reason: collision with root package name */
    public final x8.n f85616c;

    public /* synthetic */ b(Uri uri, x8.n nVar, int i5) {
        this.f85614a = i5;
        this.f85615b = uri;
        this.f85616c = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:87:0x01ea  */
    @Override // r8.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) throws XmlPullParserException, Resources.NotFoundException, IOException {
        InputStream inputStreamOpenInputStream;
        List<String> pathSegments;
        int size;
        Bundle bundle;
        Integer numU0;
        Drawable drawable;
        int i5 = this.f85614a;
        Uri uri = this.f85615b;
        x8.n nVar = this.f85616c;
        boolean z11 = true;
        switch (i5) {
            case 0:
                String strF1 = b70.g.f1(b70.g.Q0(uri.getPathSegments(), 1), "/", null, null, 0, null, 62);
                return new n(c0.z(x7.f.r(x7.f.V(nVar.f95352a.getAssets().open(strF1))), nVar.f95352a, new o8.a()), c9.g.b(MimeTypeMap.getSingleton(), strF1), 3);
            case 1:
                ContentResolver contentResolver = nVar.f95352a.getContentResolver();
                if (Intrinsics.b(uri.getAuthority(), Pkgs.CONTACTS_DEFAULT) && Intrinsics.b(uri.getLastPathSegment(), "display_photo")) {
                    AssetFileDescriptor assetFileDescriptorOpenAssetFileDescriptor = contentResolver.openAssetFileDescriptor(uri, "r");
                    inputStreamOpenInputStream = assetFileDescriptorOpenAssetFileDescriptor != null ? assetFileDescriptorOpenAssetFileDescriptor.createInputStream() : null;
                    if (inputStreamOpenInputStream == null) {
                        throw new IllegalStateException(("Unable to find a contact photo associated with '" + uri + "'.").toString());
                    }
                } else if (Build.VERSION.SDK_INT >= 29 && Intrinsics.b(uri.getAuthority(), "media") && (size = (pathSegments = uri.getPathSegments()).size()) >= 3 && Intrinsics.b(pathSegments.get(size - 3), "audio") && Intrinsics.b(pathSegments.get(size - 2), "albums")) {
                    y8.f fVar = nVar.f95354c;
                    v4.a aVar = fVar.f96845a;
                    y8.a aVar2 = aVar instanceof y8.a ? (y8.a) aVar : null;
                    if (aVar2 != null) {
                        int i11 = aVar2.f96839d;
                        v4.a aVar3 = fVar.f96846b;
                        y8.a aVar4 = aVar3 instanceof y8.a ? (y8.a) aVar3 : null;
                        if (aVar4 != null) {
                            int i12 = aVar4.f96839d;
                            bundle = new Bundle(1);
                            bundle.putParcelable("android.content.extra.SIZE", new Point(i11, i12));
                        } else {
                            bundle = null;
                        }
                        AssetFileDescriptor assetFileDescriptorOpenTypedAssetFile = contentResolver.openTypedAssetFile(uri, "image/*", bundle, null);
                        inputStreamOpenInputStream = assetFileDescriptorOpenTypedAssetFile != null ? assetFileDescriptorOpenTypedAssetFile.createInputStream() : null;
                        if (inputStreamOpenInputStream == null) {
                            throw new IllegalStateException(("Unable to find a music thumbnail associated with '" + uri + "'.").toString());
                        }
                    }
                } else {
                    inputStreamOpenInputStream = contentResolver.openInputStream(uri);
                    if (inputStreamOpenInputStream == null) {
                        throw new IllegalStateException(("Unable to open '" + uri + "'.").toString());
                    }
                }
                return new n(c0.z(x7.f.r(x7.f.V(inputStreamOpenInputStream)), nVar.f95352a, new o8.a()), contentResolver.getType(uri), 3);
            default:
                String authority = uri.getAuthority();
                if (authority != null) {
                    String str = r70.k.U0(authority) ? null : authority;
                    if (str != null) {
                        String str2 = (String) b70.g.i1(uri.getPathSegments());
                        if (str2 == null || (numU0 = r70.i.u0(str2)) == null) {
                            throw new IllegalStateException(c1.p(uri, "Invalid android.resource URI: "));
                        }
                        int iIntValue = numU0.intValue();
                        Context context = nVar.f95352a;
                        Resources resources = str.equals(context.getPackageName()) ? context.getResources() : context.getPackageManager().getResourcesForApplication(str);
                        TypedValue typedValue = new TypedValue();
                        resources.getValue(iIntValue, typedValue, true);
                        CharSequence charSequence = typedValue.string;
                        String strB = c9.g.b(MimeTypeMap.getSingleton(), charSequence.subSequence(r70.k.V0('/', 0, 6, charSequence), charSequence.length()).toString());
                        if (!Intrinsics.b(strB, "text/xml")) {
                            TypedValue typedValue2 = new TypedValue();
                            d0 d0VarR = x7.f.r(x7.f.V(resources.openRawResource(iIntValue, typedValue2)));
                            o8.l lVar = new o8.l(typedValue2.density);
                            File cacheDir = context.getCacheDir();
                            cacheDir.mkdirs();
                            return new n(new o8.m(d0VarR, cacheDir, lVar), strB, 3);
                        }
                        if (str.equals(context.getPackageName())) {
                            drawable = z2.b0(context, iIntValue);
                            if (drawable == null) {
                                throw new IllegalStateException(b.c0.h(iIntValue, "Invalid resource ID: ").toString());
                            }
                        } else {
                            XmlResourceParser xml = resources.getXml(iIntValue);
                            int next = xml.next();
                            while (next != 2 && next != 1) {
                                next = xml.next();
                            }
                            if (next != 2) {
                                throw new XmlPullParserException("No start tag found.");
                            }
                            Resources.Theme theme = context.getTheme();
                            ThreadLocal threadLocal = q4.k.f83638a;
                            drawable = resources.getDrawable(iIntValue, theme);
                            if (drawable == null) {
                                throw new IllegalStateException(b.c0.h(iIntValue, "Invalid resource ID: ").toString());
                            }
                        }
                        if (!(drawable instanceof VectorDrawable) && !(drawable instanceof o)) {
                            z11 = false;
                        }
                        if (z11) {
                            drawable = new BitmapDrawable(context.getResources(), android.support.v4.media.session.b.G(drawable, nVar.f95353b, nVar.f95354c, nVar.f95355d, nVar.f95356e));
                        }
                        return new e(3, drawable, z11);
                    }
                }
                throw new IllegalStateException(c1.p(uri, "Invalid android.resource URI: "));
        }
    }
}
