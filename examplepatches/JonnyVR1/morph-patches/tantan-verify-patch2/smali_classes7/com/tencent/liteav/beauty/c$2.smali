.class Lcom/tencent/liteav/beauty/c$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->d(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$2;->b:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/c$2;->a:I

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
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$2;->b:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->f(Lcom/tencent/liteav/beauty/c;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Lcom/tencent/liteav/beauty/c$2;->b:Lcom/tencent/liteav/beauty/c;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/tencent/liteav/beauty/c;->g(Lcom/tencent/liteav/beauty/c;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    iget p0, p0, Lcom/tencent/liteav/beauty/c$2;->a:I

    .line 14
    .line 15
    invoke-static {v0, v1, v2, p0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;III)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
