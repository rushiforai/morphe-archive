.class public final Lrx/subscriptions/RefCountSubscription;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/subscriptions/RefCountSubscription$InnerSubscription;,
        Lrx/subscriptions/RefCountSubscription$a;
    }
.end annotation


# static fields
.field public static final c:Lrx/subscriptions/RefCountSubscription$a;


# instance fields
.field public final a:Ll/kcg0;

.field public final b:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lrx/subscriptions/RefCountSubscription$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lrx/subscriptions/RefCountSubscription$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lrx/subscriptions/RefCountSubscription$a;-><init>(ZI)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lrx/subscriptions/RefCountSubscription;->c:Lrx/subscriptions/RefCountSubscription$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/kcg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    sget-object v1, Lrx/subscriptions/RefCountSubscription;->c:Lrx/subscriptions/RefCountSubscription$a;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lrx/subscriptions/RefCountSubscription;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, Lrx/subscriptions/RefCountSubscription;->a:Ll/kcg0;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "s"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    throw p0
.end method


# virtual methods
.method public a()Ll/kcg0;
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/subscriptions/RefCountSubscription;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lrx/subscriptions/RefCountSubscription$a;

    .line 8
    .line 9
    iget-boolean v2, v1, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_1
    invoke-virtual {v1}, Lrx/subscriptions/RefCountSubscription$a;->a()Lrx/subscriptions/RefCountSubscription$a;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v0, v1, v2}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    new-instance v0, Lrx/subscriptions/RefCountSubscription$InnerSubscription;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lrx/subscriptions/RefCountSubscription$InnerSubscription;-><init>(Lrx/subscriptions/RefCountSubscription;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/subscriptions/RefCountSubscription;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lrx/subscriptions/RefCountSubscription$a;

    .line 8
    .line 9
    invoke-virtual {v1}, Lrx/subscriptions/RefCountSubscription$a;->b()Lrx/subscriptions/RefCountSubscription$a;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v1, v2}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lrx/subscriptions/RefCountSubscription;->c(Lrx/subscriptions/RefCountSubscription$a;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final c(Lrx/subscriptions/RefCountSubscription$a;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p1, p1, Lrx/subscriptions/RefCountSubscription$a;->b:I

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lrx/subscriptions/RefCountSubscription;->a:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/subscriptions/RefCountSubscription;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/subscriptions/RefCountSubscription$a;

    .line 8
    .line 9
    iget-boolean p0, p0, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 10
    .line 11
    return p0
.end method

.method public unsubscribe()V
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/subscriptions/RefCountSubscription;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lrx/subscriptions/RefCountSubscription$a;

    .line 8
    .line 9
    iget-boolean v2, v1, Lrx/subscriptions/RefCountSubscription$a;->a:Z

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    invoke-virtual {v1}, Lrx/subscriptions/RefCountSubscription$a;->c()Lrx/subscriptions/RefCountSubscription$a;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v0, v1, v2}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Lrx/subscriptions/RefCountSubscription;->c(Lrx/subscriptions/RefCountSubscription$a;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
