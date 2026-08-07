.class Ll/nqk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nqk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K::",
        "Ll/dj80;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Ll/nqk$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nqk$a<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;",
            "Ll/nqk$a<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nqk$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nqk$a;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 17
    .line 18
    return-void
.end method

.method private b(Ll/nqk$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nqk$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/nqk;->e(Ll/nqk$a;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 5
    .line 6
    iput-object p0, p1, Ll/nqk$a;->d:Ll/nqk$a;

    .line 7
    .line 8
    iget-object p0, p0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 9
    .line 10
    iput-object p0, p1, Ll/nqk$a;->c:Ll/nqk$a;

    .line 11
    .line 12
    invoke-static {p1}, Ll/nqk;->g(Ll/nqk$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private c(Ll/nqk$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nqk$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/nqk;->e(Ll/nqk$a;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 5
    .line 6
    iget-object v0, p0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 7
    .line 8
    iput-object v0, p1, Ll/nqk$a;->d:Ll/nqk$a;

    .line 9
    .line 10
    iput-object p0, p1, Ll/nqk$a;->c:Ll/nqk$a;

    .line 11
    .line 12
    invoke-static {p1}, Ll/nqk;->g(Ll/nqk$a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static e(Ll/nqk$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/nqk$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 4
    .line 5
    iput-object v1, v0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 6
    .line 7
    iget-object p0, p0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 8
    .line 9
    iput-object v0, p0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 10
    .line 11
    return-void
.end method

.method private static g(Ll/nqk$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/nqk$a<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 2
    .line 3
    iput-object p0, v0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 4
    .line 5
    iget-object v0, p0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 6
    .line 7
    iput-object p0, v0, Ll/nqk$a;->c:Ll/nqk$a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/dj80;)Ljava/lang/Object;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/nqk$a;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/nqk$a;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/nqk$a;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p1}, Ll/dj80;->a()V

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-direct {p0, v0}, Ll/nqk;->b(Ll/nqk$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/nqk$a;->b()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public d(Ll/dj80;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/nqk$a;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/nqk$a;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/nqk$a;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, v0}, Ll/nqk;->c(Ll/nqk$a;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {p1}, Ll/dj80;->a()V

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {v0, p2}, Ll/nqk$a;->a(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public f()Ljava/lang/Object;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 4
    .line 5
    :goto_0
    iget-object v1, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/nqk$a;->b()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    invoke-static {v0}, Ll/nqk;->e(Ll/nqk$a;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/nqk;->b:Ljava/util/Map;

    .line 24
    .line 25
    iget-object v2, v0, Ll/nqk$a;->a:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    iget-object v1, v0, Ll/nqk$a;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Ll/dj80;

    .line 33
    .line 34
    invoke-interface {v1}, Ll/dj80;->a()V

    .line 35
    .line 36
    .line 37
    iget-object v0, v0, Ll/nqk$a;->d:Ll/nqk$a;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GroupedLinkedMap( "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 9
    .line 10
    iget-object v1, v1, Ll/nqk$a;->c:Ll/nqk$a;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    iget-object v3, p0, Ll/nqk;->a:Ll/nqk$a;

    .line 14
    .line 15
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    const/16 v2, 0x7b

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, v1, Ll/nqk$a;->a:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/16 v2, 0x3a

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ll/nqk$a;->c()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, "}, "

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, v1, Ll/nqk$a;->c:Ll/nqk$a;

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    if-eqz v2, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    add-int/lit8 p0, p0, -0x2

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, p0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    :cond_1
    const-string p0, " )"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method
