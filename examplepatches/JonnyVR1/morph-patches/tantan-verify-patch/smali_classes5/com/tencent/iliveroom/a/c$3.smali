.class Lcom/tencent/iliveroom/a/c$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c;->a(ILjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/c;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->c(Lcom/tencent/iliveroom/a/c;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->d(Lcom/tencent/iliveroom/a/c;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c;->c(Lcom/tencent/iliveroom/a/c;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object p0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/tencent/iliveroom/a/c;->d(Lcom/tencent/iliveroom/a/c;)J

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    invoke-static {v0, v1, v2, v3}, Lcom/tencent/iliveroom/a/c;->a(Lcom/tencent/iliveroom/a/c;Ljava/lang/String;J)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "retryConnect -> fail, target room id:"

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 58
    .line 59
    invoke-static {v1}, Lcom/tencent/iliveroom/a/c;->c(Lcom/tencent/iliveroom/a/c;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, " user id:"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/tencent/iliveroom/a/c$3;->a:Lcom/tencent/iliveroom/a/c;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/tencent/iliveroom/a/c;->d(Lcom/tencent/iliveroom/a/c;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v0, "TRTCAdapter-ConnOther"

    .line 85
    .line 86
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
