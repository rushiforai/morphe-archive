.class public Ll/ziu;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Ll/ziu;",
        ">;",
        "Ll/iam<",
        "Ll/ziu;",
        ">;"
    }
.end annotation


# instance fields
.field public f:I

.field public g:Ljava/lang/String;

.field public h:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x2

    .line 5
    iput p1, p0, Ll/ziu;->f:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic R2(Ll/ziu;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ziu;->Y2(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic S2(Ll/ziu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ziu;->X2(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic T2(Ll/ziu;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ziu;->V2(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic X2(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/ziu;->f:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/ziu;->f:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Ll/ziu;->Z2(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget p1, p0, Ll/ziu;->f:I

    .line 19
    .line 20
    int-to-long v2, p1

    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/ziu;->Z2(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/wiu;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/wiu;-><init>(Ll/ziu;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/xnu;->R(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public U2(Ll/ziu;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final V2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/yuk0;->g:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 15
    .line 16
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 17
    .line 18
    const v1, 0xa03d

    .line 19
    .line 20
    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    const p0, 0xa0f4

    .line 24
    .line 25
    .line 26
    if-eq v0, p0, :cond_1

    .line 27
    .line 28
    const p0, 0xa16b

    .line 29
    .line 30
    .line 31
    if-eq v0, p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const-string p0, "\u9001\u793c\u8d26\u53f7\u9694\u79bb~~~~~~~~~~~~~"

    .line 41
    .line 42
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget p1, p0, Ll/ziu;->f:I

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 p1, 0x1

    .line 55
    iput-boolean p1, p0, Ll/xnu;->e:Z

    .line 56
    .line 57
    :cond_3
    :goto_0
    return-void
.end method

.method public final W2(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->untilSec:I

    .line 4
    .line 5
    iput v0, p0, Ll/ziu;->f:I

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/b;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->payType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->a:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "randomCoupon"

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 27
    .line 28
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->untilSec:I

    .line 29
    .line 30
    int-to-long v1, v1

    .line 31
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->b:J

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->b:J

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->i()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->h()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic Y2(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ziu;->W2(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Z2(I)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateSendGift nextReqSec:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/ziu;->f:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "videoChat"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Ll/ziu;->g:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget v0, p0, Ll/ziu;->h:I

    .line 39
    .line 40
    if-gt p1, v0, :cond_0

    .line 41
    .line 42
    const-string p0, "updateSendGift \u91cd\u590d\u8c03\u7528"

    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/ziu;->g:Ljava/lang/String;

    .line 57
    .line 58
    iput p1, p0, Ll/ziu;->h:I

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/xnu;->v()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/xnu;->s()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/xnu;->o()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 111
    .line 112
    move v4, p1

    .line 113
    invoke-static/range {v1 .. v7}, Ll/jwu;->a0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const/4 v0, 0x0

    .line 118
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    new-instance v0, Ll/xiu;

    .line 123
    .line 124
    invoke-direct {v0, p0}, Ll/xiu;-><init>(Ll/ziu;)V

    .line 125
    .line 126
    .line 127
    new-instance v1, Ll/yiu;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/yiu;-><init>(Ll/ziu;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ziu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ziu;->U2(Ll/ziu;)V

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
