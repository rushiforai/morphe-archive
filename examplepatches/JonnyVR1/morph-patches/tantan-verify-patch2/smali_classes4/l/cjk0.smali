.class public Ll/cjk0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cjk0$b;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Z

.field public d:Ll/x3f;

.field public e:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ll/c610;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ll/ioi0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/qyv;

.field public h:Ll/r4f;

.field public i:Ll/yul;

.field public j:Z

.field public k:Ll/j5m;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/x3f;Ljava/util/HashSet;Ll/qyv;ZZLl/r4f;Ll/yul;ZLl/j5m;Ll/foi0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/x3f;",
            "Ljava/util/HashSet<",
            "Ll/c610;",
            ">;",
            "Ll/qyv;",
            "ZZ",
            "Ll/r4f;",
            "Ll/yul;",
            "Z",
            "Ll/j5m;",
            "Ll/foi0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cjk0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cjk0;->d:Ll/x3f;

    .line 7
    .line 8
    iput-object p3, p0, Ll/cjk0;->e:Ljava/util/HashSet;

    .line 9
    .line 10
    iput-object p4, p0, Ll/cjk0;->g:Ll/qyv;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/cjk0;->b:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/cjk0;->c:Z

    .line 15
    .line 16
    iput-object p7, p0, Ll/cjk0;->h:Ll/r4f;

    .line 17
    .line 18
    iput-object p8, p0, Ll/cjk0;->i:Ll/yul;

    .line 19
    .line 20
    iput-boolean p9, p0, Ll/cjk0;->j:Z

    .line 21
    .line 22
    iput-object p10, p0, Ll/cjk0;->k:Ll/j5m;

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ll/x3f;Ljava/util/HashSet;Ll/qyv;ZZLl/r4f;Ll/yul;ZLl/j5m;Ll/foi0;Ll/cjk0$a;)V
    .locals 0

    .line 25
    invoke-direct/range {p0 .. p11}, Ll/cjk0;-><init>(Ljava/lang/String;Ll/x3f;Ljava/util/HashSet;Ll/qyv;ZZLl/r4f;Ll/yul;ZLl/j5m;Ll/foi0;)V

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/cjk0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/cjk0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()Ll/x3f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjk0;->d:Ll/x3f;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/r4f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjk0;->h:Ll/r4f;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjk0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/yul;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjk0;->i:Ll/yul;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/qyv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjk0;->g:Ll/qyv;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/c610;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cjk0;->e:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/c610;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/f0m;->getEventType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public i()Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ll/c610;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cjk0;->e:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ll/foi0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ll/ioi0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cjk0;->f:Ljava/util/HashSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashSet;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/cjk0;->f:Ljava/util/HashSet;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/cjk0;->f:Ljava/util/HashSet;

    .line 13
    .line 14
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cjk0;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "_v2"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
