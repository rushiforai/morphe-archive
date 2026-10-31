package androidx.appcompat.view;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.AssetManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.LayoutInflater;

/* loaded from: classes2.dex */
public class d extends ContextWrapper {

    /* renamed from: f, reason: collision with root package name */
    public static Configuration f13607f;

    /* renamed from: a, reason: collision with root package name */
    public int f13608a;

    /* renamed from: b, reason: collision with root package name */
    public Resources.Theme f13609b;

    /* renamed from: c, reason: collision with root package name */
    public LayoutInflater f13610c;

    /* renamed from: d, reason: collision with root package name */
    public Configuration f13611d;

    /* renamed from: e, reason: collision with root package name */
    public Resources f13612e;

    public d(Context context, int i5) {
        super(context);
        this.f13608a = i5;
    }

    public final void a(Configuration configuration) {
        if (this.f13612e != null) {
            throw new IllegalStateException("getResources() or getAssets() has already been called");
        }
        if (this.f13611d != null) {
            throw new IllegalStateException("Override configuration has already been set");
        }
        this.f13611d = new Configuration(configuration);
    }

    @Override // android.content.ContextWrapper
    public final void attachBaseContext(Context context) {
        super.attachBaseContext(context);
    }

    public final void b() {
        if (this.f13609b == null) {
            this.f13609b = getResources().newTheme();
            Resources.Theme theme = getBaseContext().getTheme();
            if (theme != null) {
                this.f13609b.setTo(theme);
            }
        }
        this.f13609b.applyStyle(this.f13608a, true);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final AssetManager getAssets() {
        return getResources().getAssets();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x002c  */
    @Override // android.content.ContextWrapper, android.content.Context
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Resources getResources() {
        if (this.f13612e == null) {
            Configuration configuration = this.f13611d;
            if (configuration == null) {
                this.f13612e = super.getResources();
            } else {
                if (f13607f == null) {
                    Configuration configuration2 = new Configuration();
                    configuration2.fontScale = 0.0f;
                    f13607f = configuration2;
                }
                if (!configuration.equals(f13607f)) {
                    this.f13612e = createConfigurationContext(this.f13611d).getResources();
                }
            }
        }
        return this.f13612e;
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final Object getSystemService(String str) {
        if (!"layout_inflater".equals(str)) {
            return getBaseContext().getSystemService(str);
        }
        if (this.f13610c == null) {
            this.f13610c = LayoutInflater.from(getBaseContext()).cloneInContext(this);
        }
        return this.f13610c;
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final Resources.Theme getTheme() {
        Resources.Theme theme = this.f13609b;
        if (theme != null) {
            return theme;
        }
        if (this.f13608a == 0) {
            this.f13608a = 2132083458;
        }
        b();
        return this.f13609b;
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final void setTheme(int i5) {
        if (this.f13608a != i5) {
            this.f13608a = i5;
            b();
        }
    }
}
