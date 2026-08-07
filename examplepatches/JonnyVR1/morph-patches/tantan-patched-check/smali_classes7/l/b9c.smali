.class public Ll/b9c;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b9c$b;
    }
.end annotation


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VDraweeView;

.field public i:Lv/VIcon;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/android/app/Act;

.field public n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

.field public o:I

.field public p:I

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ll/l4g0;

.field public t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public final u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xdc

    .line 5
    .line 6
    iput v0, p0, Ll/b9c;->o:I

    .line 7
    .line 8
    iput v0, p0, Ll/b9c;->p:I

    .line 9
    .line 10
    new-instance v0, Ll/b9c$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/b9c$a;-><init>(Ll/b9c;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/b9c;->u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/b9c;->J(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic A(Ll/b9c;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9c;->t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/b9c;Lcom/p1/mobile/putong/core/data/DatingGuideData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b9c;->O(Lcom/p1/mobile/putong/core/data/DatingGuideData;)V

    return-void
.end method

.method public static bridge synthetic D(Ll/b9c;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b9c;->P(II)V

    return-void
.end method

.method public static bridge synthetic E(Ll/b9c;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b9c;->Q(Ll/l4g0;)V

    return-void
.end method

.method public static bridge synthetic F(Ll/b9c;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b9c;->R(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Ll/b9c;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b9c;->S(Ljava/lang/String;)V

    return-void
.end method

.method private I()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pageId:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/b9c;->q:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method private J(Landroid/content/Context;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Ll/b9c;->m:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/b9c;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private K()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Ll/b9c;->j:Lv/VText;

    .line 10
    .line 11
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/b9c;->j:Lv/VText;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->titles:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/CharSequence;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v1, p0, Ll/b9c;->k:Lv/VText;

    .line 55
    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->subTitles:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/lang/CharSequence;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :goto_1
    iget-object v0, p0, Ll/b9c;->l:Landroid/widget/TextView;

    .line 76
    .line 77
    iget-object v1, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->button:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/gra;->z()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Ll/b9c;->l:Landroid/widget/TextView;

    .line 91
    .line 92
    sget v1, Ll/dbc0;->R:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 108
    .line 109
    iget-object v1, p0, Ll/b9c;->h:Lv/VDraweeView;

    .line 110
    .line 111
    iget-object v3, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/DatingGuideData;->pictures:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Ljava/lang/String;

    .line 120
    .line 121
    iget v4, p0, Ll/b9c;->o:I

    .line 122
    .line 123
    int-to-float v4, v4

    .line 124
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    iget v5, p0, Ll/b9c;->p:I

    .line 129
    .line 130
    int-to-float v5, v5

    .line 131
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    invoke-virtual {v0, v1, v3, v4, v5}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/b9c;->h:Lv/VDraweeView;

    .line 139
    .line 140
    iget v1, p0, Ll/b9c;->p:I

    .line 141
    .line 142
    int-to-float v1, v1

    .line 143
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 148
    .line 149
    .line 150
    iget v0, p0, Ll/b9c;->o:I

    .line 151
    .line 152
    int-to-float v0, v0

    .line 153
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget-object v1, p0, Ll/b9c;->h:Lv/VDraweeView;

    .line 158
    .line 159
    const/4 v3, 0x1

    .line 160
    new-array v3, v3, [Landroid/view/View;

    .line 161
    .line 162
    aput-object v1, v3, v2

    .line 163
    .line 164
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_3
    iget-object v0, p0, Ll/b9c;->h:Lv/VDraweeView;

    .line 169
    .line 170
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    :goto_2
    iget-object v0, p0, Ll/b9c;->l:Landroid/widget/TextView;

    .line 174
    .line 175
    new-instance v1, Ll/z8c;

    .line 176
    .line 177
    invoke-direct {v1, p0}, Ll/z8c;-><init>(Ll/b9c;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    :cond_4
    iget-object v0, p0, Ll/b9c;->i:Lv/VIcon;

    .line 184
    .line 185
    new-instance v1, Ll/a9c;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/a9c;-><init>(Ll/b9c;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DatingGuideData;->buttonId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/b9c;->I()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/b9c;->m:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    iget-object v0, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingGuideData;->deeplink:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b9c;->s:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private R(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic x(Ll/b9c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b9c;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/b9c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b9c;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/b9c;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b9c;->N(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c9c;->b(Ll/b9c;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final O(Lcom/p1/mobile/putong/core/data/DatingGuideData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c;->n:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 2
    .line 3
    return-void
.end method

.method public final P(II)V
    .locals 0

    .line 1
    iput p2, p0, Ll/b9c;->p:I

    .line 2
    .line 3
    iput p1, p0, Ll/b9c;->o:I

    .line 4
    .line 5
    return-void
.end method

.method public final Q(Ll/l4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c;->s:Ll/l4g0;

    .line 2
    .line 3
    return-void
.end method

.method public final S(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b9c;->r:Ljava/lang/String;

    .line 2
    .line 3
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
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/b9c;->t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/b9c;->t:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object v1, p0, Ll/b9c;->u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Ll/b9c;->K()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/b9c;->s:Ll/l4g0;

    .line 47
    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    invoke-direct {p0}, Ll/b9c;->I()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ll/b9c;->s:Ll/l4g0;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/b9c;->I()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "p_add_lifestyle_guidance"

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Ll/b9c;->r:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v1, p0, Ll/b9c;->s:Ll/l4g0;

    .line 85
    .line 86
    const-string v2, "add_lifestyle_guidance_type"

    .line 87
    .line 88
    if-nez v0, :cond_0

    .line 89
    .line 90
    iget-object v0, p0, Ll/b9c;->r:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    filled-new-array {v0}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_0
    const-string v0, "receive_like"

    .line 105
    .line 106
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    filled-new-array {v0}, [Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/b9c;->s:Ll/l4g0;

    .line 118
    .line 119
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Ll/y8c;

    .line 123
    .line 124
    invoke-direct {v0, p0}, Ll/y8c;-><init>(Ll/b9c;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
