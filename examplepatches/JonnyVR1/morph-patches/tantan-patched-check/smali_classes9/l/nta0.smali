.class public Ll/nta0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pta0;",
        ">;"
    }
.end annotation


# static fields
.field public static g:Ll/jxd0;


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public c:I

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "isEnterHometownPager"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Ll/nta0;->g:Ll/jxd0;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/nta0;->c:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/nta0;->d:Z

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/nta0;->e:Ljava/util/List;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 25
    .line 26
    iput-object p1, p0, Ll/nta0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 27
    .line 28
    return-void
.end method

.method private synthetic E0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nta0;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private O0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 18
    .line 19
    const-string v3, ""

    .line 20
    .line 21
    iput-object v3, v2, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 22
    .line 23
    const-string v3, "default"

    .line 24
    .line 25
    invoke-static {v3}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v2, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 30
    .line 31
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getSearchPriority()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v3, "student"

    .line 50
    .line 51
    invoke-static {v3}, Lcom/p1/mobile/putong/data/SearchPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/SearchPriority;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 84
    .line 85
    invoke-virtual {v2, v0}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/cta0;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/cta0;-><init>(Ll/nta0;)V

    .line 96
    .line 97
    .line 98
    new-instance v2, Ll/dta0;

    .line 99
    .line 100
    invoke-direct {v2, p0}, Ll/dta0;-><init>(Ll/nta0;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public static synthetic e0(Ll/nta0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nta0;->I0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/nta0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nta0;->G0()V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h0(Ll/nta0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nta0;->D0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->l2:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic j0(Ll/nta0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nta0;->C0()V

    return-void
.end method

.method public static synthetic k0(ILjava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic l0(Ll/nta0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nta0;->H0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic n0(Ll/nta0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nta0;->E0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic o0(Ll/nta0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nta0;->F0()V

    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PET:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/xra;->w()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic C0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nta0;->O0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pta0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pta0;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F0()V
    .locals 1

    .line 1
    iget v0, p0, Ll/nta0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nta0;->L0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic G0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pta0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H0(Ll/uxj0;)V
    .locals 5

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
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/pta0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 33
    .line 34
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 37
    .line 38
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 39
    .line 40
    iget-boolean v4, v3, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 41
    .line 42
    iput-boolean v4, v2, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 43
    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 49
    .line 50
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 51
    .line 52
    iget-object p1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 53
    .line 54
    iget v1, p0, Ll/nta0;->c:I

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 61
    .line 62
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 75
    .line 76
    const/4 v1, 0x1

    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 83
    .line 84
    iget p1, p0, Ll/nta0;->c:I

    .line 85
    .line 86
    invoke-virtual {p0, p1, v0}, Ll/nta0;->N0(IZ)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast p0, Ll/pta0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/pta0;->j()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final synthetic I0(Ljava/lang/Throwable;)V
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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/pta0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pta0;->j()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public J0(IILandroid/content/Intent;)V
    .locals 5

    .line 1
    const-string p2, "loop_result_key"

    .line 2
    .line 3
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN_CITY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 8
    .line 9
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 10
    .line 11
    const-wide/16 v2, 0x12c

    .line 12
    .line 13
    if-ne p1, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-nez p2, :cond_5

    .line 24
    .line 25
    iget p2, p0, Ll/nta0;->c:I

    .line 26
    .line 27
    if-ltz p2, :cond_5

    .line 28
    .line 29
    iget-object p3, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-ge p2, p3, :cond_5

    .line 36
    .line 37
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p2, Ll/pta0;

    .line 40
    .line 41
    invoke-virtual {p2}, Ll/pta0;->q()V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 45
    .line 46
    iget p3, p0, Ll/nta0;->c:I

    .line 47
    .line 48
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 53
    .line 54
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p1, Ll/pta0;

    .line 60
    .line 61
    iget-object p1, p1, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 62
    .line 63
    new-instance p2, Ll/fta0;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/fta0;-><init>(Ll/nta0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1, p2, v2, v3}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 79
    .line 80
    check-cast p1, Ll/pta0;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/pta0;->q()V

    .line 83
    .line 84
    .line 85
    new-instance p1, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    const/4 v1, 0x0

    .line 101
    if-eqz p3, :cond_2

    .line 102
    .line 103
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    check-cast p3, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 108
    .line 109
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-eqz v4, :cond_1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_1
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 128
    .line 129
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    const/4 p3, 0x1

    .line 133
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-lez v0, :cond_3

    .line 141
    .line 142
    move v0, p3

    .line 143
    goto :goto_1

    .line 144
    :cond_3
    move v0, v1

    .line 145
    :goto_1
    iput v0, p0, Ll/nta0;->c:I

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-lez v0, :cond_4

    .line 152
    .line 153
    move v1, p3

    .line 154
    :cond_4
    invoke-virtual {p1, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 158
    .line 159
    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    .line 160
    .line 161
    .line 162
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 168
    .line 169
    check-cast p1, Ll/pta0;

    .line 170
    .line 171
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 177
    .line 178
    check-cast p1, Ll/pta0;

    .line 179
    .line 180
    iget-object p1, p1, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 181
    .line 182
    new-instance p2, Ll/gta0;

    .line 183
    .line 184
    invoke-direct {p2, p0}, Ll/gta0;-><init>(Ll/nta0;)V

    .line 185
    .line 186
    .line 187
    invoke-static {p1, p2, v2, v3}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 188
    .line 189
    .line 190
    :cond_5
    return-void
.end method

.method public L0(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/nta0;->N0(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public N0(IZ)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 8
    .line 9
    iput p1, p0, Ll/nta0;->c:I

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 19
    .line 20
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p2, Ll/pta0;

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->o(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/content/Context;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const-string v0, "loopInputClick"

    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/a3b0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/pta0;

    .line 60
    .line 61
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 62
    .line 63
    invoke-virtual {p0, p2, v2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    if-eqz p2, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/nta0;->r0(I)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    if-eqz p2, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/nta0;->P0(I)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget-object p2, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    if-ne p2, v1, :cond_a

    .line 87
    .line 88
    new-instance p2, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Ll/xra;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_5

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->d()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->SELECT_OVERSEAS:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 114
    .line 115
    if-ne v1, v4, :cond_3

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/HometownSuggest;->overseas:Ljava/util/Map;

    .line 122
    .line 123
    invoke-static {p2}, Ll/jyb;->D(Ljava/util/Map;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->Q(Ljava/util/List;)Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    move v1, v3

    .line 132
    goto :goto_1

    .line 133
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    if-eqz v4, :cond_5

    .line 148
    .line 149
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    check-cast v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 154
    .line 155
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    if-eqz v5, :cond_4

    .line 166
    .line 167
    iget-object p2, v4, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 168
    .line 169
    :cond_5
    :goto_0
    move v1, v2

    .line 170
    goto :goto_1

    .line 171
    :cond_6
    invoke-virtual {p0}, Ll/nta0;->u0()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_5

    .line 180
    .line 181
    invoke-virtual {p0}, Ll/nta0;->u0()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CategorySuggestions;->hometown:Ljava/util/Map;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    check-cast p2, Ljava/util/List;

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :goto_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-nez p2, :cond_7

    .line 203
    .line 204
    invoke-virtual {p0}, Ll/ar2;->Y()Landroid/content/Context;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-static {p1, p2, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputAct;->d2(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 217
    .line 218
    check-cast p2, Ll/pta0;

    .line 219
    .line 220
    invoke-virtual {p2}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 221
    .line 222
    .line 223
    move-result-object p2

    .line 224
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    const-string v0, "secondInput"

    .line 233
    .line 234
    invoke-static {p2, v0}, Ll/a3b0;->a(Ljava/lang/Object;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 238
    .line 239
    check-cast p0, Ll/pta0;

    .line 240
    .line 241
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 242
    .line 243
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN_CITY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 244
    .line 245
    iget p2, p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 246
    .line 247
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 248
    .line 249
    .line 250
    return-void

    .line 251
    :cond_7
    invoke-static {}, Ll/xra;->g()Z

    .line 252
    .line 253
    .line 254
    move-result p2

    .line 255
    if-eqz p2, :cond_e

    .line 256
    .line 257
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 262
    .line 263
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->R2:I

    .line 264
    .line 265
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    const-string v4, "\u5176\u4ed6"

    .line 270
    .line 271
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v4

    .line 275
    if-nez v4, :cond_9

    .line 276
    .line 277
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-eqz v1, :cond_8

    .line 282
    .line 283
    goto :goto_2

    .line 284
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string v4, "\u4e2d\u56fd\u00b7"

    .line 287
    .line 288
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 299
    .line 300
    .line 301
    goto :goto_4

    .line 302
    :cond_9
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    const-string v4, "\u00b7"

    .line 305
    .line 306
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 317
    .line 318
    .line 319
    goto :goto_4

    .line 320
    :cond_a
    invoke-virtual {p0}, Ll/nta0;->A0()Z

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    if-eqz p2, :cond_e

    .line 325
    .line 326
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 327
    .line 328
    check-cast p2, Ll/pta0;

    .line 329
    .line 330
    iget-object p2, p2, Ll/pta0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;

    .line 331
    .line 332
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditUploadPhoto;->setVisible(Z)V

    .line 333
    .line 334
    .line 335
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 336
    .line 337
    check-cast p2, Ll/pta0;

    .line 338
    .line 339
    iget-object p2, p2, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 340
    .line 341
    if-nez p1, :cond_b

    .line 342
    .line 343
    move p1, v3

    .line 344
    goto :goto_3

    .line 345
    :cond_b
    move p1, v2

    .line 346
    :goto_3
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 350
    .line 351
    new-instance p2, Ll/kta0;

    .line 352
    .line 353
    invoke-direct {p2}, Ll/kta0;-><init>()V

    .line 354
    .line 355
    .line 356
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 361
    .line 362
    .line 363
    move-result p2

    .line 364
    if-ge p2, v3, :cond_c

    .line 365
    .line 366
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 367
    .line 368
    .line 369
    move-result p2

    .line 370
    if-eqz p2, :cond_d

    .line 371
    .line 372
    :cond_c
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object p1

    .line 376
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 377
    .line 378
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 379
    .line 380
    .line 381
    :cond_d
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 382
    .line 383
    .line 384
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 385
    .line 386
    check-cast p1, Ll/pta0;

    .line 387
    .line 388
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 389
    .line 390
    invoke-virtual {p1, p2}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 391
    .line 392
    .line 393
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 394
    .line 395
    check-cast p1, Ll/pta0;

    .line 396
    .line 397
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p2

    .line 401
    invoke-virtual {p1, p2}, Ll/pta0;->s(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 405
    .line 406
    check-cast p0, Ll/pta0;

    .line 407
    .line 408
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 409
    .line 410
    .line 411
    return-void

    .line 412
    :cond_e
    :goto_4
    iget-object p2, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 413
    .line 414
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 415
    .line 416
    if-ne p2, v1, :cond_10

    .line 417
    .line 418
    iget-object p1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 419
    .line 420
    new-instance p2, Ll/lta0;

    .line 421
    .line 422
    invoke-direct {p2}, Ll/lta0;-><init>()V

    .line 423
    .line 424
    .line 425
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 430
    .line 431
    .line 432
    move-result p2

    .line 433
    if-ge p2, v3, :cond_f

    .line 434
    .line 435
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 436
    .line 437
    .line 438
    move-result p2

    .line 439
    if-nez p2, :cond_f

    .line 440
    .line 441
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 442
    .line 443
    .line 444
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 445
    .line 446
    check-cast p1, Ll/pta0;

    .line 447
    .line 448
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 449
    .line 450
    invoke-virtual {p1, p2}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 451
    .line 452
    .line 453
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 454
    .line 455
    check-cast p0, Ll/pta0;

    .line 456
    .line 457
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 458
    .line 459
    .line 460
    return-void

    .line 461
    :cond_f
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 466
    .line 467
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 471
    .line 472
    .line 473
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 474
    .line 475
    check-cast p1, Ll/pta0;

    .line 476
    .line 477
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 478
    .line 479
    invoke-virtual {p1, p2}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 480
    .line 481
    .line 482
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 483
    .line 484
    check-cast p0, Ll/pta0;

    .line 485
    .line 486
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 487
    .line 488
    .line 489
    return-void

    .line 490
    :cond_10
    iget-boolean v1, p0, Ll/nta0;->d:Z

    .line 491
    .line 492
    if-eqz v1, :cond_13

    .line 493
    .line 494
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 495
    .line 496
    if-ne p2, v1, :cond_11

    .line 497
    .line 498
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 499
    .line 500
    .line 501
    move-result p2

    .line 502
    if-nez p2, :cond_11

    .line 503
    .line 504
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 505
    .line 506
    new-instance v1, Ll/zsa0;

    .line 507
    .line 508
    invoke-direct {v1}, Ll/zsa0;-><init>()V

    .line 509
    .line 510
    .line 511
    invoke-static {p2, v1}, Ll/jyb;->f(Ljava/util/List;Ll/qcj;)I

    .line 512
    .line 513
    .line 514
    move-result p2

    .line 515
    const/4 v1, 0x3

    .line 516
    if-lt p2, v1, :cond_11

    .line 517
    .line 518
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    const-string p1, "\u6700\u591a\u9009\u62e93\u6b3e\u6e38\u620f"

    .line 523
    .line 524
    invoke-static {p0, p1}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    return-void

    .line 528
    :cond_11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 529
    .line 530
    .line 531
    move-result p2

    .line 532
    if-eqz p2, :cond_12

    .line 533
    .line 534
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 535
    .line 536
    .line 537
    iget-object p2, p0, Ll/nta0;->e:Ljava/util/List;

    .line 538
    .line 539
    new-instance v0, Ll/mta0;

    .line 540
    .line 541
    invoke-direct {v0, p1}, Ll/mta0;-><init>(I)V

    .line 542
    .line 543
    .line 544
    invoke-static {p2, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 545
    .line 546
    .line 547
    goto :goto_5

    .line 548
    :cond_12
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 549
    .line 550
    .line 551
    iget-object p2, p0, Ll/nta0;->e:Ljava/util/List;

    .line 552
    .line 553
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 554
    .line 555
    .line 556
    move-result-object p1

    .line 557
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    .line 559
    .line 560
    :goto_5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 561
    .line 562
    check-cast p1, Ll/pta0;

    .line 563
    .line 564
    iget-object p2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 565
    .line 566
    invoke-virtual {p1, p2}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 567
    .line 568
    .line 569
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 570
    .line 571
    check-cast p0, Ll/pta0;

    .line 572
    .line 573
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 574
    .line 575
    .line 576
    return-void

    .line 577
    :cond_13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 578
    .line 579
    check-cast p1, Ll/pta0;

    .line 580
    .line 581
    invoke-virtual {p1}, Ll/pta0;->q()V

    .line 582
    .line 583
    .line 584
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 585
    .line 586
    check-cast p0, Ll/pta0;

    .line 587
    .line 588
    iget-object p0, p0, Ll/pta0;->f:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 589
    .line 590
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->f()V

    .line 591
    .line 592
    .line 593
    return-void
.end method

.method public final P0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pta0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->g5(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/eta0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/eta0;-><init>(Ll/nta0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nta0;->s0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final q0(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->Z:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->h2:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->a0:I

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->i2:I

    .line 26
    .line 27
    :goto_1
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->d2:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/ata0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ata0;-><init>(Ll/nta0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance v0, Ll/bta0;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/bta0;-><init>(Ll/nta0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final r0(I)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INDUSTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nta0;->u0()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CategorySuggestions;->industry:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 71
    .line 72
    const-string v0, "verified"

    .line 73
    .line 74
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_0

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Ll/nta0;->q0(Z)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    return p0

    .line 85
    :cond_0
    return v2
.end method

.method public s0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/zsa0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/zsa0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x1

    .line 17
    if-lt p0, v0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public t0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/nta0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GROWTH_FOOD:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 8
    .line 9
    iget-object p0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/zsa0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/zsa0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v1, Ll/hta0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/hta0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    new-instance v1, Ll/zsa0;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/zsa0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v1, Ll/ita0;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/ita0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-virtual {p0}, Ll/nta0;->A0()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 64
    .line 65
    move-object v1, v0

    .line 66
    check-cast v1, Ll/pta0;

    .line 67
    .line 68
    iget-object v1, v1, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 69
    .line 70
    check-cast v0, Ll/pta0;

    .line 71
    .line 72
    iget-object v0, v0, Ll/pta0;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->pageId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v1, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->m0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    iget v0, p0, Ll/nta0;->c:I

    .line 82
    .line 83
    if-ltz v0, :cond_4

    .line 84
    .line 85
    iget-object v1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-le v0, v1, :cond_3

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 95
    .line 96
    iget-object v1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 97
    .line 98
    iget v2, p0, Ll/nta0;->c:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object v2, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 111
    .line 112
    iget v3, p0, Ll/nta0;->c:I

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 119
    .line 120
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget p0, p0, Ll/nta0;->c:I

    .line 125
    .line 126
    invoke-static {p1, v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->l(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;Ljava/lang/String;I)V

    .line 127
    .line 128
    .line 129
    :cond_4
    :goto_0
    return-void
.end method

.method public final u0()Lcom/p1/mobile/putong/core/data/CategorySuggestions;
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Mk()Lcom/p1/mobile/putong/core/data/CategorySuggestions;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final x0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/nta0;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_a

    .line 6
    .line 7
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 14
    .line 15
    if-ne v0, v2, :cond_a

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/nta0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->G:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_a

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_a

    .line 40
    .line 41
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_a

    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_a

    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 64
    .line 65
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_a

    .line 70
    .line 71
    iget-object v2, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    if-ne v2, v1, :cond_2

    .line 75
    .line 76
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 83
    .line 84
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_2

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 97
    .line 98
    const/4 v1, 0x0

    .line 99
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_9

    .line 110
    .line 111
    iget-object v1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-eqz v2, :cond_9

    .line 122
    .line 123
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 128
    .line 129
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-static {v4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    if-eqz v4, :cond_1

    .line 138
    .line 139
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_2
    iget-object v1, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 144
    .line 145
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 146
    .line 147
    if-ne v1, v2, :cond_9

    .line 148
    .line 149
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 150
    .line 151
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 152
    .line 153
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 156
    .line 157
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-nez v1, :cond_9

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 164
    .line 165
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 166
    .line 167
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 168
    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 170
    .line 171
    const-string v1, "cpdd"

    .line 172
    .line 173
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-eqz v2, :cond_3

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_3
    const-string v1, "\u7ec4\u961f"

    .line 181
    .line 182
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_4

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_4
    const-string v1, "\u6c42\u5927\u4f6c"

    .line 190
    .line 191
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-eqz v2, :cond_5

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_5
    const-string v1, "\u627e\u6218\u961f"

    .line 199
    .line 200
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-eqz v2, :cond_6

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_6
    const-string v1, "\u5176\u4ed6"

    .line 208
    .line 209
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_7

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_7
    const-string v1, ""

    .line 217
    .line 218
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_9

    .line 223
    .line 224
    iget-object v0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    :cond_8
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    if-eqz v2, :cond_9

    .line 235
    .line 236
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 241
    .line 242
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    invoke-static {v4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    if-eqz v4, :cond_8

    .line 251
    .line 252
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;

    .line 253
    .line 254
    .line 255
    goto :goto_2

    .line 256
    :cond_9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 257
    .line 258
    check-cast p0, Ll/pta0;

    .line 259
    .line 260
    invoke-virtual {p0}, Ll/pta0;->u()V

    .line 261
    .line 262
    .line 263
    :cond_a
    return-void
.end method

.method public y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pta0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pta0;->e()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "loop_input_type"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    iput-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/pta0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-static {}, Ll/xra;->f()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/nta0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/nta0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->F:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "from_card_guide_improve_profile"

    .line 60
    .line 61
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 68
    .line 69
    new-instance v1, Ll/jta0;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/jta0;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 78
    .line 79
    check-cast v0, Ll/pta0;

    .line 80
    .line 81
    iget-object v1, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/pta0;->p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast v0, Ll/pta0;

    .line 89
    .line 90
    iget-object v1, p0, Ll/nta0;->a:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ll/pta0;->n(Ljava/util/ArrayList;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 98
    .line 99
    if-ne v0, v1, :cond_3

    .line 100
    .line 101
    sget-object v0, Ll/nta0;->g:Ll/jxd0;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/lang/Boolean;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_3

    .line 114
    .line 115
    invoke-static {}, Ll/xra;->g()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    sget-object v0, Ll/nta0;->g:Ll/jxd0;

    .line 122
    .line 123
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-virtual {p0}, Ll/nta0;->A0()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_4

    .line 133
    .line 134
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 135
    .line 136
    check-cast v0, Ll/pta0;

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/pta0;->i()V

    .line 139
    .line 140
    .line 141
    :cond_4
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 142
    .line 143
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUALIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 144
    .line 145
    if-ne v0, v1, :cond_5

    .line 146
    .line 147
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 148
    .line 149
    check-cast v0, Ll/pta0;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/pta0;->u()V

    .line 152
    .line 153
    .line 154
    :cond_5
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 155
    .line 156
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_NAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 157
    .line 158
    if-eq v0, v1, :cond_6

    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_TOGETHER:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 161
    .line 162
    if-eq v0, v1, :cond_6

    .line 163
    .line 164
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GROWTH_FOOD:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 165
    .line 166
    if-ne v0, v1, :cond_7

    .line 167
    .line 168
    :cond_6
    const/4 v0, 0x1

    .line 169
    iput-boolean v0, p0, Ll/nta0;->d:Z

    .line 170
    .line 171
    :cond_7
    iget-boolean v0, p0, Ll/nta0;->d:Z

    .line 172
    .line 173
    if-eqz v0, :cond_8

    .line 174
    .line 175
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 176
    .line 177
    check-cast v0, Ll/pta0;

    .line 178
    .line 179
    invoke-virtual {v0}, Ll/pta0;->u()V

    .line 180
    .line 181
    .line 182
    :cond_8
    iget-object v0, p0, Ll/nta0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 183
    .line 184
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->PET:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 185
    .line 186
    if-ne v0, v1, :cond_9

    .line 187
    .line 188
    invoke-static {}, Ll/xra;->w()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_9

    .line 193
    .line 194
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 195
    .line 196
    move-object v1, v0

    .line 197
    check-cast v1, Ll/pta0;

    .line 198
    .line 199
    check-cast v0, Ll/pta0;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/pta0;->f()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v1, v0}, Ll/pta0;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 214
    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 218
    .line 219
    check-cast v0, Ll/pta0;

    .line 220
    .line 221
    iget-object v0, v0, Ll/pta0;->e:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;

    .line 222
    .line 223
    const/4 v1, 0x0

    .line 224
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    :goto_0
    invoke-virtual {p0}, Ll/nta0;->x0()V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nta0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopSelectInputFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->F:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "from_card_guide_improve_profile"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
