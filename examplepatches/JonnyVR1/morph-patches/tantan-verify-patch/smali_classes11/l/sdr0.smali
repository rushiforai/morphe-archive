.class public final Ll/sdr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/efr0;

.field public b:Ll/efr0;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/efr0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/efr0;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/efr0;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/sdr0;->a:Ll/efr0;

    .line 15
    .line 16
    new-instance v0, Ll/efr0;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2, v3, v4}, Ll/efr0;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/sdr0;->b:Ll/efr0;

    .line 22
    .line 23
    new-instance v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/sdr0;->c:Ljava/util/List;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Ll/efr0;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Ll/sdr0;->a:Ll/efr0;

    .line 33
    invoke-virtual {p1}, Ll/efr0;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/efr0;

    iput-object p1, p0, Ll/sdr0;->b:Ll/efr0;

    .line 34
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll/sdr0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Ll/efr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sdr0;->a:Ll/efr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/String;JLjava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v3, p0, Ll/sdr0;->a:Ll/efr0;

    .line 27
    .line 28
    invoke-virtual {v3, v2}, Ll/efr0;->b(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-interface {p4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-static {v2, v3, v4}, Ll/efr0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p0, Ll/sdr0;->c:Ljava/util/List;

    .line 45
    .line 46
    new-instance p4, Ll/efr0;

    .line 47
    .line 48
    invoke-direct {p4, p1, p2, p3, v0}, Ll/efr0;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p0, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final c(Ll/efr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sdr0;->a:Ll/efr0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/efr0;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/efr0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/sdr0;->b:Ll/efr0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/sdr0;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic clone()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sdr0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sdr0;->a:Ll/efr0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/efr0;->clone()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/efr0;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/sdr0;-><init>(Ll/efr0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/sdr0;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/efr0;

    .line 31
    .line 32
    iget-object v2, v0, Ll/sdr0;->c:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/efr0;->clone()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ll/efr0;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-object v0
.end method

.method public final d()Ll/efr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sdr0;->b:Ll/efr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/efr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sdr0;->b:Ll/efr0;

    .line 2
    .line 3
    return-void
.end method

.method public final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/efr0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sdr0;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
