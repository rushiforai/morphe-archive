.class final Le/e/a/DirectBackground235$State;
.super Ljava/lang/Object;
.source "DirectBackground235.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectBackground235;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation


# instance fields
.field animation:Landroid/animation/ValueAnimator;

.field body:Landroid/view/View;

.field chrome:Le/e/a/MiniChrome236;

.field closing:Z

.field content:Landroid/widget/FrameLayout;

.field controlsVisibility:I

.field final discover:Ljava/lang/Runnable;

.field downTime:J

.field downX:F

.field downY:F

.field dragging:Z

.field foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field height:I

.field host:Landroid/app/Activity;

.field index:I

.field info:Landroid/os/Bundle;

.field keeper:Le/e/a/MiniSession225$SurfaceKeeper;

.field metadataAt:J

.field motion:Le/e/a/MiniState225;

.field multi:Z

.field nativeControls:Landroid/view/View;

.field original:Landroid/view/ViewGroup;

.field padding:I

.field panel:Landroid/widget/FrameLayout;

.field params:Landroid/view/ViewGroup$LayoutParams;

.field play:Landroid/widget/Button;

.field final resized:Landroid/view/View$OnLayoutChangeListener;

.field restarting:Z

.field restoring:Z

.field service:Landroid/app/Service;

.field shade:Landroid/view/View;

.field startFraction:F

.field texture:Landroid/view/TextureView;

.field final tick:Ljava/lang/Runnable;

.field final timeout:Ljava/lang/Runnable;

.field title:Ljava/lang/String;

.field final token:J

.field velocity:Landroid/view/VelocityTracker;

.field video:Landroid/view/View;

.field viewport:Le/e/a/MiniViewport237;

.field wantsExpand:Z


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .registers 6

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    new-instance v0, Le/e/a/MiniState225;

    invoke-direct {v0}, Le/e/a/MiniState225;-><init>()V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    .line 28
    new-instance v0, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda6;-><init>(Le/e/a/DirectBackground235$State;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    .line 29
    new-instance v0, Le/e/a/DirectBackground235$State$1;

    invoke-direct {v0, p0}, Le/e/a/DirectBackground235$State$1;-><init>(Le/e/a/DirectBackground235$State;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->discover:Ljava/lang/Runnable;

    .line 30
    new-instance v0, Le/e/a/DirectBackground235$State$2;

    invoke-direct {v0, p0}, Le/e/a/DirectBackground235$State$2;-><init>(Le/e/a/DirectBackground235$State;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->tick:Ljava/lang/Runnable;

    .line 31
    new-instance v0, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda7;-><init>(Le/e/a/DirectBackground235$State;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->resized:Landroid/view/View$OnLayoutChangeListener;

    .line 32
    iput-wide p1, p0, Le/e/a/DirectBackground235$State;->token:J

    if-nez p3, :cond_34

    const-string p3, ""

    :cond_34
    iput-object p3, p0, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method apply(F)V
    .registers 7

    .line 45
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_a2

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    if-nez v0, :cond_a

    goto/16 :goto_a2

    :cond_a
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, v0, Le/e/a/MiniState225;->fraction:F

    iget p1, p0, Le/e/a/DirectBackground235$State;->height:I

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41100000    # 9.0f

    mul-float/2addr v0, v1

    const/high16 v1, 0x41800000    # 16.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v0, p0, Le/e/a/DirectBackground235$State;->height:I

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    div-int/lit8 v1, v1, 0x3

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Le/e/a/DirectBackground235$State;->height:I

    int-to-float v1, v1

    iget v3, p0, Le/e/a/DirectBackground235$State;->height:I

    sub-int/2addr p1, v3

    int-to-float p1, p1

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v3, v3, Le/e/a/MiniState225;->fraction:F

    mul-float/2addr p1, v3

    add-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    iget v3, p0, Le/e/a/DirectBackground235$State;->height:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v3, v3, Le/e/a/MiniState225;->fraction:F

    sub-float v3, v2, v3

    mul-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    const/16 v4, 0x30

    if-ne v3, p1, :cond_80

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-ne v3, v1, :cond_80

    iget v3, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v3, v4, :cond_8b

    :cond_80
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v4, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_8b
    iget-object p1, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object p1, p1, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    sub-float v0, v2, v0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setAlpha(F)V

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    sub-float/2addr v2, v0

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_a2
    :goto_a2
    return-void
.end method

.method attach(Landroid/app/Activity;)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-ne p1, v0, :cond_10

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_10

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_15b

    :cond_10
    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_15b

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_15b

    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-eqz v0, :cond_22

    goto/16 :goto_15b

    :cond_22
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-static {p1}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_2c

    return-void

    :cond_2c
    iput-object p1, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    const v0, 0x1020002

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_153

    const/16 v0, 0x40

    invoke-static {p1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Le/e/a/DirectBackground235$State;->height:I

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_50

    const/4 v0, 0x0

    goto :goto_56

    :cond_50
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :goto_56
    iput-object v0, p0, Le/e/a/DirectBackground235$State;->body:Landroid/view/View;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->body:Landroid/view/View;

    if-nez v0, :cond_5d

    goto :goto_63

    :cond_5d
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->body:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    :goto_63
    iput v1, p0, Le/e/a/DirectBackground235$State;->padding:I

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    const-string v1, "nicoid-retained-mini-player"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 37
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const/4 v2, -0x1

    if-eqz v0, :cond_bf

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_a2

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_a2
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->hideControls()V

    new-instance v0, Le/e/a/MiniViewport237;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-direct {v0, p1, v3}, Le/e/a/MiniViewport237;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 38
    :cond_bf
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    const/high16 v3, -0x67000000

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v10, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda1;

    invoke-direct {v10, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda1;-><init>(Le/e/a/DirectBackground235$State;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    invoke-virtual {v0, v10}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 39
    new-instance v0, Le/e/a/MiniChrome236;

    iget-object v7, p0, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    new-instance v11, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda2;

    invoke-direct {v11, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda2;-><init>(Le/e/a/DirectBackground235$State;)V

    new-instance v12, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda3;

    invoke-direct {v12, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda3;-><init>(Le/e/a/DirectBackground235$State;)V

    new-instance v13, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda4;

    invoke-direct {v13, p0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda4;-><init>(Le/e/a/DirectBackground235$State;)V

    const-string v8, ""

    const/4 v9, 0x0

    move-object v5, v0

    move-object v6, p1

    invoke-direct/range {v5 .. v13}, Le/e/a/MiniChrome236;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/view/View$OnTouchListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object v0, v0, Le/e/a/MiniChrome236;->play:Landroid/widget/Button;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object v3, v3, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    iget v5, p0, Le/e/a/DirectBackground235$State;->height:I

    const/16 v6, 0x50

    invoke-direct {v4, v2, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    iget v5, p0, Le/e/a/DirectBackground235$State;->height:I

    invoke-direct {v4, v2, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le/e/a/DirectBackground235$State;->resized:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v2, p0, Le/e/a/DirectBackground235$State;->body:Landroid/view/View;

    iget v3, p0, Le/e/a/DirectBackground235$State;->height:I

    invoke-static {p1, v0, v2, v3, p0}, Le/e/a/PlaybackPanels113;->claim(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;ILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Le/e/a/DirectBackground235$State;->apply(F)V

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz p1, :cond_14d

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    if-eqz p1, :cond_14d

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    new-instance v1, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda5;-><init>(Le/e/a/DirectBackground235$State;Landroid/widget/FrameLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    :cond_14d
    iget-object p1, p0, Le/e/a/DirectBackground235$State;->tick:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 40
    return-void

    .line 36
    :cond_153
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "No content host"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_15b
    :goto_15b
    return-void
.end method

.method cancelAnimation()V
    .registers 2

    .line 48
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_11

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllListeners()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    :cond_11
    return-void
.end method

.method close(Z)V
    .registers 4

    .line 53
    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->closing:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/DirectBackground235$State;->closing:Z

    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-ne v0, p0, :cond_f

    const/4 v0, 0x0

    sput-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    :cond_f
    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->discover:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->detach()V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->restoreControls()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->close()V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->returnVideo()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz v0, :cond_34

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    invoke-virtual {v0}, Le/e/a/MiniSession225$SurfaceKeeper;->close()V

    :cond_34
    if-eqz p1, :cond_3f

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz p1, :cond_3f

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-virtual {p1}, Landroid/app/Service;->stopSelf()V

    :cond_3f
    return-void
.end method

.method detach()V
    .registers 3

    .line 50
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->cancelAnimation()V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->recycle()V

    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_18

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->resized:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_18
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v0, :cond_35

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    if-eqz v0, :cond_35

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    if-ne v0, v1, :cond_35

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0, v1}, Le/e/a/MiniViewport237;->removeView(Landroid/view/View;)V

    :cond_35
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_4c
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-static {v0, v1}, Le/e/a/PlaybackPanels113;->release(Landroid/app/Activity;Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->viewport:Le/e/a/MiniViewport237;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->body:Landroid/view/View;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->shade:Landroid/view/View;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    return-void
.end method

.method expand()V
    .registers 4

    .line 51
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v0, :cond_36

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz v0, :cond_36

    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-eqz v0, :cond_d

    goto :goto_36

    :cond_d
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    const-string v1, "Direct mini requested normal playback"

    const-string v2, "nicoid-mini"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v1}, Le/e/a/PopupReturn244;->start(Landroid/app/Service;)Z

    move-result v1

    if-nez v1, :cond_33

    iput-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/DirectBackground235$State;->apply(F)V

    const-string v0, "Direct playback transfer did not start"

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_33
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->detach()V

    :cond_36
    :goto_36
    return-void
.end method

.method hideControls()V
    .registers 3

    .line 41
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-nez v0, :cond_5

    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const-string v1, "videoControls"

    invoke-static {v0, v1}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_24

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    if-eq v0, v1, :cond_24

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->restoreControls()V

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    iput v0, p0, Le/e/a/DirectBackground235$State;->controlsVisibility:I

    :cond_24
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    if-eqz v0, :cond_31

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_2f} :catch_30

    goto :goto_31

    :catch_30
    move-exception v0

    :cond_31
    :goto_31
    return-void
.end method

.method synthetic lambda$0$e-e-a-DirectBackground235$State()V
    .registers 3

    .line 28
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-ne v0, p0, :cond_15

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result v0

    if-nez v0, :cond_15

    const-string v0, "nicoid-mini"

    const-string v1, "Direct playback preparation timed out"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/DirectBackground235$State;->close(Z)V

    :cond_15
    return-void
.end method

.method synthetic lambda$1$e-e-a-DirectBackground235$State(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 31
    sub-int/2addr p4, p2

    sub-int/2addr p8, p6

    if-ne p4, p8, :cond_8

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_f

    :cond_8
    iget-object p1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget p1, p1, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->apply(F)V

    :cond_f
    return-void
.end method

.method synthetic lambda$2$e-e-a-DirectBackground235$State(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 3

    .line 38
    invoke-virtual {p0, p2}, Le/e/a/DirectBackground235$State;->touch(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method synthetic lambda$3$e-e-a-DirectBackground235$State(Landroid/view/View;)V
    .registers 2

    .line 39
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->toggle()V

    return-void
.end method

.method synthetic lambda$4$e-e-a-DirectBackground235$State(Landroid/view/View;)V
    .registers 2

    .line 39
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->close(Z)V

    return-void
.end method

.method synthetic lambda$5$e-e-a-DirectBackground235$State(Landroid/view/View;)V
    .registers 2

    .line 39
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->settle(Z)V

    return-void
.end method

.method synthetic lambda$6$e-e-a-DirectBackground235$State(Landroid/widget/FrameLayout;)V
    .registers 3

    .line 39
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-ne v0, p0, :cond_1b

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-ne v0, p1, :cond_1b

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    if-eqz p1, :cond_14

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->keeper:Le/e/a/MiniSession225$SurfaceKeeper;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {p1, v0}, Le/e/a/MiniSession225$SurfaceKeeper;->output(Landroid/view/View;)V

    goto :goto_1b

    :cond_14
    iget-object p1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->texture:Landroid/view/TextureView;

    invoke-static {p1, v0}, Le/e/a/VideoOutput227;->bind(Landroid/view/View;Landroid/view/TextureView;)V

    :cond_1b
    :goto_1b
    return-void
.end method

.method synthetic lambda$7$e-e-a-DirectBackground235$State(ILandroid/animation/ValueAnimator;)V
    .registers 4

    .line 49
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-ne v0, p0, :cond_19

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0, p1}, Le/e/a/MiniState225;->current(I)Z

    move-result p1

    if-eqz p1, :cond_19

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->apply(F)V

    :cond_19
    return-void
.end method

.method poll()V
    .registers 3

    .line 34
    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->discover:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object v0, Le/e/a/DirectBackground235;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->discover:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method ready()Z
    .registers 6

    .line 33
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const-string v2, "getDuration"

    new-array v3, v0, [Ljava/lang/Class;

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {v1, v2, v3, v4}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_17} :catch_1f

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_1e

    const/4 v0, 0x1

    :cond_1e
    return v0

    :catch_1f
    move-exception v1

    return v0
.end method

.method recycle()V
    .registers 2

    .line 47
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    :cond_c
    return-void
.end method

.method refresh()V
    .registers 7

    .line 35
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz v2, :cond_39

    iget-wide v2, p0, Le/e/a/DirectBackground235$State;->metadataAt:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_39

    const-wide/16 v2, 0x7d0

    add-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/DirectBackground235$State;->metadataAt:J

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1d

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->info:Landroid/os/Bundle;

    :cond_1d
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    const-string v1, "M"

    invoke-static {v0, v1}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_39

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    :cond_39
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    if-eqz v0, :cond_52

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->info:Landroid/os/Bundle;

    if-nez v0, :cond_4b

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->title:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Le/e/a/MiniChrome236;->text(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_52

    :cond_4b
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->chrome:Le/e/a/MiniChrome236;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->info:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Le/e/a/MiniChrome236;->metadata(Landroid/os/Bundle;)V

    :cond_52
    :goto_52
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    if-eqz v0, :cond_93

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_70

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v2, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    const-string v3, "isPlaying"

    new-array v4, v1, [Ljava/lang/Class;

    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v2, v3, v4, v5}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    const/4 v1, 0x1

    :cond_70
    if-eqz v1, :cond_75

    const-string v0, "\u2161"

    goto :goto_77

    :cond_75
    const-string v0, "\u25b6"

    :goto_77
    iget-object v1, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    invoke-virtual {v1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_88

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_88
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V
    :try_end_91
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_91} :catch_92

    goto :goto_93

    :catch_92
    move-exception v0

    :cond_93
    :goto_93
    return-void
.end method

.method restoreControls()V
    .registers 3

    .line 42
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    if-eqz v0, :cond_b

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    iget v1, p0, Le/e/a/DirectBackground235$State;->controlsVisibility:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_b
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->nativeControls:Landroid/view/View;

    return-void
.end method

.method returnVideo()V
    .registers 5

    .line 52
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eqz v0, :cond_25

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    if-eqz v0, :cond_25

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_25

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    iget v2, p0, Le/e/a/DirectBackground235$State;->index:I

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->original:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_25
    return-void
.end method

.method settle(Z)V
    .registers 7

    .line 49
    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->closing:Z

    if-nez v0, :cond_5e

    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-nez v0, :cond_5e

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-nez v0, :cond_d

    goto :goto_5e

    :cond_d
    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->cancelAnimation()V

    iput-boolean p1, p0, Le/e/a/DirectBackground235$State;->wantsExpand:Z

    if-eqz p1, :cond_24

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->ready()Z

    move-result v0

    if-nez v0, :cond_24

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {p1}, Le/e/a/MiniState225;->cancel()I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->apply(F)V

    return-void

    :cond_24
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0, p1}, Le/e/a/MiniState225;->settle(Z)I

    move-result v0

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

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

    iput-object v1, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xdc

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    new-instance v2, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Le/e/a/DirectBackground235$State$$ExternalSyntheticLambda0;-><init>(Le/e/a/DirectBackground235$State;I)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    new-instance v2, Le/e/a/DirectBackground235$State$3;

    invoke-direct {v2, p0, v0, p1}, Le/e/a/DirectBackground235$State$3;-><init>(Le/e/a/DirectBackground235$State;IZ)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->animation:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_5e
    :goto_5e
    return-void
.end method

.method toggle()V
    .registers 7

    .line 43
    const-string v0, "e"

    :try_start_2
    iget-object v1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz v1, :cond_4e

    iget-boolean v1, p0, Le/e/a/DirectBackground235$State;->closing:Z

    if-nez v1, :cond_4e

    iget-boolean v1, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-eqz v1, :cond_f

    goto :goto_4e

    :cond_f
    iget-object v1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v1, v0}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-object v2, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    if-eq v1, v2, :cond_29

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v1}, Le/e/a/DirectBackground235;->prepared(Ljava/lang/Object;)V

    iget-object v1, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    invoke-static {v1, v0}, Le/e/a/DirectBackground235;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/view/View;

    :cond_29
    if-eqz v1, :cond_57

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "isPlaying"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v4, v5}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "pause"

    goto :goto_43

    :cond_41
    const-string v0, "start"

    :goto_43
    new-array v2, v3, [Ljava/lang/Class;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Le/e/a/DirectBackground235;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->refresh()V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4d} :catch_4f

    goto :goto_57

    :cond_4e
    :goto_4e
    return-void

    :catch_4f
    move-exception v0

    const-string v1, "nicoid-mini"

    const-string v2, "Service playback toggle failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_57
    :goto_57
    return-void
.end method

.method touch(Landroid/view/MotionEvent;)Z
    .registers 10

    .line 46
    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->closing:Z

    const/4 v1, 0x1

    if-nez v0, :cond_130

    iget-boolean v0, p0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-nez v0, :cond_130

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    if-nez v0, :cond_f

    goto/16 :goto_130

    :cond_f
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_58

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->cancelAnimation()V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v0, v0, Le/e/a/MiniState225;->fraction:F

    iput v0, p0, Le/e/a/DirectBackground235$State;->startFraction:F

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    invoke-virtual {v0}, Le/e/a/MiniState225;->cancel()I

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v3, p0, Le/e/a/DirectBackground235$State;->startFraction:F

    iput v3, v0, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iput v0, p0, Le/e/a/DirectBackground235$State;->downX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    iput v0, p0, Le/e/a/DirectBackground235$State;->downY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    iput-wide v3, p0, Le/e/a/DirectBackground235$State;->downTime:J

    iput-boolean v2, p0, Le/e/a/DirectBackground235$State;->multi:Z

    iput-boolean v2, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->recycle()V

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->panel:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v1

    :cond_58
    iget-object v3, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    if-eqz v3, :cond_61

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v3, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_61
    const/4 v3, 0x3

    if-eq v0, v3, :cond_128

    const/4 v3, 0x5

    if-eq v0, v3, :cond_128

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-le v3, v1, :cond_6f

    goto/16 :goto_128

    :cond_6f
    iget-boolean v3, p0, Le/e/a/DirectBackground235$State;->multi:Z

    if-eqz v3, :cond_74

    return v1

    :cond_74
    iget v3, p0, Le/e/a/DirectBackground235$State;->downY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Le/e/a/DirectBackground235$State;->downX:F

    sub-float/2addr v4, v5

    const/4 v5, 0x2

    if-ne v0, v5, :cond_c3

    iget-boolean p1, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    if-nez p1, :cond_a6

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    cmpl-float p1, v3, p1

    if-lez p1, :cond_a6

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v0, 0x3fa66666    # 1.3f

    mul-float/2addr p1, v0

    cmpl-float p1, v3, p1

    if-lez p1, :cond_a6

    iput-boolean v1, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    :cond_a6
    iget-boolean p1, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    if-eqz p1, :cond_c2

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget v0, p0, Le/e/a/DirectBackground235$State;->startFraction:F

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->travel()F

    move-result v2

    mul-float/2addr v0, v2

    add-float/2addr v3, v0

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->travel()F

    move-result v0

    invoke-virtual {p1, v3, v0}, Le/e/a/MiniState225;->drag(FF)Z

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget p1, p1, Le/e/a/MiniState225;->fraction:F

    invoke-virtual {p0, p1}, Le/e/a/DirectBackground235$State;->apply(F)V

    :cond_c2
    return v1

    :cond_c3
    if-ne v0, v1, :cond_127

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_d7

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    const/16 v5, 0x3e8

    invoke-virtual {v0, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v0, p0, Le/e/a/DirectBackground235$State;->velocity:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v0

    goto :goto_d8

    :cond_d7
    const/4 v0, 0x0

    :goto_d8
    iget-boolean v5, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    if-nez v5, :cond_103

    float-to-double v4, v4

    float-to-double v6, v3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v3

    iget-object v5, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    invoke-static {v5}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v5

    int-to-double v5, v5

    cmpg-double v3, v3, v5

    if-gez v3, :cond_103

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v3

    iget-wide v5, p0, Le/e/a/DirectBackground235$State;->downTime:J

    sub-long/2addr v3, v5

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p1

    int-to-long v5, p1

    cmp-long p1, v3, v5

    if-gez p1, :cond_103

    move p1, v1

    goto :goto_104

    :cond_103
    move p1, v2

    :goto_104
    if-nez p1, :cond_120

    iget-boolean p1, p0, Le/e/a/DirectBackground235$State;->dragging:Z

    if-eqz p1, :cond_11f

    iget-object p1, p0, Le/e/a/DirectBackground235$State;->motion:Le/e/a/MiniState225;

    iget-object v3, p0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v3

    invoke-virtual {p1, v0}, Le/e/a/MiniState225;->expand(F)Z

    move-result p1

    if-nez p1, :cond_120

    :cond_11f
    goto :goto_121

    :cond_120
    move v2, v1

    :goto_121
    invoke-virtual {p0, v2}, Le/e/a/DirectBackground235$State;->settle(Z)V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->recycle()V

    :cond_127
    return v1

    :cond_128
    :goto_128
    iput-boolean v1, p0, Le/e/a/DirectBackground235$State;->multi:Z

    invoke-virtual {p0, v2}, Le/e/a/DirectBackground235$State;->settle(Z)V

    invoke-virtual {p0}, Le/e/a/DirectBackground235$State;->recycle()V

    :cond_130
    :goto_130
    return v1
.end method

.method travel()F
    .registers 4

    .line 44
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    if-nez v0, :cond_6

    goto :goto_13

    :cond_6
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    iget v2, p0, Le/e/a/DirectBackground235$State;->height:I

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    :goto_13
    int-to-float v0, v1

    return v0
.end method
