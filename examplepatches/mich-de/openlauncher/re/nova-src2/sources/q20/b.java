package q20;

import android.content.Context;
import java.io.File;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final Context f83460a;

    /* renamed from: b, reason: collision with root package name */
    public final a70.d f83461b;

    /* renamed from: c, reason: collision with root package name */
    public final a70.d f83462c;

    public b(Context context) {
        this.f83460a = context;
        final int i5 = 0;
        this.f83461b = LazyKt.a(new Function0(this) { // from class: q20.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b f83459b;

            {
                this.f83459b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return new File(this.f83459b.f83460a.getCacheDir() + "/apicache/");
                    default:
                        return new File((File) this.f83459b.f83461b.getValue(), "SpotifyApiCache");
                }
            }
        });
        final int i11 = 1;
        this.f83462c = LazyKt.a(new Function0(this) { // from class: q20.a

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b f83459b;

            {
                this.f83459b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return new File(this.f83459b.f83460a.getCacheDir() + "/apicache/");
                    default:
                        return new File((File) this.f83459b.f83461b.getValue(), "SpotifyApiCache");
                }
            }
        });
        ya.j.f97146a.execute(new ae.m(this, 27));
    }
}
