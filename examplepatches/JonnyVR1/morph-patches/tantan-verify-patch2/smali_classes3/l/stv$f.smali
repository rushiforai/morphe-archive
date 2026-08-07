.class public Ll/stv$f;
.super Ll/stv$e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/stv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/stv$f$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/stv$e;-><init>(Ll/ttv;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ll/ttv;)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ll/stv$f;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ll/stv$c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/stv$e;->a(Landroid/content/Context;Ll/stv$c;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1, p2}, Ll/stv$f;->e(Ljava/lang/ClassLoader;Ll/stv$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final e(Ljava/lang/ClassLoader;Ll/stv$c;)V
    .locals 4

    .line 1
    const-string p0, "mInstance"

    .line 2
    .line 3
    :try_start_0
    const-class v0, Landroid/app/ActivityManager;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/String;)Lorg/joor/Reflect;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "IActivityManagerSingleton"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lorg/joor/Reflect;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/Object;)Lorg/joor/Reflect;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, p0}, Lorg/joor/Reflect;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    new-instance v2, Ll/stv$f$a;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-direct {v2, v1, p2, v3}, Ll/stv$f$a;-><init>(Ljava/lang/Object;Ll/stv$c;Ll/ttv;)V

    .line 35
    .line 36
    .line 37
    const-string p2, "android.app.IActivityManager"

    .line 38
    .line 39
    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    filled-new-array {p2}, [Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p1, p2, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v0}, Lorg/joor/Reflect;->on(Ljava/lang/Object;)Lorg/joor/Reflect;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2, p0, p1}, Lorg/joor/Reflect;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/joor/Reflect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    :catchall_0
    :cond_0
    return-void
.end method
