.class public final Le/e/a/FullscreenSettings270;
.super Ljava/lang/Object;
.source "FullscreenSettings270.java"


# static fields
.field private static final LANGUAGE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final ORDER_KEYS:[Ljava/lang/String;

.field private static final PENDING:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final RESUME:Ljava/lang/String; = "nicoid_app_resume_playback"

.field private static final SPECIAL:Ljava/lang/String; = "nicoid_fullscreen262"

.field private static final TAG:Ljava/lang/String; = "nicoid-playback-settings"


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 36
    const-string v0, "app_switch_playback"

    .line 37
    const-string v1, "back_playback"

    const-string v2, "videolist_tap"

    const-string v3, "intent_type"

    const-string v4, "nicoid_external_link_back"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 32
    sput-object v0, Le/e/a/FullscreenSettings270;->ORDER_KEYS:[Ljava/lang/String;

    .line 39
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FullscreenSettings270;->MAIN:Landroid/os/Handler;

    .line 40
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenSettings270;->PENDING:Ljava/util/WeakHashMap;

    .line 42
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FullscreenSettings270;->LANGUAGE:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/preference/PreferenceActivity;)Z
    .registers 1

    .line 79
    invoke-static {p0}, Le/e/a/FullscreenSettings270;->applyNow(Landroid/preference/PreferenceActivity;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1()Ljava/util/WeakHashMap;
    .registers 1

    .line 40
    sget-object v0, Le/e/a/FullscreenSettings270;->PENDING:Ljava/util/WeakHashMap;

    return-object v0
.end method

.method static synthetic access$2()Landroid/os/Handler;
    .registers 1

    .line 39
    sget-object v0, Le/e/a/FullscreenSettings270;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private static applyNow(Landroid/preference/PreferenceActivity;)Z
    .registers 14

    .line 80
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_6

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_6

    .line 81
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    return v2

    .line 83
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 84
    const-string v4, ""

    invoke-static {v0, v4, v3}, Le/e/a/FullscreenSettings270;->keys(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/util/List;)V

    .line 87
    invoke-static {p0}, Le/e/a/FullscreenOptions265;->settings(Landroid/preference/PreferenceActivity;)V

    .line 88
    sget-object v5, Le/e/a/FullscreenSettings270;->ORDER_KEYS:[Ljava/lang/String;

    array-length v6, v5

    move v7, v2

    :goto_0
    if-lt v7, v6, :cond_4

    .line 100
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 101
    invoke-static {v0, v4, v5}, Le/e/a/FullscreenSettings270;->keys(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/util/List;)V

    .line 102
    invoke-interface {v3, v5}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v8, "nicoid-playback-settings"

    if-nez v0, :cond_1

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "Playback options reconciliation changed preference tree: "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " -> "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :cond_1
    const-string v0, "videolist_tap"

    const-string v3, "intent_type"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v9

    :goto_1
    const/4 v0, 0x2

    if-lt v2, v0, :cond_2

    .line 115
    invoke-static {p0}, Le/e/a/FullscreenSettings270;->patched(Landroid/preference/PreferenceActivity;)Z

    move-result p0

    return p0

    .line 107
    :cond_2
    aget-object v0, v9, v2

    .line 108
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 109
    instance-of v4, v3, Landroid/preference/ListPreference;

    if-eqz v4, :cond_3

    .line 110
    check-cast v3, Landroid/preference/ListPreference;

    .line 111
    invoke-virtual {v3}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v3

    const-string v4, "nicoid_fullscreen262"

    invoke-static {v3, v4}, Le/e/a/FullscreenSettings270;->count([Ljava/lang/CharSequence;Ljava/lang/String;)I

    move-result v3

    if-eq v3, v1, :cond_3

    .line 112
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Fullscreen value missing/duplicated for "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 88
    :cond_4
    aget-object v8, v5, v7

    .line 89
    invoke-virtual {p0, v8}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    .line 90
    instance-of v9, v8, Landroid/preference/ListPreference;

    if-eqz v9, :cond_5

    .line 91
    check-cast v8, Landroid/preference/ListPreference;

    .line 92
    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v10

    if-eqz v9, :cond_5

    if-eqz v10, :cond_5

    .line 93
    array-length v11, v9

    array-length v12, v10

    if-ne v11, v12, :cond_5

    .line 94
    invoke-virtual {v9}, [Ljava/lang/CharSequence;->clone()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/CharSequence;

    invoke-virtual {v10}, [Ljava/lang/CharSequence;->clone()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/CharSequence;

    .line 95
    invoke-static {v9, v10}, Le/e/a/PlaybackChoiceOrder270;->reorder([Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 96
    invoke-virtual {v8, v9}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 97
    invoke-virtual {v8, v10}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    :cond_6
    return v1
.end method

.method private static count([Ljava/lang/CharSequence;Ljava/lang/String;)I
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 60
    :cond_0
    array-length v1, p0

    move v2, v0

    :goto_0
    if-lt v0, v1, :cond_1

    return v2

    :cond_1
    aget-object v3, p0, v0

    invoke-virtual {p1, v3}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static keys(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceGroup;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 48
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    :cond_0
    return-void

    .line 49
    :cond_1
    invoke-virtual {p0, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v1

    .line 50
    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "@"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 52
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    instance-of v3, v1, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_3

    check-cast v1, Landroid/preference/PreferenceGroup;

    invoke-static {v1, v2, p2}, Le/e/a/FullscreenSettings270;->keys(Landroid/preference/PreferenceGroup;Ljava/lang/String;Ljava/util/List;)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 123
    const-string p1, "app_lang"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 124
    :cond_0
    sget-object p1, Le/e/a/FullscreenSettings270;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/FullscreenSettings270$3;

    invoke-direct {p2, p0}, Le/e/a/FullscreenSettings270$3;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 125
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    if-eqz p0, :cond_0

    .line 126
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/FullscreenSettings270;->reconcile(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;)V
    .registers 1

    .line 140
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    if-eqz p0, :cond_0

    .line 141
    invoke-static {p0}, Le/e/a/FullscreenSettings270;->reconcile(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method private static patched(Landroid/preference/PreferenceActivity;)Z
    .registers 6

    .line 65
    const-string v0, "nicoid_app_resume_playback"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    .line 66
    instance-of v0, p0, Landroid/preference/ListPreference;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 67
    :cond_0
    check-cast p0, Landroid/preference/ListPreference;

    .line 68
    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v0, :cond_3

    if-eqz v2, :cond_3

    .line 69
    array-length v3, v0

    array-length v4, v2

    if-ne v3, v4, :cond_3

    .line 70
    const-string v3, "nicoid_fullscreen262"

    invoke-static {v2, v3}, Le/e/a/FullscreenSettings270;->count([Ljava/lang/CharSequence;Ljava/lang/String;)I

    move-result v2

    const/4 v4, 0x1

    if-eq v2, v4, :cond_1

    return v1

    .line 71
    :cond_1
    invoke-virtual {p0, v3}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_3

    .line 72
    array-length v2, v0

    if-ge p0, v2, :cond_3

    .line 73
    aget-object p0, v0, p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 74
    const-string v0, "\u5168\u753b\u9762\u518d\u751f\u306b\u623b\u308b"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 75
    const-string/jumbo v0, "\u8fd4\u56de\u5168\u87a2\u5e55\u64ad\u653e"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 76
    const-string v0, "Return to fullscreen playback"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    return v1

    :cond_2
    return v4

    :cond_3
    return v1
.end method

.method public static reconcile(Landroid/preference/PreferenceActivity;)V
    .registers 5

    if-eqz p0, :cond_1

    .line 137
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 138
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 139
    sget-object p0, Le/e/a/FullscreenSettings270;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/FullscreenSettings270$2;

    invoke-direct {v1, v0}, Le/e/a/FullscreenSettings270$2;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 145
    :cond_0
    invoke-static {p0}, Le/e/a/FullscreenSettings270;->registerLocale(Landroid/preference/PreferenceActivity;)V

    .line 146
    invoke-static {p0}, Le/e/a/FullscreenSettings270;->applyNow(Landroid/preference/PreferenceActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    return-void

    .line 147
    :cond_2
    sget-object v0, Le/e/a/FullscreenSettings270;->PENDING:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 148
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    monitor-exit v0

    return-void

    .line 149
    :cond_3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 152
    sget-object p0, Le/e/a/FullscreenSettings270;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/FullscreenSettings270$1;

    invoke-direct {v1, v0}, Le/e/a/FullscreenSettings270$1;-><init>(Ljava/lang/ref/WeakReference;)V

    const-wide/16 v2, 0x20

    invoke-virtual {p0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 147
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

.method private static registerLocale(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 119
    sget-object v0, Le/e/a/FullscreenSettings270;->LANGUAGE:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 120
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 121
    :cond_0
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 122
    new-instance v2, Le/e/a/FullscreenSettings270$0;

    invoke-direct {v2, v1}, Le/e/a/FullscreenSettings270$0;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 129
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 130
    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 131
    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method
