.class public Ll/au9;
.super Ll/dq1;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ll/pf60<",
        "Lcom/p1/mobile/putong/core/data/StickerBundle;",
        "Lcom/p1/mobile/putong/core/data/StickerPackage;",
        ">;>;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

.field public final e:I

.field public f:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/Keyboard;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/r97;->q()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x3

    .line 21
    :goto_0
    iput v0, p0, Ll/au9;->e:I

    .line 22
    .line 23
    const-string v0, "\ud83d\udc36"

    .line 24
    .line 25
    const-string v1, "\ud83c\udf54"

    .line 26
    .line 27
    const-string v2, "\ud83d\ude0a"

    .line 28
    .line 29
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/au9;->f:[Ljava/lang/String;

    .line 34
    .line 35
    iput-object p1, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 36
    .line 37
    new-instance p1, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/au9;->c:Ljava/util/List;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/au9;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x3

    .line 8
    .line 9
    return p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/au9;->s(I)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/au9;->p(Landroid/view/View;Ll/pf60;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/qec0;->m5:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    const/4 p1, 0x3

    .line 2
    const-string p4, "p_chat_view"

    .line 3
    .line 4
    if-lt p3, p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->getCurrentPackage()Ll/vxd0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-ne p1, p3, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/au9;->c:Ljava/util/List;

    .line 25
    .line 26
    add-int/lit8 p5, p3, -0x3

    .line 27
    .line 28
    invoke-interface {p1, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ll/pf60;

    .line 33
    .line 34
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 39
    .line 40
    const-string p5, "stickers_id"

    .line 41
    .line 42
    invoke-static {p5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p1}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string p5, "e_stickers_type"

    .line 51
    .line 52
    invoke-static {p5, p4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->d()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p5

    .line 92
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_1

    .line 97
    .line 98
    const-string p1, "e_friends_emoji_entrance"

    .line 99
    .line 100
    invoke-static {p1, p4}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_2

    .line 113
    .line 114
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 119
    .line 120
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_2

    .line 125
    .line 126
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->n()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p5

    .line 140
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_2

    .line 145
    .line 146
    const-string p1, "e_chuochuo_emoji_entrance"

    .line 147
    .line 148
    invoke-static {p1, p4}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-interface {p1}, Ll/r97;->q()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_3

    .line 164
    .line 165
    const/4 p1, 0x1

    .line 166
    if-ne p3, p1, :cond_3

    .line 167
    .line 168
    iget-object p1, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->getCurrentPackage()Ll/vxd0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Ljava/lang/Integer;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-ne p1, p3, :cond_3

    .line 185
    .line 186
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 187
    .line 188
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 189
    .line 190
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/mof0;->z()Lrx/c;

    .line 193
    .line 194
    .line 195
    :cond_3
    invoke-virtual {p0, p3}, Ll/au9;->y(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->getCurrentPackage()Ll/vxd0;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object p4

    .line 208
    invoke-virtual {p1, p4}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    sget p1, Ll/edc0;->K3:I

    .line 212
    .line 213
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iget p2, p0, Ll/au9;->e:I

    .line 218
    .line 219
    if-le p3, p2, :cond_4

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    if-nez p2, :cond_4

    .line 226
    .line 227
    invoke-virtual {p0, p3}, Ll/au9;->s(I)Ll/pf60;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 232
    .line 233
    check-cast p2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 234
    .line 235
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 236
    .line 237
    const/4 p3, 0x0

    .line 238
    invoke-virtual {p0, p2, p3}, Ll/au9;->t(Ljava/lang/String;Z)Ll/jxd0;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 243
    .line 244
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    :cond_4
    return-void
.end method

.method public p(Landroid/view/View;Ll/pf60;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;II)V"
        }
    .end annotation

    .line 1
    sget p3, Ll/edc0;->G1:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    sget v0, Ll/ibc0;->W3:I

    .line 8
    .line 9
    invoke-virtual {p3, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 10
    .line 11
    .line 12
    sget p3, Ll/edc0;->o1:I

    .line 13
    .line 14
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    check-cast p3, Lv/VDraweeView;

    .line 19
    .line 20
    iget-object v0, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->n:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x0

    .line 29
    if-ge p4, v0, :cond_1

    .line 30
    .line 31
    if-nez p4, :cond_0

    .line 32
    .line 33
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    sget v2, Ll/ibc0;->Z6:I

    .line 36
    .line 37
    invoke-virtual {v0, p3, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance v0, Ll/jye;

    .line 42
    .line 43
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iget-object v3, p0, Ll/au9;->f:[Ljava/lang/String;

    .line 48
    .line 49
    aget-object v3, v3, p4

    .line 50
    .line 51
    const/high16 v4, 0x41c00000    # 24.0f

    .line 52
    .line 53
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    const/high16 v5, 0x41800000    # 16.0f

    .line 58
    .line 59
    invoke-direct {v0, v2, v3, v5, v4}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3, v0}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 67
    .line 68
    iget-object v2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->pictures:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->stickerPackage()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0, p3, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    sget p3, Ll/edc0;->K3:I

    .line 88
    .line 89
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget p3, p0, Ll/au9;->e:I

    .line 97
    .line 98
    if-le p4, p3, :cond_3

    .line 99
    .line 100
    iget-object p3, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast p3, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 103
    .line 104
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 105
    .line 106
    const/4 v0, 0x1

    .line 107
    invoke-virtual {p0, p3, v0}, Ll/au9;->t(Ljava/lang/String;Z)Ll/jxd0;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    iget-object p0, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->getCurrentPackage()Ll/vxd0;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Ljava/lang/Integer;

    .line 122
    .line 123
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-ne p0, p4, :cond_2

    .line 128
    .line 129
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 130
    .line 131
    invoke-virtual {p3, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, Ljava/lang/Boolean;

    .line 140
    .line 141
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_3

    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    :cond_3
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    const-string p3, "p_chat_view"

    .line 155
    .line 156
    if-eqz p0, :cond_4

    .line 157
    .line 158
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 159
    .line 160
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-eqz p0, :cond_4

    .line 165
    .line 166
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast p0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->d()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p4

    .line 176
    invoke-static {p0, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_4

    .line 181
    .line 182
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    const-string p0, "e_friends_emoji_entrance"

    .line 186
    .line 187
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_4
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-eqz p0, :cond_5

    .line 196
    .line 197
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 198
    .line 199
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-eqz p0, :cond_5

    .line 204
    .line 205
    iget-object p0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 206
    .line 207
    check-cast p0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->n()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_5

    .line 220
    .line 221
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    const-string p0, "e_chuochuo_emoji_entrance"

    .line 225
    .line 226
    invoke-static {p0, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_5
    return-void
.end method

.method public s(I)Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    if-le p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Ll/au9;->c:Ljava/util/List;

    .line 5
    .line 6
    add-int/lit8 p1, p1, -0x3

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/pf60;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public t(Ljava/lang/String;Z)Ll/jxd0;
    .locals 2

    .line 1
    new-instance p0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "emoji_opti_red_dot"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-direct {p0, p1, p2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public w(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/au9;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/au9;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->j:Lv/VList_Horizontal;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lv/VList_Horizontal;->setSelection(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/au9;->d:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->f:Lv/VPager;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
