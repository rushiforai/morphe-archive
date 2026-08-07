.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

.field public e:Lv/VImage;

.field public f:Lv/VButton_FakeShadow;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->X(Ljava/lang/String;I)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->Y()V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->Z(Landroid/view/View;)V

    return-void
.end method

.method private synthetic X(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d0(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/a9c0;->p:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->c0(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic Y()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->c0(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic Z(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/account/R$string;->P3:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-static {p0, v0, p1}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->h:Ll/y20;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->h:Ll/y20;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private c0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->g:Ll/y20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->g:Ll/y20;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget v0, Lcom/p1/mobile/putong/account/R$string;->x:I

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x2

    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->g:Ll/y20;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget v0, Lcom/p1/mobile/putong/account/R$string;->w:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->g:Ll/y20;

    .line 48
    .line 49
    const/4 v1, 0x3

    .line 50
    if-ne p1, v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p1, Lcom/p1/mobile/putong/account/R$string;->v:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/16 p1, 0x14

    .line 63
    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    const-string p0, ""

    .line 81
    .line 82
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method private d0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/bbc0;->K1:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Ll/bbc0;->t1:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d0(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 21
    .line 22
    new-instance v3, Ll/cc20;

    .line 23
    .line 24
    invoke-direct {v3, p0}, Ll/cc20;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->setNameWatcher(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 31
    .line 32
    new-instance v3, Ll/xpe;

    .line 33
    .line 34
    new-instance v4, Ll/dc20;

    .line 35
    .line 36
    invoke-direct {v4, p0}, Ll/dc20;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 37
    .line 38
    .line 39
    const/16 v5, 0x14

    .line 40
    .line 41
    invoke-direct {v3, v5, v4}, Ll/xpe;-><init>(ILl/xpe$a;)V

    .line 42
    .line 43
    .line 44
    new-array v0, v0, [Landroid/text/InputFilter;

    .line 45
    .line 46
    aput-object v3, v0, v1

    .line 47
    .line 48
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 52
    .line 53
    new-instance v1, Ll/ec20;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/ec20;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/gsj0;->f()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 74
    .line 75
    sget v1, Ll/qa00;->z:I

    .line 76
    .line 77
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 91
    .line 92
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 93
    .line 94
    sget v1, Ll/qa00;->j:I

    .line 95
    .line 96
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    :cond_0
    return-void
.end method


# virtual methods
.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fc20;->b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->f:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public V()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public W(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-lez p1, :cond_0

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    :goto_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d0(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public a0(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public b0(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->g:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->h:Ll/y20;

    .line 4
    .line 5
    return-void
.end method

.method public getLastName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

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
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public setEditViewPadding(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/NameView;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    const/high16 v0, 0x41800000    # 16.0f

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/high16 v0, 0x42800000    # 64.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0, p1, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0, p1, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
