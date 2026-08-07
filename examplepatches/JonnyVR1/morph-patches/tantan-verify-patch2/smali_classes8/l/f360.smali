.class public final Ll/f360;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/f360$b;
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
    iput-wide p1, p0, Ll/f360;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/f360;->b:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    iput-object p4, p0, Ll/f360;->c:Ll/f2e0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 7
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
    iget-object v0, p0, Ll/f360;->c:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v5

    .line 7
    new-instance v6, Ll/are0;

    .line 8
    .line 9
    invoke-direct {v6, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 10
    .line 11
    .line 12
    new-instance v4, Ll/wqe0;

    .line 13
    .line 14
    invoke-direct {v4}, Ll/wqe0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v6, v5}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v6, v4}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/f360$a;

    .line 24
    .line 25
    move-object v2, p0

    .line 26
    move-object v3, p1

    .line 27
    invoke-direct/range {v1 .. v6}, Ll/f360$a;-><init>(Ll/f360;Ll/gcg0;Ll/wqe0;Ll/f2e0$a;Ll/are0;)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f360;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
