.class public Ll/i9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/m9k0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/d2o0;

.field public b:Ll/m9k0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/m9k0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Ll/c0s;


# direct methods
.method public constructor <init>(Lv/VText;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i9k0;->d:Lv/VImage;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/i9k0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i9k0;->j(Ll/nsv;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/i9k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i9k0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/i9k0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i9k0;->k(Ll/nsv;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/i9k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i9k0;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i9k0;->c:Lv/VText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/i9k0;->d:Lv/VImage;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/m9k0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/m9k0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/i9k0;->e:Ll/c0s;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/d2o0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-direct {v0, p1}, Ll/d2o0;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/i9k0;->a:Ll/d2o0;

    .line 17
    .line 18
    new-instance p1, Ll/c0s;

    .line 19
    .line 20
    iget-object v0, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 21
    .line 22
    iget-object v1, p0, Ll/i9k0;->a:Ll/d2o0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/d2o0;->d()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p1, v0, v1}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/i9k0;->e:Ll/c0s;

    .line 32
    .line 33
    iget-object p1, p0, Ll/i9k0;->a:Ll/d2o0;

    .line 34
    .line 35
    iget-object p1, p1, Ll/d2o0;->a:Landroid/view/View;

    .line 36
    .line 37
    new-instance v0, Ll/e9k0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/e9k0;-><init>(Ll/i9k0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/i9k0;->a:Ll/d2o0;

    .line 46
    .line 47
    iget-object p1, p1, Ll/d2o0;->d:Landroid/widget/TextView;

    .line 48
    .line 49
    new-instance v0, Ll/f9k0;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/f9k0;-><init>(Ll/i9k0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i9k0;->e:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i9k0;->e:Ll/c0s;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/m9k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i9k0;->e(Ll/m9k0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic j(Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m9k0;->w4(Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ll/m9k0;->v4(Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ms2;->Y3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Ll/nsv;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_b

    .line 2
    .line 3
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/e3t;->d()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    :goto_0
    if-eqz v1, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object p0, p0, Ll/i9k0;->d:Lv/VImage;

    .line 55
    .line 56
    if-eqz p0, :cond_d

    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object v1, p0, Ll/i9k0;->b:Ll/m9k0;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ll/m9k0;->o4(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    new-instance v0, Ll/g9k0;

    .line 73
    .line 74
    invoke-direct {v0, p0, p1}, Ll/g9k0;-><init>(Ll/i9k0;Ll/nsv;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 78
    .line 79
    if-eqz p1, :cond_4

    .line 80
    .line 81
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 82
    .line 83
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 93
    .line 94
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    iget-object p1, p0, Ll/i9k0;->d:Lv/VImage;

    .line 98
    .line 99
    if-eqz p1, :cond_9

    .line 100
    .line 101
    const/4 p1, 0x2

    .line 102
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    iget-object v1, p0, Ll/i9k0;->d:Lv/VImage;

    .line 107
    .line 108
    if-nez p1, :cond_5

    .line 109
    .line 110
    sget p1, Ll/obc0;->F8:I

    .line 111
    .line 112
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {v1, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_5
    sget p1, Ll/obc0;->W8:I

    .line 121
    .line 122
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {v1, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 127
    .line 128
    .line 129
    :goto_1
    iget-object p1, p0, Ll/i9k0;->d:Lv/VImage;

    .line 130
    .line 131
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_6
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 136
    .line 137
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ll/jfv;

    .line 142
    .line 143
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 144
    .line 145
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    invoke-virtual {v0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v1, Ll/h9k0;

    .line 154
    .line 155
    invoke-direct {v1, p0, p1}, Ll/h9k0;-><init>(Ll/i9k0;Ll/nsv;)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 159
    .line 160
    if-eqz p1, :cond_8

    .line 161
    .line 162
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 165
    .line 166
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 167
    .line 168
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0}, Ll/vwt;->R5()J

    .line 173
    .line 174
    .line 175
    move-result-wide v5

    .line 176
    cmp-long v0, v3, v5

    .line 177
    .line 178
    if-gez v0, :cond_7

    .line 179
    .line 180
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yb:I

    .line 184
    .line 185
    :goto_2
    invoke-virtual {v2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 193
    .line 194
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 195
    .line 196
    .line 197
    :cond_8
    iget-object p1, p0, Ll/i9k0;->d:Lv/VImage;

    .line 198
    .line 199
    if-eqz p1, :cond_9

    .line 200
    .line 201
    sget v0, Ll/obc0;->Z2:I

    .line 202
    .line 203
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {p1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p0, Ll/i9k0;->d:Lv/VImage;

    .line 211
    .line 212
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 213
    .line 214
    .line 215
    :cond_9
    :goto_3
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 216
    .line 217
    const/4 v0, 0x1

    .line 218
    if-eqz p1, :cond_a

    .line 219
    .line 220
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    :cond_a
    iget-object p0, p0, Ll/i9k0;->d:Lv/VImage;

    .line 224
    .line 225
    if-eqz p0, :cond_d

    .line 226
    .line 227
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_b
    :goto_4
    iget-object p1, p0, Ll/i9k0;->c:Lv/VText;

    .line 232
    .line 233
    const/16 v0, 0x8

    .line 234
    .line 235
    if-eqz p1, :cond_c

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 238
    .line 239
    .line 240
    :cond_c
    iget-object p0, p0, Ll/i9k0;->d:Lv/VImage;

    .line 241
    .line 242
    if-eqz p0, :cond_d

    .line 243
    .line 244
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 245
    .line 246
    .line 247
    :cond_d
    return-void
.end method
