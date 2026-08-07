.class public Ll/itp;
.super Ll/c0s;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Landroid/widget/TextView;

.field public C:Landroid/view/View;

.field public D:Landroid/widget/TextView;

.field public E:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public F:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field public x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public y:Lv/VDraweeView;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Ll/xup;)V
    .locals 6

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
    sget v1, Ll/yec0;->G2:I

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
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/itp;->E:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/itp;->F:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget v0, Ll/mdc0;->n1:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/htp;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/htp;-><init>(Ll/itp;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget v0, Ll/mdc0;->E:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    move-object v0, p1

    .line 62
    check-cast v0, Lv/VDraweeView;

    .line 63
    .line 64
    iput-object v0, p0, Ll/itp;->y:Lv/VDraweeView;

    .line 65
    .line 66
    const/high16 p1, 0x41c00000    # 24.0f

    .line 67
    .line 68
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    neg-int v4, v1

    .line 73
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    const/4 v1, 0x0

    .line 78
    const/4 v2, 0x0

    .line 79
    const/4 v3, 0x0

    .line 80
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    sget v0, Ll/mdc0;->t:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lv/VDraweeView;

    .line 94
    .line 95
    iput-object p1, p0, Ll/itp;->z:Lv/VDraweeView;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget v0, Ll/mdc0;->S7:I

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Landroid/widget/TextView;

    .line 108
    .line 109
    iput-object p1, p0, Ll/itp;->A:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sget v0, Ll/mdc0;->U3:I

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 122
    .line 123
    iput-object p1, p0, Ll/itp;->x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget v0, Ll/mdc0;->W3:I

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Landroid/widget/TextView;

    .line 136
    .line 137
    iput-object p1, p0, Ll/itp;->B:Landroid/widget/TextView;

    .line 138
    .line 139
    iget-object p1, p0, Ll/itp;->E:Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sget v1, Ll/mdc0;->j5:I

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lv/VDraweeView;

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/itp;->E:Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget v1, Ll/mdc0;->k5:I

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Lv/VDraweeView;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/itp;->E:Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    sget v1, Ll/mdc0;->l5:I

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    check-cast v0, Lv/VDraweeView;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Ll/itp;->F:Ljava/util/ArrayList;

    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sget v1, Ll/mdc0;->n5:I

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Landroid/widget/TextView;

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Ll/itp;->F:Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    sget v1, Ll/mdc0;->o5:I

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    check-cast v0, Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/itp;->F:Ljava/util/ArrayList;

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    sget v1, Ll/mdc0;->p5:I

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    check-cast v0, Landroid/widget/TextView;

    .line 237
    .line 238
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    sget v0, Ll/mdc0;->Q:I

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Ll/itp;->C:Landroid/view/View;

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->R()Landroid/view/View;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    sget v0, Ll/mdc0;->R:I

    .line 258
    .line 259
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    check-cast p1, Landroid/widget/TextView;

    .line 264
    .line 265
    iput-object p1, p0, Ll/itp;->D:Landroid/widget/TextView;

    .line 266
    .line 267
    return-void
.end method

.method public static synthetic m0(Ll/itp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/itp;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->joinGiftId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/xup;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public p0(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/itp;->y:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/high16 v2, 0x44110000    # 580.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const-string v3, "context_livingAct"

    .line 14
    .line 15
    const-string v4, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxKQjZJR0dETFM0UEsyQlRCMjdGR080RkhYNEFMTjE0IiwidyI6MTEyNSwiaCI6MTI4NywiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjg2NjI2NzM4ODMyNzI0MjM2MTV9.png"

    .line 16
    .line 17
    invoke-static {v3, v0, v4, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/itp;->z:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->avatar:Ljava/lang/String;

    .line 23
    .line 24
    sget v2, Ll/qa00;->K:I

    .line 25
    .line 26
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/a3o0;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-direct {v0, v1}, Ll/a3o0;-><init>(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/a3o0;->t(Ll/ner;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Lcom/p1/mobile/putong/data/UserMedal;

    .line 39
    .line 40
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/UserMedal;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalColor:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v4, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 46
    .line 47
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalGrade:I

    .line 48
    .line 49
    iput v4, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseGrade:I

    .line 50
    .line 51
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->medalName:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v4, v2, Lcom/p1/mobile/putong/data/UserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v4, p0, Ll/itp;->x:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 56
    .line 57
    invoke-virtual {v0, v4, v2}, Ll/a3o0;->r(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/p1/mobile/putong/data/UserMedal;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/itp;->A:Landroid/widget/TextView;

    .line 61
    .line 62
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/itp;->B:Landroid/widget/TextView;

    .line 68
    .line 69
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tg:I

    .line 70
    .line 71
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->memberNum:I

    .line 72
    .line 73
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-static {v2, v4}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    move v0, v1

    .line 85
    :goto_0
    const/4 v2, 0x3

    .line 86
    if-ge v0, v2, :cond_2

    .line 87
    .line 88
    iget-object v2, p0, Ll/itp;->E:Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lv/VDraweeView;

    .line 95
    .line 96
    iget-object v4, p0, Ll/itp;->F:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Landroid/widget/TextView;

    .line 103
    .line 104
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rights:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-le v5, v0, :cond_0

    .line 111
    .line 112
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->rights:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseRight;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_0
    const/4 v5, 0x0

    .line 122
    :goto_1
    if-nez v5, :cond_1

    .line 123
    .line 124
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_1
    const/4 v6, 0x1

    .line 132
    invoke-static {v2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseRight;->pic:Ljava/lang/String;

    .line 139
    .line 140
    sget v7, Ll/qa00;->I:I

    .line 141
    .line 142
    invoke-static {v3, v2, v6, v7}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    iget-object v2, v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseRight;->name:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_2
    iget-object v0, p0, Ll/itp;->D:Landroid/widget/TextView;

    .line 154
    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qg:I

    .line 161
    .line 162
    invoke-static {v2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ug:I

    .line 170
    .line 171
    invoke-static {v2}, Ll/n3d0;->d(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Ll/itp;->C:Landroid/view/View;

    .line 186
    .line 187
    new-instance v0, Ll/gtp;

    .line 188
    .line 189
    invoke-direct {v0, p1, p2}, Ll/gtp;-><init>(Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V

    .line 190
    .line 191
    .line 192
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method
