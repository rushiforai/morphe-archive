.class public Ll/fma;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fma$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bma;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Landroidx/appcompat/widget/SearchView;

.field public e:Lv/VRecyclerView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Ll/bma;

.field public i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

.field public j:Ll/fma$d;

.field public k:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/fma$d;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/fma$d;-><init>(Ll/fma;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fma;->j:Ll/fma$d;

    .line 10
    .line 11
    new-instance v0, Ll/fma$a;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, p0, v1}, Ll/fma$a;-><init>(Ll/fma;Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/fma;->k:Landroid/os/Handler;

    .line 21
    .line 22
    iput-object p1, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/fma;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fma;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/fma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fma;->j()V

    return-void
.end method

.method public static synthetic c(Ll/fma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fma;->k()V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p0, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nma;->b(Ll/fma;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public e(Ll/bma;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fma;->h:Ll/bma;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bma;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fma;->e(Ll/bma;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fma;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fma;->j:Ll/fma$d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/fma$d;->T(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fma;->j:Ll/fma$d;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fma;->e:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/fma$b;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/fma$b;-><init>(Ll/fma;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/fma;->e:Lv/VRecyclerView;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/fma;->e:Lv/VRecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/fma;->j:Ll/fma$d;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/fma;->c:Lv/VText;

    .line 30
    .line 31
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fma;->g:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 42
    .line 43
    iget-object v1, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 44
    .line 45
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->f2:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setIconifiedByDefault(Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 61
    .line 62
    iget-object v2, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 63
    .line 64
    sget v3, Ll/ibc0;->L5:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 74
    .line 75
    sget v2, Ll/xdc0;->I:I

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v2, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 82
    .line 83
    sget v3, Ll/xdc0;->J:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    .line 90
    .line 91
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 92
    .line 93
    .line 94
    sget v3, Ll/tbc0;->H:I

    .line 95
    .line 96
    invoke-static {v2, v3}, Ll/qnp0;->e1(Landroid/widget/TextView;I)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 100
    .line 101
    sget v3, Ll/xdc0;->E:I

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Landroid/widget/ImageView;

    .line 108
    .line 109
    invoke-static {v2, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    sget v3, Ll/ibc0;->Q:I

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 115
    .line 116
    .line 117
    iget-object v3, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    sget v4, Ll/g9c0;->Y:I

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 133
    .line 134
    sget v3, Ll/xdc0;->J:I

    .line 135
    .line 136
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Landroid/widget/TextView;

    .line 141
    .line 142
    const/high16 v3, 0x41600000    # 14.0f

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 145
    .line 146
    .line 147
    const-string v3, "#222222"

    .line 148
    .line 149
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 154
    .line 155
    .line 156
    const-string v3, "#cbcbcb"

    .line 157
    .line 158
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 163
    .line 164
    .line 165
    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    .line 166
    .line 167
    const/16 v4, 0xa

    .line 168
    .line 169
    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 170
    .line 171
    .line 172
    const/4 v4, 0x1

    .line 173
    new-array v4, v4, [Landroid/text/InputFilter;

    .line 174
    .line 175
    aput-object v3, v4, v1

    .line 176
    .line 177
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 181
    .line 182
    sget v3, Ll/xdc0;->H:I

    .line 183
    .line 184
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Landroid/widget/ImageView;

    .line 189
    .line 190
    sget v3, Ll/ibc0;->R:I

    .line 191
    .line 192
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 196
    .line 197
    .line 198
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Ll/fma;->d:Landroidx/appcompat/widget/SearchView;

    .line 202
    .line 203
    new-instance v1, Ll/fma$c;

    .line 204
    .line 205
    invoke-direct {v1, p0, v2}, Ll/fma$c;-><init>(Ll/fma;Landroid/widget/ImageView;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$m;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/fma;->b:Lv/VImage;

    .line 212
    .line 213
    new-instance v1, Ll/cma;

    .line 214
    .line 215
    invoke-direct {v1, p0}, Ll/cma;-><init>(Ll/fma;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 222
    .line 223
    new-instance v1, Ll/dma;

    .line 224
    .line 225
    invoke-direct {v1, p0}, Ll/dma;-><init>(Ll/fma;)V

    .line 226
    .line 227
    .line 228
    const-wide/16 v2, 0x14

    .line 229
    .line 230
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 234
    .line 235
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->f:Ljava/lang/String;

    .line 236
    .line 237
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-nez v0, :cond_0

    .line 242
    .line 243
    iget-object v0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 244
    .line 245
    new-instance v1, Ll/ema;

    .line 246
    .line 247
    invoke-direct {v1, p0}, Ll/ema;-><init>(Ll/fma;)V

    .line 248
    .line 249
    .line 250
    const-wide/16 v2, 0xc8

    .line 251
    .line 252
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 253
    .line 254
    .line 255
    :cond_0
    return-void
.end method
