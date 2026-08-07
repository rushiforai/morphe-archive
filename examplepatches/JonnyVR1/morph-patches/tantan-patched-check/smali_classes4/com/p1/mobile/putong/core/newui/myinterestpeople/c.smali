.class public Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;


# direct methods
.method public constructor <init>()V
    .locals 2

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->c(Ll/g6m;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;->swipe:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue$StrategyType;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;->c(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

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
    check-cast p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;->d(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/c;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/DialogStrategyQueue;

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
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->p(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/b;->m(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/newui/myinterestpeople/c$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method
