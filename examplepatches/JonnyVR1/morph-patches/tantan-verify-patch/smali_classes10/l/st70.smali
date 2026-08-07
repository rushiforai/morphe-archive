.class public Ll/st70;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/st70;->j:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J3(Ll/st70;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st70;->T3(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/st70;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st70;->U3(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic M3(Ll/st70;Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st70;->V3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public final P3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveUserItemCards:Ljava/util/List;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/dw40;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveOtherUserItemCardsList:Ljava/util/List;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public R3(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/st70;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/st70;->j:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    goto/16 :goto_8

    .line 19
    .line 20
    :cond_1
    new-instance v0, Ll/nt70;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/nt70;-><init>(Ll/st70;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 30
    .line 31
    new-instance v1, Ll/ot70;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ot70;-><init>(Ll/st70;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 41
    .line 42
    if-eqz v0, :cond_14

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    goto/16 :goto_8

    .line 47
    .line 48
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 49
    .line 50
    new-instance v2, Ll/pt70;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/pt70;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 62
    .line 63
    new-instance v2, Ll/qt70;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/qt70;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 73
    .line 74
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const/4 v2, 0x1

    .line 81
    const/4 v3, 0x0

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object v1, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 85
    .line 86
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 87
    .line 88
    .line 89
    :cond_3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_4

    .line 96
    .line 97
    iget-object v1, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 98
    .line 99
    invoke-virtual {v1, v3, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->u0(ZZ)V

    .line 100
    .line 101
    .line 102
    :cond_4
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-lez v1, :cond_7

    .line 109
    .line 110
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    if-lez v4, :cond_7

    .line 123
    .line 124
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->showCountdown:Z

    .line 125
    .line 126
    if-nez v1, :cond_5

    .line 127
    .line 128
    iget-object v1, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 129
    .line 130
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;Z)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    iget-object v4, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 141
    .line 142
    if-le v1, v2, :cond_6

    .line 143
    .line 144
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 145
    .line 146
    invoke-virtual {v4, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->g0(Ljava/util/List;Z)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_6
    invoke-virtual {v4, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;Z)V

    .line 151
    .line 152
    .line 153
    :cond_7
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-lez v1, :cond_a

    .line 160
    .line 161
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 162
    .line 163
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 168
    .line 169
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->F(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-lez v4, :cond_a

    .line 174
    .line 175
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->showCountdown:Z

    .line 176
    .line 177
    if-nez v1, :cond_8

    .line 178
    .line 179
    iget-object v1, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 180
    .line 181
    invoke-virtual {v1, p1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;Z)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 186
    .line 187
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    iget-object v4, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 192
    .line 193
    if-le v1, v2, :cond_9

    .line 194
    .line 195
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 196
    .line 197
    invoke-virtual {v4, v1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->g0(Ljava/util/List;Z)V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_9
    invoke-virtual {v4, p1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->f0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;Z)V

    .line 202
    .line 203
    .line 204
    :cond_a
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 205
    .line 206
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    const-string v4, "mistCard"

    .line 211
    .line 212
    const/4 v5, 0x0

    .line 213
    if-nez v1, :cond_b

    .line 214
    .line 215
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 216
    .line 217
    invoke-virtual {p0, v1, v4}, Ll/st70;->S3(Ljava/util/List;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    goto :goto_2

    .line 222
    :cond_b
    move-object v1, v5

    .line 223
    :goto_2
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 224
    .line 225
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 226
    .line 227
    .line 228
    move-result v6

    .line 229
    if-nez v6, :cond_c

    .line 230
    .line 231
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 232
    .line 233
    invoke-virtual {p0, v5, v4}, Ll/st70;->S3(Ljava/util/List;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    :cond_c
    if-nez v1, :cond_e

    .line 238
    .line 239
    if-eqz v5, :cond_d

    .line 240
    .line 241
    goto :goto_3

    .line 242
    :cond_d
    move v4, v3

    .line 243
    goto :goto_4

    .line 244
    :cond_e
    :goto_3
    move v4, v2

    .line 245
    :goto_4
    iget-object v5, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 246
    .line 247
    if-eqz v1, :cond_f

    .line 248
    .line 249
    move v1, v2

    .line 250
    goto :goto_5

    .line 251
    :cond_f
    move v1, v3

    .line 252
    :goto_5
    invoke-virtual {v5, v4, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->e0(ZZ)V

    .line 253
    .line 254
    .line 255
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 256
    .line 257
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    const-string v5, "magnetCard"

    .line 262
    .line 263
    if-nez v1, :cond_11

    .line 264
    .line 265
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 266
    .line 267
    invoke-virtual {p0, v0, v5}, Ll/st70;->S3(Ljava/util/List;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    iget-object v1, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 272
    .line 273
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 274
    .line 275
    if-eqz v0, :cond_10

    .line 276
    .line 277
    if-nez v4, :cond_10

    .line 278
    .line 279
    move v0, v2

    .line 280
    goto :goto_6

    .line 281
    :cond_10
    move v0, v3

    .line 282
    :goto_6
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->a(Z)V

    .line 283
    .line 284
    .line 285
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 286
    .line 287
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-nez v0, :cond_13

    .line 292
    .line 293
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 294
    .line 295
    invoke-virtual {p0, p1, v5}, Ll/st70;->S3(Ljava/util/List;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    iget-object v0, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 300
    .line 301
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;

    .line 302
    .line 303
    if-eqz p1, :cond_12

    .line 304
    .line 305
    if-nez v4, :cond_12

    .line 306
    .line 307
    goto :goto_7

    .line 308
    :cond_12
    move v2, v3

    .line 309
    :goto_7
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkMagnetCardView;->c(Z)V

    .line 310
    .line 311
    .line 312
    :cond_13
    iget-object p0, p0, Ll/st70;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->Z()V

    .line 315
    .line 316
    .line 317
    :cond_14
    :goto_8
    return-void
.end method

.method public S3(Ljava/util/List;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/rt70;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/rt70;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/st70;->j:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Ll/st70;->P3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/st70;->j:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/st70;->R3(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/aj1;->e2:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/mt70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/mt70;-><init>(Ll/st70;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
