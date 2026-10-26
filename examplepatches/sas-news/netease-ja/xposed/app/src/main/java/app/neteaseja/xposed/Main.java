package app.neteaseja.xposed;

import android.app.Activity;
import android.os.Bundle;

import de.robv.android.xposed.IXposedHookInitPackageResources;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.callbacks.XC_InitPackageResources.InitPackageResourcesParam;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

import java.util.Map;

import static de.robv.android.xposed.XposedHelpers.findAndHookMethod;

/**
 * Personal-use Japanese UI + comment translation for NetEase Cloud Music.
 *
 * The APK itself is never modified, so the official signature stays intact.
 * UI strings are replaced at resource-load time; comment screens get the
 * floating translate button (same CommentTranslator as the Morphe version).
 */
public class Main implements IXposedHookInitPackageResources, IXposedHookLoadPackage {

    private static final String TARGET = "com.netease.cloudmusic";

    private static final String[] SCREENS = {
            "com.netease.cloudmusic.music.biz.comment.activity.CommentActivity",
            "com.netease.cloudmusic.music.biz.comment.activity.FoldCommentActivity",
            "com.netease.cloudmusic.person.activity.artist.ArtistIntroActivity",
            "com.netease.play.anchorrecommend.activity.RcmdAlbumIntroActivity",
            "com.netease.play.anchorrecommend.activity.RcmdPlaylistIntroActivity"
    };

    @Override
    public void handleInitPackageResources(InitPackageResourcesParam resparam) throws Throwable {
        if (!TARGET.equals(resparam.packageName)) {
            return;
        }
        int applied = 0;
        for (Map.Entry<String, String> e : Translations.STRINGS.entrySet()) {
            try {
                resparam.res.setReplacement(TARGET, "string", e.getKey(), e.getValue());
                applied++;
            } catch (Throwable ignored) {
                // Name does not exist in this app version; skip it.
            }
        }
        XposedBridge.log("NeteaseJA: replaced " + applied + " strings");
    }

    @Override
    public void handleLoadPackage(final LoadPackageParam lpparam) throws Throwable {
        if (!TARGET.equals(lpparam.packageName)) {
            return;
        }
        for (final String cls : SCREENS) {
            try {
                findAndHookMethod(cls, lpparam.classLoader, "onCreate", Bundle.class,
                        new XC_MethodHook() {
                            @Override
                            protected void afterHookedMethod(MethodHookParam param) {
                                try {
                                    CommentTranslator.attach((Activity) param.thisObject);
                                } catch (Throwable t) {
                                    XposedBridge.log("NeteaseJA: attach failed for " + cls);
                                }
                            }
                        });
            } catch (Throwable t) {
                XposedBridge.log("NeteaseJA: no hook for " + cls);
            }
        }
    }
}
