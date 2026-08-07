.class public final Ll/x1d0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x1d0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/rnl;

.field public final b:Ljava/lang/String;

.field public final c:Ll/e0l;

.field public final d:Ll/z1d0;

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public volatile f:Ll/yx3;


# direct methods
.method public constructor <init>(Ll/x1d0$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/x1d0$a;->a:Ll/rnl;

    .line 5
    .line 6
    iput-object v0, p0, Ll/x1d0;->a:Ll/rnl;

    .line 7
    .line 8
    iget-object v0, p1, Ll/x1d0$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/x1d0;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Ll/x1d0$a;->c:Ll/e0l$a;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/e0l$a;->e()Ll/e0l;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/x1d0;->c:Ll/e0l;

    .line 19
    .line 20
    iget-object v0, p1, Ll/x1d0$a;->d:Ll/z1d0;

    .line 21
    .line 22
    iput-object v0, p0, Ll/x1d0;->d:Ll/z1d0;

    .line 23
    .line 24
    iget-object p1, p1, Ll/x1d0$a;->e:Ljava/util/Map;

    .line 25
    .line 26
    invoke-static {p1}, Ll/zlk0;->v(Ljava/util/Map;)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/x1d0;->e:Ljava/util/Map;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public a()Ll/z1d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->d:Ll/z1d0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/yx3;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x1d0;->f:Ll/yx3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/x1d0;->c:Ll/e0l;

    .line 7
    .line 8
    invoke-static {v0}, Ll/yx3;->k(Ll/e0l;)Ll/yx3;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/x1d0;->f:Ll/yx3;

    .line 13
    .line 14
    return-object v0
.end method

.method public c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->c:Ll/e0l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x1d0;->c:Ll/e0l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e0l;->n(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Ll/e0l;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->c:Ll/e0l;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->a:Ll/rnl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rnl;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/x1d0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x1d0$a;-><init>(Ll/x1d0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public i()Ljava/lang/Object;
    .locals 1

    .line 1
    const-class v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x1d0;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k()Ll/rnl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x1d0;->a:Ll/rnl;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Request{method="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/x1d0;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", url="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/x1d0;->a:Ll/rnl;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", tags="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/x1d0;->e:Ljava/util/Map;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x7d

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
