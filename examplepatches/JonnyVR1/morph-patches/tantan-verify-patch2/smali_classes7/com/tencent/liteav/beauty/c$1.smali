.class Lcom/tencent/liteav/beauty/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/beauty/c;->a(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:Lcom/tencent/liteav/beauty/c;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$1;->b:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/c$1;->a:F

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$1;->b:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$1;->b:Lcom/tencent/liteav/beauty/c;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget p0, p0, Lcom/tencent/liteav/beauty/c$1;->a:F

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/beauty/b/m;->a(F)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
