.class public Ll/d55;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/CircularProgressView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/d55;->a()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->setProgress(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/d55;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/d55;->doFrame(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public doFrame(J)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/d55;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 2
    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    iget-object p2, p0, Ll/d55;->a:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->getCurrentProgress()F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 p2, 0x0

    .line 23
    cmpl-float p2, p1, p2

    .line 24
    .line 25
    if-lez p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/d55;->c(F)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/d55;->a()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    invoke-virtual {p0}, Ll/d55;->a()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/d55;->a()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public e(Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/l6o0;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/d55;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
