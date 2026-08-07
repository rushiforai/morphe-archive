.class public Ll/e2a$a;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/e2a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/data/StickerPackage;

.field public d:Z

.field public final synthetic e:Ll/e2a;


# direct methods
.method public constructor <init>(Ll/e2a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/e2a$a;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 11
    .line 12
    new-instance p0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic p(Ll/e2a$a;Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e2a$a;->z(Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/e2a$a;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e2a$a;->A(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/e2a$a;)Lcom/p1/mobile/putong/core/data/StickerPackage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a$a;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/e2a;->i(Ll/e2a;)Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/tcz;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/core/data/StickerPackage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e2a$a;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/e2a$a;->d:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 4
    .line 5
    invoke-static {v0}, Ll/e2a;->i(Ll/e2a;)Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    xor-int/lit8 v1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 12
    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 17
    .line 18
    iget-object p0, p0, Ll/e2a;->k:Lv/VText;

    .line 19
    .line 20
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->i6:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a$a;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2a$a;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
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
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e2a$a;->w(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/qec0;->s1:I

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/bnl0;->y0()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/high16 v0, 0x41c00000    # 24.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sub-int/2addr p2, v0

    .line 31
    div-int/lit8 p2, p2, 0x4

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 41
    .line 42
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    return-object p0
.end method

.method public w(Landroid/view/View;Ljava/lang/String;II)V
    .locals 5

    .line 1
    check-cast p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    sget p3, Ll/edc0;->C1:I

    .line 4
    .line 5
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    check-cast p3, Lv/VDraweeView;

    .line 10
    .line 11
    sget p4, Ll/edc0;->S3:I

    .line 12
    .line 13
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    check-cast p4, Lv/VCheckBox;

    .line 18
    .line 19
    sget v0, Ll/edc0;->l4:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VText;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 30
    .line 31
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    sget v1, Ll/edc0;->K1:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lv/VText;

    .line 42
    .line 43
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_5

    .line 48
    .line 49
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_5

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 61
    .line 62
    const-string v3, "shanmeng"

    .line 63
    .line 64
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/4 v3, 0x0

    .line 69
    if-eqz v2, :cond_0

    .line 70
    .line 71
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 80
    .line 81
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2, p3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_0
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 96
    .line 97
    invoke-virtual {p0, v4}, Ll/e2a$a;->D(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v2, p3, v4}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    iget-boolean p3, p0, Ll/e2a$a;->d:Z

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    if-eqz p3, :cond_2

    .line 108
    .line 109
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p4, v3}, Landroid/view/View;->setClickable(Z)V

    .line 113
    .line 114
    .line 115
    iget-object p3, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 116
    .line 117
    invoke-static {p3}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    iget-object v4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p3, v4}, Ll/v1a;->n0(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    move-result p3

    .line 127
    const/4 v4, -0x1

    .line 128
    if-eq p3, v4, :cond_1

    .line 129
    .line 130
    invoke-virtual {p4, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 131
    .line 132
    .line 133
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    new-instance v4, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    add-int/2addr p3, v2

    .line 142
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string p3, ""

    .line 146
    .line 147
    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_1
    invoke-virtual {p4, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 159
    .line 160
    .line 161
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    :goto_1
    new-instance p3, Ll/c2a;

    .line 165
    .line 166
    invoke-direct {p3, p0, p4, p2, v1}, Ll/c2a;-><init>(Ll/e2a$a;Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;)V

    .line 167
    .line 168
    .line 169
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_2
    invoke-virtual {p4, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 174
    .line 175
    .line 176
    invoke-static {p4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    new-instance p3, Ll/d2a;

    .line 183
    .line 184
    invoke-direct {p3, p0, p2}, Ll/d2a;-><init>(Ll/e2a$a;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    :goto_2
    const-string p0, "pending"

    .line 191
    .line 192
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-eqz p0, :cond_3

    .line 199
    .line 200
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->l6:I

    .line 204
    .line 205
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_3
    const-string p0, "banned"

    .line 210
    .line 211
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_4

    .line 218
    .line 219
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->p6:I

    .line 223
    .line 224
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :cond_4
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 229
    .line 230
    .line 231
    return-void

    .line 232
    :cond_5
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 233
    .line 234
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 235
    .line 236
    .line 237
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/e2a$a;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic z(Lv/VCheckBox;Lcom/p1/mobile/putong/core/data/Sticker;Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    const-string v0, ")"

    .line 6
    .line 7
    const-string v1, "("

    .line 8
    .line 9
    if-nez p4, :cond_1

    .line 10
    .line 11
    iget-object p4, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 12
    .line 13
    invoke-static {p4}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p4}, Ll/v1a;->p0()Z

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    if-nez p4, :cond_0

    .line 22
    .line 23
    const/4 p4, 0x1

    .line 24
    invoke-virtual {p1, p4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 28
    .line 29
    invoke-static {p1}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ll/v1a;->k0(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p1, ""

    .line 51
    .line 52
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 63
    .line 64
    iget-object p1, p1, Ll/e2a;->k:Lv/VText;

    .line 65
    .line 66
    new-instance p2, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object p3, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 72
    .line 73
    invoke-static {p3}, Ll/e2a;->i(Ll/e2a;)Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->i6:I

    .line 78
    .line 79
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 90
    .line 91
    invoke-static {p0}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/v1a;->m0()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->o6:I

    .line 114
    .line 115
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_1
    const/4 p3, 0x0

    .line 120
    invoke-virtual {p1, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 124
    .line 125
    invoke-static {p1}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Ll/v1a;->z0(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 135
    .line 136
    invoke-static {p1}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Ll/v1a;->m0()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    iget-object p2, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 145
    .line 146
    if-lez p1, :cond_2

    .line 147
    .line 148
    iget-object p1, p2, Ll/e2a;->k:Lv/VText;

    .line 149
    .line 150
    new-instance p2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    iget-object p3, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 156
    .line 157
    invoke-static {p3}, Ll/e2a;->i(Ll/e2a;)Lcom/p1/mobile/putong/core/ui/messages/meme/CoreMyCustomMemeAct;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->i6:I

    .line 162
    .line 163
    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object p3, p0, Ll/e2a$a;->e:Ll/e2a;

    .line 174
    .line 175
    invoke-static {p3}, Ll/e2a;->j(Ll/e2a;)Ll/v1a;

    .line 176
    .line 177
    .line 178
    move-result-object p3

    .line 179
    invoke-virtual {p3}, Ll/v1a;->m0()I

    .line 180
    .line 181
    .line 182
    move-result p3

    .line 183
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_2
    iget-object p1, p2, Ll/e2a;->k:Lv/VText;

    .line 198
    .line 199
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->i6:I

    .line 200
    .line 201
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 202
    .line 203
    .line 204
    :goto_0
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 205
    .line 206
    .line 207
    return-void
.end method
