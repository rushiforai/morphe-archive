.class final Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;
.super Ljava/lang/Object;
.source "CaptionLifecycleRestore.java"


# static fields
.field private static final PLAYER_TRANSITION_RESTORE_MS:J = 0x1964L

.field private static final RESUME_RESTORE_WINDOW_MS:J = 0x1f40L

.field private static volatile callbacksRegistered:Z

.field private static volatile lastPlayerGuardLogMs:J

.field private static volatile mainActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile pausedWithVisibleAi:Z

.field private static volatile resumeRestoreUntilMs:J

.field private static volatile retainedTargetCode:Ljava/lang/String;

.field private static volatile retainedVideoId:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$sfgetmainActivityRef()Ljava/lang/ref/WeakReference;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetpausedWithVisibleAi()Z
    .registers 1

    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->pausedWithVisibleAi:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$sfgetresumeRestoreUntilMs()J
    .registers 2

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->resumeRestoreUntilMs:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetretainedTargetCode()Ljava/lang/String;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputmainActivityRef(Ljava/lang/ref/WeakReference;)V
    .registers 1

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputpausedWithVisibleAi(Z)V
    .registers 1

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->pausedWithVisibleAi:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputresumeRestoreUntilMs(J)V
    .registers 2

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->resumeRestoreUntilMs:J

    return-void
.end method

.method static bridge synthetic -$$Nest$smisMainActivity(Landroid/app/Activity;)Z
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->isMainActivity(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 25
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    .line 30
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    .line 31
    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedVideoId:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 3

    if-nez p0, :cond_3

    goto :goto_e

    .line 37
    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    .line 38
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->callbacksRegistered:Z

    if-eqz v0, :cond_f

    :goto_e
    return-void

    .line 39
    :cond_f
    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;

    monitor-enter v0

    .line 40
    :try_start_12
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->callbacksRegistered:Z

    if-eqz v1, :cond_18

    monitor-exit v0

    return-void

    .line 41
    :cond_18
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    if-nez p0, :cond_20

    .line 42
    monitor-exit v0

    return-void

    .line 43
    :cond_20
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore$1;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore$1;-><init>()V

    invoke-virtual {p0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    const/4 p0, 0x1

    .line 82
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->callbacksRegistered:Z

    .line 83
    monitor-exit v0

    return-void

    :catchall_2d
    move-exception p0

    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_12 .. :try_end_2f} :catchall_2d

    throw p0
.end method

.method private static isMainActivity(Landroid/app/Activity;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 140
    :cond_4
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    const/4 v2, 0x1

    if-ne v1, p0, :cond_10

    return v2

    :cond_10
    if-nez v1, :cond_23

    .line 142
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "MainActivity"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_23

    return v2

    :cond_23
    return v0
.end method

.method static noteAiTarget(Ljava/lang/String;)V
    .registers 2

    .line 107
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    if-nez v0, :cond_7

    goto :goto_17

    .line 109
    :cond_7
    iget-object v0, v0, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    .line 110
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 111
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedVideoId:Ljava/lang/String;

    :cond_17
    :goto_17
    return-void
.end method

.method static onPlayerTransition(Ljava/lang/String;)V
    .registers 7

    .line 88
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-eqz p0, :cond_3b

    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_f

    goto :goto_3b

    .line 89
    :cond_f
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 90
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->resumeRestoreUntilMs:J

    const-wide/16 v4, 0x1964

    add-long/2addr v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->resumeRestoreUntilMs:J

    .line 94
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->mainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_3b

    .line 95
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->lastPlayerGuardLogMs:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long v2, v2, v4

    if-lez v2, :cond_3b

    .line 96
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->lastPlayerGuardLogMs:J

    .line 97
    const-string v0, "PLAYER_TRANSITION_CAPTION_GUARD"

    const-string v1, "\u64ad\u653e\u5668\u5f62\u6001\u5207\u6362\uff0c\u9501\u5b9a\u5f53\u524d AI \u5b57\u5e55\u8f68\uff0c\u5ffd\u7565\u77ac\u65f6\u539f\u751f\u5b57\u5e55\u56de\u5199"

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3b
    :goto_3b
    return-void
.end method

.method static restoreAfterLifecycle(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 122
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_43

    .line 123
    :cond_7
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-eqz v0, :cond_43

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_43

    .line 125
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 126
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    if-eqz v0, :cond_22

    goto :goto_43

    .line 130
    :cond_22
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3d

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedVideoId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3d

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedVideoId:Ljava/lang/String;

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d

    goto :goto_43

    .line 135
    :cond_3d
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->retainedTargetCode:Ljava/lang/String;

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_43
    :goto_43
    return-object p0
.end method

.method private static videoId(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 147
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 148
    const-string v1, "v"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1a

    :cond_14
    const-string v1, "video_id"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1a
    .catchall {:try_start_2 .. :try_end_1a} :catchall_1e

    :cond_1a
    if-nez v1, :cond_1d

    return-object v0

    :cond_1d
    return-object v1

    :catchall_1e
    return-object v0
.end method
