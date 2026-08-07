.class public Lcom/tencent/could/component/common/ai/log/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/io/File;

.field public volatile b:Ljava/io/BufferedWriter;

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/f;->c:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    const-string v0, "close writer fail! e: "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_2

    .line 16
    :catch_0
    move-exception v2

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 21
    .line 22
    return-void

    .line 23
    :goto_1
    const-string v3, "LogWriter"

    .line 24
    .line 25
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 47
    .line 48
    return-void

    .line 49
    :goto_2
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 52
    .line 53
    throw v0
.end method
