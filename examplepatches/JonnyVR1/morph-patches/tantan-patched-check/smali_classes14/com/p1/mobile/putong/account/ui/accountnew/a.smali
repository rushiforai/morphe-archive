.class public Lcom/p1/mobile/putong/account/ui/accountnew/a;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/v6l0;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;",
        ">;"
    }
.end annotation


# static fields
.field public static w:Ljava/lang/String;

.field public static x:I


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VCheckBox;

.field public m:Lv/VText;

.field public n:Lv/VButton_FakeShadow;

.field public o:Ll/v6l0;

.field public p:Z

.field public q:I

.field public r:Z

.field public s:Z

.field public t:J

.field public u:Ll/bm5;

.field public v:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;
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
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->q:I

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->r:Z

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->t:J

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->v:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->R()V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/account/ui/accountnew/a;)Ll/bm5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->u:Ll/bm5;

    return-object p0
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v6l0;->o:Ll/x20;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic Q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->H()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "e_appeal_phone_number_verification_policy"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->u:Ll/bm5;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/bm5;->show()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->U(Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->V(Lcom/p1/mobile/putong/data/VerifyReason;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->T()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->W(ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->Q()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/account/ui/accountnew/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->Z(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->X(ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/account/ui/accountnew/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->P()V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/account/ui/accountnew/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->a0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/account/ui/accountnew/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/account/ui/accountnew/a;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->Y(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/account/ui/accountnew/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->M(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/account/ui/accountnew/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->O(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l7l0;->b(Lcom/p1/mobile/putong/account/ui/accountnew/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E(Landroid/view/Menu;)V
    .locals 2

    .line 1
    sget p0, Ll/wcc0;->l0:I

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/account/R$string;->m2:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {p1, v1, p0, v1, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x2

    .line 11
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public F(Ll/v6l0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 2
    .line 3
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->q:I

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->q:I

    .line 13
    .line 14
    return-void
.end method

.method public H()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->c()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->onHomePressed()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->r:Z

    .line 10
    .line 11
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyData;ZLjava/lang/String;)V
    .locals 3

    .line 1
    const/4 p5, 0x1

    .line 2
    iput-boolean p5, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->p:Z

    .line 3
    .line 4
    new-instance p6, Ll/w6l0;

    .line 5
    .line 6
    invoke-direct {p6, p0}, Ll/w6l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p6}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    const-string p6, "ban-appeal"

    .line 13
    .line 14
    invoke-static {p1, p6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p6

    .line 18
    if-eqz p6, :cond_0

    .line 19
    .line 20
    iget-object p6, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    check-cast p6, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 23
    .line 24
    sget v0, Lcom/p1/mobile/putong/account/R$string;->c4:I

    .line 25
    .line 26
    invoke-virtual {p6, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 27
    .line 28
    .line 29
    iget-object p6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->n:Lv/VButton_FakeShadow;

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/account/R$string;->d:I

    .line 32
    .line 33
    invoke-virtual {p6, v0}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p6, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    check-cast p6, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 39
    .line 40
    invoke-virtual {p6}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p6

    .line 44
    sget v0, Lcom/p1/mobile/putong/account/R$string;->b4:I

    .line 45
    .line 46
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p6

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 56
    .line 57
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v2, Lcom/p1/mobile/putong/account/R$string;->a4:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->tg()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-ne v1, p5, :cond_1

    .line 98
    .line 99
    iget-object p6, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 100
    .line 101
    check-cast p6, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 102
    .line 103
    invoke-virtual {p6}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object p6

    .line 107
    sget v0, Lcom/p1/mobile/putong/account/R$string;->Z3:I

    .line 108
    .line 109
    invoke-virtual {p6, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p6

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 119
    .line 120
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    sget v2, Lcom/p1/mobile/putong/account/R$string;->Y3:I

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->m:Lv/VText;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Ll/bm5;

    .line 148
    .line 149
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_2

    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->tg()I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    goto :goto_0

    .line 170
    :cond_2
    move v2, p5

    .line 171
    :goto_0
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 172
    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->u:Ll/bm5;

    .line 175
    .line 176
    new-instance v1, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;

    .line 177
    .line 178
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->m:Lv/VText;

    .line 185
    .line 186
    new-instance v1, Ll/c7l0;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/c7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v0, p6, v1}, Ll/gsj0;->c(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 192
    .line 193
    .line 194
    iget-object p6, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->d:Lv/VText;

    .line 195
    .line 196
    invoke-static {p2, p3}, Ll/e170;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-virtual {p6, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->c:Lv/VText;

    .line 204
    .line 205
    sget p3, Lcom/p1/mobile/putong/account/R$string;->X3:I

    .line 206
    .line 207
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 208
    .line 209
    .line 210
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 211
    .line 212
    invoke-virtual {p2, p1}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-static {p1}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-nez p1, :cond_3

    .line 221
    .line 222
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 223
    .line 224
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 225
    .line 226
    sget p2, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 227
    .line 228
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 229
    .line 230
    .line 231
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p4, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 236
    .line 237
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 238
    .line 239
    invoke-virtual {p1, p5}, Ll/v6l0;->W1(Z)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 243
    .line 244
    iget-object p1, p1, Ll/v6l0;->n:Ljava/lang/Runnable;

    .line 245
    .line 246
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 247
    .line 248
    .line 249
    goto :goto_1

    .line 250
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 251
    .line 252
    invoke-virtual {p1}, Ll/v6l0;->q1()V

    .line 253
    .line 254
    .line 255
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 256
    .line 257
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 258
    .line 259
    iget-object p2, p2, Ll/v6l0;->o:Ll/x20;

    .line 260
    .line 261
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setOnCompleteAction(Ll/x20;)V

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 265
    .line 266
    new-instance p2, Ll/d7l0;

    .line 267
    .line 268
    invoke-direct {p2, p0}, Ll/d7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 275
    .line 276
    new-instance p2, Ll/e7l0;

    .line 277
    .line 278
    invoke-direct {p2, p0}, Ll/e7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setListener(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$a;)V

    .line 282
    .line 283
    .line 284
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->n:Lv/VButton_FakeShadow;

    .line 285
    .line 286
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 287
    .line 288
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->getText()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    const/4 p3, 0x4

    .line 297
    if-ne p2, p3, :cond_4

    .line 298
    .line 299
    move p2, p5

    .line 300
    goto :goto_2

    .line 301
    :cond_4
    const/4 p2, 0x0

    .line 302
    :goto_2
    invoke-static {p1, p2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 303
    .line 304
    .line 305
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->n:Lv/VButton_FakeShadow;

    .line 306
    .line 307
    new-instance p2, Ll/f7l0;

    .line 308
    .line 309
    invoke-direct {p2, p0}, Ll/f7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    .line 314
    .line 315
    invoke-static {}, Ll/bp;->k()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-eqz p1, :cond_5

    .line 320
    .line 321
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->c:Lv/VText;

    .line 322
    .line 323
    const/high16 p2, 0x42000000    # 32.0f

    .line 324
    .line 325
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 326
    .line 327
    .line 328
    move-result p2

    .line 329
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 330
    .line 331
    .line 332
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->d:Lv/VText;

    .line 333
    .line 334
    const/high16 p2, 0x41800000    # 16.0f

    .line 335
    .line 336
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 337
    .line 338
    .line 339
    move-result p2

    .line 340
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 344
    .line 345
    const/high16 p2, 0x41c00000    # 24.0f

    .line 346
    .line 347
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 348
    .line 349
    .line 350
    move-result p3

    .line 351
    invoke-static {p1, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 352
    .line 353
    .line 354
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->f:Landroid/widget/FrameLayout;

    .line 355
    .line 356
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 357
    .line 358
    .line 359
    move-result p2

    .line 360
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 361
    .line 362
    .line 363
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->h:Landroid/widget/LinearLayout;

    .line 364
    .line 365
    invoke-static {p1, p5}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->i:Lv/VText;

    .line 369
    .line 370
    new-instance p2, Ll/g7l0;

    .line 371
    .line 372
    invoke-direct {p2, p0}, Ll/g7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 373
    .line 374
    .line 375
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 376
    .line 377
    .line 378
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->k:Landroid/widget/LinearLayout;

    .line 379
    .line 380
    const/16 p2, 0x8

    .line 381
    .line 382
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 383
    .line 384
    .line 385
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 386
    .line 387
    new-instance p2, Ll/h7l0;

    .line 388
    .line 389
    invoke-direct {p2, p0}, Ll/h7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 390
    .line 391
    .line 392
    const-wide/16 p3, 0x1f4

    .line 393
    .line 394
    invoke-static {p1, p2, p3, p4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 395
    .line 396
    .line 397
    return-void
.end method

.method public K()I
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->getText()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return p0

    .line 16
    :catch_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final L()Z
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->t:J

    .line 6
    .line 7
    sub-long v4, v0, v2

    .line 8
    .line 9
    const-wide/16 v6, 0x0

    .line 10
    .line 11
    cmp-long v2, v2, v6

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    const-wide/16 v2, 0x1f4

    .line 16
    .line 17
    cmp-long v2, v4, v2

    .line 18
    .line 19
    if-gez v2, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->t:J

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic M(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->p:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->p:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/v6l0;->o1()Lcom/p1/mobile/putong/data/VerifyReason;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v2, "ban-appeal"

    .line 21
    .line 22
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-array v3, v1, [Ljava/lang/Object;

    .line 49
    .line 50
    const-string v4, "e_verification_code_input"

    .line 51
    .line 52
    invoke-static {v4, v0, v2, v3}, Ll/g4g0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->n:Lv/VButton_FakeShadow;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 v0, 0x4

    .line 62
    if-ne p1, v0, :cond_1

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    :cond_1
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_prelogin_verification_code_page_feedback"

    .line 2
    .line 3
    const-string v0, "p_sign_in_verification_code_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "https://feedback.tantanapp.com/feedback-mobile/pre-login"

    .line 17
    .line 18
    invoke-static {v0}, Ll/ebe0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    const-string v2, "\u5e2e\u52a9\u4e0e\u53cd\u9988"

    .line 24
    .line 25
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/v6l0;->o1()Lcom/p1/mobile/putong/data/VerifyReason;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "ban-appeal"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_verification_code_input"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic T()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->s:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/v6l0;->X1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/PasswordResetNewAct;->X1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jbf0;->f(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->finish()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic W(ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->K()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, " "

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Lcom/p1/mobile/putong/data/Device;

    .line 39
    .line 40
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 44
    .line 45
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 50
    .line 51
    const-string p1, "confirmation_code"

    .line 52
    .line 53
    invoke-static {p1}, Lcom/p1/mobile/putong/data/SignInGrantType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, v0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 60
    .line 61
    new-instance p2, Ll/a7l0;

    .line 62
    .line 63
    invoke-direct {p2, p0, p3}, Ll/a7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    invoke-virtual {p1, v0, p2, p0}, Ll/ibf0;->J0(Lcom/p1/mobile/putong/data/SignInData;Ll/x20;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final synthetic X(ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 6
    .line 7
    iput-object p2, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->verifyAppealIdentity(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PhoneNumber;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic Y(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v6l0;->V1(Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/v6l0;->o1()Lcom/p1/mobile/putong/data/VerifyReason;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "ban-appeal"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "phone_num"

    .line 30
    .line 31
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v1, "e_get_another_code_button"

    .line 40
    .line 41
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, v0}, Ll/v6l0;->W1(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 51
    .line 52
    iget-object p0, p0, Ll/v6l0;->n:Ljava/lang/Runnable;

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public final synthetic a0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/v6l0;->o1()Lcom/p1/mobile/putong/data/VerifyReason;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "ban-appeal"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "phone_num"

    .line 30
    .line 31
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v1, "e_get_another_code_button"

    .line 40
    .line 41
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, v0}, Ll/v6l0;->W1(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 51
    .line 52
    iget-object p0, p0, Ll/v6l0;->n:Ljava/lang/Runnable;

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public bridge synthetic b(Ll/ibf0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->F(Ll/v6l0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 3

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
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-array v1, v0, [Ll/rfj0$a;

    .line 19
    .line 20
    const-string v2, "e_p_appeal_verify_phonenumber_page_back"

    .line 21
    .line 22
    invoke-static {v2, p1, v1}, Ll/rfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/rfj0$a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->r:Z

    .line 26
    .line 27
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/putong/data/VerifyReason;ILjava/lang/String;Z)V
    .locals 1

    .line 1
    sget p5, Lcom/p1/mobile/putong/account/ui/accountnew/a;->x:I

    .line 2
    .line 3
    add-int/lit8 v0, p5, 0x1

    .line 4
    .line 5
    sput v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->x:I

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    if-ge p5, v0, :cond_6

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->K()I

    .line 11
    .line 12
    .line 13
    move-result p5

    .line 14
    iput p5, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 15
    .line 16
    const-string p5, "signup"

    .line 17
    .line 18
    invoke-static {p2, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p5

    .line 22
    if-eqz p5, :cond_0

    .line 23
    .line 24
    new-instance p1, Ll/i7l0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/i7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p5, "forgot-password"

    .line 31
    .line 32
    invoke-static {p2, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p5

    .line 36
    if-eqz p5, :cond_1

    .line 37
    .line 38
    new-instance p3, Ll/j7l0;

    .line 39
    .line 40
    invoke-direct {p3, p0, p1}, Ll/j7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 41
    .line 42
    .line 43
    move-object p1, p3

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string p1, "signin"

    .line 46
    .line 47
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    new-instance p1, Ll/k7l0;

    .line 54
    .line 55
    invoke-direct {p1, p0, p3, p4, p2}, Ll/k7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const-string p1, "ban-appeal"

    .line 60
    .line 61
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    new-instance p1, Ll/x6l0;

    .line 68
    .line 69
    invoke-direct {p1, p0, p3, p4}, Ll/x6l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const/4 p1, 0x0

    .line 74
    :goto_0
    const-string p3, "fix_verify_code_hack"

    .line 75
    .line 76
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    if-nez p3, :cond_5

    .line 81
    .line 82
    const-string p3, "signup_signin"

    .line 83
    .line 84
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_4

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ll/v6l0;->Y1(Ll/x20;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_5
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/v6l0;->Z1()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 104
    .line 105
    const-string p1, ""

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    sget p0, Lcom/p1/mobile/putong/account/R$string;->z3:I

    .line 111
    .line 112
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public d0(Ljava/lang/Throwable;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    move-object v1, p1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 14
    .line 15
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 16
    .line 17
    const v2, 0x62639

    .line 18
    .line 19
    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g0(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/y6l0;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/y6l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/sm;->n0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    if-eqz v0, :cond_1

    .line 39
    .line 40
    move-object v0, p1

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 42
    .line 43
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 44
    .line 45
    const v1, 0x6263b

    .line 46
    .line 47
    .line 48
    if-ne v0, v1, :cond_1

    .line 49
    .line 50
    sget-object p1, Ll/olj;->INSTANCE:Ll/olj;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 63
    .line 64
    invoke-virtual {v1, p2}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p2}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    xor-int/lit8 p2, p2, 0x1

    .line 73
    .line 74
    invoke-static {v0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 78
    .line 79
    sget v0, Lcom/p1/mobile/putong/account/R$string;->D3:I

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 85
    .line 86
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 87
    .line 88
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 89
    .line 90
    sget v1, Lcom/p1/mobile/putong/account/R$string;->E3:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/z6l0;

    .line 97
    .line 98
    invoke-direct {v1, p0, p3}, Ll/z6l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p2, v0, v1}, Ll/gsj0;->c(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    sput p1, Lcom/p1/mobile/putong/account/ui/accountnew/a;->x:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/v6l0;->q1()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j:Lv/VText;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->w:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->o:Ll/v6l0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/v6l0;->p1(Lcom/p1/mobile/putong/data/VerifyReason;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sput-object p1, Lcom/p1/mobile/putong/account/ui/accountnew/a;->w:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public g0(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 6
    .line 7
    sget v2, Lcom/p1/mobile/putong/account/R$string;->X2:I

    .line 8
    .line 9
    const/16 v3, 0x3c

    .line 10
    .line 11
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j:Lv/VText;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/account/R$string;->D3:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->g:Lv/VText;

    .line 46
    .line 47
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 48
    .line 49
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 50
    .line 51
    sget v2, Lcom/p1/mobile/putong/account/R$string;->E3:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/b7l0;

    .line 58
    .line 59
    invoke-direct {v2, p0, p1}, Ll/b7l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1, v2}, Ll/gsj0;->c(Landroid/widget/TextView;Ljava/lang/String;Ll/x20;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public i0(J)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j:Lv/VText;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/account/R$string;->X2:I

    .line 8
    .line 9
    const-wide/16 v2, 0x3b

    .line 10
    .line 11
    sub-long/2addr v2, p1

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v6l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->F(Ll/v6l0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j0(Lcom/p1/mobile/putong/data/VerifyReason;Z)V
    .locals 0

    .line 1
    const-string p2, "signin"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 12
    .line 13
    sget p1, Lcom/p1/mobile/putong/account/R$string;->J3:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 20
    .line 21
    sget p1, Lcom/p1/mobile/putong/account/R$string;->J3:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/VerifyData;ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/a;->e:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 9
    .line 10
    const-string p1, ""

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;->setText(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p5}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeInputAct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
