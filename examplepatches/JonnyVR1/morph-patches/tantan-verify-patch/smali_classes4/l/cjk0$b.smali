.class public final Ll/cjk0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cjk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Ll/x3f;

.field public e:Ll/qyv;

.field public f:Z

.field public g:Ll/j5m;

.field public h:Ll/r4f;

.field public i:Ll/yul;

.field public j:Z

.field public k:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ll/c610;",
            ">;"
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
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cjk0$b;->k:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/cjk0;
    .locals 13

    .line 1
    new-instance v0, Ll/cjk0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cjk0$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cjk0$b;->d:Ll/x3f;

    .line 6
    .line 7
    iget-object v3, p0, Ll/cjk0$b;->k:Ljava/util/HashSet;

    .line 8
    .line 9
    iget-object v4, p0, Ll/cjk0$b;->e:Ll/qyv;

    .line 10
    .line 11
    iget-boolean v5, p0, Ll/cjk0$b;->c:Z

    .line 12
    .line 13
    iget-boolean v6, p0, Ll/cjk0$b;->j:Z

    .line 14
    .line 15
    iget-object v7, p0, Ll/cjk0$b;->h:Ll/r4f;

    .line 16
    .line 17
    iget-object v8, p0, Ll/cjk0$b;->i:Ll/yul;

    .line 18
    .line 19
    iget-boolean v9, p0, Ll/cjk0$b;->f:Z

    .line 20
    .line 21
    iget-object v10, p0, Ll/cjk0$b;->g:Ll/j5m;

    .line 22
    .line 23
    const/4 v11, 0x0

    .line 24
    const/4 v12, 0x0

    .line 25
    invoke-direct/range {v0 .. v12}, Ll/cjk0;-><init>(Ljava/lang/String;Ll/x3f;Ljava/util/HashSet;Ll/qyv;ZZLl/r4f;Ll/yul;ZLl/j5m;Ll/foi0;Ll/cjk0$a;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public b(Z)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cjk0$b;->j:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cjk0$b;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cjk0$b;->f:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/r4f;)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->h:Ll/r4f;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/yul;)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->i:Ll/yul;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cjk0$b;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/x3f;)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->d:Ll/x3f;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ll/qyv;)Ll/cjk0$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->e:Ll/qyv;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ll/c610;)Ll/cjk0$b;
    .locals 5

    .line 1
    invoke-interface {p1}, Ll/f0m;->getEventType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p1}, Ll/f0m;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/cjk0$b;->k:Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_2

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Ll/c610;

    .line 26
    .line 27
    invoke-interface {v3}, Ll/f0m;->getEventType()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-interface {v3}, Ll/f0m;->a()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 49
    .line 50
    const-string p1, "monitor with tag %s is already exist"

    .line 51
    .line 52
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_2
    iget-object v0, p0, Ll/cjk0$b;->k:Ljava/util/HashSet;

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-object p0
.end method

.method public l(Ll/j5m;)Ll/cjk0$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/j5m<",
            "TT;>;)",
            "Ll/cjk0$b;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cjk0$b;->g:Ll/j5m;

    .line 2
    .line 3
    return-object p0
.end method
