.class public Ll/hzp;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/RelativeLayout;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic H(Ll/hzp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hzp;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/hzp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hzp;->N(Landroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hzp;->P()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hzp;->d:Ll/y20;

    .line 2
    .line 3
    iget-object v0, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/hzp;->J(Ll/y20;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->state:Lcom/p1/mobile/putong/live/base/data/BLiveCallInviteState;

    .line 4
    .line 5
    const-string v1, "not-invited"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/hzp;->c:Ll/y20;

    .line 14
    .line 15
    iget-object v1, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/hzp;->J(Ll/y20;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public final J(Ll/y20;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public O(Landroid/widget/RelativeLayout;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->S2:I

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
    sget v1, Ll/mdc0;->p7:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/TextView;

    .line 19
    .line 20
    sget v2, Ll/mdc0;->b7:I

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/TextView;

    .line 27
    .line 28
    sget v3, Ll/mdc0;->Q7:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VDraweeView;

    .line 35
    .line 36
    sget v4, Ll/mdc0;->e7:I

    .line 37
    .line 38
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Landroid/widget/TextView;

    .line 43
    .line 44
    sget v5, Ll/mdc0;->m7:I

    .line 45
    .line 46
    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Landroid/widget/TextView;

    .line 51
    .line 52
    iget-object v6, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const-string v7, "context_single_room"

    .line 63
    .line 64
    invoke-static {v7, v0, v6}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 80
    .line 81
    iget-wide v6, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->rewardPoint:J

    .line 82
    .line 83
    long-to-double v6, v6

    .line 84
    invoke-static {v6, v7}, Ll/yau;->c(D)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->V5:I

    .line 96
    .line 97
    invoke-virtual {v1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 112
    .line 113
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ll/hiv;

    .line 118
    .line 119
    iget-object v1, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 122
    .line 123
    iget-wide v6, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 124
    .line 125
    invoke-virtual {v0, v6, v7}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 132
    .line 133
    iget-wide v6, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 134
    .line 135
    const-wide/16 v8, 0x0

    .line 136
    .line 137
    cmp-long v1, v6, v8

    .line 138
    .line 139
    if-eqz v1, :cond_0

    .line 140
    .line 141
    if-eqz v0, :cond_0

    .line 142
    .line 143
    const-string v1, "context_livingAct"

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v1, v3, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    const/4 v0, 0x1

    .line 151
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_0
    const/4 v0, 0x0

    .line 156
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    :goto_0
    iget-object v0, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iget-object v1, p0, Ll/hzp;->a:Lcom/p1/mobile/putong/data/User;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-static {v0, v1, v2}, Ll/egu;->a(ZILandroid/widget/TextView;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->state:Lcom/p1/mobile/putong/live/base/data/BLiveCallInviteState;

    .line 179
    .line 180
    const-string v1, "unknown_"

    .line 181
    .line 182
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_2

    .line 187
    .line 188
    iget-object v0, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 189
    .line 190
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->state:Lcom/p1/mobile/putong/live/base/data/BLiveCallInviteState;

    .line 191
    .line 192
    const-string v1, "not-invited"

    .line 193
    .line 194
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-eqz v0, :cond_1

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L6:I

    .line 202
    .line 203
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(I)V

    .line 204
    .line 205
    .line 206
    const v0, -0x404041

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 210
    .line 211
    .line 212
    sget v0, Ll/obc0;->j0:I

    .line 213
    .line 214
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_2
    :goto_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K6:I

    .line 219
    .line 220
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(I)V

    .line 221
    .line 222
    .line 223
    sget v0, Ll/obc0;->z0:I

    .line 224
    .line 225
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 226
    .line 227
    .line 228
    const/4 v0, -0x1

    .line 229
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 230
    .line 231
    .line 232
    :goto_2
    new-instance v0, Ll/fzp;

    .line 233
    .line 234
    invoke-direct {v0, p0}, Ll/fzp;-><init>(Ll/hzp;)V

    .line 235
    .line 236
    .line 237
    invoke-static {v5, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    new-instance v0, Ll/gzp;

    .line 241
    .line 242
    invoke-direct {v0, p0}, Ll/gzp;-><init>(Ll/hzp;)V

    .line 243
    .line 244
    .line 245
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public Q(Ll/y20;)Ll/hzp;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/hzp;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hzp;->c:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public R(Ll/y20;)Ll/hzp;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/hzp;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hzp;->d:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hzp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hzp;->O(Landroid/widget/RelativeLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
