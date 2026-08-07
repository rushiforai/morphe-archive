.class public final Ll/wn50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/ax5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ax5<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final b:I

.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "-",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ll/ax5;ILl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ax5<",
            "+TT;>;I",
            "Ll/y20<",
            "-",
            "Ll/kcg0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-lez p2, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/wn50;->a:Ll/ax5;

    .line 7
    .line 8
    iput p2, p0, Ll/wn50;->b:I

    .line 9
    .line 10
    iput-object p3, p0, Ll/wn50;->c:Ll/y20;

    .line 11
    .line 12
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/wn50;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "numberOfSubscribers > 0 required"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    throw p0
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wn50;->a:Ll/ax5;

    .line 2
    .line 3
    invoke-static {p1}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/wn50;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget v0, p0, Ll/wn50;->b:I

    .line 17
    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/wn50;->a:Ll/ax5;

    .line 21
    .line 22
    iget-object p0, p0, Ll/wn50;->c:Ll/y20;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Ll/ax5;->c(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wn50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
