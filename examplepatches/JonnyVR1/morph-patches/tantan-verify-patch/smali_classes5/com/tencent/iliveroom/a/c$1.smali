.class Lcom/tencent/iliveroom/a/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c;->a(Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:J

.field final synthetic c:Lcom/tencent/iliveroom/a/c;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c;Ljava/lang/String;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c$1;->c:Lcom/tencent/iliveroom/a/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/c$1;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/iliveroom/a/c$1;->b:J

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$1;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "start -> roomId is invalid = "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/iliveroom/a/c$1;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "TRTCAdapter-ConnOther"

    .line 26
    .line 27
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$1;->c:Lcom/tencent/iliveroom/a/c;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$1;->c:Lcom/tencent/iliveroom/a/c;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/iliveroom/a/c$1;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$1;->c:Lcom/tencent/iliveroom/a/c;

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/c$1;->b:J

    .line 51
    .line 52
    invoke-static {v0, v1, v2}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;J)J

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$1;->c:Lcom/tencent/iliveroom/a/c;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/iliveroom/a/c$1;->a:Ljava/lang/String;

    .line 58
    .line 59
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/c$1;->b:J

    .line 60
    .line 61
    invoke-static {v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;Ljava/lang/String;J)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
