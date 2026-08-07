.class public Ll/rkf0;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/ujf0;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Lv/VIcon;

.field public D:Lv/VLinear;

.field public E:Lv/VText;

.field public F:Lv/VLinear;

.field public G:Lv/VText;

.field public H:Lv/VLinear;

.field public I:Lv/VEditText;

.field public J:Lv/VLinear;

.field public K:Lv/VEditText;

.field public L:Lv/VText;

.field public M:Lv/VLinear;

.field public N:Lv/VCheckBox;

.field public O:Lv/VText;

.field public P:Lv/VButton;

.field public Q:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public R:Lv/VImage;

.field public S:Lv/VImage;

.field public T:Lv/VText;

.field public U:Lv/VText;

.field public V:Ll/ujf0;

.field public W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

.field public X:Landroid/view/View;

.field public Y:Landroid/view/View$OnClickListener;

.field public c:Lv/VText;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VFrame;

.field public k:Lv/VLinear;

.field public l:Lv/VIcon;

.field public m:Lv/VText;

.field public n:Lv/VImage;

.field public o:Lv/VFrame;

.field public p:Lv/VLinear;

.field public q:Lv/VIcon;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Lv/VFrame;

.field public u:Lv/VLinear;

.field public v:Lv/VIcon;

.field public w:Lv/VText;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Landroidx/constraintlayout/widget/ConstraintLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/gkf0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/gkf0;-><init>(Ll/rkf0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/rkf0;->Y:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic A(Ll/rkf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rkf0;->b0()V

    return-void
.end method

.method public static synthetic B(Ll/rkf0;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rkf0;->l0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic C(Ll/rkf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/rkf0;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->m0(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic F(Ll/rkf0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->k0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/rkf0;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->W(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic H(Ll/rkf0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->a0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic I(Ll/rkf0;Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->f0(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private N()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rkf0;->z:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v1, :cond_0

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
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "e_clone_signup_add_more_detail"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    move v2, v3

    .line 65
    :cond_2
    iget-object v0, p0, Ll/rkf0;->A:Lv/VText;

    .line 66
    .line 67
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 68
    .line 69
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 70
    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    sget v3, Ll/a9c0;->b:I

    .line 74
    .line 75
    :goto_1
    invoke-virtual {v1, v3}, Landroid/content/Context;->getColor(I)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    goto :goto_2

    .line 80
    :cond_3
    sget v3, Ll/a9c0;->e:I

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/rkf0;->B:Lv/VText;

    .line 87
    .line 88
    xor-int/lit8 v1, v2, 0x1

    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/rkf0;->A:Lv/VText;

    .line 94
    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    sget-object v1, Ll/ino;->INSTANCE:Ll/ino;

    .line 98
    .line 99
    iget-object v2, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 100
    .line 101
    invoke-virtual {v2}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 106
    .line 107
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v2, p0}, Ll/ino;->d(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    goto :goto_3

    .line 120
    :cond_4
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 121
    .line 122
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 123
    .line 124
    sget v1, Lcom/p1/mobile/putong/account/R$string;->X1:I

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    :goto_3
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ujf0;->C1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/rkf0;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/rkf0;->V(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/rkf0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->g0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l(Ll/rkf0;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->i0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic m(Ll/rkf0;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->Y(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic n(Ll/rkf0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->e0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/rkf0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->T(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/Runnable;Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic s(Ll/rkf0;Lcom/p1/mobile/putong/data/SubGender;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->c0(Lcom/p1/mobile/putong/data/SubGender;Z)V

    return-void
.end method

.method public static synthetic u(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Ll/rkf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rkf0;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/rkf0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->d0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/rkf0;Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->j0(Ljava/lang/String;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic y(Ll/rkf0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rkf0;->U(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/rkf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->X(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rkf0;->Q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/rkf0;->R:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/rkf0;->T:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/rkf0;->t:Lv/VFrame;

    .line 18
    .line 19
    sget-object v2, Ll/ino;->INSTANCE:Ll/ino;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/ino;->j()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/nkf0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/nkf0;-><init>(Ll/rkf0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/rkf0;->f:Lv/VText;

    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    check-cast v3, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 46
    .line 47
    sget v4, Lcom/p1/mobile/putong/account/R$string;->C2:I

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    check-cast v3, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 59
    .line 60
    sget v4, Lcom/p1/mobile/putong/account/R$string;->R3:I

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/rkf0;->P:Lv/VButton;

    .line 77
    .line 78
    sget v2, Lcom/p1/mobile/putong/account/R$string;->k0:I

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/rkf0;->j:Lv/VFrame;

    .line 84
    .line 85
    const-string v2, "e_profilepage_male_button"

    .line 86
    .line 87
    const-string v3, "male"

    .line 88
    .line 89
    invoke-virtual {p0, v0, v2, p1, v3}, Ll/rkf0;->P(Lv/VFrame;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/rkf0;->o:Lv/VFrame;

    .line 93
    .line 94
    const-string v2, "e_profilepage_female_button"

    .line 95
    .line 96
    const-string v3, "female"

    .line 97
    .line 98
    invoke-virtual {p0, v0, v2, p1, v3}, Ll/rkf0;->P(Lv/VFrame;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/rkf0;->t:Lv/VFrame;

    .line 102
    .line 103
    const-string v2, "e_profilepage_nonbinary_button"

    .line 104
    .line 105
    const-string v3, "nonbinary"

    .line 106
    .line 107
    invoke-virtual {p0, v0, v2, p1, v3}, Ll/rkf0;->P(Lv/VFrame;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/rkf0;->z:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 111
    .line 112
    new-instance v2, Ll/qkf0;

    .line 113
    .line 114
    invoke-direct {v2, p0, p1}, Ll/qkf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 121
    .line 122
    new-instance v2, Ll/wjf0;

    .line 123
    .line 124
    invoke-direct {v2, p0, p1}, Ll/wjf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    new-instance v2, Ll/xjf0;

    .line 137
    .line 138
    invoke-direct {v2, p0, p1}, Ll/xjf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 146
    .line 147
    .line 148
    new-instance v0, Ll/yjf0;

    .line 149
    .line 150
    invoke-direct {v0, p0, p1}, Ll/yjf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Ll/rkf0;->g:Lv/VText;

    .line 154
    .line 155
    new-instance v3, Ll/zjf0;

    .line 156
    .line 157
    invoke-direct {v3, v0}, Ll/zjf0;-><init>(Ljava/lang/Runnable;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Ll/rkf0;->g:Lv/VText;

    .line 164
    .line 165
    new-instance v3, Ll/akf0;

    .line 166
    .line 167
    invoke-direct {v3, v0}, Ll/akf0;-><init>(Ljava/lang/Runnable;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/rkf0;->G:Lv/VText;

    .line 174
    .line 175
    new-instance v2, Ll/bkf0;

    .line 176
    .line 177
    invoke-direct {v2, p0}, Ll/bkf0;-><init>(Ll/rkf0;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Ll/rkf0;->G:Lv/VText;

    .line 184
    .line 185
    new-instance v2, Ll/ckf0;

    .line 186
    .line 187
    invoke-direct {v2, p0}, Ll/ckf0;-><init>(Ll/rkf0;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/rkf0;->E:Lv/VText;

    .line 194
    .line 195
    new-instance v2, Ll/dkf0;

    .line 196
    .line 197
    invoke-direct {v2, p0}, Ll/dkf0;-><init>(Ll/rkf0;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Ll/rkf0;->E:Lv/VText;

    .line 204
    .line 205
    new-instance v2, Ll/okf0;

    .line 206
    .line 207
    invoke-direct {v2, p0}, Ll/okf0;-><init>(Ll/rkf0;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Ll/rkf0;->I:Lv/VEditText;

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    new-instance v1, Ll/pkf0;

    .line 220
    .line 221
    invoke-direct {v1, p0}, Ll/pkf0;-><init>(Ll/rkf0;)V

    .line 222
    .line 223
    .line 224
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, p1}, Ll/rkf0;->y0(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public J(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/skf0;->b(Ll/rkf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public K()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/skf0;->c(Ll/rkf0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Ll/ujf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    return-void
.end method

.method public final M(Landroid/view/ViewGroup;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->facebook:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 8
    .line 9
    const/16 p1, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final P(Lv/VFrame;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ekf0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3, p4}, Ll/ekf0;-><init>(Ll/rkf0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "DOCTOR"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x6

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "UPPER_PRIMARY"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x5

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "VOCATIONAL_SCHOOL"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x4

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v0, "HIGH_SCHOOL"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v1, 0x3

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v0, "LOWER_PRIMARY"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v1, 0x2

    .line 71
    goto :goto_0

    .line 72
    :sswitch_5
    const-string v0, "BACHELOR"

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    const/4 v1, 0x1

    .line 82
    goto :goto_0

    .line 83
    :sswitch_6
    const-string v0, "MASTER"

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    const/4 v1, 0x0

    .line 93
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 94
    .line 95
    .line 96
    const-string p0, ""

    .line 97
    .line 98
    return-object p0

    .line 99
    :pswitch_0
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    sget p1, Lcom/p1/mobile/putong/account/R$string;->M2:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :pswitch_1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Q2:I

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :pswitch_2
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    sget p1, Lcom/p1/mobile/putong/account/R$string;->R2:I

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :pswitch_3
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    sget p1, Lcom/p1/mobile/putong/account/R$string;->N2:I

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    return-object p0

    .line 159
    :pswitch_4
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    sget p1, Lcom/p1/mobile/putong/account/R$string;->O2:I

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    return-object p0

    .line 174
    :pswitch_5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    sget p1, Lcom/p1/mobile/putong/account/R$string;->L2:I

    .line 183
    .line 184
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :pswitch_6
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    sget p1, Lcom/p1/mobile/putong/account/R$string;->P2:I

    .line 198
    .line 199
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0

    .line 204
    nop

    .line 205
    :sswitch_data_0
    .sparse-switch
        -0x78dfe19e -> :sswitch_6
        -0x53119052 -> :sswitch_5
        -0x3d3ffd7c -> :sswitch_4
        0x12773cb1 -> :sswitch_3
        0x1788c5fd -> :sswitch_2
        0x1acbff25 -> :sswitch_1
        0x7882851f -> :sswitch_0
    .end sparse-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final R(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->google:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 8
    .line 9
    const/16 p1, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final S(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/rkf0;->u0()V

    .line 25
    .line 26
    .line 27
    :cond_0
    sget-object v0, Ll/ino;->INSTANCE:Ll/ino;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ino;->j()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->P0()Ll/wyd0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, p1, v0}, Ll/rkf0;->t0(Ll/wyd0;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 78
    .line 79
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->P0()Ll/wyd0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p0, p1, v0}, Ll/rkf0;->t0(Ll/wyd0;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object p1, p0, Ll/rkf0;->i:Lv/VLinear;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/rkf0;->y:Lv/VText;

    .line 106
    .line 107
    const/16 v0, 0x8

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 113
    .line 114
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 115
    .line 116
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final synthetic T(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rkf0;->S(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p4, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    const-string v0, "signup_source"

    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "phone_num"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-static {p1, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Ll/ino;->INSTANCE:Ll/ino;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/ino;->j()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p3}, Ll/rkf0;->S(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 47
    .line 48
    new-instance p2, Ll/ikf0;

    .line 49
    .line 50
    invoke-direct {p2, p0, p3}, Ll/ikf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p2}, Ll/ujf0;->j1(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic V(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x5

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 7
    .line 8
    iget-object p0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic W(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ujf0;->I1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ujf0;->I1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ujf0;->H1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ujf0;->H1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->school:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/rkf0;->x0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic b(Ll/ibf0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rkf0;->L(Ll/ujf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 17
    .line 18
    new-instance v1, Ll/fkf0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/fkf0;-><init>(Ll/rkf0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/SubGender;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/rkf0;->u0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic d0(Ljava/lang/String;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "signup_source"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "e_clone_signup_add_more_detail"

    .line 20
    .line 21
    invoke-static {v0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v0, Ll/ino;->INSTANCE:Ll/ino;

    .line 33
    .line 34
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    :goto_0
    move-object v2, p1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SubGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SubGender;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    goto :goto_0

    .line 50
    :goto_1
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 57
    .line 58
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-boolean v4, p1, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 65
    .line 66
    new-instance v5, Ll/hkf0;

    .line 67
    .line 68
    invoke-direct {v5, p0}, Ll/hkf0;-><init>(Ll/rkf0;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual/range {v0 .. v5}, Ll/ino;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/SubGender;Lcom/p1/mobile/putong/data/IntlGender;ZLl/gno$b;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rkf0;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e0(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "signup_source"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "phone_num"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_profilepage_name_input"

    .line 32
    .line 33
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic f0(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "signup_source"

    .line 28
    .line 29
    const-string v4, "phone_num"

    .line 30
    .line 31
    filled-new-array {v3, p1, v4, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v2, "e_profilepage_name_input"

    .line 36
    .line 37
    invoke-static {v2, v0, v1, p1}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->Q0()Ll/wyd0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p2, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object p2, p2, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->t0(Ll/wyd0;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/rkf0;->e:Lv/VText;

    .line 70
    .line 71
    iget-object p2, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 72
    .line 73
    invoke-virtual {p2}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    iget-object p2, p2, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p2}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->q0(Lv/VText;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Ll/rkf0;->x0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic g0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "signup_source"

    .line 10
    .line 11
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "phone_num"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {p1, v1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v1, "e_profilepage_birthday_button"

    .line 32
    .line 33
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ujf0;->h1()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rkf0;->L:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/rkf0;->q0(Lv/VText;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i0(Landroid/view/MenuItem;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_prelogin_profile_info_page_feedback"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "https://feedback.tantanapp.com/feedback-mobile/pre-login"

    .line 23
    .line 24
    invoke-static {v0}, Ll/ebe0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "\u5e2e\u52a9\u4e0e\u53cd\u9988"

    .line 29
    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-static {p0, v1, v0, v2}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return v2
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rkf0;->L(Ll/ujf0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rkf0;->J(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/rkf0;->X:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public final synthetic j0(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "signup_source"

    .line 28
    .line 29
    const-string v4, "phone_num"

    .line 30
    .line 31
    filled-new-array {v3, p1, v4, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v2, "e_profilepage_password_input"

    .line 36
    .line 37
    invoke-static {v2, v0, v1, p1}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 51
    .line 52
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    const/16 p2, 0x8

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const/4 p2, 0x6

    .line 74
    :goto_0
    if-lt p1, p2, :cond_1

    .line 75
    .line 76
    const/4 p1, 0x0

    .line 77
    invoke-virtual {p0, p1}, Ll/rkf0;->i(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/rkf0;->x0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic k0(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "signup_source"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "phone_num"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_profilepage_password_input"

    .line 32
    .line 33
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic l0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-eq p2, p1, :cond_0

    .line 3
    .line 4
    const/4 p1, 0x6

    .line 5
    if-eq p2, p1, :cond_0

    .line 6
    .line 7
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const/16 p1, 0x42

    .line 14
    .line 15
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-ne p1, p2, :cond_1

    .line 20
    .line 21
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/rkf0;->Y:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    iget-object p0, p0, Ll/rkf0;->P:Lv/VButton;

    .line 30
    .line 31
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public final synthetic m0(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf0;->W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 2
    .line 3
    xor-int/lit8 p1, p2, 0x1

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/OtherSettingsOthers;->refuseSMS:Z

    .line 6
    .line 7
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/data/SignUpData;ZZLjava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rkf0;->P:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isActivated()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "phone_num"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    check-cast p4, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 17
    .line 18
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 19
    .line 20
    .line 21
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->b1:Z

    .line 22
    .line 23
    iput-boolean p3, p1, Lcom/p1/mobile/putong/data/SignUpData;->b2:Z

    .line 24
    .line 25
    iput-boolean v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->b3:Z

    .line 26
    .line 27
    iget-object p2, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    :cond_0
    iput-boolean v2, p1, Lcom/p1/mobile/putong/data/SignUpData;->b4:Z

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->lmdEnd()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->bb:Z

    .line 43
    .line 44
    sget-object p2, Lv/VLinear;->b:Lv/VLinear$a;

    .line 45
    .line 46
    invoke-virtual {p2}, Lv/VLinear$a;->b()Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iget-object p3, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p3, Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    iput-boolean p3, p1, Lcom/p1/mobile/putong/data/SignUpData;->tsd1:Z

    .line 59
    .line 60
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast p2, Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->tsd2:Z

    .line 69
    .line 70
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 75
    .line 76
    invoke-virtual {p2, p3}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p2, p0, Ll/rkf0;->W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 83
    .line 84
    iput-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->others:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 85
    .line 86
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 87
    .line 88
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iget-object p3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 95
    .line 96
    invoke-virtual {p3}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    filled-new-array {p3}, [Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    const-string p4, "e_profilepage_signup_continue_button"

    .line 109
    .line 110
    invoke-static {p4, p2, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ll/ujf0;->i1(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_1
    iget-object p2, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 120
    .line 121
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-nez p2, :cond_2

    .line 126
    .line 127
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 128
    .line 129
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 130
    .line 131
    iget-object p3, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 132
    .line 133
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 134
    .line 135
    .line 136
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 137
    .line 138
    if-nez p2, :cond_3

    .line 139
    .line 140
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 141
    .line 142
    if-nez p2, :cond_3

    .line 143
    .line 144
    iget-object p2, p0, Ll/rkf0;->y:Lv/VText;

    .line 145
    .line 146
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 147
    .line 148
    .line 149
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 150
    .line 151
    if-nez p2, :cond_4

    .line 152
    .line 153
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 154
    .line 155
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 156
    .line 157
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->pageId()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p2

    .line 161
    const-string p3, "signup_source"

    .line 162
    .line 163
    invoke-static {p3, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    iget-object p4, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 168
    .line 169
    invoke-virtual {p4}, Ll/ujf0;->F1()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p4

    .line 173
    invoke-static {v1, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object p4

    .line 177
    filled-new-array {p3, p4}, [Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    const-string p4, "e_profilepage_birthday_empty_alert"

    .line 182
    .line 183
    invoke-static {p4, p2, p3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 184
    .line 185
    .line 186
    iget-object p2, p0, Ll/rkf0;->h:Lv/VText;

    .line 187
    .line 188
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 189
    .line 190
    check-cast p3, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 191
    .line 192
    sget p4, Lcom/p1/mobile/putong/account/R$string;->l3:I

    .line 193
    .line 194
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p3

    .line 198
    invoke-virtual {p0, p2, p3}, Ll/rkf0;->q0(Lv/VText;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    :cond_4
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result p2

    .line 207
    if-eqz p2, :cond_5

    .line 208
    .line 209
    iget-object p2, p0, Ll/rkf0;->e:Lv/VText;

    .line 210
    .line 211
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 212
    .line 213
    check-cast p3, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 214
    .line 215
    sget p4, Lcom/p1/mobile/putong/account/R$string;->m3:I

    .line 216
    .line 217
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p3

    .line 221
    invoke-virtual {p0, p2, p3}, Ll/rkf0;->q0(Lv/VText;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_5
    iget-object p2, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 225
    .line 226
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    if-nez p2, :cond_6

    .line 231
    .line 232
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 233
    .line 234
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result p2

    .line 238
    if-eqz p2, :cond_6

    .line 239
    .line 240
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 241
    .line 242
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 243
    .line 244
    sget p2, Lcom/p1/mobile/putong/account/R$string;->n3:I

    .line 245
    .line 246
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {p0, p1}, Ll/rkf0;->i(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_2

    .line 254
    :cond_6
    iget-object p2, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 255
    .line 256
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    if-nez p2, :cond_9

    .line 261
    .line 262
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 269
    .line 270
    .line 271
    move-result p2

    .line 272
    if-eqz p2, :cond_7

    .line 273
    .line 274
    const/16 p2, 0x8

    .line 275
    .line 276
    goto :goto_0

    .line 277
    :cond_7
    const/4 p2, 0x6

    .line 278
    :goto_0
    if-ge p1, p2, :cond_9

    .line 279
    .line 280
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 285
    .line 286
    if-eqz p1, :cond_8

    .line 287
    .line 288
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 289
    .line 290
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Y0:I

    .line 291
    .line 292
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    goto :goto_1

    .line 297
    :cond_8
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;

    .line 298
    .line 299
    sget p1, Lcom/p1/mobile/putong/account/R$string;->V:I

    .line 300
    .line 301
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    :goto_1
    invoke-static {p1}, Ll/lu6;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p0, p1}, Ll/rkf0;->i(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    :cond_9
    :goto_2
    sget p0, Lcom/p1/mobile/putong/account/R$string;->q3:I

    .line 313
    .line 314
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 315
    .line 316
    .line 317
    return-void
.end method

.method public o0(Landroid/view/Menu;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/bp;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget v0, Ll/wcc0;->J:I

    .line 9
    .line 10
    const-string v2, "\u9047\u5230\u95ee\u9898\uff1f"

    .line 11
    .line 12
    invoke-interface {p1, v1, v0, v1, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x2

    .line 17
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/vjf0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/vjf0;-><init>(Ll/rkf0;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v1
.end method

.method public p0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rkf0;->g:Lv/VText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q0(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public r0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/rkf0;->j:Lv/VFrame;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rkf0;->n:Lv/VImage;

    .line 4
    .line 5
    sget-object v2, Ll/ino;->INSTANCE:Ll/ino;

    .line 6
    .line 7
    iget-object v3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 8
    .line 9
    invoke-virtual {v3}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const-string v4, "male"

    .line 14
    .line 15
    invoke-virtual {v2, v4, v3}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {p0, v0, v1, v3}, Ll/rkf0;->M(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/rkf0;->o:Lv/VFrame;

    .line 23
    .line 24
    iget-object v1, p0, Ll/rkf0;->s:Lv/VImage;

    .line 25
    .line 26
    iget-object v3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v5, "female"

    .line 33
    .line 34
    invoke-virtual {v2, v5, v3}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-virtual {p0, v0, v1, v3}, Ll/rkf0;->M(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ll/ino;->j()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/rkf0;->t:Lv/VFrame;

    .line 48
    .line 49
    iget-object v1, p0, Ll/rkf0;->x:Lv/VImage;

    .line 50
    .line 51
    iget-object v3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 52
    .line 53
    invoke-virtual {v3}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const-string v5, "nonbinary"

    .line 58
    .line 59
    invoke-virtual {v2, v5, v3}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p0, v0, v1, v3}, Ll/rkf0;->M(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Ll/rkf0;->N()V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    iget-object v0, p0, Ll/rkf0;->g:Lv/VText;

    .line 84
    .line 85
    sget-object v1, Ll/pzi0;->c:Ljava/text/SimpleDateFormat;

    .line 86
    .line 87
    iget-object v3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 88
    .line 89
    invoke-virtual {v3}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->l()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v2, v4, v0}, Ll/ino;->h(Ljava/lang/String;Lcom/p1/mobile/putong/data/SignUpData;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iget-object v1, p0, Ll/rkf0;->F:Lv/VLinear;

    .line 119
    .line 120
    const/16 v2, 0x8

    .line 121
    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    const/4 v0, 0x0

    .line 125
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 135
    .line 136
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_4

    .line 141
    .line 142
    iget-object v1, p0, Ll/rkf0;->G:Lv/VText;

    .line 143
    .line 144
    iget-object v3, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 145
    .line 146
    invoke-virtual {v3}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 151
    .line 152
    invoke-virtual {p0, v3}, Ll/rkf0;->Q(Lcom/p1/mobile/putong/data/QualificationType;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 160
    .line 161
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 166
    .line 167
    invoke-static {v1}, Ll/bsj0;->J(Lcom/p1/mobile/putong/data/QualificationType;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    iget-object v3, p0, Ll/rkf0;->H:Lv/VLinear;

    .line 172
    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 176
    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_2
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_3
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/rkf0;->H:Lv/VLinear;

    .line 187
    .line 188
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/rkf0;->D:Lv/VLinear;

    .line 192
    .line 193
    invoke-static {}, Ll/s43;->b()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 201
    .line 202
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 207
    .line 208
    if-eqz v0, :cond_5

    .line 209
    .line 210
    iget-object v0, p0, Ll/rkf0;->E:Lv/VText;

    .line 211
    .line 212
    iget-object v1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 213
    .line 214
    invoke-virtual {v1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 219
    .line 220
    invoke-static {v1}, Ll/s43;->a(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    :cond_5
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 228
    .line 229
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {p0, v0}, Ll/rkf0;->x0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/rkf0;->r0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final t0(Ll/wyd0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->subGenderOption:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->N1()Ll/wyd0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->O1()Ll/jxd0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public v0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rkf0;->h:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/rkf0;->q0(Lv/VText;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public w0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-interface {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "from_sign_up"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_7

    .line 9
    .line 10
    iget-object v0, p0, Ll/rkf0;->d:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/TextView;->getError()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_7

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 19
    .line 20
    if-eqz v0, :cond_7

    .line 21
    .line 22
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    long-to-double v2, v2

    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    cmpl-double v0, v2, v4

    .line 38
    .line 39
    if-ltz v0, :cond_7

    .line 40
    .line 41
    invoke-static {}, Ll/bsj0;->N()Ljava/util/Date;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    long-to-double v2, v2

    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->birthdate:Ljava/lang/Double;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 53
    .line 54
    .line 55
    move-result-wide v4

    .line 56
    cmpg-double v0, v2, v4

    .line 57
    .line 58
    if-gez v0, :cond_7

    .line 59
    .line 60
    iget-object v0, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v0, :cond_7

    .line 71
    .line 72
    :cond_0
    iget-object v0, p0, Ll/rkf0;->J:Lv/VLinear;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->password:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_1

    .line 91
    .line 92
    const/16 v2, 0x8

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    const/4 v2, 0x6

    .line 96
    :goto_0
    if-lt v0, v2, :cond_7

    .line 97
    .line 98
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 99
    .line 100
    if-nez v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 103
    .line 104
    if-eqz v0, :cond_7

    .line 105
    .line 106
    :cond_3
    iget-object v0, p0, Ll/rkf0;->F:Lv/VLinear;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_4

    .line 113
    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    const-string v2, "unknown_"

    .line 119
    .line 120
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_7

    .line 125
    .line 126
    :cond_4
    iget-object v0, p0, Ll/rkf0;->H:Lv/VLinear;

    .line 127
    .line 128
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_5

    .line 133
    .line 134
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignUpData;->school:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_7

    .line 141
    .line 142
    :cond_5
    iget-object v0, p0, Ll/rkf0;->D:Lv/VLinear;

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_6

    .line 149
    .line 150
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->bloodType:Lcom/p1/mobile/putong/data/BloodType;

    .line 151
    .line 152
    if-eqz p1, :cond_7

    .line 153
    .line 154
    :cond_6
    move p1, v1

    .line 155
    goto :goto_1

    .line 156
    :cond_7
    const/4 p1, 0x0

    .line 157
    :goto_1
    iget-object p0, p0, Ll/rkf0;->P:Lv/VButton;

    .line 158
    .line 159
    xor-int/2addr p1, v1

    .line 160
    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public y0(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->nopassword:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/jkf0;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/jkf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 46
    .line 47
    new-instance v1, Ll/kkf0;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/kkf0;-><init>(Ll/rkf0;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/rkf0;->K:Lv/VEditText;

    .line 56
    .line 57
    new-instance v0, Ll/lkf0;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/lkf0;-><init>(Ll/rkf0;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->i()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->countryCode:I

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->h(I)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    :cond_2
    iget-object p1, p0, Ll/rkf0;->W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 86
    .line 87
    if-nez p1, :cond_3

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/data/OtherSettingsOthers;->new_()Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Ll/rkf0;->W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 94
    .line 95
    :cond_3
    iget-object p1, p0, Ll/rkf0;->W:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

    .line 96
    .line 97
    const/4 v0, 0x1

    .line 98
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/OtherSettingsOthers;->refuseSMS:Z

    .line 99
    .line 100
    iget-object p1, p0, Ll/rkf0;->M:Lv/VLinear;

    .line 101
    .line 102
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/rkf0;->N:Lv/VCheckBox;

    .line 106
    .line 107
    new-instance v0, Ll/mkf0;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/mkf0;-><init>(Ll/rkf0;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 113
    .line 114
    .line 115
    :cond_4
    iget-object p1, p0, Ll/rkf0;->P:Lv/VButton;

    .line 116
    .line 117
    iget-object v0, p0, Ll/rkf0;->Y:Landroid/view/View$OnClickListener;

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 123
    .line 124
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1}, Ll/rkf0;->O(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p0, p1}, Ll/rkf0;->R(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p0, p1}, Ll/rkf0;->s0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Ll/rkf0;->V:Ll/ujf0;

    .line 150
    .line 151
    invoke-virtual {p1}, Ll/ujf0;->k1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p0, p1}, Ll/rkf0;->x0(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
