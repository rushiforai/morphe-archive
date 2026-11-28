.class public final Le/e/a/AppResume253;
.super Ljava/lang/Object;
.source "AppResume253.java"


# static fields
.field private static final FULL:Ljava/lang/String; = "nicoid_fullscreen262"

.field private static final FULL_FLAG:Ljava/lang/String; = "nicoid_fullscreen_resume262"

.field private static final KEEP:Ljava/lang/String; = "background"

.field private static final KEY:Ljava/lang/String; = "nicoid_app_resume_playback"

.field private static final MAIN:Landroid/os/Handler;

.field private static final MODE:Ljava/lang/String; = "app_switch_playback"

.field private static final NORMAL:Ljava/lang/String; = "normal"

.field private static final OBSERVERS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/preference/PreferenceActivity;",
            "Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "nicoid-resume253"

.field private static away:Z

.field private static directReturnDeadline:J

.field private static fullscreenOwner:Landroid/app/Service;

.field private static generation:I

.field private static restoring:Z

.field private static resumeTarget:Ljava/lang/ref/WeakReference;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 27
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/AppResume253;->MAIN:Landroid/os/Handler;

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/AppResume253;->OBSERVERS:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static clearLegacyArm()V
    .registers 2

    .line 80
    :try_start_0
    const-string v0, "e.e.a.PlaybackReturn"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "automaticVideo"

    invoke-static {v0, v1}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method static deferMiniOnReturn(Landroid/app/Activity;)Z
    .registers 7

    sget-boolean v0, Le/e/a/AppResume253;->away:Z

    if-nez v0, :cond_0

    sget-wide v0, Le/e/a/AppResume253;->directReturnDeadline:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    :cond_0
    invoke-static {p0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "app_switch_playback"

    const-string v2, "none"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/AppResume253;->supported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0}, Le/e/a/AppResume253;->selection(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "background"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static enterExistingFullscreen(Landroid/app/Activity;)V
    .registers 7

    .line 70
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "v"

    invoke-static {v0, v1}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 72
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a0"

    invoke-static {v1, v2}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 73
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "isPlaying"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 74
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "B0"

    invoke-static {v1, v2}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "C0"

    invoke-static {v1, v2}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 76
    invoke-static {p0, v0, v1}, Le/e/a/PlayerGestures219;->fullscreen(Landroid/app/Activity;Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p0

    .line 77
    const-string v0, "nicoid-resume253"

    const-string v1, "Unable to restore fullscreen on existing player"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    :goto_0
    if-eqz p0, :cond_0

    .line 85
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 84
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 87
    :cond_0
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static handoffPending()Z
    .registers 3

    const/4 v0, 0x0

    .line 105
    :try_start_0
    const-string v1, "e.e.a.PopupReturn244"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "pending"

    invoke-static {v1, v2}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :catch_0
    :cond_0
    return v0
.end method

.method public static install(Landroid/preference/PreferenceActivity;)V
    .registers 4

    .line 155
    invoke-static {p0}, Le/e/a/AppResume253;->valid(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    invoke-static {p0}, Le/e/a/AppResume253;->refresh(Landroid/preference/PreferenceActivity;)V

    .line 157
    sget-object v0, Le/e/a/AppResume253;->OBSERVERS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    return-void

    .line 158
    :cond_1
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 159
    new-instance v2, Le/e/a/AppResume253$2;

    invoke-direct {v2, v1}, Le/e/a/AppResume253$2;-><init>(Ljava/lang/ref/WeakReference;)V

    .line 163
    invoke-static {p0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 164
    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/ref/WeakReference;I)V
    .registers 3

    const/4 v0, 0x0

    .line 65
    invoke-static {p0, p1, v0}, Le/e/a/AppResume253;->restore(Ljava/lang/ref/WeakReference;II)V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/ref/WeakReference;II)V
    .registers 3

    add-int/lit8 p2, p2, 0x1

    .line 133
    invoke-static {p0, p1, p2}, Le/e/a/AppResume253;->restore(Ljava/lang/ref/WeakReference;II)V

    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/ref/WeakReference;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 160
    const-string p1, "app_switch_playback"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "nicoid_app_resume_playback"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "nicoid_fullscreen_resume262"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "app_lang"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 161
    :cond_0
    sget-object p1, Le/e/a/AppResume253;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/AppResume253$4;

    invoke-direct {p2, p0}, Le/e/a/AppResume253$4;-><init>(Ljava/lang/ref/WeakReference;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 161
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/preference/PreferenceActivity;

    invoke-static {p0}, Le/e/a/AppResume253;->valid(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/AppResume253;->refresh(Landroid/preference/PreferenceActivity;)V

    :cond_0
    return-void
.end method

.method static synthetic lambda$4(Landroid/preference/ListPreference;Landroid/content/SharedPreferences;Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 8

    .line 188
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 189
    invoke-virtual {p0, p3}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result p4

    const/4 v0, 0x0

    if-gez p4, :cond_0

    return v0

    .line 190
    :cond_0
    const-string p4, "nicoid_fullscreen262"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    .line 191
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    if-eqz p4, :cond_1

    const-string v1, "normal"

    goto :goto_0

    :cond_1
    move-object v1, p3

    :goto_0
    const-string v2, "nicoid_app_resume_playback"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "nicoid_fullscreen_resume262"

    invoke-interface {p1, v1, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 192
    invoke-static {p2, p0, p3}, Le/e/a/AppResume253;->showSelection(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;Ljava/lang/String;)V

    return v0
.end method

.method public static declared-synchronized left(Landroid/content/Context;)V
    .registers 4

    invoke-static {p0}, Le/e/a/PopupSwitch216;->left(Landroid/content/Context;)V

    const-class v0, Le/e/a/AppResume253;

    monitor-enter v0

    if-nez p0, :cond_0

    .line 37
    monitor-exit v0

    return-void

    .line 38
    :cond_0
    :try_start_0
    invoke-static {p0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "app_switch_playback"

    const-string v2, "none"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/AppResume253;->supported(Ljava/lang/String;)Z

    move-result p0

    const/4 v1, 0x1

    if-nez p0, :cond_1

    const/4 p0, 0x0

    sput-boolean p0, Le/e/a/AppResume253;->away:Z

    sget p0, Le/e/a/AppResume253;->generation:I

    add-int/2addr p0, v1

    sput p0, Le/e/a/AppResume253;->generation:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    .line 39
    :cond_1
    :try_start_1
    sput-boolean v1, Le/e/a/AppResume253;->away:Z

    sget p0, Le/e/a/AppResume253;->generation:I

    add-int/2addr p0, v1

    sput p0, Le/e/a/AppResume253;->generation:I

    .line 40
    const-string p0, "nicoid-resume253"

    const-string v1, "App backgrounded; awaiting true foreground transition"

    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    monitor-exit v0

    return-void

    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 33
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static prepareReturn(Landroid/app/Service;Landroid/content/Intent;)V
    .registers 4

    if-eqz p0, :cond_0

    .line 139
    sget-object v0, Le/e/a/AppResume253;->fullscreenOwner:Landroid/app/Service;

    if-ne p0, v0, :cond_0

    .line 140
    const-string p0, "isFullScreen"

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 141
    const-string p1, "isLandscape"

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 142
    const-string p1, "nicoid_portrait_restore"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    .line 143
    const-string p1, "nicoid_fullscreen_handoff208"

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const/high16 p1, 0x10000

    .line 144
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 1

    invoke-static {p0}, Le/e/a/ResumeModes272;->refresh(Landroid/preference/PreferenceActivity;)V

    return-void
.end method

.method private static restore(Ljava/lang/ref/WeakReference;II)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;II)V"
        }
    .end annotation

    .line 109
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 110
    invoke-static {v0}, Le/e/a/AppResume253;->valid(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 111
    const-class v1, Le/e/a/AppResume253;

    monitor-enter v1

    :try_start_0
    sget v2, Le/e/a/AppResume253;->generation:I

    if-ne p1, v2, :cond_8

    sget-boolean v2, Le/e/a/AppResume253;->restoring:Z

    if-nez v2, :cond_8

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 112
    invoke-static {v0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 113
    invoke-static {v0}, Le/e/a/AppResume253;->selection(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v2

    .line 114
    const-string v3, "background"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    const-string v3, "app_switch_playback"

    const-string v4, "none"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/AppResume253;->supported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 115
    invoke-static {}, Le/e/a/AppResume253;->handoffPending()Z

    move-result v0

    if-nez v0, :cond_7

    .line 116
    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ResumeGuard273;->matches(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-wide/16 v3, 0x0

    sput-wide v3, Le/e/a/AppResume253;->directReturnDeadline:J

    return-void

    :cond_0
    if-eqz v0, :cond_4

    .line 118
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "e"

    invoke-static {v3, v4}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-nez v3, :cond_1

    move-wide v8, v4

    goto :goto_0

    .line 119
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "getDuration"

    new-array v10, v6, [Ljava/lang/Class;

    invoke-virtual {v8, v9, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    :goto_0
    cmp-long v3, v8, v4

    if-lez v3, :cond_4

    .line 121
    monitor-enter v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    sget v3, Le/e/a/AppResume253;->generation:I

    if-ne p1, v3, :cond_3

    sget-boolean v3, Le/e/a/AppResume253;->restoring:Z

    if-nez v3, :cond_3

    const/4 v3, 0x1

    sput-boolean v3, Le/e/a/AppResume253;->restoring:Z

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 124
    :try_start_3
    const-string v3, "nicoid_fullscreen262"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    sput-object v0, Le/e/a/AppResume253;->fullscreenOwner:Landroid/app/Service;

    .line 125
    :cond_2
    invoke-static {v0}, Le/e/a/Dev115;->seamlessReturn(Ljava/lang/Object;)Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    :try_start_4
    sput-object v7, Le/e/a/AppResume253;->fullscreenOwner:Landroid/app/Service;

    .line 128
    monitor-enter v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :try_start_5
    sput-boolean v6, Le/e/a/AppResume253;->restoring:Z

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v0, :cond_4

    const-wide/16 v2, 0x0

    sput-wide v2, Le/e/a/AppResume253;->directReturnDeadline:J

    .line 130
    :try_start_6
    const-string v0, "nicoid-resume253"

    const-string v1, "Retained decoder handed to normal player on app return"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    return-void

    .line 128
    :goto_1
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catchall_1
    move-exception v0

    .line 127
    sput-object v7, Le/e/a/AppResume253;->fullscreenOwner:Landroid/app/Service;

    .line 128
    const-class v1, Le/e/a/AppResume253;

    monitor-enter v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    :try_start_9
    sput-boolean v6, Le/e/a/AppResume253;->restoring:Z

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 129
    :try_start_a
    throw v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 128
    :goto_2
    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :try_start_c
    throw v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 121
    :cond_3
    :try_start_d
    monitor-exit v1

    return-void

    :goto_3
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :try_start_e
    throw v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0

    :catchall_3
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 132
    const-string v1, "nicoid-resume253"

    const-string v2, "Waiting for prepared player"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    const/16 v0, 0x23

    if-ge p2, v0, :cond_5

    .line 133
    sget-object v0, Le/e/a/AppResume253;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/AppResume253$0;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/AppResume253$0;-><init>(Ljava/lang/ref/WeakReference;II)V

    const-wide/16 p0, 0x96

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_4

    .line 134
    :cond_5
    const-wide/16 v2, 0x0

    sput-wide v2, Le/e/a/AppResume253;->directReturnDeadline:J

    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-static {v2}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    :cond_6
    const-string p0, "nicoid-resume253"

    const-string p1, "No prepared service available for app return"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    :goto_4
    return-void

    .line 111
    :cond_8
    :try_start_f
    monitor-exit v1

    return-void

    :goto_5
    monitor-exit v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    throw p0

    :catchall_4
    move-exception p0

    goto :goto_5
.end method

.method public static resumed(Landroid/app/Activity;)Z
    .registers 8

    .line 45
    invoke-static {p0}, Le/e/a/AppResume253;->valid(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 47
    :cond_0
    const-class v0, Le/e/a/AppResume253;

    monitor-enter v0

    .line 48
    :try_start_0
    sget-boolean v2, Le/e/a/AppResume253;->away:Z

    if-eqz v2, :cond_5

    sget-boolean v2, Le/e/a/AppResume253;->restoring:Z

    if-nez v2, :cond_5

    .line 49
    sput-boolean v1, Le/e/a/AppResume253;->away:Z

    sget v1, Le/e/a/AppResume253;->generation:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    sput v1, Le/e/a/AppResume253;->generation:I

    .line 47
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    invoke-static {}, Le/e/a/PopupSwitch216;->cancelPending236()V

    invoke-static {}, Le/e/a/AppResume253;->clearLegacyArm()V

    .line 52
    invoke-static {}, Le/e/a/Dev111;->suppressAutoReturn()V

    .line 53
    invoke-static {p0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "app_switch_playback"

    const-string v4, "none"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    invoke-static {p0}, Le/e/a/AppResume253;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-static {v3}, Le/e/a/AppResume253;->selection(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v3

    .line 55
    invoke-static {v0}, Le/e/a/AppResume253;->supported(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string v4, "background"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 59
    const-string v0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 60
    const-string v0, "nicoid_fullscreen262"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Le/e/a/AppResume253;->enterExistingFullscreen(Landroid/app/Activity;)V

    .line 61
    :cond_1
    const-string p0, "nicoid-resume253"

    const-string v0, "Player Activity already foreground; no additional launch"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 64
    :cond_2
    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ResumeGuard273;->capture(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v0, "nicoid-resume253"

    const-string v3, "No retained session on foreground entry; skip automatic return"

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    sput-wide v0, Le/e/a/AppResume253;->directReturnDeadline:J

    return v2

    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x1770

    add-long/2addr v2, v4

    sput-wide v2, Le/e/a/AppResume253;->directReturnDeadline:J

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 65
    sget-object p0, Le/e/a/AppResume253;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/AppResume253$1;

    invoke-direct {v3, v0, v1}, Le/e/a/AppResume253$1;-><init>(Ljava/lang/ref/WeakReference;I)V

    const-wide/16 v0, 0x78

    invoke-virtual {p0, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 v2, 0x1

    return v2

    .line 56
    :cond_4
    const-string p0, "nicoid-resume253"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Retain existing playback presentation="

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 48
    :cond_5
    :try_start_1
    monitor-exit v0

    return v1

    .line 47
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method private static selection(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Le/e/a/ResumeModes272;->selection(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static service()Landroid/app/Service;
    .registers 5

    .line 91
    const-string v0, "active"

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "e.e.a.DirectBackground235"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 93
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "service"

    invoke-static {v3, v4}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 94
    instance-of v3, v2, Landroid/app/Service;

    if-eqz v3, :cond_0

    check-cast v2, Landroid/app/Service;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 98
    :catch_0
    :cond_0
    :try_start_1
    const-string v2, "e.e.a.PlaybackReturn"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2, v0}, Le/e/a/AppResume253;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 99
    instance-of v2, v0, Ljava/lang/ref/Reference;

    if-eqz v2, :cond_1

    check-cast v0, Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, v1

    .line 100
    :goto_0
    instance-of v2, v0, Landroid/app/Service;

    if-eqz v2, :cond_2

    check-cast v0, Landroid/app/Service;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    :cond_2
    return-object v1
.end method

.method private static showSelection(Landroid/preference/PreferenceActivity;Landroid/preference/ListPreference;Ljava/lang/String;)V
    .registers 6

    .line 198
    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 200
    const-string p2, "Playback behavior when returning to the app"

    const-string/jumbo v0, "\u8fd4\u56de\u61c9\u7528\u7a0b\u5f0f\u6642\u7684\u64ad\u653e\u65b9\u5f0f"

    .line 199
    const-string v1, "\u30a2\u30d7\u30ea\u306b\u623b\u3063\u305f\u3068\u304d\u306e\u518d\u751f\u65b9\u6cd5"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "\uff1a"

    const-string v2, ": "

    invoke-static {p0, v1, v2, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static supported(Ljava/lang/String;)Z
    .registers 2

    invoke-static {p0}, Le/e/a/ResumeModes272;->shouldArm(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static valid(Landroid/app/Activity;)Z
    .registers 2

    if-eqz p0, :cond_0

    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
