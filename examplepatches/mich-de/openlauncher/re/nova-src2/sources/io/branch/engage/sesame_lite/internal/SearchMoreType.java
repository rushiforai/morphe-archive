package io.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.net.Uri;
import io.branch.engage.sesame_lite.internal.IdHash;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B7\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\tJ\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u0019\u001a\u00020\u001aR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000e\u001a\u0004\b\f\u0010\rR\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u000bR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u000bj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#¨\u0006$"}, d2 = {"Lio/branch/engage/sesame_lite/internal/SearchMoreType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iconRes", "appTemplate", "webTemplate", "(Ljava/lang/String;ILjava/lang/String;ILjava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V", "getAppTemplate", "()Ljava/lang/String;", "getIconRes", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "idHash", "Lio/branch/engage/sesame_lite/internal/IdHash;", "getIdHash", "()Lio/branch/engage/sesame_lite/internal/IdHash;", "getLabelRes", "()I", "getPackageName", "getWebTemplate", "getIconUri", "Landroid/net/Uri;", "context", "Landroid/content/Context;", "GOOGLE", "GOOGLE_MAPS", "GOOGLE_PLAY_STORE", "GOOGLE_TRANSLATE", "NETFLIX", "SPOTIFY", "WIKIPEDIA", "YOUTUBE", "YOUTUBE_MUSIC", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public enum SearchMoreType {
    GOOGLE("com.google.android.googlequicksearchbox", 2132019588, 2131231803, "intent://www.google.com/search?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end", "intent://www.google.com/search?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end"),
    GOOGLE_MAPS("com.google.android.apps.maps", 2132019589, null, "intent://maps.google.com/maps?q=%s#Intent;scheme=https;launchFlags=0x10000000;package=com.google.android.apps.maps;end", "intent://maps.google.com/maps?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end", 4, null),
    GOOGLE_PLAY_STORE("com.android.vending", 2132019590, null, "intent://play.google.com/store/search?q=%s&c=apps#Intent;scheme=https;launchFlags=0x10000000;package=com.android.vending;end", "intent://play.google.com/store/search?q=%s&c=apps#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    GOOGLE_TRANSLATE("com.google.android.apps.translate", 2132019591, null, "intent:#Intent;action=android.intent.action.SEND;type=text/plain;launchFlags=0x10008000;package=com.google.android.apps.translate;S.android.intent.extra.TEXT=%s;end", "intent://translate.google.com/?text=%s&op=translate#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    NETFLIX("com.netflix.mediaclient", 2132019592, null, "intent://www.netflix.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;package=com.netflix.mediaclient;end", "intent://www.netflix.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    SPOTIFY("com.spotify.music", 2132019594, null, "intent://open.spotify.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;package=com.spotify.music;end", "intent://open.spotify.com/search/results/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    WIKIPEDIA("org.wikipedia", 2132019595, null, "intent:#Intent;action=android.intent.action.SEND;type=text/plain;launchFlags=0x10000000;package=org.wikipedia;S.android.intent.extra.TEXT=%s;end", "intent://www.wikipedia.org/wiki/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    YOUTUBE("com.google.android.youtube", 2132019596, null, "intent://www.youtube.com/results?search_query=%s#Intent;scheme=https;launchFlags=0x10000000;package=com.google.android.youtube;end", "intent://www.youtube.com/results?search_query=%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null),
    YOUTUBE_MUSIC("com.google.android.apps.youtube.music", 2132019597, null, "intent:#Intent;action=android.intent.action.SEARCH;launchFlags=0x10000000;package=com.google.android.apps.youtube.music;S.query=%s;end", "intent:#Intent;action=android.intent.action.SEARCH;launchFlags=0x10000000;package=com.google.android.apps.youtube.music;S.query=%s;end", 4, null);


    @NotNull
    private final String appTemplate;

    @Nullable
    private final Integer iconRes;

    @NotNull
    private final IdHash idHash;
    private final int labelRes;

    @NotNull
    private final String packageName;

    @Nullable
    private final String webTemplate;

    SearchMoreType(String str, int i5, Integer num, String str2, String str3) {
        this.packageName = str;
        this.labelRes = i5;
        this.iconRes = num;
        this.appTemplate = str2;
        this.webTemplate = str3;
        this.idHash = IdHash.Companion.m320ofKY3lZgs$default(IdHash.INSTANCE, u40.a.f90555d, name(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L, (byte) 0, 16, null);
    }

    @NotNull
    public final String getAppTemplate() {
        return this.appTemplate;
    }

    @Nullable
    public final Integer getIconRes() {
        return this.iconRes;
    }

    @Nullable
    public final Uri getIconUri(@NotNull Context context) {
        Intrinsics.g(context, "context");
        Integer num = this.iconRes;
        if (num == null) {
            return null;
        }
        int iIntValue = num.intValue();
        Utils utils = Utils.INSTANCE;
        String packageName = context.getPackageName();
        Intrinsics.f(packageName, "context.packageName");
        return utils.makeResUri(packageName, iIntValue);
    }

    @NotNull
    public final IdHash getIdHash() {
        return this.idHash;
    }

    public final int getLabelRes() {
        return this.labelRes;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    public final String getWebTemplate() {
        return this.webTemplate;
    }

    /* synthetic */ SearchMoreType(String str, int i5, Integer num, String str2, String str3, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, i5, (i11 & 4) != 0 ? null : num, str2, (i11 & 16) != 0 ? null : str3);
    }
}
