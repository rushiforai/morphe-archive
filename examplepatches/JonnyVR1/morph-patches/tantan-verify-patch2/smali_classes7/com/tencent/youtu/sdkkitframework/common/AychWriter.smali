.class public Lcom/tencent/youtu/sdkkitframework/common/AychWriter;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 2
    .line 3
    const-string v1, "\u5f00\u59cb\u6267\u884crun()"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    :try_start_0
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->getLogWriter(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/AychWriter;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, p0}, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 28
    .line 29
    .line 30
    :goto_0
    const/4 p0, 0x0

    .line 31
    sput-object p0, Lcom/tencent/youtu/sdkkitframework/common/LogWriter;->logWriter:Lcom/tencent/youtu/sdkkitframework/common/LogWriter;

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 38
    .line 39
    new-instance v4, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v5, "\u603b\u6d88\u8017\u65f6\u95f4\uff1a"

    .line 42
    .line 43
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sub-long/2addr v2, v0

    .line 47
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
