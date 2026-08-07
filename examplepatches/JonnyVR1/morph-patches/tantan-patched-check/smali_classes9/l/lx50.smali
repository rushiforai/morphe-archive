.class public Ll/lx50;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ll/cqj;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
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
    const-string v0, "default"

    .line 5
    .line 6
    iput-object v0, p0, Ll/lx50;->b:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/lx50;->d:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/cqj;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lx50;->c:Ll/cqj;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lx50;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lx50;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lx50;->f()Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/lx50;->f()Ll/coj;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 15
    .line 16
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lx50;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/coj;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lx50;->c:Ll/cqj;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/cqj;->g()Ll/coj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public g(Ljava/util/List;)Ll/lx50;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ll/lx50;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/lx50;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/cqj;)Ll/lx50;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lx50;->c:Ll/cqj;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Ll/lx50;
    .locals 0

    .line 1
    iput p1, p0, Ll/lx50;->a:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/lx50;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lx50;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
