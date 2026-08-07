.class public Ll/wvk0;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;ZLcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;Ll/xnu;)V
    .locals 2

    .line 1
    new-instance v0, Ll/knu;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1, p1, p3, p5}, Ll/knu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;ZLl/xnu;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Ll/ahu;-><init>(Ll/knu;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 15
    .line 16
    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p4}, Ll/xnu;->Y(Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p4, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p3, p4, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 35
    .line 36
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, p3}, Ll/xnu;->X(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p3, p4, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 46
    .line 47
    const/4 p4, 0x0

    .line 48
    invoke-virtual {p1, p3, p4}, Ll/xnu;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    if-eqz p4, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-boolean p3, p4, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isFromWindow:Z

    .line 59
    .line 60
    iput-boolean p3, p1, Ll/xnu;->n:Z

    .line 61
    .line 62
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p0, p1, p2}, Ll/nsu;->a(Ll/wvk0;Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public R2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-boolean p0, p0, Ll/xnu;->m:Z

    .line 13
    .line 14
    xor-int/lit8 p0, p0, 0x1

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/xnu;->m(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
