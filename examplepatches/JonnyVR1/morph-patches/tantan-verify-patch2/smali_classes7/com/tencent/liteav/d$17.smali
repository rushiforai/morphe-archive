.class Lcom/tencent/liteav/d$17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->m(I)V
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
    iput-object p1, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/d$17;->a:I

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
    iget-object v0, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 8
    .line 9
    iget v1, p0, Lcom/tencent/liteav/d$17;->a:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v1, p0, Lcom/tencent/liteav/d$17;->a:I

    .line 21
    .line 22
    iput v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v1, p0, Lcom/tencent/liteav/d$17;->a:I

    .line 31
    .line 32
    iput v1, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encoderMode:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tencent/liteav/d;->f(Lcom/tencent/liteav/d;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/liteav/d$17;->b:Lcom/tencent/liteav/d;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/tencent/liteav/d;->h(Lcom/tencent/liteav/d;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
