.class public final Ll/jwg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile i:Ll/jwg0;


# instance fields
.field public final a:Ll/ieg0;

.field public final b:Ll/d0h0;

.field public final c:Ll/agg0;

.field public final d:Ll/pog0;

.field public final e:Ll/zqg0;

.field public final f:Ll/qhg0;

.field public final g:Ll/nmg0;

.field public final h:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/ieg0;Ll/d0h0;Ll/agg0;Ll/pog0;Ll/zqg0;Ll/qhg0;Ll/nmg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jwg0;->h:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jwg0;->a:Ll/ieg0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jwg0;->b:Ll/d0h0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jwg0;->c:Ll/agg0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/jwg0;->d:Ll/pog0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/jwg0;->e:Ll/zqg0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/jwg0;->f:Ll/qhg0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/jwg0;->g:Ll/nmg0;

    .line 19
    .line 20
    :try_start_0
    const-class p0, Ll/agg0;

    .line 21
    .line 22
    const-string p1, "createRemitSelf"

    .line 23
    .line 24
    const/4 p3, 0x0

    .line 25
    invoke-virtual {p0, p1, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p4, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/ehg0;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    move-object p4, p0

    .line 36
    :catch_0
    invoke-static {p4}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    iput-object p4, p2, Ll/ieg0;->i:Ll/ehg0;

    .line 40
    .line 41
    return-void
.end method

.method public static a()Ll/jwg0;
    .locals 11

    .line 1
    sget-object v0, Ll/jwg0;->i:Ll/jwg0;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const-class v1, Ll/jwg0;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    sget-object v0, Ll/jwg0;->i:Ll/jwg0;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    sget-object v0, LSudif/Sudtry;->Suddo:Landroid/content/Context;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    new-instance v4, Ll/ieg0;

    .line 21
    .line 22
    invoke-direct {v4}, Ll/ieg0;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v5, Ll/d0h0;

    .line 26
    .line 27
    invoke-direct {v5}, Ll/d0h0;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v6, Ll/agg0;

    .line 31
    .line 32
    invoke-direct {v6, v3}, Ll/agg0;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    new-instance v7, Ll/pog0;

    .line 36
    .line 37
    invoke-direct {v7}, Ll/pog0;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v8, Ll/zqg0;

    .line 41
    .line 42
    invoke-direct {v8}, Ll/zqg0;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v9, Ll/qhg0;

    .line 46
    .line 47
    invoke-direct {v9}, Ll/qhg0;-><init>()V

    .line 48
    .line 49
    .line 50
    new-instance v10, Ll/nmg0;

    .line 51
    .line 52
    invoke-direct {v10}, Ll/nmg0;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v2, Ll/jwg0;

    .line 56
    .line 57
    invoke-direct/range {v2 .. v10}, Ll/jwg0;-><init>(Landroid/content/Context;Ll/ieg0;Ll/d0h0;Ll/agg0;Ll/pog0;Ll/zqg0;Ll/qhg0;Ll/nmg0;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v6}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    invoke-static {v7}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    sput-object v2, Ll/jwg0;->i:Ll/jwg0;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 72
    .line 73
    const-string v2, "context == null"

    .line 74
    .line 75
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw v0

    .line 79
    :cond_1
    :goto_0
    monitor-exit v1

    .line 80
    goto :goto_2

    .line 81
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw v0

    .line 83
    :cond_2
    :goto_2
    sget-object v0, Ll/jwg0;->i:Ll/jwg0;

    .line 84
    .line 85
    return-object v0
.end method
