.class public Ll/ent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bnt;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VSearchBar;

.field public k:Lv/VRecyclerView;

.field public l:Landroid/widget/ScrollView;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VRecyclerView;

.field public o:Lv/VText;

.field public p:Landroid/view/View;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VText;

.field public s:Lcom/p1/mobile/putong/live/base/view/ScrollRecycleView;

.field public t:Ll/bnt;

.field public final u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ent;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ent;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private i(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v0, Ll/bnl0;->e:I

    .line 13
    .line 14
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->F0()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    iget-object p0, p0, Ll/ent;->b:Landroid/widget/RelativeLayout;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->getAppTheme()Ll/ux0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/ux0;->b()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 19
    .line 20
    sget v1, Ll/nbc0;->C1:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setLeftImageRes(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 26
    .line 27
    invoke-virtual {p0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Ll/mbc0;->p:I

    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/qnp0;->e1(Landroid/widget/TextView;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ent;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 5
    .line 6
    invoke-virtual {v0}, Lv/VSearchBar;->getCancelText()Lv/VText;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/cnt;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/cnt;-><init>(Ll/ent;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ent;->a:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    new-instance v1, Ll/dnt;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/dnt;-><init>(Ll/ent;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ent;->l()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 32
    .line 33
    invoke-virtual {p0}, Lv/VSearchBar;->getCancelText()Lv/VText;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fnt;->b(Ll/ent;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/bnt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ent;->t:Ll/bnt;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bnt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ent;->d(Ll/bnt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ent;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/ent;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ent;->c:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ent;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyn0;->i(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ent;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    sget v1, Ll/m9c0;->b:I

    .line 14
    .line 15
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 23
    .line 24
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 25
    .line 26
    sget v2, Ll/m9c0;->b:I

    .line 27
    .line 28
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 39
    .line 40
    sget v1, Ll/m9c0;->c:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 50
    .line 51
    sget v1, Ll/m9c0;->c:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Ll/ent;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 66
    .line 67
    sget v1, Ll/m9c0;->A:I

    .line 68
    .line 69
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setCancelTextColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 77
    .line 78
    sget v1, Ll/nbc0;->q:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setEditTextBg(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 84
    .line 85
    sget v1, Ll/m9c0;->C:I

    .line 86
    .line 87
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setEditTextColor(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 95
    .line 96
    sget v1, Ll/m9c0;->z:I

    .line 97
    .line 98
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setEditTextHintColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 106
    .line 107
    sget v1, Ll/nbc0;->v1:I

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setLeftImageRes(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/ent;->j:Lv/VSearchBar;

    .line 113
    .line 114
    sget v1, Ll/nbc0;->w1:I

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lv/VSearchBar;->setRightImageRes(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/ent;->r:Lv/VText;

    .line 120
    .line 121
    iget-object v1, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-interface {v1}, Ll/ts2;->k()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/ent;->p:Landroid/view/View;

    .line 137
    .line 138
    iget-object v1, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-interface {v1}, Ll/ts2;->b()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Ll/ent;->g:Lv/VImage;

    .line 154
    .line 155
    invoke-static {}, Ll/jyn0;->a()Ll/ss2;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v1}, Ll/ss2;->c()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/ent;->h:Lv/VText;

    .line 167
    .line 168
    invoke-static {}, Ll/jyn0;->a()Ll/ss2;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-interface {v1}, Ll/ss2;->f()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/ent;->d:Lv/VImage;

    .line 180
    .line 181
    iget-object v1, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 182
    .line 183
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {v1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-interface {v1}, Ll/ts2;->j()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Ll/ent;->e:Lv/VText;

    .line 197
    .line 198
    iget-object p0, p0, Ll/ent;->u:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 199
    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->e:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {p0}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-interface {p0}, Ll/ts2;->g()I

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    .line 212
    .line 213
    :cond_0
    return-void
.end method
