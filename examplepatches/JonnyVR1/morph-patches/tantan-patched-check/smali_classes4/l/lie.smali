.class public Ll/lie;
.super Ll/vj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vj2<",
        "Ll/mie;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Ll/kcg0;

.field public c:Ll/kcg0;

.field public d:Lcom/p1/mobile/putong/data/DbLinks;

.field public e:Lcom/p1/mobile/putong/data/DbLinks;

.field public f:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 6
    .line 7
    iput-object p1, p0, Ll/lie;->e:Lcom/p1/mobile/putong/data/DbLinks;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Ll/lie;->f:Z

    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/vj2;->a:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic D0(Ll/lie;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->P0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic E0(Ll/lie;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->L0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic F0(Ll/lie;Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->J0(Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G0(Ll/lie;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->N0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H0(Ll/lie;Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->O0(Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I0(Ll/lie;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lie;->Q0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public A0(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/lie;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 30
    .line 31
    iget-object v0, p0, Ll/vj2;->a:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 34
    .line 35
    const-string v2, ""

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/j;->r5(Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ll/fie;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/fie;-><init>(Ll/lie;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/gie;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/gie;-><init>(Ll/lie;)V

    .line 57
    .line 58
    .line 59
    new-instance v1, Ll/hie;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/hie;-><init>(Ll/lie;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Ll/lie;->b:Ll/kcg0;

    .line 73
    .line 74
    return-void
.end method

.method public C0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lie;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/lie;->f:Z

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Ll/lie;->A0(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic J0(Ll/pf60;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/vg60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 7
    .line 8
    iput-object v1, p0, Ll/lie;->e:Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    check-cast v0, Ll/vg60;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Ll/vj2;->o0(Ll/vg60;Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic L0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mie;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mie;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mie;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mie;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O0(Ll/pf60;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/vg60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 7
    .line 8
    iput-object v1, p0, Ll/lie;->d:Lcom/p1/mobile/putong/data/DbLinks;

    .line 9
    .line 10
    check-cast v0, Ll/vg60;

    .line 11
    .line 12
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Ll/vj2;->o0(Ll/vg60;Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic P0(Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/lie;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/mie;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/mie;->l(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/mie;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/mie;->k()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/lie;->f:Z

    .line 10
    .line 11
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/vj2;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lie;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 9
    .line 10
    iget-object v1, p0, Ll/vj2;->a:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Ll/lie;->e:Lcom/p1/mobile/putong/data/DbLinks;

    .line 13
    .line 14
    const-string v3, ""

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/api/j;->t5(Ljava/lang/String;Lcom/p1/mobile/putong/data/DbLinks;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/iie;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/iie;-><init>(Ll/lie;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/jie;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/jie;-><init>(Ll/lie;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/kie;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/kie;-><init>(Ll/lie;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Ll/lie;->c:Ll/kcg0;

    .line 52
    .line 53
    return-void
.end method
