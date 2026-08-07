.class Lcom/tencent/iliveroom/a/a$22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->stopEffectWithId(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->m(Lcom/tencent/iliveroom/a/a;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v1, p0, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 26
    .line 27
    iget v1, p0, Lcom/tencent/iliveroom/a/a$22;->a:I

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$22;->b:Lcom/tencent/iliveroom/a/a;

    .line 40
    .line 41
    new-instance v1, Lcom/tencent/iliveroom/a/a$22$1;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Lcom/tencent/iliveroom/a/a$22$1;-><init>(Lcom/tencent/iliveroom/a/a$22;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
