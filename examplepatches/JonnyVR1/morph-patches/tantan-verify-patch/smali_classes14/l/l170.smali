.class public Ll/l170;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/i170;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VMaterialEdit_FakeSpinner;

.field public d:Lv/VMaterialEdit;

.field public e:Lv/VButton_FakeShadow;

.field public f:Ll/i170;

.field public g:Lcom/p1/mobile/putong/app/PutongAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/l170;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l170;->i(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic b(Ll/l170;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l170;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Lcom/p1/mobile/putong/account/R$string;->p3:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/l170;->f:Ll/i170;

    .line 30
    .line 31
    iget-object v0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Ll/i170;->h0(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/l170;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v0, Lcom/p1/mobile/putong/account/R$string;->K3:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p1, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string v0, "e_reset_password_verify_number_next_button"

    .line 70
    .line 71
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/l170;->f:Ll/i170;

    .line 75
    .line 76
    iget-object p0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Ll/i170;->m0(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private synthetic i(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v1, v1, [Ljava/lang/Object;

    .line 19
    .line 20
    const-string v2, "e_reset_password_verify_number_input"

    .line 21
    .line 22
    invoke-static {v2, p1, v0, v1}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ll/l170;->k()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l170;->d:Lv/VMaterialEdit;

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
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/l170;->f:Ll/i170;

    .line 15
    .line 16
    iget-object v2, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ll/i170;->h0(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    move v0, v1

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    :goto_0
    iget-object p0, p0, Ll/l170;->e:Lv/VButton_FakeShadow;

    .line 36
    .line 37
    xor-int/2addr v0, v1

    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setActivated(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m170;->b(Ll/l170;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/i170;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l170;->f:Ll/i170;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l170;->c:Lv/VMaterialEdit_FakeSpinner;

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
    iget-object p0, p0, Ll/l170;->c:Lv/VMaterialEdit_FakeSpinner;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i170;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l170;->d(Ll/i170;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l170;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(ILjava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l170;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "+"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l170;->g:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/account/R$string;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/l170;->e:Lv/VButton_FakeShadow;

    .line 9
    .line 10
    new-instance v1, Ll/j170;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/j170;-><init>(Ll/l170;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabel(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lv/VMaterialEdit;->I(Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v2, Ll/k170;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/k170;-><init>(Ll/l170;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/l170;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/l170;->c:Lv/VMaterialEdit_FakeSpinner;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/l170;->d:Lv/VMaterialEdit;

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
