.class public Ll/w30;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w30$b;,
        Ll/w30$d;,
        Ll/w30$a;,
        Ll/w30$c;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:Landroid/graphics/Typeface;

.field public F:Landroid/graphics/Typeface;

.field public G:Landroid/graphics/Typeface;

.field public H:Landroid/graphics/Typeface;

.field public I:I

.field public J:I

.field public K:Landroid/graphics/Typeface;

.field public L:Landroid/graphics/Typeface;

.field public M:[I

.field public N:[I

.field public O:[I

.field public P:[I

.field public Q:Landroid/view/View;

.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:Ljava/lang/CharSequence;

.field public d:Ljava/lang/CharSequence;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/content/Context;

.field public g:Z

.field public h:Z

.field public i:Landroid/content/DialogInterface$OnCancelListener;

.field public j:Landroid/content/DialogInterface$OnShowListener;

.field public k:Landroid/content/DialogInterface$OnDismissListener;

.field public l:Landroid/view/View$OnClickListener;

.field public m:Landroid/view/View$OnClickListener;

.field public n:Ll/pej0;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Lv/VLine;

.field public t:Lv/VLine;

.field public u:Landroidx/recyclerview/widget/RecyclerView;

.field public v:Lv/VLinear;

.field public w:Lv/VLinear;

.field public x:Ll/w30$a;

.field public y:Ll/w30$d;

.field public z:I


# direct methods
.method public constructor <init>(Ll/w30$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w30$b;->p(Ll/w30$b;)Ljava/lang/CharSequence;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/w30;->a:Ljava/lang/CharSequence;

    .line 9
    .line 10
    invoke-static {p1}, Ll/w30$b;->m(Ll/w30$b;)Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/w30;->b:Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-static {p1}, Ll/w30$b;->j(Ll/w30$b;)Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/w30;->c:Ljava/lang/CharSequence;

    .line 21
    .line 22
    invoke-static {p1}, Ll/w30$b;->g(Ll/w30$b;)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/w30;->d:Ljava/lang/CharSequence;

    .line 27
    .line 28
    invoke-static {p1}, Ll/w30$b;->e(Ll/w30$b;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/w30;->e:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p1}, Ll/w30$b;->f(Ll/w30$b;)Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/w30;->f:Landroid/content/Context;

    .line 39
    .line 40
    invoke-static {p1}, Ll/w30$b;->a(Ll/w30$b;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput-boolean v0, p0, Ll/w30;->g:Z

    .line 45
    .line 46
    invoke-static {p1}, Ll/w30$b;->b(Ll/w30$b;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput-boolean v0, p0, Ll/w30;->h:Z

    .line 51
    .line 52
    invoke-static {p1}, Ll/w30$b;->x(Ll/w30$b;)Landroid/content/DialogInterface$OnCancelListener;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/w30;->i:Landroid/content/DialogInterface$OnCancelListener;

    .line 57
    .line 58
    invoke-static {p1}, Ll/w30$b;->C(Ll/w30$b;)Landroid/content/DialogInterface$OnShowListener;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/w30;->j:Landroid/content/DialogInterface$OnShowListener;

    .line 63
    .line 64
    invoke-static {p1}, Ll/w30$b;->y(Ll/w30$b;)Landroid/content/DialogInterface$OnDismissListener;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/w30;->k:Landroid/content/DialogInterface$OnDismissListener;

    .line 69
    .line 70
    invoke-static {p1}, Ll/w30$b;->A(Ll/w30$b;)Landroid/view/View$OnClickListener;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/w30;->l:Landroid/view/View$OnClickListener;

    .line 75
    .line 76
    invoke-static {p1}, Ll/w30$b;->z(Ll/w30$b;)Landroid/view/View$OnClickListener;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Ll/w30;->m:Landroid/view/View$OnClickListener;

    .line 81
    .line 82
    invoke-static {p1}, Ll/w30$b;->B(Ll/w30$b;)Ll/w30$d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Ll/w30;->y:Ll/w30$d;

    .line 87
    .line 88
    invoke-static {p1}, Ll/w30$b;->q(Ll/w30$b;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Ll/w30;->z:I

    .line 93
    .line 94
    invoke-static {p1}, Ll/w30$b;->n(Ll/w30$b;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Ll/w30;->A:I

    .line 99
    .line 100
    invoke-static {p1}, Ll/w30$b;->k(Ll/w30$b;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Ll/w30;->B:I

    .line 105
    .line 106
    invoke-static {p1}, Ll/w30$b;->h(Ll/w30$b;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iput v0, p0, Ll/w30;->C:I

    .line 111
    .line 112
    invoke-static {p1}, Ll/w30$b;->s(Ll/w30$b;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Ll/w30;->D:I

    .line 117
    .line 118
    invoke-static {p1}, Ll/w30$b;->r(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Ll/w30;->E:Landroid/graphics/Typeface;

    .line 123
    .line 124
    invoke-static {p1}, Ll/w30$b;->o(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Ll/w30;->F:Landroid/graphics/Typeface;

    .line 129
    .line 130
    invoke-static {p1}, Ll/w30$b;->l(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Ll/w30;->G:Landroid/graphics/Typeface;

    .line 135
    .line 136
    invoke-static {p1}, Ll/w30$b;->i(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Ll/w30;->H:Landroid/graphics/Typeface;

    .line 141
    .line 142
    invoke-static {p1}, Ll/w30$b;->w(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Ll/w30;->K:Landroid/graphics/Typeface;

    .line 147
    .line 148
    invoke-static {p1}, Ll/w30$b;->u(Ll/w30$b;)Landroid/graphics/Typeface;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Ll/w30;->L:Landroid/graphics/Typeface;

    .line 153
    .line 154
    invoke-static {p1}, Ll/w30$b;->d(Ll/w30$b;)[I

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Ll/w30;->M:[I

    .line 159
    .line 160
    invoke-static {p1}, Ll/w30$b;->c(Ll/w30$b;)[I

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Ll/w30;->O:[I

    .line 165
    .line 166
    invoke-static {p1}, Ll/w30$b;->E(Ll/w30$b;)[I

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Ll/w30;->N:[I

    .line 171
    .line 172
    invoke-static {p1}, Ll/w30$b;->D(Ll/w30$b;)[I

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Ll/w30;->P:[I

    .line 177
    .line 178
    invoke-static {p1}, Ll/w30$b;->v(Ll/w30$b;)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    iput v0, p0, Ll/w30;->I:I

    .line 183
    .line 184
    invoke-static {p1}, Ll/w30$b;->t(Ll/w30$b;)I

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    iput p1, p0, Ll/w30;->J:I

    .line 189
    .line 190
    return-void
.end method

.method public synthetic constructor <init>(Ll/w30$b;Ll/x30;)V
    .locals 0

    .line 191
    invoke-direct {p0, p1}, Ll/w30;-><init>(Ll/w30$b;)V

    return-void
.end method

.method public static synthetic a(Ll/w30;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w30;->e(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

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
    iget-object p0, p0, Ll/w30;->n:Ll/pej0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30;->Q:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30;->n:Ll/pej0;

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
    .locals 5

    .line 1
    iget-object v0, p0, Ll/w30;->v:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/w30;->v:Lv/VLinear;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    iget-object v2, p0, Ll/w30;->s:Lv/VLine;

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    sget v2, Ll/qa00;->h:I

    .line 27
    .line 28
    sget v3, Ll/qa00;->d:I

    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v2, v1

    .line 33
    :goto_1
    add-int/2addr v0, v2

    .line 34
    iget-object v2, p0, Ll/w30;->w:Lv/VLinear;

    .line 35
    .line 36
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    iget-object v2, p0, Ll/w30;->w:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v2, v1

    .line 50
    :goto_2
    iget-object v3, p0, Ll/w30;->t:Lv/VLine;

    .line 51
    .line 52
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-nez v3, :cond_3

    .line 57
    .line 58
    sget v3, Ll/qa00;->h:I

    .line 59
    .line 60
    mul-int/lit8 v3, v3, 0x3

    .line 61
    .line 62
    sget v4, Ll/qa00;->d:I

    .line 63
    .line 64
    add-int/2addr v3, v4

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move v3, v1

    .line 67
    :goto_3
    add-int/2addr v2, v3

    .line 68
    iget-object v3, p0, Ll/w30;->u:Landroidx/recyclerview/widget/RecyclerView;

    .line 69
    .line 70
    invoke-virtual {v3, v1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/w30;->x:Ll/w30$a;

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/w30$a;->getItemCount()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const/4 v2, 0x6

    .line 82
    if-le v0, v2, :cond_4

    .line 83
    .line 84
    iget-object v0, p0, Ll/w30;->u:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object p0, p0, Ll/w30;->j:Landroid/content/DialogInterface$OnShowListener;

    .line 90
    .line 91
    if-eqz p0, :cond_5

    .line 92
    .line 93
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnShowListener;->onShow(Landroid/content/DialogInterface;)V

    .line 94
    .line 95
    .line 96
    :cond_5
    return-void
.end method

.method public f()V
    .locals 14

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/w30;->f:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/w30;->f:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v1, v0, Ll/r1e;

    .line 17
    .line 18
    if-eqz v1, :cond_12

    .line 19
    .line 20
    iget-object v1, p0, Ll/w30;->n:Ll/pej0;

    .line 21
    .line 22
    check-cast v0, Ll/r1e;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/pej0;->w(Ll/r1e;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 28
    .line 29
    sget v1, Ll/gec0;->e:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 35
    .line 36
    iget-boolean v1, p0, Ll/w30;->g:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 42
    .line 43
    iget-boolean v1, p0, Ll/w30;->h:Z

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 49
    .line 50
    iget-object v1, p0, Ll/w30;->i:Landroid/content/DialogInterface$OnCancelListener;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 56
    .line 57
    new-instance v1, Ll/u30;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/u30;-><init>(Ll/w30;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 66
    .line 67
    iget-object v1, p0, Ll/w30;->k:Landroid/content/DialogInterface$OnDismissListener;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sget v1, Ll/vcc0;->E:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, p0, Ll/w30;->Q:Landroid/view/View;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x3

    .line 91
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 92
    .line 93
    .line 94
    const/4 v1, 0x1

    .line 95
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/w30;->Q:Landroid/view/View;

    .line 99
    .line 100
    iget-object v2, p0, Ll/w30;->f:Landroid/content/Context;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    const v3, 0x106000d

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const v2, 0x3e99999a    # 0.3f

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v2}, Landroid/view/Window;->setDimAmount(F)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 129
    .line 130
    sget v2, Ll/vcc0;->R:I

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lv/VText;

    .line 137
    .line 138
    iput-object v0, p0, Ll/w30;->o:Lv/VText;

    .line 139
    .line 140
    iget v2, p0, Ll/w30;->z:I

    .line 141
    .line 142
    const v3, 0x7fffffff

    .line 143
    .line 144
    .line 145
    if-eq v2, v3, :cond_0

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 148
    .line 149
    .line 150
    :cond_0
    iget-object v0, p0, Ll/w30;->E:Landroid/graphics/Typeface;

    .line 151
    .line 152
    iget-object v2, p0, Ll/w30;->o:Lv/VText;

    .line 153
    .line 154
    if-eqz v0, :cond_1

    .line 155
    .line 156
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_1
    invoke-virtual {v2}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 165
    .line 166
    .line 167
    :goto_0
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 168
    .line 169
    sget v2, Ll/vcc0;->Q:I

    .line 170
    .line 171
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Lv/VText;

    .line 176
    .line 177
    iput-object v0, p0, Ll/w30;->p:Lv/VText;

    .line 178
    .line 179
    iget v2, p0, Ll/w30;->A:I

    .line 180
    .line 181
    if-eq v2, v3, :cond_2

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    .line 185
    .line 186
    :cond_2
    iget-object v0, p0, Ll/w30;->F:Landroid/graphics/Typeface;

    .line 187
    .line 188
    if-eqz v0, :cond_3

    .line 189
    .line 190
    iget-object v2, p0, Ll/w30;->p:Lv/VText;

    .line 191
    .line 192
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 193
    .line 194
    .line 195
    :cond_3
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 196
    .line 197
    sget v2, Ll/vcc0;->O:I

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Lv/VText;

    .line 204
    .line 205
    iput-object v0, p0, Ll/w30;->q:Lv/VText;

    .line 206
    .line 207
    iget v2, p0, Ll/w30;->B:I

    .line 208
    .line 209
    if-eq v2, v3, :cond_4

    .line 210
    .line 211
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 212
    .line 213
    .line 214
    :cond_4
    iget-object v0, p0, Ll/w30;->G:Landroid/graphics/Typeface;

    .line 215
    .line 216
    iget-object v2, p0, Ll/w30;->q:Lv/VText;

    .line 217
    .line 218
    if-eqz v0, :cond_5

    .line 219
    .line 220
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_5
    iget-object v0, p0, Ll/w30;->o:Lv/VText;

    .line 225
    .line 226
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-virtual {v2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 231
    .line 232
    .line 233
    :goto_1
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 234
    .line 235
    sget v2, Ll/vcc0;->N:I

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    check-cast v0, Lv/VText;

    .line 242
    .line 243
    iput-object v0, p0, Ll/w30;->r:Lv/VText;

    .line 244
    .line 245
    iget v2, p0, Ll/w30;->C:I

    .line 246
    .line 247
    if-eq v2, v3, :cond_6

    .line 248
    .line 249
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 250
    .line 251
    .line 252
    :cond_6
    iget-object v0, p0, Ll/w30;->H:Landroid/graphics/Typeface;

    .line 253
    .line 254
    if-eqz v0, :cond_7

    .line 255
    .line 256
    iget-object v2, p0, Ll/w30;->r:Lv/VText;

    .line 257
    .line 258
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 259
    .line 260
    .line 261
    :cond_7
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 262
    .line 263
    sget v2, Ll/vcc0;->W0:I

    .line 264
    .line 265
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    check-cast v0, Lv/VLine;

    .line 270
    .line 271
    iput-object v0, p0, Ll/w30;->s:Lv/VLine;

    .line 272
    .line 273
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 274
    .line 275
    sget v2, Ll/vcc0;->j:I

    .line 276
    .line 277
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    check-cast v0, Lv/VLine;

    .line 282
    .line 283
    iput-object v0, p0, Ll/w30;->t:Lv/VLine;

    .line 284
    .line 285
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 286
    .line 287
    sget v2, Ll/vcc0;->P:I

    .line 288
    .line 289
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    check-cast v0, Lv/VLinear;

    .line 294
    .line 295
    iput-object v0, p0, Ll/w30;->v:Lv/VLinear;

    .line 296
    .line 297
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 298
    .line 299
    sget v2, Ll/vcc0;->M:I

    .line 300
    .line 301
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    check-cast v0, Lv/VLinear;

    .line 306
    .line 307
    iput-object v0, p0, Ll/w30;->w:Lv/VLinear;

    .line 308
    .line 309
    iget-object v0, p0, Ll/w30;->n:Ll/pej0;

    .line 310
    .line 311
    sget v2, Ll/vcc0;->A:I

    .line 312
    .line 313
    invoke-virtual {v0, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 318
    .line 319
    iput-object v0, p0, Ll/w30;->u:Landroidx/recyclerview/widget/RecyclerView;

    .line 320
    .line 321
    iget-object v0, p0, Ll/w30;->l:Landroid/view/View$OnClickListener;

    .line 322
    .line 323
    if-eqz v0, :cond_8

    .line 324
    .line 325
    iget-object v2, p0, Ll/w30;->v:Lv/VLinear;

    .line 326
    .line 327
    invoke-virtual {v2, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    .line 329
    .line 330
    :cond_8
    iget-object v0, p0, Ll/w30;->m:Landroid/view/View$OnClickListener;

    .line 331
    .line 332
    if-eqz v0, :cond_9

    .line 333
    .line 334
    iget-object v2, p0, Ll/w30;->w:Lv/VLinear;

    .line 335
    .line 336
    invoke-virtual {v2, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    .line 338
    .line 339
    :cond_9
    iget-object v0, p0, Ll/w30;->a:Ljava/lang/CharSequence;

    .line 340
    .line 341
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    iget-object v2, p0, Ll/w30;->o:Lv/VText;

    .line 346
    .line 347
    const/4 v3, 0x0

    .line 348
    const/16 v4, 0x8

    .line 349
    .line 350
    if-nez v0, :cond_a

    .line 351
    .line 352
    iget-object v0, p0, Ll/w30;->a:Ljava/lang/CharSequence;

    .line 353
    .line 354
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    .line 356
    .line 357
    move v0, v1

    .line 358
    goto :goto_2

    .line 359
    :cond_a
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 360
    .line 361
    .line 362
    move v0, v3

    .line 363
    :goto_2
    iget-object v2, p0, Ll/w30;->b:Ljava/lang/CharSequence;

    .line 364
    .line 365
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 366
    .line 367
    .line 368
    move-result v2

    .line 369
    iget-object v5, p0, Ll/w30;->p:Lv/VText;

    .line 370
    .line 371
    if-nez v2, :cond_c

    .line 372
    .line 373
    iget-object v0, p0, Ll/w30;->b:Ljava/lang/CharSequence;

    .line 374
    .line 375
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 376
    .line 377
    .line 378
    iget-object v0, p0, Ll/w30;->p:Lv/VText;

    .line 379
    .line 380
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Ll/w30;->a:Ljava/lang/CharSequence;

    .line 384
    .line 385
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    if-eqz v0, :cond_b

    .line 390
    .line 391
    iget-object v0, p0, Ll/w30;->p:Lv/VText;

    .line 392
    .line 393
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 398
    .line 399
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 400
    .line 401
    :cond_b
    move v0, v1

    .line 402
    goto :goto_3

    .line 403
    :cond_c
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 404
    .line 405
    .line 406
    :goto_3
    if-nez v0, :cond_d

    .line 407
    .line 408
    iget-object v0, p0, Ll/w30;->v:Lv/VLinear;

    .line 409
    .line 410
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 411
    .line 412
    .line 413
    iget-object v0, p0, Ll/w30;->s:Lv/VLine;

    .line 414
    .line 415
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 416
    .line 417
    .line 418
    :cond_d
    iget-object v0, p0, Ll/w30;->c:Ljava/lang/CharSequence;

    .line 419
    .line 420
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    iget-object v2, p0, Ll/w30;->q:Lv/VText;

    .line 425
    .line 426
    if-nez v0, :cond_e

    .line 427
    .line 428
    iget-object v0, p0, Ll/w30;->c:Ljava/lang/CharSequence;

    .line 429
    .line 430
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 431
    .line 432
    .line 433
    move v0, v1

    .line 434
    goto :goto_4

    .line 435
    :cond_e
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 436
    .line 437
    .line 438
    move v0, v3

    .line 439
    :goto_4
    iget-object v2, p0, Ll/w30;->d:Ljava/lang/CharSequence;

    .line 440
    .line 441
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 442
    .line 443
    .line 444
    move-result v2

    .line 445
    iget-object v5, p0, Ll/w30;->r:Lv/VText;

    .line 446
    .line 447
    if-nez v2, :cond_f

    .line 448
    .line 449
    iget-object v0, p0, Ll/w30;->d:Ljava/lang/CharSequence;

    .line 450
    .line 451
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 452
    .line 453
    .line 454
    iget-object v0, p0, Ll/w30;->r:Lv/VText;

    .line 455
    .line 456
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 457
    .line 458
    .line 459
    goto :goto_5

    .line 460
    :cond_f
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 461
    .line 462
    .line 463
    move v1, v0

    .line 464
    :goto_5
    if-nez v1, :cond_10

    .line 465
    .line 466
    iget-object v0, p0, Ll/w30;->w:Lv/VLinear;

    .line 467
    .line 468
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 469
    .line 470
    .line 471
    iget-object v0, p0, Ll/w30;->t:Lv/VLine;

    .line 472
    .line 473
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 474
    .line 475
    .line 476
    :cond_10
    iget-object v0, p0, Ll/w30;->e:Ljava/util/List;

    .line 477
    .line 478
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    if-nez v0, :cond_11

    .line 483
    .line 484
    new-instance v1, Ll/w30$a;

    .line 485
    .line 486
    iget-object v2, p0, Ll/w30;->f:Landroid/content/Context;

    .line 487
    .line 488
    iget-object v3, p0, Ll/w30;->e:Ljava/util/List;

    .line 489
    .line 490
    iget-object v4, p0, Ll/w30;->y:Ll/w30$d;

    .line 491
    .line 492
    iget v5, p0, Ll/w30;->D:I

    .line 493
    .line 494
    iget v6, p0, Ll/w30;->I:I

    .line 495
    .line 496
    iget v7, p0, Ll/w30;->J:I

    .line 497
    .line 498
    iget-object v8, p0, Ll/w30;->K:Landroid/graphics/Typeface;

    .line 499
    .line 500
    iget-object v9, p0, Ll/w30;->L:Landroid/graphics/Typeface;

    .line 501
    .line 502
    iget-object v10, p0, Ll/w30;->M:[I

    .line 503
    .line 504
    iget-object v11, p0, Ll/w30;->N:[I

    .line 505
    .line 506
    iget-object v12, p0, Ll/w30;->O:[I

    .line 507
    .line 508
    iget-object v13, p0, Ll/w30;->P:[I

    .line 509
    .line 510
    invoke-direct/range {v1 .. v13}, Ll/w30$a;-><init>(Landroid/content/Context;Ljava/util/List;Ll/w30$d;IIILandroid/graphics/Typeface;Landroid/graphics/Typeface;[I[I[I[I)V

    .line 511
    .line 512
    .line 513
    iput-object v1, p0, Ll/w30;->x:Ll/w30$a;

    .line 514
    .line 515
    iget-object v0, p0, Ll/w30;->u:Landroidx/recyclerview/widget/RecyclerView;

    .line 516
    .line 517
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 518
    .line 519
    iget-object v2, p0, Ll/w30;->f:Landroid/content/Context;

    .line 520
    .line 521
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 525
    .line 526
    .line 527
    iget-object v0, p0, Ll/w30;->u:Landroidx/recyclerview/widget/RecyclerView;

    .line 528
    .line 529
    iget-object v1, p0, Ll/w30;->x:Ll/w30$a;

    .line 530
    .line 531
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 532
    .line 533
    .line 534
    :cond_11
    iget-object p0, p0, Ll/w30;->n:Ll/pej0;

    .line 535
    .line 536
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 537
    .line 538
    .line 539
    return-void

    .line 540
    :cond_12
    const-string p0, "ActionSheet`s Host do not implement DialogLifeTracer"

    .line 541
    .line 542
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 543
    .line 544
    .line 545
    return-void
.end method
