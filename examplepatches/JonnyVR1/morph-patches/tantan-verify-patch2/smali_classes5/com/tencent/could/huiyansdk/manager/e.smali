.class public Lcom/tencent/could/huiyansdk/manager/e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/manager/e$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Object;

.field public c:Lcom/tencent/could/huiyansdk/callback/LoggerInfoCallBack;

.field public volatile d:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/e;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/e;->b:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/e;->c:Lcom/tencent/could/huiyansdk/callback/LoggerInfoCallBack;

    if-nez v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    if-nez v0, :cond_1

    :goto_0
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    .line 68
    iput v1, v0, Landroid/os/Message;->what:I

    .line 69
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public final a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_1

    .line 3
    .line 4
    sget-object p1, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 5
    .line 6
    iget-boolean p1, p1, Lcom/tencent/could/huiyansdk/utils/e;->a:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v1, 0x2

    .line 16
    if-ne p1, v1, :cond_3

    .line 17
    .line 18
    sget-object p1, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 19
    .line 20
    iget-boolean p1, p1, Lcom/tencent/could/huiyansdk/utils/e;->a:Z

    .line 21
    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    invoke-static {p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLog;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_3
    sget-object p1, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;

    .line 30
    .line 31
    iget-boolean p1, p1, Lcom/tencent/could/huiyansdk/utils/e;->a:Z

    .line 32
    .line 33
    if-nez p1, :cond_4

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_4
    invoke-static {p2, p3}, Lcom/tencent/could/component/common/ai/log/AiLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/manager/e;->c:Lcom/tencent/could/huiyansdk/callback/LoggerInfoCallBack;

    .line 40
    .line 41
    if-nez p1, :cond_5

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_5
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 45
    .line 46
    if-nez p1, :cond_6

    .line 47
    .line 48
    :goto_1
    return-void

    .line 49
    :cond_6
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput v0, p1, Landroid/os/Message;->what:I

    .line 56
    .line 57
    iput-object p3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/e;->d:Landroid/os/Handler;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method
