.class public final Ll/a460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a460$a;
    }
.end annotation

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
    iput-wide p1, p0, Ll/a460;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/a460;->b:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    iput-object p4, p0, Ll/a460;->c:Ll/f2e0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 9
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
    new-instance v0, Ll/are0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/a460;->c:Ll/f2e0;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    new-instance v3, Ll/a460$a;

    .line 16
    .line 17
    invoke-direct {v3, v0}, Ll/a460$a;-><init>(Ll/gcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v3}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-wide v4, p0, Ll/a460;->a:J

    .line 24
    .line 25
    iget-object v8, p0, Ll/a460;->b:Ljava/util/concurrent/TimeUnit;

    .line 26
    .line 27
    move-wide v6, v4

    .line 28
    invoke-virtual/range {v2 .. v8}, Ll/f2e0$a;->d(Ll/x20;JJLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-object v3
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
