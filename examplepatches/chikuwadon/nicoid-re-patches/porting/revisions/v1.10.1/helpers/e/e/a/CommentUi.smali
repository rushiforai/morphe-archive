.class public final Le/e/a/CommentUi;
.super Ljava/lang/Object;
.source "CommentUi.java"


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final PENDING:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 11
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CommentUi;->MAIN:Landroid/os/Handler;

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentUi;->PENDING:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    invoke-static {p0, p1}, Le/e/a/CommentContinuity118;->merge(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {p0, p1}, Le/e/a/CastControls218;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-static {p0, p1}, Le/e/a/CastComments213;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-static {p0, p1}, Le/e/a/CommentGraph215;->publish(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 33
    new-instance v0, Le/e/a/CommentUi$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Le/e/a/CommentUi$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 54
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    if-ne p0, p1, :cond_20

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_25

    :cond_20
    sget-object p0, Le/e/a/CommentUi;->MAIN:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 55
    :goto_25
    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 59
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :goto_8
    if-nez v1, :cond_b

    .line 63
    return-object v0

    .line 60
    :cond_b
    :try_start_b
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_17
    .catch Ljava/lang/NoSuchFieldException; {:try_start_b .. :try_end_17} :catch_18

    return-object p0

    .line 61
    :catch_18
    move-exception v2

    .line 59
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_8
.end method

.method private static invoke(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    return-void
.end method

.method private static invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/util/ArrayList;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 68
    new-array v0, v1, [Ljava/lang/Object;

    aput-object p2, v0, v4

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 4

    .line 18
    :try_start_0
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 19
    const-string v1, "Z"

    invoke-static {p0, v1}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2a

    if-nez v0, :cond_13

    goto :goto_2a

    .line 20
    :cond_13
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1f

    sget-object p1, Le/e/a/CommentUi;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 21
    :cond_1f
    sget-object v0, Le/e/a/CommentUi;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    const-string v0, "bNative"

    invoke-static {p0, v0, p1}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 23
    goto :goto_38

    .line 19
    :cond_2a
    :goto_2a
    sget-object v0, Le/e/a/CommentUi;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    return-void

    .line 23
    :catch_30
    move-exception p0

    const-string p1, "nicoid-comments"

    const-string v0, "Comment list update failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    :goto_38
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 8

    .line 35
    const-string v0, "b"

    const-string v1, "nicoid-comments"

    :try_start_4
    const-string v2, "k"

    invoke-static {p0, v2}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 36
    invoke-static {p0, v0}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 37
    if-eqz v2, :cond_22

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "com.sauzask.nicoid.NicoidVideoFragment"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1e} :catch_6c

    if-eqz v4, :cond_22

    const/4 v4, 0x1

    goto :goto_23

    :cond_22
    const/4 v4, 0x0

    .line 38
    :goto_23
    const-string v5, "a"

    if-eqz v4, :cond_39

    .line 39
    if-nez v3, :cond_2f

    :try_start_29
    const-string v3, "g1"

    invoke-static {v2, v3}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 40
    :cond_2f
    if-eqz v3, :cond_35

    invoke-static {v3, v5, p1}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_60

    .line 41
    :cond_35
    invoke-static {v2, v0, p1}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_5f

    .line 42
    :cond_39
    if-eqz v3, :cond_5f

    .line 43
    invoke-static {v3, v5, p1}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 44
    const-string v0, "Popup comments applied to overlay"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    invoke-static {v3, v5}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 46
    if-eqz v0, :cond_60

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "e.e.a.u"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_60

    const-string v2, "e"

    invoke-static {v0}, Le/e/a/CommentContinuity118;->refresh(Ljava/lang/Object;)V

    goto :goto_60

    .line 42
    :cond_5f
    :goto_5f
    nop

    .line 48
    :cond_60
    :goto_60
    const-string v0, "c"

    invoke-static {p0, v0}, Le/e/a/CommentUi;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 49
    if-eqz p0, :cond_72

    invoke-static {p0, v5, p1}, Le/e/a/CommentUi;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_6b} :catch_6c

    .line 50
    goto :goto_72

    :catch_6c
    move-exception p0

    .line 51
    const-string p1, "Comment adapter update failed"

    invoke-static {v1, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    :cond_72
    :goto_72
    return-void
.end method

.method public static list(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    .line 15
    if-nez p1, :cond_8

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_e

    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, v0

    .line 16
    :goto_e
    new-instance v0, Le/e/a/CommentUi$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/CommentUi$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 25
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    if-ne p0, p1, :cond_21

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_26

    :cond_21
    sget-object p0, Le/e/a/CommentUi;->MAIN:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    :goto_26
    return-void
.end method

.method public static ready(Ljava/lang/Object;)V
    .registers 2

    .line 28
    sget-object v0, Le/e/a/CommentUi;->PENDING:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 29
    if-eqz v0, :cond_d

    invoke-static {p0, v0}, Le/e/a/CommentUi;->list(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 30
    :cond_d
    return-void
.end method
