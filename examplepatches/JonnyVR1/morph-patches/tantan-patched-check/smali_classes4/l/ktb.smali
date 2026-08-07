.class public Ll/ktb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static g:I = 0x1f4


# instance fields
.field public a:I

.field public b:Landroid/os/HandlerThread;

.field public c:Landroid/os/Handler;

.field public d:J

.field public e:Z

.field public f:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    sget v0, Ll/ktb;->g:I

    invoke-direct {p0, v0}, Ll/ktb;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/ktb;->d:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/ktb;->e:Z

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ktb;->f:Ljava/util/LinkedList;

    .line 17
    .line 18
    iput p1, p0, Ll/ktb;->a:I

    .line 19
    .line 20
    new-instance p1, Landroid/os/HandlerThread;

    .line 21
    .line 22
    const-string v0, "cpu-check-thread"

    .line 23
    .line 24
    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/ktb;->b:Landroid/os/HandlerThread;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ktb;->b:Landroid/os/HandlerThread;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/ktb;->e(Landroid/os/Looper;)Landroid/os/Handler;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/ktb;->c:Landroid/os/Handler;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Ll/ktb;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ktb;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/ktb;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ktb;->d:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic c(Ll/ktb;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ktb;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ktb;->f:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 1

    .line 1
    new-instance v0, Ll/ktb$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ktb$a;-><init>(Ll/ktb;Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/ktb;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/ktb;->e:Z

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iput-wide v1, p0, Ll/ktb;->d:J

    .line 14
    .line 15
    iget-object p0, p0, Ll/ktb;->c:Landroid/os/Handler;

    .line 16
    .line 17
    sget v1, Ll/ktb;->g:I

    .line 18
    .line 19
    int-to-long v1, v1

    .line 20
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
