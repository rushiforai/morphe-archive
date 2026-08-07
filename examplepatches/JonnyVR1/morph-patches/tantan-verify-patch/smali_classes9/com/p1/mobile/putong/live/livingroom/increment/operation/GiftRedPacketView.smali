.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;
.super Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView<",
        "Ll/mxj;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VDraweeView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/TextView;

.field public p:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x7d0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->p:J

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x7d0

    .line 10
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->p:J

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->v0(Ll/bnl0$g;)V

    return-void
.end method

.method private synthetic v0(Ll/bnl0$g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->k0(Ll/bnl0$g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/PreOperationAnimView;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v1, 0x43830000    # 262.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0x43958000    # 299.0f

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic n0(Ll/dum;)Ll/i6t;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->w0(Ll/dum;)Ll/mxj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o0(Ll/q260;)V
    .locals 4

    .line 1
    const-string v0, "context_single_room"

    .line 2
    .line 3
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->o0(Ll/q260;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketAnimationMsg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketAnimationMsg;

    .line 19
    .line 20
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketAnimationMsg;->showMillisecond:I

    .line 21
    .line 22
    int-to-long v1, v1

    .line 23
    iput-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->p:J

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketAnimationMsg;->sender:Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketSender;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketAnimationMsg;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->i:Lv/VDraweeView;

    .line 30
    .line 31
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketSender;->avatarUrl:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->j:Landroid/widget/TextView;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketSender;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->k:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    :try_start_1
    invoke-static {v2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 v1, 0x1

    .line 59
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->l:Lv/VDraweeView;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;->url:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;->name:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, " x"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;->num:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->m:Landroid/widget/TextView;

    .line 94
    .line 95
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->o:Landroid/widget/TextView;

    .line 99
    .line 100
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLotteryGiftRedPacketGift;->amount:I

    .line 101
    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ll/u8n;->a()Z

    .line 110
    .line 111
    .line 112
    move-result p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 113
    const-string v0, "context_livingAct"

    .line 114
    .line 115
    if-eqz p1, :cond_1

    .line 116
    .line 117
    :try_start_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->g:Lv/VDraweeView;

    .line 118
    .line 119
    sget-object v1, Ll/zft;->K:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v0, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->n:Landroid/view/View;

    .line 125
    .line 126
    sget p1, Ll/obc0;->K1:I

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->n:Landroid/view/View;

    .line 133
    .line 134
    sget v1, Ll/obc0;->a6:I

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->g:Lv/VDraweeView;

    .line 140
    .line 141
    sget-object p1, Ll/zft;->x:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :catch_0
    move-exception p0

    .line 148
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->t0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q0(Ll/bnl0$g;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->q0(Ll/bnl0$g;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/nxj;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/nxj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Ll/bnl0$g;)V

    .line 11
    .line 12
    .line 13
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;->p:J

    .line 14
    .line 15
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oxj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oxj;->b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w0(Ll/dum;)Ll/mxj;
    .locals 1

    .line 1
    new-instance v0, Ll/mxj;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/mxj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/GiftRedPacketView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
