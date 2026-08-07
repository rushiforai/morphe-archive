.class public Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;
.super Ll/opg;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->getPlayListenerToAudioPlayer()Ll/npg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/opg;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/opg;->a(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/opg;->i(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p1, v0}, Ll/nam;->f(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/opg;->j(F)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 5
    .line 6
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr p1, v0

    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/opg;->onComplete()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->l0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->o0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->q0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/opg;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->t0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->a1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->u0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-super {p0}, Ll/opg;->onStart()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->s0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$a;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->d1()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
