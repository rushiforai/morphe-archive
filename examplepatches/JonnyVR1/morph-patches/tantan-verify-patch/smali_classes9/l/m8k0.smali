.class public Ll/m8k0;
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
        "Ll/p8k0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/p8k0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/p8k0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public b:Lv/VText;

.field public c:I


# direct methods
.method public constructor <init>(Lv/VText;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/m8k0;->c:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/m8k0;->b:Lv/VText;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/m8k0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m8k0;->e(Landroid/view/View;)V

    return-void
.end method

.method private d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8k0;->a:Ll/p8k0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/m8k0;->b:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/m8k0;->a:Ll/p8k0;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/p8k0;->p4()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p1, p0, Ll/m8k0;->a:Ll/p8k0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/p8k0;->o4()V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p0, p0, Ll/m8k0;->a:Ll/p8k0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ms2;->Y3()V

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m8k0;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/p8k0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p8k0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/m8k0;->a:Ll/p8k0;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m8k0;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/l8k0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/l8k0;-><init>(Ll/m8k0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;I)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 v0, -0x1

    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    iput p2, p0, Ll/m8k0;->c:I

    .line 8
    .line 9
    :cond_1
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string v0, "#fe7e1d"

    .line 14
    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    goto :goto_0

    .line 22
    :cond_2
    const-string p2, "#ffffff"

    .line 23
    .line 24
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_4

    .line 33
    .line 34
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    const-string p2, "#60000000"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_3
    const-string p2, "#40ffffff"

    .line 44
    .line 45
    :goto_1
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    :cond_4
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_6

    .line 54
    .line 55
    iget-object v1, p0, Ll/m8k0;->b:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_5

    .line 62
    .line 63
    sget v2, Ll/obc0;->c1:I

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_5
    sget v2, Ll/obc0;->C0:I

    .line 67
    .line 68
    :goto_2
    invoke-static {v2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    .line 74
    .line 75
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 76
    .line 77
    const-string v2, "matched"

    .line 78
    .line 79
    const/high16 v3, 0x41700000    # 15.0f

    .line 80
    .line 81
    if-eqz v1, :cond_8

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_8

    .line 90
    .line 91
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_7

    .line 96
    .line 97
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 98
    .line 99
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    :goto_3
    move v1, v3

    .line 104
    goto :goto_5

    .line 105
    :cond_7
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sh:I

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_8
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 109
    .line 110
    if-eqz v1, :cond_a

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 113
    .line 114
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_a

    .line 119
    .line 120
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_9

    .line 125
    .line 126
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ld:I

    .line 127
    .line 128
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    goto :goto_3

    .line 133
    :cond_9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->K4:I

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 137
    .line 138
    const/high16 v1, 0x41800000    # 16.0f

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 143
    .line 144
    const-string v2, "following"

    .line 145
    .line 146
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_b

    .line 151
    .line 152
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o:I

    .line 153
    .line 154
    iget-object v0, p0, Ll/m8k0;->b:Lv/VText;

    .line 155
    .line 156
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 157
    .line 158
    .line 159
    goto :goto_5

    .line 160
    :cond_b
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->p:I

    .line 161
    .line 162
    iget-object v2, p0, Ll/m8k0;->b:Lv/VText;

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-eqz p1, :cond_c

    .line 169
    .line 170
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 171
    .line 172
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bd:I

    .line 173
    .line 174
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    goto :goto_4

    .line 179
    :cond_c
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 180
    .line 181
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->U5:I

    .line 182
    .line 183
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    :goto_4
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    move p1, v0

    .line 191
    :goto_5
    iget v0, p0, Ll/m8k0;->c:I

    .line 192
    .line 193
    const/4 v2, 0x3

    .line 194
    if-lt v0, v2, :cond_e

    .line 195
    .line 196
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sh:I

    .line 197
    .line 198
    if-eq p1, v0, :cond_d

    .line 199
    .line 200
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o:I

    .line 201
    .line 202
    if-eq p1, v0, :cond_d

    .line 203
    .line 204
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K4:I

    .line 205
    .line 206
    if-ne p1, v0, :cond_e

    .line 207
    .line 208
    :cond_d
    iget-object p0, p0, Ll/m8k0;->b:Lv/VText;

    .line 209
    .line 210
    const/4 p1, 0x0

    .line 211
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_e
    iget-object v0, p0, Ll/m8k0;->b:Lv/VText;

    .line 216
    .line 217
    const/4 v2, 0x1

    .line 218
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Ll/m8k0;->b:Lv/VText;

    .line 222
    .line 223
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 224
    .line 225
    .line 226
    iget-object p2, p0, Ll/m8k0;->b:Lv/VText;

    .line 227
    .line 228
    invoke-direct {p0}, Ll/m8k0;->d()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-eqz v0, :cond_f

    .line 233
    .line 234
    goto :goto_6

    .line 235
    :cond_f
    move v3, v1

    .line 236
    :goto_6
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p0, Ll/m8k0;->b:Lv/VText;

    .line 240
    .line 241
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p8k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m8k0;->b(Ll/p8k0;)V

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
