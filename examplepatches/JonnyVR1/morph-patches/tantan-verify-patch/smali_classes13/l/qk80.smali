.class public Ll/qk80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/qk80;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ll/e3m;

.field public c:I

.field public d:J

.field public e:Ll/d3m;

.field public f:Ll/l4g0;

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/e3m;Ll/d3m;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x7530

    .line 5
    .line 6
    iput v0, p0, Ll/qk80;->c:I

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Ll/qk80;->d:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/qk80;->g:Z

    .line 14
    .line 15
    iput-object p1, p0, Ll/qk80;->a:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p2, p0, Ll/qk80;->b:Ll/e3m;

    .line 18
    .line 19
    iput-object p3, p0, Ll/qk80;->e:Ll/d3m;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->e:Ll/d3m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/d3m;->n(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->e:Ll/d3m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/d3m;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/qk80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qk80;->f(Ll/qk80;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f(Ll/qk80;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qk80;->h()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/qk80;->h()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public g()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/qk80;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/qk80;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->b:Ll/e3m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/e3m;->getPopLifeName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/vk80;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qk80;->b:Ll/e3m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/e3m;->popLifeObs()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n()Ll/d3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->e:Ll/d3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qk80;->e:Ll/d3m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/d3m;->f(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qk80;->f:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/qk80;->g:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qk80;->f:Ll/l4g0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qk80;->f:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/qk80;->g:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/l4g0;

    .line 10
    .line 11
    new-instance v1, Ll/qk80$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/qk80$a;-><init>(Ll/qk80;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-class p1, Ll/qk80;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {v0, v1, p1}, Ll/l4g0;-><init>(Ll/ur2;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/qk80;->f:Ll/l4g0;

    .line 26
    .line 27
    const-string p1, "popup_id"

    .line 28
    .line 29
    iget-object v1, p0, Ll/qk80;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Ll/qk80;->h()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "popup_priority"

    .line 44
    .line 45
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {p1, v1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/qk80;->f:Ll/l4g0;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/l4g0;->c()V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/qk80;->f:Ll/l4g0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qk80;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public s(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qk80;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public t(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/qk80;->d:J

    .line 2
    .line 3
    return-void
.end method
