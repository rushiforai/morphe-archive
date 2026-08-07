.class public Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;
.super Lcom/p1/mobile/android/app/Frag;
.source "SourceFile"


# instance fields
.field public A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

.field public D:Landroidx/constraintlayout/widget/Group;

.field public E:Lv/VText;

.field public F:Lv/VImage;

.field public G:Landroid/view/View$OnClickListener;

.field public H:Z

.field public I:Ljava/lang/String;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Frag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A4(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->G4(Ljava/lang/String;I)V

    return-void
.end method

.method private synthetic H4()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->M4(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static I4()Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/wcc0;->V:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/wcc0;->P:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroidx/constraintlayout/widget/Group;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->D:Landroidx/constraintlayout/widget/Group;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 26
    .line 27
    sget v1, Ll/wcc0;->Q:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lv/VText;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->E:Lv/VText;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/wcc0;->a0:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VImage;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->F:Lv/VImage;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 50
    .line 51
    new-instance v1, Ll/ulf0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ulf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->setNameWatcher(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 60
    .line 61
    new-instance v1, Ll/xpe;

    .line 62
    .line 63
    new-instance v2, Ll/vlf0;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/vlf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;)V

    .line 66
    .line 67
    .line 68
    const/16 v3, 0x14

    .line 69
    .line 70
    invoke-direct {v1, v3, v2}, Ll/xpe;-><init>(ILl/xpe$a;)V

    .line 71
    .line 72
    .line 73
    const/4 v2, 0x1

    .line 74
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 75
    .line 76
    const/4 v3, 0x0

    .line 77
    aput-object v1, v2, v3

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->G:Landroid/view/View$OnClickListener;

    .line 83
    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->O4()V

    .line 87
    .line 88
    .line 89
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->I:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_1

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->P4()V

    .line 98
    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->H4()V

    return-void
.end method


# virtual methods
.method public B4()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public C4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

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
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

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
    sget v0, Lcom/p1/mobile/putong/account/R$string;->P3:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-static {p0, v1, v0}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->A:Ll/y20;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->A:Ll/y20;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {v0, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public D4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

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

.method public E4()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public F4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->I:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->P4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G4(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->B:Ll/y20;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->B:Ll/y20;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    xor-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/a9c0;->p:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->M4(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public J4(Lcom/p1/mobile/android/app/Act;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

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

.method public K4(ZLandroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->G:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->H:Z

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->F:Lv/VImage;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->O4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public L4(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->A:Ll/y20;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->B:Ll/y20;

    .line 4
    .line 5
    return-void
.end method

.method public final M4(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const-string p1, "\u4ec5\u652f\u6301\u4e2d\u82f1\u6587\u548c\u7a7a\u683c"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->N4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    const-string p1, "\u4e0d\u5141\u8bb8\u4ec5\u8f93\u5165\u7a7a\u683c"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->N4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const/4 v0, 0x3

    .line 20
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    const-string p1, "\u6700\u591a\u652f\u630120\u4e2a\u5b57\u7b26"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->N4(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    const-string p1, ""

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->N4(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final N4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->E:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    new-array v0, v0, [Ll/pf60;

    .line 15
    .line 16
    const-string v1, "e_ai_signup_name"

    .line 17
    .line 18
    const-string v2, "p_ai_signup"

    .line 19
    .line 20
    invoke-static {v1, v2, v0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->D:Landroidx/constraintlayout/widget/Group;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    xor-int/lit8 p1, p1, 0x1

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final O4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->F:Lv/VImage;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->H:Z

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->F:Lv/VImage;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->G:Landroid/view/View$OnClickListener;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/high16 v1, 0x41a00000    # 20.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->H:Z

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/high16 p0, 0x42500000    # 52.0f

    .line 32
    .line 33
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    :goto_0
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v2, v1, p0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public final P4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->I:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->C:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/hec0;->X:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->r()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpNameFrag;->z:Landroid/view/View;

    .line 18
    .line 19
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
