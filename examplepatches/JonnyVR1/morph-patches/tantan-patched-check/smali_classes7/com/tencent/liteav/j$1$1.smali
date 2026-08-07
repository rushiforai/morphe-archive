.class Lcom/tencent/liteav/j$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/j$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/tencent/liteav/j$1;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/j$1;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/j$1$1;->b:Lcom/tencent/liteav/j$1;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/liteav/j$1$1;->a:J

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
    iget-object v0, p0, Lcom/tencent/liteav/j$1$1;->b:Lcom/tencent/liteav/j$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/j$1;->d:Lcom/tencent/liteav/j$a;

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/tencent/liteav/j$1$1;->a:J

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/j$a;->a(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
