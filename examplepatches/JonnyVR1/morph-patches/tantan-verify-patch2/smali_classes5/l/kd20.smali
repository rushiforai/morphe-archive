.class public Ll/kd20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r0m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/r0m<",
        "Ll/bd20;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/EditText;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/EditText;

.field public h:Landroid/widget/ImageView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VCheckBox;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Ll/bd20;

.field public o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

.field public p:Ll/bm5;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/kd20;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd20;->v(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic b(Ll/kd20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kd20;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/kd20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kd20;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/kd20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kd20;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/kd20;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/kd20;->s(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/kd20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kd20;->z()V

    return-void
.end method

.method public static synthetic i(Ll/kd20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kd20;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/kd20;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd20;->u(Landroid/view/View;Z)V

    return-void
.end method

.method public static bridge synthetic k(Ll/kd20;)Ll/bm5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kd20;->p:Ll/bm5;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/kd20;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd20;->B(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_id_verification_info_input_cancel_click"

    .line 5
    .line 6
    const-string v1, "p_id_verification_info_input_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/kd20;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic s(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "sdk_name"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Ll/kd20;->k:Lv/VCheckBox;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "is_checked"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {p2, v0}, [Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string v0, "e_id_verification_info_input_next_click"

    .line 26
    .line 27
    const-string v1, "p_id_verification_info_input_view"

    .line 28
    .line 29
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/kd20;->k:Lv/VCheckBox;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_0

    .line 39
    .line 40
    const-string p2, "appeal"

    .line 41
    .line 42
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bs:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object p0, p0, Ll/kd20;->n:Ll/bd20;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/bd20;->h0()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/kd20;->p:Ll/bm5;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bm5;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/kd20;->k:Lv/VCheckBox;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    const-string p1, "sdk_name"

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Ll/kd20;->k:Lv/VCheckBox;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v1, "is_checked"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {p1, v0}, [Ll/sfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "e_id_verification_info_input_next_click"

    .line 37
    .line 38
    const-string v1, "p_id_verification_info_input_view"

    .line 39
    .line 40
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/16 v0, 0x12

    .line 74
    .line 75
    if-ge p1, v0, :cond_0

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object p0, p0, Ll/kd20;->n:Ll/bd20;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/bd20;->h0()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    :goto_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->or:I

    .line 85
    .line 86
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 7
    .line 8
    iget-object p0, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final A(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public A3(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kd20;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/abc0;->n:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/kd20;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/cd20;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/cd20;-><init>(Ll/kd20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "appeal"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/kd20;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    const/16 v2, 0x8

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/kd20;->j:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/kd20;->j:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Ll/kd20;->a:Lv/navigationbar/VNavigationBar;

    .line 49
    .line 50
    const-string v1, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/bm5;

    .line 56
    .line 57
    iget-object v1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 58
    .line 59
    const-string v2, "fromNameVerificationDlg"

    .line 60
    .line 61
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    const/4 v2, 0x4

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const/4 v2, 0x2

    .line 70
    :goto_1
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Ll/kd20;->p:Ll/bm5;

    .line 74
    .line 75
    iget-object v0, p0, Ll/kd20;->m:Landroid/widget/TextView;

    .line 76
    .line 77
    new-instance v1, Ll/dd20;

    .line 78
    .line 79
    invoke-direct {v1, p0, p1}, Ll/dd20;-><init>(Ll/kd20;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 86
    .line 87
    new-instance v0, Ll/kd20$a;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ll/kd20$a;-><init>(Ll/kd20;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 96
    .line 97
    new-instance v0, Ll/kd20$b;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/kd20$b;-><init>(Ll/kd20;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 106
    .line 107
    new-instance v0, Ll/ed20;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/ed20;-><init>(Ll/kd20;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 116
    .line 117
    new-instance v0, Ll/fd20;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/fd20;-><init>(Ll/kd20;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 126
    .line 127
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Cs:I

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    sget v2, Lcom/p1/mobile/putong/core/R$string;->As:I

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 165
    .line 166
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Ll/kd20;->p:Ll/bm5;

    .line 173
    .line 174
    new-instance v3, Ll/gd20;

    .line 175
    .line 176
    invoke-direct {v3, p0}, Ll/gd20;-><init>(Ll/kd20;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2, v3}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 180
    .line 181
    .line 182
    new-instance v2, Ll/kd20$c;

    .line 183
    .line 184
    invoke-direct {v2, p0}, Ll/kd20$c;-><init>(Ll/kd20;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    add-int/2addr v0, p1

    .line 200
    const/16 p1, 0x21

    .line 201
    .line 202
    invoke-virtual {v1, v2, v3, v0, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Ll/kd20;->l:Landroid/widget/TextView;

    .line 206
    .line 207
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p0, Ll/kd20;->l:Landroid/widget/TextView;

    .line 211
    .line 212
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/kd20;->l:Landroid/widget/TextView;

    .line 220
    .line 221
    iget-object v0, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 222
    .line 223
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    sget v1, Ll/c9c0;->V1:I

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Ll/kd20;->e:Landroid/widget/ImageView;

    .line 237
    .line 238
    new-instance v0, Ll/hd20;

    .line 239
    .line 240
    invoke-direct {v0, p0}, Ll/hd20;-><init>(Ll/kd20;)V

    .line 241
    .line 242
    .line 243
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Ll/kd20;->h:Landroid/widget/ImageView;

    .line 247
    .line 248
    new-instance v0, Ll/id20;

    .line 249
    .line 250
    invoke-direct {v0, p0}, Ll/id20;-><init>(Ll/kd20;)V

    .line 251
    .line 252
    .line 253
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 257
    .line 258
    new-instance v0, Ll/jd20;

    .line 259
    .line 260
    invoke-direct {v0, p0}, Ll/jd20;-><init>(Ll/kd20;)V

    .line 261
    .line 262
    .line 263
    const-wide/16 v1, 0xc8

    .line 264
    .line 265
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 269
    .line 270
    new-instance v0, Ll/kd20$d;

    .line 271
    .line 272
    invoke-direct {v0, p0}, Ll/kd20$d;-><init>(Ll/kd20;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 276
    .line 277
    .line 278
    return-void
.end method

.method public final B(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/16 p2, 0x12

    .line 30
    .line 31
    if-ge p1, p2, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Ll/kd20;->m:Landroid/widget/TextView;

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/kd20;->m:Landroid/widget/TextView;

    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public J2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kd20;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kd20;->o:Lcom/p1/mobile/putong/core/ui/verification/national/NationalIdAuthAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bd20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kd20;->n(Ll/bd20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd20;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l3()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

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
    invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ld20;->b(Ll/kd20;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Ll/bd20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kd20;->n:Ll/bd20;

    .line 2
    .line 3
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kd20;->i:Landroid/widget/TextView;

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

.method public final synthetic u(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/kd20;->d:Landroid/widget/EditText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kd20;->A(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/kd20;->g:Landroid/widget/EditText;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kd20;->A(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
