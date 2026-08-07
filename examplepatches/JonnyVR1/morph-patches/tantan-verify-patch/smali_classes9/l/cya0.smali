.class public Ll/cya0;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cya0$b;,
        Ll/cya0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Ll/cya0$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:I

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/cya0$a;

.field public e:Z

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;ZILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;ZI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cya0;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cya0;->c:Ljava/util/List;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/cya0;->e:Z

    .line 9
    .line 10
    iput p4, p0, Ll/cya0;->b:I

    .line 11
    .line 12
    iput-object p5, p0, Ll/cya0;->f:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method private synthetic C(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cya0;->d:Ll/cya0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p2, 0x101

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/cya0$a;->a(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic D(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cya0;->d:Ll/cya0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 p2, 0x102

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/cya0$a;->a(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic y(Ll/cya0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/cya0;->C(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/cya0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/cya0;->D(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public E(Ll/cya0$b;I)V
    .locals 7
    .param p1    # Ll/cya0$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/cya0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/cya0;->A(Lcom/p1/mobile/putong/data/Media;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p1, Ll/cya0$b;->a:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p1, Ll/cya0$b;->b:Landroidx/constraintlayout/widget/Group;

    .line 25
    .line 26
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p1, Ll/cya0$b;->c:Landroidx/constraintlayout/widget/Group;

    .line 30
    .line 31
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p1, Ll/cya0$b;->d:Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 40
    .line 41
    new-instance v3, Ll/aya0;

    .line 42
    .line 43
    invoke-direct {v3, p0, p2}, Ll/aya0;-><init>(Ll/cya0;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p1, Ll/cya0$b;->i:Lv/VText;

    .line 50
    .line 51
    iget-object v3, p1, Ll/cya0$b;->g:Landroid/view/View;

    .line 52
    .line 53
    iget-object v5, p1, Ll/cya0$b;->f:Landroid/view/View;

    .line 54
    .line 55
    const/4 v6, 0x3

    .line 56
    new-array v6, v6, [Landroid/view/View;

    .line 57
    .line 58
    aput-object v1, v6, v4

    .line 59
    .line 60
    aput-object v3, v6, v2

    .line 61
    .line 62
    const/4 v1, 0x2

    .line 63
    aput-object v5, v6, v1

    .line 64
    .line 65
    invoke-virtual {p0, v6}, Ll/cya0;->I([Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p1, Ll/cya0$b;->i:Lv/VText;

    .line 69
    .line 70
    iget-object v3, p0, Ll/cya0;->f:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p1, Ll/cya0$b;->h:Lv/VText;

    .line 76
    .line 77
    iget-object p0, p0, Ll/cya0;->f:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    iget-object v1, p1, Ll/cya0$b;->a:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p1, Ll/cya0$b;->b:Landroidx/constraintlayout/widget/Group;

    .line 89
    .line 90
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p1, Ll/cya0$b;->c:Landroidx/constraintlayout/widget/Group;

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    iget-object v5, p1, Ll/cya0$b;->a:Lv/VDraweeView;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-virtual {v1, v5, v6, v4}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 114
    .line 115
    const/4 v5, 0x0

    .line 116
    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    iget-boolean v1, p0, Ll/cya0;->e:Z

    .line 120
    .line 121
    if-eqz v1, :cond_1

    .line 122
    .line 123
    if-lez p2, :cond_1

    .line 124
    .line 125
    iget-object v1, p1, Ll/cya0$b;->d:Landroid/widget/ImageView;

    .line 126
    .line 127
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 131
    .line 132
    new-instance v3, Ll/bya0;

    .line 133
    .line 134
    invoke-direct {v3, p0, p2}, Ll/bya0;-><init>(Ll/cya0;I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_1
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 142
    .line 143
    invoke-virtual {p0, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p1, Ll/cya0$b;->d:Landroid/widget/ImageView;

    .line 147
    .line 148
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 152
    .line 153
    if-nez p2, :cond_2

    .line 154
    .line 155
    move v1, v2

    .line 156
    goto :goto_1

    .line 157
    :cond_2
    move v1, v4

    .line 158
    :goto_1
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    if-nez p2, :cond_3

    .line 162
    .line 163
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 164
    .line 165
    sget p2, Ll/kbc0;->n:I

    .line 166
    .line 167
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 168
    .line 169
    .line 170
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    sget v0, Ll/j9c0;->o:I

    .line 177
    .line 178
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 186
    .line 187
    const-string p1, "\u5934\u50cf"

    .line 188
    .line 189
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_3
    invoke-static {}, Ll/xra;->w()Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-eqz p0, :cond_5

    .line 198
    .line 199
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 200
    .line 201
    sget p2, Ll/kbc0;->p:I

    .line 202
    .line 203
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 204
    .line 205
    .line 206
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 207
    .line 208
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    sget v1, Ll/j9c0;->b:I

    .line 213
    .line 214
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 215
    .line 216
    .line 217
    move-result p2

    .line 218
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 219
    .line 220
    .line 221
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 222
    .line 223
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-nez p0, :cond_5

    .line 228
    .line 229
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    iget-object p2, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 238
    .line 239
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    check-cast p2, Ljava/lang/String;

    .line 244
    .line 245
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    if-eqz p2, :cond_4

    .line 254
    .line 255
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 256
    .line 257
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-nez p2, :cond_4

    .line 262
    .line 263
    iget-object p2, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 264
    .line 265
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 271
    .line 272
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 273
    .line 274
    .line 275
    return-void

    .line 276
    :cond_4
    iget-object p0, p1, Ll/cya0$b;->e:Landroid/widget/TextView;

    .line 277
    .line 278
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    :cond_5
    return-void
.end method

.method public F(Landroid/view/ViewGroup;I)Ll/cya0$b;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cya0;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/sec0;->K0:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/cya0$b;

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-direct {p1, p0, p2}, Ll/cya0$b;-><init>(Landroid/view/View;Ll/dya0;)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public G(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cya0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H(Ll/cya0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cya0;->d:Ll/cya0$a;

    .line 2
    .line 3
    return-void
.end method

.method public final varargs I([Landroid/view/View;)V
    .locals 6

    .line 1
    array-length p0, p1

    .line 2
    if-lez p0, :cond_1

    .line 3
    .line 4
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 7
    .line 8
    .line 9
    array-length v0, p1

    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    if-ge v2, v0, :cond_0

    .line 13
    .line 14
    aget-object v3, p1, v2

    .line 15
    .line 16
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 17
    .line 18
    const/4 v5, 0x5

    .line 19
    new-array v5, v5, [F

    .line 20
    .line 21
    fill-array-data v5, :array_0

    .line 22
    .line 23
    .line 24
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const/4 v4, 0x1

    .line 29
    new-array v4, v4, [Landroid/animation/Animator;

    .line 30
    .line 31
    aput-object v3, v4, v1

    .line 32
    .line 33
    invoke-virtual {p0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-wide/16 v0, 0xfa0

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void

    .line 49
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getItemCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cya0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget p0, p0, Ll/cya0;->b:I

    .line 8
    .line 9
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/cya0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cya0;->E(Ll/cya0$b;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cya0;->F(Landroid/view/ViewGroup;I)Ll/cya0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
