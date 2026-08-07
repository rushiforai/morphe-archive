.class public Ll/xh40;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public final i:Lcom/p1/mobile/android/app/Act;

.field public j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

.field public final k:Ll/afj0;

.field public l:Ljava/lang/String;

.field public m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

.field public n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public o:Ll/kcg0;

.field public p:Landroid/widget/PopupWindow;

.field public q:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public r:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/xh40;->o:Ll/kcg0;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    iput-object v1, p0, Ll/xh40;->q:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 10
    .line 11
    iput-object v0, p0, Ll/xh40;->r:Ll/kcg0;

    .line 12
    .line 13
    iput-object p1, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    new-instance p1, Ll/afj0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/afj0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/xh40;->k:Ll/afj0;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic B()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/cl80;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic C(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xh40;->S(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic F(Ll/xh40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xh40;->Q()V

    return-void
.end method

.method public static synthetic H(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xh40;->R(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic I(Ll/xh40;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xh40;->O(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic J(Ll/xh40;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xh40;->P(Ljava/lang/Long;)V

    return-void
.end method

.method private T()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const v1, 0x1020002

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 45
    .line 46
    sget v1, Ll/qa00;->q:I

    .line 47
    .line 48
    neg-int v1, v1

    .line 49
    const/16 v2, 0x31

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual {p0, v0, v2, v3, v1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method


# virtual methods
.method public A()I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_6

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    if-eqz v0, :cond_6

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/xh40;->N()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    iget-object v0, p0, Ll/xh40;->r:Ll/kcg0;

    .line 38
    .line 39
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xh40;->M()V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/spl0;->R()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const-string v2, "tickets_broadcast"

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Ll/xh40;->l:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    sget v4, Ll/kec0;->Fb:I

    .line 69
    .line 70
    invoke-virtual {v0, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget v4, Ll/kec0;->Db:I

    .line 82
    .line 83
    invoke-virtual {v0, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    :goto_0
    sget v4, Ll/adc0;->Ye:I

    .line 88
    .line 89
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 94
    .line 95
    iput-object v4, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 96
    .line 97
    const-string v4, "match_success"

    .line 98
    .line 99
    iget-object v5, p0, Ll/xh40;->l:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    const/4 v5, 0x1

    .line 106
    if-eqz v4, :cond_4

    .line 107
    .line 108
    iget-object v2, p0, Ll/xh40;->k:Ll/afj0;

    .line 109
    .line 110
    iget-object v4, p0, Ll/xh40;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 111
    .line 112
    invoke-virtual {v2, v4}, Ll/afj0;->g(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->j()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/xh40;->Y()V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Ll/xh40;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 126
    .line 127
    invoke-virtual {p0, v3, v5, v2}, Ll/xh40;->a0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    iget-object v4, p0, Ll/xh40;->l:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_5

    .line 138
    .line 139
    iget-object v2, p0, Ll/xh40;->k:Ll/afj0;

    .line 140
    .line 141
    iget-object v4, p0, Ll/xh40;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 142
    .line 143
    invoke-virtual {v2, v4}, Ll/afj0;->j(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    iget-object v4, p0, Ll/xh40;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 151
    .line 152
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->l(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Z)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ll/xh40;->Y()V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Ll/xh40;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 159
    .line 160
    invoke-virtual {p0, v2, v1, v3}, Ll/xh40;->a0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 164
    .line 165
    iget-object v3, p0, Ll/xh40;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isFemale()Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setReceiverUserIsFemale(Z)V

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 175
    .line 176
    invoke-static {}, Ll/pzi0;->o()J

    .line 177
    .line 178
    .line 179
    move-result-wide v3

    .line 180
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 181
    .line 182
    .line 183
    :cond_5
    :goto_1
    new-instance v2, Landroid/widget/PopupWindow;

    .line 184
    .line 185
    const/4 v3, -0x1

    .line 186
    const/4 v4, -0x2

    .line 187
    invoke-direct {v2, v0, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 188
    .line 189
    .line 190
    iput-object v2, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 191
    .line 192
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 196
    .line 197
    sget v1, Ll/agc0;->D:I

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 200
    .line 201
    .line 202
    invoke-direct {p0}, Ll/xh40;->T()V

    .line 203
    .line 204
    .line 205
    const p0, 0x7fffffff

    .line 206
    .line 207
    .line 208
    return p0

    .line 209
    :cond_6
    :goto_2
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 210
    .line 211
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_7

    .line 216
    .line 217
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 218
    .line 219
    invoke-interface {p0}, Ll/x20;->call()V

    .line 220
    .line 221
    .line 222
    :cond_7
    return v1
.end method

.method public final K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/h1c0;->INSTANCE:Ll/h1c0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->fitReason:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/h1c0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "default"

    .line 17
    .line 18
    return-object p0
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 16
    .line 17
    iget-object v0, p0, Ll/jlb0;->b:Ll/x20;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public M()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/poplevel/a;->I()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/rh40;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/rh40;-><init>(Ll/xh40;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/xh40;->r:Ll/kcg0;

    .line 45
    .line 46
    return-void
.end method

.method public N()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/xh40;->q:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, v1}, Ll/xh40;->X(Z)V

    .line 11
    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/cl80;->e()Ll/cl80;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/cl80;->f()Ll/al80;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    instance-of p1, p1, Ll/xh40;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    new-instance p1, Ll/vh40;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/vh40;-><init>()V

    .line 42
    .line 43
    .line 44
    const-wide/16 v0, 0x3e8

    .line 45
    .line 46
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final synthetic P(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/xh40;->o:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xh40;->L()V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->d()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Ll/xh40;->k:Ll/afj0;

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/afj0;->m()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 35
    .line 36
    const-wide/16 v0, -0x1

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-wide/16 v0, 0x0

    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->g()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-virtual {v0}, Ll/afj0;->f()V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final synthetic Q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xh40;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xh40;->L()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xh40;->Z()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xh40;->L()V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/xh40;->k:Ll/afj0;

    .line 14
    .line 15
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    xor-int/lit8 p3, p3, 0x1

    .line 20
    .line 21
    invoke-virtual {p2, p3}, Ll/afj0;->e(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x7

    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    move-object v8, p4

    .line 41
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    move-object v8, p4

    .line 50
    iget-object p1, p0, Ll/xh40;->k:Ll/afj0;

    .line 51
    .line 52
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    xor-int/lit8 p3, p3, 0x1

    .line 57
    .line 58
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p4

    .line 62
    if-eqz p4, :cond_1

    .line 63
    .line 64
    iget-boolean p4, p2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 p4, 0x0

    .line 68
    :goto_0
    invoke-virtual {p0, p2}, Ll/xh40;->K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-string v1, "message"

    .line 73
    .line 74
    invoke-virtual {p1, p3, p4, v0, v1}, Ll/afj0;->a(ZZLjava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p3, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    new-instance p4, Ll/wh40;

    .line 90
    .line 91
    invoke-direct {p4, p0}, Ll/wh40;-><init>(Ll/xh40;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p3, p2, p4, v8}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    :cond_2
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xh40;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xh40;->L()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v0, p0, Ll/xh40;->k:Ll/afj0;

    .line 12
    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p2, 0x0

    .line 25
    :goto_0
    invoke-virtual {p0, p1}, Ll/xh40;->K(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "message"

    .line 30
    .line 31
    invoke-virtual {v0, p2, v1, v2}, Ll/afj0;->h(ZLjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/v;->L4(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Lrx/c;

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 42
    .line 43
    const-wide/16 v0, -0x1

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->setBroadcastTextTimerValue(J)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/xh40;->k:Ll/afj0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/afj0;->m()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {v0}, Ll/afj0;->f()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public U(Ljava/lang/String;)Ll/xh40;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xh40;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public V(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Ll/xh40;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xh40;->m:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public W(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)Ll/xh40;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xh40;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public X(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xh40;->Y()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/xh40;->T()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/xh40;->o:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {p0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public Y()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->e()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/xh40;->o:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    const-wide/16 v4, 0x1

    .line 24
    .line 25
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    invoke-static {v2, v3, v4, v5, v1}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/uh40;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/uh40;-><init>(Ll/xh40;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/xh40;->o:Ll/kcg0;

    .line 61
    .line 62
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xh40;->o:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/xh40;->r:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/bsj0;->U(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->i(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xh40;->j:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    new-instance v5, Ll/sh40;

    .line 6
    .line 7
    invoke-direct {v5, p0, p3, p1}, Ll/sh40;-><init>(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 8
    .line 9
    .line 10
    new-instance v6, Ll/th40;

    .line 11
    .line 12
    invoke-direct {v6, p0, p1}, Ll/th40;-><init>(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V

    .line 13
    .line 14
    .line 15
    move-object v2, p1

    .line 16
    move v3, p2

    .line 17
    move-object v4, p3

    .line 18
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatAudioBaseHeaderUserView;->j0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;ZLcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;Ll/z20;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public isValid()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xh40;->q:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xh40;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/xh40;->p:Landroid/widget/PopupWindow;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 32
    .line 33
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->QUICK_CHAT_BUBBLE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
