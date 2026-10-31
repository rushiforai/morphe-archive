package b70;

import android.content.Context;
import android.graphics.drawable.Drawable;
import com.instabridge.ai.proactive.InsightScorer;
import com.teslacoilsw.notifier.widget.BadgeArtIconPreview;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17592a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f17593b;

    public /* synthetic */ f(int i5, int i11) {
        this.f17592a = i11;
        this.f17593b = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f17592a) {
            case 0:
                ((Integer) obj).intValue();
                throw new IndexOutOfBoundsException("Collection doesn't contain element at index " + this.f17593b + '.');
            case 1:
                return Boolean.valueOf(InsightScorer.score$lambda$8(this.f17593b, ((Integer) obj).intValue()));
            default:
                Context context = (Context) obj;
                BadgeArtIconPreview badgeArtIconPreview = new BadgeArtIconPreview(context, null, 6);
                int i5 = this.f17593b;
                badgeArtIconPreview.setPadding(i5, i5, i5, i5);
                Drawable drawable = context.getDrawable(2131231721);
                Intrinsics.d(drawable);
                d8.d dVar = new d8.d(new d8.b(null, null), null);
                d8.c cVar = new d8.c(0.0f, 10);
                d8.b bVar = dVar.f49021f;
                bVar.f49012d = cVar;
                bVar.f49013e = new d8.c(0.0f, 10);
                bVar.f49014f = new d8.c(0.0f, 10);
                bVar.f49015g = new d8.c(0.0f, 10);
                dVar.f(drawable);
                badgeArtIconPreview.t(dVar);
                return badgeArtIconPreview;
        }
    }
}
