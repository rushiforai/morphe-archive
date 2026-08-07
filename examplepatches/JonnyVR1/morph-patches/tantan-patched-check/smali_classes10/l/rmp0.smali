.class public Ll/rmp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tam;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/tam;

.field public b:Ll/smp0;

.field public c:Ll/dem0;

.field public d:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/rmp0;->d:Z

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/rmp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rmp0;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/rmp0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rmp0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/rmp0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rmp0;->n()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/rmp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rmp0;->p()V

    return-void
.end method

.method public static synthetic e(Ll/rmp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rmp0;->u()V

    return-void
.end method

.method public static synthetic f(Ll/rmp0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rmp0;->s()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/tam;->y1(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/tam;->y1(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic u()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-string v1, "slide"

    .line 5
    .line 6
    invoke-interface {p0, v0, v0, v1}, Ll/tam;->K1(ZZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dem0;->d()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/smp0;->d()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public i(Ll/tam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tam;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rmp0;->i(Ll/tam;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dem0;->e()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/smp0;->e()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public k()Ll/uam;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dem0;->f()Ll/uam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/smp0;->f()Ll/uam;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dem0;->h()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/smp0;->i()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_2
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic n()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/tam;->v0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const-string v1, "slide"

    .line 5
    .line 6
    invoke-interface {p0, v0, v0, v1}, Ll/tam;->K1(ZZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic s()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/tam;->v0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public v()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/rmp0;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/dem0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/dem0;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/rmp0;->c:Ll/dem0;

    .line 17
    .line 18
    new-instance v1, Ll/lmp0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/lmp0;-><init>(Ll/rmp0;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/mmp0;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/mmp0;-><init>(Ll/rmp0;)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ll/nmp0;

    .line 29
    .line 30
    invoke-direct {v3, p0}, Ll/nmp0;-><init>(Ll/rmp0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1, v2, v3}, Ll/dem0;->i(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_1
    iget-object v0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 39
    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    new-instance v0, Ll/smp0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/smp0;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Ll/rmp0;->b:Ll/smp0;

    .line 50
    .line 51
    new-instance v1, Ll/omp0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/omp0;-><init>(Ll/rmp0;)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ll/pmp0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/pmp0;-><init>(Ll/rmp0;)V

    .line 59
    .line 60
    .line 61
    new-instance v3, Ll/qmp0;

    .line 62
    .line 63
    invoke-direct {v3, p0}, Ll/qmp0;-><init>(Ll/rmp0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1, v2, v3}, Ll/smp0;->j(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method
