.class public Ll/jdf0;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/vcf0;",
        "Lcom/p1/mobile/putong/account/ui/account/SignInAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VMaterialEdit_FakeSpinner;

.field public d:Lv/VMaterialEdit;

.field public e:Lv/VMaterialEdit;

.field public f:Lv/VText;

.field public g:Lv/VButton_FakeShadow;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/account/SignInAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/account/SignInAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/jdf0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->s(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Ll/jdf0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->v(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic l(Ll/jdf0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->w(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic m(Ll/jdf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/jdf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/jdf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jdf0;->x(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdf0;->e:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jdf0;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kdf0;->b(Ll/jdf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/w270;->z(Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 11
    .line 12
    new-instance v1, Ll/ddf0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ddf0;-><init>(Ll/jdf0;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 51
    .line 52
    invoke-virtual {v0}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/edf0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/edf0;-><init>(Ll/jdf0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/jdf0;->e:Lv/VMaterialEdit;

    .line 69
    .line 70
    invoke-virtual {v0}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/fdf0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/fdf0;-><init>(Ll/jdf0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/jdf0;->g:Lv/VButton_FakeShadow;

    .line 87
    .line 88
    new-instance v1, Ll/gdf0;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/gdf0;-><init>(Ll/jdf0;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/jdf0;->f:Lv/VText;

    .line 97
    .line 98
    new-instance v1, Ll/hdf0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/hdf0;-><init>(Ll/jdf0;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/idf0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/idf0;-><init>(Ll/jdf0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/sm;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic v(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic w(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/jdf0;->i(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget v0, Lcom/p1/mobile/putong/account/R$string;->p3:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/jdf0;->i(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p1, p0, Ll/jdf0;->e:Lv/VMaterialEdit;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget v0, Lcom/p1/mobile/putong/account/R$string;->o3:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/jdf0;->i(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 67
    .line 68
    invoke-virtual {v0}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v0, " "

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v0, p0, Ll/jdf0;->e:Lv/VMaterialEdit;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Lcom/p1/mobile/putong/data/SignInData;

    .line 120
    .line 121
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v2, "password"

    .line 125
    .line 126
    invoke-static {v2}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iput-object v2, v1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 131
    .line 132
    iput-object p1, v1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v0, v1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 135
    .line 136
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 137
    .line 138
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object p1, v1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 142
    .line 143
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 148
    .line 149
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 150
    .line 151
    check-cast p0, Ll/vcf0;

    .line 152
    .line 153
    invoke-virtual {p0, v1}, Ll/ibf0;->I0(Lcom/p1/mobile/putong/data/SignInData;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "forgot-password"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jdf0;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jdf0;->d:Lv/VMaterialEdit;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/jbf0;->d(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
