.class public Lcom/xiaomi/mipush/sdk/b$a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/b$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field public final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/push/gj;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field private final d:Ljava/lang/Runnable;

.field final synthetic e:Lcom/xiaomi/mipush/sdk/b$a;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/b$a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->e:Lcom/xiaomi/mipush/sdk/b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-direct {p1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->a:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->b:Ljava/util/ArrayList;

    .line 20
    .line 21
    new-instance p1, Lcom/xiaomi/mipush/sdk/b$a$a$b;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Lcom/xiaomi/mipush/sdk/b$a$a$b;-><init>(Lcom/xiaomi/mipush/sdk/b$a$a;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->d:Ljava/lang/Runnable;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/mipush/sdk/b$a$a;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/xiaomi/mipush/sdk/b$a$a;Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 2
    .line 3
    return-object p1
.end method

.method private c()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->a:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->d:Ljava/lang/Runnable;

    .line 8
    .line 9
    const-wide/16 v5, 0x3e8

    .line 10
    .line 11
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    const-wide/16 v3, 0x3e8

    .line 14
    .line 15
    invoke-virtual/range {v1 .. v7}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/xiaomi/mipush/sdk/b$a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/b$a$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/xiaomi/push/gj;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->e:Lcom/xiaomi/mipush/sdk/b$a;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/b$a;->a(Lcom/xiaomi/mipush/sdk/b$a;)Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->e:Lcom/xiaomi/mipush/sdk/b$a;

    .line 21
    .line 22
    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/b$a;->a(Lcom/xiaomi/mipush/sdk/b$a;)Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/c;->c(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/c;->d()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    filled-new-array {v0}, [Lcom/xiaomi/push/gj;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/16 v4, 0x7800

    .line 43
    .line 44
    invoke-static {v3, v1, v2, v4}, Lcom/xiaomi/push/service/az;->a(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/xiaomi/push/he;

    .line 63
    .line 64
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v4, "MiTinyDataClient Send item by PushServiceClient.sendMessage(XmActionNotification)."

    .line 67
    .line 68
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->e:Lcom/xiaomi/mipush/sdk/b$a;

    .line 86
    .line 87
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/b$a;->a(Lcom/xiaomi/mipush/sdk/b$a;)Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/f;->h(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/f;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    sget-object v4, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 96
    .line 97
    const/4 v5, 0x1

    .line 98
    const/4 v6, 0x0

    .line 99
    invoke-virtual {v3, v2, v4, v5, v6}, Lcom/xiaomi/mipush/sdk/f;->y(Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;ZLcom/xiaomi/push/gs;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/xiaomi/mipush/sdk/b$a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/b$a$a;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Lcom/xiaomi/push/gj;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/b$a$a;->a:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/xiaomi/mipush/sdk/b$a$a$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/xiaomi/mipush/sdk/b$a$a$a;-><init>(Lcom/xiaomi/mipush/sdk/b$a$a;Lcom/xiaomi/push/gj;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
