.class Lcom/tencent/liteav/d$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$1;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/d$1;->a:I

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
    iget-object v0, p0, Lcom/tencent/liteav/d$1;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/d$1;->b:Lcom/tencent/liteav/d;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v1, p0, Lcom/tencent/liteav/d$1;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d$1;->b:Lcom/tencent/liteav/d;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tencent/liteav/d;->b(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/d$1;->b:Lcom/tencent/liteav/d;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tencent/liteav/d;->b(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget p0, p0, Lcom/tencent/liteav/d$1;->a:I

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/videoencoder/b;->a(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
