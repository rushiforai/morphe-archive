.class public Ll/kwu;
.super Ll/uxr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/uxr<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/lwu;


# direct methods
.method public constructor <init>(Ll/hk4;Ll/lwu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxr;-><init>(Ll/hk4;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/kwu;->a:Ll/lwu;

    .line 5
    .line 6
    return-void
.end method

.method public static O(Ll/hk4;Ll/a4s;)Ll/kwu;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/lwu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kwu;

    .line 6
    .line 7
    check-cast p1, Ll/lwu;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/kwu;-><init>(Ll/hk4;Ll/lwu;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kwu;->a:Ll/lwu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public J(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kwu;->a:Ll/lwu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "index"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/kwu;->a:Ll/lwu;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/lwu;->l()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "anchorId"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_live_video_quickchat_profile_enter"

    .line 38
    .line 39
    const-string v2, "p_live_video_quickchat"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    iget-object p0, p0, Ll/kwu;->a:Ll/lwu;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/lwu;->a()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-static {p1, p0, v0}, Ll/mbs;->m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/kwu;->a:Ll/lwu;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;->e(Ll/lwu;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kwu;->P(Lcom/p1/mobile/putong/live/external/internal/vchat/card/videoChat/LiveVideoChatCardView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
