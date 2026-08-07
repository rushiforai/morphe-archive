.class public Lcom/tencent/could/huiyansdk/utils/l;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/api/g;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/utils/n;Landroid/os/Looper;Lcom/tencent/could/huiyansdk/api/g;)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/tencent/could/huiyansdk/utils/l;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/tencent/could/huiyansdk/api/a;->a()Lcom/tencent/could/huiyansdk/api/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 14
    .line 15
    const-string v1, "a"

    .line 16
    .line 17
    const-string v2, "do resume"

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    invoke-virtual {p1, v3, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->doResume()V

    .line 28
    .line 29
    .line 30
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/k$b;->a:Lcom/tencent/could/huiyansdk/utils/k;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "timeout resume: "

    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v3, v1, Lcom/tencent/could/huiyansdk/utils/k;->d:J

    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "TimeOutHelper"

    .line 49
    .line 50
    invoke-virtual {p1, v0, v3, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-wide v2, v1, Lcom/tencent/could/huiyansdk/utils/k;->d:J

    .line 54
    .line 55
    invoke-virtual {v1, v2, v3}, Lcom/tencent/could/huiyansdk/utils/k;->a(J)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/l;->a:Lcom/tencent/could/huiyansdk/api/g;

    .line 59
    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-interface {p0}, Lcom/tencent/could/huiyansdk/api/g;->onEndTransition()V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method
