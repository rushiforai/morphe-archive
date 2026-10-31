package q4;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.util.Log;
import android.util.TypedValue;
import java.io.IOException;
import java.util.WeakHashMap;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f83638a = new ThreadLocal();

    /* renamed from: b, reason: collision with root package name */
    public static final WeakHashMap f83639b = new WeakHashMap(0);

    /* renamed from: c, reason: collision with root package name */
    public static final Object f83640c = new Object();

    public static Typeface a(Context context, int i5) {
        if (context.isRestricted()) {
            return null;
        }
        return b(context, i5, new TypedValue(), 0, null, false, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a5 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Typeface b(Context context, int i5, TypedValue typedValue, int i11, b bVar, boolean z11, boolean z12) {
        Resources resources = context.getResources();
        resources.getValue(i5, typedValue, true);
        CharSequence charSequence = typedValue.string;
        if (charSequence == null) {
            throw new Resources.NotFoundException("Resource \"" + resources.getResourceName(i5) + "\" (" + Integer.toHexString(i5) + ") is not a Font: " + typedValue);
        }
        String string = charSequence.toString();
        Typeface typefaceA = null;
        if (string.startsWith("res/")) {
            Typeface typefaceD = r4.c.d(resources, i5, string, typedValue.assetCookie, i11);
            if (typefaceD != null) {
                if (bVar != null) {
                    bVar.b(typefaceD);
                }
                typefaceA = typefaceD;
            } else if (!z12) {
                try {
                    if (string.toLowerCase().endsWith(".xml")) {
                        d dVarH = b.h(resources.getXml(i5), resources);
                        if (dVarH == null) {
                            Log.e("ResourcesCompat", "Failed to find font-family tag");
                            if (bVar != null) {
                                bVar.a(-3);
                            }
                        } else {
                            try {
                                typefaceA = r4.c.a(context, dVarH, resources, i5, string, typedValue.assetCookie, i11, bVar, z11);
                            } catch (IOException e3) {
                                e = e3;
                                string = string;
                                Log.e("ResourcesCompat", "Failed to read xml resource ".concat(string), e);
                                if (bVar != null) {
                                    bVar.a(-3);
                                }
                                if (typefaceA == null) {
                                }
                                return typefaceA;
                            } catch (XmlPullParserException e11) {
                                e = e11;
                                string = string;
                                Log.e("ResourcesCompat", "Failed to parse xml resource ".concat(string), e);
                                if (bVar != null) {
                                }
                                if (typefaceA == null) {
                                }
                                return typefaceA;
                            }
                        }
                    } else {
                        Typeface typefaceB = r4.c.b(context, resources, i5, string, typedValue.assetCookie, i11);
                        if (bVar != null) {
                            if (typefaceB != null) {
                                bVar.b(typefaceB);
                            } else {
                                bVar.a(-3);
                            }
                        }
                        typefaceA = typefaceB;
                    }
                } catch (IOException e12) {
                    e = e12;
                } catch (XmlPullParserException e13) {
                    e = e13;
                }
            }
        } else if (bVar != null) {
            bVar.a(-3);
        }
        if (typefaceA == null || bVar != null || z12) {
            return typefaceA;
        }
        throw new Resources.NotFoundException("Font resource ID #0x" + Integer.toHexString(i5) + " could not be retrieved.");
    }
}
