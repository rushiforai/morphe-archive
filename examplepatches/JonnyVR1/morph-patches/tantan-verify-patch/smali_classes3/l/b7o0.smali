.class public Ll/b7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x6o0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroid/app/Dialog;

.field public l:Ll/x6o0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/b7o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b7o0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/b7o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b7o0;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/b7o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b7o0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b7o0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b7o0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/b7o0;->l:Ll/x6o0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/b7o0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/c0s;

    .line 21
    .line 22
    iget-object v2, p0, Ll/b7o0;->l:Ll/x6o0;

    .line 23
    .line 24
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 28
    .line 29
    iget-object v1, p0, Ll/b7o0;->d:Lv/VImage;

    .line 30
    .line 31
    new-instance v2, Ll/y6o0;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/y6o0;-><init>(Ll/b7o0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/b7o0;->a:Landroid/view/View;

    .line 40
    .line 41
    new-instance v2, Ll/z6o0;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/z6o0;-><init>(Ll/b7o0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v3, p0, Ll/b7o0;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 50
    .line 51
    const/high16 v1, 0x41c00000    # 24.0f

    .line 52
    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    neg-int v7, v2

    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v8

    .line 62
    const/4 v4, 0x0

    .line 63
    const/4 v5, 0x0

    .line 64
    const/4 v6, 0x0

    .line 65
    invoke-static/range {v3 .. v8}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/xlj;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-direct {v1, v0}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 79
    .line 80
    .line 81
    sget-object v0, Ll/h1e0;->i:Ll/h1e0;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ll/xlj;->v(Ll/h1e0;)Ll/xlj;

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/b7o0;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->getDraweeView()Lv/VDraweeView;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v1}, Ll/xlj;->a()Ll/wlj;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c7o0;->b(Ll/b7o0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/x6o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b7o0;->l:Ll/x6o0;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/b7o0;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->a()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x6o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b7o0;->e(Ll/x6o0;)V

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

.method public final synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b7o0;->l:Ll/x6o0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->gotoUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/x6o0;->J3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->isLight()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/b7o0;->j:Lv/VText;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/b7o0;->j:Lv/VText;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->getDescribe:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/b7o0;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->getDraweeView()Lv/VDraweeView;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/b7o0;->i:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance v0, Landroid/graphics/ColorMatrix;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    .line 45
    .line 46
    invoke-direct {v2, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/b7o0;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->getDraweeView()Lv/VDraweeView;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0, v2}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/b7o0;->i:Lv/VText;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/b7o0;->j:Lv/VText;

    .line 65
    .line 66
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object v0, p0, Ll/b7o0;->f:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->isHaveLightButton()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/b7o0;->c:Lv/VDraweeView;

    .line 79
    .line 80
    sget-object v2, Ll/zft;->M:Ljava/lang/String;

    .line 81
    .line 82
    const-string v3, "context_single_room"

    .line 83
    .line 84
    invoke-static {v3, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/b7o0;->e:Lv/VText;

    .line 88
    .line 89
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->name:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/b7o0;->i:Lv/VText;

    .line 95
    .line 96
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->describe:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/b7o0;->f:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->isOver()Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    xor-int/2addr v1, v2

    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->isOver()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_1

    .line 116
    .line 117
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->gotoUrl:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_1

    .line 124
    .line 125
    iget-object v0, p0, Ll/b7o0;->f:Lv/VText;

    .line 126
    .line 127
    new-instance v1, Ll/a7o0;

    .line 128
    .line 129
    invoke-direct {v1, p0, p1}, Ll/a7o0;-><init>(Ll/b7o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/b7o0;->f:Lv/VText;

    .line 136
    .line 137
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->bi:I

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->isOver()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    iget-object v0, p0, Ll/b7o0;->f:Lv/VText;

    .line 150
    .line 151
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zh:I

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 154
    .line 155
    .line 156
    :cond_2
    :goto_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->dynamicIcon:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->icon:Ljava/lang/String;

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->dynamicIcon:Ljava/lang/String;

    .line 168
    .line 169
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_4

    .line 174
    .line 175
    return-void

    .line 176
    :cond_4
    const-string v0, ".svga"

    .line 177
    .line 178
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    iget-object p0, p0, Ll/b7o0;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 183
    .line 184
    const-string v1, ""

    .line 185
    .line 186
    if-eqz v0, :cond_5

    .line 187
    .line 188
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :cond_5
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b7o0;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/b7o0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/b7o0;->k:Landroid/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
