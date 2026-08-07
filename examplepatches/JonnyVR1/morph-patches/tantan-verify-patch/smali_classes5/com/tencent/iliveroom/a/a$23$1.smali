.class Lcom/tencent/iliveroom/a/a$23$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a$23;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a$23;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a$23;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$23$1;->a:Lcom/tencent/iliveroom/a/a$23;

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
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$23$1;->a:Lcom/tencent/iliveroom/a/a$23;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->h(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "TRTCAdapter-ext"

    .line 12
    .line 13
    const-string v1, "quitRoom -> runOnGLThread -> Release Processor And Encoder."

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$23$1;->a:Lcom/tencent/iliveroom/a/a$23;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$23;->a:Lcom/tencent/iliveroom/a/a;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->i(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/tencent/liteav/d;->p()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
