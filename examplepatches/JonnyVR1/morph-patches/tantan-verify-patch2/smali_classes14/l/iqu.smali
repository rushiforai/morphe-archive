.class public Ll/iqu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;",
        ">;"
    }
.end annotation


# instance fields
.field public f:J

.field public g:Landroid/view/View;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    iput-object p3, p0, Ll/iqu;->g:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/iqu;->c3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic R2(Ll/iqu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqu;->d3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic S2(Ll/iqu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iqu;->h3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic T2(Ll/iqu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iqu;->i3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U2(Ll/iqu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatBubble;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iqu;->f3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatBubble;)V

    return-void
.end method

.method public static synthetic V2(Ll/iqu;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iqu;->g3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;)V

    return-void
.end method

.method public static synthetic W2(Ll/iqu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqu;->b3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X2(Ll/iqu;Lcom/p1/mobile/putong/live/external/internal/vchat/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iqu;->m3(Lcom/p1/mobile/putong/live/external/internal/vchat/b;)V

    return-void
.end method

.method public static synthetic Y2(Ll/iqu;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iqu;->e3(Ll/vxj0;)V

    return-void
.end method

.method private a3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->q0()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/iqu;->Z2()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private b3(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->s0(ZZ)V

    .line 16
    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Ll/iqu;->j3(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic d3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 4
    .line 5
    const-wide/16 v0, 0xa

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->D0(Ljava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic e3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iqu;->a3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ahu;->M2()Ll/knu;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-boolean v1, v1, Ll/knu;->f:Z

    .line 13
    .line 14
    xor-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->setGiftButtonVisible(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->i()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/aqu;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/aqu;-><init>(Ll/iqu;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->h()Ll/v3f$d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/bqu;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/bqu;-><init>(Ll/iqu;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->b()Ll/v3f$c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/cqu;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/cqu;-><init>(Ll/iqu;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v2, Ll/dqu;

    .line 91
    .line 92
    invoke-direct {v2, p0}, Ll/dqu;-><init>(Ll/iqu;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ll/aj1;->p0()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v2, Ll/equ;

    .line 121
    .line 122
    invoke-direct {v2, p0}, Ll/equ;-><init>(Ll/iqu;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ll/aj1;->q0()Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/fqu;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/fqu;-><init>(Ll/iqu;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v1, Ll/gqu;

    .line 167
    .line 168
    invoke-direct {v1, p0}, Ll/gqu;-><init>(Ll/iqu;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v1}, Ll/xnu;->R(Ll/y20;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public Z2()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/iqu;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final c3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iqu;->g:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/hqu;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/hqu;-><init>(Ll/iqu;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic f3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatBubble;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatBubble;->getText()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatBubble;->getDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    cmp-long p1, v1, v3

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 24
    .line 25
    const-wide/16 v3, 0x3e8

    .line 26
    .line 27
    div-long/2addr v1, v3

    .line 28
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->D0(Ljava/lang/String;J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic g3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;->getChatId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;

    .line 32
    .line 33
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/b;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoChatDuration;->getRemainingDurationSec()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->b:J

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/iqu;->m3(Lcom/p1/mobile/putong/live/external/internal/vchat/b;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final synthetic h3(Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/iqu;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-lez p1, :cond_1

    .line 8
    .line 9
    const-wide/16 v2, 0x1

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    iput-wide v0, p0, Ll/iqu;->f:J

    .line 13
    .line 14
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iget-object v3, p0, Ll/iqu;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v2, v3, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->B0(ZLjava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    iget-wide v0, p0, Ll/iqu;->f:J

    .line 25
    .line 26
    const-wide/16 v2, 0x5

    .line 27
    .line 28
    cmp-long p1, v0, v2

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 41
    .line 42
    const-wide/32 v4, 0xf4240

    .line 43
    .line 44
    .line 45
    div-long/2addr v0, v4

    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v4, "\u968f\u673a\u5339\u914d\u65f6\u95f4\u5c06\u8017\u5c3d\uff0c\u4e0b\u4e00\u5206\u949f\n\u5c06\u6309\u7167"

    .line 49
    .line 50
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, "\u63a2\u5e01/min\u8fdb\u884c\u6263\u8d39"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 68
    .line 69
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->D0(Ljava/lang/String;J)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void

    .line 73
    :cond_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    iget-object p0, p0, Ll/iqu;->h:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p1, v2, p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->B0(ZLjava/lang/String;J)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic i3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->f()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqu;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/xnu;->o()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/xnu;->s()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Ll/btu;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;->a()Ll/v3f$d;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ll/aae0$a;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-direct {v0, v1}, Ll/aae0$a;-><init>(I)V

    .line 42
    .line 43
    .line 44
    const-string v1, "tantanapp://live/room/showGiftDialog?tabIdList=10"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/aae0$a;->e(Ljava/lang/String;)Ll/aae0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/aae0$a;->c()Ll/aae0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final m3(Lcom/p1/mobile/putong/live/external/internal/vchat/b;)V
    .locals 6

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Ll/iqu;->f:J

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    iget-object v4, p0, Ll/iqu;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->B0(ZLjava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    const-string v0, "randomCoupon"

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->a:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Ll/iqu;->h:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->b:J

    .line 31
    .line 32
    iput-wide v2, p0, Ll/iqu;->f:J

    .line 33
    .line 34
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 37
    .line 38
    invoke-virtual {p1, v1, v0, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->B0(ZLjava/lang/String;J)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/xnu;->t()J

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->b:J

    .line 50
    .line 51
    const-wide/16 v4, 0x12c

    .line 52
    .line 53
    cmp-long v0, v2, v4

    .line 54
    .line 55
    if-gtz v0, :cond_1

    .line 56
    .line 57
    const-wide/16 v4, 0x0

    .line 58
    .line 59
    cmp-long v0, v2, v4

    .line 60
    .line 61
    if-lez v0, :cond_1

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/b;->a:Ljava/lang/String;

    .line 64
    .line 65
    iput-object p1, p0, Ll/iqu;->h:Ljava/lang/String;

    .line 66
    .line 67
    iput-wide v2, p0, Ll/iqu;->f:J

    .line 68
    .line 69
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 70
    .line 71
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 72
    .line 73
    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;->B0(ZLjava/lang/String;J)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ll/xnu;->t()J

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method
