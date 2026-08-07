.class public Ll/p8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p8l$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Ll/p8l$a;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p8l;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 10
    .line 11
    invoke-static {v0}, Ll/dal;->a(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;->home:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p8l;->c(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p8l;->d(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p8l;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->d()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/g6m;

    .line 22
    .line 23
    instance-of v1, v0, Ll/n4;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    check-cast v0, Ll/n4;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Ll/g6m;->b(Ll/e2m;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0, p1}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    return-object p0
.end method

.method public d(Ll/p8l$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
