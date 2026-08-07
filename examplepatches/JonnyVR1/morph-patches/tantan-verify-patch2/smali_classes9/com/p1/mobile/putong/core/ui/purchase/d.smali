.class public Lcom/p1/mobile/putong/core/ui/purchase/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/d$a;,
        Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->b:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->g:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->h:Z

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->i:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "unknown"

    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->j:Ljava/lang/String;

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->k:Z

    .line 23
    .line 24
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p1, "initAutoRenew:"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->p(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->e()V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method


# virtual methods
.method public b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    const-string v0, "both"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->x(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    const-string v0, "none"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->x(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-string v0, "auto"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->x(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const-string v0, "empty"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->x(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->e:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final k(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "oDiamond"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

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

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public n()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 6
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->k(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

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

.method public o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->d:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->c:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
