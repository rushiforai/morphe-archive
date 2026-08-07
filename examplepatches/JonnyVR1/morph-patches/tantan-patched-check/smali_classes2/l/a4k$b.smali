.class public final Ll/a4k$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a4k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private final a:Z

.field private b:I

.field private c:I

.field private final d:Ljava/util/concurrent/ThreadFactory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private e:Ll/a4k$e;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private f:Ljava/lang/String;

.field private g:J


# direct methods
.method public constructor <init>(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/a4k$c;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/a4k$c;-><init>(Ll/a4k$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/a4k$b;->d:Ljava/util/concurrent/ThreadFactory;

    .line 11
    .line 12
    sget-object v0, Ll/a4k$e;->d:Ll/a4k$e;

    .line 13
    .line 14
    iput-object v0, p0, Ll/a4k$b;->e:Ll/a4k$e;

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/a4k$b;->a:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ll/a4k;
    .locals 11

    .line 1
    iget-object v0, p0, Ll/a4k$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 10
    .line 11
    iget v2, p0, Ll/a4k$b;->b:I

    .line 12
    .line 13
    iget v3, p0, Ll/a4k$b;->c:I

    .line 14
    .line 15
    iget-wide v4, p0, Ll/a4k$b;->g:J

    .line 16
    .line 17
    new-instance v7, Ljava/util/concurrent/PriorityBlockingQueue;

    .line 18
    .line 19
    invoke-direct {v7}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v8, Ll/a4k$d;

    .line 23
    .line 24
    iget-object v0, p0, Ll/a4k$b;->d:Ljava/util/concurrent/ThreadFactory;

    .line 25
    .line 26
    iget-object v6, p0, Ll/a4k$b;->f:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v9, p0, Ll/a4k$b;->e:Ll/a4k$e;

    .line 29
    .line 30
    iget-boolean v10, p0, Ll/a4k$b;->a:Z

    .line 31
    .line 32
    invoke-direct {v8, v0, v6, v9, v10}, Ll/a4k$d;-><init>(Ljava/util/concurrent/ThreadFactory;Ljava/lang/String;Ll/a4k$e;Z)V

    .line 33
    .line 34
    .line 35
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 36
    .line 37
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 38
    .line 39
    .line 40
    iget-wide v2, p0, Ll/a4k$b;->g:J

    .line 41
    .line 42
    const-wide/16 v4, 0x0

    .line 43
    .line 44
    cmp-long p0, v2, v4

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    invoke-virtual {v1, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 50
    .line 51
    .line 52
    :cond_0
    new-instance p0, Ll/a4k;

    .line 53
    .line 54
    invoke-direct {p0, v1}, Ll/a4k;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_1
    const-string v0, "Name must be non-null and non-empty, but given: "

    .line 59
    .line 60
    iget-object p0, p0, Ll/a4k$b;->f:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method public b(Ljava/lang/String;)Ll/a4k$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4k$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/a4k$b;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/a4k$b;->b:I

    .line 2
    .line 3
    iput p1, p0, Ll/a4k$b;->c:I

    .line 4
    .line 5
    return-object p0
.end method
