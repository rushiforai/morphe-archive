.class Lcom/tencent/iliveroom/a/a$24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->stopAllEffect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->E(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 31
    .line 32
    new-instance v2, Lcom/tencent/iliveroom/a/a$24$1;

    .line 33
    .line 34
    invoke-direct {v2, p0, v0}, Lcom/tencent/iliveroom/a/a$24$1;-><init>(Lcom/tencent/iliveroom/a/a$24;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$24;->a:Lcom/tencent/iliveroom/a/a;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 43
    .line 44
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
