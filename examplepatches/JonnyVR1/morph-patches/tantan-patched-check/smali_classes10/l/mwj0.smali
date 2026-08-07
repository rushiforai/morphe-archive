.class public Ll/mwj0;
.super Ll/d0j0;
.source "SourceFile"

# interfaces
.implements Ll/vam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d0j0<",
        "Ll/lwj0;",
        ">;",
        "Ll/vam;"
    }
.end annotation


# instance fields
.field public i:Lv/VRelative;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VRecyclerView;

.field public m:Lv/VRecyclerView;

.field public n:Ll/fnp0;

.field public o:Ll/fnp0;

.field public p:Ljava/lang/String;

.field public q:Landroidx/recyclerview/widget/RecyclerView$n;

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d0j0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    new-instance v0, Ll/fnp0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, v1}, Ll/fnp0;-><init>(Ll/vam;Z)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/mwj0;->n:Ll/fnp0;

    .line 8
    .line 9
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 28
    .line 29
    iget-object v2, p0, Ll/mwj0;->n:Ll/fnp0;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/fnp0;

    .line 35
    .line 36
    invoke-direct {v0, p0, v1}, Ll/fnp0;-><init>(Ll/vam;Z)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/mwj0;->o:Ll/fnp0;

    .line 40
    .line 41
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 59
    .line 60
    iget-object p0, p0, Ll/mwj0;->o:Ll/fnp0;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/mwj0;->r:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 24
    .line 25
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 26
    .line 27
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->role:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "out"

    .line 42
    .line 43
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-nez v1, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 50
    .line 51
    check-cast v0, Ll/lwj0;

    .line 52
    .line 53
    iget-object p0, p0, Ll/mwj0;->p:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, p0, p1, p2}, Ll/lwj0;->R3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/mwj0;->y(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/mwj0;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->p6:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d0j0;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/mdc0;->H7:I

    .line 2
    .line 3
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 5
    .line 6
    const-string p3, "voting"

    .line 7
    .line 8
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 16
    .line 17
    iput-object p2, p0, Ll/mwj0;->r:Ljava/util/List;

    .line 18
    .line 19
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p3, p0, Ll/mwj0;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const/4 p3, 0x0

    .line 28
    move v0, p3

    .line 29
    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 41
    .line 42
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 43
    .line 44
    sget-object v4, Ll/zrv;->a:Ll/wrv;

    .line 45
    .line 46
    invoke-virtual {v4}, Ll/wrv;->D0()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->role:Ljava/lang/String;

    .line 57
    .line 58
    const-string v3, "out"

    .line 59
    .line 60
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_2

    .line 65
    .line 66
    move v0, v2

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    iget-object p2, p0, Ll/mwj0;->k:Lv/VText;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Mc:I

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_4
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nc:I

    .line 76
    .line 77
    :goto_2
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Ll/mwj0;->q:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 81
    .line 82
    if-eqz p2, :cond_5

    .line 83
    .line 84
    iget-object v0, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 85
    .line 86
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 87
    .line 88
    .line 89
    iget-object p2, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 90
    .line 91
    iget-object v0, p0, Ll/mwj0;->q:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 94
    .line 95
    .line 96
    :cond_5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    const/high16 v0, 0x41c00000    # 24.0f

    .line 101
    .line 102
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    sub-int/2addr p2, v0

    .line 107
    const/high16 v0, 0x43820000    # 260.0f

    .line 108
    .line 109
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    sub-int/2addr p2, v0

    .line 114
    div-int/lit8 p2, p2, 0x5

    .line 115
    .line 116
    const/high16 v0, 0x41f80000    # 31.0f

    .line 117
    .line 118
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    const/16 v3, 0x9

    .line 129
    .line 130
    if-lt v1, v3, :cond_6

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_6
    move p2, v0

    .line 134
    :goto_3
    new-instance v0, Ll/mwj0$a;

    .line 135
    .line 136
    invoke-direct {v0, p0, p2}, Ll/mwj0$a;-><init>(Ll/mwj0;I)V

    .line 137
    .line 138
    .line 139
    iput-object v0, p0, Ll/mwj0;->q:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 140
    .line 141
    iget-object p2, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 147
    .line 148
    iget-object v0, p0, Ll/mwj0;->q:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 149
    .line 150
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    const/4 v0, 0x4

    .line 160
    if-le p2, v0, :cond_7

    .line 161
    .line 162
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    int-to-double v0, p2

    .line 169
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 170
    .line 171
    div-double/2addr v0, v3

    .line 172
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 173
    .line 174
    .line 175
    move-result-wide v0

    .line 176
    double-to-int p2, v0

    .line 177
    iget-object v0, p0, Ll/mwj0;->n:Ll/fnp0;

    .line 178
    .line 179
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v1, p3, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 182
    .line 183
    .line 184
    move-result-object p3

    .line 185
    invoke-virtual {v0, p3}, Ll/fnp0;->D(Ljava/util/List;)V

    .line 186
    .line 187
    .line 188
    iget-object p3, p0, Ll/mwj0;->o:Ll/fnp0;

    .line 189
    .line 190
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-interface {v0, p2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-virtual {p3, p2}, Ll/fnp0;->D(Ljava/util/List;)V

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 204
    .line 205
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    iget-object p2, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 209
    .line 210
    const/high16 p3, 0x41400000    # 12.0f

    .line 211
    .line 212
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 213
    .line 214
    .line 215
    move-result p3

    .line 216
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 217
    .line 218
    .line 219
    goto :goto_4

    .line 220
    :cond_7
    iget-object p2, p0, Ll/mwj0;->n:Ll/fnp0;

    .line 221
    .line 222
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 223
    .line 224
    invoke-virtual {p2, v0}, Ll/fnp0;->D(Ljava/util/List;)V

    .line 225
    .line 226
    .line 227
    iget-object p2, p0, Ll/mwj0;->m:Lv/VRecyclerView;

    .line 228
    .line 229
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    iget-object p2, p0, Ll/mwj0;->l:Lv/VRecyclerView;

    .line 233
    .line 234
    const/high16 p3, 0x42500000    # 52.0f

    .line 235
    .line 236
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 237
    .line 238
    .line 239
    move-result p3

    .line 240
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 241
    .line 242
    .line 243
    :goto_4
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 244
    .line 245
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 246
    .line 247
    invoke-virtual {p0, p2, p1}, Ll/d0j0;->w(II)V

    .line 248
    .line 249
    .line 250
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/d0j0;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mwj0;->j:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/d0j0;->u()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nwj0;->a(Ll/mwj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
