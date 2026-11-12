.class public final Lehd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/KeyEvent$Callback;


# direct methods
.method public synthetic constructor <init>(Landroid/view/KeyEvent$Callback;B)V
    .registers 3

    iput-byte p2, p0, Lehd;->a:B

    iput-object p1, p0, Lehd;->b:Landroid/view/KeyEvent$Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    iget-byte v0, p0, Lehd;->a:B

    iget-object p0, p0, Lehd;->b:Landroid/view/KeyEvent$Callback;

    packed-switch v0, :pswitch_data_60

    if-eqz p3, :cond_28

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcod;

    check-cast p0, Lond;

    iget-object p0, p0, Lond;->w:Ljava/util/HashMap;

    iget-object p3, p1, Lcod;->c:Ljava/lang/String;

    invoke-virtual {p0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/mediarouter/app/e;

    if-eqz p0, :cond_25

    if-nez p2, :cond_21

    const/4 p3, 0x1

    goto :goto_22

    :cond_21
    const/4 p3, 0x0

    :goto_22
    invoke-virtual {p0, p3}, Landroidx/mediarouter/app/e;->V(Z)V

    :cond_25
    invoke-virtual {p1, p2}, Lcod;->j(I)V

    :cond_28
    return-void

    :pswitch_29
    check-cast p0, Lorg/chromium/third_party/android/media/MediaController;

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz p1, :cond_5e

    if-eqz p3, :cond_5e

    iget-object p1, p1, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object p3, p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {p3}, Lc93;->g()Z

    move-result p3

    if-nez p3, :cond_40

    const-wide/16 v0, 0x0

    goto :goto_48

    :cond_40
    iget-object p1, p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object p1, p1, Lbuh;->f:Lm89;

    iget-object p1, p1, Lm89;->a:Lcgk;

    iget-wide v0, p1, Lcgk;->a:J

    :goto_48
    int-to-long p1, p2

    mul-long/2addr v0, p1

    const-wide/16 p1, 0x3e8

    div-long/2addr v0, p1

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    invoke-virtual {p1, v0, v1}, Lwth;->O(J)V

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->f:Landroid/widget/TextView;

    if-eqz p1, :cond_5e

    long-to-int p2, v0

    invoke-virtual {p0, p2}, Lorg/chromium/third_party/android/media/MediaController;->a(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    iget-byte v0, p0, Lehd;->a:B

    iget-object p0, p0, Lehd;->b:Landroid/view/KeyEvent$Callback;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lond;

    iget-object v0, p0, Lond;->x:Lcod;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lond;->s:Lue2;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_13
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcod;

    iput-object p1, p0, Lond;->x:Lcod;

    return-void

    :pswitch_1c
    check-cast p0, Lorg/chromium/third_party/android/media/MediaController;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/chromium/third_party/android/media/MediaController;->g:Z

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    iget-byte p1, p0, Lehd;->a:B

    iget-object p0, p0, Lehd;->b:Landroid/view/KeyEvent$Callback;

    packed-switch p1, :pswitch_data_1e

    check-cast p0, Lond;

    iget-object p0, p0, Lond;->s:Lue2;

    const/4 p1, 0x2

    const-wide/16 v0, 0x1f4

    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    :pswitch_12
    check-cast p0, Lorg/chromium/third_party/android/media/MediaController;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/chromium/third_party/android/media/MediaController;->g:Z

    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->c()V

    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
