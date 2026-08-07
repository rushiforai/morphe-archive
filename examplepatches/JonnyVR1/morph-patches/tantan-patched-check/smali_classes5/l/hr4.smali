.class public Ll/hr4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cr4;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public B:Lv/VImage;

.field public C:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public D:Lv/VText;

.field public E:Lv/VImage;

.field public F:Lv/VText;

.field public G:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public H:Lv/VImage;

.field public I:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public J:Lv/VText;

.field public K:Lv/VImage;

.field public L:Lv/VText;

.field public M:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public N:Lv/VImage;

.field public O:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public P:Lv/VText;

.field public Q:Lv/VImage;

.field public R:Lv/VText;

.field public S:Lcom/p1/mobile/putong/core/ui/verification/CertificationCenterFrag;

.field public T:Ll/cr4;

.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Lv/VImage;

.field public m:Landroid/widget/TextView;

.field public n:Lv/VImage;

.field public o:Lv/VImage;

.field public p:Lv/VLinear;

.field public q:Lv/VLinear;

.field public r:Lv/VFrame;

.field public s:Lv/VImage;

.field public t:Lv/VText;

.field public u:Lv/VFrame;

.field public v:Lv/VImage;

.field public w:Lv/VText;

.field public x:Lv/VFrame;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/ui/VText_Bold;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/CertificationCenterFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hr4;->S:Lcom/p1/mobile/putong/core/ui/verification/CertificationCenterFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/hr4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hr4;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/hr4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hr4;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/hr4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hr4;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/hr4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hr4;->m(Landroid/view/View;)V

    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hr4;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/hr4;->a:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Lr:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr4;->T:Ll/cr4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cr4;->i0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr4;->T:Ll/cr4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cr4;->k0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr4;->T:Ll/cr4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cr4;->l0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr4;->T:Ll/cr4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cr4;->j0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hr4;->S:Lcom/p1/mobile/putong/core/ui/verification/CertificationCenterFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ir4;->b(Ll/hr4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/cr4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hr4;->T:Ll/cr4;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cr4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hr4;->f(Ll/cr4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hr4;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hr4;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/dbc0;->j:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/hr4;->C0()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/dbc0;->i:I

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "verified"

    .line 22
    .line 23
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 30
    .line 31
    const-string v2, "\u8ba4\u8bc1\u6210\u529f"

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 37
    .line 38
    const-string v2, "#FF2BCCFF"

    .line 39
    .line 40
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const-string v1, "rejected"

    .line 54
    .line 55
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 62
    .line 63
    const-string v2, "\u8ba4\u8bc1\u5931\u8d25\uff0c\u91cd\u65b0\u8ba4\u8bc1"

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 69
    .line 70
    const-string v2, "#FFFFFF"

    .line 71
    .line 72
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const-string v1, "pending"

    .line 86
    .line 87
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    iget-object v2, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 92
    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    const-string v1, "\u5ba1\u6838\u4e2d..."

    .line 96
    .line 97
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 101
    .line 102
    const-string v2, "#66FFFFFF"

    .line 103
    .line 104
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    const-string v1, "\u7acb\u5373\u8ba4\u8bc1\uff0c\u83b7\u5f97\u7279\u6743"

    .line 118
    .line 119
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 123
    .line 124
    const-string v2, "#FFFFFFFF"

    .line 125
    .line 126
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/hr4;->z:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    .line 137
    .line 138
    :goto_0
    invoke-virtual {p0, p1}, Ll/hr4;->u(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 7

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const-string v3, "pending"

    .line 10
    .line 11
    const-string v4, "#66000000"

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 24
    .line 25
    const-string p2, "\u5df2\u8ba4\u8bc1"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 40
    .line 41
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 45
    .line 46
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object p2, p0, Ll/hr4;->R:Lv/VText;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 62
    .line 63
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 76
    .line 77
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p1, "\u5f85\u6fc0\u6d3b"

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 87
    .line 88
    const-string p2, "#FE7E1D"

    .line 89
    .line 90
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 98
    .line 99
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 103
    .line 104
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_3

    .line 113
    .line 114
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 120
    .line 121
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 129
    .line 130
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 134
    .line 135
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    const-string p2, "rejected"

    .line 140
    .line 141
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_4

    .line 146
    .line 147
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 148
    .line 149
    const-string p2, "\u8ba4\u8bc1\u5931\u8d25"

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 155
    .line 156
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 164
    .line 165
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 169
    .line 170
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    const-string p2, "invalid"

    .line 175
    .line 176
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 183
    .line 184
    const-string p2, "\u5df2\u5931\u6548"

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/hr4;->R:Lv/VText;

    .line 190
    .line 191
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 199
    .line 200
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 204
    .line 205
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_5
    iget-object p1, p0, Ll/hr4;->Q:Lv/VImage;

    .line 210
    .line 211
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Ll/hr4;->R:Lv/VText;

    .line 215
    .line 216
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 7

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const-string v3, "pending"

    .line 10
    .line 11
    const-string v4, "#66000000"

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 24
    .line 25
    const-string p2, "\u5df2\u8ba4\u8bc1"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 40
    .line 41
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 45
    .line 46
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object p2, p0, Ll/hr4;->F:Lv/VText;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 62
    .line 63
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 76
    .line 77
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p1, "\u5f85\u6fc0\u6d3b"

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 87
    .line 88
    const-string p2, "#FE7E1D"

    .line 89
    .line 90
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 98
    .line 99
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 103
    .line 104
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    const-string p2, "rejected"

    .line 109
    .line 110
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 117
    .line 118
    const-string p2, "\u8ba4\u8bc1\u5931\u8d25"

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 124
    .line 125
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 133
    .line 134
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 138
    .line 139
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_4

    .line 148
    .line 149
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 155
    .line 156
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 164
    .line 165
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 169
    .line 170
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    const-string p2, "invalid"

    .line 175
    .line 176
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 183
    .line 184
    const-string p2, "\u5df2\u5931\u6548"

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/hr4;->F:Lv/VText;

    .line 190
    .line 191
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 199
    .line 200
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 204
    .line 205
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_5
    iget-object p1, p0, Ll/hr4;->E:Lv/VImage;

    .line 210
    .line 211
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Ll/hr4;->F:Lv/VText;

    .line 215
    .line 216
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/hr4;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hr4;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    new-instance v1, Ll/dr4;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/dr4;-><init>(Ll/hr4;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/hr4;->A:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    new-instance v1, Ll/er4;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/er4;-><init>(Ll/hr4;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/hr4;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    new-instance v1, Ll/fr4;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/fr4;-><init>(Ll/hr4;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/hr4;->M:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 35
    .line 36
    new-instance v1, Ll/gr4;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/gr4;-><init>(Ll/hr4;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 3

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/hr4;->L:Lv/VText;

    .line 12
    .line 13
    const-string v0, "\u5df2\u8ba4\u8bc1"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/hr4;->K:Lv/VImage;

    .line 19
    .line 20
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/hr4;->L:Lv/VText;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string v0, "rejected"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/hr4;->L:Lv/VText;

    .line 38
    .line 39
    const-string v0, "\u8ba4\u8bc1\u5931\u8d25"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/hr4;->K:Lv/VImage;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/hr4;->L:Lv/VText;

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string v0, "pending"

    .line 56
    .line 57
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Ll/hr4;->L:Lv/VText;

    .line 64
    .line 65
    const-string v0, "\u5ba1\u6838\u4e2d"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/hr4;->K:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/hr4;->L:Lv/VText;

    .line 76
    .line 77
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    const-string v0, "invalid"

    .line 82
    .line 83
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, p0, Ll/hr4;->L:Lv/VText;

    .line 90
    .line 91
    const-string v0, "\u5df2\u5931\u6548"

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/hr4;->K:Lv/VImage;

    .line 97
    .line 98
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/hr4;->L:Lv/VText;

    .line 102
    .line 103
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_3
    iget-object p1, p0, Ll/hr4;->K:Lv/VImage;

    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/hr4;->L:Lv/VText;

    .line 113
    .line 114
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/hr4;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/hr4;->f:Lv/VImage;

    .line 8
    .line 9
    sget v1, Ll/dbc0;->w4:I

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/hr4;->p:Lv/VLinear;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/hr4;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/hr4;->h:Lv/VText;

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/hr4;->i:Lv/VImage;

    .line 31
    .line 32
    sget v0, Ll/dbc0;->S4:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/hr4;->g:Lv/VDraweeView;

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hr4;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
