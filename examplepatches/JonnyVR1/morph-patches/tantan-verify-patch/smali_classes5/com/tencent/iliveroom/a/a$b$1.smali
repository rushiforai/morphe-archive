.class Lcom/tencent/iliveroom/a/a$b$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a$b;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;

.field final synthetic b:Lcom/tencent/iliveroom/a/a$b;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a$b;Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$b$1;->b:Lcom/tencent/iliveroom/a/a$b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$b$1;->a:Lcom/tencent/iliveroom/a/a;

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
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b$1;->b:Lcom/tencent/iliveroom/a/a$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a$b;->a(Lcom/tencent/iliveroom/a/a$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "TRTCAdapter-ext"

    .line 10
    .line 11
    const-string v1, "TRTCAdapter: start timer task."

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b$1;->b:Lcom/tencent/iliveroom/a/a$b;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a$b;->a(Lcom/tencent/iliveroom/a/a$b;Z)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$b$1;->a:Lcom/tencent/iliveroom/a/a;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->Z(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/basic/util/e;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$b$1;->b:Lcom/tencent/iliveroom/a/a$b;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
