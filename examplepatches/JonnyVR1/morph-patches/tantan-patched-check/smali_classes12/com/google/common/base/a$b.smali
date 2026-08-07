.class public final Lcom/google/common/base/a$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/base/a$b$a;,
        Lcom/google/common/base/a$b$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/google/common/base/a$b$b;

.field public c:Lcom/google/common/base/a$b$b;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/common/base/a$b$b;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/google/common/base/a$b$b;-><init>(Lcom/google/common/base/a$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/common/base/a$b;->b:Lcom/google/common/base/a$b$b;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/common/base/a$b;->c:Lcom/google/common/base/a$b$b;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/google/common/base/a$b;->d:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/google/common/base/a$b;->e:Z

    .line 18
    .line 19
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/google/common/base/a$b;->a:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/common/base/a$a;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/google/common/base/a$b;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static k(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p0, Ljava/lang/CharSequence;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    return v1

    .line 17
    :cond_1
    instance-of v0, p0, Ljava/util/Collection;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    check-cast p0, Ljava/util/Collection;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_2
    instance-of v0, p0, Ljava/util/Map;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    check-cast p0, Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_3
    instance-of v0, p0, Lcom/google/common/base/Optional;

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    check-cast p0, Lcom/google/common/base/Optional;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    xor-int/2addr p0, v2

    .line 50
    return p0

    .line 51
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_5

    .line 66
    .line 67
    return v2

    .line 68
    :cond_5
    return v1
.end method


# virtual methods
.method public a(Ljava/lang/String;D)Lcom/google/common/base/a$b;
    .locals 0

    .line 1
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/google/common/base/a$b;->i(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Ljava/lang/String;I)Lcom/google/common/base/a$b;
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/google/common/base/a$b;->i(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ljava/lang/String;J)Lcom/google/common/base/a$b;
    .locals 0

    .line 1
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/google/common/base/a$b;->i(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/common/base/a$b;->g(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e()Lcom/google/common/base/a$b$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/base/a$b$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/common/base/a$b$b;-><init>(Lcom/google/common/base/a$a;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/common/base/a$b;->c:Lcom/google/common/base/a$b$b;

    .line 8
    .line 9
    iput-object v0, v1, Lcom/google/common/base/a$b$b;->c:Lcom/google/common/base/a$b$b;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/common/base/a$b;->c:Lcom/google/common/base/a$b$b;

    .line 12
    .line 13
    return-object v0
.end method

.method public final f(Ljava/lang/Object;)Lcom/google/common/base/a$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/a$b;->e()Lcom/google/common/base/a$b$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/google/common/base/a$b$b;->b:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method

.method public final g(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/a$b;->e()Lcom/google/common/base/a$b$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p2, v0, Lcom/google/common/base/a$b$b;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/google/common/base/a$b$b;->a:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public final h()Lcom/google/common/base/a$b$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/base/a$b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/common/base/a$b$a;-><init>(Lcom/google/common/base/a$a;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/google/common/base/a$b;->c:Lcom/google/common/base/a$b$b;

    .line 8
    .line 9
    iput-object v0, v1, Lcom/google/common/base/a$b$b;->c:Lcom/google/common/base/a$b$b;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/common/base/a$b;->c:Lcom/google/common/base/a$b$b;

    .line 12
    .line 13
    return-object v0
.end method

.method public final i(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/a$b;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/a$b;->h()Lcom/google/common/base/a$b$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p2, v0, Lcom/google/common/base/a$b$b;->b:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/google/common/base/a$b$b;->a:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public j(Ljava/lang/Object;)Lcom/google/common/base/a$b;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/common/base/a$b;->f(Ljava/lang/Object;)Lcom/google/common/base/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/google/common/base/a$b;->d:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/google/common/base/a$b;->e:Z

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const/16 v3, 0x20

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/google/common/base/a$b;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const/16 v3, 0x7b

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/google/common/base/a$b;->b:Lcom/google/common/base/a$b$b;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/google/common/base/a$b$b;->c:Lcom/google/common/base/a$b$b;

    .line 25
    .line 26
    const-string v3, ""

    .line 27
    .line 28
    :goto_0
    if-eqz p0, :cond_5

    .line 29
    .line 30
    iget-object v4, p0, Lcom/google/common/base/a$b$b;->b:Ljava/lang/Object;

    .line 31
    .line 32
    instance-of v5, p0, Lcom/google/common/base/a$b$a;

    .line 33
    .line 34
    if-nez v5, :cond_1

    .line 35
    .line 36
    if-nez v4, :cond_0

    .line 37
    .line 38
    if-nez v0, :cond_4

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-static {v4}, Lcom/google/common/base/a$b;->k(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-nez v5, :cond_4

    .line 48
    .line 49
    :cond_1
    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Lcom/google/common/base/a$b$b;->a:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const/16 v3, 0x3d

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :cond_2
    if-eqz v4, :cond_3

    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Ljava/lang/Class;->isArray()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_3

    .line 75
    .line 76
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {v3}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    const/4 v5, 0x1

    .line 89
    sub-int/2addr v4, v5

    .line 90
    invoke-virtual {v2, v3, v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    :goto_2
    const-string v3, ", "

    .line 98
    .line 99
    :cond_4
    iget-object p0, p0, Lcom/google/common/base/a$b$b;->c:Lcom/google/common/base/a$b$b;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    const/16 p0, 0x7d

    .line 103
    .line 104
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method
