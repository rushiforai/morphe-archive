.class public Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VText_NoTopPadding;

.field public e:Lv/VImage;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/core/data/Message;

.field public h:Lcom/p1/mobile/putong/core/data/Conversation;

.field public i:J

.field public j:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->V(Lcom/p1/mobile/putong/data/User;J)V

    return-void
.end method

.method public static synthetic Q(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const-string v3, "p_chat_view,e_intl_im_readreceipt_btn,click"

    .line 17
    .line 18
    invoke-interface {p0, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "readreceipt_entrance"

    .line 22
    .line 23
    const-string v0, "last_message"

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "e_intl_im_readreceipt_btn"

    .line 34
    .line 35
    const-string v1, "p_chat_view"

    .line 36
    .line 37
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->T(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    return-void
.end method

.method private X(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->Y()V

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->K3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ll/r97;->w2()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->a0(Lcom/p1/mobile/putong/data/User;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->Y()V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public final S(J)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/pzi0;->D(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/pzi0;->h:Ljava/text/SimpleDateFormat;

    .line 8
    .line 9
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {p1, p2}, Ll/pzi0;->v(J)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/pzi0;->u()Ljava/text/SimpleDateFormat;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    long-to-double p0, p1

    .line 38
    invoke-static {p0, p1}, Ll/pzi0;->l(D)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/data/User;J)V
    .locals 5

    return-void

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "bubble_key_intl_read_receipts"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->x(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 24
    .line 25
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->R3:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v2, Ll/g9c0;->o:I

    .line 50
    .line 51
    invoke-static {v0, v2}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    filled-new-array {v0}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget v0, Ll/g9c0;->q:I

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const/high16 v0, 0x41500000    # 13.0f

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {}, Ll/bnl0;->y0()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-static {v0}, Ll/vnb;->t1(I)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/lit8 v0, v0, -0x5c

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->I(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    sget v0, Ll/qa00;->g:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const/high16 v0, 0x41800000    # 16.0f

    .line 106
    .line 107
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    const/high16 v3, 0x41200000    # 10.0f

    .line 112
    .line 113
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-virtual {p1, v2, v4, v0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->H(IIII)Lcom/p1/mobile/android/ui/bubble/a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 130
    .line 131
    const/high16 v2, 0x42080000    # 34.0f

    .line 132
    .line 133
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-wide/16 v2, 0x9c4

    .line 142
    .line 143
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget v0, Ll/zvk;->A:I

    .line 148
    .line 149
    sget v2, Ll/zvk;->C:I

    .line 150
    .line 151
    or-int/2addr v0, v2

    .line 152
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->f:Landroid/view/View;

    .line 161
    .line 162
    invoke-virtual {v0, p1, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 168
    .line 169
    iget-object p0, p0, Ll/dkb;->I6:Ll/byd0;

    .line 170
    .line 171
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    const-string p0, "e_intl_readreceipt_bubble"

    .line 179
    .line 180
    const-string p1, "p_chat_view"

    .line 181
    .line 182
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public W(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ll/g900;Lcom/p1/mobile/putong/data/User;JJ)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iput-wide p6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->i:J

    .line 6
    .line 7
    iput-wide p8, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->j:J

    .line 8
    .line 9
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/joa;->y3()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p4, p1, p2}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance p2, Ll/nmo;

    .line 26
    .line 27
    invoke-direct {p2, p0, p5}, Ll/nmo;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p5}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final Y()V
    .locals 8

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    .line 10
    :catch_0
    const-wide v0, 0x7fffffffffffffffL

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 32
    .line 33
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/MessageRelate;->readLastMessageTime:D

    .line 34
    .line 35
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 36
    .line 37
    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 38
    .line 39
    cmpl-double v6, v2, v4

    .line 40
    .line 41
    if-ltz v6, :cond_1

    .line 42
    .line 43
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->i:J

    .line 44
    .line 45
    cmp-long v0, v0, v6

    .line 46
    .line 47
    if-lez v0, :cond_0

    .line 48
    .line 49
    double-to-long v0, v4

    .line 50
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->j:J

    .line 51
    .line 52
    cmp-long v0, v0, v4

    .line 53
    .line 54
    if-gez v0, :cond_1

    .line 55
    .line 56
    :cond_0
    double-to-long v0, v2

    .line 57
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->Z(J)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->b0()V

    .line 62
    .line 63
    .line 64
    :goto_1
    const/4 v0, 0x0

    .line 65
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final Z(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->S(J)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 11
    .line 12
    const/high16 p2, 0x41400000    # 12.0f

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 18
    .line 19
    const-string p2, "#FE7E1D"

    .line 20
    .line 21
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->c:Lv/VImage;

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 35
    .line 36
    const/4 p2, 0x1

    .line 37
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->e:Lv/VImage;

    .line 41
    .line 42
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const/high16 v1, 0x41400000    # 12.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 9
    .line 10
    const-string v1, "#F2AB00"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->p2:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->c:Lv/VImage;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->e:Lv/VImage;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/omo;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/omo;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ll/pzi0;->o()J

    .line 55
    .line 56
    .line 57
    move-result-wide v0

    .line 58
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    iget-object v2, v2, Ll/dkb;->I6:Ll/byd0;

    .line 63
    .line 64
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Ljava/lang/Long;

    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    sub-long v2, v0, v2

    .line 75
    .line 76
    const-wide/32 v4, 0xa4cb800

    .line 77
    .line 78
    .line 79
    cmp-long v2, v2, v4

    .line 80
    .line 81
    if-lez v2, :cond_0

    .line 82
    .line 83
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    new-instance v3, Ll/pmo;

    .line 88
    .line 89
    invoke-direct {v3, p0, p1, v0, v1}, Ll/pmo;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;J)V

    .line 90
    .line 91
    .line 92
    const-wide/16 p0, 0x12c

    .line 93
    .line 94
    invoke-static {v2, v3, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method

.method public final b0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->r2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 9
    .line 10
    const-string v1, "#33000000"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 20
    .line 21
    const/high16 v1, 0x41200000    # 10.0f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->c:Lv/VImage;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->e:Lv/VImage;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/qec0;->V0:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    sget v0, Ll/edc0;->l1:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lv/VImage;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->c:Lv/VImage;

    .line 27
    .line 28
    sget v0, Ll/edc0;->A4:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VText_NoTopPadding;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->d:Lv/VText_NoTopPadding;

    .line 37
    .line 38
    sget v0, Ll/edc0;->m1:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lv/VImage;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->e:Lv/VImage;

    .line 47
    .line 48
    sget v0, Ll/edc0;->N4:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->f:Landroid/view/View;

    .line 55
    .line 56
    return-void
.end method
