package nova.branch.engage.sesame_lite.internal;

import android.content.Context;
import android.net.Uri;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0018\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B9\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010!\u001a\u0004\u0018\u00010\"2\u0006\u0010#\u001a\u00020$R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u0011\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\fR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\fR\u0011\u0010\u001d\u001a\u00020\u001e¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001c¨\u0006%"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/SearchMoreType;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "labelRes", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iconRes", "appTemplate", "webTemplate", "<init>", "(Ljava/lang/String;ILjava/lang/String;ILjava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V", "getPackageName", "()Ljava/lang/String;", "getLabelRes", "()I", "getIconRes", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getAppTemplate", "getWebTemplate", "GOOGLE", "GOOGLE_MAPS", "GOOGLE_PLAY_STORE", "GOOGLE_TRANSLATE", "NETFLIX", "SPOTIFY", "WIKIPEDIA", "YOUTUBE", "YOUTUBE_MUSIC", "idHash", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "getIdHash", "()Lnova/branch/engage/sesame_lite/internal/IdHash;", "getIconUri", "Landroid/net/Uri;", "context", "Landroid/content/Context;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SearchMoreType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ SearchMoreType[] $VALUES;
    public static final SearchMoreType GOOGLE = new SearchMoreType("GOOGLE", 0, "com.google.android.googlequicksearchbox", 2132019588, 2131231803, "intent://www.google.com/search?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end", "intent://www.google.com/search?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end");
    public static final SearchMoreType GOOGLE_MAPS = new SearchMoreType("GOOGLE_MAPS", 1, "com.google.android.apps.maps", 2132019589, null, "intent://maps.google.com/maps?q=%s#Intent;scheme=https;launchFlags=0x10000000;package=com.google.android.apps.maps;end", "intent://maps.google.com/maps?q=%s#Intent;scheme=https;action=android.intent.action.VIEW;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType GOOGLE_PLAY_STORE = new SearchMoreType("GOOGLE_PLAY_STORE", 2, "com.android.vending", 2132019590, null, "intent://play.google.com/store/search?q=%s&c=apps#Intent;scheme=https;launchFlags=0x10000000;package=com.android.vending;end", "intent://play.google.com/store/search?q=%s&c=apps#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType GOOGLE_TRANSLATE = new SearchMoreType("GOOGLE_TRANSLATE", 3, "com.google.android.apps.translate", 2132019591, null, "intent:#Intent;action=android.intent.action.SEND;type=text/plain;launchFlags=0x10008000;package=com.google.android.apps.translate;S.android.intent.extra.TEXT=%s;end", "intent://translate.google.com/?text=%s&op=translate#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType NETFLIX = new SearchMoreType("NETFLIX", 4, "com.netflix.mediaclient", 2132019592, null, "intent://www.netflix.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;package=com.netflix.mediaclient;end", "intent://www.netflix.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType SPOTIFY = new SearchMoreType("SPOTIFY", 5, "com.spotify.music", 2132019594, null, "intent://open.spotify.com/search/%s#Intent;scheme=https;launchFlags=0x10000000;package=com.spotify.music;end", "intent://open.spotify.com/search/results/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType WIKIPEDIA = new SearchMoreType("WIKIPEDIA", 6, "org.wikipedia", 2132019595, null, "intent:#Intent;action=android.intent.action.SEND;type=text/plain;launchFlags=0x10000000;package=org.wikipedia;S.android.intent.extra.TEXT=%s;end", "intent://www.wikipedia.org/wiki/%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType YOUTUBE = new SearchMoreType("YOUTUBE", 7, "com.google.android.youtube", 2132019596, null, "intent://www.youtube.com/results?search_query=%s#Intent;scheme=https;launchFlags=0x10000000;package=com.google.android.youtube;end", "intent://www.youtube.com/results?search_query=%s#Intent;scheme=https;launchFlags=0x10000000;end", 4, null);
    public static final SearchMoreType YOUTUBE_MUSIC = new SearchMoreType("YOUTUBE_MUSIC", 8, "com.google.android.apps.youtube.music", 2132019597, null, "intent:#Intent;action=android.intent.action.SEARCH;launchFlags=0x10000000;package=com.google.android.apps.youtube.music;S.query=%s;end", "intent:#Intent;action=android.intent.action.SEARCH;launchFlags=0x10000000;package=com.google.android.apps.youtube.music;S.query=%s;end", 4, null);

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

    private static final /* synthetic */ SearchMoreType[] $values() {
        return new SearchMoreType[]{GOOGLE, GOOGLE_MAPS, GOOGLE_PLAY_STORE, GOOGLE_TRANSLATE, NETFLIX, SPOTIFY, WIKIPEDIA, YOUTUBE, YOUTUBE_MUSIC};
    }

    static {
        SearchMoreType[] searchMoreTypeArr$values = $values();
        $VALUES = searchMoreTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(searchMoreTypeArr$values);
    }

    private SearchMoreType(String str, int i5, String str2, int i11, Integer num, String str3, String str4) {
        this.packageName = str2;
        this.labelRes = i11;
        this.iconRes = num;
        this.appTemplate = str3;
        this.webTemplate = str4;
        this.idHash = IdHash.Companion.m448ofKY3lZgs$default(IdHash.INSTANCE, r80.d.f85657d, name(), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L, (byte) 0, 16, null);
    }

    @NotNull
    public static EnumEntries<SearchMoreType> getEntries() {
        return $ENTRIES;
    }

    public static SearchMoreType valueOf(String str) {
        return (SearchMoreType) Enum.valueOf(SearchMoreType.class, str);
    }

    public static SearchMoreType[] values() {
        return (SearchMoreType[]) $VALUES.clone();
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
        Intrinsics.f(packageName, "getPackageName(...)");
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

    public /* synthetic */ SearchMoreType(String str, int i5, String str2, int i11, Integer num, String str3, String str4, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, i5, str2, i11, (i12 & 4) != 0 ? null : num, str3, (i12 & 16) != 0 ? null : str4);
    }
}
