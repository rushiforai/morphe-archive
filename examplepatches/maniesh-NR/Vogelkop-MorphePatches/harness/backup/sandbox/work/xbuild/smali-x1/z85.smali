.class public abstract Lz85;
.super La08;
.source "SourceFile"


# instance fields
.field public a:Lg82;

.field public b:Ly85;

.field public c:Z

.field public d:J

.field public e:I

.field public f:Z


# virtual methods
.method public a()V
    .registers 3

    iget-boolean v0, p0, Lz85;->c:Z

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Lz85;->e()V

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lz85;->c:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lz85;->d:J

    return-void
.end method

.method public final c(I)V
    .registers 2

    iput p1, p0, Lz85;->e:I

    return-void
.end method

.method public d(Lg82;Llqm;Z)V
    .registers 5

    iget-object p2, p0, Lz85;->a:Lg82;

    if-eqz p2, :cond_15

    iget-boolean v0, p0, Lz85;->c:Z

    if-eqz v0, :cond_15

    iget-object p2, p2, Lg82;->a:Ljava/lang/String;

    iget-object v0, p1, Lg82;->a:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_15

    invoke-virtual {p0}, Lz85;->e()V

    :cond_15
    iput-object p1, p0, Lz85;->a:Lg82;

    const/4 p1, 0x0

    iput-object p1, p0, Lz85;->b:Ly85;

    iput-boolean p3, p0, Lz85;->f:Z

    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lz85;->a:Lg82;

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lz85;->c:Z

    if-eqz v0, :cond_28

    const/4 v0, 0x0

    iput-boolean v0, p0, Lz85;->c:Z

    iget-boolean v0, p0, Lz85;->f:Z

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    iput-object v0, p0, Lz85;->b:Ly85;

    return-void

    :cond_13
    new-instance v0, Ly85;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lz85;->d:J

    sub-long/2addr v1, v3

    iget v3, p0, Lz85;->e:I

    invoke-direct {v0, v1, v2, v3}, Ly85;-><init>(JI)V

    iput-object v0, p0, Lz85;->b:Ly85;

    iget-object v1, p0, Lz85;->a:Lg82;

    invoke-virtual {p0, v1, v0}, Lz85;->f(Lg82;Ly85;)V

    :cond_28
    return-void
.end method

.method public f(Lg82;Ly85;)V
    .registers 3

    return-void
.end method
