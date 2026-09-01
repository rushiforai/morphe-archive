package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.os.LocaleList;
import android.os.Process;
import android.os.SystemClock;
import com.datadog.android.rum.DdRumContentProvider;
import java.util.ArrayList;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qw2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qw2(Object obj, int i, Object obj2) {
        super(0);
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        String languageTag;
        String languageTag2;
        long jNanoTime;
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Resources resources = ((Context) obj2).getResources();
                boolean z = ((j01) ((tw2) obj).a).b;
                String languageTag3 = null;
                if (z) {
                    Locale locale = resources.getConfiguration().getLocales().get(0);
                    if (locale != null) {
                        languageTag3 = locale.toLanguageTag();
                    }
                } else {
                    Locale locale2 = resources.getConfiguration().locale;
                    if (locale2 != null) {
                        languageTag3 = locale2.toLanguageTag();
                    }
                }
                return languageTag3 == null ? Locale.getDefault().toLanguageTag() : languageTag3;
            case 1:
                Resources resources2 = ((Context) obj2).getResources();
                ArrayList arrayList = new ArrayList();
                if (((j01) ((tw2) obj).a).b) {
                    LocaleList locales = resources2.getConfiguration().getLocales();
                    locales.getClass();
                    int size = locales.size();
                    while (i < size) {
                        Locale locale3 = locales.get(i);
                        if (locale3 != null && (languageTag2 = locale3.toLanguageTag()) != null) {
                            arrayList.add(languageTag2);
                        }
                        i++;
                    }
                } else {
                    Locale locale4 = resources2.getConfiguration().locale;
                    if (locale4 != null && (languageTag = locale4.toLanguageTag()) != null) {
                        arrayList.add(languageTag);
                    }
                }
                return arrayList;
            default:
                if (((j01) ((l01) obj2)).b) {
                    ((rv8) ((bx2) obj).a.invoke()).getClass();
                    jNanoTime = System.nanoTime() - TimeUnit.MILLISECONDS.toNanos(SystemClock.elapsedRealtime() - Process.getStartElapsedRealtime());
                    long j = DdRumContentProvider.b;
                    boolean z2 = jNanoTime > j;
                    i = j - jNanoTime > bx2.b ? 1 : 0;
                    if (z2 || i != 0) {
                        jNanoTime = j;
                    }
                } else {
                    jNanoTime = DdRumContentProvider.b;
                }
                return Long.valueOf(jNanoTime);
        }
    }
}
