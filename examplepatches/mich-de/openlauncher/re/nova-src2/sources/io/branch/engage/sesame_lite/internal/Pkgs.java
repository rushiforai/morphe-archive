package io.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0007\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001b\u0010\u0005\u001a\u00020\u00068FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u0007\u0010\b¨\u0006\f"}, d2 = {"Lio/branch/engage/sesame_lite/internal/Pkgs;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "googleApp", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getGoogleApp", "()Ljava/lang/String;", "googleApp$delegate", "Lkotlin/Lazy;", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class Pkgs {

    @NotNull
    public static final String GOOGLE_APP = "com.google.android.googlequicksearchbox";

    @NotNull
    private static final String GOOGLE_APP_GO = "com.google.android.apps.searchlite";

    @NotNull
    private static final String GOOGLE_APP_NORMAL = "com.google.android.googlequicksearchbox";

    @NotNull
    public static final String GOOGLE_CALENDAR = "com.google.android.calendar";

    @NotNull
    public static final String GOOGLE_MAPS = "com.google.android.apps.maps";

    @NotNull
    public static final String GOOGLE_PLAY_STORE = "com.android.vending";

    @NotNull
    public static final String GOOGLE_TRANSLATE = "com.google.android.apps.translate";

    @NotNull
    public static final String NETFLIX = "com.netflix.mediaclient";

    @NotNull
    public static final String SETTINGS = "com.android.settings";

    @NotNull
    public static final String SETTINGS_TETHER_CMP = "com.android.settings/.TetherSettings";

    @NotNull
    public static final String SPOTIFY = "com.spotify.music";

    @NotNull
    public static final String SYSTEM = "android";

    @NotNull
    private static final String TAG = "SSML-Pkgs";

    @NotNull
    public static final String WIKIPEDIA = "org.wikipedia";

    @NotNull
    public static final String YOUTUBE = "com.google.android.youtube";

    @NotNull
    public static final String YOUTUBE_MUSIC = "com.google.android.apps.youtube.music";

    @NotNull
    private final Context context;

    /* renamed from: googleApp$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy googleApp;

    public Pkgs(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.context = context;
        this.googleApp = LazyKt.a(new Function0<String>() { // from class: io.branch.engage.sesame_lite.internal.Pkgs$googleApp$2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final String invoke() throws PackageManager.NameNotFoundException {
                try {
                    this.this$0.context.getPackageManager().getPackageInfo("com.google.android.apps.searchlite", 0);
                    return "com.google.android.apps.searchlite";
                } catch (PackageManager.NameNotFoundException unused) {
                    return "com.google.android.googlequicksearchbox";
                }
            }
        });
    }

    @NotNull
    public final String getGoogleApp() {
        return (String) this.googleApp.getValue();
    }
}
