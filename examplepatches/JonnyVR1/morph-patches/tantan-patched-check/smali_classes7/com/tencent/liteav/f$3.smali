.class Lcom/tencent/liteav/f$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/f;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/f;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/f$3;->a:Lcom/tencent/liteav/f;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/f$3;->a:Lcom/tencent/liteav/f;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/f;->c(Lcom/tencent/liteav/f;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/f$3;->a:Lcom/tencent/liteav/f;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tencent/liteav/f;->d(Lcom/tencent/liteav/f;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
