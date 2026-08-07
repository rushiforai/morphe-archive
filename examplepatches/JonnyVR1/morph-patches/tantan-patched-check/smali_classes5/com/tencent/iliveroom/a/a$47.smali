.class Lcom/tencent/iliveroom/a/a$47;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
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
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$47;->a:Lcom/tencent/iliveroom/a/a;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$47;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->u(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "TRTCAdapter-ext"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "sendCustomVideoTexture -> runOnGLThread -> Release Processor And Encoder."

    .line 12
    .line 13
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$47;->a:Lcom/tencent/iliveroom/a/a;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->v(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/tencent/liteav/d;->p()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$47;->a:Lcom/tencent/iliveroom/a/a;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->w(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string v0, "sendCustomVideoTexture: video combiner release in gl thread."

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$47;->a:Lcom/tencent/iliveroom/a/a;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->w(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a/e;->a()V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method
