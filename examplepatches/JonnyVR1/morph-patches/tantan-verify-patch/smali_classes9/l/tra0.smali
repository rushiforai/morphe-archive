.class public Ll/tra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lra0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VLinear;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VEditText;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public final n:Lcom/p1/mobile/android/app/Act;

.field public o:Ll/lra0;

.field public final p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

.field public q:Lcom/p1/mobile/putong/core/data/Question;

.field public r:Ljava/lang/String;

.field public s:Lcom/p1/mobile/putong/data/User;

.field public t:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-object p1, p0, Ll/tra0;->p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Ll/tra0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tra0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/tra0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tra0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/tra0;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tra0;->s(Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tra0;->v(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/tra0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tra0;->w()V

    return-void
.end method

.method public static synthetic i(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/tra0;->u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tra0;->p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "e_save_qa"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_QUESTION_PATCH:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 13
    .line 14
    if-ne p1, v0, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/tra0;->n(Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget-object v0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    new-instance p1, Ll/pra0;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ll/pra0;-><init>(Ll/tra0;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    invoke-static {v0, p2, p1, p0}, Ll/tr90;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/tra0;->n(Lcom/p1/mobile/putong/data/User;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public B()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u4fee\u6539\u672a\u4fdd\u5b58"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "\u662f\u5426\u4fdd\u5b58\u540e\u518d\u9000\u51fa\uff1f"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "\u4e0d\u4fdd\u5b58"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/rra0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/rra0;-><init>(Ll/tra0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "\u4fdd\u5b58\u540e\u9000\u51fa"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/sra0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/sra0;-><init>(Ll/tra0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public C(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tra0;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Ll/tra0;->o:Ll/lra0;

    .line 9
    .line 10
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    rsub-int/lit8 p1, p1, 0x64

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p1, ""

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/tra0;->m:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 35
    .line 36
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p0, p0, Ll/tra0;->m:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->k()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/lra0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tra0;->l(Ll/lra0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tra0;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ura0;->b(Ll/tra0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tra0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tra0;->B()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l(Ll/lra0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tra0;->o:Ll/lra0;

    .line 2
    .line 3
    return-void
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tra0;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/tra0;->j:Lv/VEditText;

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
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public n(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/tra0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/tra0;->j:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/Answer;->new_()Lcom/p1/mobile/putong/data/Answer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object p0, p0, Ll/tra0;->q:Lcom/p1/mobile/putong/core/data/Question;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p0, v1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, v1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 48
    .line 49
    new-instance v1, Ll/ora0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ora0;-><init>(Ll/tra0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/data/Answer;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public p()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tra0;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/tra0;->j:Lv/VEditText;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/tra0;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tra0;->t:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    iput-object p3, p0, Ll/tra0;->q:Lcom/p1/mobile/putong/core/data/Question;

    .line 6
    .line 7
    iget-object v0, p0, Ll/tra0;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/tra0;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    const-string v1, "\u6211\u7684\u95ee\u7b54"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tra0;->f:Landroid/widget/TextView;

    .line 22
    .line 23
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/tra0;->f:Landroid/widget/TextView;

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const-string v1, ""

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 54
    .line 55
    new-instance v3, Ll/mra0;

    .line 56
    .line 57
    invoke-direct {v3, p3}, Ll/mra0;-><init>(Lcom/p1/mobile/putong/core/data/Question;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    check-cast p3, Lcom/p1/mobile/putong/data/Answer;

    .line 65
    .line 66
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_0

    .line 71
    .line 72
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_0

    .line 79
    .line 80
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 81
    .line 82
    iput-object p3, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    iput-object v1, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    iput-object v1, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 89
    .line 90
    :goto_0
    iget-object p3, p0, Ll/tra0;->j:Lv/VEditText;

    .line 91
    .line 92
    iget-object v0, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object p3, p0, Ll/tra0;->j:Lv/VEditText;

    .line 98
    .line 99
    iget-object v0, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-virtual {p3, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 106
    .line 107
    .line 108
    iget-object p3, p0, Ll/tra0;->j:Lv/VEditText;

    .line 109
    .line 110
    iget-object v0, p0, Ll/tra0;->o:Ll/lra0;

    .line 111
    .line 112
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    const/16 v0, 0x64

    .line 116
    .line 117
    invoke-virtual {p3, v0}, Lv/VEditText;->setMaxLength(I)V

    .line 118
    .line 119
    .line 120
    iget-object p3, p0, Ll/tra0;->d:Landroid/widget/FrameLayout;

    .line 121
    .line 122
    new-instance v0, Ll/nra0;

    .line 123
    .line 124
    invoke-direct {v0, p0, p2, p1}, Ll/nra0;-><init>(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V

    .line 125
    .line 126
    .line 127
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 133
    .line 134
    if-eqz p1, :cond_2

    .line 135
    .line 136
    iget-object p1, p0, Ll/tra0;->c:Landroid/widget/TextView;

    .line 137
    .line 138
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p2, p0, Ll/tra0;->p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_2
    iget-object p1, p0, Ll/tra0;->d:Landroid/widget/FrameLayout;

    .line 158
    .line 159
    sget p2, Ll/qa00;->y:I

    .line 160
    .line 161
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Ll/tra0;->c:Landroid/widget/TextView;

    .line 165
    .line 166
    const/4 p2, 0x0

    .line 167
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    :goto_1
    iget-object p1, p0, Ll/tra0;->m:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 171
    .line 172
    iget-object p2, p0, Ll/tra0;->p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 173
    .line 174
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/tra0;->r:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Ll/tra0;->C(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/tra0;->j:Lv/VEditText;

    .line 183
    .line 184
    new-instance p2, Ll/tra0$a;

    .line 185
    .line 186
    invoke-direct {p2, p0}, Ll/tra0$a;-><init>(Ll/tra0;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tra0;->q:Lcom/p1/mobile/putong/core/data/Question;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 2
    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    const/4 p3, -0x1

    .line 12
    if-ne p4, p3, :cond_0

    .line 13
    .line 14
    const-string p3, "loop_result_question"

    .line 15
    .line 16
    invoke-virtual {p5, p3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, Lcom/p1/mobile/putong/core/data/Question;

    .line 21
    .line 22
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    if-eqz p4, :cond_0

    .line 27
    .line 28
    iget-object p4, p3, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p4

    .line 34
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    if-nez p4, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p2, p1, p3}, Ll/tra0;->q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p3, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopQuestionAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const-string v0, "loop_create_tag_info"

    .line 8
    .line 9
    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tra0;->o:Ll/lra0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/lra0;->b:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    const-string v1, "loop_edit_user"

    .line 17
    .line 18
    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const-string v0, "loop_new_style"

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 30
    .line 31
    new-instance v2, Ll/qra0;

    .line 32
    .line 33
    invoke-direct {v2, p0, p1, p2}, Ll/qra0;-><init>(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, p3, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    const-string v0, "\u5df2\u6dfb\u52a0"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tra0;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/tra0;->t:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object v0, p0, Ll/tra0;->s:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/tra0;->A(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tra0;->p:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyQuestionInputFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "e_save_qa"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/tra0;->t:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    iget-object v1, p0, Ll/tra0;->s:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/tra0;->A(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
