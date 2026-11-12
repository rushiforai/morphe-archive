.class public abstract Lngh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lr16;

.field public static final b:Ljava/lang/reflect/Method;

.field public static final c:Ljava/lang/reflect/Method;

.field public static final d:Ljava/util/concurrent/ConcurrentLinkedQueue;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lr16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lngh;->a:Lr16;

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const/4 v0, 0x0

    :try_start_f
    const-string v1, "android.app.QueuedWork"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-instance v2, Landroid/util/Pair;

    const-string v3, "add"

    const-string v4, "remove"

    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Landroid/util/Pair;

    const-string v4, "addFinisher"

    const-string v5, "removeFinisher"

    invoke-direct {v3, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v2}, [Landroid/util/Pair;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :catch_33
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_64

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_3f} :catch_78

    :try_start_3f
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    const-class v5, Ljava/lang/Runnable;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v1, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lngh;->b:Ljava/lang/reflect/Method;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lngh;->c:Ljava/lang/reflect/Method;

    invoke-virtual {v3, v6}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_64
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3f .. :try_end_64} :catch_33
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_64} :catch_78

    :cond_64
    :try_start_64
    sget-object v1, Lngh;->b:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_6c

    sget-object v1, Lngh;->c:Ljava/lang/reflect/Method;

    if-nez v1, :cond_80

    :cond_6c
    sput-object v0, Lngh;->b:Ljava/lang/reflect/Method;

    sput-object v0, Lngh;->c:Ljava/lang/reflect/Method;

    const-string v1, "QWW"

    const-string v2, "Missing method"

    invoke-static {v1, v2}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_77} :catch_78

    goto :goto_80

    :catch_78
    move-exception v1

    invoke-static {v1}, Lks3;->D(Ljava/lang/Throwable;)V

    sput-object v0, Lngh;->b:Ljava/lang/reflect/Method;

    sput-object v0, Lngh;->c:Ljava/lang/reflect/Method;

    :cond_80
    :goto_80
    return-void
.end method
