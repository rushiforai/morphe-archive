package defpackage;

import android.media.Rating;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class psa {
    public static float a(Rating rating) {
        return rating.getPercentRating();
    }

    public static int b(Rating rating) {
        return rating.getRatingStyle();
    }

    public static float c(Rating rating) {
        return rating.getStarRating();
    }

    public static boolean d(Rating rating) {
        return rating.hasHeart();
    }

    public static boolean e(Rating rating) {
        return rating.isRated();
    }

    public static boolean f(Rating rating) {
        return rating.isThumbUp();
    }

    public static Rating g(boolean z) {
        return Rating.newHeartRating(z);
    }

    public static Rating h(float f) {
        return Rating.newPercentageRating(f);
    }

    public static Rating i(int i, float f) {
        return Rating.newStarRating(i, f);
    }

    public static Rating j(boolean z) {
        return Rating.newThumbRating(z);
    }

    public static Rating k(int i) {
        return Rating.newUnratedRating(i);
    }
}
