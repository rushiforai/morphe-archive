.class public Ll/e2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x1k;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText_AutoFit;

.field public h:Lv/VPullUpRecyclerView;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public o:Lcom/p1/mobile/android/app/Act;

.field public p:Ll/x1k;

.field public q:Ll/l1k;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e2k;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/e2k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e2k;->n()V

    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/e2k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2k;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/e2k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2k;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/e2k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e2k;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/e2k;Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e2k;->q(Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2k;->o:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2k;->p:Ll/x1k;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x1k;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_presentwall_share"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e2k;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/e2k;->p:Ll/x1k;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/x1k;->x0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->F0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/e2k;->a:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 12
    .line 13
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 14
    .line 15
    iget-object v0, p0, Ll/e2k;->a:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/e2k;->n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 27
    .line 28
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 29
    .line 30
    invoke-static {}, Ll/bnl0;->F0()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    add-int/2addr v1, v2

    .line 35
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 36
    .line 37
    iget-object v1, p0, Ll/e2k;->n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object v1, p0, Ll/e2k;->d:Lv/VDraweeView;

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/e2k;->e:Lv/VText;

    .line 70
    .line 71
    iget-object v1, p0, Ll/e2k;->o:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->V4:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v2, "%s:"

    .line 84
    .line 85
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/e2k;->b:Lv/VImage;

    .line 93
    .line 94
    new-instance v1, Ll/y1k;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/y1k;-><init>(Ll/e2k;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 103
    .line 104
    const-wide/16 v1, 0x1f4

    .line 105
    .line 106
    invoke-virtual {v0, v1, v2}, Lv/VPullUpRecyclerView;->setPullUpInterval(J)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 110
    .line 111
    new-instance v1, Ll/z1k;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/z1k;-><init>(Ll/e2k;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lv/VPullUpRecyclerView;->setOnPullUpListener(Ll/x20;)V

    .line 117
    .line 118
    .line 119
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 120
    .line 121
    iget-object v1, p0, Ll/e2k;->k:Lv/VDraweeView;

    .line 122
    .line 123
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 126
    .line 127
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/e2k;->c:Landroid/widget/TextView;

    .line 147
    .line 148
    new-instance v1, Ll/a2k;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/a2k;-><init>(Ll/e2k;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Ll/l1k;

    .line 157
    .line 158
    invoke-direct {v0}, Ll/l1k;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v0, p0, Ll/e2k;->q:Ll/l1k;

    .line 162
    .line 163
    new-instance v1, Ll/b2k;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Ll/b2k;-><init>(Ll/e2k;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Ll/l1k;->J(Ll/l1k$a;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/e2k;->n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 172
    .line 173
    const/4 v1, 0x1

    .line 174
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->h:Z

    .line 175
    .line 176
    iget-object v0, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 177
    .line 178
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 179
    .line 180
    iget-object v2, p0, Ll/e2k;->o:Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    const/4 v3, 0x3

    .line 183
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 190
    .line 191
    iget-object v1, p0, Ll/e2k;->q:Ll/l1k;

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Ll/e2k;->j:Landroid/widget/LinearLayout;

    .line 197
    .line 198
    new-instance v1, Ll/c2k;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/c2k;-><init>(Ll/e2k;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_presentwall_sender"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e2k;->v()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/e2k;->p:Ll/x1k;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/x1k;->y0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A(ZLcom/p1/mobile/putong/core/data/GiftWallSocialItem;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e2k;->j:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/e2k;->j:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/e2k;->k:Lv/VDraweeView;

    .line 18
    .line 19
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->userAvatar:Ljava/lang/String;

    .line 20
    .line 21
    sget v3, Ll/qa00;->x:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/e2k;->l:Landroid/widget/TextView;

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->userName:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    const-string v1, "\u4ed6"

    .line 36
    .line 37
    const-string v2, "\u5979"

    .line 38
    .line 39
    const-string v3, "female"

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    move-object v1, v2

    .line 50
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/GiftWallSocialItem;->giftAmount:Ljava/lang/String;

    .line 51
    .line 52
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string p2, "%s\u4eca\u5929\u9001\u4e86\u4f60 %s\u4e2a\u793c\u7269\uff0c\u5feb\u53bb\u804a\u804a\u5427\uff01"

    .line 57
    .line 58
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Ll/e2k;->m:Landroid/widget/TextView;

    .line 63
    .line 64
    const-string p2, "#212121"

    .line 65
    .line 66
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    const/4 v0, 0x3

    .line 71
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {p1, p2, v0}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    move-object v1, v2

    .line 90
    :cond_3
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    const-string p2, "%s\u9001\u4f60\u7684\u793c\u7269\u6700\u591a\uff0c\u5feb\u53bb\u6253\u4e2a\u62db\u547c\u5427\uff01"

    .line 95
    .line 96
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object p0, p0, Ll/e2k;->m:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/e2k;->o:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f2k;->b(Ll/e2k;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x1k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e2k;->j(Ll/x1k;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e2k;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/e2k;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Ll/x1k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e2k;->p:Ll/x1k;

    .line 2
    .line 3
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e2k;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 8
    .line 9
    const-string v1, "\u6682\u65f6\u83b7\u53d6\u4e0d\u5230\u5730\u7406\u4f4d\u7f6e"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 15
    .line 16
    const v1, 0x3f19999a    # 0.6f

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e2k;->j:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic q(Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V
    .locals 0

    .line 1
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/NewGiftWall;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/e2k;->n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 8
    .line 9
    new-instance p2, Ll/d2k;

    .line 10
    .line 11
    invoke-direct {p2}, Ll/d2k;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2k;->n:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_presentwall"

    .line 2
    .line 3
    return-object p0
.end method

.method public w(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2k;->f:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/i1k;->g(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p2, p0, Ll/e2k;->i:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/e2k;->q:Ll/l1k;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/l1k;->I(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ll/e2k;->q:Ll/l1k;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2k;->h:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e2k;->i:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/e2k;->f:Lv/VText;

    .line 14
    .line 15
    const-string v2, "0"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 21
    .line 22
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 2
    .line 3
    const-string v1, "#212121"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x3

    .line 10
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {p1, v1, v2}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 22
    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/e2k;->c:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/e2k;->g:Lv/VText_AutoFit;

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
