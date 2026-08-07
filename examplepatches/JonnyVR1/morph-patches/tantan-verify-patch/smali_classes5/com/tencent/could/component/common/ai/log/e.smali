.class public Lcom/tencent/could/component/common/ai/log/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/component/common/ai/log/e$a;
    }
.end annotation


# instance fields
.field public a:Lcom/tencent/could/component/common/ai/utils/SimplePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tencent/could/component/common/ai/utils/SimplePool<",
            "Lcom/tencent/could/component/common/ai/log/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/could/component/common/ai/utils/SimplePool;

    .line 5
    .line 6
    const/16 v1, 0x1e

    .line 7
    .line 8
    const-string v2, "LogInfoPool"

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lcom/tencent/could/component/common/ai/utils/SimplePool;-><init>(ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/e;->a:Lcom/tencent/could/component/common/ai/utils/SimplePool;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/could/component/common/ai/log/d;)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p1, Lcom/tencent/could/component/common/ai/log/d;->a:I

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p1, Lcom/tencent/could/component/common/ai/log/d;->b:J

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p1, Lcom/tencent/could/component/common/ai/log/d;->c:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    iput-object v0, p1, Lcom/tencent/could/component/common/ai/log/d;->d:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    iput-object v0, p1, Lcom/tencent/could/component/common/ai/log/d;->e:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, ""

    .line 21
    .line 22
    iput-object v0, p1, Lcom/tencent/could/component/common/ai/log/d;->f:Ljava/lang/String;

    .line 23
    .line 24
    const-class v0, Lcom/tencent/could/component/common/ai/log/e;

    .line 25
    .line 26
    monitor-enter v0

    .line 27
    :try_start_0
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/e;->a:Lcom/tencent/could/component/common/ai/utils/SimplePool;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/utils/SimplePool;->release(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method
