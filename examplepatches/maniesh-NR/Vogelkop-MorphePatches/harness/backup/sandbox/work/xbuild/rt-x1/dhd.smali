.class public final Ldhd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lorg/chromium/third_party/android/media/MediaController;


# direct methods
.method public synthetic constructor <init>(Lorg/chromium/third_party/android/media/MediaController;B)V
    .registers 3

    iput-byte p2, p0, Ldhd;->a:B

    iput-object p1, p0, Ldhd;->b:Lorg/chromium/third_party/android/media/MediaController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Ldhd;->a:B

    iget-object p0, p0, Ldhd;->b:Lorg/chromium/third_party/android/media/MediaController;

    packed-switch p1, :pswitch_data_7a

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz p1, :cond_1a

    invoke-virtual {p1}, Lwth;->H()J

    move-result-wide v0

    const-wide/16 v2, 0x3a98

    add-long/2addr v0, v2

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    invoke-virtual {p1, v0, v1}, Lwth;->O(J)V

    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    :cond_1a
    return-void

    :pswitch_1b
    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Lwth;->H()J

    move-result-wide v0

    const-wide/16 v2, 0x1388

    sub-long/2addr v0, v2

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    invoke-virtual {p1, v0, v1}, Lwth;->O(J)V

    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    :cond_2e
    return-void

    :pswitch_2f
    sget p1, Lorg/chromium/third_party/android/media/MediaController;->o:I

    iget-object p1, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz p1, :cond_79

    iget-object p1, p1, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v0, p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-nez v0, :cond_43

    const/4 p1, 0x0

    goto :goto_4b

    :cond_43
    invoke-virtual {p1}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->isPlaying()Z

    move-result p1

    :goto_4b
    iget-object v0, p0, Lorg/chromium/third_party/android/media/MediaController;->a:Lwth;

    if-eqz p1, :cond_63

    iget-object p1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v0, p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-eqz v0, :cond_76

    invoke-virtual {p1}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->pause()Lcom/google/android/gms/common/api/PendingResult;

    goto :goto_76

    :cond_63
    iget-object p1, v0, Lwth;->b:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v0, p1, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-eqz v0, :cond_76

    invoke-virtual {p1}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->play()Lcom/google/android/gms/common/api/PendingResult;

    :cond_76
    :goto_76
    invoke-virtual {p0}, Lorg/chromium/third_party/android/media/MediaController;->c()V

    :cond_79
    return-void

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_1b
    .end packed-switch
.end method
