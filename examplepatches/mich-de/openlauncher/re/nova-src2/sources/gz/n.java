package gz;

import android.content.res.Resources;
import kotlin.Unit;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final String f58666a;

    /* renamed from: b, reason: collision with root package name */
    public int f58667b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f58668c;

    public n(String str) {
        this.f58666a = str;
    }

    public final int a(Resources resources, String str) {
        if (this.f58668c) {
            return this.f58667b;
        }
        synchronized (this) {
            if (this.f58668c) {
                return this.f58667b;
            }
            int identifier = resources.getIdentifier(this.f58666a, "drawable", str);
            this.f58667b = identifier;
            this.f58668c = true;
            Unit unit = Unit.f71706a;
            return identifier;
        }
    }
}
