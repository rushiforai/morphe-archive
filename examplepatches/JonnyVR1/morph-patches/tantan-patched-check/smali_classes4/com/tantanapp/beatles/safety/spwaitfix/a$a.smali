.class public Lcom/tantanapp/beatles/safety/spwaitfix/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/safety/spwaitfix/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/reflect/Field;

.field public d:Landroid/os/Looper;


# direct methods
.method public constructor <init>()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SoonBlockedPrivateApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->a:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->b:Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    const-string v2, "android.app.QueuedWork"

    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "getHandler"

    .line 18
    .line 19
    invoke-virtual {v2, v3, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Landroid/os/Handler;

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iput-object v3, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->d:Landroid/os/Looper;

    .line 37
    .line 38
    const-string v3, "sWork"

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iput-object v3, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->c:Ljava/lang/reflect/Field;

    .line 45
    .line 46
    invoke-virtual {v3, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 47
    .line 48
    .line 49
    const-string v3, "sLock"

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->b:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    return-void

    .line 65
    :catch_0
    iput-boolean v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->a:Z

    .line 66
    .line 67
    return-void
.end method

.method public static synthetic b(Lcom/tantanapp/beatles/safety/spwaitfix/a$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->b:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->c:Ljava/lang/reflect/Field;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/util/LinkedList;

    .line 17
    .line 18
    new-instance v3, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->d:Landroid/os/Looper;

    .line 21
    .line 22
    invoke-direct {v3, v1, v4, p0}, Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork;-><init>(Ljava/util/LinkedList;Landroid/os/Looper;Lcom/tantanapp/beatles/safety/spwaitfix/ProxySWork$b;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->c:Ljava/lang/reflect/Field;

    .line 26
    .line 27
    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :catch_0
    const/4 v1, 0x1

    .line 34
    :try_start_1
    iput-boolean v1, p0, Lcom/tantanapp/beatles/safety/spwaitfix/a$a;->a:Z

    .line 35
    .line 36
    :goto_0
    monitor-exit v0

    .line 37
    :goto_1
    return-void

    .line 38
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw p0
.end method
