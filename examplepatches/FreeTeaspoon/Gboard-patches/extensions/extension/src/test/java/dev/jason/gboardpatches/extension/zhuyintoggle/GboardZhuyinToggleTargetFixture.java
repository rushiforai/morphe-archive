package dev.jason.gboardpatches.extension.zhuyintoggle;

import android.content.Context;

import dev.jason.gboardpatches.extension.zhuyinslide.GboardZhuyinSlideTargetFixture;

final class GboardZhuyinToggleTargetFixture {
    private GboardZhuyinToggleTargetFixture() {
    }

    static ClassLoader classLoader() {
        return GboardZhuyinSlideTargetFixture.classLoader();
    }

    static Object newSoftKeyView(Context context) throws Exception {
        return GboardZhuyinSlideTargetFixture.newSoftKeyView(context);
    }

    static void bind(Object view, Object metadata, long token) throws Exception {
        GboardZhuyinSlideTargetFixture.bind(view, metadata, token);
    }

    static Object boundMetadata(Object view) throws Exception {
        return GboardZhuyinSlideTargetFixture.boundMetadata(view);
    }

    static long bindToken(Object view) throws Exception {
        return GboardZhuyinSlideTargetFixture.bindToken(view);
    }

    static int bindCount(Object view) throws Exception {
        return GboardZhuyinSlideTargetFixture.bindCount(view);
    }

    static void setThrowOnBind(Object view, boolean shouldThrow) throws Exception {
        GboardZhuyinSlideTargetFixture.setThrowOnBind(view, shouldThrow);
    }
}
