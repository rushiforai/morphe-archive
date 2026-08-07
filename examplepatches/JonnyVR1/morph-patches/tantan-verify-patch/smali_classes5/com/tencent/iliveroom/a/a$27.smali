.class Lcom/tencent/iliveroom/a/a$27;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->enableAudioMessage(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$27;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/iliveroom/a/a$27;->a:Z

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TRTCAdapter: enable block message, enable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/iliveroom/a/a$27;->a:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "TRTCAdapter-ext"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$27;->b:Lcom/tencent/iliveroom/a/a;

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/tencent/iliveroom/a/a$27;->a:Z

    .line 25
    .line 26
    iput-boolean v1, v0, Lcom/tencent/iliveroom/a/a;->g:Z

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->F(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$27;->b:Lcom/tencent/iliveroom/a/a;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->G(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-boolean p0, p0, Lcom/tencent/iliveroom/a/a$27;->a:Z

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/d;->b(Z)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method
