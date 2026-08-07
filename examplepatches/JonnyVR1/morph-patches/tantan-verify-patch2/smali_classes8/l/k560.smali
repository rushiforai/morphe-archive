.class public final Ll/k560;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TR;TT;>;"
    }
.end annotation


# static fields
.field public static final c:Ljava/lang/Object;


# instance fields
.field public final a:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "-TT;-TU;+TR;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TU;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/k560;->c:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lrx/c;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TU;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/k560;->b:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/k560;->a:Ll/rcj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    new-instance v2, Ll/are0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {v2, p1, v0}, Ll/are0;-><init>(Ll/gcg0;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ljava/util/concurrent/atomic/AtomicReference;

    .line 11
    .line 12
    sget-object p1, Ll/k560;->c:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-direct {v4, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/k560$a;

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    move-object v5, v2

    .line 21
    move-object v1, p0

    .line 22
    invoke-direct/range {v0 .. v5}, Ll/k560$a;-><init>(Ll/k560;Ll/gcg0;ZLjava/util/concurrent/atomic/AtomicReference;Ll/are0;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/k560$b;

    .line 26
    .line 27
    invoke-direct {p0, v1, v4, v2}, Ll/k560$b;-><init>(Ll/k560;Ljava/util/concurrent/atomic/AtomicReference;Ll/are0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, v1, Ll/k560;->b:Lrx/c;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k560;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
