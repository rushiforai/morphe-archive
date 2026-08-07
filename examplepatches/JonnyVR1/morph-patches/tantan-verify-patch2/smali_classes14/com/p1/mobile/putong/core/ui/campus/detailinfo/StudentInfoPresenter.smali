.class public Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;,
        Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;",
        ">;"
    }
.end annotation


# static fields
.field public static final g:Ll/vxd0;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

.field public c:Lcom/p1/mobile/putong/data/StudentVerification;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/StudentVerification;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/vxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "back_count_from_dia"

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
    const/4 v2, 0x0

    .line 26
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->g:Ll/vxd0;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/StudentVerification;->new_()Lcom/p1/mobile/putong/data/StudentVerification;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->e:Z

    .line 22
    .line 23
    new-instance p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 29
    .line 30
    return-void
.end method

.method private synthetic E0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/StudentVerification;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->J0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->E0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->H0(Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Ll/pf60;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->G0(Ll/pf60;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->F0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->L0(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->I0()Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StudentVerRejectedReason;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 2
    .line 3
    const-string v1, "school"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StudentVerRejectedReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerRejectedReason;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->a:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 16
    .line 17
    const-string v1, "startTime"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StudentVerRejectedReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerRejectedReason;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->b:Z

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 30
    .line 31
    const-string v1, "pictures.1"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/StudentVerRejectedReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerRejectedReason;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->c:Z

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 44
    .line 45
    const-string v0, "pictures.2"

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerRejectedReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerRejectedReason;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->d:Z

    .line 56
    .line 57
    return-void
.end method

.method public final C0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->G()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 16
    .line 17
    const-string v0, "preVerified"

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method

.method public D0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    const-string v1, "rejected"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->G()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/StudentVerification;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic G0(Ll/pf60;)Landroid/util/Pair;
    .locals 3

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    check-cast v2, Lcom/p1/mobile/putong/data/StudentVerification;

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/data/StudentVerification;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->x0(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-direct {v0, v2, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final synthetic H0(Ll/pf60;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/r9g0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/r9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic I0()Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->i0:Lcom/p1/mobile/putong/core/api/d;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/d;->S:Lcom/p1/mobile/putong/core/api/d$a;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/n9g0;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/n9g0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/o9g0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/o9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final synthetic J0(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    const-string v1, "verified"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget v0, Lcom/p1/mobile/putong/core/R$string;->um:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 48
    .line 49
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->A(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerification;)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->e:Z

    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final synthetic L0(ZLl/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/StudentVerification;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 11
    .line 12
    const-string v0, "default"

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 42
    .line 43
    iput-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 44
    .line 45
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_4

    .line 52
    .line 53
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 61
    .line 62
    iput-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 63
    .line 64
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 73
    .line 74
    iput-object p0, p2, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 75
    .line 76
    :cond_5
    const/4 p0, 0x0

    .line 77
    iput-object p0, p2, Lcom/p1/mobile/putong/data/StudentVerification;->endTime:Ljava/lang/String;

    .line 78
    .line 79
    return-void
.end method

.method public P0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 9
    .line 10
    sget-object v2, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget p1, Lcom/p1/mobile/putong/core/R$string;->K0:I

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 70
    .line 71
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->c:Z

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/sim;

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-direct {v0, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 92
    .line 93
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 94
    .line 95
    iget-object v0, v0, Ll/sim;->d:[I

    .line 96
    .line 97
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 98
    .line 99
    .line 100
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 105
    .line 106
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->BACK:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 111
    .line 112
    if-ne v1, v2, :cond_3

    .line 113
    .line 114
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_2

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_2

    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 137
    .line 138
    iget-object v2, v2, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 145
    .line 146
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_2

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    sget p1, Lcom/p1/mobile/putong/core/R$string;->K0:I

    .line 159
    .line 160
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 169
    .line 170
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->d:Z

    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 175
    .line 176
    invoke-interface {v0, v3, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    new-instance v0, Ll/sim;

    .line 180
    .line 181
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-direct {v0, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 191
    .line 192
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 193
    .line 194
    iget-object v0, v0, Ll/sim;->d:[I

    .line 195
    .line 196
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 197
    .line 198
    .line 199
    iput-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 204
    .line 205
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    return-void
.end method

.method public Q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public R0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-interface {p0, v0, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public S0(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "raw"

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 19
    .line 20
    new-instance p1, Ll/sim;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p1, v1}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    iget-object p1, p1, Ll/sim;->d:[I

    .line 34
    .line 35
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 36
    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-ne p1, v1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 48
    .line 49
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->c:Z

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p1, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->BACK:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 67
    .line 68
    if-ne p1, v1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 71
    .line 72
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->d:Z

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 77
    .line 78
    const/4 v1, 0x1

    .line 79
    invoke-interface {p1, v1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public U0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->b0(Lcom/p1/mobile/putong/data/Media;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-le v0, v2, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    .line 37
    .line 38
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->Z(Lcom/p1/mobile/putong/data/Media;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p0, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public V0()V
    .locals 4

    .line 1
    const-string v0, "e_student_verification_done"

    .line 2
    .line 3
    const-string v1, "p_student_verification_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->C0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    new-instance v3, Lcom/p1/mobile/putong/data/Verification;

    .line 35
    .line 36
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Verification;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 46
    .line 47
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 48
    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->i0:Lcom/p1/mobile/putong/core/api/d;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/d;->n3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/p9g0;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0}, Ll/p9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;Z)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/q9g0;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/q9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/i9g0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/j9g0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/j9g0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/k9g0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/k9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/l9g0;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/l9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/m9g0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/m9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public o0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 10
    .line 11
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->c:Z

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, v3, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->BACK:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 23
    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 27
    .line 28
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->d:Z

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public p0(Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string v0, "selected_school"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/School;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->a:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, v1, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "highConfidenceError"

    .line 33
    .line 34
    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 41
    .line 42
    const-string v0, "prePending"

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p1, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public q0()V
    .locals 1

    .line 1
    const-string v0, "Chanel1.SchoolIdentifyPage.Shown"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->g:Ll/vxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->d:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    return-object p0
.end method

.method public t0()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 11
    .line 12
    return-object p0
.end method

.method public u0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final x0(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/p1/mobile/putong/core/data/School;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public y0()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    return v0

    .line 30
    :cond_0
    return v1
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->c:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
