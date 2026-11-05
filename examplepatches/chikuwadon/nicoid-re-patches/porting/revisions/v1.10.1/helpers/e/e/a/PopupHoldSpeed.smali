.class public final Le/e/a/PopupHoldSpeed;
.super Ljava/lang/Object;
.source "PopupHoldSpeed.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PopupHoldSpeed$State;
    }
.end annotation


# static fields
.field private static final handler:Landroid/os/Handler;

.field private static final states:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/PopupHoldSpeed$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    .line 20
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PopupHoldSpeed;->states:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beforeSpeed(Ljava/lang/Object;)V
    .registers 4

    .line 115
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Le/e/a/PopupHoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16

    return-void

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Le/e/a/PopupHoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/PopupHoldSpeed$State;

    if-eqz v2, :cond_f

    iget-object v2, v2, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    if-ne v2, p0, :cond_f

    invoke-static {v1}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    goto :goto_f
.end method

.method private static begin(Le/e/a/PopupHoldSpeed$State;)V
    .registers 10

    .line 76
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 78
    :try_start_6
    invoke-static {p0, v0}, Le/e/a/PopupHoldSpeed;->valid(Le/e/a/PopupHoldSpeed$State;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    return-void

    .line 79
    :cond_10
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    const-string v2, "getPlaybackSpeed"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iput v1, p0, Le/e/a/PopupHoldSpeed$State;->original:F

    .line 80
    iget v1, p0, Le/e/a/PopupHoldSpeed$State;->original:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_c1

    iget v1, p0, Le/e/a/PopupHoldSpeed$State;->original:F

    invoke-static {v1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_36

    goto/16 :goto_c1

    .line 81
    :cond_36
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v2, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    const-string v4, "setPlaybackSpeed"

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v3

    new-array v7, v5, [Ljava/lang/Object;

    iget v8, p0, Le/e/a/PopupHoldSpeed$State;->rate:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v2, v4, v6, v7}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5b

    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    return-void

    .line 82
    :cond_5b
    iput-boolean v5, p0, Le/e/a/PopupHoldSpeed$State;->holding:Z

    .line 83
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    instance-of v1, v1, Le/e/a/PopupPinchLayout;

    if-eqz v1, :cond_6a

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    check-cast v1, Le/e/a/PopupPinchLayout;

    invoke-virtual {v1}, Le/e/a/PopupPinchLayout;->cancelHoldTargets()V

    .line 84
    :cond_6a
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Le/e/a/PopupHoldSpeed$State;->rate:F

    invoke-static {v1, v2}, Le/e/a/HoldSpeed;->indicator(Landroid/content/Context;F)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    .line 85
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    iget-object v4, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMinimumHeight()I

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {v1, v2, v4}, Landroid/widget/TextView;->measure(II)V

    .line 86
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    iget-object v2, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v2

    iget-object v4, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {v1, v3, v3, v2, v4}, Landroid/widget/TextView;->layout(IIII)V

    .line 87
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroupOverlay;->add(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->position(Le/e/a/PopupHoldSpeed$State;)V

    .line 88
    new-instance v1, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda2;-><init>(Le/e/a/PopupHoldSpeed$State;)V

    iput-object v1, p0, Le/e/a/PopupHoldSpeed$State;->monitor:Ljava/lang/Runnable;

    .line 91
    sget-object v1, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    iget-object p0, p0, Le/e/a/PopupHoldSpeed$State;->monitor:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_cd

    .line 80
    :cond_c1
    :goto_c1
    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V
    :try_end_c4
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_c4} :catch_c5

    return-void

    .line 92
    :catch_c5
    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    const-string p0, "Popup hold speed: operation cancelled"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :goto_cd
    return-void
.end method

.method static controlAt(Landroid/view/View;FFLandroid/view/View;)Z
    .registers 10

    .line 31
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 32
    invoke-static {p0, v0}, Le/e/a/PopupHoldSpeed;->screenBounds(Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_d

    return v2

    .line 35
    :cond_d
    instance-of v1, p0, Landroid/widget/SeekBar;

    const/4 v3, 0x1

    if-nez v1, :cond_32

    instance-of v1, p0, Landroid/widget/Button;

    if-nez v1, :cond_32

    .line 36
    instance-of v1, p0, Landroid/widget/ImageButton;

    if-nez v1, :cond_32

    instance-of v1, p0, Landroid/widget/EditText;

    if-nez v1, :cond_32

    if-eq p0, p3, :cond_30

    .line 37
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-nez v1, :cond_30

    invoke-virtual {p0}, Landroid/view/View;->isClickable()Z

    move-result v1

    if-nez v1, :cond_32

    invoke-virtual {p0}, Landroid/view/View;->isLongClickable()Z

    move-result v1

    if-nez v1, :cond_32

    :cond_30
    const/4 v1, 0x0

    goto :goto_33

    :cond_32
    const/4 v1, 0x1

    :goto_33
    float-to-int v4, p1

    float-to-int v5, p2

    .line 40
    invoke-virtual {v0, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    if-nez v0, :cond_3c

    return v2

    :cond_3c
    if-eqz v1, :cond_3f

    return v3

    .line 42
    :cond_3f
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5b

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    sub-int/2addr v0, v3

    :goto_4a
    if-gez v0, :cond_4d

    goto :goto_5b

    .line 43
    :cond_4d
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, p1, p2, p3}, Le/e/a/PopupHoldSpeed;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_58

    return v3

    :cond_58
    add-int/lit8 v0, v0, -0x1

    goto :goto_4a

    :cond_5b
    :goto_5b
    return v2
.end method

.method static synthetic lambda$0(Le/e/a/PopupHoldSpeed$State;)V
    .registers 1

    .line 59
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->begin(Le/e/a/PopupHoldSpeed$State;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/PopupHoldSpeed$State;)V
    .registers 5

    .line 89
    :try_start_0
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p0, v0}, Le/e/a/PopupHoldSpeed;->valid(Le/e/a/PopupHoldSpeed$State;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->position(Le/e/a/PopupHoldSpeed$State;)V

    sget-object v0, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->monitor:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_18} :catch_19

    return-void

    .line 90
    :catch_19
    :cond_19
    iget-object p0, p0, Le/e/a/PopupHoldSpeed$State;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    return-void
.end method

.method private static playing(Landroid/view/View;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 70
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "isPlaying"

    invoke-static {p0, v3, v2, v1}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static position(Le/e/a/PopupHoldSpeed$State;)V
    .registers 1

    invoke-static {p0}, Le/e/a/FeedbackHud219;->popupPosition(Ljava/lang/Object;)V

    return-void
.end method

.method static screenBounds(Landroid/view/View;Landroid/graphics/Rect;)Z
    .registers 4

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    invoke-virtual {p0, p1}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_22

    :cond_e
    const/4 v0, 0x2

    .line 27
    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 28
    aget p0, v0, v1

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-virtual {p1, p0, v0}, Landroid/graphics/Rect;->offset(II)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    :cond_22
    :goto_22
    return v1
.end method

.method public static stop(Ljava/lang/Object;)V
    .registers 7

    .line 110
    sget-object v0, Le/e/a/PopupHoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/PopupHoldSpeed$State;

    if-nez p0, :cond_b

    return-void

    .line 111
    :cond_b
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->start:Ljava/lang/Runnable;

    if-eqz v0, :cond_16

    sget-object v0, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_16
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->monitor:Ljava/lang/Runnable;

    if-eqz v0, :cond_21

    sget-object v0, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->monitor:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 112
    :cond_21
    iget-boolean v0, p0, Le/e/a/PopupHoldSpeed$State;->holding:Z

    if-eqz v0, :cond_46

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/PopupHoldSpeed$State;->holding:Z

    :try_start_28
    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    const-string v2, "setPlaybackSpeed"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v0

    new-array v3, v3, [Ljava/lang/Object;

    iget v5, p0, Le/e/a/PopupHoldSpeed$State;->original:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v0

    invoke-static {v1, v2, v4, v3}, Le/e/a/PlaybackSession;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_40} :catch_41

    goto :goto_46

    :catch_41
    const-string v0, "Popup hold speed: restore unavailable"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 113
    :cond_46
    :goto_46
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    if-eqz v0, :cond_58

    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getOverlay()Landroid/view/ViewGroupOverlay;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroupOverlay;->remove(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/PopupHoldSpeed$State;->hud:Landroid/widget/TextView;

    :cond_58
    return-void
.end method

.method private static toolbarBottom(Landroid/view/View;Landroid/graphics/Rect;)I
    .registers 7

    if-eqz p0, :cond_6f

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_e

    goto :goto_6f

    .line 96
    :cond_e
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-static {p0, v0}, Le/e/a/PopupHoldSpeed;->screenBounds(Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-static {v0, p1}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v1

    if-nez v1, :cond_20

    goto :goto_6c

    .line 97
    :cond_20
    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3e99999a    # 0.3f

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_4c

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_4c

    iget p0, v0, Landroid/graphics/Rect;->bottom:I

    return p0

    .line 98
    :cond_4c
    iget v0, p1, Landroid/graphics/Rect;->top:I

    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_6b

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    :goto_55
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_5c

    goto :goto_6b

    :cond_5c
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Le/e/a/PopupHoldSpeed;->toolbarBottom(Landroid/view/View;Landroid/graphics/Rect;)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_55

    :cond_6b
    :goto_6b
    return v0

    .line 96
    :cond_6c
    :goto_6c
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0

    .line 95
    :cond_6f
    :goto_6f
    iget p0, p1, Landroid/graphics/Rect;->top:I

    return p0
.end method

.method public static touch(Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
    .registers 12

    .line 47
    instance-of v0, p0, Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 48
    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    sget-object v2, Le/e/a/PopupHoldSpeed;->states:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/PopupHoldSpeed$State;

    if-nez v0, :cond_c1

    .line 50
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Le/e/a/HoldSpeed;->configured(Landroid/content/Context;)F

    move-result v0

    const/4 v3, 0x0

    cmpg-float v3, v0, v3

    if-gtz v3, :cond_24

    return v1

    .line 53
    :cond_24
    :try_start_24
    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    if-eqz v3, :cond_ba

    .line 54
    invoke-static {v3, v4}, Le/e/a/PopupHoldSpeed;->screenBounds(Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result v5

    if-eqz v5, :cond_ba

    invoke-static {v3}, Le/e/a/PopupHoldSpeed;->playing(Landroid/view/View;)Z

    move-result v5

    if-nez v5, :cond_41

    goto/16 :goto_ba

    .line 55
    :cond_41
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iget v6, v4, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    iget v7, v4, Landroid/graphics/Rect;->top:I

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v5, v6, v7, v4, v8}, Le/e/a/GestureRules;->startArea(FFFFF)Z

    move-result v4

    if-eqz v4, :cond_ba

    .line 56
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    invoke-static {p1, v4, v5, v3}, Le/e/a/PopupHoldSpeed;->controlAt(Landroid/view/View;FFLandroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_7a

    goto :goto_ba

    .line 57
    :cond_7a
    new-instance v4, Le/e/a/PopupHoldSpeed$State;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Le/e/a/PopupHoldSpeed$State;-><init>(Le/e/a/PopupHoldSpeed$State;)V

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, v4, Le/e/a/PopupHoldSpeed$State;->owner:Ljava/lang/ref/WeakReference;

    iput-object p1, v4, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    iput-object v3, v4, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    .line 58
    const-string p1, "f"

    invoke-static {p0, p1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, v4, Le/e/a/PopupHoldSpeed$State;->id:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, v4, Le/e/a/PopupHoldSpeed$State;->x:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, v4, Le/e/a/PopupHoldSpeed$State;->y:F

    iput v0, v4, Le/e/a/PopupHoldSpeed$State;->rate:F

    .line 59
    new-instance p1, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda3;

    invoke-direct {p1, v4}, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda3;-><init>(Le/e/a/PopupHoldSpeed$State;)V

    iput-object p1, v4, Le/e/a/PopupHoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-virtual {v2, p0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Le/e/a/PopupHoldSpeed;->handler:Landroid/os/Handler;

    iget-object p1, v4, Le/e/a/PopupHoldSpeed$State;->start:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p2

    int-to-long v2, p2

    invoke-virtual {p0, p1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_b9} :catch_bb

    goto :goto_c0

    :cond_ba
    :goto_ba
    return v1

    .line 60
    :catch_bb
    const-string p0, "Popup hold speed: binding unavailable"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    :goto_c0
    return v1

    :cond_c1
    if-nez v3, :cond_c4

    return v1

    .line 64
    :cond_c4
    iget-boolean v2, v3, Le/e/a/PopupHoldSpeed$State;->holding:Z

    const/4 v4, 0x1

    if-eq v0, v4, :cond_10d

    const/4 v5, 0x3

    if-eq v0, v5, :cond_10d

    const/4 v5, 0x2

    if-ne v0, v5, :cond_d8

    if-eqz v2, :cond_d8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-ne v5, v4, :cond_d8

    return v2

    .line 65
    :cond_d8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-le v5, v4, :cond_df

    goto :goto_10d

    .line 66
    :cond_df
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    const/4 v4, 0x2

    if-ne v0, v4, :cond_10c

    .line 67
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v4, v3, Le/e/a/PopupHoldSpeed$State;->x:F

    sub-float/2addr v0, v4

    float-to-double v4, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v0, v3, Le/e/a/PopupHoldSpeed$State;->y:F

    sub-float/2addr p2, v0

    float-to-double v6, p2

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v3

    float-to-double p1, p1

    cmpl-double v0, v3, p1

    if-lez v0, :cond_10c

    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    return v1

    :cond_10c
    return v2

    .line 65
    :cond_10d
    :goto_10d
    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->stop(Ljava/lang/Object;)V

    return v2
.end method

.method private static valid(Le/e/a/PopupHoldSpeed$State;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p1, :cond_3c

    .line 72
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->root:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 73
    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Le/e/a/PopupHoldSpeed$State;->id:Ljava/lang/String;

    const-string v1, "f"

    invoke-static {p1, v1}, Le/e/a/PlaybackSession;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3c

    iget-object p0, p0, Le/e/a/PopupHoldSpeed$State;->video:Landroid/view/View;

    invoke-static {p0}, Le/e/a/PopupHoldSpeed;->playing(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_3c

    const/4 p0, 0x1

    return p0

    :cond_3c
    const/4 p0, 0x0

    return p0
.end method
