.class public final Ll/j460;
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
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;TT;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TU;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TU;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j460;->a:Lrx/c;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 4
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
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/j460$a;

    .line 12
    .line 13
    invoke-direct {v2, p0, v1, v0}, Ll/j460$a;-><init>(Ll/j460;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/are0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Ll/j460;->a:Lrx/c;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/j460$b;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, v1, v0}, Ll/j460$b;-><init>(Ll/j460;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/are0;)V

    .line 27
    .line 28
    .line 29
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
