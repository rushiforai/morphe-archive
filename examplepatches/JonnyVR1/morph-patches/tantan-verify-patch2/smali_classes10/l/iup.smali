.class public Ll/iup;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public final A:Landroid/widget/TextView;

.field public final B:Ll/yup;

.field public final C:Landroid/view/View;

.field public final D:Landroid/view/View;

.field public final E:Landroid/view/View;

.field public final x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

.field public final y:Lv/VRecyclerView;

.field public final z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/xup;)V
    .locals 9

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
    sget v1, Ll/yec0;->J2:I

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
    new-instance v1, Ll/vtp;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/vtp;-><init>(Ll/iup;)V

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
    iput-object v1, p0, Ll/iup;->z:Lv/VDraweeView;

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
    sget v2, Ll/mdc0;->u1:I

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/widget/TextView;

    .line 80
    .line 81
    iput-object v0, p0, Ll/iup;->A:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget v3, Ll/mdc0;->t3:I

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lv/VRecyclerView;

    .line 94
    .line 95
    iput-object v2, p0, Ll/iup;->y:Lv/VRecyclerView;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    sget v4, Ll/mdc0;->p1:I

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 108
    .line 109
    iput-object v3, p0, Ll/iup;->x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 110
    .line 111
    const/16 v4, 0x11

    .line 112
    .line 113
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 114
    .line 115
    .line 116
    sget v4, Ll/obc0;->h3:I

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 119
    .line 120
    .line 121
    const/high16 v4, 0x42dc0000    # 110.0f

    .line 122
    .line 123
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    invoke-virtual {v3, v5, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->c(II)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 132
    .line 133
    .line 134
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->vh:I

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 137
    .line 138
    .line 139
    const-string v4, "#4dffabf7"

    .line 140
    .line 141
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 146
    .line 147
    .line 148
    sget v4, Ll/qa00;->e:I

    .line 149
    .line 150
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->setTextMargin(I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    sget v5, Ll/mdc0;->O3:I

    .line 158
    .line 159
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    iput-object v4, p0, Ll/iup;->C:Landroid/view/View;

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    sget v5, Ll/mdc0;->P3:I

    .line 170
    .line 171
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    iput-object v4, p0, Ll/iup;->D:Landroid/view/View;

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    sget v6, Ll/mdc0;->Q3:I

    .line 182
    .line 183
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    iput-object v5, p0, Ll/iup;->E:Landroid/view/View;

    .line 188
    .line 189
    const/4 v6, 0x0

    .line 190
    invoke-virtual {v5, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 191
    .line 192
    .line 193
    new-instance v6, Ll/yup;

    .line 194
    .line 195
    invoke-direct {v6}, Ll/yup;-><init>()V

    .line 196
    .line 197
    .line 198
    iput-object v6, p0, Ll/iup;->B:Ll/yup;

    .line 199
    .line 200
    invoke-virtual {v2, v6}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 201
    .line 202
    .line 203
    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    .line 208
    move-result-object v8

    .line 209
    invoke-direct {v7, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v2, v7}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v6, v2, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 216
    .line 217
    .line 218
    invoke-static {}, Ll/bnl0;->y0()I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    const/high16 v3, 0x44110000    # 580.0f

    .line 223
    .line 224
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    const-string v6, "context_livingAct"

    .line 229
    .line 230
    const-string v7, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVER08yWTcyVkZFMkhLVkxFVDVLWU5FVlZWSEREVzE0IiwidyI6MTEyNSwiaCI6MTc0MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjgwODYyMTMxMzc0MDM1MzU0ODd9.png"

    .line 231
    .line 232
    invoke-static {v6, v1, v7, v2, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    sget v2, Ll/mdc0;->A:I

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    new-instance v2, Ll/ztp;

    .line 246
    .line 247
    invoke-direct {v2, p0}, Ll/ztp;-><init>(Ll/iup;)V

    .line 248
    .line 249
    .line 250
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 251
    .line 252
    .line 253
    new-instance v1, Ll/aup;

    .line 254
    .line 255
    invoke-direct {v1, p0}, Ll/aup;-><init>(Ll/iup;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 259
    .line 260
    .line 261
    new-instance v0, Ll/bup;

    .line 262
    .line 263
    invoke-direct {v0, p0}, Ll/bup;-><init>(Ll/iup;)V

    .line 264
    .line 265
    .line 266
    invoke-static {v4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 267
    .line 268
    .line 269
    new-instance v0, Ll/cup;

    .line 270
    .line 271
    invoke-direct {v0, p0, p1}, Ll/cup;-><init>(Ll/iup;Ll/xup;)V

    .line 272
    .line 273
    .line 274
    invoke-static {v5, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, p1}, Ll/iup;->J0(Ll/xup;)V

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic C0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Ll/iup;->L0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic E0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/iup;->L0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private L0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/eup;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/eup;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/iup;->M0()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v0, v0, Ll/ctp;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/iup;->C:Landroid/view/View;

    .line 61
    .line 62
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic m0(Ll/iup;Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iup;->F0(Ll/xup;)V

    return-void
.end method

.method public static synthetic n0(Ll/iup;Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iup;->H0(Ll/xup;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic o0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic p0(Ll/iup;Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/iup;->I0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V

    return-void
.end method

.method public static synthetic q0(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r0(Ll/iup;Ll/xup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iup;->G0(Ll/xup;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s0(Ll/iup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iup;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/d3q;)Ljava/lang/String;
    .locals 0

    .line 1
    check-cast p0, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/pam;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic u0(ZLl/d3q;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pam;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/pam;->i(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v0(Ll/iup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iup;->C0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w0(Ll/iup;Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iup;->A0(Ll/xup;)V

    return-void
.end method

.method public static synthetic x0(Ll/iup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iup;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y0(Ll/iup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iup;->D0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iup;->J0(Ll/xup;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-direct {p0, p1}, Ll/iup;->L0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F0(Ll/xup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iup;->z0(Ll/xup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G0(Ll/xup;Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance v0, Ll/ftp;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ftp;-><init>(Ll/xup;)V

    .line 4
    .line 5
    .line 6
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sg:I

    .line 7
    .line 8
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rg:I

    .line 13
    .line 14
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fg:I

    .line 19
    .line 20
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Dg:I

    .line 25
    .line 26
    invoke-static {p2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    new-instance v5, Ll/fup;

    .line 31
    .line 32
    invoke-direct {v5, p0, p1}, Ll/fup;-><init>(Ll/iup;Ll/xup;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual/range {v0 .. v5}, Ll/ftp;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic H0(Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iup;->K0(Ll/xup;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fvp;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0, p3}, Ll/fvp;-><init>(Ll/xup;Ll/iup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J0(Ll/xup;)V
    .locals 1

    .line 1
    new-instance v0, Ll/dup;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/dup;-><init>(Ll/iup;Ll/xup;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/xup;->n4(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public K0(Ll/xup;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;",
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
    new-instance v1, Ll/xtp;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Ll/xtp;-><init>(Ll/iup;Ll/xup;Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Ll/ctp;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/ctp;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/iup;->B:Ll/yup;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public M0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ytp;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/ytp;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/iup;->E:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final z0(Ll/xup;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iup;->B:Ll/yup;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/gup;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/gup;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/hup;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/hup;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v1, Ll/wtp;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/wtp;-><init>(Ll/iup;Ll/xup;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Ll/xup;->e4(Ljava/util/ArrayList;Ll/x20;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
