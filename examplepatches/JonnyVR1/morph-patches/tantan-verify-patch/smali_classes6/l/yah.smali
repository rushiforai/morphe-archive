.class public Ll/yah;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VButton;

.field public f:Lv/VRelative;

.field public g:Landroid/widget/TextView;

.field public h:Landroidx/recyclerview/widget/RecyclerView;

.field public i:Ljava/lang/Runnable;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ljava/lang/Runnable;

.field public l:Z

.field public m:Ll/n6h;

.field public n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public o:Ll/l4g0;

.field public p:Ll/l4g0;

.field public q:Z

.field public r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Ll/yah;->q:Z

    .line 6
    .line 7
    new-instance p2, Ll/yah$c;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/yah$c;-><init>(Ll/yah;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/yah;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/yah;->w(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic q(Ll/yah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yah;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/yah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yah;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/yah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yah;->y(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic t(Ll/yah;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yah;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private v()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yah;->a:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/vah;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vah;-><init>(Ll/yah;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/yah;->e:Lv/VButton;

    .line 12
    .line 13
    new-instance v1, Ll/wah;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wah;-><init>(Ll/yah;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/yah;->g:Landroid/widget/TextView;

    .line 22
    .line 23
    new-instance v1, Ll/xah;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/xah;-><init>(Ll/yah;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private w(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/yah;->j:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-class p1, Landroid/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_circle_joined_popup"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/yah;->p:Ll/l4g0;

    .line 16
    .line 17
    const-string v0, "p_circle_detail_join_popup"

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/yah;->o:Ll/l4g0;

    .line 28
    .line 29
    sget p1, Ll/tec0;->X0:I

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 v0, -0x1

    .line 43
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 44
    .line 45
    const/4 v0, -0x2

    .line 46
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 47
    .line 48
    const/16 v0, 0x11

    .line 49
    .line 50
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    sget p1, Ll/hdc0;->z1:I

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lv/VImage;

    .line 66
    .line 67
    iput-object p1, p0, Ll/yah;->a:Lv/VImage;

    .line 68
    .line 69
    sget p1, Ll/hdc0;->U:I

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lv/VDraweeView;

    .line 76
    .line 77
    iput-object p1, p0, Ll/yah;->b:Lv/VDraweeView;

    .line 78
    .line 79
    sget p1, Ll/hdc0;->A:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Landroid/widget/TextView;

    .line 86
    .line 87
    iput-object p1, p0, Ll/yah;->c:Landroid/widget/TextView;

    .line 88
    .line 89
    sget p1, Ll/hdc0;->M1:I

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Landroid/widget/TextView;

    .line 96
    .line 97
    iput-object p1, p0, Ll/yah;->d:Landroid/widget/TextView;

    .line 98
    .line 99
    sget p1, Ll/hdc0;->v1:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lv/VButton;

    .line 106
    .line 107
    iput-object p1, p0, Ll/yah;->e:Lv/VButton;

    .line 108
    .line 109
    sget p1, Ll/hdc0;->A0:I

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lv/VRelative;

    .line 116
    .line 117
    iput-object p1, p0, Ll/yah;->f:Lv/VRelative;

    .line 118
    .line 119
    sget p1, Ll/hdc0;->X1:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Landroid/widget/TextView;

    .line 126
    .line 127
    iput-object p1, p0, Ll/yah;->g:Landroid/widget/TextView;

    .line 128
    .line 129
    sget p1, Ll/hdc0;->T:I

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 136
    .line 137
    iput-object p1, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/yah;->D()V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Ll/yah;->d:Landroid/widget/TextView;

    .line 143
    .line 144
    iget-boolean v0, p0, Ll/yah;->q:Z

    .line 145
    .line 146
    const/4 v1, 0x1

    .line 147
    xor-int/2addr v0, v1

    .line 148
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/yah;->e:Lv/VButton;

    .line 152
    .line 153
    iget-boolean v0, p0, Ll/yah;->q:Z

    .line 154
    .line 155
    xor-int/2addr v0, v1

    .line 156
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/yah;->f:Lv/VRelative;

    .line 160
    .line 161
    iget-boolean v0, p0, Ll/yah;->l:Z

    .line 162
    .line 163
    const/4 v2, 0x0

    .line 164
    if-nez v0, :cond_0

    .line 165
    .line 166
    iget-boolean v0, p0, Ll/yah;->q:Z

    .line 167
    .line 168
    if-eqz v0, :cond_0

    .line 169
    .line 170
    move v0, v1

    .line 171
    goto :goto_0

    .line 172
    :cond_0
    move v0, v2

    .line 173
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 177
    .line 178
    iget-boolean v0, p0, Ll/yah;->l:Z

    .line 179
    .line 180
    if-nez v0, :cond_1

    .line 181
    .line 182
    iget-boolean v0, p0, Ll/yah;->q:Z

    .line 183
    .line 184
    if-eqz v0, :cond_1

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_1
    move v1, v2

    .line 188
    :goto_1
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    invoke-direct {p0}, Ll/yah;->v()V

    .line 192
    .line 193
    .line 194
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 195
    .line 196
    iget-object v0, p0, Ll/yah;->b:Lv/VDraweeView;

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 211
    .line 212
    const/high16 v2, 0x42600000    # 56.0f

    .line 213
    .line 214
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ll/yah;->A()V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yah;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    return-void
.end method

.method public C(Ljava/lang/Runnable;)Ll/yah;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yah;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public D()V
    .locals 4

    .line 1
    new-instance v0, Ll/n6h;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yah;->j:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    new-instance v2, Ll/yah$a;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/yah$a;-><init>(Ll/yah;)V

    .line 8
    .line 9
    .line 10
    const-string v3, "p_circle_joined_popup"

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/n6h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/h80;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/yah;->m:Ll/n6h;

    .line 16
    .line 17
    new-instance v0, Ll/yah$b;

    .line 18
    .line 19
    iget-object v1, p0, Ll/yah;->j:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Ll/yah$b;-><init>(Ll/yah;Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    iget-object p0, p0, Ll/yah;->m:Ll/n6h;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public E(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/yah;->f:Lv/VRelative;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/yah;->l:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    move v1, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    iget-boolean v1, p0, Ll/yah;->l:Z

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    move v2, v3

    .line 34
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/yah;->m:Ll/n6h;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/n6h;->M(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public F(Ljava/lang/String;)Ll/yah;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yah;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public G(Z)Ll/yah;
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/yah;->l:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/yah;->c:Landroid/widget/TextView;

    .line 6
    .line 7
    const/high16 v0, 0x41d00000    # 26.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public H(Z)Ll/yah;
    .locals 4

    .line 1
    iput-boolean p1, p0, Ll/yah;->q:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/yah;->d:Landroid/widget/TextView;

    .line 4
    .line 5
    xor-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yah;->e:Lv/VButton;

    .line 11
    .line 12
    xor-int/lit8 v1, p1, 0x1

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/yah;->f:Lv/VRelative;

    .line 18
    .line 19
    iget-boolean v1, p0, Ll/yah;->l:Z

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    move v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v1, v2

    .line 30
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/yah;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 34
    .line 35
    iget-boolean v1, p0, Ll/yah;->l:Z

    .line 36
    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    move v2, v3

    .line 42
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    const-string p1, "album_post_source"

    .line 48
    .line 49
    const-string v0, "circle_ popup"

    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {p1}, [Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v0, "e_moment_post"

    .line 60
    .line 61
    const-string v1, "p_circle_detail_join_popup"

    .line 62
    .line 63
    invoke-static {v0, v1, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-object p0
.end method

.method public I(Ljava/lang/Runnable;)Ll/yah;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yah;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public dismiss()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yah;->p:Ll/l4g0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Ll/yah;->q:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/yah;->p:Ll/l4g0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/yah;->o:Ll/l4g0;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/yah;->o:Ll/l4g0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/yah;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 17
    .line 18
    iget-object v1, p0, Ll/yah;->j:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/lbc0;->K0:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/yah;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    const/4 v1, 0x3

    .line 36
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/yah;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 40
    .line 41
    iget-object v1, p0, Ll/yah;->r:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/yah;->p:Ll/l4g0;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-boolean v1, p0, Ll/yah;->q:Z

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/yah;->p:Ll/l4g0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    iget-object v0, p0, Ll/yah;->o:Ll/l4g0;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/yah;->o:Ll/l4g0;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public u(Ljava/lang/CharSequence;)Ll/yah;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yah;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/yah;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/yah;->i:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/yah;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/yah;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/yah;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/yah;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
