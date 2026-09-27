.class final Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;
.super Ljava/lang/Object;
.source "CaptionMusicSuppressor.java"


# static fields
.field private static final FALLBACK_NATIVE_SCAN_MS:J = 0x5dcL

.field private static final INITIAL_NATIVE_SCAN_MS:J = 0xb4L

.field private static final LEGACY_SUBTITLE_WINDOW:Ljava/lang/String; = "com.google.android.libraries.youtube.player.subtitles.ui.subtitlewindowview"

.field private static final MAIN:Landroid/os/Handler;

.field private static final MAX_NATIVE_SCAN_VIEWS:I = 0x4b0

.field private static final NATIVE_NOT_FOUND_LOG_MS:J = 0x708L

.field private static final PLAYER_IDS:[Ljava/lang/String;

.field private static final TICK:Ljava/lang/Runnable;

.field private static final TICK_MS:J = 0x28L

.field private static activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static forceNativeRescan:Z

.field private static final maskedRenderers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static nativeNotFoundLogged:Z

.field private static nativeScanSuspended:Z

.field private static nativeSearchStartedAtMs:J

.field private static nextNativeScanAtMs:J

.field private static posted:Z

.field private static ready:Z

.field private static statusField:Ljava/lang/reflect/Field;

.field private static textField:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 29
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    .line 35
    const-string v0, "player_overlay"

    const-string v1, "watch_player"

    const-string v2, "inset_overlay_view_layout"

    const-string v3, "player_overlays"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->PLAYER_IDS:[Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->activityRef:Ljava/lang/ref/WeakReference;

    .line 42
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    .line 53
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda2;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->TICK:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static beginNativeRendererTransition()V
    .registers 2

    .line 98
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_15

    .line 99
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_15
    const/4 v0, 0x1

    .line 102
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeScanSuspended:Z

    return-void
.end method

.method static endNativeRendererTransition()V
    .registers 3

    .line 107
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_15

    .line 108
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_15
    const/4 v0, 0x0

    .line 111
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeScanSuspended:Z

    const/4 v1, 0x1

    .line 112
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRescan:Z

    const-wide/16 v1, 0x0

    .line 113
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nextNativeScanAtMs:J

    .line 114
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    .line 115
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    :cond_2a
    return-void
.end method

.method static forceNativeRendererScan()V
    .registers 2

    .line 86
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_15

    .line 87
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_15
    const/4 v0, 0x1

    .line 90
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRescan:Z

    const-wide/16 v0, 0x0

    .line 91
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nextNativeScanAtMs:J

    const/4 v0, 0x0

    .line 92
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    .line 93
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    :cond_28
    return-void
.end method

.method private static isNativeSubtitleRenderer(Landroid/app/Activity;Landroid/view/View;Z)Z
    .registers 8

    const/4 v0, 0x0

    if-eqz p1, :cond_c4

    .line 243
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_c4

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    const v2, 0x3c23d70a    # 0.01f

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_16

    goto/16 :goto_c4

    .line 244
    :cond_16
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 245
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "yydarlinker.deepseek.caption"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    return v0

    .line 247
    :cond_29
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_2d
    const/4 v2, 0x1

    if-eqz v1, :cond_5d

    .line 248
    const-class v3, Ljava/lang/Object;

    if-eq v1, v3, :cond_5d

    .line 249
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 250
    const-string v4, "com.google.android.libraries.youtube.player.subtitles.ui.subtitlewindowview"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5c

    const-string v4, ".youtube.player.subtitles."

    .line 251
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5c

    const-string v4, ".subtitlewindowview"

    .line 252
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    goto :goto_5c

    .line 255
    :cond_57
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_2d

    :cond_5c
    :goto_5c
    return v2

    :cond_5d
    if-eqz p2, :cond_c4

    .line 258
    instance-of p2, p1, Landroid/view/ViewGroup;

    if-eqz p2, :cond_c4

    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result p2

    if-eqz p2, :cond_6a

    goto :goto_c4

    .line 261
    :cond_6a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_72

    return v0

    .line 264
    :cond_72
    :try_start_72
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 265
    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 266
    const-string p1, "button"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c4

    const-string p1, "menu"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c4

    const-string p1, "settings"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_99

    goto :goto_c4

    .line 269
    :cond_99
    const-string p1, "subtitle_window"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c3

    const-string p1, "caption_window"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c3

    const-string p1, "subtitle"

    .line 270
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_c2

    const-string p1, "overlay"

    .line 271
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c3

    const-string p1, "container"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0
    :try_end_bf
    .catchall {:try_start_72 .. :try_end_bf} :catchall_c4

    if-eqz p0, :cond_c2

    goto :goto_c3

    :cond_c2
    return v0

    :cond_c3
    :goto_c3
    return v2

    :catchall_c4
    :cond_c4
    :goto_c4
    return v0
.end method

.method private static keepKnownRenderersMasked()Z
    .registers 4

    .line 175
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    .line 176
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 177
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 178
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_34

    .line 179
    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-nez v3, :cond_26

    goto :goto_34

    .line 184
    :cond_26
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/4 v3, 0x0

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_32

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    :cond_32
    const/4 v1, 0x1

    goto :goto_b

    .line 180
    :cond_34
    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_b

    :cond_38
    return v1
.end method

.method static kick()V
    .registers 4

    .line 74
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_15

    .line 75
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor$$ExternalSyntheticLambda4;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 78
    :cond_15
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->posted:Z

    if-eqz v0, :cond_1a

    goto :goto_28

    .line 79
    :cond_1a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-nez v0, :cond_29

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_29

    :goto_28
    return-void

    :cond_29
    const/4 v0, 0x1

    .line 80
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->posted:Z

    .line 81
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->MAIN:Landroid/os/Handler;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->TICK:Ljava/lang/Runnable;

    const-wide/16 v2, 0x28

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method static synthetic lambda$static$0()V
    .registers 1

    const/4 v0, 0x0

    .line 54
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->posted:Z

    .line 55
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-nez v0, :cond_d

    .line 56
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->restoreNativeRenderers()V

    return-void

    .line 59
    :cond_d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->sanitize()V

    .line 60
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskNativeRenderer()V

    .line 61
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    return-void
.end method

.method private static maskNativeRenderer()V
    .registers 10

    .line 127
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_89

    .line 128
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_12

    goto/16 :goto_89

    .line 130
    :cond_12
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeScanSuspended:Z

    if-eqz v1, :cond_1a

    .line 133
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->keepKnownRenderersMasked()Z

    return-void

    .line 137
    :cond_1a
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRescan:Z

    const/4 v2, 0x0

    .line 138
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRescan:Z

    .line 139
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->keepKnownRenderersMasked()Z

    move-result v3

    if-eqz v3, :cond_28

    if-nez v1, :cond_28

    goto :goto_89

    .line 142
    :cond_28
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 143
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeSearchStartedAtMs:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_36

    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeSearchStartedAtMs:J

    :cond_36
    if-nez v1, :cond_3f

    .line 144
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nextNativeScanAtMs:J

    cmp-long v1, v4, v6

    if-gez v1, :cond_3f

    goto :goto_89

    .line 146
    :cond_3f
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeSearchStartedAtMs:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x708

    cmp-long v1, v6, v8

    if-gtz v1, :cond_4c

    const-wide/16 v8, 0xb4

    goto :goto_4e

    :cond_4c
    const-wide/16 v8, 0x5dc

    :goto_4e
    add-long/2addr v4, v8

    .line 148
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nextNativeScanAtMs:J

    .line 150
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->scanPlayerRoots(Landroid/app/Activity;)Z

    move-result v4

    if-nez v4, :cond_71

    const-wide/16 v8, 0x2bc

    cmp-long v5, v6, v8

    if-ltz v5, :cond_71

    .line 154
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    if-nez v4, :cond_65

    const/4 v4, 0x0

    goto :goto_6d

    :cond_65
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    .line 155
    :goto_6d
    invoke-static {v0, v4, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->scanTree(Landroid/app/Activity;Landroid/view/View;Z)Z

    move-result v4

    :cond_71
    if-nez v4, :cond_87

    if-eqz v3, :cond_76

    goto :goto_87

    .line 163
    :cond_76
    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    if-nez v2, :cond_89

    if-ltz v1, :cond_89

    const/4 v1, 0x1

    .line 164
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    .line 165
    const-string v1, "NATIVE_RENDERER_VIEW_NOT_FOUND"

    const-string v2, "TimedText \u5df2\u88ab\u4e0d\u53ef\u89c1\u5316\uff0c\u4f46\u5f53\u524d\u64ad\u653e\u5668\u672a\u53d1\u73b0\u53ef\u76f4\u63a5\u9690\u85cf\u7684 YouTube \u539f\u751f\u5b57\u5e55\u7a97\u53e3"

    invoke-static {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 159
    :cond_87
    :goto_87
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    :cond_89
    :goto_89
    return-void
.end method

.method private static maskRenderer(Landroid/app/Activity;Landroid/view/View;)V
    .registers 6

    .line 278
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSurface;->nativeRenderer(Landroid/view/View;)V

    .line 279
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_18

    .line 280
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p0

    cmpl-float p0, p0, v2

    if-eqz p0, :cond_23

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    return-void

    .line 283
    :cond_18
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    const v3, 0x3c23d70a    # 0.01f

    cmpg-float v3, v1, v3

    if-gtz v3, :cond_24

    :cond_23
    return-void

    .line 287
    :cond_24
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u5df2\u76f4\u63a5\u9690\u85cf YouTube \u539f\u751f\u5b57\u5e55\u7ed8\u5236\u7a97\u53e3\uff1bclass="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 292
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 289
    const-string v0, "NATIVE_RENDERER_VIEW_MASKED"

    invoke-static {p0, v0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static prepare()Z
    .registers 3

    .line 320
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->ready:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_e

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->textField:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_e

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->statusField:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_e

    return v1

    .line 322
    :cond_e
    :try_start_e
    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;

    const-string v2, "pendingText"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->textField:Ljava/lang/reflect/Field;

    .line 323
    const-class v0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;

    const-string v2, "pendingStatus"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->statusField:Ljava/lang/reflect/Field;

    .line 324
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->textField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 325
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->statusField:Ljava/lang/reflect/Field;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 326
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->ready:Z
    :try_end_2e
    .catchall {:try_start_e .. :try_end_2e} :catchall_2f

    return v1

    :catchall_2f
    const/4 v0, 0x0

    .line 329
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->ready:Z

    return v0
.end method

.method private static resetNativeSearch()V
    .registers 3

    const/4 v0, 0x0

    .line 312
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRescan:Z

    .line 313
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeScanSuspended:Z

    const-wide/16 v1, 0x0

    .line 314
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeSearchStartedAtMs:J

    .line 315
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nextNativeScanAtMs:J

    .line 316
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->nativeNotFoundLogged:Z

    return-void
.end method

.method private static restoreNativeRenderers()V
    .registers 4

    .line 297
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 298
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->resetNativeSearch()V

    return-void

    .line 301
    :cond_c
    invoke-virtual {v0}, Ljava/util/WeakHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catchall_14
    :cond_14
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 302
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 303
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    if-eqz v2, :cond_14

    if-eqz v1, :cond_14

    .line 304
    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-nez v3, :cond_37

    goto :goto_14

    .line 305
    :cond_37
    :try_start_37
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v2, v1}, Landroid/view/View;->setAlpha(F)V
    :try_end_3e
    .catchall {:try_start_37 .. :try_end_3e} :catchall_14

    goto :goto_14

    .line 307
    :cond_3f
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskedRenderers:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 308
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->resetNativeSearch()V

    return-void
.end method

.method private static sanitize()V
    .registers 0

    return-void
.end method

.method private static scanPlayerRoots(Landroid/app/Activity;)Z
    .registers 11

    .line 190
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 191
    :cond_8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_13

    return v1

    .line 195
    :cond_13
    new-instance v2, Ljava/util/WeakHashMap;

    invoke-direct {v2}, Ljava/util/WeakHashMap;-><init>()V

    .line 196
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->PLAYER_IDS:[Ljava/lang/String;

    array-length v4, v3

    move v5, v1

    :goto_1c
    if-ge v1, v4, :cond_49

    aget-object v6, v3, v1

    .line 199
    :try_start_20
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v6, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6
    :try_end_2e
    .catchall {:try_start_20 .. :try_end_2e} :catchall_46

    if-nez v6, :cond_31

    goto :goto_46

    .line 204
    :cond_31
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_46

    .line 205
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v6, v7}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_40

    goto :goto_46

    :cond_40
    const/4 v7, 0x1

    .line 206
    invoke-static {p0, v6, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->scanTree(Landroid/app/Activity;Landroid/view/View;Z)Z

    move-result v6

    or-int/2addr v5, v6

    :catchall_46
    :cond_46
    :goto_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    :cond_49
    return v5
.end method

.method private static scanTree(Landroid/app/Activity;Landroid/view/View;Z)Z
    .registers 9

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 213
    :cond_4
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 214
    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    move p1, v0

    move v2, p1

    .line 218
    :goto_e
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_45

    add-int/lit8 v3, p1, 0x1

    const/16 v4, 0x4b0

    if-ge p1, v4, :cond_45

    .line 219
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 220
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->isNativeSubtitleRenderer(Landroid/app/Activity;Landroid/view/View;Z)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 221
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->maskRenderer(Landroid/app/Activity;Landroid/view/View;)V

    const/4 v2, 0x1

    :cond_2a
    move p1, v3

    goto :goto_e

    .line 227
    :cond_2c
    instance-of v4, p1, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2a

    .line 228
    check-cast p1, Landroid/view/ViewGroup;

    move v4, v0

    .line 229
    :goto_33
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v4, v5, :cond_2a

    .line 230
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_42

    .line 231
    invoke-virtual {v1, v5}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_42
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    :cond_45
    return v2
.end method

.method static setActivity(Landroid/app/Activity;)V
    .registers 2

    .line 67
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->restoreNativeRenderers()V

    .line 68
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->activityRef:Ljava/lang/ref/WeakReference;

    const/4 p0, 0x0

    .line 69
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->ready:Z

    .line 70
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->resetNativeSearch()V

    return-void
.end method
