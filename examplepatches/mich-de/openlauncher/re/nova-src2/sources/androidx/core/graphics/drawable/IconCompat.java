package androidx.core.graphics.drawable;

import a5.k1;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import androidx.versionedparcelable.CustomVersionedParcelable;
import com.tiktok.util.TTConst;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import ps.f0;

/* loaded from: classes2.dex */
public class IconCompat extends CustomVersionedParcelable {

    /* renamed from: k, reason: collision with root package name */
    public static final PorterDuff.Mode f14224k = PorterDuff.Mode.SRC_IN;

    /* renamed from: a, reason: collision with root package name */
    public int f14225a;

    /* renamed from: b, reason: collision with root package name */
    public Object f14226b;

    /* renamed from: c, reason: collision with root package name */
    public byte[] f14227c;

    /* renamed from: d, reason: collision with root package name */
    public Parcelable f14228d;

    /* renamed from: e, reason: collision with root package name */
    public int f14229e;

    /* renamed from: f, reason: collision with root package name */
    public int f14230f;

    /* renamed from: g, reason: collision with root package name */
    public ColorStateList f14231g;

    /* renamed from: h, reason: collision with root package name */
    public PorterDuff.Mode f14232h;

    /* renamed from: i, reason: collision with root package name */
    public String f14233i;

    /* renamed from: j, reason: collision with root package name */
    public String f14234j;

    public IconCompat() {
        this.f14225a = -1;
        this.f14227c = null;
        this.f14228d = null;
        this.f14229e = 0;
        this.f14230f = 0;
        this.f14231g = null;
        this.f14232h = f14224k;
        this.f14233i = null;
    }

    public static IconCompat a(Bundle bundle) {
        int i5 = bundle.getInt(TTConst.TRACK_TYPE);
        IconCompat iconCompat = new IconCompat(i5);
        iconCompat.f14229e = bundle.getInt("int1");
        iconCompat.f14230f = bundle.getInt("int2");
        iconCompat.f14234j = bundle.getString("string1");
        if (bundle.containsKey("tint_list")) {
            iconCompat.f14231g = (ColorStateList) bundle.getParcelable("tint_list");
        }
        if (bundle.containsKey("tint_mode")) {
            iconCompat.f14232h = PorterDuff.Mode.valueOf(bundle.getString("tint_mode"));
        }
        switch (i5) {
            case -1:
            case 1:
            case 5:
                iconCompat.f14226b = bundle.getParcelable("obj");
                return iconCompat;
            case 0:
            default:
                Log.w("IconCompat", "Unknown type " + i5);
                return null;
            case 2:
            case 4:
            case 6:
                iconCompat.f14226b = bundle.getString("obj");
                return iconCompat;
            case 3:
                iconCompat.f14226b = bundle.getByteArray("obj");
                return iconCompat;
        }
    }

    public static IconCompat b(Icon icon) {
        icon.getClass();
        int iS = f0.s(icon);
        if (iS == 2) {
            return c(f0.q(icon), null, f0.r(icon));
        }
        if (iS == 4) {
            Uri uriT = f0.t(icon);
            uriT.getClass();
            String string = uriT.toString();
            string.getClass();
            IconCompat iconCompat = new IconCompat(4);
            iconCompat.f14226b = string;
            return iconCompat;
        }
        if (iS != 6) {
            IconCompat iconCompat2 = new IconCompat(-1);
            iconCompat2.f14226b = icon;
            return iconCompat2;
        }
        Uri uriT2 = f0.t(icon);
        uriT2.getClass();
        String string2 = uriT2.toString();
        string2.getClass();
        IconCompat iconCompat3 = new IconCompat(6);
        iconCompat3.f14226b = string2;
        return iconCompat3;
    }

    public static IconCompat c(int i5, Resources resources, String str) {
        str.getClass();
        if (i5 == 0) {
            throw new IllegalArgumentException("Drawable resource ID must not be 0");
        }
        IconCompat iconCompat = new IconCompat(2);
        iconCompat.f14229e = i5;
        if (resources != null) {
            try {
                iconCompat.f14226b = resources.getResourceName(i5);
            } catch (Resources.NotFoundException unused) {
                throw new IllegalArgumentException("Icon resource cannot be found");
            }
        } else {
            iconCompat.f14226b = str;
        }
        iconCompat.f14234j = str;
        return iconCompat;
    }

    public final int d() {
        int i5 = this.f14225a;
        if (i5 == -1) {
            return f0.q(this.f14226b);
        }
        if (i5 == 2) {
            return this.f14229e;
        }
        throw new IllegalStateException("called getResId() on " + this);
    }

    public final Uri e() {
        int i5 = this.f14225a;
        if (i5 == -1) {
            return f0.t(this.f14226b);
        }
        if (i5 == 4 || i5 == 6) {
            return Uri.parse((String) this.f14226b);
        }
        throw new IllegalStateException("called getUri() on " + this);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0084  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Icon f(Context context) throws FileNotFoundException {
        Icon iconCreateWithBitmap;
        String strR;
        InputStream inputStreamOpenInputStream;
        int i5 = Build.VERSION.SDK_INT;
        switch (this.f14225a) {
            case -1:
                return (Icon) this.f14226b;
            case 0:
            default:
                throw new IllegalArgumentException("Unknown type");
            case 1:
                iconCreateWithBitmap = Icon.createWithBitmap((Bitmap) this.f14226b);
                break;
            case 2:
                int i11 = this.f14225a;
                if (i11 == -1) {
                    strR = f0.r(this.f14226b);
                } else {
                    if (i11 != 2) {
                        throw new IllegalStateException("called getResPackage() on " + this);
                    }
                    String str = this.f14234j;
                    strR = (str == null || TextUtils.isEmpty(str)) ? ((String) this.f14226b).split(":", -1)[0] : this.f14234j;
                }
                iconCreateWithBitmap = Icon.createWithResource(strR, this.f14229e);
                break;
            case 3:
                iconCreateWithBitmap = Icon.createWithData((byte[]) this.f14226b, this.f14229e, this.f14230f);
                break;
            case 4:
                iconCreateWithBitmap = Icon.createWithContentUri((String) this.f14226b);
                break;
            case 5:
                iconCreateWithBitmap = Icon.createWithAdaptiveBitmap((Bitmap) this.f14226b);
                break;
            case 6:
                if (i5 >= 30) {
                    iconCreateWithBitmap = k1.a(e());
                    break;
                } else {
                    if (context == null) {
                        throw new IllegalArgumentException("Context is required to resolve the file uri of the icon: " + e());
                    }
                    Uri uriE = e();
                    String scheme = uriE.getScheme();
                    if ("content".equals(scheme) || "file".equals(scheme)) {
                        try {
                            inputStreamOpenInputStream = context.getContentResolver().openInputStream(uriE);
                        } catch (Exception e3) {
                            Log.w("IconCompat", "Unable to load image from URI: " + uriE, e3);
                            inputStreamOpenInputStream = null;
                            if (inputStreamOpenInputStream != null) {
                            }
                        }
                        if (inputStreamOpenInputStream != null) {
                            throw new IllegalStateException("Cannot load adaptive icon from uri: " + e());
                        }
                        iconCreateWithBitmap = Icon.createWithAdaptiveBitmap(BitmapFactory.decodeStream(inputStreamOpenInputStream));
                        break;
                    } else {
                        try {
                            inputStreamOpenInputStream = new FileInputStream(new File((String) this.f14226b));
                        } catch (FileNotFoundException e11) {
                            Log.w("IconCompat", "Unable to load image from path: " + uriE, e11);
                            inputStreamOpenInputStream = null;
                            if (inputStreamOpenInputStream != null) {
                            }
                        }
                        if (inputStreamOpenInputStream != null) {
                        }
                    }
                }
                break;
        }
        ColorStateList colorStateList = this.f14231g;
        if (colorStateList != null) {
            iconCreateWithBitmap.setTintList(colorStateList);
        }
        PorterDuff.Mode mode = this.f14232h;
        if (mode != f14224k) {
            iconCreateWithBitmap.setTintMode(mode);
        }
        return iconCreateWithBitmap;
    }

    public final String toString() {
        String str;
        if (this.f14225a == -1) {
            return String.valueOf(this.f14226b);
        }
        StringBuilder sb2 = new StringBuilder("Icon(typ=");
        switch (this.f14225a) {
            case 1:
                str = "BITMAP";
                break;
            case 2:
                str = "RESOURCE";
                break;
            case 3:
                str = "DATA";
                break;
            case 4:
                str = "URI";
                break;
            case 5:
                str = "BITMAP_MASKABLE";
                break;
            case 6:
                str = "URI_MASKABLE";
                break;
            default:
                str = "UNKNOWN";
                break;
        }
        sb2.append(str);
        switch (this.f14225a) {
            case 1:
            case 5:
                sb2.append(" size=");
                sb2.append(((Bitmap) this.f14226b).getWidth());
                sb2.append("x");
                sb2.append(((Bitmap) this.f14226b).getHeight());
                break;
            case 2:
                sb2.append(" pkg=");
                sb2.append(this.f14234j);
                sb2.append(" id=");
                sb2.append(String.format("0x%08x", Integer.valueOf(d())));
                break;
            case 3:
                sb2.append(" len=");
                sb2.append(this.f14229e);
                if (this.f14230f != 0) {
                    sb2.append(" off=");
                    sb2.append(this.f14230f);
                    break;
                }
                break;
            case 4:
            case 6:
                sb2.append(" uri=");
                sb2.append(this.f14226b);
                break;
        }
        if (this.f14231g != null) {
            sb2.append(" tint=");
            sb2.append(this.f14231g);
        }
        if (this.f14232h != f14224k) {
            sb2.append(" mode=");
            sb2.append(this.f14232h);
        }
        sb2.append(")");
        return sb2.toString();
    }

    public IconCompat(int i5) {
        this.f14227c = null;
        this.f14228d = null;
        this.f14229e = 0;
        this.f14230f = 0;
        this.f14231g = null;
        this.f14232h = f14224k;
        this.f14233i = null;
        this.f14225a = i5;
    }
}
