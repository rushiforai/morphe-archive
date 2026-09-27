.class final Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;
.super Ljava/lang/Object;
.source "CaptionPlayerTransitionGuard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final MAX_OBSERVATION_FRAMES:I = 0x2a

.field private static final MIN_OBSERVATION_FRAMES:I = 0x6

.field private static final NO_MOTION_FALLBACK_FRAMES:I = 0xc

.field private static final PIXEL_TOLERANCE:I = 0x1

.field private static final PLAYER_IDS:[Ljava/lang/String;

.field private static final STABLE_FRAMES_REQUIRED:I = 0x4

.field private static activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static compactPlayer:Z

.field private static expansionRestorePending:Z

.field private static generation:J


# direct methods
.method static bridge synthetic -$$Nest$sfgetactivityRef()Ljava/lang/ref/WeakReference;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->activityRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetgeneration()J
    .registers 2

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$smdecor(Landroid/app/Activity;)Landroid/view/View;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smfinish(JLjava/lang/String;ZI)V
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->finish(JLjava/lang/String;ZI)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smnearlySame(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 2

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->nearlySame(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$smreadPlayerRect(Landroid/app/Activity;)Landroid/graphics/Rect;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->readPlayerRect(Landroid/app/Activity;)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->MAIN:Landroid/os/Handler;

    .line 25
    const-string v0, "player_overlay"

    const-string v1, "watch_player"

    const-string v2, "inset_overlay_view_layout"

    const-string v3, "player_overlays"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->PLAYER_IDS:[Ljava/lang/String;

    .line 34
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->activityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static compact(Ljava/lang/String;)Z
    .registers 3

    if-nez p0, :cond_5

    .line 182
    const-string p0, ""

    goto :goto_f

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 183
    :goto_f
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    return v1

    .line 184
    :cond_17
    const-string v0, "NONE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "HIDDEN"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "INLINE_MINIMAL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "WATCH_WHILE_PICTURE_IN_PICTURE"

    .line 185
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "MINIMAL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "MINIMIZED"

    .line 186
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "PICTURE_IN_PICTURE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_59

    const-string v0, "DISMISSED"

    .line 187
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_58

    goto :goto_59

    :cond_58
    return v1

    :cond_59
    :goto_59
    const/4 p0, 0x1

    return p0
.end method

.method private static decor(Landroid/app/Activity;)Landroid/view/View;
    .registers 2

    if-eqz p0, :cond_18

    .line 137
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_f

    goto :goto_18

    .line 138
    :cond_f
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_18
    :goto_18
    const/4 p0, 0x0

    return-object p0
.end method

.method private static finish(JLjava/lang/String;ZI)V
    .registers 7

    .line 115
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    cmp-long p0, p0, v0

    if-eqz p0, :cond_7

    goto :goto_4c

    :cond_7
    if-eqz p3, :cond_f

    .line 118
    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->restoreAfterGuardedExpansion(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 119
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->expansionRestorePending:Z

    .line 121
    :cond_f
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onPlayerStable()V

    .line 122
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->endNativeRendererTransition()V

    .line 124
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_4c

    .line 125
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p1

    if-eqz p1, :cond_4c

    .line 126
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "\u64ad\u653e\u5668\u8f6c\u573a\u5df2\u7a33\u5b9a\uff1b"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p3, :cond_31

    .line 130
    const-string p2, "\u5355\u6b21\u6062\u590d AI \u5b57\u5e55\u663e\u793a"

    goto :goto_33

    :cond_31
    const-string p2, "\u89e3\u9664 AI \u5b57\u5e55\u8f68\u4fdd\u62a4"

    :goto_33
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\uff08\u89c2\u5bdf "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " \u5e27\uff09"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 126
    const-string p2, "PLAYER_TRANSITION_STABLE"

    invoke-static {p0, p2, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_4c
    :goto_4c
    return-void
.end method

.method static synthetic lambda$startReadOnlyProbe$0(JLjava/lang/String;Z)V
    .registers 5

    const/4 v0, 0x0

    .line 101
    invoke-static {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->finish(JLjava/lang/String;ZI)V

    return-void
.end method

.method private static nearlySame(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_34

    if-nez p1, :cond_6

    goto :goto_34

    .line 175
    :cond_6
    iget v1, p0, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_34

    iget v1, p0, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v3

    .line 176
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v2, :cond_34

    iget v1, p0, Landroid/graphics/Rect;->right:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v3

    .line 177
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v2, :cond_34

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, p1

    .line 178
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    if-gt p0, v2, :cond_34

    return v2

    :cond_34
    :goto_34
    return v0
.end method

.method static onPlayerType(Ljava/lang/String;)V
    .registers 7

    if-nez p0, :cond_5

    .line 53
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 54
    :goto_9
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->isShorts()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_19

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->compact(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    move v0, v1

    goto :goto_1a

    :cond_19
    move v0, v2

    .line 58
    :goto_1a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->beginNativeRendererTransition()V

    .line 59
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onPlayerTransition(Ljava/lang/String;)V

    .line 60
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->onPlayerTransition(Ljava/lang/String;)V

    if-eqz v0, :cond_34

    .line 63
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    .line 64
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->compactPlayer:Z

    .line 65
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->expansionRestorePending:Z

    .line 67
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->beginGuardedExpansion()V

    return-void

    .line 75
    :cond_34
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->compactPlayer:Z

    if-nez v0, :cond_3e

    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->expansionRestorePending:Z

    if-eqz v0, :cond_3d

    goto :goto_3e

    :cond_3d
    move v1, v2

    .line 76
    :cond_3e
    :goto_3e
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->compactPlayer:Z

    if-nez v1, :cond_45

    .line 80
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->setPlayerType(Ljava/lang/String;)V

    .line 83
    :cond_45
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-nez v0, :cond_59

    if-eqz v1, :cond_52

    .line 85
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->restoreAfterGuardedExpansion(Ljava/lang/String;)V

    .line 86
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->expansionRestorePending:Z

    .line 88
    :cond_52
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onPlayerStable()V

    .line 89
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->endNativeRendererTransition()V

    return-void

    .line 93
    :cond_59
    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->startReadOnlyProbe(Ljava/lang/String;Z)V

    return-void
.end method

.method private static readPlayerRect(Landroid/app/Activity;)Landroid/graphics/Rect;
    .registers 14

    .line 142
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 147
    :cond_8
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->PLAYER_IDS:[Ljava/lang/String;

    array-length v3, v2

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    :goto_e
    if-ge v6, v3, :cond_6e

    aget-object v7, v2, v6

    .line 150
    :try_start_12
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v7, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v7
    :try_end_20
    .catchall {:try_start_12 .. :try_end_20} :catchall_6b

    if-nez v7, :cond_23

    goto :goto_6b

    .line 155
    :cond_23
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_6b

    .line 156
    invoke-virtual {v7}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v8

    if-eqz v8, :cond_6b

    .line 157
    invoke-virtual {v7}, Landroid/view/View;->isShown()Z

    move-result v8

    if-eqz v8, :cond_6b

    invoke-virtual {v7}, Landroid/view/View;->getAlpha()F

    move-result v8

    const v9, 0x3c23d70a    # 0.01f

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_41

    goto :goto_6b

    .line 160
    :cond_41
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 161
    invoke-virtual {v7, v8}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v7

    if-eqz v7, :cond_6b

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v7

    const/4 v9, 0x1

    if-le v7, v9, :cond_6b

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v7

    if-gt v7, v9, :cond_5a

    goto :goto_6b

    .line 164
    :cond_5a
    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-long v9, v7

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-long v11, v7

    mul-long/2addr v9, v11

    cmp-long v7, v9, v4

    if-lez v7, :cond_6b

    move-object v1, v8

    move-wide v4, v9

    :catchall_6b
    :cond_6b
    :goto_6b
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    :cond_6e
    return-object v1
.end method

.method static setActivity(Landroid/app/Activity;)V
    .registers 5

    .line 48
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->activityRef:Ljava/lang/ref/WeakReference;

    .line 49
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    return-void
.end method

.method private static startReadOnlyProbe(Ljava/lang/String;Z)V
    .registers 6

    .line 97
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->generation:J

    .line 98
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 99
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v3

    if-eqz v2, :cond_21

    if-nez v3, :cond_18

    goto :goto_21

    .line 105
    :cond_18
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;

    invoke-direct {v2, v0, v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$Probe;-><init>(JLjava/lang/String;Z)V

    .line 106
    invoke-virtual {v3, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    .line 101
    :cond_21
    :goto_21
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard;->MAIN:Landroid/os/Handler;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0, v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionPlayerTransitionGuard$$ExternalSyntheticLambda0;-><init>(JLjava/lang/String;Z)V

    const-wide/16 p0, 0xb4

    invoke-virtual {v2, v3, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
