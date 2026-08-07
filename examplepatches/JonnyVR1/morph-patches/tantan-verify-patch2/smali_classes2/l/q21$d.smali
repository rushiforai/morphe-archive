.class public Ll/q21$d;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# static fields
.field public static final c:Ll/q21$d;


# instance fields
.field public a:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "Ll/q21$c;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/rj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rj80<",
            "Ll/q21$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/q21$d;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q21$d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/q21$d;->c:Ll/q21$d;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 5
    .line 6
    const/16 v1, 0xa

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/q21$d;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 12
    .line 13
    new-instance v0, Ll/rj80;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/rj80;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/q21$d;->b:Ll/rj80;

    .line 19
    .line 20
    return-void
.end method

.method public static b()Ll/q21$d;
    .locals 1

    .line 1
    sget-object v0, Ll/q21$d;->c:Ll/q21$d;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/q21$c;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/q21$d;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ArrayBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    const-string p1, "Failed to enqueue async inflate request"

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c()Ll/q21$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q21$d;->b:Ll/rj80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/q21$c;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ll/q21$c;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/q21$c;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method

.method public d(Ll/q21$c;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p1, Ll/q21$c;->e:Ll/q21$e;

    .line 3
    .line 4
    iput-object v0, p1, Ll/q21$c;->a:Ll/q21;

    .line 5
    .line 6
    iput-object v0, p1, Ll/q21$c;->b:Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p1, Ll/q21$c;->c:I

    .line 10
    .line 11
    iput-object v0, p1, Ll/q21$c;->d:Landroid/view/View;

    .line 12
    .line 13
    iget-object p0, p0, Ll/q21$d;->b:Ll/rj80;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/rj80;->release(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/q21$d;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/ArrayBlockingQueue;->take()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/q21$c;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :try_start_1
    iget-object v1, p0, Ll/q21$c;->a:Ll/q21;

    .line 11
    .line 12
    iget-object v1, v1, Ll/q21;->a:Landroid/view/LayoutInflater;

    .line 13
    .line 14
    iget v2, p0, Ll/q21$c;->c:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/q21$c;->b:Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Ll/q21$c;->d:Landroid/view/View;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 23
    .line 24
    :catch_0
    iget-object v1, p0, Ll/q21$c;->a:Ll/q21;

    .line 25
    .line 26
    iget-object v1, v1, Ll/q21;->b:Landroid/os/Handler;

    .line 27
    .line 28
    invoke-static {v1, v0, p0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 33
    .line 34
    .line 35
    :catch_1
    return-void
.end method

.method public run()V
    .locals 0

    .line 1
    :goto_0
    invoke-virtual {p0}, Ll/q21$d;->e()V

    .line 2
    .line 3
    .line 4
    goto :goto_0
.end method
