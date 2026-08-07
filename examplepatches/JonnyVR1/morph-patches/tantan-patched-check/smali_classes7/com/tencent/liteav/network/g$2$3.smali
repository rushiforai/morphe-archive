.class Lcom/tencent/liteav/network/g$2$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/g$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Vector;

.field final synthetic b:Lcom/tencent/liteav/network/g$2;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/g$2;Ljava/util/Vector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/g$2$3;->b:Lcom/tencent/liteav/network/g$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/network/g$2$3;->a:Ljava/util/Vector;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/network/g$2$3;->b:Lcom/tencent/liteav/network/g$2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/network/g$2;->f:Lcom/tencent/liteav/network/g$a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "Success"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/network/g$2$3;->a:Ljava/util/Vector;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {v0, v2, v1, p0}, Lcom/tencent/liteav/network/g$a;->a(ILjava/lang/String;Ljava/util/Vector;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
