package n4;

import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.core.graphics.drawable.IconCompat;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public CharSequence f77848a;

    /* renamed from: b, reason: collision with root package name */
    public IconCompat f77849b;

    /* renamed from: c, reason: collision with root package name */
    public String f77850c;

    /* renamed from: d, reason: collision with root package name */
    public String f77851d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f77852e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f77853f;

    public static q0 a(Bundle bundle) {
        Bundle bundle2 = bundle.getBundle("icon");
        CharSequence charSequence = bundle.getCharSequence(PendingUpgradeStore.KEY_NAME);
        IconCompat iconCompatA = bundle2 != null ? IconCompat.a(bundle2) : null;
        String string = bundle.getString("uri");
        String string2 = bundle.getString(DatabaseConstants.KEY_FIELD);
        boolean z11 = bundle.getBoolean("isBot");
        boolean z12 = bundle.getBoolean("isImportant");
        q0 q0Var = new q0();
        q0Var.f77848a = charSequence;
        q0Var.f77849b = iconCompatA;
        q0Var.f77850c = string;
        q0Var.f77851d = string2;
        q0Var.f77852e = z11;
        q0Var.f77853f = z12;
        return q0Var;
    }

    public final Bundle b() {
        Bundle bundle;
        Bundle bundle2 = new Bundle();
        bundle2.putCharSequence(PendingUpgradeStore.KEY_NAME, this.f77848a);
        IconCompat iconCompat = this.f77849b;
        if (iconCompat != null) {
            bundle = new Bundle();
            switch (iconCompat.f14225a) {
                case -1:
                    bundle.putParcelable("obj", (Parcelable) iconCompat.f14226b);
                    break;
                case 0:
                default:
                    throw new IllegalArgumentException("Invalid icon");
                case 1:
                case 5:
                    bundle.putParcelable("obj", (Bitmap) iconCompat.f14226b);
                    break;
                case 2:
                case 4:
                case 6:
                    bundle.putString("obj", (String) iconCompat.f14226b);
                    break;
                case 3:
                    bundle.putByteArray("obj", (byte[]) iconCompat.f14226b);
                    break;
            }
            bundle.putInt(TTConst.TRACK_TYPE, iconCompat.f14225a);
            bundle.putInt("int1", iconCompat.f14229e);
            bundle.putInt("int2", iconCompat.f14230f);
            bundle.putString("string1", iconCompat.f14234j);
            ColorStateList colorStateList = iconCompat.f14231g;
            if (colorStateList != null) {
                bundle.putParcelable("tint_list", colorStateList);
            }
            PorterDuff.Mode mode = iconCompat.f14232h;
            if (mode != IconCompat.f14224k) {
                bundle.putString("tint_mode", mode.name());
            }
        } else {
            bundle = null;
        }
        bundle2.putBundle("icon", bundle);
        bundle2.putString("uri", this.f77850c);
        bundle2.putString(DatabaseConstants.KEY_FIELD, this.f77851d);
        bundle2.putBoolean("isBot", this.f77852e);
        bundle2.putBoolean("isImportant", this.f77853f);
        return bundle2;
    }

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        String str = this.f77851d;
        String str2 = q0Var.f77851d;
        return (str == null && str2 == null) ? Objects.equals(Objects.toString(this.f77848a), Objects.toString(q0Var.f77848a)) && Objects.equals(this.f77850c, q0Var.f77850c) && Boolean.valueOf(this.f77852e).equals(Boolean.valueOf(q0Var.f77852e)) && Boolean.valueOf(this.f77853f).equals(Boolean.valueOf(q0Var.f77853f)) : Objects.equals(str, str2);
    }

    public final int hashCode() {
        String str = this.f77851d;
        return str != null ? str.hashCode() : Objects.hash(this.f77848a, this.f77850c, Boolean.valueOf(this.f77852e), Boolean.valueOf(this.f77853f));
    }
}
