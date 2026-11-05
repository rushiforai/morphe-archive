.class public final Le/e/a/HoldSpeed;
.super Ljava/lang/Object;
.source "HoldSpeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/HoldSpeed$State;
    }
.end annotation


# static fields
.field static final DEFAULT:F = 2.0f

.field static final KEY:Ljava/lang/String; = "hold_playback_speed"

.field private static final handler:Landroid/os/Handler;

.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/HoldSpeed$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beforeSpeed(Ljava/lang/Object;)V
    .registers 4

    .line 115
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->beforeSpeed(Ljava/lang/Object;)V

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_19

    return-void

    :cond_19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    sget-object v2, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/HoldSpeed$State;

    if-eqz v2, :cond_12

    iget-object v2, v2, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    if-ne v2, p0, :cond_12

    invoke-static {v1}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    goto :goto_12
.end method

.method private static begin(Le/e/a/HoldSpeed$State;)V
    .registers 14

    .line 91
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 93
    :try_start_8
    invoke-static {p0, v0}, Le/e/a/HoldSpeed;->valid(Le/e/a/HoldSpeed$State;Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_14

    if-eqz v0, :cond_13

    invoke-static {v0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    :cond_13
    return-void

    .line 94
    :cond_14
    iget-object v1, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    const-string v2, "getPlaybackSpeed"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iput v1, p0, Le/e/a/HoldSpeed$State;->original:F

    .line 95
    iget v1, p0, Le/e/a/HoldSpeed$State;->original:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-lez v1, :cond_cd

    iget v1, p0, Le/e/a/HoldSpeed$State;->original:F

    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_cd

    iget v1, p0, Le/e/a/HoldSpeed$State;->original:F

    invoke-static {v1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_42

    goto/16 :goto_cd

    .line 96
    :cond_42
    iget-object v1, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    const-string v2, "setPlaybackSpeed"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    new-array v6, v4, [Ljava/lang/Object;

    iget v7, p0, Le/e/a/HoldSpeed$State;->rate:F

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v1, v2, v5, v6}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 97
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_64

    return-void

    .line 98
    :cond_64
    iput-boolean v4, p0, Le/e/a/HoldSpeed$State;->holding:Z

    invoke-static {p0}, Le/e/a/PlayerGestures219;->startedHold(Ljava/lang/Object;)V

    iput-boolean v4, p0, Le/e/a/HoldSpeed$State;->consume:Z

    .line 100
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iget v10, p0, Le/e/a/HoldSpeed$State;->x:F

    iget v11, p0, Le/e/a/HoldSpeed$State;->y:F

    const/4 v12, 0x0

    const/4 v9, 0x3

    invoke-static/range {v5 .. v12}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v1

    .line 101
    iput-boolean v4, p0, Le/e/a/HoldSpeed$State;->cancelling:Z
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_7f} :catch_ce

    :try_start_7f
    invoke-virtual {v0, v1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_82
    .catchall {:try_start_7f .. :try_end_82} :catchall_c6

    :try_start_82
    iput-boolean v3, p0, Le/e/a/HoldSpeed$State;->cancelling:Z

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 102
    iget v1, p0, Le/e/a/HoldSpeed$State;->rate:F

    invoke-static {v0, v1}, Le/e/a/HoldSpeed;->indicator(Landroid/content/Context;F)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    const v1, 0x1020002

    .line 103
    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v2, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getMinimumHeight()I

    move-result v2

    const/16 v3, 0x33

    const/4 v4, -0x2

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v2, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    iget-object v1, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    new-instance v2, Le/e/a/HoldSpeed$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Le/e/a/HoldSpeed$$ExternalSyntheticLambda0;-><init>(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 105
    new-instance v1, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;-><init>(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V

    iput-object v1, p0, Le/e/a/HoldSpeed$State;->monitor:Ljava/lang/Runnable;

    sget-object v0, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/HoldSpeed$State;->monitor:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_d6

    :catchall_c6
    move-exception v0

    .line 101
    iput-boolean v3, p0, Le/e/a/HoldSpeed$State;->cancelling:Z

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    throw v0
    :try_end_cd
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_cd} :catch_ce

    :cond_cd
    :goto_cd
    return-void

    .line 106
    :catch_ce
    invoke-static {p0}, Le/e/a/HoldSpeed;->cancel(Le/e/a/HoldSpeed$State;)V

    const-string p0, "Hold speed: operation cancelled"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :goto_d6
    return-void
.end method

.method private static cancel(Le/e/a/HoldSpeed$State;)V
    .registers 7

    .line 109
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->start:Ljava/lang/Runnable;

    if-eqz v0, :cond_b

    sget-object v0, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/HoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_b
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->monitor:Ljava/lang/Runnable;

    if-eqz v0, :cond_16

    sget-object v0, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/HoldSpeed$State;->monitor:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 110
    :cond_16
    iget-boolean v0, p0, Le/e/a/HoldSpeed$State;->holding:Z

    if-eqz v0, :cond_3e

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/HoldSpeed$State;->holding:Z

    invoke-static {p0}, Le/e/a/PlayerGestures219;->stoppedHold(Ljava/lang/Object;)V

    :try_start_20
    iget-object v1, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    const-string v2, "setPlaybackSpeed"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v0

    new-array v3, v3, [Ljava/lang/Object;

    iget v5, p0, Le/e/a/HoldSpeed$State;->original:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v0

    invoke-static {v1, v2, v4, v3}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_38} :catch_39

    goto :goto_3e

    :catch_39
    const-string v0, "Hold speed: restore unavailable"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 111
    :cond_3e
    :goto_3e
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_59

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_59
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    :cond_5c
    return-void
.end method

.method public static cancelling(Landroid/app/Activity;)Z
    .registers 2

    .line 59
    sget-object v0, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HoldSpeed$State;

    if-eqz p0, :cond_10

    iget-boolean p0, p0, Le/e/a/HoldSpeed$State;->cancelling:Z

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method static configured(Landroid/content/Context;)F
    .registers 4

    const/high16 v0, 0x40000000    # 2.0f

    .line 26
    :try_start_2
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v1, "hold_playback_speed"

    const-string v2, "2.0"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_33

    invoke-static {p0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_1f

    goto :goto_33

    :cond_1f
    const/4 v1, 0x0

    cmpg-float v2, p0, v1

    if-gtz v2, :cond_26

    const/4 v0, 0x0

    goto :goto_33

    :cond_26
    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const v1, 0x3dcccccd    # 0.1f

    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result v0
    :try_end_33
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_33} :catch_33

    :catch_33
    :cond_33
    :goto_33
    return v0
.end method

.method static indicator(Landroid/content/Context;F)Landroid/widget/TextView;
    .registers 2

    invoke-static {p0, p1}, Le/e/a/FeedbackHud219;->indicator(Landroid/content/Context;F)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;Landroid/preference/Preference;)Z
    .registers 4

    .line 33
    invoke-static {p0}, Le/e/a/HoldSpeed;->configured(Landroid/content/Context;)F

    move-result p2

    new-instance v0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Le/e/a/HoldSpeed$$ExternalSyntheticLambda2;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-static {p0, p2, v0}, Le/e/a/SpeedSlider;->showHold(Landroid/content/Context;FLe/e/a/SpeedSlider$Selection;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;F)V
    .registers 5

    .line 33
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "hold_playback_speed"

    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p2}, Le/e/a/HoldSpeed;->summary(F)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/HoldSpeed$State;)V
    .registers 1

    .line 70
    invoke-static {p0}, Le/e/a/HoldSpeed;->begin(Le/e/a/HoldSpeed$State;)V

    return-void
.end method

.method static synthetic lambda$3(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V
    .registers 3

    .line 104
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_b

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    iget-object p0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-static {p1, v0, p0}, Le/e/a/HoldSpeed;->position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V

    :cond_b
    return-void
.end method

.method static synthetic lambda$4(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V
    .registers 5

    .line 105
    :try_start_0
    iget-object v0, p0, Le/e/a/HoldSpeed$State;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-static {p0, v0}, Le/e/a/HoldSpeed;->valid(Le/e/a/HoldSpeed$State;Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_19

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    iget-object v1, p0, Le/e/a/HoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-static {p1, v0, v1}, Le/e/a/HoldSpeed;->position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V

    :cond_19
    sget-object p1, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->monitor:Ljava/lang/Runnable;

    const-wide/16 v1, 0x32

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_22} :catch_23

    return-void

    :catch_23
    :cond_23
    invoke-static {p0}, Le/e/a/HoldSpeed;->cancel(Le/e/a/HoldSpeed$State;)V

    return-void
.end method

.method private static playing(Landroid/view/View;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 84
    new-array v1, v0, [Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Object;

    const-string v2, "isPlaying"

    invoke-static {p0, v2, v1, v0}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method static position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V
    .registers 3

    invoke-static {p0, p1, p2}, Le/e/a/FeedbackHud219;->position(Landroid/view/ViewGroup;Landroid/view/View;Landroid/widget/TextView;)V

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
    .registers 4

    .line 30
    const-string v0, "hold_playback_speed"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-eqz v1, :cond_9

    return-void

    .line 31
    :cond_9
    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "\u9577\u62bc\u3057\u4e2d\u306e\u518d\u751f\u901f\u5ea6"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 32
    invoke-static {p0}, Le/e/a/HoldSpeed;->configured(Landroid/content/Context;)F

    move-result v0

    invoke-static {v0}, Le/e/a/HoldSpeed;->summary(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, v1}, Le/e/a/HoldSpeed$$ExternalSyntheticLambda4;-><init>(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 34
    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method public static stop(Landroid/app/Activity;)V
    .registers 2

    .line 113
    sget-object v0, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/HoldSpeed$State;

    if-eqz p0, :cond_d

    invoke-static {p0}, Le/e/a/HoldSpeed;->cancel(Le/e/a/HoldSpeed$State;)V

    :cond_d
    return-void
.end method

.method static summary(F)Ljava/lang/String;
    .registers 5

    .line 36
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v1, "%s\uff1a\u52d5\u753b\u753b\u9762\u306e\u9577\u62bc\u3057\u4e2d\u3060\u3051\u518d\u751f\u901f\u5ea6\u3092\u5909\u66f4\u3057\u307e\u3059\u3002\u6307\u3092\u96e2\u3059\u3068\u5143\u306b\u623b\u308a\u307e\u3059\uff08\u5de6\u7aef\u3067\u7121\u52b9\uff09\u3002"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    cmpg-float v3, p0, v3

    if-gtz v3, :cond_17

    const-string p0, "\u7121\u52b9"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1b

    :cond_17
    invoke-static {p0}, Le/e/a/SpeedSlider;->label(F)Ljava/lang/String;

    move-result-object p0

    :goto_1b
    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static toolbarBottom(Landroid/view/View;Landroid/graphics/Rect;)I
    .registers 8

    if-eqz p0, :cond_75

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_75

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_14

    goto :goto_75

    .line 53
    :cond_14
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_72

    invoke-static {v0, p1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_26

    goto :goto_72

    .line 54
    :cond_26
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 55
    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x3e99999a    # 0.3f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_54

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_54

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    goto :goto_71

    .line 56
    :cond_54
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_71

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_5b
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_62

    goto :goto_71

    :cond_62
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Le/e/a/HoldSpeed;->toolbarBottom(Landroid/view/View;Landroid/graphics/Rect;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_5b

    :cond_71
    :goto_71
    return v1

    .line 53
    :cond_72
    :goto_72
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0

    .line 52
    :cond_75
    :goto_75
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0
.end method

.method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 12

    .line 61
    sget-object v0, Le/e/a/HoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/HoldSpeed$State;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_e2

    .line 63
    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    invoke-static {p0}, Le/e/a/HoldSpeed;->configured(Landroid/content/Context;)F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v2, v1, v2

    if-lez v2, :cond_e1

    invoke-static {p0}, Le/e/a/ModernShorts;->active(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_23

    goto/16 :goto_e1

    .line 65
    :cond_23
    :try_start_23
    const-string v2, "v"

    invoke-static {p0, v2}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "a0"

    invoke-static {v2, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    if-eqz v4, :cond_db

    .line 66
    invoke-virtual {v4}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_db

    invoke-virtual {v4, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_db

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_db

    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    iget v7, v5, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    iget v8, v5, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v6, v7, v8, v5, v9}, Le/e/a/GestureRules;->startArea(FFFFF)Z

    move-result v5

    if-eqz v5, :cond_db

    .line 68
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    invoke-static {v5, v6, v7, v4}, Le/e/a/PlayerGestures;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_db

    invoke-static {v4}, Le/e/a/HoldSpeed;->playing(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_9b

    goto :goto_db

    .line 69
    :cond_9b
    new-instance v5, Le/e/a/HoldSpeed$State;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Le/e/a/HoldSpeed$State;-><init>(Le/e/a/HoldSpeed$State;)V

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v6, v5, Le/e/a/HoldSpeed$State;->activity:Ljava/lang/ref/WeakReference;

    iput-object v4, v5, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    iput-object v2, v5, Le/e/a/HoldSpeed$State;->fragment:Ljava/lang/Object;

    const-string v4, "b0"

    invoke-static {v2, v4}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, v5, Le/e/a/HoldSpeed$State;->id:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iput v2, v5, Le/e/a/HoldSpeed$State;->x:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, v5, Le/e/a/HoldSpeed$State;->y:F

    iput v1, v5, Le/e/a/HoldSpeed$State;->rate:F

    .line 70
    new-instance p1, Le/e/a/HoldSpeed$$ExternalSyntheticLambda3;

    invoke-direct {p1, v5}, Le/e/a/HoldSpeed$$ExternalSyntheticLambda3;-><init>(Le/e/a/HoldSpeed$State;)V

    iput-object p1, v5, Le/e/a/HoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-virtual {v0, p0, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/HoldSpeed;->handler:Landroid/os/Handler;

    iget-object p1, v5, Le/e/a/HoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_da
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_da} :catch_dc

    goto :goto_e1

    :cond_db
    :goto_db
    return v3

    .line 71
    :catch_dc
    const-string p0, "Hold speed: player binding unavailable"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :cond_e1
    :goto_e1
    return v3

    :cond_e2
    if-nez v1, :cond_e5

    return v3

    .line 75
    :cond_e5
    iget-boolean v3, v1, Le/e/a/HoldSpeed$State;->consume:Z

    const/4 v4, 0x1

    if-eq v2, v4, :cond_136

    const/4 v5, 0x3

    if-ne v2, v5, :cond_ee

    goto :goto_136

    .line 77
    :cond_ee
    if-eqz v3, :cond_fa

    const/4 v5, 0x2

    if-ne v2, v5, :cond_fa

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-ne v5, v4, :cond_fa

    return v3

    :cond_fa
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v5

    int-to-float v5, v5

    .line 78
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-gt v6, v4, :cond_12d

    const/4 v4, 0x5

    if-eq v2, v4, :cond_12d

    const/4 v4, 0x2

    if-ne v2, v4, :cond_135

    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v4, v1, Le/e/a/HoldSpeed$State;->x:F

    sub-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v5

    if-gtz v2, :cond_12d

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget v2, v1, Le/e/a/HoldSpeed$State;->y:F

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, v5

    if-lez p1, :cond_135

    .line 80
    :cond_12d
    invoke-static {v1}, Le/e/a/HoldSpeed;->cancel(Le/e/a/HoldSpeed$State;)V

    if-nez v3, :cond_135

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_135
    return v3

    .line 76
    :cond_136
    :goto_136
    invoke-static {p0}, Le/e/a/HoldSpeed;->stop(Landroid/app/Activity;)V

    return v3
.end method

.method private static valid(Le/e/a/HoldSpeed$State;Landroid/app/Activity;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p1, :cond_46

    .line 86
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_46

    invoke-virtual {p1}, Landroid/app/Activity;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_46

    .line 87
    const-string v0, "v"

    invoke-static {p1, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->fragment:Ljava/lang/Object;

    if-ne p1, v0, :cond_46

    iget-object p1, p0, Le/e/a/HoldSpeed$State;->fragment:Ljava/lang/Object;

    const-string v0, "a0"

    invoke-static {p1, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    if-ne p1, v0, :cond_46

    .line 88
    iget-object p1, p0, Le/e/a/HoldSpeed$State;->id:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/HoldSpeed$State;->fragment:Ljava/lang/Object;

    const-string v1, "b0"

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_46

    iget-object p0, p0, Le/e/a/HoldSpeed$State;->video:Landroid/view/View;

    invoke-static {p0}, Le/e/a/HoldSpeed;->playing(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_46

    const/4 p0, 0x1

    return p0

    :cond_46
    const/4 p0, 0x0

    return p0
.end method
