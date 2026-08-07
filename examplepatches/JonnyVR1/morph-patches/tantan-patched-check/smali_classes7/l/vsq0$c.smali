.class Ll/vsq0$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vsq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private final a:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/vsq0$d;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic b:Ll/vsq0;


# direct methods
.method public constructor <init>(Ll/vsq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 2
    .line 3
    const-string p1, "PackageProcessor"

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/vsq0$c;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 14
    .line 15
    return-void
.end method

.method private a(ILl/vsq0$d;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/vsq0;->b(Ll/vsq0;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/vsq0;->b(Ll/vsq0;)Landroid/os/Handler;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public b(Ll/vsq0$d;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/vsq0$c;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/vsq0;->a(Ll/vsq0;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/vsq0;->a(Ll/vsq0;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-long v0, v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object v2, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 23
    .line 24
    invoke-static {v2}, Ll/vsq0;->h(Ll/vsq0;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-nez v2, :cond_3

    .line 29
    .line 30
    :try_start_0
    iget-object v2, p0, Ll/vsq0$c;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 31
    .line 32
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    invoke-virtual {v2, v0, v1, v3}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/vsq0$d;

    .line 39
    .line 40
    iget-object v3, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 41
    .line 42
    invoke-static {v3, v2}, Ll/vsq0;->c(Ll/vsq0;Ll/vsq0$d;)Ll/vsq0$d;

    .line 43
    .line 44
    .line 45
    if-eqz v2, :cond_2

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-direct {p0, v3, v2}, Ll/vsq0$c;->a(ILl/vsq0$d;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ll/vsq0$d;->b()V

    .line 52
    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    invoke-direct {p0, v3, v2}, Ll/vsq0$c;->a(ILl/vsq0$d;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_0
    move-exception v2

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v2, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 62
    .line 63
    invoke-static {v2}, Ll/vsq0;->a(Ll/vsq0;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-lez v2, :cond_1

    .line 68
    .line 69
    iget-object v2, p0, Ll/vsq0$c;->b:Ll/vsq0;

    .line 70
    .line 71
    invoke-static {v2}, Ll/vsq0;->g(Ll/vsq0;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :goto_1
    invoke-static {v2}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    return-void
.end method
