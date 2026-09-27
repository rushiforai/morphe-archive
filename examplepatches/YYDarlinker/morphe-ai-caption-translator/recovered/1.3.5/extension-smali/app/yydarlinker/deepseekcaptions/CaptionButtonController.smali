.class final Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;
.super Ljava/lang/Object;
.source "CaptionButtonController.java"


# static fields
.field private static final EXACT_MENU_MIN_ACTION_MS:J = 0xdcL

.field private static final EXACT_MENU_OFF_CONFIRM_MS:J = 0x5aL

.field private static final HOOKED_BUTTONS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final INSTALLED_ROOTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final LONG_PRESS_ARM:Ljava/lang/Runnable;

.field private static final MAIN:Landroid/os/Handler;

.field private static final MAINTENANCE:Ljava/lang/Runnable;

.field private static final MAINTENANCE_SCAN_MS:J = 0x9c4L

.field private static final MAX_SCANNED_VIEWS:I = 0x708

.field private static final NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

.field private static final NATIVE_MENU_MONITOR_MS:J = 0xa0L

.field private static final NATIVE_MENU_WINDOW_MS:J = 0x2ee0L

.field private static final NATIVE_STATE_LOCK:Ljava/lang/Object;

.field private static final PLAYER_TRANSITION_QUIET_MS:J = 0x1194L

.field private static final SELECTION_WINDOW_MS:J = 0x9c4L

.field private static volatile activityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile buttonDownAtMs:J

.field private static volatile buttonTouchDown:Z

.field private static volatile captionButtonRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile captionButtonViewId:I

.field private static volatile captionIntent:I

.field private static volatile currentVideoId:Ljava/lang/String;

.field private static volatile defaultSelectionLogged:Z

.field private static volatile exactCaptionButtonRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile exactControllerGeneration:J

.field private static volatile ignoreUiStateUntilMs:J

.field private static volatile intentBeforeTouch:I

.field private static volatile lastExactNativeState:I

.field private static volatile localizedLabels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile longPressGesture:Z

.field private static volatile maintenancePosted:Z

.field private static volatile nativeMenuExactBaselineGeneration:J

.field private static volatile nativeMenuOpenedAtMs:J

.field private static volatile nativeMenuOpeningState:I

.field private static volatile nativeMenuSelectionArmed:Z

.field private static volatile nativeMenuUntilMs:J

.field private static volatile nativeMenuVideoId:Ljava/lang/String;

.field private static volatile nativeStateAtTouchDown:I

.field private static volatile nativeTrackSelected:Z

.field private static volatile nativeTrackVideoId:Ljava/lang/String;

.field private static volatile scanGeneration:J

.field private static volatile scanPosted:Z

.field private static volatile selectDefaultUntilMs:J

.field private static volatile suppressDefaultUntilMs:J

.field private static volatile transitionQuietUntilMs:J

.field private static volatile turnCaptionsOffOnTouchUp:Z


# direct methods
.method static bridge synthetic -$$Nest$sfgetMAIN()Landroid/os/Handler;
    .registers 1

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetignoreUiStateUntilMs()J
    .registers 2

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgetnativeMenuSelectionArmed()Z
    .registers 1

    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$sfgetnativeMenuUntilMs()J
    .registers 2

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$sfgettransitionQuietUntilMs()J
    .registers 2

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$smisNativeTrackSelectedForCurrentVideo()Z
    .registers 1

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isNativeTrackSelectedForCurrentVideo()Z

    move-result v0

    return v0
.end method

.method static bridge synthetic -$$Nest$smresolveCaptionButtonForNativeMenu()Landroid/view/View;
    .registers 1

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->resolveCaptionButtonForNativeMenu()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static bridge synthetic -$$Nest$smsyncNativeCaptionState(Landroid/view/View;)V
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->syncNativeCaptionState(Landroid/view/View;)V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 2

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    .line 46
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 47
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->INSTALLED_ROOTS:Ljava/util/Map;

    .line 48
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 49
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->HOOKED_BUTTONS:Ljava/util/Map;

    .line 51
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    .line 53
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    .line 54
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;

    .line 55
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    const/4 v0, -0x1

    .line 56
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonViewId:I

    .line 74
    const-string v1, ""

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 75
    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackVideoId:Ljava/lang/String;

    .line 77
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->intentBeforeTouch:I

    .line 78
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeStateAtTouchDown:I

    .line 79
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    .line 80
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    .line 81
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 82
    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    .line 83
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->localizedLabels:Ljava/util/List;

    .line 85
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda5;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->LONG_PRESS_ARM:Ljava/lang/Runnable;

    .line 91
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$1;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$1;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    .line 111
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda6;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAINTENANCE:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static beginNativeMenuOwnership(Z)V
    .registers 11

    .line 470
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 471
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 472
    :try_start_7
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    const-wide/16 v5, 0x2ee0

    add-long/2addr v5, v0

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 473
    sget-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v3, :cond_1d

    if-eqz p0, :cond_1b

    goto :goto_1d

    :cond_1b
    move v3, v4

    goto :goto_1e

    :cond_1d
    :goto_1d
    move v3, v5

    :goto_1e
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 474
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    sput-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    const-wide/16 v6, 0x0

    .line 475
    sput-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 476
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    sput-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    .line 477
    sput-boolean v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 478
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    const-wide/16 v6, 0x12c

    add-long/2addr v6, v0

    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    if-eqz p0, :cond_6f

    .line 481
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpenedAtMs:J

    .line 482
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuExactBaselineGeneration:J

    .line 483
    sget p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeStateAtTouchDown:I

    if-eq p0, v5, :cond_62

    .line 485
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_62

    .line 486
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 487
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeCaptionState(Landroid/view/View;)I

    move-result v0

    if-ne v0, v5, :cond_62

    move p0, v0

    :cond_62
    if-eq p0, v5, :cond_69

    .line 491
    sget v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    if-ne v0, v5, :cond_69

    move p0, v5

    :cond_69
    if-ne p0, v5, :cond_6c

    goto :goto_6d

    :cond_6c
    const/4 v5, -0x1

    .line 496
    :goto_6d
    sput v5, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    .line 498
    :cond_6f
    monitor-exit v2
    :try_end_70
    .catchall {:try_start_7 .. :try_end_70} :catchall_92

    .line 500
    sget-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    if-eqz p0, :cond_80

    .line 501
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const-wide/16 v1, 0x140

    .line 502
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 505
    :cond_80
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_91

    .line 507
    const-string v0, "NATIVE_CAPTION_MENU"

    const-string v1, "CC \u957f\u6309\u83dc\u5355\u83b7\u5f97\u9009\u62e9\u6743\uff1b\u539f\u751f\u5b57\u5e55\u3001\u5173\u95ed\u4e0e\u81ea\u52a8\u7ffb\u8bd1\u9009\u9879\u4e0d\u518d\u88ab\u9ed8\u8ba4 AI \u903b\u8f91\u8986\u76d6"

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_91
    return-void

    :catchall_92
    move-exception p0

    .line 498
    :try_start_93
    monitor-exit v2
    :try_end_94
    .catchall {:try_start_93 .. :try_end_94} :catchall_92

    throw p0
.end method

.method private static captionLabels(Landroid/content/Context;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 872
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 873
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    .line 874
    const-string v1, "accessibility_captions_on"

    const-string v2, "accessibility_captions_off"

    const-string v3, "accessibility_captions_button_name"

    const-string v4, "accessibility_captions_unavailable"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 880
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    :goto_1a
    const/4 v4, 0x4

    if-ge v3, v4, :cond_42

    .line 881
    aget-object v4, v1, v3

    .line 883
    :try_start_1f
    const-string v5, "string"

    invoke-virtual {v0, v4, v5, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_28

    goto :goto_3f

    .line 885
    :cond_28
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 886
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3f

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3f
    .catchall {:try_start_1f .. :try_end_3f} :catchall_3f

    :catchall_3f
    :cond_3f
    :goto_3f
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 890
    :cond_42
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static clearNativeMenuEvidenceLocked()V
    .registers 2

    const-wide/16 v0, 0x0

    .line 805
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpenedAtMs:J

    .line 806
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuExactBaselineGeneration:J

    const/4 v0, -0x1

    .line 807
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    .line 808
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeStateAtTouchDown:I

    return-void
.end method

.method private static clearNativeTrackAuthority()V
    .registers 2

    .line 794
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 795
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthorityLocked()V

    .line 796
    monitor-exit v0

    return-void

    :catchall_8
    move-exception v1

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw v1
.end method

.method private static clearNativeTrackAuthorityLocked()V
    .registers 1

    const/4 v0, 0x0

    .line 800
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackSelected:Z

    .line 801
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackVideoId:Ljava/lang/String;

    return-void
.end method

.method private static commitNativeCaptionOff(ZLjava/lang/String;)V
    .registers 10

    .line 753
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 754
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v2

    const/4 v3, 0x0

    .line 755
    :try_start_8
    sput v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 756
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthorityLocked()V

    .line 757
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    const-wide/16 v4, 0x0

    .line 758
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 759
    const-string v6, ""

    sput-object v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 760
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 761
    sget-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    const-wide/16 v6, 0x9c4

    add-long/2addr v0, v6

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    .line 765
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    .line 766
    sput-boolean v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 767
    monitor-exit v2
    :try_end_2a
    .catchall {:try_start_8 .. :try_end_2a} :catchall_5a

    .line 769
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 770
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->deactivateFromNativeCaptionState()V

    .line 771
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz p0, :cond_59

    if-eqz v0, :cond_59

    .line 773
    const-string p0, "NATIVE_CAPTION_OFF"

    if-eqz p1, :cond_54

    .line 776
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4f

    goto :goto_54

    .line 778
    :cond_4f
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_56

    .line 777
    :cond_54
    :goto_54
    const-string p1, "\u5df2\u786e\u8ba4\u957f\u6309\u83dc\u5355\u5173\u95ed\u5b57\u5e55\uff1bAI \u5b57\u5e55\u540c\u6b65\u5173\u95ed"

    .line 773
    :goto_56
    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_59
    return-void

    :catchall_5a
    move-exception p0

    .line 767
    :try_start_5b
    monitor-exit v2
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_5a

    throw p0
.end method

.method private static confirmUnknownOffFromExactController(J)V
    .registers 6

    .line 292
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 293
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    cmp-long v2, p0, v2

    if-nez v2, :cond_61

    .line 294
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v2

    if-eqz v2, :cond_61

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_61

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_61

    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    if-eqz v2, :cond_61

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_61

    sget v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_61

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuExactBaselineGeneration:J

    cmp-long p0, p0, v2

    if-gtz p0, :cond_32

    goto :goto_61

    .line 301
    :cond_32
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_61

    .line 302
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_43

    goto :goto_61

    .line 304
    :cond_43
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeCaptionState(Landroid/view/View;)I

    move-result p0

    if-ne p0, v1, :cond_4c

    .line 306
    sput v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    return-void

    :cond_4c
    if-nez p0, :cond_57

    const/4 p0, 0x0

    .line 310
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    .line 311
    const-string p0, "\u771f\u5b9e CC \u63a7\u5236\u5668\u5df2\u660e\u786e\u62a5\u544a\u5b57\u5e55\u5173\u95ed\uff1bAI \u5b57\u5e55\u72b6\u6001\u540c\u6b65\u5173\u95ed"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->commitNativeCaptionOff(ZLjava/lang/String;)V

    return-void

    .line 314
    :cond_57
    sget p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    if-eq p0, v1, :cond_5c

    goto :goto_61

    .line 320
    :cond_5c
    const-string p0, "\u771f\u5b9e CC \u63a7\u5236\u5668\u786e\u8ba4\u957f\u6309\u83dc\u5355\u5df2\u5207\u6362\u5230\u5173\u95ed\u72b6\u6001\uff1bAI \u5b57\u5e55\u540c\u6b65\u5173\u95ed"

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->commitNativeCaptionOff(ZLjava/lang/String;)V

    :cond_61
    :goto_61
    return-void
.end method

.method static consumeNativeTrackPassThrough(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 12

    .line 334
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_95

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    if-eqz v0, :cond_f

    goto/16 :goto_95

    .line 338
    :cond_f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 340
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 341
    :try_start_16
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isNativeTrackSelectedForCurrentVideoLocked()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1f

    .line 342
    monitor-exit v0

    return v5

    .line 344
    :cond_1f
    sget-boolean v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    if-eqz v4, :cond_90

    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v4, v2, v6

    if-lez v4, :cond_2a

    goto :goto_90

    .line 348
    :cond_2a
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->requestVideoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 349
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_40

    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    sget-object v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_56

    .line 350
    :cond_40
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5d

    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5d

    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    .line 351
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5d

    .line 352
    :cond_56
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 353
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    .line 354
    monitor-exit v0

    return v1

    .line 359
    :cond_5d
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 360
    sput-boolean v5, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackSelected:Z

    .line 361
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    sput-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackVideoId:Ljava/lang/String;

    const-wide/16 v6, 0x0

    .line 362
    sput-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 363
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    sput-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    .line 364
    sput v5, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 365
    sget-wide v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    const-wide/16 v8, 0x15e

    add-long/2addr v2, v8

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    .line 366
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    .line 367
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 369
    monitor-exit v0
    :try_end_86
    .catchall {:try_start_16 .. :try_end_86} :catchall_92

    if-eqz p0, :cond_8f

    .line 372
    const-string p1, "NATIVE_CAPTION_SELECTED"

    const-string v0, "\u5df2\u5c0a\u91cd\u5f53\u524d\u89c6\u9891\u7684\u957f\u6309\u83dc\u5355\u539f\u751f\u5b57\u5e55\u9009\u62e9\uff1b\u8be5\u6743\u9650\u4e0d\u4f1a\u5e26\u5230\u4e0b\u4e00\u89c6\u9891"

    invoke-static {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_8f
    return v5

    .line 345
    :cond_90
    :goto_90
    :try_start_90
    monitor-exit v0

    return v1

    :catchall_92
    move-exception p0

    .line 369
    monitor-exit v0
    :try_end_94
    .catchall {:try_start_90 .. :try_end_94} :catchall_92

    throw p0

    :cond_95
    :goto_95
    return v1
.end method

.method private static decor(Landroid/app/Activity;)Landroid/view/View;
    .registers 2

    if-eqz p0, :cond_12

    .line 602
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_9

    goto :goto_12

    .line 604
    :cond_9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_12
    :goto_12
    const/4 p0, 0x0

    return-object p0
.end method

.method private static hook(Landroid/view/View;)V
    .registers 3

    .line 632
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;

    .line 633
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_10

    .line 634
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonViewId:I

    .line 635
    :cond_10
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->HOOKED_BUTTONS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1b

    return-void

    .line 636
    :cond_1b
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method static install(Landroid/app/Activity;)V
    .registers 7

    if-nez p0, :cond_3

    goto :goto_16

    .line 130
    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    .line 131
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionLabels(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->localizedLabels:Ljava/util/List;

    .line 133
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_17

    :goto_16
    return-void

    .line 135
    :cond_17
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->INSTALLED_ROOTS:Ljava/util/Map;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-eqz p0, :cond_39

    .line 137
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const/4 p0, 0x1

    .line 138
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 139
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 140
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    const-wide/16 v4, 0x4b0

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    :cond_39
    const-wide/16 v0, 0x50

    .line 143
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleScan(J)V

    .line 144
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleMaintenance()V

    return-void
.end method

.method private static isCaptionButton(Landroid/app/Activity;Landroid/view/View;)Z
    .registers 8

    .line 846
    const-string v0, "subtitle"

    const-string v1, "caption"

    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_88

    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v2

    if-nez v2, :cond_13

    goto/16 :goto_88

    :cond_13
    const/4 v2, 0x1

    .line 848
    :try_start_14
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_36

    .line 850
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 851
    invoke-virtual {p0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 852
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_35

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0
    :try_end_33
    .catchall {:try_start_14 .. :try_end_33} :catchall_36

    if-eqz p0, :cond_36

    :cond_35
    return v2

    .line 857
    :catchall_36
    :cond_36
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p0

    if-nez p0, :cond_3d

    return v3

    .line 859
    :cond_3d
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 860
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_52

    return v3

    .line 861
    :cond_52
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_87

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_87

    const-string p1, "\u5b57\u5e55"

    .line 862
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_67

    goto :goto_87

    .line 865
    :cond_67
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->localizedLabels:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 866
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6d

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6d

    return v2

    :cond_86
    return v3

    :cond_87
    :goto_87
    return v2

    :cond_88
    :goto_88
    return v3
.end method

.method private static isNativeTrackSelectedForCurrentVideo()Z
    .registers 2

    .line 784
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 785
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isNativeTrackSelectedForCurrentVideoLocked()Z

    move-result v1

    monitor-exit v0

    return v1

    :catchall_9
    move-exception v1

    .line 786
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v1
.end method

.method private static isNativeTrackSelectedForCurrentVideoLocked()Z
    .registers 2

    .line 790
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackSelected:Z

    if-eqz v0, :cond_10

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeTrackVideoId:Ljava/lang/String;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    return v0

    :cond_10
    const/4 v0, 0x0

    return v0
.end method

.method static synthetic lambda$hook$7(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 14

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 638
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const-wide/16 v1, 0xfa

    .line 639
    const-string v3, ""

    const-wide/16 v4, 0x0

    const/4 v6, 0x1

    if-nez p1, :cond_63

    .line 640
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    .line 641
    sput-boolean v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonTouchDown:Z

    .line 642
    sput-wide v7, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonDownAtMs:J

    .line 643
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->longPressGesture:Z

    .line 644
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 645
    sput-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    const/4 p1, -0x1

    .line 646
    sput p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    .line 647
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpenedAtMs:J

    .line 648
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuExactBaselineGeneration:J

    .line 649
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->LONG_PRESS_ARM:Ljava/lang/Runnable;

    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 650
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {p1, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 651
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {p1, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 653
    sget p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    sput p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->intentBeforeTouch:I

    .line 654
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeCaptionState(Landroid/view/View;)I

    move-result p0

    .line 655
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeStateAtTouchDown:I

    .line 657
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p1

    sget v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 656
    invoke-static {p1, p0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->shouldTurnOff(ZII)Z

    move-result p0

    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    .line 661
    sget-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    .line 663
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v7, v3

    add-long/2addr v7, v1

    .line 661
    invoke-static {p0, p1, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    goto/16 :goto_122

    :cond_63
    if-ne p1, v6, :cond_e7

    .line 666
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    .line 667
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonTouchDown:Z

    .line 668
    sget-object v7, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->LONG_PRESS_ARM:Ljava/lang/Runnable;

    invoke-virtual {v7, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 669
    sget-boolean v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->longPressGesture:Z

    if-nez v8, :cond_da

    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonDownAtMs:J

    sub-long v8, p0, v8

    .line 670
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v10

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-ltz v8, :cond_84

    goto :goto_da

    .line 680
    :cond_84
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {v7, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 681
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 682
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 683
    sput-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 684
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    .line 685
    sget-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    const-wide/16 v2, 0x9c4

    if-eqz v1, :cond_ae

    .line 686
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    .line 687
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 688
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->toggle(Z)V

    .line 689
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 690
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    add-long/2addr p0, v2

    .line 691
    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    .line 692
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 693
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->deactivateFromCaptionButton()V

    goto/16 :goto_122

    .line 695
    :cond_ae
    sput v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 696
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->toggle(Z)V

    .line 697
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 698
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    if-eqz v1, :cond_122

    .line 699
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v6

    iget-boolean v6, v6, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->enabled:Z

    if-eqz v6, :cond_122

    .line 700
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultTargetLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_122

    add-long/2addr p0, v2

    .line 701
    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 702
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    .line 703
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    goto :goto_122

    .line 673
    :cond_da
    :goto_da
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->beginNativeMenuOwnership(Z)V

    .line 674
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    .line 675
    sget v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->intentBeforeTouch:I

    sput v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    add-long/2addr p0, v1

    .line 676
    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    return v0

    :cond_e7
    const/4 p0, 0x3

    if-ne p1, p0, :cond_122

    .line 707
    sget-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->longPressGesture:Z

    .line 708
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonTouchDown:Z

    .line 709
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v7, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->LONG_PRESS_ARM:Ljava/lang/Runnable;

    invoke-virtual {p1, v7}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 710
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    if-eqz p0, :cond_108

    .line 712
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->beginNativeMenuOwnership(Z)V

    .line 713
    sget p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->intentBeforeTouch:I

    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 714
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    add-long/2addr p0, v1

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    goto :goto_122

    .line 716
    :cond_108
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 717
    sget p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->intentBeforeTouch:I

    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 718
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 719
    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 720
    sput-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 721
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    .line 722
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-nez p0, :cond_122

    sput-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    :cond_122
    :goto_122
    return v0
.end method

.method static synthetic lambda$observeExactCaptionControllerAfterUpdate$4(J)V
    .registers 2

    .line 275
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->confirmUnknownOffFromExactController(J)V

    return-void
.end method

.method static synthetic lambda$onNativeCaptionButtonController$2(Landroid/widget/ImageView;)V
    .registers 1

    .line 199
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->onNativeCaptionButtonController(Landroid/widget/ImageView;)V

    return-void
.end method

.method static synthetic lambda$onNativeCaptionButtonController$3(Landroid/widget/ImageView;J)V
    .registers 3

    .line 208
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->observeExactCaptionControllerAfterUpdate(Landroid/view/View;J)V

    return-void
.end method

.method static synthetic lambda$scheduleExactControllerRecheck$5(JLandroid/view/View;)V
    .registers 5

    .line 283
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    cmp-long v0, p0, v0

    if-nez v0, :cond_9

    .line 284
    invoke-static {p2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->observeExactCaptionControllerAfterUpdate(Landroid/view/View;J)V

    :cond_9
    return-void
.end method

.method static synthetic lambda$scheduleScan$6(J)V
    .registers 8

    const/4 v0, 0x0

    .line 577
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanPosted:Z

    .line 578
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanGeneration:J

    cmp-long p0, p0, v0

    const-wide/16 v0, 0x78

    if-eqz p0, :cond_f

    .line 579
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleScan(J)V

    return-void

    .line 582
    :cond_f
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    if-eqz p0, :cond_45

    .line 583
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_20

    goto :goto_45

    .line 584
    :cond_20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 585
    sget-wide v4, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long p1, v2, v4

    if-gez p1, :cond_35

    .line 586
    sget-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    sub-long/2addr p0, v2

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleScan(J)V

    return-void

    .line 589
    :cond_35
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_45

    .line 590
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p1

    if-nez p1, :cond_42

    goto :goto_45

    .line 591
    :cond_42
    :try_start_42
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scan(Landroid/view/View;)V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_45

    :catchall_45
    :cond_45
    :goto_45
    return-void
.end method

.method static synthetic lambda$static$0()V
    .registers 1

    .line 86
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonTouchDown:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 87
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->longPressGesture:Z

    const/4 v0, 0x0

    .line 88
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->beginNativeMenuOwnership(Z)V

    return-void
.end method

.method static synthetic lambda$static$1()V
    .registers 5

    const/4 v0, 0x0

    .line 112
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->maintenancePosted:Z

    .line 113
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_30

    .line 114
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_30

    .line 116
    :cond_14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 117
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long v1, v1, v3

    if-ltz v1, :cond_2d

    .line 118
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2d

    .line 119
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 120
    :try_start_2a
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scan(Landroid/view/View;)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_2d

    .line 123
    :catchall_2d
    :cond_2d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleMaintenance()V

    :cond_30
    :goto_30
    return-void
.end method

.method static mayActivateAiTarget()Z
    .registers 5

    .line 434
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 435
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isNativeTrackSelectedForCurrentVideo()Z

    move-result v2

    if-nez v2, :cond_1a

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_11

    goto :goto_1a

    .line 436
    :cond_11
    sget v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    invoke-static {v2, v0, v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->mayActivate(IJJ)Z

    move-result v0

    return v0

    :cond_1a
    :goto_1a
    const/4 v0, 0x0

    return v0
.end method

.method private static nativeCaptionState(Landroid/view/View;)I
    .registers 4

    .line 825
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_19

    if-eqz v0, :cond_16

    .line 826
    :try_start_6
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isCheckable()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 827
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isChecked()Z

    move-result p0
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_1a

    if-eqz v0, :cond_15

    .line 831
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    :cond_15
    return p0

    :cond_16
    if-eqz v0, :cond_1f

    goto :goto_1c

    :catchall_19
    const/4 v0, 0x0

    :catchall_1a
    if-eqz v0, :cond_1f

    :goto_1c
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    .line 835
    :cond_1f
    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_34

    .line 836
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_36

    :cond_34
    const-string v0, ""

    .line 837
    :goto_36
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, -0x1

    if-nez v1, :cond_44

    .line 838
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->fromDescription(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v2, :cond_44

    return v0

    .line 841
    :cond_44
    invoke-virtual {p0}, Landroid/view/View;->isActivated()Z

    move-result v0

    if-nez v0, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result p0

    if-eqz p0, :cond_51

    goto :goto_52

    :cond_51
    return v2

    :cond_52
    :goto_52
    const/4 p0, 0x1

    return p0
.end method

.method static noteAiTrackSelected()V
    .registers 4

    .line 382
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x2bc

    add-long/2addr v0, v2

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    .line 383
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 384
    :try_start_c
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthorityLocked()V

    const/4 v1, 0x0

    .line 385
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    const-wide/16 v1, 0x0

    .line 386
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 387
    const-string v1, ""

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 388
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    const/4 v1, 0x1

    .line 389
    sput v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 390
    monitor-exit v0
    :try_end_21
    .catchall {:try_start_c .. :try_end_21} :catchall_29

    .line 391
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void

    :catchall_29
    move-exception v1

    .line 390
    :try_start_2a
    monitor-exit v0
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_29

    throw v1
.end method

.method static noteCaptionMenuInteraction()V
    .registers 1

    const/4 v0, 0x1

    .line 188
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->beginNativeMenuOwnership(Z)V

    return-void
.end method

.method private static observeExactCaptionControllerAfterUpdate(Landroid/view/View;J)V
    .registers 13

    if-eqz p0, :cond_a5

    .line 212
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_a5

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne p0, v0, :cond_a5

    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    cmp-long v0, p1, v0

    if-eqz v0, :cond_18

    goto/16 :goto_a5

    .line 216
    :cond_18
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 217
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeCaptionState(Landroid/view/View;)I

    move-result v2

    .line 222
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long v3, v0, v3

    const-wide/16 v4, 0x10

    if-gez v3, :cond_3a

    .line 223
    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    if-eqz v2, :cond_a5

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_a5

    .line 224
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    sub-long/2addr v2, v0

    add-long/2addr v2, v4

    invoke-static {p0, p1, p2, v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleExactControllerRecheck(Landroid/view/View;JJ)V

    return-void

    :cond_3a
    const/4 v3, 0x1

    if-ne v2, v3, :cond_49

    .line 232
    sput v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    .line 233
    sget-wide p1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    cmp-long p1, v0, p1

    if-lez p1, :cond_a5

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->syncNativeCaptionState(Landroid/view/View;)V

    return-void

    .line 237
    :cond_49
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_66

    sget-boolean v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    if-eqz v6, :cond_66

    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v6, v0, v8

    if-gtz v6, :cond_66

    sget v6, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpeningState:I

    if-ne v6, v3, :cond_66

    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuExactBaselineGeneration:J

    cmp-long v6, p1, v8

    if-lez v6, :cond_66

    move v6, v3

    goto :goto_67

    :cond_66
    move v6, v7

    .line 242
    :goto_67
    sget-wide v8, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    cmp-long v8, v0, v8

    if-gtz v8, :cond_77

    if-eqz v6, :cond_a5

    .line 244
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    sub-long/2addr v2, v0

    add-long/2addr v2, v4

    invoke-static {p0, p1, p2, v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleExactControllerRecheck(Landroid/view/View;JJ)V

    return-void

    :cond_77
    if-nez v2, :cond_87

    .line 252
    sput v7, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    if-eqz v6, :cond_83

    .line 254
    const-string p0, "\u771f\u5b9e CC \u63a7\u5236\u5668\u5df2\u660e\u786e\u62a5\u544a\u5b57\u5e55\u5173\u95ed\uff1bAI \u5b57\u5e55\u72b6\u6001\u540c\u6b65\u5173\u95ed"

    invoke-static {v3, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->commitNativeCaptionOff(ZLjava/lang/String;)V

    return-void

    .line 259
    :cond_83
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->syncNativeCaptionState(Landroid/view/View;)V

    return-void

    :cond_87
    if-nez v6, :cond_8a

    goto :goto_a5

    .line 268
    :cond_8a
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuOpenedAtMs:J

    const-wide/16 v6, 0xdc

    add-long/2addr v2, v6

    cmp-long v6, v0, v2

    if-gez v6, :cond_99

    sub-long/2addr v2, v0

    add-long/2addr v2, v4

    .line 270
    invoke-static {p0, p1, p2, v2, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleExactControllerRecheck(Landroid/view/View;JJ)V

    return-void

    .line 274
    :cond_99
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda7;

    invoke-direct {v0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda7;-><init>(J)V

    const-wide/16 p1, 0x5a

    invoke-virtual {p0, v0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a5
    :goto_a5
    return-void
.end method

.method static onDefaultLanguageChanged()V
    .registers 2

    const-wide/16 v0, 0x0

    .line 182
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    const/4 v0, 0x0

    .line 183
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    return-void
.end method

.method static onNativeCaptionButtonController(Landroid/widget/ImageView;)V
    .registers 5

    if-nez p0, :cond_3

    return-void

    .line 198
    :cond_3
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_18

    .line 199
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda0;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 202
    :cond_18
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->hook(Landroid/view/View;)V

    .line 203
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;

    .line 204
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    .line 205
    invoke-virtual {p0}, Landroid/widget/ImageView;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_32

    .line 206
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonViewId:I

    .line 207
    :cond_32
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactControllerGeneration:J

    .line 208
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda1;-><init>(Landroid/widget/ImageView;J)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static onPlayerStable()V
    .registers 6

    .line 422
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 423
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    .line 424
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v2, 0x1

    .line 425
    sput v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 426
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 427
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    const-wide/16 v4, 0x384

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    :cond_1d
    const-wide/16 v0, 0x78

    .line 429
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleScan(J)V

    return-void
.end method

.method static onPlayerTransition(Ljava/lang/String;)V
    .registers 7

    .line 399
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 400
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    const-wide/16 v4, 0x1194

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    .line 404
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanGeneration:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanGeneration:J

    .line 405
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter p0

    .line 406
    :try_start_19
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    const/4 v2, -0x1

    .line 407
    sput v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    .line 408
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_19 .. :try_end_20} :catchall_35

    .line 410
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result p0

    if-eqz p0, :cond_34

    const/4 p0, 0x1

    .line 411
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 412
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 413
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    :cond_34
    return-void

    :catchall_35
    move-exception v0

    .line 408
    :try_start_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw v0
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 4

    if-nez p0, :cond_5

    .line 148
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 149
    :goto_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_47

    .line 150
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 151
    :try_start_14
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->currentVideoId:Ljava/lang/String;

    const-wide/16 v1, 0x0

    .line 152
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 153
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    const/4 p0, 0x0

    .line 154
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->turnCaptionsOffOnTouchUp:Z

    .line 155
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->buttonTouchDown:Z

    .line 156
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->longPressGesture:Z

    .line 157
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuSelectionArmed:Z

    .line 158
    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    .line 159
    const-string v1, ""

    sput-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuVideoId:Ljava/lang/String;

    .line 160
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthorityLocked()V

    .line 161
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeMenuEvidenceLocked()V

    const/4 v1, -0x1

    .line 162
    sput v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->lastExactNativeState:I

    .line 163
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 164
    monitor-exit v0
    :try_end_37
    .catchall {:try_start_14 .. :try_end_37} :catchall_44

    .line 165
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->LONG_PRESS_ARM:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 166
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_MENU_MONITOR:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_47

    :catchall_44
    move-exception p0

    .line 164
    :try_start_45
    monitor-exit v0
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_44

    throw p0

    :cond_47
    :goto_47
    const-wide/16 v0, 0xdc

    .line 168
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scheduleScan(J)V

    return-void
.end method

.method private static requestVideoId(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 813
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 814
    const-string v1, "v"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 815
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1a

    :cond_14
    const-string v1, "video_id"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1a
    if-nez v1, :cond_1d

    return-object v0

    .line 816
    :cond_1d
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0
    :try_end_21
    .catchall {:try_start_2 .. :try_end_21} :catchall_22

    return-object p0

    :catchall_22
    return-object v0
.end method

.method private static resolveCaptionButtonForNativeMenu()Landroid/view/View;
    .registers 9

    .line 522
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->exactCaptionButtonRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 523
    instance-of v1, v0, Landroid/widget/ImageView;

    if-eqz v1, :cond_13

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_13

    return-object v0

    .line 525
    :cond_13
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    const/4 v1, 0x0

    if-eqz v0, :cond_b9

    .line 526
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-eqz v2, :cond_26

    goto/16 :goto_b9

    .line 527
    :cond_26
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->decor(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_b9

    .line 528
    invoke-virtual {v2}, Landroid/view/View;->isShown()Z

    move-result v3

    if-nez v3, :cond_34

    goto/16 :goto_b9

    .line 530
    :cond_34
    sget v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonViewId:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_4f

    .line 533
    :try_start_39
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 534
    instance-of v5, v3, Landroid/widget/ImageView;

    if-eqz v5, :cond_4f

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isCaptionButton(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_4f

    .line 535
    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v5, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;
    :try_end_4e
    .catchall {:try_start_39 .. :try_end_4e} :catchall_4f

    return-object v3

    .line 542
    :catchall_4f
    :cond_4f
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 543
    instance-of v5, v3, Landroid/widget/ImageView;

    if-eqz v5, :cond_68

    invoke-virtual {v3}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v5

    if-eqz v5, :cond_68

    .line 544
    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isCaptionButton(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v5

    if-eqz v5, :cond_68

    return-object v3

    .line 550
    :cond_68
    new-instance v3, Ljava/util/ArrayDeque;

    invoke-direct {v3}, Ljava/util/ArrayDeque;-><init>()V

    .line 551
    invoke-virtual {v3, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    move v5, v2

    .line 553
    :goto_72
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_b9

    add-int/lit8 v6, v5, 0x1

    const/16 v7, 0x708

    if-ge v5, v7, :cond_b9

    .line 554
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 555
    instance-of v7, v5, Landroid/widget/ImageView;

    if-eqz v7, :cond_9e

    invoke-static {v0, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isCaptionButton(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_9e

    .line 556
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonRef:Ljava/lang/ref/WeakReference;

    .line 557
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v0

    if-eq v0, v4, :cond_9d

    .line 558
    sput v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionButtonViewId:I

    :cond_9d
    return-object v5

    .line 561
    :cond_9e
    instance-of v7, v5, Landroid/view/ViewGroup;

    if-eqz v7, :cond_b7

    .line 562
    check-cast v5, Landroid/view/ViewGroup;

    move v7, v2

    .line 563
    :goto_a5
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-ge v7, v8, :cond_b7

    .line 564
    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_b4

    .line 565
    invoke-virtual {v3, v8}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_b4
    add-int/lit8 v7, v7, 0x1

    goto :goto_a5

    :cond_b7
    move v5, v6

    goto :goto_72

    :cond_b9
    :goto_b9
    return-object v1
.end method

.method static rewriteDefaultTarget(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 440
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 441
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isNativeTrackSelectedForCurrentVideo()Z

    move-result v2

    if-nez v2, :cond_68

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_68

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->suppressDefaultUntilMs:J

    cmp-long v2, v0, v2

    if-gtz v2, :cond_17

    goto :goto_68

    .line 445
    :cond_17
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_68

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_68

    .line 448
    :cond_24
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    if-eqz v0, :cond_32

    const-wide/16 v0, 0x0

    .line 449
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    const/4 p0, 0x0

    .line 450
    sput-boolean p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    return-object p1

    .line 453
    :cond_32
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->defaultTargetLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 454
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3d

    goto :goto_68

    :cond_3d
    const/4 v1, 0x1

    .line 455
    sput v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 456
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->clearNativeTrackAuthority()V

    .line 457
    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 458
    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    if-nez v2, :cond_68

    .line 459
    sput-boolean v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->defaultSelectionLogged:Z

    .line 460
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u5b57\u5e55\u6309\u94ae\u9ed8\u8ba4\u542f\u7528 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 463
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromCode(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v0

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->promptLabel()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 460
    const-string v1, "DEFAULT_TARGET_SELECTED"

    invoke-static {p0, v1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_68
    :goto_68
    return-object p1
.end method

.method private static scan(Landroid/view/View;)V
    .registers 7

    .line 608
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->activityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_6b

    .line 609
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_6b

    if-eqz p0, :cond_6b

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_19

    goto :goto_6b

    .line 610
    :cond_19
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_24

    goto :goto_6b

    .line 612
    :cond_24
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 613
    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    const/4 p0, 0x0

    move v2, p0

    .line 615
    :goto_2e
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6b

    add-int/lit8 v3, v2, 0x1

    const/16 v4, 0x708

    if-ge v2, v4, :cond_6b

    .line 616
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 617
    instance-of v4, v2, Landroid/widget/ImageView;

    if-eqz v4, :cond_50

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->isCaptionButton(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 618
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->hook(Landroid/view/View;)V

    .line 619
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->syncNativeCaptionState(Landroid/view/View;)V

    .line 621
    :cond_50
    instance-of v4, v2, Landroid/view/ViewGroup;

    if-eqz v4, :cond_69

    .line 622
    check-cast v2, Landroid/view/ViewGroup;

    move v4, p0

    .line 623
    :goto_57
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-ge v4, v5, :cond_69

    .line 624
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_66

    .line 625
    invoke-virtual {v1, v5}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    :cond_66
    add-int/lit8 v4, v4, 0x1

    goto :goto_57

    :cond_69
    move v2, v3

    goto :goto_2e

    :cond_6b
    :goto_6b
    return-void
.end method

.method private static scheduleExactControllerRecheck(Landroid/view/View;JJ)V
    .registers 7

    .line 281
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1, p2, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda4;-><init>(JLandroid/view/View;)V

    const-wide/16 p0, 0x10

    .line 287
    invoke-static {p0, p1, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    .line 281
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static scheduleMaintenance()V
    .registers 4

    .line 596
    sget-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->maintenancePosted:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 597
    sput-boolean v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->maintenancePosted:Z

    .line 598
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAINTENANCE:Ljava/lang/Runnable;

    const-wide/16 v2, 0x9c4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static scheduleScan(J)V
    .registers 6

    .line 573
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanGeneration:J

    .line 574
    sget-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanPosted:Z

    if-eqz v2, :cond_7

    return-void

    :cond_7
    const/4 v2, 0x1

    .line 575
    sput-boolean v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->scanPosted:Z

    .line 576
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->MAIN:Landroid/os/Handler;

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda3;

    invoke-direct {v3, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController$$ExternalSyntheticLambda3;-><init>(J)V

    const-wide/16 v0, 0x0

    .line 592
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    .line 576
    invoke-virtual {v2, v3, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static syncNativeCaptionState(Landroid/view/View;)V
    .registers 5

    .line 735
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 736
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->ignoreUiStateUntilMs:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_34

    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->transitionQuietUntilMs:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_11

    goto :goto_34

    .line 737
    :cond_11
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeCaptionState(Landroid/view/View;)I

    move-result p0

    const/4 v2, -0x1

    if-ne p0, v2, :cond_19

    goto :goto_34

    :cond_19
    if-nez p0, :cond_2a

    .line 741
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->nativeMenuUntilMs:J

    cmp-long p0, v0, v2

    if-gtz p0, :cond_23

    const/4 p0, 0x1

    goto :goto_24

    :cond_23
    const/4 p0, 0x0

    :goto_24
    const-string v0, "\u5df2\u786e\u8ba4\u957f\u6309\u83dc\u5355\u5173\u95ed\u5b57\u5e55\uff1b\u6b8b\u4f59\u5b57\u5e55\u8bf7\u6c42\u4e0d\u4f1a\u91cd\u65b0\u5f00\u542f\u539f\u751f\u8f68"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->commitNativeCaptionOff(ZLjava/lang/String;)V

    return-void

    .line 747
    :cond_2a
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->NATIVE_STATE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 748
    :try_start_2d
    sput p0, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    .line 749
    monitor-exit v0

    return-void

    :catchall_31
    move-exception p0

    monitor-exit v0
    :try_end_33
    .catchall {:try_start_2d .. :try_end_33} :catchall_31

    throw p0

    :cond_34
    :goto_34
    return-void
.end method

.method static wantsCaptionsOnAcrossVideo()Z
    .registers 5

    .line 176
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 177
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v2

    if-nez v2, :cond_17

    sget v2, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->captionIntent:I

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->selectDefaultUntilMs:J

    .line 178
    invoke-static {v2, v0, v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/CaptionIntentPolicy;->mayActivate(IJJ)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    return v0

    :cond_17
    :goto_17
    const/4 v0, 0x1

    return v0
.end method
