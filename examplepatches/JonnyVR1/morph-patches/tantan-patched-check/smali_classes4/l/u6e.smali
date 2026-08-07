.class public Ll/u6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y1m;


# instance fields
.field public a:Ll/fk90;

.field public b:Ll/msl;

.field public c:Ll/ksl;

.field public d:Z

.field public e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZLl/xul;Ljava/util/HashSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "ZZ",
            "Ll/xul;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Ll/u6e;->d:Z

    .line 5
    .line 6
    new-instance p3, Ll/p6e;

    .line 7
    .line 8
    invoke-direct {p3, p1, p2}, Ll/p6e;-><init>(Landroid/content/Context;Z)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p0, Ll/u6e;->c:Ll/ksl;

    .line 12
    .line 13
    new-instance p1, Ll/fk90;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/fk90;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/u6e;->a:Ll/fk90;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/fk90;->d(Ll/y1m;)V

    .line 21
    .line 22
    .line 23
    iput-object p5, p0, Ll/u6e;->e:Ljava/util/HashSet;

    .line 24
    .line 25
    new-instance p1, Ll/vnl;

    .line 26
    .line 27
    invoke-direct {p1, p0, p4}, Ll/vnl;-><init>(Ll/u6e;Ll/xul;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/u6e;->b:Ll/msl;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Ll/u6e;)Ljava/util/HashSet;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6e;->e:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/u6e;)Ll/msl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6e;->b:Ll/msl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/u6e;)Ll/ksl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6e;->c:Ll/ksl;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(Ll/z1m;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/u6e$c;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/u6e$c;-><init>(Ll/u6e;Ll/z1m;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/hoi0;->b(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-static {}, Ll/vml;->c()Ll/vml;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vml;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/u6e$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/u6e$a;-><init>(Ll/u6e;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/hoi0;->b(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public f(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u6e;->c:Ll/ksl;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/ksl;->a(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/DomainModel;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-boolean v2, p0, Ll/u6e;->d:Z

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantanapp/httpdns/model/DomainModel;->isExpire()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/u6e;->a:Ll/fk90;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/fk90;->e(Lcom/tantanapp/httpdns/model/DomainModel;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v0, "domain:"

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p1, " is Expire! use localDns!"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_0
    iget-object p0, p0, Ll/u6e;->c:Ll/ksl;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Ll/ksl;->d(Lcom/tantanapp/httpdns/model/DomainModel;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    return-object v1
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u6e;->c:Ll/ksl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/ksl;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/u6e;->a:Ll/fk90;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/fk90;->a()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/hoi0;->d()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final h(Lcom/tantanapp/httpdns/model/DomainModel;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6e;->a:Ll/fk90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fk90;->c(Lcom/tantanapp/httpdns/model/DomainModel;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(Ljava/lang/String;J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "domain:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " will update after "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "ms"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/u6e$b;

    .line 36
    .line 37
    invoke-direct {v1, p0, p1}, Ll/u6e$b;-><init>(Ll/u6e;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, p2, p3}, Ll/hoi0;->c(Ll/r2i0;J)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public j(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/httpdns/model/DomainModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/tantanapp/httpdns/model/DomainModel;

    .line 16
    .line 17
    iget-object v1, p0, Ll/u6e;->c:Ll/ksl;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Ll/ksl;->b(Lcom/tantanapp/httpdns/model/DomainModel;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 23
    .line 24
    iget v2, v0, Lcom/tantanapp/httpdns/model/DomainModel;->ttl:I

    .line 25
    .line 26
    int-to-double v2, v2

    .line 27
    const-wide v4, 0x3fe999999999999aL    # 0.8

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    mul-double/2addr v2, v4

    .line 33
    double-to-int v2, v2

    .line 34
    mul-int/lit16 v2, v2, 0x3e8

    .line 35
    .line 36
    int-to-long v2, v2

    .line 37
    invoke-virtual {p0, v1, v2, v3}, Ll/u6e;->i(Ljava/lang/String;J)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantanapp/httpdns/model/DomainModel;->isNeedProbe()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/u6e;->h(Lcom/tantanapp/httpdns/model/DomainModel;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method
