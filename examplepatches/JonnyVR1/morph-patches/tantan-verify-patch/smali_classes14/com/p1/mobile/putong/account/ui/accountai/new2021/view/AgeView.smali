.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VButton_FakeShadow;

.field public h:Z

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->X()V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->i:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->b0()V

    return-void
.end method

.method private synthetic X()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->i:Ll/y20;

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->W(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->h:Z

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->j:Ll/y20;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->j:Ll/y20;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->b0()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget p1, Lcom/p1/mobile/putong/account/R$string;->g:I

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0, v0, v1}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->W(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->isClickable()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 26
    .line 27
    sget v0, Ll/bbc0;->K1:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 34
    .line 35
    sget v0, Ll/bbc0;->t1:I

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private init()V
    .locals 5

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
    invoke-virtual {p0, v1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->b0()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 20
    .line 21
    sget v2, Lcom/p1/mobile/putong/account/R$string;->g:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setHint(I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 27
    .line 28
    new-instance v2, Ll/xpe;

    .line 29
    .line 30
    new-instance v3, Ll/qc0;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/qc0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 33
    .line 34
    .line 35
    const/4 v4, 0x2

    .line 36
    invoke-direct {v2, v4, v3}, Ll/xpe;-><init>(ILl/xpe$a;)V

    .line 37
    .line 38
    .line 39
    new-array v0, v0, [Landroid/text/InputFilter;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    aput-object v2, v0, v3

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 58
    .line 59
    new-instance v1, Ll/rc0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/rc0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/gsj0;->f()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->f:Lv/VLinear;

    .line 74
    .line 75
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->c:Lv/VFrame;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 85
    .line 86
    sget v1, Ll/qa00;->z:I

    .line 87
    .line 88
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->c:Lv/VFrame;

    .line 91
    .line 92
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 102
    .line 103
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 104
    .line 105
    sget v1, Ll/qa00;->j:I

    .line 106
    .line 107
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    :cond_0
    return-void
.end method


# virtual methods
.method public T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sc0;->b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public V()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->g:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->h:Z

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->b0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final W(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x2

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public Z(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->d:Lv/VEditText;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public a0(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->i:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/AgeView;->j:Ll/y20;

    .line 4
    .line 5
    return-void
.end method
