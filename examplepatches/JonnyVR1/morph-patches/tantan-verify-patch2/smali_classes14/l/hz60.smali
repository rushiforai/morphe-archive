.class public Ll/hz60;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/oy60;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VMaterialEdit_FakeSpinner;

.field public f:Lv/VMaterialEdit;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VMaterialEdit;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VButton_FakeShadow;

.field public q:Ll/oy60;

.field public r:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/py60;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/py60;-><init>(Ll/hz60;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/hz60;->r:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic A(Ll/hz60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->b0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic B(Ll/hz60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->R(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic C(Ll/hz60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz60;->W(Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V

    return-void
.end method

.method private synthetic U(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->V()V

    return-void
.end method

.method public static synthetic k(Ll/hz60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/hz60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/hz60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/hz60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hz60;->U(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->Z()V

    return-void
.end method

.method public static synthetic q(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz60;->S(Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->Q()V

    return-void
.end method

.method public static synthetic u(Ll/hz60;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->T(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic v(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->a0()V

    return-void
.end method

.method public static synthetic w(Ll/hz60;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hz60;->O(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic x(Ll/hz60;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hz60;->X(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic y(Ll/hz60;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hz60;->Y(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic z(Ll/hz60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->P()V

    return-void
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/iz60;->b(Ll/hz60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/iz60;->c(Ll/hz60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ll/oy60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hz60;->q:Ll/oy60;

    .line 2
    .line 3
    return-void
.end method

.method public I()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    const-string v1, "account"

    .line 4
    .line 5
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 14
    .line 15
    invoke-virtual {p0}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_0
    sget-object p0, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ll/nsb;

    .line 45
    .line 46
    iget p0, p0, Ll/nsb;->b:I

    .line 47
    .line 48
    return p0
.end method

.method public J()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "+"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 9
    .line 10
    invoke-virtual {v1}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public K()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public L(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 2

    .line 1
    const-string v0, "ban-appeal"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 10
    .line 11
    const-string p1, "+86"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p1, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Ll/nsb;

    .line 25
    .line 26
    iget p1, p1, Ll/nsb;->b:I

    .line 27
    .line 28
    iget-object p0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 29
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v1, "+"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    new-instance v1, Ll/zy60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zy60;-><init>(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string v0, "ban-appeal"

    .line 20
    .line 21
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v2, Ll/cz60;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/cz60;-><init>(Ll/hz60;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

    .line 54
    .line 55
    iget-object v2, p0, Ll/hz60;->r:Landroid/view/View$OnClickListener;

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 61
    .line 62
    new-instance v2, Ll/dz60;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/dz60;-><init>(Ll/hz60;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    const-string v0, "change-phone"

    .line 79
    .line 80
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 87
    .line 88
    sget-object v2, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 100
    .line 101
    if-nez v0, :cond_1

    .line 102
    .line 103
    new-instance v0, Ll/ez60;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/ez60;-><init>(Ll/hz60;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    new-instance v0, Ll/fz60;

    .line 113
    .line 114
    invoke-direct {v0, p0}, Ll/fz60;-><init>(Ll/hz60;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v2, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_3

    .line 127
    .line 128
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v2, Ll/gz60;

    .line 135
    .line 136
    invoke-direct {v2, p0}, Ll/gz60;-><init>(Ll/hz60;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 147
    .line 148
    new-instance v2, Ll/qy60;

    .line 149
    .line 150
    invoke-direct {v2, p0}, Ll/qy60;-><init>(Ll/hz60;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 157
    .line 158
    new-instance v2, Ll/ry60;

    .line 159
    .line 160
    invoke-direct {v2, p0}, Ll/ry60;-><init>(Ll/hz60;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 164
    .line 165
    .line 166
    :cond_3
    iget-object v0, p0, Ll/hz60;->o:Lv/VText;

    .line 167
    .line 168
    const/16 v2, 0x8

    .line 169
    .line 170
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 171
    .line 172
    .line 173
    const-string v0, "signin"

    .line 174
    .line 175
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_5

    .line 180
    .line 181
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 182
    .line 183
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 187
    .line 188
    sget v0, Lcom/p1/mobile/putong/account/R$string;->w3:I

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ll/hz60;->I()I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    iget-object v0, p0, Ll/hz60;->n:Lv/VText;

    .line 198
    .line 199
    const/16 v1, 0x56

    .line 200
    .line 201
    if-ne p1, v1, :cond_4

    .line 202
    .line 203
    sget p1, Lcom/p1/mobile/putong/account/R$string;->m0:I

    .line 204
    .line 205
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 209
    .line 210
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    sget v1, Lcom/p1/mobile/putong/account/R$string;->o0:I

    .line 215
    .line 216
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    new-instance v1, Ll/sy60;

    .line 221
    .line 222
    invoke-direct {v1, p0}, Ll/sy60;-><init>(Ll/hz60;)V

    .line 223
    .line 224
    .line 225
    invoke-static {p1, v0, v1}, Ll/gsj0;->c(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :cond_4
    sget p1, Lcom/p1/mobile/putong/account/R$string;->w3:I

    .line 230
    .line 231
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 235
    .line 236
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 237
    .line 238
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 239
    .line 240
    sget v1, Lcom/p1/mobile/putong/account/R$string;->x3:I

    .line 241
    .line 242
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    new-instance v1, Ll/ty60;

    .line 247
    .line 248
    invoke-direct {v1, p0}, Ll/ty60;-><init>(Ll/hz60;)V

    .line 249
    .line 250
    .line 251
    invoke-static {p1, v0, v1}, Ll/gsj0;->c(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 252
    .line 253
    .line 254
    goto :goto_1

    .line 255
    :cond_5
    const-string v0, "signup"

    .line 256
    .line 257
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_6

    .line 262
    .line 263
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 264
    .line 265
    new-instance v1, Ll/az60;

    .line 266
    .line 267
    invoke-direct {v1, p0, p1}, Ll/az60;-><init>(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 274
    .line 275
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 276
    .line 277
    .line 278
    :cond_6
    :goto_1
    invoke-virtual {p0}, Ll/hz60;->j0()V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    iget-object v0, p0, Ll/hz60;->c:Lv/VLinear;

    .line 286
    .line 287
    new-instance v1, Ll/bz60;

    .line 288
    .line 289
    invoke-direct {v1, p0}, Ll/bz60;-><init>(Ll/hz60;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setKeyboardListener(Landroid/view/View;Ll/y20;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 293
    .line 294
    .line 295
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "e_password_input"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic O(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
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
    iget-object p1, p0, Ll/hz60;->r:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    iget-object p0, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

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

.method public final synthetic P()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/hz60;->K()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "phone_num"

    .line 18
    .line 19
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    filled-new-array {v1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "e_password_verifypage_switch_button"

    .line 28
    .line 29
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/hz60;->q:Ll/oy60;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/oy60;->c2()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_password_verifypage_reset_button"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/hz60;->q:Ll/oy60;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/oy60;->Z1()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic R(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hz60;->j0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "ban-appeal"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "e_area_code_button"

    .line 18
    .line 19
    invoke-static {p2, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 23
    .line 24
    invoke-virtual {p1}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "p_country_code_selection_view"

    .line 38
    .line 39
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    new-instance v0, Ll/wy60;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/wy60;-><init>(Ll/hz60;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, v0, p1}, Ll/sm;->c0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/l4g0;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic T(Ljava/lang/Boolean;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 8
    .line 9
    iget-object v0, p0, Ll/hz60;->c:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/hz60;->o:Lv/VText;

    .line 16
    .line 17
    iget-object v1, p0, Ll/hz60;->c:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/hz60;->n:Lv/VText;

    .line 24
    .line 25
    iget-object v2, p0, Ll/hz60;->c:Lv/VLinear;

    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/hz60;->n:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/16 v3, 0x8

    .line 38
    .line 39
    const/high16 v4, 0x41200000    # 10.0f

    .line 40
    .line 41
    if-nez v2, :cond_0

    .line 42
    .line 43
    iget p1, v0, Ll/bnl0$g;->b:I

    .line 44
    .line 45
    iget v0, v1, Ll/bnl0$g;->b:I

    .line 46
    .line 47
    iget v1, v1, Ll/bnl0$g;->d:I

    .line 48
    .line 49
    add-int/2addr v0, v1

    .line 50
    sub-int/2addr p1, v0

    .line 51
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-ge p1, v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Ll/hz60;->o:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    iget v0, v0, Ll/bnl0$g;->b:I

    .line 64
    .line 65
    iget v1, p1, Ll/bnl0$g;->b:I

    .line 66
    .line 67
    iget p1, p1, Ll/bnl0$g;->d:I

    .line 68
    .line 69
    add-int/2addr v1, p1

    .line 70
    sub-int/2addr v0, v1

    .line 71
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-ge v0, p1, :cond_1

    .line 76
    .line 77
    iget-object p0, p0, Ll/hz60;->o:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void

    .line 83
    :cond_2
    iget-object p0, p0, Ll/hz60;->o:Lv/VText;

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hz60;->q:Ll/oy60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    new-instance v1, Ll/xy60;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/xy60;-><init>(Ll/hz60;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/sm;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "ban-appeal"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_area_code_button"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance p1, Ll/vy60;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/vy60;-><init>(Ll/hz60;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic X(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->q:Ll/oy60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oy60;->f2(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
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
    iget-object p1, p0, Ll/hz60;->r:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    iget-object p0, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

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

.method public final synthetic Z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic b(Ll/ibf0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oy60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hz60;->H(Ll/oy60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b0(Ljava/lang/CharSequence;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

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
    const/4 v2, 0x0

    .line 22
    new-array v2, v2, [Ljava/lang/Object;

    .line 23
    .line 24
    const-string v3, "e_password_input"

    .line 25
    .line 26
    invoke-static {v3, v0, v1, v2}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/hz60;->q:Ll/oy60;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/oy60;->Y1(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/hz60;->j0()V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-lez p1, :cond_0

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Ll/hz60;->i(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "e_phone_input"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/hz60;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p1, :cond_2

    .line 10
    .line 11
    iget-object p1, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 24
    .line 25
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/account/R$string;->p3:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p1, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    move v1, v0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    iget-object p1, p0, Ll/hz60;->q:Ll/oy60;

    .line 41
    .line 42
    iget-object v2, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {p1, v2}, Ll/oy60;->n1(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Lcom/p1/mobile/putong/account/R$string;->K3:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    :goto_1
    iget-object p1, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 75
    .line 76
    new-instance v2, Ll/yy60;

    .line 77
    .line 78
    invoke-direct {v2, p0}, Ll/yy60;-><init>(Ll/hz60;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_4

    .line 91
    .line 92
    iget-object p1, p0, Ll/hz60;->q:Ll/oy60;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/oy60;->d2()V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 110
    .line 111
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 112
    .line 113
    sget v1, Lcom/p1/mobile/putong/account/R$string;->o3:I

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p1}, Ll/hz60;->i(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    iget-object p1, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 124
    .line 125
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    const/4 v2, 0x6

    .line 134
    if-ge p1, v2, :cond_4

    .line 135
    .line 136
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 137
    .line 138
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 139
    .line 140
    sget v1, Lcom/p1/mobile/putong/account/R$string;->I3:I

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p1}, Ll/lu6;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p0, p1}, Ll/hz60;->i(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_4
    move v0, v1

    .line 155
    :goto_2
    iget-object p1, p0, Ll/hz60;->g:Lv/VText;

    .line 156
    .line 157
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 164
    .line 165
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    const-string v1, "is_binding_phonenumber"

    .line 172
    .line 173
    const-string v2, "0"

    .line 174
    .line 175
    invoke-static {v1, v2}, Ll/rfj0$a;->f(Ljava/lang/String;Ljava/lang/String;)Ll/rfj0$a;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    filled-new-array {v1}, [Ll/rfj0$a;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    const-string v2, "e_p_appeal_verify_phonenumber_page_next"

    .line 184
    .line 185
    invoke-static {v2, p1, v1}, Ll/rfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 186
    .line 187
    .line 188
    :cond_5
    iget-object p0, p0, Ll/hz60;->q:Ll/oy60;

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ll/oy60;->h2(Z)V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hz60;->G()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_prelogin_password_page_feedback"

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
    const/4 v1, 0x1

    .line 29
    const-string v2, "\u5e2e\u52a9\u4e0e\u53cd\u9988"

    .line 30
    .line 31
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public f0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hz60;->I()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x56

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public g0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/jbf0;->d(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 4

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
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, -0x1

    .line 15
    sparse-switch v0, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :sswitch_0
    const-string v0, "ban-appeal"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v3, 0x2

    .line 29
    goto :goto_0

    .line 30
    :sswitch_1
    const-string v0, "signup"

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v3, v1

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string v0, "signin"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v3, v2

    .line 51
    :goto_0
    const/16 p1, 0x8

    .line 52
    .line 53
    packed-switch v3, :pswitch_data_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :pswitch_0
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 58
    .line 59
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 60
    .line 61
    sget p2, Lcom/p1/mobile/putong/account/R$string;->A:I

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

    .line 67
    .line 68
    sget p2, Lcom/p1/mobile/putong/account/R$string;->d:I

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/hz60;->g:Lv/VText;

    .line 74
    .line 75
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 79
    .line 80
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/hz60;->n:Lv/VText;

    .line 84
    .line 85
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/hz60;->m:Lv/VText;

    .line 89
    .line 90
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :pswitch_1
    iget-object p2, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 95
    .line 96
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    .line 97
    .line 98
    const/16 v3, 0x14

    .line 99
    .line 100
    invoke-direct {v0, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 101
    .line 102
    .line 103
    new-array v1, v1, [Landroid/text/InputFilter;

    .line 104
    .line 105
    aput-object v0, v1, v2

    .line 106
    .line 107
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 111
    .line 112
    check-cast p2, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 113
    .line 114
    sget v0, Lcom/p1/mobile/putong/account/R$string;->a:I

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

    .line 120
    .line 121
    sget v0, Lcom/p1/mobile/putong/account/R$string;->c:I

    .line 122
    .line 123
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 132
    .line 133
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 134
    .line 135
    const/16 p2, 0x7530

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->lmdStart(I)V

    .line 138
    .line 139
    .line 140
    sget-object p1, Lv/VLinear;->b:Lv/VLinear$a;

    .line 141
    .line 142
    invoke-virtual {p1}, Lv/VLinear$a;->c()V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Ll/hz60;->m:Lv/VText;

    .line 146
    .line 147
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :pswitch_2
    iget-object v0, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 152
    .line 153
    sget v3, Lcom/p1/mobile/putong/account/R$string;->q2:I

    .line 154
    .line 155
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setHint(I)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/hz60;->d:Landroid/widget/LinearLayout;

    .line 159
    .line 160
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 164
    .line 165
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/PhoneNumberInputAct;

    .line 166
    .line 167
    sget v0, Lcom/p1/mobile/putong/account/R$string;->o2:I

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 170
    .line 171
    .line 172
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_3

    .line 177
    .line 178
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 179
    .line 180
    const-string v0, " "

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-eqz p1, :cond_3

    .line 187
    .line 188
    iget-object p1, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    aget-object p2, p1, v2

    .line 195
    .line 196
    aget-object p1, p1, v1

    .line 197
    .line 198
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 199
    .line 200
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Ll/hz60;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 204
    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    const-string v2, "+"

    .line 208
    .line 209
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    .line 221
    .line 222
    :cond_3
    invoke-static {}, Ll/bp;->k()Z

    .line 223
    .line 224
    .line 225
    move-result p1

    .line 226
    if-eqz p1, :cond_4

    .line 227
    .line 228
    iget-object p1, p0, Ll/hz60;->m:Lv/VText;

    .line 229
    .line 230
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/hz60;->m:Lv/VText;

    .line 234
    .line 235
    new-instance p2, Ll/uy60;

    .line 236
    .line 237
    invoke-direct {p2, p0}, Ll/uy60;-><init>(Ll/hz60;)V

    .line 238
    .line 239
    .line 240
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 241
    .line 242
    .line 243
    :cond_4
    iget-object p0, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

    .line 244
    .line 245
    sget p1, Lcom/p1/mobile/putong/account/R$string;->o2:I

    .line 246
    .line 247
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :sswitch_data_0
    .sparse-switch
        -0x35ca905e -> :sswitch_2
        -0x35ca8ee8 -> :sswitch_1
        0x4d29dd0d -> :sswitch_0
    .end sparse-switch

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/oy60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hz60;->H(Ll/oy60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hz60;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

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
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/hz60;->q:Ll/oy60;

    .line 24
    .line 25
    iget-object v3, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v0, v3}, Ll/oy60;->n1(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v0, v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    move v0, v2

    .line 45
    :goto_1
    iget-object v3, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 46
    .line 47
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_3

    .line 52
    .line 53
    iget-object v3, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 54
    .line 55
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_2

    .line 64
    .line 65
    iget-object v3, p0, Ll/hz60;->l:Lv/VMaterialEdit;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v4, 0x6

    .line 76
    if-lt v3, v4, :cond_2

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    move v3, v1

    .line 80
    goto :goto_3

    .line 81
    :cond_3
    :goto_2
    move v3, v2

    .line 82
    :goto_3
    iget-object p0, p0, Ll/hz60;->p:Lv/VButton_FakeShadow;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    if-nez v3, :cond_5

    .line 87
    .line 88
    :cond_4
    move v1, v2

    .line 89
    :cond_5
    invoke-virtual {p0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public k0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz60;->f:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
