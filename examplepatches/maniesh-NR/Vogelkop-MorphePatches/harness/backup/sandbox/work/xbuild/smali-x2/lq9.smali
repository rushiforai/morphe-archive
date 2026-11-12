.class public final Llq9;
.super Lrtn;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Lcom/opera/android/FullscreenWebActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/FullscreenWebActivity;Lcom/opera/android/browser/WebContentsWrapper;B)V
    .registers 4

    iput-byte p3, p0, Llq9;->c:B

    packed-switch p3, :pswitch_data_28

    iput-object p1, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    invoke-direct {p0, p2}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    return-void

    :pswitch_b
    iput-object p1, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    invoke-direct {p0, p2}, Lrtn;-><init>(Lcom/opera/android/browser/WebContentsWrapper;)V

    iget-object p0, p1, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->d0()F

    move-result p1

    const/high16 p2, 0x42c80000    # 100.0f

    mul-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    const-wide/16 p2, 0x0

    invoke-virtual {p0, p1, p2, p3}, Lshf;->G(IJ)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_b
    .end packed-switch
.end method


# virtual methods
.method public final didStartLoading(Lorg/chromium/url/GURL;)V
    .registers 4

    iget-byte p1, p0, Llq9;->c:B

    packed-switch p1, :pswitch_data_12

    return-void

    :pswitch_6
    iget-object p0, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    const/4 p1, 0x0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lshf;->G(IJ)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final didStopLoading(Lorg/chromium/url/GURL;Z)V
    .registers 3

    iget-byte p1, p0, Llq9;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lshf;->r(Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final loadProgressChanged(F)V
    .registers 4

    iget-byte v0, p0, Llq9;->c:B

    packed-switch v0, :pswitch_data_2e

    return-void

    :pswitch_6
    iget-object p0, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p0}, Lshf;->Q()V

    iget-object p0, p0, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Ln4h;

    iget v0, p0, Ln4h;->a:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_20

    iput p1, p0, Ln4h;->b:I

    goto :goto_2c

    :cond_20
    iget-object p0, p0, Ln4h;->c:Lshf;

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/ToolbarProgressBar;->setProgress(I)V

    :goto_2c
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final primaryMainFrameRenderProcessGone(I)V
    .registers 2

    iget-byte p1, p0, Llq9;->c:B

    packed-switch p1, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->C:Lshf;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lshf;->r(Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final virtualKeyboardModeChanged(I)V
    .registers 3

    iget-byte v0, p0, Llq9;->c:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    sget-object v0, Lcom/opera/android/FullscreenWebActivity;->I:Ljava/util/HashSet;

    iget-object p0, p0, Llq9;->d:Lcom/opera/android/FullscreenWebActivity;

    invoke-virtual {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->y0(I)V

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
