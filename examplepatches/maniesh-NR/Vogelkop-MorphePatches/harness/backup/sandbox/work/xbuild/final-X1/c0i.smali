.class public final Lc0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Lhpf;


# instance fields
.field public final a:Lltl;

.field public final b:Lxb;

.field public final c:Lslk;

.field public final d:Lb0i;

.field public final e:Lode;

.field public f:Lig;


# direct methods
.method public constructor <init>(Lltl;Lxb;Lslk;Lb0i;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc0i;->e:Lode;

    iput-object p1, p0, Lc0i;->a:Lltl;

    iput-object p2, p0, Lc0i;->b:Lxb;

    iput-object p3, p0, Lc0i;->c:Lslk;

    iput-object p4, p0, Lc0i;->d:Lb0i;

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 4

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v0, p0, Lc0i;->e:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, p0, Lc0i;->a:Lltl;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    new-instance p1, Lig;

    new-instance v0, Lpjg;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1}, Lig;-><init>()V

    iput-object v0, p1, Lig;->b:Ljava/lang/Object;

    iput-object p1, p0, Lc0i;->f:Lig;

    iget-object p0, p0, Lc0i;->c:Lslk;

    invoke-virtual {p0, p1}, Lslk;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a()V
    .registers 2

    iget-object v0, p0, Lc0i;->b:Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    invoke-virtual {v0, p0}, Ldpf;->a(Lhpf;)V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    iget-object p0, p0, Lc0i;->d:Lb0i;

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Lb0i;->J(I)V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    iget-object p0, p0, Lc0i;->d:Lb0i;

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Lb0i;->J(I)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    iget-object p1, p0, Lc0i;->a:Lltl;

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lc0i;->f:Lig;

    if-eqz p1, :cond_10

    const/4 v0, 0x0

    iput-object v0, p1, Lig;->b:Ljava/lang/Object;

    :cond_10
    iget-object p0, p0, Lc0i;->e:Lode;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 2

    iget-object p0, p0, Lc0i;->d:Lb0i;

    invoke-interface {p0}, Lb0i;->q()V

    return-void
.end method
