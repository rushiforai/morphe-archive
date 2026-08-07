.class public final Ll/ky3;
.super Ll/f2e0;
.source "SourceFile"

# interfaces
.implements Ll/j2e0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ky3$c;,
        Ll/ky3$b;,
        Ll/ky3$a;
    }
.end annotation


# static fields
.field public static final d:Ljava/util/concurrent/TimeUnit;

.field public static final e:Ll/ky3$c;

.field public static final f:Ll/ky3$a;


# instance fields
.field public final b:Ljava/util/concurrent/ThreadFactory;

.field public final c:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ll/ky3$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    sput-object v0, Ll/ky3;->d:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    new-instance v0, Ll/ky3$c;

    .line 6
    .line 7
    sget-object v1, Lrx/internal/util/RxThreadFactory;->NONE:Ljava/util/concurrent/ThreadFactory;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ky3$c;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Ll/ky3;->e:Ll/ky3$c;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/lj40;->unsubscribe()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/ky3$a;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    invoke-direct {v0, v1, v2, v3, v1}, Ll/ky3$a;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/ky3;->f:Ll/ky3$a;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/ky3$a;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ky3;->b:Ljava/util/concurrent/ThreadFactory;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    sget-object v0, Ll/ky3;->f:Ll/ky3$a;

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ky3;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ky3;->start()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public createWorker()Ll/f2e0$a;
    .locals 1

    .line 1
    new-instance v0, Ll/ky3$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ky3;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/ky3$a;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ky3$b;-><init>(Ll/ky3$a;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public shutdown()V
    .locals 3

    .line 1
    :cond_0
    iget-object v0, p0, Ll/ky3;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ky3$a;

    .line 8
    .line 9
    sget-object v1, Ll/ky3;->f:Ll/ky3$a;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iget-object v2, p0, Ll/ky3;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ky3$a;->e()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public start()V
    .locals 5

    .line 1
    new-instance v0, Ll/ky3$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ky3;->b:Ljava/util/concurrent/ThreadFactory;

    .line 4
    .line 5
    const-wide/16 v2, 0x3c

    .line 6
    .line 7
    sget-object v4, Ll/ky3;->d:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3, v4}, Ll/ky3$a;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ky3;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 13
    .line 14
    sget-object v1, Ll/ky3;->f:Ll/ky3$a;

    .line 15
    .line 16
    invoke-static {p0, v1, v0}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/ky3$a;->e()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
