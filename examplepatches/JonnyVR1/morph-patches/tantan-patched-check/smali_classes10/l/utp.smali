.class public Ll/utp;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public final A:Landroid/view/View;

.field public final B:Landroid/view/View;

.field public final C:Lv/VDraweeView;

.field public final D:Landroid/view/View;

.field public final E:Ll/yup;

.field public final x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

.field public final y:Lv/VRecyclerView;

.field public final z:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/xup;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->I2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, p1, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/mdc0;->n1:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/mtp;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/mtp;-><init>(Ll/utp;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Ll/mdc0;->E:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    move-object v1, v0

    .line 48
    check-cast v1, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v1, p0, Ll/utp;->C:Lv/VDraweeView;

    .line 51
    .line 52
    const/high16 v0, 0x41c00000    # 24.0f

    .line 53
    .line 54
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    neg-int v5, v2

    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    const/4 v2, 0x0

    .line 64
    const/4 v3, 0x0

    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v2, Ll/mdc0;->F1:I

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/utp;->D:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    sget v3, Ll/mdc0;->Z0:I

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iput-object v2, p0, Ll/utp;->z:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    sget v4, Ll/mdc0;->g8:I

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iput-object v3, p0, Ll/utp;->B:Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    sget v5, Ll/mdc0;->h:I

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    iput-object v4, p0, Ll/utp;->A:Landroid/view/View;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    sget v6, Ll/mdc0;->t3:I

    .line 122
    .line 123
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    check-cast v5, Lv/VRecyclerView;

    .line 128
    .line 129
    iput-object v5, p0, Ll/utp;->y:Lv/VRecyclerView;

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    sget v7, Ll/mdc0;->p1:I

    .line 136
    .line 137
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    check-cast v6, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 142
    .line 143
    iput-object v6, p0, Ll/utp;->x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 144
    .line 145
    const/16 v7, 0x11

    .line 146
    .line 147
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 148
    .line 149
    .line 150
    sget v7, Ll/obc0;->h3:I

    .line 151
    .line 152
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 153
    .line 154
    .line 155
    const/high16 v7, 0x42dc0000    # 110.0f

    .line 156
    .line 157
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    invoke-virtual {v6, v8, v7}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->c(II)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 166
    .line 167
    .line 168
    sget v7, Lcom/p1/mobile/putong/live/livingroom/R$string;->vh:I

    .line 169
    .line 170
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 171
    .line 172
    .line 173
    const-string v7, "#4dffabf7"

    .line 174
    .line 175
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v7

    .line 179
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 180
    .line 181
    .line 182
    sget v7, Ll/qa00;->e:I

    .line 183
    .line 184
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->setTextMargin(I)V

    .line 185
    .line 186
    .line 187
    new-instance v7, Ll/yup;

    .line 188
    .line 189
    invoke-direct {v7}, Ll/yup;-><init>()V

    .line 190
    .line 191
    .line 192
    iput-object v7, p0, Ll/utp;->E:Ll/yup;

    .line 193
    .line 194
    invoke-virtual {v5, v7}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 195
    .line 196
    .line 197
    new-instance v8, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 198
    .line 199
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 200
    .line 201
    .line 202
    move-result-object v9

    .line 203
    invoke-direct {v8, v9}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v5, v8}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v7, v5, v6}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    sget v6, Ll/mdc0;->A:I

    .line 217
    .line 218
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    new-instance v6, Ll/ntp;

    .line 223
    .line 224
    invoke-direct {v6, p0}, Ll/ntp;-><init>(Ll/utp;)V

    .line 225
    .line 226
    .line 227
    invoke-static {v5, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 228
    .line 229
    .line 230
    new-instance v5, Ll/otp;

    .line 231
    .line 232
    invoke-direct {v5, p0, p1}, Ll/otp;-><init>(Ll/utp;Ll/xup;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v2, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 236
    .line 237
    .line 238
    new-instance v5, Ll/ptp;

    .line 239
    .line 240
    invoke-direct {v5, p0, p1}, Ll/ptp;-><init>(Ll/utp;Ll/xup;)V

    .line 241
    .line 242
    .line 243
    invoke-static {v3, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 244
    .line 245
    .line 246
    new-instance v3, Ll/qtp;

    .line 247
    .line 248
    invoke-direct {v3, p0, p1}, Ll/qtp;-><init>(Ll/utp;Ll/xup;)V

    .line 249
    .line 250
    .line 251
    invoke-static {v4, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Ll/bnl0;->y0()I

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    const/high16 v3, 0x44110000    # 580.0f

    .line 259
    .line 260
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    const-string v4, "context_livingAct"

    .line 265
    .line 266
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVER08yWTcyVkZFMkhLVkxFVDVLWU5FVlZWSEREVzE0IiwidyI6MTEyNSwiaCI6MTc0MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjgwODYyMTMxMzc0MDM1MzU0ODd9.png"

    .line 267
    .line 268
    invoke-static {v4, v1, v5, p0, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 269
    .line 270
    .line 271
    new-instance p0, Ll/rtp;

    .line 272
    .line 273
    invoke-direct {p0, p1, p2}, Ll/rtp;-><init>(Ll/xup;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2}, Landroid/view/View;->callOnClick()Z

    .line 280
    .line 281
    .line 282
    return-void
.end method

.method private B0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/utp;->z:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/utp;->B:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/utp;->A:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/utp;->E:Ll/yup;

    .line 18
    .line 19
    new-array v1, v1, [Ll/d3q;

    .line 20
    .line 21
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/stp;

    .line 33
    .line 34
    invoke-direct {p2, p0, p1}, Ll/stp;-><init>(Ll/utp;Ll/xup;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p3, p2}, Ll/xup;->k4(Ljava/lang/String;Ll/y20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic m0(Ll/utp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/utp;->x0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/utp;Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/utp;->z0(Ll/xup;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic o0(Ll/utp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/utp;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/utp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/utp;->y0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V
    .locals 2

    .line 1
    new-instance v0, Ll/fvp;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1, p2}, Ll/fvp;-><init>(Ll/xup;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic r0(Ll/xup;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const/high16 p2, 0x44160000    # 600.0f

    .line 2
    .line 3
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/16 v0, 0x1b59

    .line 8
    .line 9
    const/16 v1, 0x18

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/i6t;->w3(Ljava/lang/String;III)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic s0(Ll/utp;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/utp;->w0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/utp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/utp;->v0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "daily"

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Ll/utp;->B0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "week"

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Ll/utp;->B0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A0(Ll/xup;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ttp;

    .line 7
    .line 8
    invoke-direct {v1, p1, v0}, Ll/ttp;-><init>(Ll/xup;Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/utp;->E:Ll/yup;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic y0(Ll/xup;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "total"

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0}, Ll/utp;->B0(Ll/xup;Landroid/view/View;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic z0(Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/utp;->A0(Ll/xup;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
