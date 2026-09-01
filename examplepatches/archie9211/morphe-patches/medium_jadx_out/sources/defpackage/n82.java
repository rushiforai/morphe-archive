package defpackage;

import android.content.ClipData;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContentInfo;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n82 implements m82, o82 {
    public final /* synthetic */ int a = 0;
    public ClipData b;
    public int c;
    public int d;
    public Uri e;
    public Bundle f;

    public n82(n82 n82Var) {
        ClipData clipData = n82Var.b;
        clipData.getClass();
        this.b = clipData;
        int i = n82Var.c;
        if (i < 0) {
            Locale locale = Locale.US;
            ay0.e("source is out of range of [0, 5] (too low)");
            throw null;
        }
        if (i > 5) {
            Locale locale2 = Locale.US;
            ay0.e("source is out of range of [0, 5] (too high)");
            throw null;
        }
        this.c = i;
        int i2 = n82Var.d;
        if ((i2 & 1) == i2) {
            this.d = i2;
            this.e = n82Var.e;
            this.f = n82Var.f;
            return;
        }
        throw new IllegalArgumentException("Requested flags 0x" + Integer.toHexString(i2) + ", but only 0x" + Integer.toHexString(1) + " are allowed");
    }

    @Override // defpackage.o82
    public ClipData a() {
        return this.b;
    }

    @Override // defpackage.m82
    public void b(Uri uri) {
        this.e = uri;
    }

    @Override // defpackage.m82
    public p82 build() {
        return new p82(new n82(this));
    }

    @Override // defpackage.m82
    public void c(int i) {
        this.d = i;
    }

    @Override // defpackage.o82
    public int d() {
        return this.c;
    }

    @Override // defpackage.o82
    public ContentInfo e() {
        return null;
    }

    @Override // defpackage.o82
    public int getFlags() {
        return this.d;
    }

    @Override // defpackage.m82
    public void setExtras(Bundle bundle) {
        this.f = bundle;
    }

    public String toString() {
        String str;
        switch (this.a) {
            case 1:
                Uri uri = this.e;
                StringBuilder sb = new StringBuilder("ContentInfoCompat{clip=");
                sb.append(this.b.getDescription());
                sb.append(", source=");
                int i = this.c;
                sb.append(i != 0 ? i != 1 ? i != 2 ? i != 3 ? i != 4 ? i != 5 ? String.valueOf(i) : "SOURCE_PROCESS_TEXT" : "SOURCE_AUTOFILL" : "SOURCE_DRAG_AND_DROP" : "SOURCE_INPUT_METHOD" : "SOURCE_CLIPBOARD" : "SOURCE_APP");
                sb.append(", flags=");
                int i2 = this.d;
                sb.append((i2 & 1) != 0 ? "FLAG_CONVERT_TO_PLAIN_TEXT" : String.valueOf(i2));
                if (uri == null) {
                    str = "";
                } else {
                    str = ", hasLinkUri(" + uri.toString().length() + ")";
                }
                sb.append(str);
                return ka1.v(sb, this.f != null ? ", hasExtras" : "", "}");
            default:
                return super.toString();
        }
    }

    public /* synthetic */ n82() {
    }
}
