.class public final Le/e/a/CastDiagnostics;
.super Ljava/lang/Object;
.source "CastDiagnostics.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static connected()V
    .registers 1

    .line 24
    const-string v0, "Cast: Google API connection established; launching legacy receiver"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static discovery()V
    .registers 1

    .line 23
    const-string v0, "Cast: discovery started for legacy receiver FAB5A9D8"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$sent$0(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p0, "result"    # Ljava/lang/Class;
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 16
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_39

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hashCode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_1f
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "equals"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    aget-object v0, p3, v3

    if-ne p1, v0, :cond_30

    goto :goto_31

    :cond_30
    const/4 v2, 0x0

    :goto_31
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_36
    const-string v0, "Cast send observer"

    return-object v0

    .line 17
    :cond_39
    if-eqz p3, :cond_6f

    array-length v0, p3

    if-ne v0, v2, :cond_6f

    :try_start_3e
    const-string v0, "j"

    new-array v1, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    aget-object v1, p3, v3

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "status":Ljava/lang/Object;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cast: load message result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V
    :try_end_68
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_3e .. :try_end_68} :catch_69

    .end local v0    # "status":Ljava/lang/Object;
    goto :goto_6f

    :catch_69
    move-exception v0

    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    const-string v1, "Cast: send result unavailable"

    invoke-static {v1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 18
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :cond_6f
    :goto_6f
    const/4 v0, 0x0

    return-object v0
.end method

.method public static receiverResult(Ljava/lang/Object;)V
    .registers 3
    .param p0, "status"    # Ljava/lang/Object;

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cast: receiver launch result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method static record(Ljava/lang/String;)V
    .registers 7
    .param p0, "message"    # Ljava/lang/String;

    .line 7
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    .line 8
    :catch_1d
    move-exception v0

    :goto_1e
    nop

    .line 9
    return-void
.end method

.method public static sent(Ljava/lang/Object;)V
    .registers 9
    .param p0, "pending"    # Ljava/lang/Object;

    .line 11
    const-string v0, "Cast: load message submitted"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 12
    if-nez p0, :cond_d

    const-string v0, "Cast: no send result returned"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void

    .line 14
    :cond_d
    :try_start_d
    const-string v0, "e.d.b.b.e.k.k"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .local v0, "callback":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "e.d.b.b.e.k.j"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 15
    .local v1, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    new-instance v6, Le/e/a/CastDiagnostics$0;

    invoke-direct {v6, v1}, Le/e/a/CastDiagnostics$0;-><init>(Ljava/lang/Class;)V

    invoke-static {v2, v4, v6}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v2

    .line 20
    .local v2, "listener":Ljava/lang/Object;
    const-string v4, "e.d.b.b.e.k.g"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v6, "a"

    new-array v7, v3, [Ljava/lang/Class;

    aput-object v0, v7, v5

    invoke-virtual {v4, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v5

    invoke-virtual {v4, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_43
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_d .. :try_end_43} :catch_45

    .line 21
    nop

    .end local v0    # "callback":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "listener":Ljava/lang/Object;
    goto :goto_64

    :catch_45
    move-exception v0

    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cast: send observer unavailable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 22
    .end local v0    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_64
    return-void
.end method

.method public static stream(Ljava/lang/String;)V
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .line 27
    if-nez p0, :cond_8

    const-string v0, "Cast: stream acquisition failed"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void

    .line 29
    :cond_8
    :try_start_8
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_11} :catch_12

    .line 30
    .local v0, "path":Ljava/lang/String;
    goto :goto_15

    .end local v0    # "path":Ljava/lang/String;
    :catch_12
    move-exception v0

    .local v0, "ignored":Ljava/net/MalformedURLException;
    move-object v1, p0

    move-object v0, v1

    .line 31
    .local v0, "path":Ljava/lang/String;
    :goto_15
    const-string v1, ".m3u8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_20

    const-string v1, "Cast: HLS stream acquired; preparing authenticated relay"

    goto :goto_22

    :cond_20
    const-string v1, "Cast: stream reached legacy relay"

    :goto_22
    invoke-static {v1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 32
    return-void
.end method
