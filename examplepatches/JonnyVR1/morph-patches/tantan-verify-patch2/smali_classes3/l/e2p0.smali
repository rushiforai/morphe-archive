.class public Ll/e2p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/rzo0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

.field public q:Landroid/view/View;

.field public r:Lv/VText;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

.field public v:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/rzo0;Ll/rq2;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->za:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic F(Ll/e2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2p0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/e2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2p0;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/e2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2p0;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/e2p0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e2p0;->T(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic J(Ll/e2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2p0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/e2p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2p0;->O(Landroid/view/View;)V

    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Ll/rzo0;->Z3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, v1}, Ll/rzo0;->Z3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/rzo0;->c4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/rzo0;->c4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/rzo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/rzo0;->c4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private W()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/e2p0;->N()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 5
    .line 6
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-wide/16 v2, 0x1

    .line 11
    .line 12
    invoke-static {v2, v3, v0, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/y1p0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/y1p0;-><init>(Ll/e2p0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/e2p0;->v:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method private X(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e2p0;->t:Lv/VText;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bg:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/rzo0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f2p0;->a(Ll/e2p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(Ll/rzo0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final N()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2p0;->v:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic T(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1e

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e2p0;->N()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 15
    .line 16
    check-cast p1, Ll/rzo0;

    .line 17
    .line 18
    iget-object v0, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p1, v0, v1}, Ll/rzo0;->Z3(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    sub-long/2addr v2, v0

    .line 33
    long-to-int p1, v2

    .line 34
    invoke-direct {p0, p1}, Ll/e2p0;->X(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final U(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/e2p0;->l:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "context_single_room"

    .line 18
    .line 19
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/e2p0;->m:Lv/VText;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->rg:I

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v1, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Ll/e2p0;->o:Lv/VText;

    .line 48
    .line 49
    invoke-static {}, Ll/u8n;->a()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->fg:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->eg:I

    .line 59
    .line 60
    :goto_0
    invoke-static {v1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_3

    .line 76
    .line 77
    new-instance p2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v0, "LV."

    .line 80
    .line 81
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseRank()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseName()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget-object v1, p0, Ll/e2p0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getHouseImage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getUserAvatar()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;->getOtherUserAvatar()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    const/4 v2, 0x0

    .line 117
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_3
    const/16 p1, 0x1e

    .line 121
    .line 122
    invoke-direct {p0, p1}, Ll/e2p0;->X(I)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public V(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->ub()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iput-object p1, p0, Ll/e2p0;->u:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/e2p0;->U(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceCpBindMessage;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/e2p0;->W()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2p0;->M(Ll/rzo0;)V

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

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/e2p0;->L(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/e2p0;->r:Lv/VText;

    .line 8
    .line 9
    new-instance v0, Ll/z1p0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/z1p0;-><init>(Ll/e2p0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/e2p0;->s:Lv/VText;

    .line 18
    .line 19
    new-instance v0, Ll/a2p0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/a2p0;-><init>(Ll/e2p0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/e2p0;->l:Lv/VDraweeView;

    .line 28
    .line 29
    new-instance v0, Ll/b2p0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/b2p0;-><init>(Ll/e2p0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/e2p0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->e:Lv/VDraweeView;

    .line 40
    .line 41
    new-instance v0, Ll/c2p0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/c2p0;-><init>(Ll/e2p0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/e2p0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->g:Lv/VDraweeView;

    .line 52
    .line 53
    new-instance v0, Ll/d2p0;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/d2p0;-><init>(Ll/e2p0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rzo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2p0;->M(Ll/rzo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/e2p0;->N()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
