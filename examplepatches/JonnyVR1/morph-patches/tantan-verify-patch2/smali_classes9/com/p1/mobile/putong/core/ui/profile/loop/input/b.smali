.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zma0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Ll/zma0;

.field public j:Landroid/content/Context;

.field public k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

.field public l:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->j:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->u()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->i()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->w(I)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->x(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->y()V

    return-void
.end method

.method private i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/z7c0;->a:I

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->q()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->h:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$d;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$d;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private w(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->A3:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x6

    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->c0:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x2

    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->G3:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v0, 0x3

    .line 59
    if-ne p1, v0, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 62
    .line 63
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->G3:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    const/4 v0, 0x4

    .line 78
    if-ne p1, v0, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 81
    .line 82
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->C3:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    const/4 v0, 0x5

    .line 97
    if-ne p1, v0, :cond_5

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 100
    .line 101
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->B3:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f:Lv/VText;

    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private x(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-le v0, v1, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-int/2addr v0, v1

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {p0, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget v1, Ll/kbc0;->f:I

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->g:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 76
    .line 77
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget v1, Ll/kbc0;->r1:I

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->j:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 p0, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-static {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bna0;->b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    check-cast p1, Ll/zma0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->j(Ll/zma0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Ll/zma0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->i:Ll/zma0;

    .line 2
    .line 3
    return-void
.end method

.method public k()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->i:Ll/zma0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/zma0;->b:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/zma0;->i0()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->h:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public l(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->n()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    long-to-double v0, v0

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 17
    .line 18
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()Ljava/util/Calendar;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v1, v2

    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0xb

    .line 44
    .line 45
    const/16 v1, 0x8

    .line 46
    .line 47
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0xc

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 54
    .line 55
    .line 56
    const/16 p0, 0xd

    .line 57
    .line 58
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0xe

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public p()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->j:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->h:Landroid/widget/FrameLayout;

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

.method public final synthetic u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->q()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->l:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->sn()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/16 v2, 0x17

    .line 32
    .line 33
    if-lt v1, v2, :cond_0

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 50
    .line 51
    .line 52
    :cond_0
    sget-object p1, Ll/pzi0;->k:Ljava/text/SimpleDateFormat;

    .line 53
    .line 54
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 63
    .line 64
    const-string v2, "MM"

    .line 65
    .line 66
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 71
    .line 72
    .line 73
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget-object v2, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 92
    .line 93
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    const/4 v3, 0x1

    .line 106
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    const/4 v4, 0x2

    .line 118
    invoke-virtual {v2, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    const/4 v5, 0x5

    .line 126
    invoke-virtual {v2, v5, v3}, Ljava/util/Calendar;->set(II)V

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    sget-object v6, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 134
    .line 135
    invoke-virtual {v6}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 136
    .line 137
    .line 138
    move-result-wide v6

    .line 139
    invoke-virtual {v3, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 140
    .line 141
    .line 142
    invoke-static {v2, v3}, Ll/zab;->O(Ljava/util/Calendar;Ljava/util/Calendar;)I

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    const/16 v7, 0x64

    .line 147
    .line 148
    if-lt v6, v7, :cond_2

    .line 149
    .line 150
    if-ne v6, v7, :cond_1

    .line 151
    .line 152
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    if-ne v6, v4, :cond_1

    .line 161
    .line 162
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    if-ne v2, v3, :cond_1

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 174
    .line 175
    const-string v0, ""

    .line 176
    .line 177
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    const/4 p1, 0x0

    .line 191
    const/4 v0, -0x1

    .line 192
    invoke-static {v0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 197
    .line 198
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    .line 200
    .line 201
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 214
    .line 215
    .line 216
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->y()V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 220
    .line 221
    new-instance v0, Ll/ana0;

    .line 222
    .line 223
    invoke-direct {v0, p0}, Ll/ana0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V

    .line 224
    .line 225
    .line 226
    const-wide/16 v1, 0x12c

    .line 227
    .line 228
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 232
    .line 233
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$a;

    .line 234
    .line 235
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 239
    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 242
    .line 243
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$b;

    .line 244
    .line 245
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 252
    .line 253
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$c;

    .line 254
    .line 255
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b$c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;)V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method
