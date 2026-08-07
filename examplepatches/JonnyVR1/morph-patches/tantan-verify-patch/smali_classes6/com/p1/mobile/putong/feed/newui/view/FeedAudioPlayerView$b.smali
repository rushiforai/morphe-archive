.class public Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->f()V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->p0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p2, Ll/tpg;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/tpg;-><init>(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v0, 0x12c

    .line 13
    .line 14
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->isHighLevelBusiness()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->r0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic f()V
    .locals 2

    .line 1
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->n0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/lpg;->e0(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->m0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/lpg;->j0()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public success()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView$b;->a:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->r0(Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
