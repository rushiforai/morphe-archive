.class public Ll/xvp;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public final A:Landroid/view/View;

.field public final B:Ll/yup;

.field public final x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

.field public final y:Lv/VRecyclerView;

.field public final z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/xup;Ljava/lang/String;)V
    .locals 7

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
    sget v1, Ll/yec0;->N2:I

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
    new-instance v1, Ll/svp;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/svp;-><init>(Ll/xvp;)V

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
    iput-object v1, p0, Ll/xvp;->z:Lv/VDraweeView;

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
    iput-object v0, p0, Ll/xvp;->A:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    sget v3, Ll/mdc0;->t3:I

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Lv/VRecyclerView;

    .line 92
    .line 93
    iput-object v2, p0, Ll/xvp;->y:Lv/VRecyclerView;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    sget v4, Ll/mdc0;->p1:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 106
    .line 107
    iput-object v3, p0, Ll/xvp;->x:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 108
    .line 109
    const/16 v4, 0x11

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 112
    .line 113
    .line 114
    sget v4, Ll/obc0;->h3:I

    .line 115
    .line 116
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 117
    .line 118
    .line 119
    const/high16 v4, 0x42dc0000    # 110.0f

    .line 120
    .line 121
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    invoke-virtual {v3, v5, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->c(II)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 130
    .line 131
    .line 132
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->vh:I

    .line 133
    .line 134
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 135
    .line 136
    .line 137
    const-string v4, "#4dffabf7"

    .line 138
    .line 139
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->d(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 144
    .line 145
    .line 146
    sget v4, Ll/qa00;->e:I

    .line 147
    .line 148
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->setTextMargin(I)V

    .line 149
    .line 150
    .line 151
    new-instance v4, Ll/yup;

    .line 152
    .line 153
    invoke-direct {v4}, Ll/yup;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v4, p0, Ll/xvp;->B:Ll/yup;

    .line 157
    .line 158
    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 159
    .line 160
    .line 161
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 162
    .line 163
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    invoke-direct {v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4, v2, v3}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Y(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Ll/bnl0;->y0()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    const/high16 v3, 0x44110000    # 580.0f

    .line 181
    .line 182
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    const-string v4, "context_livingAct"

    .line 187
    .line 188
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVER08yWTcyVkZFMkhLVkxFVDVLWU5FVlZWSEREVzE0IiwidyI6MTEyNSwiaCI6MTc0MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjgwODYyMTMxMzc0MDM1MzU0ODd9.png"

    .line 189
    .line 190
    invoke-static {v4, v1, v5, v2, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 191
    .line 192
    .line 193
    new-instance v1, Ll/tvp;

    .line 194
    .line 195
    invoke-direct {v1, p0, p1}, Ll/tvp;-><init>(Ll/xvp;Ll/xup;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1, v1}, Ll/xup;->l4(Ll/y20;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    sget v2, Ll/mdc0;->A:I

    .line 206
    .line 207
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    new-instance v2, Ll/uvp;

    .line 212
    .line 213
    invoke-direct {v2, p0}, Ll/uvp;-><init>(Ll/xvp;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 217
    .line 218
    .line 219
    new-instance p0, Ll/vvp;

    .line 220
    .line 221
    invoke-direct {p0, p1, p2}, Ll/vvp;-><init>(Ll/xup;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public static synthetic m0(Ll/xvp;Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xvp;->s0(Ll/xup;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic n0(Ll/xvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xvp;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Ll/xvp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xvp;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Ll/xup;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fvp;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/fvp;-><init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic q0(Ll/xup;Ljava/lang/String;Landroid/view/View;)V
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

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic s0(Ll/xup;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xvp;->u0(Ll/xup;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u0(Ll/xup;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;",
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
    new-instance v1, Ll/wvp;

    .line 7
    .line 8
    invoke-direct {v1, p1, v0}, Ll/wvp;-><init>(Ll/xup;Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/xvp;->B:Ll/yup;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
