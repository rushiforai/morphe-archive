.class public final Le/e/a/CommentContinuity118;
.super Ljava/lang/Object;
.source "CommentContinuity118.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CommentContinuity118$Model;
    }
.end annotation


# static fields
.field static final FIELDS:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            ">;>;"
        }
    .end annotation
.end field

.field static final GENERATIONS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field static final MODELS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/CommentContinuity118$Model;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentContinuity118;->MODELS:Ljava/util/WeakHashMap;

    .line 7
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentContinuity118;->GENERATIONS:Ljava/util/WeakHashMap;

    .line 8
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Le/e/a/CommentContinuity118;->FIELDS:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9

    .line 9
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    :try_start_4
    sget-object v1, Le/e/a/CommentContinuity118;->FIELDS:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_3d

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_21
    if-lt v4, v3, :cond_2d

    sget-object v2, Le/e/a/CommentContinuity118;->FIELDS:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3d

    :cond_2d
    aget-object v5, v2, v4

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    :cond_3d
    :goto_3d
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/reflect/Field;

    if-nez p1, :cond_46

    goto :goto_4a

    :cond_46
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4a} :catch_4b

    :goto_4a
    return-object v0

    :catch_4b
    move-exception p0

    return-object v0
.end method

.method static key(Ljava/lang/Object;)Ljava/lang/String;
    .registers 18

    .line 10
    move-object/from16 v0, p0

    sget-object v1, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_c

    return-object v2

    :cond_c
    const-string v3, "no"

    invoke-static {v1, v3}, Le/e/a/CommentContinuity118;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Ljava/lang/Number;

    if-eqz v5, :cond_6c

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    if-gtz v4, :cond_1f

    goto :goto_6c

    :cond_1f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "thread"

    const-string v5, "fork"

    const-string v6, "video"

    filled-new-array {v6, v2, v5, v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move v2, v5

    :goto_30
    const/4 v6, 0x4

    if-lt v2, v6, :cond_60

    const-string v15, "l"

    const-string v16, "o"

    const-string v7, "a"

    const-string v8, "b"

    const-string v9, "c"

    const-string v10, "d"

    const-string v11, "f"

    const-string v12, "h"

    const-string v13, "i"

    const-string v14, "j"

    filled-new-array/range {v7 .. v16}, [Ljava/lang/String;

    move-result-object v6

    :goto_4b
    const/16 v1, 0xa

    if-lt v5, v1, :cond_54

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_54
    aget-object v1, v6, v5

    invoke-static {v0, v1}, Le/e/a/CommentContinuity118;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v4, v1}, Le/e/a/CommentContinuity118;->part(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_4b

    :cond_60
    aget-object v6, v3, v2

    invoke-static {v1, v6}, Le/e/a/CommentContinuity118;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v6}, Le/e/a/CommentContinuity118;->part(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_30

    :cond_6c
    :goto_6c
    return-object v2
.end method

.method public static merge(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "*>;)",
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation

    .line 12
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    sget-object v1, Le/e/a/CommentContinuity118;->MODELS:Ljava/util/WeakHashMap;

    monitor-enter v1

    :try_start_7
    sget-object v2, Le/e/a/CommentContinuity118;->MODELS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/CommentContinuity118$Model;

    if-nez v2, :cond_1b

    new-instance v2, Le/e/a/CommentContinuity118$Model;

    invoke-direct {v2}, Le/e/a/CommentContinuity118$Model;-><init>()V

    sget-object v3, Le/e/a/CommentContinuity118;->MODELS:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1b
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_7 .. :try_end_1c} :catchall_75

    monitor-enter v2

    :try_start_1d
    iget-object p0, v2, Le/e/a/CommentContinuity118$Model;->comments:Ljava/util/Map;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_31
    :goto_31
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3b

    iput-object v1, v2, Le/e/a/CommentContinuity118$Model;->comments:Ljava/util/Map;

    monitor-exit v2

    return-object v3

    :cond_3b
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Le/e/a/CommentContinuity118;->key(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_47

    move-object v6, v0

    goto :goto_4b

    :cond_47
    invoke-interface {p0, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    :goto_4b
    if-nez v6, :cond_4f

    move-object v7, v4

    goto :goto_50

    :cond_4f
    move-object v7, v6

    :goto_50
    if-eqz v6, :cond_61

    sget-object v8, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/CommentListExtras$Meta;

    if-eqz v4, :cond_61

    sget-object v8, Le/e/a/CommentListExtras;->meta:Ljava/util/Map;

    invoke-interface {v8, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_61
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v5, :cond_31

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    const/16 v6, 0x3a98

    if-ge v4, v6, :cond_31

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_31

    :catchall_72
    move-exception p0

    monitor-exit v2
    :try_end_74
    .catchall {:try_start_1d .. :try_end_74} :catchall_72

    throw p0

    :catchall_75
    move-exception p0

    :try_start_76
    monitor-exit v1
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_75

    throw p0
.end method

.method static part(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 3

    .line 11
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static refresh(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    const-string v0, "t"

    invoke-static {p0, v0}, Le/e/a/CommentContinuity118;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Thread;

    if-eqz v1, :cond_21

    check-cast v0, Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_21

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "u"

    invoke-static {p0, v1}, Le/e/a/CommentContinuity118;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    return-void

    :cond_21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static reset(Ljava/lang/Object;)Z
    .registers 6

    .line 14
    invoke-static {p0}, Le/e/a/CommentMotion;->generation(Ljava/lang/Object;)J

    move-result-wide v0

    sget-object v2, Le/e/a/CommentContinuity118;->GENERATIONS:Ljava/util/WeakHashMap;

    monitor-enter v2

    :try_start_7
    sget-object v3, Le/e/a/CommentContinuity118;->GENERATIONS:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    if-eqz p0, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long p0, v3, v0

    if-nez p0, :cond_1f

    const/4 p0, 0x0

    goto :goto_20

    :cond_1f
    const/4 p0, 0x1

    :goto_20
    monitor-exit v2

    return p0

    :catchall_22
    move-exception p0

    monitor-exit v2
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_22

    throw p0
.end method
