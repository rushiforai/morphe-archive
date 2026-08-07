.class public abstract Ll/tsg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/zug0;

.field public static final b:Ll/rg50;

.field public static final c:Ljava/util/concurrent/ThreadPoolExecutor;

.field public static final d:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Ll/zug0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zug0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/tsg0;->a:Ll/zug0;

    .line 7
    .line 8
    new-instance v1, Ll/rg50$b;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/rg50$b;-><init>()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0xf

    .line 14
    .line 15
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3, v9}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-wide/16 v2, 0x1e

    .line 22
    .line 23
    invoke-virtual {v1, v2, v3, v9}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, v2, v3, v9}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wlg0;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/wlg0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/rg50$b;->l(Ll/t4f$b;)Ll/rg50$b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/h0h0;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/h0h0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sput-object v0, Ll/tsg0;->b:Ll/rg50;

    .line 58
    .line 59
    new-instance v4, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 60
    .line 61
    new-instance v10, Ljava/util/concurrent/SynchronousQueue;

    .line 62
    .line 63
    invoke-direct {v10}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 64
    .line 65
    .line 66
    new-instance v11, Ll/tlg0;

    .line 67
    .line 68
    invoke-direct {v11}, Ll/tlg0;-><init>()V

    .line 69
    .line 70
    .line 71
    const/16 v6, 0x40

    .line 72
    .line 73
    const-wide/16 v7, 0x1e

    .line 74
    .line 75
    const/4 v5, 0x1

    .line 76
    invoke-direct/range {v4 .. v11}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 77
    .line 78
    .line 79
    sput-object v4, Ll/tsg0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 80
    .line 81
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Ll/tsg0;->d:Ljava/util/concurrent/ExecutorService;

    .line 86
    .line 87
    return-void
.end method

.method public static a(Ll/x1d0$a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Bearer "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/utg0;->b:Ll/uyg0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/uyg0;->i:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "Authorization"

    .line 20
    .line 21
    invoke-virtual {p0, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    return-void
.end method
