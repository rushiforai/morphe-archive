.class public Ll/nqy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nqy$a;,
        Ll/nqy$c;,
        Ll/nqy$d;,
        Ll/nqy$b;
    }
.end annotation


# instance fields
.field public A:Ll/pej0;

.field public B:Lv/VMenuBar;

.field public C:Landroidx/recyclerview/widget/RecyclerView;

.field public D:Landroid/view/ViewStub;

.field public E:Landroid/view/ViewStub;

.field public F:Landroid/view/View;

.field public G:Landroid/view/View;

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:I

.field public L:I

.field public M:F

.field public N:Landroid/view/View;

.field public O:Landroid/widget/FrameLayout;

.field public P:I

.field public Q:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public R:Landroid/view/View;

.field public S:Landroid/view/View;

.field public T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public U:I

.field public V:I

.field public a:Ljava/lang/CharSequence;

.field public b:I

.field public c:Ljava/lang/CharSequence;

.field public d:Ljava/lang/CharSequence;

.field public e:I

.field public f:F

.field public g:I

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Landroid/view/View$OnClickListener;

.field public q:Landroid/view/View$OnClickListener;

.field public r:Landroid/view/View$OnClickListener;

.field public s:Landroid/content/DialogInterface$OnCancelListener;

.field public t:Landroid/content/DialogInterface$OnShowListener;

.field public u:Landroid/content/DialogInterface$OnDismissListener;

.field public v:Z

.field public w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation
.end field

.field public x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field public y:Landroidx/recyclerview/widget/RecyclerView$o;

.field public z:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/nqy$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/nqy;->L:I

    .line 6
    .line 7
    const/high16 v0, -0x40800000    # -1.0f

    .line 8
    .line 9
    iput v0, p0, Ll/nqy;->M:F

    .line 10
    .line 11
    invoke-static {p1}, Ll/nqy$a;->C(Ll/nqy$a;)Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/nqy;->a:Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {p1}, Ll/nqy$a;->D(Ll/nqy$a;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Ll/nqy;->b:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/nqy$a;->v(Ll/nqy$a;)Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/nqy;->c:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-static {p1}, Ll/nqy$a;->y(Ll/nqy$a;)Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/nqy;->d:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-static {p1}, Ll/nqy$a;->z(Ll/nqy$a;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/nqy;->e:I

    .line 40
    .line 41
    invoke-static {p1}, Ll/nqy$a;->B(Ll/nqy$a;)F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Ll/nqy;->f:F

    .line 46
    .line 47
    invoke-static {p1}, Ll/nqy$a;->A(Ll/nqy$a;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/nqy;->g:I

    .line 52
    .line 53
    invoke-static {p1}, Ll/nqy$a;->u(Ll/nqy$a;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Ll/nqy;->h:I

    .line 58
    .line 59
    invoke-static {p1}, Ll/nqy$a;->x(Ll/nqy$a;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Ll/nqy;->i:I

    .line 64
    .line 65
    invoke-static {p1}, Ll/nqy$a;->c(Ll/nqy$a;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iput-boolean v0, p0, Ll/nqy;->j:Z

    .line 70
    .line 71
    invoke-static {p1}, Ll/nqy$a;->d(Ll/nqy$a;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput-boolean v0, p0, Ll/nqy;->k:Z

    .line 76
    .line 77
    invoke-static {p1}, Ll/nqy$a;->m(Ll/nqy$a;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Ll/nqy;->l:I

    .line 82
    .line 83
    invoke-static {p1}, Ll/nqy$a;->k(Ll/nqy$a;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput v0, p0, Ll/nqy;->m:I

    .line 88
    .line 89
    invoke-static {p1}, Ll/nqy$a;->J(Ll/nqy$a;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iput v0, p0, Ll/nqy;->o:I

    .line 94
    .line 95
    invoke-static {p1}, Ll/nqy$a;->K(Ll/nqy$a;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iput v0, p0, Ll/nqy;->n:I

    .line 100
    .line 101
    invoke-static {p1}, Ll/nqy$a;->t(Ll/nqy$a;)Landroid/view/View$OnClickListener;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Ll/nqy;->p:Landroid/view/View$OnClickListener;

    .line 106
    .line 107
    invoke-static {p1}, Ll/nqy$a;->w(Ll/nqy$a;)Landroid/view/View$OnClickListener;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Ll/nqy;->q:Landroid/view/View$OnClickListener;

    .line 112
    .line 113
    invoke-static {p1}, Ll/nqy$a;->q(Ll/nqy$a;)Landroid/view/View$OnClickListener;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Ll/nqy;->r:Landroid/view/View$OnClickListener;

    .line 118
    .line 119
    invoke-static {p1}, Ll/nqy$a;->E(Ll/nqy$a;)Landroid/content/DialogInterface$OnCancelListener;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Ll/nqy;->s:Landroid/content/DialogInterface$OnCancelListener;

    .line 124
    .line 125
    invoke-static {p1}, Ll/nqy$a;->H(Ll/nqy$a;)Landroid/content/DialogInterface$OnShowListener;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Ll/nqy;->t:Landroid/content/DialogInterface$OnShowListener;

    .line 130
    .line 131
    invoke-static {p1}, Ll/nqy$a;->F(Ll/nqy$a;)Landroid/content/DialogInterface$OnDismissListener;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Ll/nqy;->u:Landroid/content/DialogInterface$OnDismissListener;

    .line 136
    .line 137
    invoke-static {p1}, Ll/nqy$a;->G(Ll/nqy$a;)Ll/nqy$c;

    .line 138
    .line 139
    .line 140
    invoke-static {p1}, Ll/nqy$a;->L(Ll/nqy$a;)Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput-boolean v0, p0, Ll/nqy;->v:Z

    .line 145
    .line 146
    invoke-static {p1}, Ll/nqy$a;->e(Ll/nqy$a;)Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Ll/nqy;->w:Ljava/util/List;

    .line 151
    .line 152
    invoke-static {p1}, Ll/nqy$a;->b(Ll/nqy$a;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 157
    .line 158
    invoke-static {p1}, Ll/nqy$a;->n(Ll/nqy$a;)Landroidx/recyclerview/widget/RecyclerView$o;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Ll/nqy;->y:Landroidx/recyclerview/widget/RecyclerView$o;

    .line 163
    .line 164
    invoke-static {p1}, Ll/nqy$a;->j(Ll/nqy$a;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    iput-boolean v0, p0, Ll/nqy;->H:Z

    .line 169
    .line 170
    invoke-static {p1}, Ll/nqy$a;->i(Ll/nqy$a;)Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    iput-boolean v0, p0, Ll/nqy;->I:Z

    .line 175
    .line 176
    invoke-static {p1}, Ll/nqy$a;->l(Ll/nqy$a;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iput-boolean v0, p0, Ll/nqy;->J:Z

    .line 181
    .line 182
    invoke-static {p1}, Ll/nqy$a;->r(Ll/nqy$a;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iput v0, p0, Ll/nqy;->K:I

    .line 187
    .line 188
    invoke-static {p1}, Ll/nqy$a;->s(Ll/nqy$a;)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iput-object v0, p0, Ll/nqy;->N:Landroid/view/View;

    .line 193
    .line 194
    invoke-static {p1}, Ll/nqy$a;->a(Ll/nqy$a;)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    iput v0, p0, Ll/nqy;->L:I

    .line 199
    .line 200
    invoke-static {p1}, Ll/nqy$a;->I(Ll/nqy$a;)F

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    iput v0, p0, Ll/nqy;->M:F

    .line 205
    .line 206
    invoke-static {p1}, Ll/nqy$a;->M(Ll/nqy$a;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iput v0, p0, Ll/nqy;->P:I

    .line 211
    .line 212
    invoke-static {p1}, Ll/nqy$a;->h(Ll/nqy$a;)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Ll/nqy;->R:Landroid/view/View;

    .line 217
    .line 218
    invoke-static {p1}, Ll/nqy$a;->g(Ll/nqy$a;)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iput-object v0, p0, Ll/nqy;->S:Landroid/view/View;

    .line 223
    .line 224
    invoke-static {p1}, Ll/nqy$a;->o(Ll/nqy$a;)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iput v0, p0, Ll/nqy;->U:I

    .line 229
    .line 230
    invoke-static {p1}, Ll/nqy$a;->p(Ll/nqy$a;)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    iput v0, p0, Ll/nqy;->V:I

    .line 235
    .line 236
    invoke-static {p1}, Ll/nqy$a;->f(Ll/nqy$a;)Landroid/content/Context;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    iput-object p1, p0, Ll/nqy;->z:Landroid/content/Context;

    .line 241
    .line 242
    return-void
.end method

.method public synthetic constructor <init>(Ll/nqy$a;Ll/pqy;)V
    .locals 0

    .line 243
    invoke-direct {p0, p1}, Ll/nqy;-><init>(Ll/nqy$a;)V

    return-void
.end method

.method public static synthetic a(Ll/nqy;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nqy;->e(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    iget-object p0, p0, Ll/nqy;->A:Ll/pej0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c(I)Landroid/view/View;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(I)TV;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/nqy;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqy;->A:Ll/pej0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic e(Landroid/content/DialogInterface;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 6
    .line 7
    iget v1, p0, Ll/nqy;->L:I

    .line 8
    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/nqy;->T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget v1, p0, Ll/nqy;->M:F

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    cmpl-float v2, v1, v2

    .line 21
    .line 22
    if-lez v2, :cond_1

    .line 23
    .line 24
    int-to-float v0, v0

    .line 25
    mul-float/2addr v0, v1

    .line 26
    float-to-int v0, v0

    .line 27
    iget-object v1, p0, Ll/nqy;->T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-boolean v1, p0, Ll/nqy;->J:Z

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Ll/nqy;->T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_9

    .line 49
    .line 50
    iget-object v0, p0, Ll/nqy;->F:Landroid/view/View;

    .line 51
    .line 52
    const/4 v1, -0x1

    .line 53
    const/4 v2, 0x0

    .line 54
    if-nez v0, :cond_4

    .line 55
    .line 56
    iget v0, p0, Ll/nqy;->n:I

    .line 57
    .line 58
    if-le v0, v1, :cond_3

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    sget v0, Ll/qa00;->o:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    iget-boolean v3, p0, Ll/nqy;->H:Z

    .line 65
    .line 66
    if-eqz v3, :cond_5

    .line 67
    .line 68
    move v0, v2

    .line 69
    goto :goto_1

    .line 70
    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    :goto_1
    iget-object v3, p0, Ll/nqy;->G:Landroid/view/View;

    .line 75
    .line 76
    if-nez v3, :cond_7

    .line 77
    .line 78
    iget v3, p0, Ll/nqy;->o:I

    .line 79
    .line 80
    if-le v3, v1, :cond_6

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_6
    sget v3, Ll/qa00;->E:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_7
    iget-boolean v1, p0, Ll/nqy;->I:Z

    .line 87
    .line 88
    if-eqz v1, :cond_8

    .line 89
    .line 90
    move v3, v2

    .line 91
    goto :goto_2

    .line 92
    :cond_8
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    :goto_2
    iget-object v1, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 97
    .line 98
    invoke-virtual {v1, v2, v0, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    const/4 v1, 0x6

    .line 108
    if-le v0, v1, :cond_9

    .line 109
    .line 110
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 113
    .line 114
    .line 115
    :cond_9
    iget-boolean v0, p0, Ll/nqy;->H:Z

    .line 116
    .line 117
    const/high16 v1, 0x40000000    # 2.0f

    .line 118
    .line 119
    if-eqz v0, :cond_a

    .line 120
    .line 121
    iget-object v0, p0, Ll/nqy;->F:Landroid/view/View;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 124
    .line 125
    .line 126
    :cond_a
    iget-boolean v0, p0, Ll/nqy;->I:Z

    .line 127
    .line 128
    if-eqz v0, :cond_b

    .line 129
    .line 130
    iget-object v0, p0, Ll/nqy;->G:Landroid/view/View;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 133
    .line 134
    .line 135
    :cond_b
    iget-object p0, p0, Ll/nqy;->t:Landroid/content/DialogInterface$OnShowListener;

    .line 136
    .line 137
    if-eqz p0, :cond_c

    .line 138
    .line 139
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 140
    .line 141
    .line 142
    :cond_c
    return-void
.end method

.method public f()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 2
    .line 3
    if-nez v0, :cond_10

    .line 4
    .line 5
    new-instance v0, Ll/pej0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/nqy;->z:Landroid/content/Context;

    .line 8
    .line 9
    iget v2, p0, Ll/nqy;->P:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 15
    .line 16
    iget-object v0, p0, Ll/nqy;->z:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v1, v0, Ll/r1e;

    .line 23
    .line 24
    if-eqz v1, :cond_f

    .line 25
    .line 26
    iget-object v1, p0, Ll/nqy;->A:Ll/pej0;

    .line 27
    .line 28
    check-cast v0, Ll/r1e;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ll/pej0;->w(Ll/r1e;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 34
    .line 35
    sget v1, Ll/gec0;->p:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 41
    .line 42
    iget-boolean v1, p0, Ll/nqy;->j:Z

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 48
    .line 49
    iget-boolean v1, p0, Ll/nqy;->k:Z

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 55
    .line 56
    iget-object v1, p0, Ll/nqy;->s:Landroid/content/DialogInterface$OnCancelListener;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 62
    .line 63
    new-instance v1, Ll/mqy;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/mqy;-><init>(Ll/nqy;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/nqy;->u:Landroid/content/DialogInterface$OnDismissListener;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget v1, Ll/vcc0;->E:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Landroid/widget/FrameLayout;

    .line 91
    .line 92
    iput-object v0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Ll/nqy;->T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 99
    .line 100
    const/4 v1, 0x3

    .line 101
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/nqy;->T:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 108
    .line 109
    .line 110
    iget-boolean v0, p0, Ll/nqy;->J:Z

    .line 111
    .line 112
    const/4 v1, -0x1

    .line 113
    if-eqz v0, :cond_0

    .line 114
    .line 115
    iget-object v0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    iget v0, p0, Ll/nqy;->L:I

    .line 125
    .line 126
    if-lez v0, :cond_1

    .line 127
    .line 128
    iget-object v0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget v2, p0, Ll/nqy;->L:I

    .line 135
    .line 136
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_1
    iget v0, p0, Ll/nqy;->M:F

    .line 140
    .line 141
    const/4 v2, 0x0

    .line 142
    cmpl-float v0, v0, v2

    .line 143
    .line 144
    if-lez v0, :cond_2

    .line 145
    .line 146
    iget-object v0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 147
    .line 148
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 157
    .line 158
    int-to-float v2, v2

    .line 159
    iget v3, p0, Ll/nqy;->M:F

    .line 160
    .line 161
    mul-float/2addr v2, v3

    .line 162
    float-to-int v2, v2

    .line 163
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 164
    .line 165
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/nqy;->O:Landroid/widget/FrameLayout;

    .line 166
    .line 167
    sget v2, Ll/abc0;->w:I

    .line 168
    .line 169
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 173
    .line 174
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const v2, 0x3e99999a    # 0.3f

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v2}, Landroid/view/Window;->setDimAmount(F)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 185
    .line 186
    sget v2, Ll/vcc0;->i0:I

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Lv/VMenuBar;

    .line 193
    .line 194
    iput-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 195
    .line 196
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 197
    .line 198
    sget v2, Ll/vcc0;->z:I

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 205
    .line 206
    iput-object v0, p0, Ll/nqy;->Q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 207
    .line 208
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 209
    .line 210
    sget v2, Ll/vcc0;->P:I

    .line 211
    .line 212
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Landroid/view/ViewStub;

    .line 217
    .line 218
    iput-object v0, p0, Ll/nqy;->D:Landroid/view/ViewStub;

    .line 219
    .line 220
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 221
    .line 222
    sget v2, Ll/vcc0;->M:I

    .line 223
    .line 224
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Landroid/view/ViewStub;

    .line 229
    .line 230
    iput-object v0, p0, Ll/nqy;->E:Landroid/view/ViewStub;

    .line 231
    .line 232
    iget-object v0, p0, Ll/nqy;->A:Ll/pej0;

    .line 233
    .line 234
    sget v2, Ll/vcc0;->A:I

    .line 235
    .line 236
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 241
    .line 242
    iput-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 243
    .line 244
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 245
    .line 246
    iget-object v2, p0, Ll/nqy;->c:Ljava/lang/CharSequence;

    .line 247
    .line 248
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setLeftTextView(Ljava/lang/CharSequence;)V

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 252
    .line 253
    iget-object v2, p0, Ll/nqy;->a:Ljava/lang/CharSequence;

    .line 254
    .line 255
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setCenterTextView(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 259
    .line 260
    iget-object v2, p0, Ll/nqy;->d:Ljava/lang/CharSequence;

    .line 261
    .line 262
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightTextView(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 266
    .line 267
    iget v2, p0, Ll/nqy;->e:I

    .line 268
    .line 269
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightTextColor(I)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 273
    .line 274
    iget v2, p0, Ll/nqy;->f:F

    .line 275
    .line 276
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightTextSize(F)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 280
    .line 281
    iget v2, p0, Ll/nqy;->g:I

    .line 282
    .line 283
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightTextMarginEnd(I)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 287
    .line 288
    iget v2, p0, Ll/nqy;->h:I

    .line 289
    .line 290
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setLeftImage(I)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 294
    .line 295
    iget v2, p0, Ll/nqy;->b:I

    .line 296
    .line 297
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setCenterImage(I)V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 301
    .line 302
    iget v2, p0, Ll/nqy;->i:I

    .line 303
    .line 304
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightImage(I)V

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 308
    .line 309
    iget-boolean v2, p0, Ll/nqy;->v:Z

    .line 310
    .line 311
    invoke-virtual {v0, v2}, Lv/VMenuBar;->i0(Z)V

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 315
    .line 316
    iget-object v2, p0, Ll/nqy;->p:Landroid/view/View$OnClickListener;

    .line 317
    .line 318
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setLeftRegionClick(Landroid/view/View$OnClickListener;)V

    .line 319
    .line 320
    .line 321
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 322
    .line 323
    iget-object v2, p0, Ll/nqy;->r:Landroid/view/View$OnClickListener;

    .line 324
    .line 325
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setCenterRegionClick(Landroid/view/View$OnClickListener;)V

    .line 326
    .line 327
    .line 328
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 329
    .line 330
    iget-object v2, p0, Ll/nqy;->q:Landroid/view/View$OnClickListener;

    .line 331
    .line 332
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setRightRegionClick(Landroid/view/View$OnClickListener;)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 336
    .line 337
    iget v2, p0, Ll/nqy;->K:I

    .line 338
    .line 339
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setCenterCustomLayoutRes(I)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p0, Ll/nqy;->B:Lv/VMenuBar;

    .line 343
    .line 344
    iget-object v2, p0, Ll/nqy;->N:Landroid/view/View;

    .line 345
    .line 346
    invoke-virtual {v0, v2}, Lv/VMenuBar;->setCenterCustomView(Landroid/view/View;)V

    .line 347
    .line 348
    .line 349
    iget v0, p0, Ll/nqy;->l:I

    .line 350
    .line 351
    if-lez v0, :cond_4

    .line 352
    .line 353
    iget-object v2, p0, Ll/nqy;->R:Landroid/view/View;

    .line 354
    .line 355
    if-nez v2, :cond_3

    .line 356
    .line 357
    goto :goto_1

    .line 358
    :cond_3
    const-string p0, "Only One Header can exist"

    .line 359
    .line 360
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    return-void

    .line 364
    :cond_4
    :goto_1
    if-lez v0, :cond_5

    .line 365
    .line 366
    iget-object v2, p0, Ll/nqy;->D:Landroid/view/ViewStub;

    .line 367
    .line 368
    invoke-virtual {v2, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 369
    .line 370
    .line 371
    iget-object v0, p0, Ll/nqy;->D:Landroid/view/ViewStub;

    .line 372
    .line 373
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    iput-object v0, p0, Ll/nqy;->F:Landroid/view/View;

    .line 378
    .line 379
    :cond_5
    iget-object v0, p0, Ll/nqy;->R:Landroid/view/View;

    .line 380
    .line 381
    const/4 v2, -0x2

    .line 382
    const/4 v3, 0x0

    .line 383
    if-eqz v0, :cond_6

    .line 384
    .line 385
    new-instance v0, Landroidx/constraintlayout/widget/Constraints$a;

    .line 386
    .line 387
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/widget/Constraints$a;-><init>(II)V

    .line 388
    .line 389
    .line 390
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->d:I

    .line 391
    .line 392
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->f:I

    .line 393
    .line 394
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 395
    .line 396
    iget-object v4, p0, Ll/nqy;->Q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 397
    .line 398
    iget-object v5, p0, Ll/nqy;->R:Landroid/view/View;

    .line 399
    .line 400
    invoke-virtual {v4, v5, v3, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 401
    .line 402
    .line 403
    iget-object v0, p0, Ll/nqy;->R:Landroid/view/View;

    .line 404
    .line 405
    iput-object v0, p0, Ll/nqy;->F:Landroid/view/View;

    .line 406
    .line 407
    :cond_6
    iget v0, p0, Ll/nqy;->m:I

    .line 408
    .line 409
    if-lez v0, :cond_8

    .line 410
    .line 411
    iget-object v4, p0, Ll/nqy;->S:Landroid/view/View;

    .line 412
    .line 413
    if-nez v4, :cond_7

    .line 414
    .line 415
    goto :goto_2

    .line 416
    :cond_7
    const-string p0, "Only One Footer can exist"

    .line 417
    .line 418
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    return-void

    .line 422
    :cond_8
    :goto_2
    if-lez v0, :cond_9

    .line 423
    .line 424
    iget-object v4, p0, Ll/nqy;->E:Landroid/view/ViewStub;

    .line 425
    .line 426
    invoke-virtual {v4, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 427
    .line 428
    .line 429
    iget-object v0, p0, Ll/nqy;->E:Landroid/view/ViewStub;

    .line 430
    .line 431
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    iput-object v0, p0, Ll/nqy;->G:Landroid/view/View;

    .line 436
    .line 437
    :cond_9
    iget-object v0, p0, Ll/nqy;->S:Landroid/view/View;

    .line 438
    .line 439
    if-eqz v0, :cond_a

    .line 440
    .line 441
    new-instance v0, Landroidx/constraintlayout/widget/Constraints$a;

    .line 442
    .line 443
    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/widget/Constraints$a;-><init>(II)V

    .line 444
    .line 445
    .line 446
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->d:I

    .line 447
    .line 448
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->f:I

    .line 449
    .line 450
    iput v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 451
    .line 452
    iget-object v1, p0, Ll/nqy;->Q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 453
    .line 454
    iget-object v2, p0, Ll/nqy;->S:Landroid/view/View;

    .line 455
    .line 456
    const/4 v4, 0x2

    .line 457
    invoke-virtual {v1, v2, v4, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 458
    .line 459
    .line 460
    iget-object v0, p0, Ll/nqy;->S:Landroid/view/View;

    .line 461
    .line 462
    iput-object v0, p0, Ll/nqy;->G:Landroid/view/View;

    .line 463
    .line 464
    :cond_a
    iget-object v0, p0, Ll/nqy;->w:Ljava/util/List;

    .line 465
    .line 466
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    const/16 v1, 0x8

    .line 471
    .line 472
    if-nez v0, :cond_b

    .line 473
    .line 474
    new-instance v0, Ll/nqy$d;

    .line 475
    .line 476
    iget-object v2, p0, Ll/nqy;->w:Ljava/util/List;

    .line 477
    .line 478
    const/4 v4, 0x0

    .line 479
    invoke-direct {v0, v2, v4}, Ll/nqy$d;-><init>(Ljava/util/List;Ll/nqy$c;)V

    .line 480
    .line 481
    .line 482
    iput-object v0, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 483
    .line 484
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 485
    .line 486
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 487
    .line 488
    iget-object v4, p0, Ll/nqy;->z:Landroid/content/Context;

    .line 489
    .line 490
    invoke-direct {v2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 494
    .line 495
    .line 496
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 497
    .line 498
    iget-object v2, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 499
    .line 500
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 501
    .line 502
    .line 503
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 504
    .line 505
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 506
    .line 507
    .line 508
    goto :goto_3

    .line 509
    :cond_b
    iget-object v0, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 510
    .line 511
    if-eqz v0, :cond_d

    .line 512
    .line 513
    iget-object v0, p0, Ll/nqy;->y:Landroidx/recyclerview/widget/RecyclerView$o;

    .line 514
    .line 515
    if-eqz v0, :cond_c

    .line 516
    .line 517
    iget-object v2, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 518
    .line 519
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 520
    .line 521
    .line 522
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 523
    .line 524
    iget-object v2, p0, Ll/nqy;->x:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 525
    .line 526
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 527
    .line 528
    .line 529
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 530
    .line 531
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 532
    .line 533
    .line 534
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 535
    .line 536
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 541
    .line 542
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 543
    .line 544
    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 545
    .line 546
    goto :goto_3

    .line 547
    :cond_c
    const-string p0, "Adapter and LayoutManager must init simultaneously"

    .line 548
    .line 549
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    return-void

    .line 553
    :cond_d
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 554
    .line 555
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 556
    .line 557
    .line 558
    :goto_3
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 559
    .line 560
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 561
    .line 562
    .line 563
    move-result v0

    .line 564
    if-eq v0, v1, :cond_10

    .line 565
    .line 566
    iget v0, p0, Ll/nqy;->U:I

    .line 567
    .line 568
    if-gtz v0, :cond_e

    .line 569
    .line 570
    iget v0, p0, Ll/nqy;->V:I

    .line 571
    .line 572
    if-lez v0, :cond_10

    .line 573
    .line 574
    :cond_e
    iget-object v0, p0, Ll/nqy;->C:Landroidx/recyclerview/widget/RecyclerView;

    .line 575
    .line 576
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 581
    .line 582
    iget v1, p0, Ll/nqy;->U:I

    .line 583
    .line 584
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 585
    .line 586
    iget p0, p0, Ll/nqy;->V:I

    .line 587
    .line 588
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 589
    .line 590
    return-void

    .line 591
    :cond_f
    const-string p0, "MenuSheet`s Host do not implement DialogLifeTracer"

    .line 592
    .line 593
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 594
    .line 595
    .line 596
    :cond_10
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nqy;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqy;->A:Ll/pej0;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
