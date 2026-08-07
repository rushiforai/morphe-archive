.class public final Ll/fo50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fo50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fo50$a$c;,
        Ll/fo50$a$a;,
        Ll/fo50$a$d;,
        Ll/fo50$a$b;
    }
.end annotation


# instance fields
.field public final a:Lrx/subscriptions/RefCountSubscription;

.field public final b:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final c:Ll/ft5;

.field public final d:Ljava/lang/Object;

.field public e:I

.field public f:I

.field public final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ll/bb50<",
            "TT2;>;>;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "TT2;>;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Z

.field public final synthetic k:Ll/fo50;


# direct methods
.method public constructor <init>(Ll/fo50;Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fo50$a;->k:Ll/fo50;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/Object;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 12
    .line 13
    new-instance p1, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/fo50$a;->g:Ljava/util/Map;

    .line 19
    .line 20
    new-instance p1, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/fo50$a;->h:Ljava/util/Map;

    .line 26
    .line 27
    iput-object p2, p0, Ll/fo50$a;->b:Ll/gcg0;

    .line 28
    .line 29
    new-instance p1, Ll/ft5;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/fo50$a;->c:Ll/ft5;

    .line 35
    .line 36
    new-instance p2, Lrx/subscriptions/RefCountSubscription;

    .line 37
    .line 38
    invoke-direct {p2, p1}, Lrx/subscriptions/RefCountSubscription;-><init>(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    iput-object p2, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/bb50<",
            "TT2;>;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/bb50;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Ll/fo50$a;->b:Ll/gcg0;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 29
    .line 30
    invoke-virtual {p0}, Lrx/subscriptions/RefCountSubscription;->unsubscribe()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v2, p0, Ll/fo50$a;->g:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/fo50$a;->g:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ll/fo50$a;->h:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 23
    .line 24
    .line 25
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/bb50;

    .line 41
    .line 42
    invoke-interface {v1, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/fo50$a;->b:Ll/gcg0;

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 52
    .line 53
    invoke-virtual {p0}, Lrx/subscriptions/RefCountSubscription;->unsubscribe()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw p0
.end method

.method public c(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fo50$a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/fo50$a;->g:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/fo50$a;->h:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 12
    .line 13
    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    iget-object v0, p0, Ll/fo50$a;->b:Ll/gcg0;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 21
    .line 22
    invoke-virtual {p0}, Lrx/subscriptions/RefCountSubscription;->unsubscribe()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0
.end method

.method public d()V
    .locals 3

    .line 1
    new-instance v0, Ll/fo50$a$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fo50$a$b;-><init>(Ll/fo50$a;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/fo50$a$d;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/fo50$a$d;-><init>(Ll/fo50$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/fo50$a;->c:Ll/ft5;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/fo50$a;->c:Ll/ft5;

    .line 17
    .line 18
    invoke-virtual {v2, v1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/fo50$a;->k:Ll/fo50;

    .line 22
    .line 23
    iget-object v2, v2, Ll/fo50;->a:Lrx/c;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/fo50$a;->k:Ll/fo50;

    .line 29
    .line 30
    iget-object p0, p0, Ll/fo50;->b:Lrx/c;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subscriptions/RefCountSubscription;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fo50$a;->a:Lrx/subscriptions/RefCountSubscription;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subscriptions/RefCountSubscription;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
