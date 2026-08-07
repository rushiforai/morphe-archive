.class Lcom/tencent/liteav/d$21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

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
    iget-object v0, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/liteav/d;->e(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/k;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, v1}, Lcom/tencent/liteav/k;->b(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v1, v1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 26
    .line 27
    iget-object v2, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget v2, v2, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;II)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/d$21;->a:Lcom/tencent/liteav/d;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tencent/liteav/d;->i(Lcom/tencent/liteav/d;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/d;->a(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
