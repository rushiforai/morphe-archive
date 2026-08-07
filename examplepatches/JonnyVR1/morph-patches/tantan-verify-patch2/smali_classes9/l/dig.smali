.class public Ll/dig;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

.field public i:Ll/cm0;

.field public j:Ll/kcg0;

.field public final k:Ll/lag;


# direct methods
.method public constructor <init>(Ll/lag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dig;->k:Ll/lag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic H(Ll/dig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dig;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Ll/dig;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dig;->N(Ll/ruf0;)V

    return-void
.end method

.method public static synthetic K(Ll/dig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dig;->O(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public L()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic N(Ll/ruf0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dig;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/dig;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dig;->k:Ll/lag;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/lag;->v4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/dig;->k:Ll/lag;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Ll/dig;->k:Ll/lag;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "message"

    .line 24
    .line 25
    invoke-static {p1, v0, v1}, Ll/lig;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Lcom/alibaba/fastjson/JSONArray;

    .line 29
    .line 30
    invoke-direct {p1}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/dig;->k:Ll/lag;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->showEditDialog()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/kig;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-direct {v0, v1, p1}, Ll/kig;-><init>(ZLjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;Ll/cm0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dig;->i:Ll/cm0;

    .line 4
    .line 5
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 2
    .line 3
    return-void
.end method

.method public S()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dig;->g:Lv/VText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 7
    .line 8
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->following:Z

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-nez v2, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/dig;->g:Lv/VText;

    .line 17
    .line 18
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/dig;->g:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/big;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/big;-><init>(Ll/dig;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isRecalled:Z

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/dig;->g:Lv/VText;

    .line 42
    .line 43
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Jb:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/dig;->g:Lv/VText;

    .line 49
    .line 50
    new-instance v1, Ll/cig;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/cig;-><init>(Ll/dig;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/dig;->g:Lv/VText;

    .line 64
    .line 65
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->jb:I

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->O0:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->t:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/dig;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->z4:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/dig;->d:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/mdc0;->e4:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText;

    .line 29
    .line 30
    iput-object v0, p0, Ll/dig;->e:Lv/VText;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->E1:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VDraweeView;

    .line 39
    .line 40
    iput-object v0, p0, Ll/dig;->b:Lv/VDraweeView;

    .line 41
    .line 42
    sget v0, Ll/mdc0;->Q7:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v0, p0, Ll/dig;->c:Lv/VDraweeView;

    .line 51
    .line 52
    sget v0, Ll/mdc0;->b1:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VText;

    .line 59
    .line 60
    iput-object v0, p0, Ll/dig;->f:Lv/VText;

    .line 61
    .line 62
    sget v0, Ll/mdc0;->X:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lv/VText;

    .line 69
    .line 70
    iput-object p1, p0, Ll/dig;->g:Lv/VText;

    .line 71
    .line 72
    iget-object p1, p0, Ll/dig;->j:Ll/kcg0;

    .line 73
    .line 74
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/dig;->a:Lv/VDraweeView;

    .line 78
    .line 79
    iget-object v0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->avatar:Ljava/lang/String;

    .line 82
    .line 83
    const-string v1, "context_livingAct"

    .line 84
    .line 85
    invoke-static {v1, p1, v0}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Ll/dig;->d:Landroid/view/View;

    .line 89
    .line 90
    iget-object v0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 91
    .line 92
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isOnline:Z

    .line 93
    .line 94
    const/4 v1, 0x0

    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    move v0, v1

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    const/16 v0, 0x8

    .line 100
    .line 101
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/dig;->e:Lv/VText;

    .line 105
    .line 106
    iget-object v0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->name:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/dig;->f:Lv/VText;

    .line 114
    .line 115
    iget-object v0, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->desc:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/dig;->S()V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 126
    .line 127
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->fanbaseGrade:I

    .line 128
    .line 129
    iget-object v0, p0, Ll/dig;->i:Ll/cm0;

    .line 130
    .line 131
    iget-object v0, v0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 132
    .line 133
    invoke-static {p1, v0}, Ll/vag;->h(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    if-eqz p1, :cond_1

    .line 138
    .line 139
    iget-object v0, p0, Ll/dig;->k:Ll/lag;

    .line 140
    .line 141
    invoke-virtual {v0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance v0, Ll/zhg;

    .line 146
    .line 147
    invoke-direct {v0, p0}, Ll/zhg;-><init>(Ll/dig;)V

    .line 148
    .line 149
    .line 150
    new-instance v1, Ll/aig;

    .line 151
    .line 152
    invoke-direct {v1}, Ll/aig;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Ll/dig;->j:Ll/kcg0;

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_1
    iget-object p1, p0, Ll/dig;->b:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    :goto_1
    iget-object p1, p0, Ll/dig;->h:Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 172
    .line 173
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->grade:I

    .line 174
    .line 175
    const/16 v1, 0x26

    .line 176
    .line 177
    if-lt v0, v1, :cond_2

    .line 178
    .line 179
    sget v0, Ll/i0k;->b:I

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_2
    sget v0, Ll/i0k;->a:I

    .line 183
    .line 184
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->getGradleUrl()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iget-object p0, p0, Ll/dig;->c:Lv/VDraweeView;

    .line 189
    .line 190
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/dig;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
