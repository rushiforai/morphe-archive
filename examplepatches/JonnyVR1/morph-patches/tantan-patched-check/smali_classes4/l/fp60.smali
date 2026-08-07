.class public Ll/fp60;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fp60$a;
    }
.end annotation


# static fields
.field public static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/fj1;",
            ">;"
        }
    .end annotation
.end field

.field public static e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/fp60$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/fp60;->b:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/fp60;->c:Lrx/subjects/b;

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/fp60;->d:Lrx/subjects/b;

    .line 18
    .line 19
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/fp60;->e:Lrx/subjects/b;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/Data;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "signing"

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 51
    .line 52
    const-string v0, "success"

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    return-object p0
.end method

.method public static B()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/fp60$a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/fp60;->e:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static C(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/kcg0;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 30
    .line 31
    .line 32
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public static D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bp60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static E()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/fp60;->c:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {}, Ll/fp60;->G()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lrx/c;->mergeWith(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static F()V
    .locals 3

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget-object v2, Ll/fp60;->a:Ljava/util/Map;

    .line 30
    .line 31
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/kcg0;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    invoke-interface {v1}, Ll/kcg0;->isUnsubscribed()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    invoke-interface {v1}, Ll/kcg0;->unsubscribe()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public static G()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/fp60;->b:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static H(Ljava/lang/String;Ll/fj1;)V
    .locals 5

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/kcg0;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    const-wide/16 v0, 0x5

    .line 40
    .line 41
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 42
    .line 43
    const-wide/16 v3, 0x2

    .line 44
    .line 45
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x6

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/eo60;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/eo60;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/po60;

    .line 76
    .line 77
    invoke-direct {v1, p1}, Ll/po60;-><init>(Ll/fj1;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/xo60;

    .line 85
    .line 86
    invoke-direct {v1, p1}, Ll/xo60;-><init>(Ll/fj1;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static I(Ljava/lang/String;Ll/fj1;)V
    .locals 5

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/kcg0;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 32
    .line 33
    .line 34
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 35
    .line 36
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    const-wide/16 v0, 0x5

    .line 40
    .line 41
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 42
    .line 43
    const-wide/16 v3, 0x2

    .line 44
    .line 45
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x5

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/so60;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/so60;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/to60;

    .line 76
    .line 77
    invoke-direct {v1, p1}, Ll/to60;-><init>(Ll/fj1;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/uo60;

    .line 85
    .line 86
    invoke-direct {v1, p1}, Ll/uo60;-><init>(Ll/fj1;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 102
    .line 103
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static J(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ILjava/lang/Object;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->contractId:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "contract_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Ll/ko60;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/ko60;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/4 v3, 0x1

    .line 31
    invoke-virtual {v2, v3}, Lrx/c;->skip(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, v3}, Lrx/c;->take(I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ll/lo60;

    .line 40
    .line 41
    invoke-direct {v3, p3}, Ll/lo60;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    new-instance v2, Ll/mo60;

    .line 49
    .line 50
    invoke-direct {v2, v0}, Ll/mo60;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    new-instance v0, Ll/no60;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/no60;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p3, v0}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    new-instance v0, Ll/oo60;

    .line 67
    .line 68
    invoke-direct {v0, v1}, Ll/oo60;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3, v0}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p3}, Lrx/c;->last()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    new-instance v0, Ll/qo60;

    .line 80
    .line 81
    invoke-direct {v0, p1, p0, p2, p4}, Ll/qo60;-><init>(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Ll/ro60;

    .line 85
    .line 86
    invoke-direct {p0, v1}, Ll/ro60;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 98
    .line 99
    if-nez p1, :cond_0

    .line 100
    .line 101
    new-instance p1, Ljava/util/HashMap;

    .line 102
    .line 103
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 104
    .line 105
    .line 106
    sput-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ll/kcg0;

    .line 114
    .line 115
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_2

    .line 120
    .line 121
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-nez p2, :cond_1

    .line 126
    .line 127
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 128
    .line 129
    .line 130
    :cond_1
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 131
    .line 132
    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    :cond_2
    :goto_0
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 136
    .line 137
    invoke-interface {p1, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public static K(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 6

    .line 1
    new-instance v0, Ll/hp60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/hp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v1, 0x5

    .line 8
    .line 9
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    const-wide/16 v4, 0x1

    .line 12
    .line 13
    invoke-static {v4, v5, v1, v2, v3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x6

    .line 18
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0}, Ll/hp60;->a()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    new-instance v3, Ll/yo60;

    .line 27
    .line 28
    invoke-direct {v3, p0, p1}, Ll/yo60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p1, Ll/zo60;

    .line 48
    .line 49
    invoke-direct {p1, v0}, Ll/zo60;-><init>(Ll/hp60;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance p1, Ll/ap60;

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ll/ap60;-><init>(Ll/hp60;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static L(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;Ljava/lang/Object;Z)V
    .locals 7

    .line 1
    new-instance v4, Ll/hp60;

    .line 2
    .line 3
    invoke-direct {v4, p0, p1}, Ll/hp60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/mdf0;)V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    const/16 p1, 0x1f4

    .line 9
    .line 10
    const/16 p3, 0xbb8

    .line 11
    .line 12
    const/4 v0, 0x7

    .line 13
    :goto_0
    move v1, p1

    .line 14
    move v2, p3

    .line 15
    move v3, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v0, 0x6

    .line 18
    const/16 p3, 0x1388

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    goto :goto_0

    .line 22
    :goto_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p3, Ll/dp60;

    .line 27
    .line 28
    invoke-direct {p3}, Ll/dp60;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 p3, 0x1

    .line 36
    invoke-virtual {p1, p3}, Lrx/c;->skip(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, p3}, Lrx/c;->take(I)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/ep60;

    .line 45
    .line 46
    move-object v5, p0

    .line 47
    move-object v6, p2

    .line 48
    invoke-direct/range {v0 .. v6}, Ll/ep60;-><init>(IIILl/hp60;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ll/fo60;

    .line 56
    .line 57
    invoke-direct {p1, v4}, Ll/fo60;-><init>(Ll/hp60;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/go60;

    .line 65
    .line 66
    invoke-direct {p1, v4}, Ll/go60;-><init>(Ll/hp60;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 82
    .line 83
    if-nez p1, :cond_1

    .line 84
    .line 85
    new-instance p1, Ljava/util/HashMap;

    .line 86
    .line 87
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 88
    .line 89
    .line 90
    sput-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_1
    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Ll/kcg0;

    .line 98
    .line 99
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_2

    .line 104
    .line 105
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-nez p2, :cond_2

    .line 110
    .line 111
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 112
    .line 113
    .line 114
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 115
    .line 116
    invoke-interface {p1, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    :cond_2
    :goto_2
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 120
    .line 121
    invoke-interface {p1, v5, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->K4()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_5

    .line 137
    .line 138
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 139
    .line 140
    if-eq v5, p0, :cond_3

    .line 141
    .line 142
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 143
    .line 144
    if-ne v5, p0, :cond_5

    .line 145
    .line 146
    :cond_3
    sget-object p0, Ll/fp60;->a:Ljava/util/Map;

    .line 147
    .line 148
    const-string p1, "querymerchandise"

    .line 149
    .line 150
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Ll/kcg0;

    .line 155
    .line 156
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    if-eqz p2, :cond_4

    .line 161
    .line 162
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    if-nez p2, :cond_4

    .line 167
    .line 168
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 169
    .line 170
    .line 171
    sget-object p0, Ll/fp60;->a:Ljava/util/Map;

    .line 172
    .line 173
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    :cond_4
    sget-object p0, Ll/fp60;->a:Ljava/util/Map;

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    new-instance v0, Ll/dj20;

    .line 183
    .line 184
    invoke-direct {v0}, Ll/dj20;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object p2

    .line 191
    invoke-virtual {p2, p3}, Lrx/c;->skip(I)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    const-wide/16 v0, 0x5

    .line 200
    .line 201
    sget-object p3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 202
    .line 203
    invoke-virtual {p2, v0, v1, p3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    new-instance p3, Ll/ho60;

    .line 208
    .line 209
    invoke-direct {p3}, Ll/ho60;-><init>()V

    .line 210
    .line 211
    .line 212
    new-instance v0, Ll/io60;

    .line 213
    .line 214
    invoke-direct {v0}, Ll/io60;-><init>()V

    .line 215
    .line 216
    .line 217
    new-instance v1, Ll/jo60;

    .line 218
    .line 219
    invoke-direct {v1}, Ll/jo60;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-static {p3, v0, v1}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 223
    .line 224
    .line 225
    move-result-object p3

    .line 226
    invoke-virtual {p2, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    :cond_5
    return-void
.end method

.method public static synthetic a(Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/PaymentOrder;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->r3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/wo60;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/wo60;-><init>(Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/PaymentOrder;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ll/hp60;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hp60;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic f(Ll/fj1;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/bn60;->N()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fj1;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    invoke-static {p0}, Ll/xl60;->B(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->zk()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic h(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ll/fp60;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;Ll/uxj0;)Ll/uxj0;
    .locals 2

    .line 1
    sget-object v0, Ll/fp60;->c:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-object p2
.end method

.method public static synthetic j(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v0, "querymerchandise"

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(IIILl/hp60;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;Lcom/p1/mobile/android/app/Act$r;)Lrx/c;
    .locals 2

    .line 1
    int-to-long v0, p0

    .line 2
    int-to-long p0, p1

    .line 3
    sget-object p6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-static {v0, v1, p0, p1, p6}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p2}, Lrx/c;->take(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p3}, Ll/hp60;->a()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/vo60;

    .line 22
    .line 23
    invoke-direct {p2, p4, p5}, Ll/vo60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic l(Ll/hp60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hp60;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/hp60;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hp60;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ll/fj1;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fj1;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xl60;->B(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->B3()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic o()V
    .locals 2

    .line 1
    sget-object v0, Ll/fp60;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "querymerchandise"

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(ILcom/p1/mobile/android/app/Act$r;)Lrx/c;
    .locals 4

    .line 1
    const-wide/16 v0, 0x5

    .line 2
    .line 3
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    const-wide/16 v2, 0x2

    .line 6
    .line 7
    invoke-static {v2, v3, v0, v1, p1}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->M5(Z)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/fp60;->c:Lrx/subjects/b;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic s(Ll/hp60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hp60;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->o3(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/cp60;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/cp60;-><init>(Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic u(Ll/fj1;Ll/pf60;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v2, "success"

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "failed"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const-string v0, "pending"

    .line 30
    .line 31
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 v0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p1, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    const-wide/16 v5, 0x5

    .line 51
    .line 52
    cmp-long p1, v3, v5

    .line 53
    .line 54
    if-nez p1, :cond_4

    .line 55
    .line 56
    :cond_2
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    iget-object p1, p0, Ll/fj1;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 63
    .line 64
    iget-object p0, p0, Ll/fj1;->e:Ljava/lang/Object;

    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/fp60;->D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    sget-object p1, Ll/fp60;->d:Lrx/subjects/b;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic w(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->H5(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;Ll/uxj0;)Ll/uxj0;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 8
    .line 9
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 28
    .line 29
    .line 30
    :cond_0
    sget-object p0, Ll/fp60;->b:Lrx/subjects/b;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object p2
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/data/SignPaymentParam;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Data;)V
    .locals 12

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 14
    .line 15
    const-string v3, "signing"

    .line 16
    .line 17
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/data/SignPaymentParam;->delayCharge:Z

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    :cond_0
    :goto_0
    move v10, v4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 60
    .line 61
    const-string v5, "success"

    .line 62
    .line 63
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v10, v3

    .line 71
    :goto_1
    sget-object v2, Ll/fp60;->e:Lrx/subjects/b;

    .line 72
    .line 73
    new-instance v4, Ll/fp60$a;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 80
    .line 81
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 88
    .line 89
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_3

    .line 96
    .line 97
    const/4 v0, 0x0

    .line 98
    :goto_2
    move-object v8, p0

    .line 99
    move-object v5, p1

    .line 100
    move-object v9, p2

    .line 101
    move-object v11, p3

    .line 102
    move-object v7, v0

    .line 103
    goto :goto_3

    .line 104
    :cond_3
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :goto_3
    invoke-direct/range {v4 .. v11}, Ll/fp60$a;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/Contract;Lcom/p1/mobile/putong/core/data/PaymentOrder;Lcom/p1/mobile/putong/data/PaymentParam;Lcom/p1/mobile/putong/core/data/Privilege;ZLjava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v4}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static synthetic z(Ll/fj1;Ll/pf60;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-wide/16 v2, 0x4

    .line 10
    .line 11
    if-eqz v1, :cond_5

    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v4, "success"

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const-string v0, "failed"

    .line 30
    .line 31
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    const-string v0, "pending"

    .line 38
    .line 39
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    :cond_0
    const/4 v0, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    :goto_0
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p1, Ljava/lang/Long;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    cmp-long p1, v5, v2

    .line 59
    .line 60
    if-nez p1, :cond_4

    .line 61
    .line 62
    :cond_2
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-static {}, Ll/bn60;->N()V

    .line 69
    .line 70
    .line 71
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->K7:I

    .line 72
    .line 73
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 74
    .line 75
    .line 76
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_4

    .line 81
    .line 82
    iget-object p1, p0, Ll/fj1;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 83
    .line 84
    iget-object p0, p0, Ll/fj1;->e:Ljava/lang/Object;

    .line 85
    .line 86
    invoke-static {p1, p0}, Ll/fp60;->D(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_4

    .line 95
    .line 96
    sget-object p1, Ll/fp60;->d:Lrx/subjects/b;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 107
    .line 108
    check-cast p1, Ljava/lang/Long;

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 111
    .line 112
    .line 113
    move-result-wide v0

    .line 114
    cmp-long p1, v0, v2

    .line 115
    .line 116
    if-nez p1, :cond_6

    .line 117
    .line 118
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_6

    .line 123
    .line 124
    sget-object p1, Ll/fp60;->d:Lrx/subjects/b;

    .line 125
    .line 126
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 130
    .line 131
    return-object p0

    .line 132
    :cond_6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 133
    .line 134
    return-object p0
.end method
