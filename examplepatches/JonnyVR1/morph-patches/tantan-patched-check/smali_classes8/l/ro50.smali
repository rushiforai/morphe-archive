.class public final Ll/ro50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/util/concurrent/TimeUnit;

.field public final d:Ll/f2e0;


# direct methods
.method public constructor <init>(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/ro50;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/ro50;->b:J

    .line 7
    .line 8
    iput-object p5, p0, Ll/ro50;->c:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    iput-object p6, p0, Ll/ro50;->d:Ll/f2e0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ro50;->d:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/ro50$a;

    .line 11
    .line 12
    invoke-direct {v2, p0, p1, v1}, Ll/ro50$a;-><init>(Ll/ro50;Ll/gcg0;Ll/f2e0$a;)V

    .line 13
    .line 14
    .line 15
    iget-wide v3, p0, Ll/ro50;->a:J

    .line 16
    .line 17
    iget-wide v5, p0, Ll/ro50;->b:J

    .line 18
    .line 19
    iget-object v7, p0, Ll/ro50;->c:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    invoke-virtual/range {v1 .. v7}, Ll/f2e0$a;->d(Ll/x20;JJLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ro50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
