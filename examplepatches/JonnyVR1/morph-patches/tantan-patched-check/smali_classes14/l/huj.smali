.class public Ll/huj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vlu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vlu<",
            "*>;"
        }
    .end annotation
.end field

.field public b:Z

.field public c:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/vlu;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vlu<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/huj;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/huj;->a:Ll/vlu;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/huj;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/huj;->o(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/huj;->n(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/huj;->m(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ll/huj;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/huj;->p(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public final e(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 3
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p4, v1}, Ll/huj;->k(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p4, :cond_1

    .line 14
    .line 15
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 16
    .line 17
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 18
    .line 19
    :cond_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    invoke-virtual {p2, p0}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {p2, v1}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 39
    .line 40
    .line 41
    new-instance p4, Ll/ztj;

    .line 42
    .line 43
    invoke-direct {p4, p0, p2, p1, p3}, Ll/ztj;-><init>(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final f(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p4, v1}, Ll/huj;->k(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p4, :cond_1

    .line 14
    .line 15
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 16
    .line 17
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 18
    .line 19
    :cond_1
    new-instance p4, Ll/buj;

    .line 20
    .line 21
    invoke-direct {p4, p0, p2, p1, p3}, Ll/buj;-><init>(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final g(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p2, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/jjs;->y([I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final h(Ll/jjs;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/huj;->a:Ll/vlu;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    long-to-double v0, v0

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/vlu;->x3(D)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 17
    .line 18
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/civ;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/civ;->b()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public final i(Ll/jjs;)J
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->intervalMs:I

    .line 10
    .line 11
    int-to-long p0, p0

    .line 12
    const-wide/16 v0, 0x12c

    .line 13
    .line 14
    cmp-long v2, p0, v0

    .line 15
    .line 16
    if-gez v2, :cond_0

    .line 17
    .line 18
    return-wide v0

    .line 19
    :cond_0
    const-wide/16 v0, 0x258

    .line 20
    .line 21
    cmp-long v2, p0, v0

    .line 22
    .line 23
    if-ltz v2, :cond_1

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_1
    return-wide p0
.end method

.method public final j(ZLl/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;I)V
    .locals 9

    .line 1
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPaidGift()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/huj;->a:Ll/vlu;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    long-to-double v1, v1

    .line 22
    invoke-virtual {v0, v1, v2}, Ll/vlu;->x3(D)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    move-object v5, v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const-string v0, "NA"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getActionScheme(Z)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p2, p3}, Ll/huj;->g(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x1

    .line 61
    const/4 v6, 0x0

    .line 62
    const/4 v7, -0x1

    .line 63
    sparse-switch v3, :sswitch_data_0

    .line 64
    .line 65
    .line 66
    :goto_2
    move v1, v6

    .line 67
    goto :goto_3

    .line 68
    :sswitch_0
    const-string v3, "AutoCombo"

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_1
    const/4 v7, 0x4

    .line 78
    goto :goto_2

    .line 79
    :sswitch_1
    const-string v3, "GivenGiftAndShowComboGearMenu"

    .line 80
    .line 81
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_2

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    const/4 v7, 0x3

    .line 89
    goto :goto_2

    .line 90
    :sswitch_2
    const-string v3, "GivenGift"

    .line 91
    .line 92
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_3

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    const/4 v7, 0x2

    .line 100
    goto :goto_2

    .line 101
    :sswitch_3
    const-string v3, "JumpToScheme"

    .line 102
    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_4

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    move v7, v4

    .line 111
    goto :goto_2

    .line 112
    :sswitch_4
    const-string v3, "ShowNotice"

    .line 113
    .line 114
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_5

    .line 119
    .line 120
    goto :goto_2

    .line 121
    :cond_5
    move v1, v6

    .line 122
    move v7, v1

    .line 123
    :goto_3
    const-string v6, ""

    .line 124
    .line 125
    packed-switch v7, :pswitch_data_0

    .line 126
    .line 127
    .line 128
    goto :goto_4

    .line 129
    :pswitch_0
    move-object v1, p0

    .line 130
    move-object v2, p2

    .line 131
    move-object v3, p3

    .line 132
    move v4, p4

    .line 133
    invoke-virtual/range {v1 .. v6}, Ll/huj;->s(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :pswitch_1
    move-object v1, p0

    .line 138
    move-object v2, p2

    .line 139
    move-object v3, p3

    .line 140
    move v4, p4

    .line 141
    const/4 v7, 0x0

    .line 142
    const/4 v8, 0x0

    .line 143
    invoke-virtual/range {v1 .. v8}, Ll/huj;->r(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Z)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :pswitch_2
    move-object v1, p0

    .line 148
    move-object p0, p2

    .line 149
    move-object v3, p3

    .line 150
    new-instance p1, Ll/aae0$b;

    .line 151
    .line 152
    invoke-direct {p1}, Ll/aae0$b;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1, v3}, Ll/aae0$b;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1, p0}, Ll/aae0$b;->b(Ll/jjs;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, v1, Ll/huj;->a:Ll/vlu;

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;->a()Ll/v3f$d;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    new-instance p2, Ll/aae0$a;

    .line 174
    .line 175
    const/16 p3, 0xc8

    .line 176
    .line 177
    invoke-direct {p2, p3}, Ll/aae0$a;-><init>(I)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2, v2}, Ll/aae0$a;->e(Ljava/lang/String;)Ll/aae0$a;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2, p1}, Ll/aae0$a;->d(Ll/aae0$b;)Ll/aae0$a;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {p1}, Ll/aae0$a;->c()Ll/aae0;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :pswitch_3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getActionNotice(Z)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/dpj;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    if-eqz p0, :cond_6

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-static {p0, v1, v4}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 211
    .line 212
    .line 213
    :cond_6
    :goto_4
    return-void

    .line 214
    nop

    .line 215
    :sswitch_data_0
    .sparse-switch
        -0x634eb7ab -> :sswitch_4
        -0x3fee3992 -> :sswitch_3
        -0x310111d3 -> :sswitch_2
        -0x2a51640b -> :sswitch_1
        -0x27154701 -> :sswitch_0
    .end sparse-switch

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->getClickAction(Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/huj;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    iput-boolean p4, p0, Ll/huj;->b:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->L0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p4, p2, p1, p3}, Ll/huj;->j(ZLl/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;I)V

    .line 8
    .line 9
    .line 10
    return p4
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)V
    .locals 0

    .line 1
    const/4 p4, 0x0

    .line 2
    iput-boolean p4, p0, Ll/huj;->b:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->L0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p4, p2, p1, p3}, Ll/huj;->j(ZLl/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-eq p1, p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x3

    .line 10
    if-ne p1, p2, :cond_1

    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/huj;->c:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p0, Ll/huj;->b:Z

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/huj;->a:Ll/vlu;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->GiftDialogEventGroup:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$a;->c()Ll/v3f$c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 34
    .line 35
    .line 36
    iput-boolean v0, p0, Ll/huj;->b:Z

    .line 37
    .line 38
    :cond_1
    return v0
.end method

.method public final synthetic p(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x1

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/huj;->r(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public q(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/huj;->f(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/huj;->e(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/xtj;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/xtj;-><init>(Ll/huj;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final r(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->Y0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->z0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->t0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->h5:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget-object v0, p0, Ll/huj;->a:Ll/vlu;

    .line 38
    .line 39
    const/4 v4, 0x1

    .line 40
    move-object v1, p1

    .line 41
    move-object v2, p2

    .line 42
    move v5, p3

    .line 43
    move-object v3, p6

    .line 44
    move v6, p7

    .line 45
    invoke-virtual/range {v0 .. v6}, Ll/vlu;->V3(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/y20;IIZ)V

    .line 46
    .line 47
    .line 48
    move p1, v5

    .line 49
    iget-object p0, p0, Ll/huj;->a:Ll/vlu;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/xnu;->o()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p6

    .line 59
    const-string p3, "p_live_user_video_quickchat_room"

    .line 60
    .line 61
    move-object p2, p4

    .line 62
    const/4 p4, 0x1

    .line 63
    move-object p0, v1

    .line 64
    invoke-static/range {p0 .. p7}, Ll/btu;->k(Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final s(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->Y0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->z0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->t0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->h5:I

    .line 29
    .line 30
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-boolean v2, p0, Ll/huj;->b:Z

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object v1, p0, Ll/huj;->c:Ll/kcg0;

    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual/range {p0 .. p1}, Ll/huj;->i(Ll/jjs;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v8

    .line 49
    invoke-virtual/range {p0 .. p1}, Ll/huj;->h(Ll/jjs;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iput-boolean v2, p0, Ll/huj;->b:Z

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v7, 0x0

    .line 59
    move-object v0, p0

    .line 60
    move-object v1, p1

    .line 61
    move-object v2, p2

    .line 62
    move v3, p3

    .line 63
    move-object v4, p4

    .line 64
    move-object v5, p5

    .line 65
    invoke-virtual/range {v0 .. v7}, Ll/huj;->r(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    const/4 v6, 0x0

    .line 70
    const/4 v7, 0x1

    .line 71
    move-object v0, p0

    .line 72
    move-object v1, p1

    .line 73
    move-object v2, p2

    .line 74
    move v3, p3

    .line 75
    move-object v4, p4

    .line 76
    move-object v5, p5

    .line 77
    invoke-virtual/range {v0 .. v7}, Ll/huj;->r(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/huj;->a:Ll/vlu;

    .line 81
    .line 82
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 83
    .line 84
    invoke-static {v8, v9, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, v2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    new-instance v0, Ll/duj;

    .line 101
    .line 102
    move-object v1, p0

    .line 103
    move-object v2, p1

    .line 104
    move-object v3, p2

    .line 105
    move v4, p3

    .line 106
    move-object v5, p4

    .line 107
    move-object v6, p5

    .line 108
    invoke-direct/range {v0 .. v6}, Ll/duj;-><init>(Ll/huj;Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILjava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    move-object v1, v0

    .line 112
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v7, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, p0, Ll/huj;->c:Ll/kcg0;

    .line 121
    .line 122
    return-void
.end method
