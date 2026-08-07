.class public Ll/y460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y460$c;,
        Ll/y460$b;,
        Ll/y460$a;
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
.field public final a:Ll/y460$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y460$a<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/y460$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y460$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final c:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final d:Ll/f2e0;


# direct methods
.method public constructor <init>(Ll/y460$a;Ll/y460$b;Lrx/c;Ll/f2e0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y460$a<",
            "TT;>;",
            "Ll/y460$b<",
            "TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Ll/f2e0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y460;->a:Ll/y460$a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/y460;->b:Ll/y460$b;

    .line 7
    .line 8
    iput-object p3, p0, Ll/y460;->c:Lrx/c;

    .line 9
    .line 10
    iput-object p4, p0, Ll/y460;->d:Ll/f2e0;

    .line 11
    .line 12
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
    iget-object v0, p0, Ll/y460;->d:Ll/f2e0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v6

    .line 7
    invoke-virtual {p1, v6}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/are0;

    .line 11
    .line 12
    invoke-direct {v2, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 13
    .line 14
    .line 15
    new-instance v4, Ll/wqe0;

    .line 16
    .line 17
    invoke-direct {v4}, Ll/wqe0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v4}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/y460$c;

    .line 24
    .line 25
    iget-object v3, p0, Ll/y460;->b:Ll/y460$b;

    .line 26
    .line 27
    iget-object v5, p0, Ll/y460;->c:Lrx/c;

    .line 28
    .line 29
    invoke-direct/range {v1 .. v6}, Ll/y460$c;-><init>(Ll/are0;Ll/y460$b;Ll/wqe0;Lrx/c;Ll/f2e0$a;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, v1, Ll/y460$c;->j:Ll/xk90;

    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/y460;->a:Ll/y460$a;

    .line 41
    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p0, v1, p1, v6}, Ll/scj;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ll/kcg0;

    .line 53
    .line 54
    invoke-virtual {v4, p0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 55
    .line 56
    .line 57
    return-object v1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
