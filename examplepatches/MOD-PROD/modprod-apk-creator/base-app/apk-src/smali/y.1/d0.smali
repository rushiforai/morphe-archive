.class public Ly/d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ly/f0;


# instance fields
.field public final a:Ly/f0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    new-instance v0, Ly/W;

    invoke-direct {v0}, Ly/W;-><init>()V

    goto :goto_0

    :cond_0
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    new-instance v0, Ly/V;

    invoke-direct {v0}, Ly/V;-><init>()V

    goto :goto_0

    :cond_1
    new-instance v0, Ly/U;

    invoke-direct {v0}, Ly/U;-><init>()V

    :goto_0
    invoke-virtual {v0}, Ly/X;->b()Ly/f0;

    move-result-object v0

    iget-object v0, v0, Ly/f0;->a:Ly/d0;

    invoke-virtual {v0}, Ly/d0;->a()Ly/f0;

    move-result-object v0

    iget-object v0, v0, Ly/f0;->a:Ly/d0;

    invoke-virtual {v0}, Ly/d0;->b()Ly/f0;

    move-result-object v0

    iget-object v0, v0, Ly/f0;->a:Ly/d0;

    invoke-virtual {v0}, Ly/d0;->c()Ly/f0;

    move-result-object v0

    sput-object v0, Ly/d0;->b:Ly/f0;

    return-void
.end method

.method public constructor <init>(Ly/f0;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly/d0;->a:Ly/f0;

    return-void
.end method


# virtual methods
.method public a()Ly/f0;
    .locals 1

    iget-object v0, p0, Ly/d0;->a:Ly/f0;

    return-object v0
.end method

.method public b()Ly/f0;
    .locals 1

    iget-object v0, p0, Ly/d0;->a:Ly/f0;

    return-object v0
.end method

.method public c()Ly/f0;
    .locals 1

    iget-object v0, p0, Ly/d0;->a:Ly/f0;

    return-object v0
.end method

.method public d(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public e()Ly/j;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Ly/d0;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Ly/d0;

    invoke-virtual {p0}, Ly/d0;->n()Z

    move-result v1

    invoke-virtual {p1}, Ly/d0;->n()Z

    move-result v3

    if-ne v1, v3, :cond_2

    invoke-virtual {p0}, Ly/d0;->m()Z

    move-result v1

    invoke-virtual {p1}, Ly/d0;->m()Z

    move-result v3

    if-ne v1, v3, :cond_2

    invoke-virtual {p0}, Ly/d0;->j()Lr/c;

    move-result-object v1

    invoke-virtual {p1}, Ly/d0;->j()Lr/c;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Ly/d0;->h()Lr/c;

    move-result-object v1

    invoke-virtual {p1}, Ly/d0;->h()Lr/c;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Ly/d0;->e()Ly/j;

    move-result-object v1

    invoke-virtual {p1}, Ly/d0;->e()Ly/j;

    move-result-object p1

    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public f(I)Lr/c;
    .locals 0

    sget-object p1, Lr/c;->e:Lr/c;

    return-object p1
.end method

.method public g()Lr/c;
    .locals 1

    invoke-virtual {p0}, Ly/d0;->j()Lr/c;

    move-result-object v0

    return-object v0
.end method

.method public h()Lr/c;
    .locals 1

    sget-object v0, Lr/c;->e:Lr/c;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    invoke-virtual {p0}, Ly/d0;->n()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0}, Ly/d0;->m()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0}, Ly/d0;->j()Lr/c;

    move-result-object v2

    invoke-virtual {p0}, Ly/d0;->h()Lr/c;

    move-result-object v3

    invoke-virtual {p0}, Ly/d0;->e()Ly/j;

    move-result-object v4

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public i()Lr/c;
    .locals 1

    invoke-virtual {p0}, Ly/d0;->j()Lr/c;

    move-result-object v0

    return-object v0
.end method

.method public j()Lr/c;
    .locals 1

    sget-object v0, Lr/c;->e:Lr/c;

    return-object v0
.end method

.method public k()Lr/c;
    .locals 1

    invoke-virtual {p0}, Ly/d0;->j()Lr/c;

    move-result-object v0

    return-object v0
.end method

.method public l(IIII)Ly/f0;
    .locals 0

    sget-object p1, Ly/d0;->b:Ly/f0;

    return-object p1
.end method

.method public m()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public n()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public o([Lr/c;)V
    .locals 0

    return-void
.end method

.method public p(Ly/f0;)V
    .locals 0

    return-void
.end method

.method public q(Lr/c;)V
    .locals 0

    return-void
.end method
