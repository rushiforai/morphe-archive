.class public Ll/c170;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/e070;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Z

.field public C:Landroid/view/View;

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:Landroid/text/SpannableString;

.field public I:Landroid/text/style/ClickableSpan;

.field public J:Ll/x20;

.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VEditText;

.field public i:Lv/VImage;

.field public j:Lv/VLinear;

.field public k:Lv/VEditText;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Landroid/widget/FrameLayout;

.field public p:Lv/VEditText;

.field public q:Lv/VImage;

.field public r:Lv/VFrame;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public v:Lv/VText;

.field public w:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public x:Lv/VImage;

.field public y:Lv/VImage;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/c170;->B:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/c170;->D:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/c170;->E:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Ll/c170;->F:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/c170;->G:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->d0()V

    return-void
.end method

.method private A0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/c170;->B:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/c170;->f:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/c170;->j:Lv/VLinear;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/c170;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Lcom/p1/mobile/putong/account/R$string;->W3:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 31
    .line 32
    const/16 v3, 0x8

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/c170;->f:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/c170;->j:Lv/VLinear;

    .line 43
    .line 44
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/c170;->e:Lv/VText;

    .line 48
    .line 49
    sget v0, Lcom/p1/mobile/putong/account/R$string;->V3:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic B(Ll/c170;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/c170;->u0(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic C(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->s0()V

    return-void
.end method

.method private D0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 9
    .line 10
    check-cast v0, Ll/e070;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/e070;->J1(Lcom/p1/mobile/putong/data/Captcha;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c170;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->l0()V

    return-void
.end method

.method public static synthetic G(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c170;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c170;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/c170;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/c170;->e0(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic J(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic K(Ll/c170;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c170;->M()V

    return-void
.end method

.method private M()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/c170;->B:Z

    .line 2
    .line 3
    const/16 v1, 0x56

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v4, 0x6

    .line 32
    if-lt v0, v4, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 47
    .line 48
    check-cast v0, Ll/e070;

    .line 49
    .line 50
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-ne v4, v1, :cond_0

    .line 65
    .line 66
    move v1, v3

    .line 67
    goto :goto_0

    .line 68
    :cond_0
    move v1, v2

    .line 69
    :goto_0
    invoke-static {v0, v1}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    move v2, v3

    .line 76
    :cond_1
    iget-object v0, p0, Ll/c170;->v:Lv/VText;

    .line 77
    .line 78
    sget v1, Lcom/p1/mobile/putong/account/R$string;->o2:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    iget-boolean v0, p0, Ll/c170;->F:Z

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    iget-object v0, p0, Ll/c170;->p:Lv/VEditText;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    const/4 v4, 0x4

    .line 99
    if-lt v0, v4, :cond_5

    .line 100
    .line 101
    :cond_3
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_5

    .line 112
    .line 113
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 114
    .line 115
    check-cast v0, Ll/e070;

    .line 116
    .line 117
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-ne v4, v1, :cond_4

    .line 132
    .line 133
    move v1, v3

    .line 134
    goto :goto_1

    .line 135
    :cond_4
    move v1, v2

    .line 136
    :goto_1
    invoke-static {v0, v1}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    move v2, v3

    .line 143
    :cond_5
    iget-object v0, p0, Ll/c170;->v:Lv/VText;

    .line 144
    .line 145
    sget v1, Lcom/p1/mobile/putong/account/R$string;->c:I

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 148
    .line 149
    .line 150
    :goto_2
    iget-object v0, p0, Ll/c170;->v:Lv/VText;

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/c170;->v:Lv/VText;

    .line 156
    .line 157
    if-eqz v2, :cond_6

    .line 158
    .line 159
    sget v0, Ll/bbc0;->K1:I

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_6
    sget v0, Ll/bbc0;->t1:I

    .line 166
    .line 167
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method private N()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    new-instance v1, Ll/x070;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/x070;-><init>(Ll/c170;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x96

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private W()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aput-object v1, v2, v3

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 20
    .line 21
    new-instance v1, Ll/b170;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/b170;-><init>(Ll/c170;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 30
    .line 31
    new-instance v1, Ll/g070;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/g070;-><init>(Ll/c170;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/c170;->l:Lv/VImage;

    .line 40
    .line 41
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Lv/VEditText;->i(Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/h070;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/h070;-><init>(Ll/c170;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/c170;->l:Lv/VImage;

    .line 63
    .line 64
    new-instance v1, Ll/i070;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/i070;-><init>(Ll/c170;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/c170;->m:Lv/VImage;

    .line 73
    .line 74
    new-instance v1, Ll/j070;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/j070;-><init>(Ll/c170;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 83
    .line 84
    sget v1, Lcom/p1/mobile/putong/account/R$string;->w3:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 90
    .line 91
    const-string v1, "account"

    .line 92
    .line 93
    sget-object v2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 94
    .line 95
    invoke-static {v0, v1, v2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_0

    .line 100
    .line 101
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_0

    .line 112
    .line 113
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 124
    .line 125
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 126
    .line 127
    sget v2, Lcom/p1/mobile/putong/account/R$string;->x3:I

    .line 128
    .line 129
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-ltz v1, :cond_0

    .line 138
    .line 139
    new-instance v2, Landroid/text/SpannableString;

    .line 140
    .line 141
    invoke-direct {v2, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    iput-object v2, p0, Ll/c170;->H:Landroid/text/SpannableString;

    .line 145
    .line 146
    new-instance v0, Ll/k070;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/k070;-><init>(Ll/c170;)V

    .line 149
    .line 150
    .line 151
    iput-object v0, p0, Ll/c170;->J:Ll/x20;

    .line 152
    .line 153
    iget-object v0, p0, Ll/c170;->n:Lv/VText;

    .line 154
    .line 155
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 156
    .line 157
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 158
    .line 159
    sget v3, Lcom/p1/mobile/putong/account/R$string;->x3:I

    .line 160
    .line 161
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iget-object v3, p0, Ll/c170;->H:Landroid/text/SpannableString;

    .line 166
    .line 167
    iget-object v4, p0, Ll/c170;->J:Ll/x20;

    .line 168
    .line 169
    invoke-static {v0, v2, v3, v1, v4}, Ll/gsj0;->b(Landroid/widget/TextView;Ljava/lang/String;Landroid/text/SpannableString;ILl/x20;)Landroid/text/style/ClickableSpan;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Ll/c170;->I:Landroid/text/style/ClickableSpan;

    .line 174
    .line 175
    :cond_0
    return-void
.end method

.method private synthetic a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/c170;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    iget-object v1, p0, Ll/c170;->c:Lv/VScroll;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/c170;->c:Lv/VScroll;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v1, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method private synthetic c0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c170;->w0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic e0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "e_password_input"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

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

.method private synthetic g0(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c170;->l:Lv/VImage;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v1, v2

    .line 13
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-array v1, v2, [Ll/pf60;

    .line 25
    .line 26
    const-string v2, "e_password_input"

    .line 27
    .line 28
    invoke-static {v2, v0, v1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/c170;->M()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-lez p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Ll/c170;->i(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->k:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic i0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/c170;->E:Z

    .line 2
    .line 3
    xor-int/lit8 v0, p1, 0x1

    .line 4
    .line 5
    iput-boolean v0, p0, Ll/c170;->E:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/c170;->m:Lv/VImage;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/bbc0;->i1:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/bbc0;->j1:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/c170;->k:Lv/VEditText;

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/c170;->E:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {}, Landroid/text/method/HideReturnsTransformationMethod;->getInstance()Landroid/text/method/HideReturnsTransformationMethod;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/c170;->k:Lv/VEditText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic j(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->t0()V

    return-void
.end method

.method public static synthetic k(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c170;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->r0()V

    return-void
.end method

.method public static synthetic m(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/c170;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c170;->j0(Landroid/view/View;Z)V

    return-void
.end method

.method private synthetic n0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/c170;->N()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic o0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/c170;->B:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 6
    .line 7
    check-cast p1, Ll/e070;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/e070;->O1()V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/c170;->B:Z

    .line 13
    .line 14
    xor-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/c170;->B:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Ll/c170;->y0(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic p(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->f0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q(Ll/c170;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->g0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic s(Ll/c170;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->n0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u(Ll/c170;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->q0()V

    return-void
.end method

.method public static synthetic v(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/c170;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c170;->a0()V

    return-void
.end method

.method private w0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x56

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 18
    .line 19
    check-cast v0, Ll/e070;

    .line 20
    .line 21
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-ne v4, v1, :cond_0

    .line 36
    .line 37
    move v4, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v4, v3

    .line 40
    :goto_0
    invoke-static {v0, v4}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    move v0, v2

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move v0, v3

    .line 49
    :goto_1
    iget-object v4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    check-cast v4, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "phone_num"

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    iget-boolean v6, p0, Ll/c170;->B:Z

    .line 68
    .line 69
    if-eqz v6, :cond_2

    .line 70
    .line 71
    const-string v6, "password"

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_2
    const-string v6, "code"

    .line 75
    .line 76
    :goto_2
    const-string v7, "code_password_type"

    .line 77
    .line 78
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    filled-new-array {v5, v6}, [Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    const-string v6, "e_password_verifypage_signin_button"

    .line 87
    .line 88
    invoke-static {v6, v4, v5}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    iget-boolean v4, p0, Ll/c170;->B:Z

    .line 92
    .line 93
    if-eqz v4, :cond_6

    .line 94
    .line 95
    iget-object v1, p0, Ll/c170;->k:Lv/VEditText;

    .line 96
    .line 97
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_3

    .line 106
    .line 107
    iget-object v1, p0, Ll/c170;->k:Lv/VEditText;

    .line 108
    .line 109
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    const/4 v4, 0x6

    .line 118
    if-lt v1, v4, :cond_3

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_3
    move v2, v3

    .line 122
    :goto_3
    if-nez v0, :cond_4

    .line 123
    .line 124
    sget p0, Lcom/p1/mobile/putong/account/R$string;->Z:I

    .line 125
    .line 126
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_4
    if-nez v2, :cond_5

    .line 131
    .line 132
    sget p0, Lcom/p1/mobile/putong/account/R$string;->S2:I

    .line 133
    .line 134
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_5
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 139
    .line 140
    check-cast p0, Ll/e070;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/e070;->P1()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_6
    invoke-virtual {p0}, Ll/c170;->S()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_b

    .line 155
    .line 156
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 157
    .line 158
    check-cast v0, Ll/e070;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-ne v4, v1, :cond_7

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_7
    move v2, v3

    .line 172
    :goto_4
    invoke-static {v0, v2}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_a

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/c170;->Y()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-nez v0, :cond_9

    .line 183
    .line 184
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 185
    .line 186
    check-cast v0, Ll/e070;

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/e070;->o1()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_8

    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_8
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 196
    .line 197
    check-cast v0, Ll/e070;

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    new-instance v3, Ll/r070;

    .line 208
    .line 209
    invoke-direct {v3, p0}, Ll/r070;-><init>(Ll/c170;)V

    .line 210
    .line 211
    .line 212
    new-instance v4, Ll/s070;

    .line 213
    .line 214
    invoke-direct {v4, p0}, Ll/s070;-><init>(Ll/c170;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/e070;->Q1(ILjava/lang/String;Ll/x20;Ll/x20;)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_9
    :goto_5
    invoke-direct {p0}, Ll/c170;->D0()V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_a
    sget p0, Lcom/p1/mobile/putong/account/R$string;->Z:I

    .line 226
    .line 227
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_b
    invoke-direct {p0}, Ll/c170;->M()V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 235
    .line 236
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 240
    .line 241
    check-cast p0, Ll/e070;

    .line 242
    .line 243
    invoke-virtual {p0}, Ll/e070;->O1()V

    .line 244
    .line 245
    .line 246
    return-void
.end method

.method public static synthetic x(Ll/c170;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c170;->z0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic y(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/c170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c170;->c0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->g:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c170;->h:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/jbf0;->d(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Ll/c170;->D:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/c170;->p:Lv/VEditText;

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iput-boolean v1, p0, Ll/c170;->F:Z

    .line 17
    .line 18
    invoke-direct {p0}, Ll/c170;->M()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :try_start_0
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaData;->images:Lcom/p1/mobile/putong/account/data/CaptchaImage;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaImage;->chars:Lcom/p1/mobile/putong/account/data/CaptchaChars;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaChars;->content:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, ","

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    aget-object p1, p1, v1

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    array-length v3, p1

    .line 42
    invoke-static {p1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v2, p0, Ll/c170;->q:Lv/VImage;

    .line 47
    .line 48
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/c170;->q:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    new-instance p1, Ll/v070;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/v070;-><init>(Ll/c170;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-boolean p1, p0, Ll/c170;->B:Z

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/c170;->y0(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_0
    xor-int/2addr p1, v1

    .line 78
    iput-boolean p1, p0, Ll/c170;->B:Z

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/c170;->y0(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    :goto_1
    return-void
.end method

.method public G0(Ljava/lang/Throwable;Ljava/lang/String;)Z
    .locals 3

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    move-object p2, p1

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    iget-object v1, p0, Ll/c170;->t:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 16
    .line 17
    const v1, 0x9c4a

    .line 18
    .line 19
    .line 20
    if-eq p2, v1, :cond_2

    .line 21
    .line 22
    const v1, 0x61af2

    .line 23
    .line 24
    .line 25
    if-eq p2, v1, :cond_1

    .line 26
    .line 27
    const v1, 0x62638

    .line 28
    .line 29
    .line 30
    if-eq p2, v1, :cond_0

    .line 31
    .line 32
    packed-switch p2, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :pswitch_0
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 42
    .line 43
    sget p1, Lcom/p1/mobile/putong/account/R$string;->X:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 46
    .line 47
    .line 48
    return v2

    .line 49
    :pswitch_1
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 50
    .line 51
    sget p1, Lcom/p1/mobile/putong/account/R$string;->a0:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :pswitch_2
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 58
    .line 59
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Y:I

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :pswitch_3
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 66
    .line 67
    sget p1, Lcom/p1/mobile/putong/account/R$string;->S2:I

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 70
    .line 71
    .line 72
    return v2

    .line 73
    :cond_0
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 74
    .line 75
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return v2

    .line 82
    :cond_1
    iget-object p1, p0, Ll/c170;->t:Lv/VText;

    .line 83
    .line 84
    sget p2, Lcom/p1/mobile/putong/account/R$string;->a0:I

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/c170;->q:Lv/VImage;

    .line 90
    .line 91
    const/4 p2, 0x0

    .line 92
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 96
    .line 97
    check-cast p0, Ll/e070;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/e070;->L1()V

    .line 100
    .line 101
    .line 102
    return v2

    .line 103
    :cond_2
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 104
    .line 105
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Z:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 108
    .line 109
    .line 110
    return v2

    .line 111
    :cond_3
    :goto_0
    return v0

    .line 112
    nop

    .line 113
    :pswitch_data_0
    .packed-switch 0x9c4c
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public H0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/c170;->y0(Landroid/view/View;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->g:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/y070;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/y070;-><init>(Ll/c170;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public J0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/c170;->G:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/c170;->u:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    new-instance v1, Ll/c170$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/c170$a;-><init>(Ll/c170;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "account_loading_progress.svga"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    invoke-virtual {v0, p0, v2, v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public K0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/c170;->G:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/c170;->u:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->stopAnimCompletely()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d170;->b(Ll/c170;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public L0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/c170;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "+86"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/c170;->h:Lv/VEditText;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    .line 23
    .line 24
    const/16 v3, 0xb

    .line 25
    .line 26
    invoke-direct {v0, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 27
    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    new-array v4, v4, [Landroid/text/InputFilter;

    .line 31
    .line 32
    aput-object v0, v4, v2

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-le v1, v3, :cond_0

    .line 52
    .line 53
    iget-object v1, p0, Ll/c170;->h:Lv/VEditText;

    .line 54
    .line 55
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

    .line 63
    .line 64
    invoke-virtual {p0, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void

    .line 68
    :cond_1
    new-array p0, v2, [Landroid/text/InputFilter;

    .line 69
    .line 70
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public M0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c170;->K0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->p:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public P()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c170;->g:Lv/VText;

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
    iget-object v0, p0, Ll/c170;->g:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/c170;->g:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_0
    sget-object p0, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ll/nsb;

    .line 53
    .line 54
    iget p0, p0, Ll/nsb;->b:I

    .line 55
    .line 56
    return p0
.end method

.method public Q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->k:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public R()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

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

.method public S()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "account_sign_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->p:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/c170$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/c170$b;-><init>(Ll/c170;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/c170;->q:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/a170;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/a170;-><init>(Ll/c170;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public U()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->v:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/w070;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w070;-><init>(Ll/c170;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/c170;->M()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/c170;->g:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "+"

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ll/nsb;

    .line 32
    .line 33
    iget v2, v2, Ll/nsb;->b:I

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ll/c170;->L0()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/c170;->I0()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public X()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v2, Ll/l070;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/l070;-><init>(Ll/c170;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 21
    .line 22
    new-instance v2, Ll/m070;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/m070;-><init>(Ll/c170;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 31
    .line 32
    new-instance v2, Ll/n070;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/n070;-><init>(Ll/c170;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    new-instance v0, Ll/o070;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/o070;-><init>(Ll/c170;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/c170;->i:Lv/VImage;

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/c170;->i:Lv/VImage;

    .line 69
    .line 70
    new-instance v1, Ll/p070;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/p070;-><init>(Ll/c170;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public Y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/c170;->G:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/c170;->q:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 8
    .line 9
    check-cast p0, Ll/e070;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e070;->L1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

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
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p0, Ll/e070;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/e070;->N1()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/jbf0;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/c170;->H:Landroid/text/SpannableString;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/c170;->I:Landroid/text/style/ClickableSpan;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/c170;->H:Landroid/text/SpannableString;

    .line 21
    .line 22
    iget-object p0, p0, Ll/c170;->I:Landroid/text/style/ClickableSpan;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/text/SpannableString;->removeSpan(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c170;->t:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/c170;->t:Lv/VText;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    xor-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c170;->L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/c170;->C:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public final synthetic j0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "e_phone_input"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

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

.method public final synthetic l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/c170;->h:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 22
    .line 23
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/c170;->y0(Landroid/view/View;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    const/16 v1, 0x7530

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->lmdStart(I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lv/VLinear;->b:Lv/VLinear$a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lv/VLinear$a;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/c170;->A:Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/c170;->e:Lv/VText;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/c170;->t:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/c170;->j:Lv/VLinear;

    .line 32
    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/c170;->z:Lv/VText;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 44
    .line 45
    check-cast v0, Ll/e070;

    .line 46
    .line 47
    iget-object v1, p0, Ll/c170;->C:Landroid/view/View;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/f070;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/f070;-><init>(Ll/c170;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/c170;->V()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/c170;->X()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/c170;->T()V

    .line 80
    .line 81
    .line 82
    invoke-direct {p0}, Ll/c170;->W()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/c170;->U()V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0}, Ll/c170;->A0()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/c170;->z:Lv/VText;

    .line 92
    .line 93
    new-instance v1, Ll/q070;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/q070;-><init>(Ll/c170;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Ll/c170;->x:Lv/VImage;

    .line 102
    .line 103
    new-instance v1, Ll/u070;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/u070;-><init>(Ll/c170;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic r0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c170;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->k:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/c170;->k:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c170;->p:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/c170;->p:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u0(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    const-string p1, "ccode"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/16 p2, 0x41

    .line 13
    .line 14
    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p2, p0, Ll/c170;->g:Lv/VText;

    .line 19
    .line 20
    new-instance p3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "+"

    .line 23
    .line 24
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Ll/c170;->M()V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v1, Ll/t070;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/t070;-><init>(Ll/c170;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public x0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/c170;->F:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/c170;->M()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/c170;->S()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/16 v2, 0x14

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lrx/c;->subscribe()Ll/kcg0;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 26
    .line 27
    check-cast p0, Ll/e070;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/e070;->O1()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public y0(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/c170;->B:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    iput-boolean v0, p0, Ll/c170;->B:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/c170;->t:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/c170;->A0()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ll/c170;->M()V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Ll/c170;->B:Z

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object p1, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->f:Ll/wf;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ll/wf;->m(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v0, p0, Ll/c170;->z:Lv/VText;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/c170;->z:Lv/VText;

    .line 54
    .line 55
    sget v0, Lcom/p1/mobile/putong/account/R$string;->f3:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p1, p0, Ll/c170;->d:Lv/VText;

    .line 61
    .line 62
    sget v0, Lcom/p1/mobile/putong/account/R$string;->d3:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 68
    .line 69
    check-cast p1, Ll/e070;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/c170;->R()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Ll/c170;->P()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/16 v3, 0x56

    .line 80
    .line 81
    if-ne v0, v3, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    move v1, v2

    .line 85
    :goto_1
    invoke-static {p1, v1}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v0, Ll/z070;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/z070;-><init>(Ll/c170;)V

    .line 98
    .line 99
    .line 100
    const-wide/16 v1, 0x64

    .line 101
    .line 102
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    iget-object p1, p0, Ll/c170;->h:Lv/VEditText;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 112
    .line 113
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 114
    .line 115
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

    .line 116
    .line 117
    invoke-virtual {p1, p0, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    iget-boolean v0, p0, Ll/c170;->F:Z

    .line 122
    .line 123
    if-eqz v0, :cond_4

    .line 124
    .line 125
    iget-object v0, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 126
    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/c170;->p:Lv/VEditText;

    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 133
    .line 134
    .line 135
    :cond_4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_5

    .line 140
    .line 141
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 142
    .line 143
    check-cast p1, Ll/e070;

    .line 144
    .line 145
    const-string v0, "verify_code_login"

    .line 146
    .line 147
    iput-object v0, p1, Ll/e070;->e:Ljava/lang/String;

    .line 148
    .line 149
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 150
    .line 151
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const-string v0, "e_password_verifypage_switch_button"

    .line 158
    .line 159
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    iget-object p1, p0, Ll/c170;->z:Lv/VText;

    .line 163
    .line 164
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Ll/c170;->z:Lv/VText;

    .line 168
    .line 169
    sget v0, Lcom/p1/mobile/putong/account/R$string;->d3:I

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Ll/c170;->d:Lv/VText;

    .line 175
    .line 176
    sget v0, Lcom/p1/mobile/putong/account/R$string;->e3:I

    .line 177
    .line 178
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Ll/c170;->o:Landroid/widget/FrameLayout;

    .line 182
    .line 183
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-nez p1, :cond_6

    .line 188
    .line 189
    iget-object p1, p0, Ll/c170;->h:Lv/VEditText;

    .line 190
    .line 191
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 195
    .line 196
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 197
    .line 198
    iget-object p0, p0, Ll/c170;->h:Lv/VEditText;

    .line 199
    .line 200
    invoke-virtual {p1, p0, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 201
    .line 202
    .line 203
    :cond_6
    return-void
.end method

.method public final z0(Ljava/lang/CharSequence;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/PhoneNumberLoginOptAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v2, v1, [Ll/pf60;

    .line 11
    .line 12
    const-string v3, "e_phone_input"

    .line 13
    .line 14
    invoke-static {v3, v0, v2}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/c170;->t:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/c170;->M()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v0, 0x1

    .line 30
    if-lez p1, :cond_0

    .line 31
    .line 32
    move v1, v0

    .line 33
    :cond_0
    iget-object p1, p0, Ll/c170;->i:Lv/VImage;

    .line 34
    .line 35
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Ll/c170;->i:Lv/VImage;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
