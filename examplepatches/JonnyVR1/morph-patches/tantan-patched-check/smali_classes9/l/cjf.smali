.class public Ll/cjf;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/hjf;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public final i:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

.field public l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Ll/kjf;

.field public o:Ll/mjf;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cjf;->b:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/cjf;->i:Ljava/util/HashSet;

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/cjf;->j:Ljava/util/HashSet;

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/cjf;->m:Ljava/util/ArrayList;

    .line 37
    .line 38
    new-instance v0, Ll/kjf;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/kjf;-><init>(Ll/cjf;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/cjf;->n:Ll/kjf;

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    iput-object p1, p0, Ll/cjf;->a:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    return-void
.end method

.method private synthetic C0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/tr90;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/hjf;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/hjf;->r()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/cjf;->a:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/cjf;->S0(Landroid/os/Bundle;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private O0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget v3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->new_()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/d0;->t4(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/uif;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/uif;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v2, Ll/vif;

    .line 68
    .line 69
    invoke-direct {v2, p0, v1}, Ll/vif;-><init>(Ll/cjf;Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/wif;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/wif;-><init>(Ll/cjf;)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Ll/xif;

    .line 86
    .line 87
    invoke-direct {v2, p0}, Ll/xif;-><init>(Ll/cjf;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_0
    invoke-virtual {p0}, Ll/cjf;->t0()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private W0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 4
    .line 5
    const-string v2, "\u786e\u8ba4\u9000\u51fa"

    .line 6
    .line 7
    const-string v3, "\u7ee7\u7eed\u586b\u5199"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/cjf;->t0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "\u8fd8\u5dee\u4e00\u70b9\u5c31\u5b8c\u6210\u5566"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v4}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "\u5b8c\u5584\u8d44\u6599\u5c55\u793a\u771f\u5b9e\u3001\u751f\u52a8\u7684\u4f60\uff0c\u5373\u53ef\u89e3\u9501\u7cbe\u9009\uff0c\u8ba4\u8bc6\u66f4\u591a\u4f18\u8d28\u670b\u53cb\u3002"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/zif;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/zif;-><init>(Ll/cjf;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    new-instance v0, Ll/th0$a;

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    const-string v1, "\u662f\u5426\u9000\u51fa"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v4}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v1, p0, Ll/cjf;->a:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    sget v4, Lcom/p1/mobile/putong/core/R$string;->U3:I

    .line 97
    .line 98
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/ajf;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/ajf;-><init>(Ll/cjf;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/core/data/ProfileEditInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic f0(Ll/cjf;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->E0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g0(Ll/cjf;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cjf;->C0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/cjf;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->G0(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/cjf;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->H0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/cjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->J0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/cjf;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cjf;->D0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/cjf;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->F0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Ll/cjf;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->I0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-gt v0, v1, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->N(Ljava/util/List;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 18
    .line 19
    if-ne v0, p0, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->isHit:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;->user:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p2, p0}, Ll/bzw;->i(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;-><init>(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic E0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Ll/cjf;->Q0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic F0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/ProfileEditInfoException;->getEditInfo()Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p1, v0}, Ll/wx6;->d(Lcom/p1/mobile/putong/core/data/ProfileEditInfo;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->s:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->Y0:I

    .line 39
    .line 40
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p1, "\u4e0a\u4f20\u5931\u8d25"

    .line 45
    .line 46
    invoke-static {p1}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Ll/cjf;->Q0(Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cjf;->g:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic H0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cjf;->b1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cjf;->P0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cjf;->P0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->i:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/cjf;->j:Ljava/util/HashSet;

    .line 11
    .line 12
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/cjf;->X0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cjf;->Y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cjf;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/cjf;->O0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ll/cjf;->Q0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Q0(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "loop_edit_user"

    .line 14
    .line 15
    iget-object v2, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    const-string v2, "saveAndFinish"

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/a3b0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-virtual {v1, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public R0(Ll/mjf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjf;->o:Ll/mjf;

    .line 2
    .line 3
    return-void
.end method

.method public final S0(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    const-string v0, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 2
    .line 3
    const-string v1, " showFragment entryType:"

    .line 4
    .line 5
    const-string v2, "loop_edit_entry_type"

    .line 6
    .line 7
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 12
    .line 13
    iput-object v2, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 14
    .line 15
    const-string v2, "loop_eidt_first_type"

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 22
    .line 23
    iput-object v2, p0, Ll/cjf;->e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 24
    .line 25
    const-string v2, "loop_edit_from"

    .line 26
    .line 27
    const-string v3, ""

    .line 28
    .line 29
    invoke-virtual {p1, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iput-object v2, p0, Ll/cjf;->f:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v2, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 36
    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 40
    .line 41
    iput-object v2, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 42
    .line 43
    :cond_0
    const-string v2, "loop_edit_save_user"

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {p1, v2, v3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput-boolean p1, p0, Ll/cjf;->b:Z

    .line 51
    .line 52
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p1, p1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xc(Lcom/p1/mobile/putong/data/User;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Ll/cjf;->g:Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iget-object v2, p0, Ll/cjf;->g:Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 114
    .line 115
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 116
    .line 117
    invoke-interface {p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->no(Z)V

    .line 118
    .line 119
    .line 120
    :try_start_0
    new-instance p1, Ljava/lang/StringBuffer;

    .line 121
    .line 122
    invoke-direct {p1, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .line 127
    const-string v2, "null"

    .line 128
    .line 129
    if-nez v1, :cond_2

    .line 130
    .line 131
    move-object v1, v2

    .line 132
    goto :goto_0

    .line 133
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    :goto_0
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    .line 139
    .line 140
    const-string v1, " firstShow:"

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/cjf;->e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 146
    .line 147
    if-nez v1, :cond_3

    .line 148
    .line 149
    move-object v1, v2

    .line 150
    goto :goto_1

    .line 151
    :cond_3
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->title:Ljava/lang/String;

    .line 152
    .line 153
    :goto_1
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    .line 155
    .line 156
    const-string v1, " oldUser:"

    .line 157
    .line 158
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    .line 160
    .line 161
    iget-object v1, p0, Ll/cjf;->g:Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    if-nez v1, :cond_4

    .line 164
    .line 165
    move-object v1, v2

    .line 166
    goto :goto_2

    .line 167
    :cond_4
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 168
    .line 169
    :goto_2
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 170
    .line 171
    .line 172
    const-string v1, " from:"

    .line 173
    .line 174
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Ll/cjf;->f:Ljava/lang/String;

    .line 178
    .line 179
    if-nez v1, :cond_5

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_5
    move-object v2, v1

    .line 183
    :goto_3
    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 191
    .line 192
    .line 193
    :catch_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Uc()Lcom/p1/mobile/putong/data/User;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iput-object p1, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 206
    .line 207
    if-eqz p1, :cond_6

    .line 208
    .line 209
    new-instance p1, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    const-string v1, " showFragment args: editUser:"

    .line 212
    .line 213
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-object v1, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_6
    const-string p1, " showFragment args: editUser:null"

    .line 232
    .line 233
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :goto_4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 237
    .line 238
    check-cast p1, Ll/hjf;

    .line 239
    .line 240
    iget-object v0, p0, Ll/cjf;->n:Ll/kjf;

    .line 241
    .line 242
    iget-object v1, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 243
    .line 244
    invoke-virtual {v0, v1}, Ll/kjf;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {p1, v0}, Ll/hjf;->p(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Ll/cjf;->n:Ll/kjf;

    .line 252
    .line 253
    iget-object v0, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 254
    .line 255
    iget-object v1, p0, Ll/cjf;->e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 256
    .line 257
    invoke-virtual {p1, v0, v1}, Ll/kjf;->e(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/util/ArrayList;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    iput-object p1, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 262
    .line 263
    new-instance v0, Ll/bjf;

    .line 264
    .line 265
    invoke-direct {v0, p0}, Ll/bjf;-><init>(Ll/cjf;)V

    .line 266
    .line 267
    .line 268
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    iput-object p1, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 273
    .line 274
    iget-object v0, p0, Ll/cjf;->e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 275
    .line 276
    if-eqz v0, :cond_7

    .line 277
    .line 278
    invoke-virtual {p1, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    :cond_7
    invoke-virtual {p0}, Ll/cjf;->X0()V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public final U0(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Z)V
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/cjf;->g1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getFragment()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->r0()Landroidx/fragment/app/e;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/e;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    move-object v2, v0

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    .line 51
    .line 52
    iput-object v2, p0, Ll/cjf;->k:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    .line 53
    .line 54
    new-instance v3, Ll/yif;

    .line 55
    .line 56
    invoke-direct {v3, p0}, Ll/yif;-><init>(Ll/cjf;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 60
    .line 61
    .line 62
    iget-object v4, p0, Ll/cjf;->k:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    .line 63
    .line 64
    iget-object v5, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 65
    .line 66
    iget-object v2, p0, Ll/cjf;->i:Ljava/util/HashSet;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    iget-object v2, p0, Ll/cjf;->j:Ljava/util/HashSet;

    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    invoke-virtual {p0}, Ll/cjf;->A0()Z

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    move-object v6, p1

    .line 83
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->U4(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;IIZ)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    move-object v6, p1

    .line 88
    :goto_0
    if-eqz p2, :cond_2

    .line 89
    .line 90
    sget p1, Ll/x7c0;->t:I

    .line 91
    .line 92
    sget p2, Ll/x7c0;->u:I

    .line 93
    .line 94
    invoke-virtual {v1, p1, p2}, Landroidx/fragment/app/k;->u(II)Landroidx/fragment/app/k;

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    sget p1, Ll/x7c0;->s:I

    .line 99
    .line 100
    sget p2, Ll/x7c0;->v:I

    .line 101
    .line 102
    invoke-virtual {v1, p1, p2}, Landroidx/fragment/app/k;->u(II)Landroidx/fragment/app/k;

    .line 103
    .line 104
    .line 105
    :goto_1
    sget p1, Ll/adc0;->q6:I

    .line 106
    .line 107
    const-string p2, "input_text"

    .line 108
    .line 109
    invoke-virtual {v1, p1, v0, p2}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 110
    .line 111
    .line 112
    iput-object v6, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/cjf;->V0()V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 118
    .line 119
    check-cast p0, Ll/hjf;

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/hjf;->n()V

    .line 122
    .line 123
    .line 124
    :try_start_0
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :catch_0
    move-exception v0

    .line 129
    move-object p0, v0

    .line 130
    new-instance p1, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string p2, "showNextFragment commitAllowingStateLoss \u5f02\u5e38"

    .line 133
    .line 134
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    const-string p1, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 149
    .line 150
    invoke-static {p1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public final V0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hjf;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object p0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 14
    .line 15
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {p0, v2}, Ljava/lang/Math;->max(II)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, v1, p0}, Ll/hjf;->z(II)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final X0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/cjf;->m:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    add-int/2addr v0, v1

    .line 21
    :goto_0
    iget-object v2, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ge v0, v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 36
    .line 37
    iget-object v3, p0, Ll/cjf;->e:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 38
    .line 39
    if-eq v2, v3, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/cjf;->x0()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->checkIfNeed(Lcom/p1/mobile/putong/data/User;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 v2, 0x0

    .line 56
    :cond_3
    :goto_1
    if-nez v2, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/cjf;->P0()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_4
    invoke-virtual {p0, v2, v1}, Ll/cjf;->U0(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Z)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public Y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cjf;->m:Ljava/util/ArrayList;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/cjf;->U0(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tif;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tif;-><init>(Ll/cjf;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final a1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "specific_edit_page_name"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "e_edit_specific_profile_exit"

    .line 25
    .line 26
    invoke-static {v1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final b1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "specific_edit_page_name"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "e_edit_specific_profile_exit"

    .line 25
    .line 26
    invoke-static {v1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public c1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_edit_specific_profile_next"

    .line 21
    .line 22
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public d1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_edit_specific_profile_next"

    .line 21
    .line 22
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_edit_specific_profile_skip"

    .line 21
    .line 22
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getPageId()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "specific_edit_page_name"

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->pageName:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_edit_specific_profile_skip"

    .line 21
    .line 22
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final g1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hjf;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/hjf;->f()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/hjf;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/hjf;->q(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cjf;->n:Ll/kjf;

    .line 17
    .line 18
    iget-object v2, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/kjf;->f(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    check-cast v2, Ll/hjf;

    .line 34
    .line 35
    iget-object v0, p0, Ll/cjf;->m:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    xor-int/2addr v0, v3

    .line 42
    invoke-virtual {v2, v0}, Ll/hjf;->u(Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    check-cast v2, Ll/hjf;

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ll/hjf;->u(Z)V

    .line 49
    .line 50
    .line 51
    :goto_0
    iget-object v0, p0, Ll/cjf;->n:Ll/kjf;

    .line 52
    .line 53
    iget-object v2, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 54
    .line 55
    invoke-virtual {v0, v2, p1}, Ll/kjf;->i(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    check-cast v2, Ll/hjf;

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ll/hjf;->v(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/cjf;->f1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    check-cast v2, Ll/hjf;

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ll/hjf;->v(Z)V

    .line 79
    .line 80
    .line 81
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 82
    .line 83
    check-cast p0, Ll/hjf;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->updateButtonState(Ll/hjf;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final n0()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cjf;->l:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 18
    .line 19
    iget-object v2, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v3, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->canExit(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public o0()Z
    .locals 5

    .line 1
    const-string v0, " backPress childCount:"

    .line 2
    .line 3
    const-string v1, " backPress user:"

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "input_text"

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isVisible()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    :cond_0
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v2, Ll/hjf;

    .line 30
    .line 31
    iget-object v2, v2, Ll/hjf;->d:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->g:Lcom/p1/mobile/putong/data/User;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    const-string v4, "ProfileInfoLoopEditAct_white_screen_issue_tracking"

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->g:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->toJson()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v4, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v4, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ljava/lang/RuntimeException;

    .line 80
    .line 81
    const-string v1, "ProfileInfoLoopEditAct_WhiteScreenIssue"

    .line 82
    .line 83
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    :cond_2
    invoke-virtual {p0}, Ll/cjf;->a1()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/cjf;->n0()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/cjf;->P0()V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    invoke-direct {p0}, Ll/cjf;->W0()V

    .line 103
    .line 104
    .line 105
    :goto_0
    const/4 p0, 0x1

    .line 106
    return p0
.end method

.method public p0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->hasWheelDataChanged(Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cjf;->o:Ll/mjf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/mjf;->x3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cjf;->o:Ll/mjf;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/mjf;->t0()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/cjf;->c1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cjf;->o:Ll/mjf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/mjf;->x3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cjf;->o:Ll/mjf;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/mjf;->L()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cjf;->o:Ll/mjf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/mjf;->N()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cjf;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/cjf;->e1(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public t0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public u0()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjf;->k:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public x0()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public y0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cjf;->n:Ll/kjf;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cjf;->d:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cjf;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/kjf;->d(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public z0()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjf;->g:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method
