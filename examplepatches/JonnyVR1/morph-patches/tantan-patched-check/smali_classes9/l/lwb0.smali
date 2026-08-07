.class public Ll/lwb0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VButton;

.field public final k:Lcom/p1/mobile/android/app/Act;

.field public final l:Lcom/p1/mobile/putong/core/data/Question;

.field public m:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lwb0;->k:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lwb0;->l:Lcom/p1/mobile/putong/core/data/Question;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic A(Ll/lwb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lwb0;->H(Landroid/view/View;)V

    return-void
.end method

.method private D()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/lwb0;->f:Lv/VLinear;

    .line 12
    .line 13
    new-instance v2, Ll/iwb0;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Ll/iwb0;-><init>(Ll/lwb0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x3

    .line 26
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 37
    .line 38
    .line 39
    const v1, 0x1020002

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/odc0;->p:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget v1, Ll/tbc0;->a0:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/lwb0$a;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Ll/lwb0$a;-><init>(Ll/lwb0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method private E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lwb0;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/lwb0;->C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/lwb0;->g:Lv/VImage;

    .line 16
    .line 17
    new-instance v1, Ll/jwb0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/jwb0;-><init>(Ll/lwb0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/lwb0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 26
    .line 27
    iget-object v1, p0, Ll/lwb0;->l:Lcom/p1/mobile/putong/core/data/Question;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/gra;->z()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Ll/lwb0;->h:Lv/VImage;

    .line 41
    .line 42
    sget v1, Ll/tbc0;->V:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/lwb0;->j:Lv/VButton;

    .line 48
    .line 49
    sget v1, Ll/dbc0;->R:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/lwb0;->j:Lv/VButton;

    .line 55
    .line 56
    new-instance v1, Ll/kwb0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/kwb0;-><init>(Ll/lwb0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_add_my_answer"

    .line 2
    .line 3
    const-string v0, "p_add_my_answer"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/aw90;->V()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Ll/lwb0;->k:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_QUESTION_PATCH:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 21
    .line 22
    iget-object p0, p0, Ll/lwb0;->l:Lcom/p1/mobile/putong/core/data/Question;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "other_question"

    .line 27
    .line 28
    invoke-static {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopFragAct;->a2(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private synthetic I(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lwb0;->m:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic x(Ll/lwb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lwb0;->F()V

    return-void
.end method

.method public static synthetic y(Ll/lwb0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lwb0;->I(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z(Ll/lwb0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lwb0;->G(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mwb0;->b(Ll/lwb0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic F()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/lwb0;->f:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/lwb0;->E()V

    .line 5
    .line 6
    .line 7
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "p_add_my_answer"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/lwb0;->m:Ll/l4g0;

    .line 20
    .line 21
    iget-object v0, p0, Ll/lwb0;->l:Lcom/p1/mobile/putong/core/data/Question;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "qa_question_name"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/lwb0;->m:Ll/l4g0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/hwb0;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/hwb0;-><init>(Ll/lwb0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/lwb0;->D()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
