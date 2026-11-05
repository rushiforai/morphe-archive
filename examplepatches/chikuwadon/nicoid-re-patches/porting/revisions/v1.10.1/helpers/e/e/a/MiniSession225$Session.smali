.class final Le/e/a/MiniSession225$Session;
.super Ljava/lang/Object;
.source "MiniSession225.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Session"
.end annotation


# instance fields
.field animation:Landroid/animation/ValueAnimator;

.field final away:Ljava/lang/Runnable;

.field body:Landroid/view/View;

.field bodyPadding:I

.field chrome:Le/e/a/MiniChrome236;

.field content:Landroid/widget/FrameLayout;

.field controlsVisibility:I

.field directDestination:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field directEntry:Z

.field directPrepared:Z

.field downTime:J

.field downX:F

.field downY:F

.field dragging:Z

.field firstAttach:Z

.field firstResume:Z

.field host:Landroid/app/Activity;

.field initialExpansion:F

.field final initialShrink:Ljava/lang/Runnable;

.field final intendedPlaying:Z

.field final keeper:Le/e/a/MiniSession225$SurfaceKeeper;

.field final launchTimeout:Ljava/lang/Runnable;

.field miniHeight:I

.field multi:Z

.field nativeControls:Landroid/view/View;

.field final navigateDirect:Ljava/lang/Runnable;

.field final normalHeight:I

.field openingDirect:Z

.field final original:Landroid/view/ViewGroup;

.field final originalIndex:I

.field originalParams:Landroid/view/ViewGroup$LayoutParams;

.field final owner:Ljava/lang/Object;

.field panel:Landroid/widget/FrameLayout;

.field play:Landroid/widget/Button;

.field final releaseOnDetach:Z

.field final resized:Landroid/view/View$OnLayoutChangeListener;

.field final restoreTimeout:Ljava/lang/Runnable;

.field row:Landroid/widget/LinearLayout;

.field shade:Landroid/view/View;

.field shownPlaying:Ljava/lang/Boolean;

.field final source:Landroid/app/Activity;

.field startFraction:F

.field final state:Le/e/a/MiniState225;

.field final texture:Landroid/view/TextureView;

.field final thumb:Landroid/graphics/Bitmap;

.field final tick:Ljava/lang/Runnable;

.field velocity:Landroid/view/VelocityTracker;

.field final video:Landroid/view/View;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/app/Activity;Landroid/view/View;Landroid/view/TextureView;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/MiniSession225$Session;->firstResume:Z

    new-instance v1, Le/e/a/MiniState225;

    invoke-direct {v1}, Le/e/a/MiniState225;-><init>()V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    .line 125
    iput-boolean v0, p0, Le/e/a/MiniSession225$Session;->firstAttach:Z

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Le/e/a/MiniSession225$Session;->initialExpansion:F

    .line 127
    new-instance v1, Le/e/a/MiniSession225$Session$1;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$1;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->navigateDirect:Ljava/lang/Runnable;

    .line 128
    new-instance v1, Le/e/a/MiniSession225$Session$2;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$2;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->tick:Ljava/lang/Runnable;

    .line 129
    new-instance v1, Le/e/a/MiniSession225$Session$3;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$3;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->launchTimeout:Ljava/lang/Runnable;

    .line 130
    new-instance v1, Le/e/a/MiniSession225$Session$4;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$4;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->initialShrink:Ljava/lang/Runnable;

    .line 131
    new-instance v1, Le/e/a/MiniSession225$Session$5;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$5;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->resized:Landroid/view/View$OnLayoutChangeListener;

    .line 132
    new-instance v1, Le/e/a/MiniSession225$Session$6;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$6;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->away:Ljava/lang/Runnable;

    .line 195
    new-instance v1, Le/e/a/MiniSession225$Session$7;

    invoke-direct {v1, p0}, Le/e/a/MiniSession225$Session$7;-><init>(Le/e/a/MiniSession225$Session;)V

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->restoreTimeout:Ljava/lang/Runnable;

    .line 138
    iput-object p1, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    iput-object p4, p0, Le/e/a/MiniSession225$Session;->texture:Landroid/view/TextureView;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 p2, 0x0

    new-array v1, p2, [Ljava/lang/Class;

    new-array v2, p2, [Ljava/lang/Object;

    const-string v3, "isPlaying"

    invoke-static {p3, v3, v1, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/MiniSession225$Session;->intendedPlaying:Z

    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Le/e/a/MiniSession225$Session;->original:Landroid/view/ViewGroup;

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->original:Landroid/view/ViewGroup;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    iput p1, p0, Le/e/a/MiniSession225$Session;->originalIndex:I

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Le/e/a/MiniSession225$Session;->originalParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Le/e/a/MiniSession225$Session;->normalHeight:I

    .line 139
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v0, "releaseOnDetachFromWindow"

    invoke-static {p3, v0}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/MiniSession225$Session;->releaseOnDetach:Z

    .line 140
    const/16 p1, 0xa0

    const/16 v0, 0x5a

    :try_start_91
    invoke-virtual {p4, p1, v0}, Landroid/view/TextureView;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_95
    .catch Ljava/lang/RuntimeException; {:try_start_91 .. :try_end_95} :catch_96

    goto :goto_98

    :catch_96
    move-exception p1

    const/4 p1, 0x0

    :goto_98
    iput-object p1, p0, Le/e/a/MiniSession225$Session;->thumb:Landroid/graphics/Bitmap;

    .line 141
    sget-object p1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {p1}, [Ljava/lang/Class;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const-string v0, "setReleaseOnDetachFromWindow"

    invoke-static {p3, v0, p1, p2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-direct {p1, p4}, Le/e/a/MiniSession225$SurfaceKeeper;-><init>(Landroid/view/TextureView;)V

    iput-object p1, p0, Le/e/a/MiniSession225$Session;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    .line 142
    :try_start_b4
    const-string p1, "videoControls"

    invoke-static {p3, p1}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Landroid/view/View;

    if-eqz p2, :cond_d3

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    iput p1, p0, Le/e/a/MiniSession225$Session;->controlsVisibility:I

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V
    :try_end_d1
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_d1} :catch_d2

    goto :goto_d3

    :catch_d2
    move-exception p1

    .line 143
    :cond_d3
    :goto_d3
    return-void
.end method


# virtual methods
.method apply(F)V
    .registers 6

    .line 164
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_b9

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    if-nez v0, :cond_a

    goto/16 :goto_b9

    :cond_a
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, v0, Le/e/a/MiniState225;->fraction:F

    .line 165
    iget-object p1, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_39

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v0, 0x50

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    const/4 v0, 0x1

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/4 v0, 0x0

    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .line 166
    :cond_39
    iget p1, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->originalParams:Landroid/view/ViewGroup$LayoutParams;

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v0, :cond_46

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->originalParams:Landroid/view/ViewGroup$LayoutParams;

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_48

    :cond_46
    iget v0, p0, Le/e/a/MiniSession225$Session;->normalHeight:I

    :goto_48
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v0, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    div-int/lit8 v1, v1, 0x3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 167
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x30

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget v1, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    int-to-float v1, v1

    iget v3, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    sub-int/2addr p1, v3

    int-to-float p1, p1

    iget-object v3, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v3, v3, Le/e/a/MiniState225;->fraction:F

    mul-float/2addr p1, v3

    add-float/2addr v1, p1

    float-to-int p1, v1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result p1

    iget v1, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    sub-int/2addr p1, v1

    int-to-float p1, p1

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v1, v1, Le/e/a/MiniState225;->fraction:F

    sub-float v1, v2, v1

    mul-float/2addr p1, v1

    float-to-int p1, p1

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-ne v1, p1, :cond_9c

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    if-eq v1, v3, :cond_a3

    :cond_9c
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    :cond_a3
    iget-object p1, p0, Le/e/a/MiniSession225$Session;->row:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    sub-float v0, v2, v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    sub-float/2addr v2, v0

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 169
    return-void

    .line 164
    :cond_b9
    :goto_b9
    return-void
.end method

.method attach(Landroid/app/Activity;)V
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    move-object/from16 v1, p0

    move-object/from16 v11, p1

    const-string v2, ""

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v3, v1, Le/e/a/MiniSession225$Session;->launchTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v12, 0x0

    iput-boolean v12, v1, Le/e/a/MiniSession225$Session;->openingDirect:Z

    invoke-virtual/range {p0 .. p0}, Le/e/a/MiniSession225$Session;->detach()V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_1e

    return-void

    :cond_1e
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    iput-object v11, v1, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    const v0, 0x1020002

    invoke-virtual {v11, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1e6

    .line 147
    const/16 v0, 0x40

    invoke-static {v11, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, v1, Le/e/a/MiniSession225$Session;->miniHeight:I

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    const/4 v3, 0x0

    if-nez v0, :cond_47

    move-object v0, v3

    goto :goto_4d

    :cond_47
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v12}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :goto_4d
    iput-object v0, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    if-nez v0, :cond_55

    move v0, v12

    goto :goto_5b

    :cond_55
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    :goto_5b
    iput v0, v1, Le/e/a/MiniSession225$Session;->bodyPadding:I

    .line 148
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, v11}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    const-string v4, "nicoid-retained-mini-player"

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    const/high16 v4, -0x1000000

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    const/4 v13, 0x0

    invoke-virtual {v0, v13}, Landroid/widget/FrameLayout;->setElevation(F)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    .line 149
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_95

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v4, v1, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_95
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v4, v1, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v15, -0x1

    invoke-direct {v5, v15, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 150
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v11}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    const/high16 v4, -0x67000000

    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v4, v1, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v15, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    const-string v4, "b0"

    invoke-static {v0, v4}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 152
    :try_start_c8
    invoke-static {}, Le/e/a/PlaybackBar221;->media()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e2

    const-string v5, "owner"

    invoke-static {v0, v5}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v1, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    if-ne v5, v6, :cond_e2

    const-string v5, "title"

    invoke-static {v0, v5}, Le/e/a/MiniSession225;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :cond_e2
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_f9

    const-string v0, "author"

    const-string v5, "uploaderName"

    invoke-virtual {v3, v5, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_f6
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_f6} :catch_f8

    move-object v5, v0

    goto :goto_fa

    :catch_f8
    move-exception v0

    :cond_f9
    move-object v5, v2

    :goto_fa
    move-object v0, v3

    .line 153
    new-instance v10, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda4;

    invoke-direct {v10, v1}, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda4;-><init>(Le/e/a/MiniSession225$Session;)V

    .line 154
    new-instance v9, Le/e/a/MiniChrome236;

    iget-object v6, v1, Le/e/a/MiniSession225$Session;->thumb:Landroid/graphics/Bitmap;

    new-instance v8, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda5;

    invoke-direct {v8, v1}, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda5;-><init>(Le/e/a/MiniSession225$Session;)V

    new-instance v7, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda6;

    invoke-direct {v7, v1}, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda6;-><init>(Le/e/a/MiniSession225$Session;)V

    new-instance v3, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda7;

    invoke-direct {v3, v1}, Le/e/a/MiniSession225$Session$$ExternalSyntheticLambda7;-><init>(Le/e/a/MiniSession225$Session;)V

    move-object v2, v9

    move-object/from16 v16, v3

    move-object/from16 v3, p1

    move-object/from16 v17, v7

    move-object v7, v10

    move-object v12, v9

    move-object/from16 v9, v17

    move-object v14, v10

    move-object/from16 v10, v16

    invoke-direct/range {v2 .. v10}, Le/e/a/MiniChrome236;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iput-object v12, v1, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    .line 155
    iget-object v2, v1, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    invoke-virtual {v2, v0}, Le/e/a/MiniChrome236;->metadata(Landroid/os/Bundle;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    iget-object v0, v0, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    iput-object v0, v1, Le/e/a/MiniSession225$Session;->row:Landroid/widget/LinearLayout;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    iget-object v0, v0, Le/e/a/MiniChrome236;->play:Landroid/widget/Button;

    iput-object v0, v1, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    invoke-virtual {v0, v14}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->row:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v1, Le/e/a/MiniSession225$Session;->miniHeight:I

    const/16 v5, 0x50

    invoke-direct {v3, v15, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v1, Le/e/a/MiniSession225$Session;->miniHeight:I

    invoke-direct {v3, v15, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->resized:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    iget v3, v1, Le/e/a/MiniSession225$Session;->miniHeight:I

    invoke-static {v11, v0, v2, v3, v1}, Le/e/a/PlaybackPanels113;->claim(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;ILjava/lang/Object;)V

    .line 157
    invoke-virtual {v1, v13}, Le/e/a/MiniSession225$Session;->apply(F)V

    invoke-static/range {p1 .. p1}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1b7

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v13}, Landroid/widget/FrameLayout;->setAlpha(F)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->row:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, 0x1

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    if-eqz v0, :cond_1b7

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    iget-object v3, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget-object v4, v1, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    iget v5, v1, Le/e/a/MiniSession225$Session;->bodyPadding:I

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    :cond_1b7
    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->tick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 158
    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    new-instance v3, Le/e/a/MiniSession225$Session$8;

    invoke-direct {v3, v1, v0}, Le/e/a/MiniSession225$Session$8;-><init>(Le/e/a/MiniSession225$Session;Landroid/widget/FrameLayout;)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 160
    iget-boolean v0, v1, Le/e/a/MiniSession225$Session;->firstAttach:Z

    if-eqz v0, :cond_1e5

    const/4 v2, 0x0

    iput-boolean v2, v1, Le/e/a/MiniSession225$Session;->firstAttach:Z

    invoke-static/range {p1 .. p1}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1e5

    iget-object v0, v1, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v2, v1, Le/e/a/MiniSession225$Session;->initialShrink:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 161
    :cond_1e5
    return-void

    .line 146
    :cond_1e6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Missing content frame"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method cancelAnimation()V
    .registers 2

    .line 183
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    :cond_11
    return-void
.end method

.method cleanup()V
    .registers 3

    .line 207
    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->navigateDirect:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->away:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->launchTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->restoreTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method close(Z)V
    .registers 6

    .line 209
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    if-eq v0, p0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->close()V

    const/4 v0, 0x0

    invoke-static {v0}, Le/e/a/MiniSession225;->access$7(Le/e/a/MiniSession225$Session;)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->cleanup()V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->detach()V

    .line 210
    if-eqz p1, :cond_2b

    :try_start_18
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v1, "pause"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_24} :catch_25

    goto :goto_2b

    :catch_25
    move-exception v0

    const-string v1, "Cannot stop closed playback"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 212
    :cond_2b
    :goto_2b
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_36

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->returnVideo()V

    :cond_36
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {v0}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :try_start_3b
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v1, "setReleaseOnDetachFromWindow"

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    iget-boolean v3, p0, Le/e/a/MiniSession225$Session;->releaseOnDetach:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_52} :catch_53

    goto :goto_59

    :catch_53
    move-exception v0

    const-string v1, "Cannot restore terminal detach policy"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_59
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    if-eqz v0, :cond_64

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    iget v1, p0, Le/e/a/MiniSession225$Session;->controlsVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 213
    :cond_64
    iget-boolean v0, p0, Le/e/a/MiniSession225$Session;->directEntry:Z

    if-eqz v0, :cond_6d

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->reveal(Landroid/app/Activity;)V

    :cond_6d
    if-eqz p1, :cond_84

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_84

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_84

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 214
    :cond_84
    return-void
.end method

.method detach()V
    .registers 3

    .line 200
    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->cancelAnimation()V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->recycleVelocity()V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->resized:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_1a
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_4d

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->initialShrink:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-ne v0, v1, :cond_36

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_36
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4d

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 201
    :cond_4d
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-static {v0, v1}, Le/e/a/PlaybackPanels113;->release(Landroid/app/Activity;Landroid/view/View;)V

    .line 202
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->row:Landroid/widget/LinearLayout;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->shade:Landroid/view/View;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->body:Landroid/view/View;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->shownPlaying:Ljava/lang/Boolean;

    .line 203
    return-void
.end method

.method finishRestore()V
    .registers 5

    .line 205
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    if-eq v0, p0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackNavigation114;->mark(Landroid/content/Intent;)V

    iget-boolean v0, p0, Le/e/a/MiniSession225$Session;->directEntry:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->reveal(Landroid/app/Activity;)V

    :cond_19
    # getter for: Le/e/a/MiniSession225;->EXPANDED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/MiniSession225;->access$6()Ljava/util/WeakHashMap;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->close()V

    const/4 v0, 0x0

    invoke-static {v0}, Le/e/a/MiniSession225;->access$7(Le/e/a/MiniSession225$Session;)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->cleanup()V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->detach()V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->returnVideo()V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$SurfaceKeeper;->restore(Landroid/view/View;)V

    :try_start_40
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v1, "setReleaseOnDetachFromWindow"

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    iget-boolean v3, p0, Le/e/a/MiniSession225$Session;->releaseOnDetach:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_57} :catch_58

    goto :goto_5e

    :catch_58
    move-exception v0

    const-string v1, "Cannot restore detach policy"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_5e
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    if-eqz v0, :cond_69

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->nativeControls:Landroid/view/View;

    iget v1, p0, Le/e/a/MiniSession225$Session;->controlsVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 206
    :cond_69
    return-void
.end method

.method synthetic lambda$0$e-e-a-MiniSession225$Session(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 3

    .line 153
    invoke-virtual {p0, p2}, Le/e/a/MiniSession225$Session;->touch(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method synthetic lambda$1$e-e-a-MiniSession225$Session(Landroid/view/View;)V
    .registers 7

    .line 154
    :try_start_0
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v1, "isPlaying"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    if-eqz p1, :cond_1a

    const-string p1, "pause"

    goto :goto_1c

    :cond_1a
    const-string p1, "start"

    :goto_1c
    new-array v1, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, p1, v1, v2}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->update()V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    goto :goto_2d

    :catch_27
    move-exception p1

    const-string v0, "Cannot control retained player"

    invoke-static {v0, p1}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_2d
    return-void
.end method

.method synthetic lambda$2$e-e-a-MiniSession225$Session(Landroid/view/View;)V
    .registers 2

    .line 154
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/MiniSession225$Session;->close(Z)V

    return-void
.end method

.method synthetic lambda$3$e-e-a-MiniSession225$Session(Landroid/view/View;)V
    .registers 2

    .line 154
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/MiniSession225$Session;->settle(Z)V

    return-void
.end method

.method recycleVelocity()V
    .registers 2

    .line 182
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    :cond_c
    return-void
.end method

.method restore()V
    .registers 5

    .line 190
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 191
    :cond_9
    :try_start_9
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/DirectBootstrap238;->reveal(Landroid/app/Activity;)V

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x20070000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {v0}, Le/e/a/PlaybackNavigation114;->mark(Landroid/content/Intent;)V

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 192
    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->restoreTimeout:Ljava/lang/Runnable;

    const-wide/16 v2, 0x708

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_41} :catch_42

    .line 193
    goto :goto_51

    :catch_42
    move-exception v0

    const-string v1, "Cannot restore retained player"

    invoke-static {v1, v0}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/MiniSession225$Session;->apply(F)V

    .line 194
    :goto_51
    return-void
.end method

.method returnVideo()V
    .registers 5

    .line 197
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->original:Landroid/view/ViewGroup;

    if-eq v0, v1, :cond_36

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_21

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_21
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->original:Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    iget v2, p0, Le/e/a/MiniSession225$Session;->originalIndex:I

    iget-object v3, p0, Le/e/a/MiniSession225$Session;->original:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Le/e/a/MiniSession225$Session;->originalParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 198
    :cond_36
    return-void
.end method

.method settle(Z)V
    .registers 7

    .line 185
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    if-nez v0, :cond_d

    goto :goto_4b

    :cond_d
    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->cancelAnimation()V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0, p1}, Le/e/a/MiniState225;->settle(Z)I

    move-result v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v1, v1, Le/e/a/MiniState225;->fraction:F

    int-to-float v2, p1

    const/4 v3, 0x2

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput v1, v3, v4

    const/4 v1, 0x1

    aput v2, v3, v1

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xdc

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 186
    iget-object v1, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    new-instance v2, Le/e/a/MiniSession225$Session$9;

    invoke-direct {v2, p0, v0}, Le/e/a/MiniSession225$Session$9;-><init>(Le/e/a/MiniSession225$Session;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 187
    iget-object v1, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    new-instance v2, Le/e/a/MiniSession225$Session$10;

    invoke-direct {v2, p0, v0, p1}, Le/e/a/MiniSession225$Session$10;-><init>(Le/e/a/MiniSession225$Session;IZ)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 188
    return-void

    .line 185
    :cond_4b
    :goto_4b
    return-void
.end method

.method touch(Landroid/view/MotionEvent;)Z
    .registers 11

    .line 171
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->live()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_149

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->phase:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_12

    goto/16 :goto_149

    :cond_12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 172
    const/4 v3, 0x0

    if-nez v0, :cond_4f

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->cancelAnimation()V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    iput v0, p0, Le/e/a/MiniSession225$Session;->startFraction:F

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v2, p0, Le/e/a/MiniSession225$Session;->startFraction:F

    iput v2, v0, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Le/e/a/MiniSession225$Session;->downY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Le/e/a/MiniSession225$Session;->downX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iput-wide v4, p0, Le/e/a/MiniSession225$Session;->downTime:J

    iput-boolean v3, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    iput-boolean v3, p0, Le/e/a/MiniSession225$Session;->multi:Z

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    return v1

    .line 173
    :cond_4f
    iget-object v4, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_58

    iget-object v4, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v4, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 174
    :cond_58
    const/4 v4, 0x5

    if-eq v0, v4, :cond_140

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-le v4, v1, :cond_63

    goto/16 :goto_140

    .line 175
    :cond_63
    if-ne v0, v2, :cond_6c

    invoke-virtual {p0, v3}, Le/e/a/MiniSession225$Session;->settle(Z)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->recycleVelocity()V

    return v1

    .line 176
    :cond_6c
    iget-boolean v2, p0, Le/e/a/MiniSession225$Session;->multi:Z

    if-eqz v2, :cond_71

    return v1

    .line 177
    :cond_71
    iget v2, p0, Le/e/a/MiniSession225$Session;->downY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    sub-float/2addr v2, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Le/e/a/MiniSession225$Session;->downX:F

    sub-float/2addr v4, v5

    .line 178
    const/4 v5, 0x2

    const/4 v6, 0x0

    if-ne v0, v5, :cond_dc

    iget-boolean p1, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    if-nez p1, :cond_b6

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_b6

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v3, 0x3fa66666    # 1.3f

    mul-float/2addr v0, v3

    cmpl-float p1, p1, v0

    if-lez p1, :cond_b6

    cmpl-float p1, v2, v6

    if-gtz p1, :cond_b4

    iget p1, p0, Le/e/a/MiniSession225$Session;->startFraction:F

    cmpl-float p1, p1, v6

    if-lez p1, :cond_b6

    :cond_b4
    iput-boolean v1, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    :cond_b6
    iget-boolean p1, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    if-eqz p1, :cond_db

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget v0, p0, Le/e/a/MiniSession225$Session;->startFraction:F

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->travel()F

    move-result v3

    mul-float/2addr v0, v3

    add-float/2addr v2, v0

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->travel()F

    move-result v0

    invoke-virtual {p1, v2, v0}, Le/e/a/MiniState225;->drag(FF)Z

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget p1, p1, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p0, p1}, Le/e/a/MiniSession225$Session;->apply(F)V

    :cond_db
    return v1

    .line 179
    :cond_dc
    if-ne v0, v1, :cond_13f

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_ef

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    const/16 v5, 0x3e8

    invoke-virtual {v0, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v6

    :cond_ef
    iget-boolean v0, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    if-nez v0, :cond_11a

    float-to-double v4, v4

    float-to-double v7, v2

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-double v7, v0

    cmpg-double v0, v4, v7

    if-gez v0, :cond_11a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iget-wide v7, p0, Le/e/a/MiniSession225$Session;->downTime:J

    sub-long/2addr v4, v7

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v7, p1

    cmp-long p1, v4, v7

    if-gez p1, :cond_11a

    move p1, v1

    goto :goto_11b

    :cond_11a
    move p1, v3

    :goto_11b
    if-nez p1, :cond_137

    iget-boolean p1, p0, Le/e/a/MiniSession225$Session;->dragging:Z

    if-eqz p1, :cond_136

    iget-object p1, p0, Le/e/a/MiniSession225$Session;->state:Le/e/a/MiniState225;

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v6, v0

    invoke-virtual {p1, v6}, Le/e/a/MiniState225;->expand(F)Z

    move-result p1

    if-nez p1, :cond_137

    :cond_136
    goto :goto_138

    :cond_137
    move v3, v1

    :goto_138
    invoke-virtual {p0, v3}, Le/e/a/MiniSession225$Session;->settle(Z)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->recycleVelocity()V

    return v1

    .line 180
    :cond_13f
    return v1

    .line 174
    :cond_140
    :goto_140
    iput-boolean v1, p0, Le/e/a/MiniSession225$Session;->multi:Z

    invoke-virtual {p0, v3}, Le/e/a/MiniSession225$Session;->settle(Z)V

    invoke-virtual {p0}, Le/e/a/MiniSession225$Session;->recycleVelocity()V

    return v1

    .line 171
    :cond_149
    :goto_149
    return v1
.end method

.method travel()F
    .registers 4

    .line 162
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    if-nez v0, :cond_6

    goto :goto_13

    :cond_6
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    iget v2, p0, Le/e/a/MiniSession225$Session;->miniHeight:I

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    :goto_13
    int-to-float v0, v1

    return v0
.end method

.method update()V
    .registers 6

    .line 144
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    if-eqz v0, :cond_13

    :try_start_4
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->chrome:Le/e/a/MiniChrome236;

    invoke-virtual {v1, v0}, Le/e/a/MiniChrome236;->metadata(Landroid/os/Bundle;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_11} :catch_12

    goto :goto_13

    :catch_12
    move-exception v0

    :cond_13
    :goto_13
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    if-eqz v0, :cond_22

    iget-boolean v0, p0, Le/e/a/MiniSession225$Session;->directEntry:Z

    if-eqz v0, :cond_22

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/MiniSession225$Session;->directPrepared:Z

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_22
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    if-eqz v0, :cond_8b

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    if-eqz v0, :cond_8b

    iget-object v0, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_33

    goto :goto_8b

    :cond_33
    :try_start_33
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    const-string v2, "isPlaying"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->shownPlaying:Ljava/lang/Boolean;

    if-eqz v1, :cond_53

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->shownPlaying:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-ne v1, v0, :cond_53

    return-void

    :cond_53
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Le/e/a/MiniSession225$Session;->shownPlaying:Ljava/lang/Boolean;

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    if-eqz v0, :cond_60

    const-string v2, "\u2161"

    goto :goto_62

    :cond_60
    const-string v2, "\u25b6"

    :goto_62
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    if-eqz v0, :cond_6e

    const-string v3, "\u4e00\u6642\u505c\u6b62"

    goto :goto_70

    :cond_6e
    const-string v3, "\u518d\u751f"

    :goto_70
    if-eqz v0, :cond_75

    const-string v4, "Pause"

    goto :goto_77

    :cond_75
    const-string v4, "Play"

    :goto_77
    if-eqz v0, :cond_7c

    const-string v0, "\u66ab\u505c"

    goto :goto_7e

    :cond_7c
    const-string v0, "\u64ad\u653e"

    :goto_7e
    invoke-static {v2, v3, v4, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_85} :catch_86

    goto :goto_8b

    :catch_86
    move-exception v0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/MiniSession225$Session;->close(Z)V

    :cond_8b
    :goto_8b
    return-void
.end method
