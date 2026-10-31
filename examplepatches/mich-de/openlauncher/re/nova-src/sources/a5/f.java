package a5;

import android.content.ClipData;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContentInfo;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class f implements e, g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f278a = 0;

    /* renamed from: b, reason: collision with root package name */
    public ClipData f279b;

    /* renamed from: c, reason: collision with root package name */
    public int f280c;

    /* renamed from: d, reason: collision with root package name */
    public int f281d;

    /* renamed from: e, reason: collision with root package name */
    public Uri f282e;

    /* renamed from: f, reason: collision with root package name */
    public Bundle f283f;

    public /* synthetic */ f() {
    }

    @Override // a5.e
    public h build() {
        return new h(new f(this));
    }

    @Override // a5.e
    public void f(Uri uri) {
        this.f282e = uri;
    }

    @Override // a5.g
    public int getSource() {
        return this.f280c;
    }

    @Override // a5.g
    public ContentInfo m() {
        return null;
    }

    @Override // a5.g
    public ClipData q() {
        return this.f279b;
    }

    @Override // a5.e
    public void setExtras(Bundle bundle) {
        this.f283f = bundle;
    }

    public String toString() {
        String str;
        switch (this.f278a) {
            case 1:
                Uri uri = this.f282e;
                StringBuilder sb2 = new StringBuilder("ContentInfoCompat{clip=");
                sb2.append(this.f279b.getDescription());
                sb2.append(", source=");
                int i5 = this.f280c;
                sb2.append(i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? String.valueOf(i5) : "SOURCE_PROCESS_TEXT" : "SOURCE_AUTOFILL" : "SOURCE_DRAG_AND_DROP" : "SOURCE_INPUT_METHOD" : "SOURCE_CLIPBOARD" : "SOURCE_APP");
                sb2.append(", flags=");
                int i11 = this.f281d;
                sb2.append((i11 & 1) != 0 ? "FLAG_CONVERT_TO_PLAIN_TEXT" : String.valueOf(i11));
                String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (uri == null) {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } else {
                    str = ", hasLinkUri(" + uri.toString().length() + ")";
                }
                sb2.append(str);
                if (this.f283f != null) {
                    str2 = ", hasExtras";
                }
                return b.c0.q(sb2, str2, "}");
            default:
                return super.toString();
        }
    }

    @Override // a5.e
    public void v(int i5) {
        this.f281d = i5;
    }

    @Override // a5.g
    public int w() {
        return this.f281d;
    }

    public f(f fVar) {
        ClipData clipData = fVar.f279b;
        clipData.getClass();
        this.f279b = clipData;
        int i5 = fVar.f280c;
        if (i5 < 0) {
            Locale locale = Locale.US;
            throw new IllegalArgumentException("source is out of range of [0, 5] (too low)");
        }
        if (i5 > 5) {
            Locale locale2 = Locale.US;
            throw new IllegalArgumentException("source is out of range of [0, 5] (too high)");
        }
        this.f280c = i5;
        int i11 = fVar.f281d;
        if ((i11 & 1) == i11) {
            this.f281d = i11;
            this.f282e = fVar.f282e;
            this.f283f = fVar.f283f;
        } else {
            throw new IllegalArgumentException("Requested flags 0x" + Integer.toHexString(i11) + ", but only 0x" + Integer.toHexString(1) + " are allowed");
        }
    }
}
