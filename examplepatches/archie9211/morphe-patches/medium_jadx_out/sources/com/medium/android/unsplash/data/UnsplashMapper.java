package com.medium.android.unsplash.data;

import android.net.Uri;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import defpackage.bi7;
import defpackage.cfc;
import defpackage.dqb;
import defpackage.ew8;
import defpackage.ue3;
import defpackage.xe3;
import defpackage.ygf;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001f\u0010\t\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00022\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/medium/android/unsplash/data/UnsplashMapper;", "Lbi7;", "Lcom/medium/android/unsplash/data/UnsplashPhoto;", "", "<init>", "()V", "data", "Lew8;", "options", "map", "(Lcom/medium/android/unsplash/data/UnsplashPhoto;Lew8;)Ljava/lang/String;", "unsplash_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UnsplashMapper implements bi7 {
    public static final int $stable = 0;
    public static final UnsplashMapper INSTANCE = new UnsplashMapper();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
    public static final /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[dqb.values().length];
            try {
                iArr[dqb.FILL.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[dqb.FIT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    private UnsplashMapper() {
    }

    @Override // defpackage.bi7
    public final String map(UnsplashPhoto data, ew8 options) {
        int i;
        data.getClass();
        options.getClass();
        cfc cfcVar = options.b;
        xe3 xe3Var = cfcVar.a;
        xe3 xe3Var2 = cfcVar.b;
        int i2 = 0;
        if (xe3Var instanceof ue3) {
            i = ((ue3) xe3Var).a;
        } else {
            i = 0;
        }
        if (xe3Var2 instanceof ue3) {
            i2 = ((ue3) xe3Var2).a;
        }
        String raw = data.getUrls().getRaw();
        if (i != 0 && i2 != 0) {
            Uri.Builder builderBuildUpon = Uri.parse(data.getUrls().getRaw()).buildUpon();
            builderBuildUpon.appendQueryParameter("w", String.valueOf(i));
            builderBuildUpon.appendQueryParameter("h", String.valueOf(i2));
            builderBuildUpon.appendQueryParameter(PqkdNGCEoxOKZk.NelnDGVjly, "webp");
            int i3 = WhenMappings.$EnumSwitchMapping$0[options.c.ordinal()];
            String str = pUlNWdybf.ZlsWYVKSLvcS;
            if (i3 != 1) {
                if (i3 == 2) {
                    builderBuildUpon.appendQueryParameter(str, "crop");
                } else {
                    ygf.a();
                    return null;
                }
            } else {
                builderBuildUpon.appendQueryParameter(str, "fill");
            }
            String string = builderBuildUpon.build().toString();
            string.getClass();
            return string;
        }
        return raw;
    }
}
