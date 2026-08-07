.class public final Ll/z260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z260$a;,
        Ll/z260$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "Ljava/util/List<",
        "TT;>;TT;>;"
    }
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/util/concurrent/TimeUnit;

.field public final d:I

.field public final e:Ll/f2e0;


# direct methods
.method public constructor <init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/z260;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/z260;->b:J

    .line 7
    .line 8
    iput-object p5, p0, Ll/z260;->c:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    iput p6, p0, Ll/z260;->d:I

    .line 11
    .line 12
    iput-object p7, p0, Ll/z260;->e:Ll/f2e0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z260;->e:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/are0;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 10
    .line 11
    .line 12
    iget-wide v2, p0, Ll/z260;->a:J

    .line 13
    .line 14
    iget-wide v4, p0, Ll/z260;->b:J

    .line 15
    .line 16
    cmp-long v2, v2, v4

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    new-instance v2, Ll/z260$a;

    .line 21
    .line 22
    invoke-direct {v2, p0, v1, v0}, Ll/z260$a;-><init>(Ll/z260;Ll/gcg0;Ll/f2e0$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ll/z260$a;->h()V

    .line 32
    .line 33
    .line 34
    return-object v2

    .line 35
    :cond_0
    new-instance v2, Ll/z260$b;

    .line 36
    .line 37
    invoke-direct {v2, p0, v1, v0}, Ll/z260$b;-><init>(Ll/z260;Ll/gcg0;Ll/f2e0$a;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ll/z260$b;->i()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ll/z260$b;->h()V

    .line 50
    .line 51
    .line 52
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z260;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
