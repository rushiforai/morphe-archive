.class public Ll/jgu;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/jgu;",
        ">;",
        "Ll/iam<",
        "Ll/jgu;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R2(Ll/jgu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jgu;->U2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method


# virtual methods
.method public S2(Ll/jgu;)V
    .locals 0

    .line 1
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/knu;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->i2(Ll/jgu;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T2(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Ll/jwu;->F(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/igu;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/igu;-><init>(Ll/jgu;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic U2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/xnu;->X(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jgu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jgu;->S2(Ll/jgu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
