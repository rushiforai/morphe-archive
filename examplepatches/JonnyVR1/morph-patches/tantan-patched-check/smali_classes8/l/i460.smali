.class public final Ll/i460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:J

.field public final b:Ljava/util/concurrent/TimeUnit;

.field public final c:Ll/f2e0;


# direct methods
.method public constructor <init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/i460;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/i460;->b:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    iput-object p4, p0, Ll/i460;->c:Ll/f2e0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i460;->c:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/i460$a;

    .line 16
    .line 17
    invoke-direct {v2, p0, v1}, Ll/i460$a;-><init>(Ll/i460;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 18
    .line 19
    .line 20
    iget-wide v3, p0, Ll/i460;->a:J

    .line 21
    .line 22
    iget-object v5, p0, Ll/i460;->b:Ljava/util/concurrent/TimeUnit;

    .line 23
    .line 24
    invoke-virtual {v0, v2, v3, v4, v5}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/i460$b;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1, v1, p1}, Ll/i460$b;-><init>(Ll/i460;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/gcg0;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
