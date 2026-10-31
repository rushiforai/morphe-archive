package r8;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.VectorDrawable;
import android.net.Uri;
import android.os.Parcelable;
import android.util.TypedValue;
import android.webkit.MimeTypeMap;
import e10.y2;
import e10.z2;
import h6.c1;
import java.io.IOException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.xmlpull.v1.XmlPullParserException;
import p10.c0;
import ps.e0;
import x8.o;

/* loaded from: classes.dex */
public final class c implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85617a;

    /* renamed from: b, reason: collision with root package name */
    public final x8.n f85618b;

    /* renamed from: c, reason: collision with root package name */
    public final Parcelable f85619c;

    public /* synthetic */ c(Parcelable parcelable, x8.n nVar, int i5) {
        this.f85617a = i5;
        this.f85619c = parcelable;
        this.f85618b = nVar;
    }

    @Override // r8.h
    public final Object a(Continuation continuation) throws XmlPullParserException, Resources.NotFoundException, IOException {
        Integer numU0;
        String mimeTypeFromExtension;
        Drawable drawable;
        boolean zEquals;
        int i5 = this.f85617a;
        Parcelable parcelable = this.f85619c;
        x8.n nVar = this.f85618b;
        switch (i5) {
            case 0:
                return new e(2, new BitmapDrawable(nVar.f95352a.getResources(), (Bitmap) parcelable), false);
            default:
                Uri uri = (Uri) parcelable;
                String authority = uri.getAuthority();
                if (authority != null) {
                    if (r70.k.U0(authority)) {
                        authority = null;
                    }
                    if (authority != null) {
                        String str = (String) b70.g.i1(uri.getPathSegments());
                        if (str == null || (numU0 = r70.i.u0(str)) == null) {
                            throw new IllegalStateException(c1.p(uri, "Invalid android.resource URI: "));
                        }
                        int iIntValue = numU0.intValue();
                        Context context = nVar.f95352a;
                        Resources resources = authority.equals(context.getPackageName()) ? context.getResources() : context.getPackageManager().getResourcesForApplication(authority);
                        TypedValue typedValue = new TypedValue();
                        resources.getValue(iIntValue, typedValue, true);
                        CharSequence charSequence = typedValue.string;
                        String string = charSequence.subSequence(r70.k.V0('/', 0, 6, charSequence), charSequence.length()).toString();
                        MimeTypeMap singleton = MimeTypeMap.getSingleton();
                        if (string == null || r70.k.U0(string)) {
                            mimeTypeFromExtension = null;
                        } else {
                            String strS1 = r70.k.s1(r70.k.s1(string, '#'), '?');
                            mimeTypeFromExtension = singleton.getMimeTypeFromExtension(r70.k.n1('.', r70.k.n1('/', strS1, strS1), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                        }
                        if (!Intrinsics.b(mimeTypeFromExtension, "text/xml")) {
                            TypedValue typedValue2 = new TypedValue();
                            return new n(c0.z(x7.f.r(x7.f.V(resources.openRawResource(iIntValue, typedValue2))), context, new o8.l(typedValue2.density)), mimeTypeFromExtension, 3);
                        }
                        if (authority.equals(context.getPackageName())) {
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
                                throw new IllegalStateException("Required value was null.");
                            }
                        }
                        Drawable drawableB0 = z2.B0(drawable, (fz.d) y2.f51877a.i().l());
                        ty.a aVar = ((o) nVar.f95361j.f95366a.get("ResourceUriFetcher.PreserveVectors")) != null ? ty.a.f90094b : null;
                        ty.a aVar2 = aVar != null ? aVar : null;
                        if (aVar2 == null) {
                            aVar2 = ty.a.f90093a;
                        }
                        int iOrdinal = aVar2.ordinal();
                        if (iOrdinal == 0) {
                            zEquals = false;
                        } else if (iOrdinal == 1) {
                            zEquals = authority.equals(context.getPackageName());
                        } else {
                            if (iOrdinal != 2) {
                                throw new NoWhenBranchMatchedException();
                            }
                            zEquals = true;
                        }
                        boolean z11 = (drawableB0 instanceof j7.o) || (drawableB0 instanceof VectorDrawable);
                        if (!zEquals && z11) {
                            drawableB0 = new BitmapDrawable(context.getResources(), e0.k(drawableB0, nVar.f95353b, nVar.f95354c, nVar.f95355d, nVar.f95356e));
                        }
                        return new e(3, drawableB0, z11);
                    }
                }
                throw new IllegalStateException(c1.p(uri, "Invalid android.resource URI: "));
        }
    }
}
