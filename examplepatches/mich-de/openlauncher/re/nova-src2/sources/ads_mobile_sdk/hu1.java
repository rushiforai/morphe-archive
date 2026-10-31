package ads_mobile_sdk;

import android.graphics.drawable.Drawable;
import android.net.Uri;

/* loaded from: classes.dex */
public final class hu1 implements b.u5 {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f4535a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f4536b;

    /* renamed from: c, reason: collision with root package name */
    public final double f4537c;

    /* renamed from: d, reason: collision with root package name */
    public final int f4538d;

    /* renamed from: e, reason: collision with root package name */
    public final int f4539e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f4540f;

    public hu1(hg.a aVar, int i5) {
        this.f4540f = i5;
        switch (i5) {
            case 1:
                this.f4535a = aVar.a();
                this.f4536b = aVar.c();
                this.f4537c = aVar.b();
                this.f4538d = -1;
                this.f4539e = -1;
                break;
            default:
                this.f4535a = aVar.a();
                this.f4536b = aVar.c();
                this.f4537c = aVar.b();
                this.f4538d = -1;
                this.f4539e = -1;
                break;
        }
    }

    @Override // b.u5
    public final double a() {
        switch (this.f4540f) {
        }
        return this.f4537c;
    }

    @Override // b.u5
    public final int b() {
        switch (this.f4540f) {
        }
        return this.f4538d;
    }

    @Override // b.u5
    public final int c() {
        switch (this.f4540f) {
        }
        return this.f4539e;
    }

    @Override // b.u5
    public final Uri d() {
        switch (this.f4540f) {
        }
        return this.f4536b;
    }

    @Override // b.u5
    public final Drawable e() {
        switch (this.f4540f) {
        }
        return this.f4535a;
    }
}
