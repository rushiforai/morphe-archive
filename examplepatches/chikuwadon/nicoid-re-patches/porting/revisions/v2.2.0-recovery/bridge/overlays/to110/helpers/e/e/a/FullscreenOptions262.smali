.class public final Le/e/a/FullscreenOptions262;
.super Ljava/lang/Object;
.source "FullscreenOptions262.java"


# static fields
.field private static final FLAG_LINK:Ljava/lang/String; = "nicoid_fullscreen_link262"

.field private static final FLAG_TAP:Ljava/lang/String; = "nicoid_fullscreen_tap262"

.field private static final HANDOFF:Ljava/lang/String; = "nicoid_fullscreen_handoff208"

.field public static final MENU_ID:I = 0x46f9

.field private static final PENDING_SETTINGS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final PREF_LINK:Ljava/lang/String; = "intent_type"

.field private static final PREF_TAP:Ljava/lang/String; = "videolist_tap"

.field private static final SETTINGS_MAIN:Landroid/os/Handler;

.field private static final SPECIAL:Ljava/lang/String; = "nicoid_fullscreen262"

.field private static labelContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 34
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/FullscreenOptions262;->labelContext:Ljava/lang/ref/WeakReference;

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FullscreenOptions262;->SETTINGS_MAIN:Landroid/os/Handler;

    .line 36
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenOptions262;->PENDING_SETTINGS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    if-eqz p2, :cond_4

    .line 170
    invoke-static {p2}, Le/e/a/FullscreenOptions262;->register(Landroid/content/Context;)V

    const/4 p3, 0x0

    move v0, p3

    .line 172
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, -0x1

    goto :goto_1

    .line 173
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ListActions$Action;

    .line 174
    iget v2, v1, Le/e/a/ListActions$Action;->id:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_3

    iget-boolean v2, v1, Le/e/a/ListActions$Action;->enabled:Z

    if-eqz v2, :cond_3

    iget-object v1, v1, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    if-eqz v1, :cond_3

    :goto_1
    if-ltz v0, :cond_4

    .line 177
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ListActions$Action;

    .line 179
    iget-object v2, v1, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    .line 180
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v3

    new-instance v4, Le/e/a/FullscreenOptions262$2;

    invoke-direct {v4}, Le/e/a/FullscreenOptions262$2;-><init>()V

    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v3

    if-nez v3, :cond_1

    const/16 v3, 0x46f9

    .line 181
    invoke-static {p2}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p3, v3, p3, p2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    .line 182
    new-instance v3, Le/e/a/ListActions$Action;

    new-instance v4, Le/e/a/FullscreenOptions262$3;

    invoke-direct {v4, v2}, Le/e/a/FullscreenOptions262$3;-><init>(Ljava/lang/Runnable;)V

    invoke-direct {v3, p2, v4}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    :cond_1
    iget p2, v1, Le/e/a/ListActions$Action;->id:I

    invoke-interface {p0, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    if-nez p2, :cond_2

    .line 188
    iget p2, v1, Le/e/a/ListActions$Action;->id:I

    iget-object v1, v1, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p0, p3, p2, p3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    .line 189
    :cond_2
    new-instance p0, Le/e/a/ListActions$Action;

    new-instance p3, Le/e/a/FullscreenOptions262$4;

    invoke-direct {p3, v2}, Le/e/a/FullscreenOptions262$4;-><init>(Ljava/lang/Runnable;)V

    invoke-direct {p0, p2, p3}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v0, p0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public static declared-synchronized armMenu()V
    .registers 3

    const-class v0, Le/e/a/FullscreenOptions262;

    monitor-enter v0

    .line 159
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Le/e/a/PlaybackChoice266;->armFullscreen(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method public static declared-synchronized armNormal()V
    .registers 3

    const-class v0, Le/e/a/FullscreenOptions262;

    monitor-enter v0

    .line 162
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Le/e/a/PlaybackChoice266;->armNormal(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method public static declared-synchronized cancelMenuChoice()V
    .registers 2

    const-class v0, Le/e/a/FullscreenOptions262;

    monitor-enter v0

    .line 165
    :try_start_0
    invoke-static {}, Le/e/a/PlaybackChoice266;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    monitor-exit v0

    return-void

    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method private static install(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    .line 62
    invoke-virtual {p0, p1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 63
    instance-of v1, v0, Landroid/preference/ListPreference;

    if-eqz v1, :cond_6

    .line 64
    move-object v7, v0

    check-cast v7, Landroid/preference/ListPreference;

    .line 65
    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v0, :cond_6

    if-eqz v1, :cond_6

    .line 66
    array-length v2, v0

    if-eqz v2, :cond_6

    array-length v2, v0

    array-length v3, v1

    if-ne v2, v3, :cond_6

    .line 70
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    const-string v5, "nicoid_fullscreen262"

    if-lt v4, v2, :cond_0

    .line 74
    array-length v2, v0

    add-int/lit8 v2, v2, 0x1

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    .line 75
    array-length v4, v1

    add-int/lit8 v4, v4, 0x1

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    .line 76
    array-length v0, v0

    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v0

    array-length v0, v1

    aput-object v5, v4, v0

    .line 77
    invoke-virtual {v7, v2}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    invoke-virtual {v7, v4}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 70
    :cond_0
    aget-object v6, v1, v4

    .line 71
    invoke-virtual {v5, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 79
    :goto_1
    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    .line 80
    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Le/e/a/FullscreenOptions262;->normalIndex([Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)I

    move-result v0

    if-ltz v0, :cond_6

    .line 83
    aget-object v0, v1, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 85
    invoke-interface {v4, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 86
    invoke-interface {v4, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 87
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_1
    move-object v2, v0

    .line 90
    :cond_2
    invoke-virtual {v7, v3}, Landroid/preference/ListPreference;->setPersistent(Z)V

    if-nez v1, :cond_3

    move-object v5, v2

    .line 91
    :cond_3
    invoke-virtual {v7, v5}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    if-eqz v1, :cond_4

    .line 92
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_4
    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    :goto_2
    invoke-virtual {v7, v1}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 93
    new-instance v2, Le/e/a/FullscreenOptions262$1;

    move-object v8, p0

    move-object v5, p1

    move-object v6, p2

    move-object v3, v0

    invoke-direct/range {v2 .. v8}, Le/e/a/FullscreenOptions262$1;-><init>(Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Landroid/preference/ListPreference;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v7, v2}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method public static label(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 43
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "app_lang"

    const-string v1, "-1"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 44
    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "zh"

    const-string v2, "ja"

    if-eqz v0, :cond_0

    move-object p0, v2

    goto :goto_0

    :cond_0
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "en"

    goto :goto_0

    .line 45
    :cond_1
    const-string v0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    move-object p0, v1

    goto :goto_0

    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 46
    :goto_0
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "\u5168\u87a2\u5e55\u64ad\u653e"

    return-object p0

    .line 47
    :cond_3
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "\u5168\u753b\u9762\u518d\u751f"

    return-object p0

    :cond_4
    const-string p0, "Fullscreen playback"

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Landroid/preference/ListPreference;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 8

    .line 94
    invoke-static {p7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p6

    .line 95
    const-string p7, "nicoid_fullscreen262"

    invoke-virtual {p7, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p7

    if-nez p7, :cond_0

    move-object p0, p6

    .line 97
    :cond_0
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p3, p7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 98
    invoke-virtual {p4, p6}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p4, p6}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_1

    .line 100
    invoke-virtual {p4}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object p1

    aget-object p0, p1, p0

    goto :goto_0

    :cond_1
    invoke-static {p5}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {p4, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 116
    sget-object v0, Le/e/a/FullscreenOptions262;->PENDING_SETTINGS:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    invoke-static {p0}, Le/e/a/FullscreenOptions265;->settings(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void

    .line 116
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method static synthetic lambda$2(Le/e/a/ListActions$Action;)Z
    .registers 2

    .line 180
    iget p0, p0, Le/e/a/ListActions$Action;->id:I

    const/16 v0, 0x46f9

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$3(Ljava/lang/Runnable;)V
    .registers 1

    .line 183
    invoke-static {}, Le/e/a/FullscreenOptions262;->armMenu()V

    .line 184
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    invoke-static {}, Le/e/a/FullscreenOptions262;->cancelMenuChoice()V

    throw p0
.end method

.method static synthetic lambda$4(Ljava/lang/Runnable;)V
    .registers 1

    .line 190
    invoke-static {}, Le/e/a/FullscreenOptions262;->armNormal()V

    .line 191
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    invoke-static {}, Le/e/a/FullscreenOptions262;->cancelMenuChoice()V

    throw p0
.end method

.method private static normalIndex([Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)I
    .registers 9

    const/4 v0, -0x1

    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    const/4 v1, 0x0

    move v2, v1

    .line 51
    :goto_0
    array-length v3, p0

    array-length v4, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 59
    array-length p0, p0

    if-lez p0, :cond_0

    return v1

    :cond_0
    return v0

    .line 52
    :cond_1
    aget-object v3, p1, v2

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 53
    aget-object v4, p0, v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 54
    const-string v5, "normal"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    const-string v6, "play"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 55
    const-string/jumbo v3, "\u901a\u5e38\u518d\u751f"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "\u52d5\u753b\u518d\u751f"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 56
    const-string v3, "normal playback"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "play video"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 57
    const-string v3, "\u4e00\u822c\u64ad\u653e"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "\u64ad\u653e\u5f71\u7247"

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v2

    :cond_3
    return v0
.end method

.method public static onVideoCreated(Landroid/app/Activity;)V
    .registers 7

    if-eqz p0, :cond_3

    .line 197
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 198
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 199
    const-string v1, "nicoid_continue_mini203"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_3

    .line 200
    const-string v1, "nicoid_popup_return_244"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 201
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 202
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Le/e/a/PlaybackChoice266;->consume(J)I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    if-nez v3, :cond_2

    .line 207
    :try_start_0
    invoke-static {p0}, Le/e/a/ExternalBack218;->isExternalVideo(Landroid/app/Activity;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move p0, v2

    :goto_1
    if-eqz p0, :cond_1

    .line 209
    const-string p0, "nicoid_fullscreen_link262"

    goto :goto_2

    :cond_1
    const-string p0, "nicoid_fullscreen_tap262"

    :goto_2
    invoke-interface {v1, p0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    :cond_2
    if-eqz v3, :cond_3

    .line 212
    const-string p0, "isFullScreen"

    invoke-virtual {v0, p0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 213
    const-string v0, "isLandscape"

    invoke-virtual {p0, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 214
    const-string v0, "nicoid_fullscreen_handoff208"

    invoke-virtual {p0, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_3
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 40
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepareEditorOrder(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 149
    sget-object v0, Le/e/a/FullscreenOptions262;->labelContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 150
    invoke-static {v0}, Le/e/a/FullscreenOptions262;->register(Landroid/content/Context;)V

    :cond_0
    if-eqz p0, :cond_1

    const/16 v0, 0x46f9

    .line 151
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0x9

    .line 152
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_1

    .line 153
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_1
    return-void
.end method

.method private static register(Landroid/content/Context;)V
    .registers 9

    .line 133
    sget-object v0, Le/e/a/MenuOptions119;->LABELS:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    return-void

    .line 135
    :cond_0
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x46f9

    .line 136
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 138
    :cond_1
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 140
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4

    if-nez v4, :cond_3

    .line 144
    invoke-virtual {v2, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    :cond_3
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    return-void

    .line 140
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 141
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, 0x6

    if-ne v5, v6, :cond_2

    invoke-virtual {v2, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x1

    goto :goto_0
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 109
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->settingsCore(Landroid/preference/PreferenceActivity;)V

    if-nez p0, :cond_0

    return-void

    .line 111
    :cond_0
    sget-object v0, Le/e/a/FullscreenOptions262;->PENDING_SETTINGS:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 112
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    monitor-exit v0

    return-void

    .line 113
    :cond_1
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    sget-object v0, Le/e/a/FullscreenOptions262;->SETTINGS_MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/FullscreenOptions262$0;

    invoke-direct {v1, p0}, Le/e/a/FullscreenOptions262$0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 111
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public static settingsCore(Landroid/preference/PreferenceActivity;)V
    .registers 3

    if-nez p0, :cond_0

    return-void

    .line 125
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/FullscreenOptions262;->labelContext:Ljava/lang/ref/WeakReference;

    .line 126
    const-string v0, "videolist_tap"

    const-string v1, "nicoid_fullscreen_tap262"

    invoke-static {p0, v0, v1}, Le/e/a/FullscreenOptions262;->install(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v0, "intent_type"

    const-string v1, "nicoid_fullscreen_link262"

    invoke-static {p0, v0, v1}, Le/e/a/FullscreenOptions262;->install(Landroid/preference/PreferenceActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    invoke-static {p0}, Le/e/a/FullscreenOptions262;->register(Landroid/content/Context;)V

    return-void
.end method
