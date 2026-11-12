.class public Lcom/leanplum/ActionArgs;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private args:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/internal/ActionArg<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public containsFile()Z
    .registers 3

    iget-object p0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/internal/ActionArg;

    const-string v1, "file"

    invoke-virtual {v0}, Lcom/leanplum/internal/ActionArg;->kind()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public getValue()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/leanplum/internal/ActionArg<",
            "*>;>;"
        }
    .end annotation

    iget-object p0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    return-object p0
.end method

.method public with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)",
            "Lcom/leanplum/ActionArgs;"
        }
    .end annotation

    if-nez p1, :cond_b

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "with - Invalid name parameter provided."

    invoke-static {p2, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_b
    iget-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/leanplum/internal/ActionArg;->argNamed(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/ActionArg;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;
    .registers 4

    if-nez p1, :cond_b

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "withAction - Invalid name parameter provided."

    invoke-static {p2, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_b
    iget-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/leanplum/internal/ActionArg;->actionArgNamed(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/internal/ActionArg;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withAsset(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;
    .registers 4

    if-nez p1, :cond_b

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "withAsset - Invalid name parameter provided."

    invoke-static {p2, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_b
    iget-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/leanplum/internal/ActionArg;->assetArgNamed(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/internal/ActionArg;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withColor(Ljava/lang/String;I)Lcom/leanplum/ActionArgs;
    .registers 4

    if-nez p1, :cond_b

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "withColor - Invalid name parameter provided."

    invoke-static {p2, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_b
    iget-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/leanplum/internal/ActionArg;->colorArgNamed(Ljava/lang/String;I)Lcom/leanplum/internal/ActionArg;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;
    .registers 4

    if-nez p1, :cond_b

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "withFile - Invalid name parameter provided."

    invoke-static {p2, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :cond_b
    iget-object v0, p0, Lcom/leanplum/ActionArgs;->args:Ljava/util/List;

    invoke-static {p1, p2}, Lcom/leanplum/internal/ActionArg;->fileArgNamed(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/internal/ActionArg;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method
