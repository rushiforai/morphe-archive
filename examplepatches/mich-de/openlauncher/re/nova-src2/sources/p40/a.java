package p40;

import android.content.res.Resources;
import android.util.Log;
import androidx.fragment.app.p;
import java.lang.reflect.Field;
import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class a extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final a f82075k;

    /* renamed from: l, reason: collision with root package name */
    public static final a f82076l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82077j;

    static {
        int i5 = 0;
        f82075k = new a(i5, 0);
        f82076l = new a(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5, int i11) {
        super(i5);
        this.f82077j = i11;
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r3v0, types: [java.lang.Object, kotlin.Lazy] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Field field;
        switch (this.f82077j) {
            case 0:
                q40.c cVar = new q40.c();
                Object obj = q40.f.f83668a;
                p pVar = new p(cVar, 27);
                try {
                    Object value = q40.f.f83669b.getValue();
                    if (value != null && (field = (Field) q40.f.f83670c.getValue()) != null) {
                        Object obj2 = field.get(value);
                        if (obj2 == null) {
                            throw new NullPointerException("null cannot be cast to non-null type kotlin.collections.ArrayList<android.view.View> /* = java.util.ArrayList<android.view.View> */");
                        }
                        field.set(value, pVar.invoke((ArrayList) obj2));
                    }
                } catch (Throwable th2) {
                    Log.w("WindowManagerSpy", th2);
                }
                return cVar;
            default:
                try {
                    return Resources.getSystem().getString(Resources.getSystem().getIdentifier("tooltip_popup_title", "string", "android"));
                } catch (Resources.NotFoundException unused) {
                    return "Tooltip";
                }
        }
    }
}
