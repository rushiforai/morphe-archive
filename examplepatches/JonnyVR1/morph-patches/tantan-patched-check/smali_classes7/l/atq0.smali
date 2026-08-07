.class Ll/atq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zsq0;
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/atq0$b;
    }
.end annotation


# static fields
.field private static final o:[[Ljava/lang/String;


# instance fields
.field private a:Ljava/lang/Class;

.field private b:Ljava/lang/Class;

.field private c:Ljava/lang/reflect/Method;

.field private d:Ljava/lang/reflect/Method;

.field private e:Ljava/lang/reflect/Method;

.field private f:Ljava/lang/reflect/Method;

.field private g:Ljava/lang/reflect/Method;

.field private h:Ljava/lang/reflect/Method;

.field private i:Ljava/lang/reflect/Method;

.field private j:Landroid/content/Context;

.field private final k:Ljava/lang/Object;

.field private volatile l:I

.field private volatile m:J

.field private volatile n:Ll/atq0$b;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "com.bun.supplier.IIdentifierListener"

    .line 2
    .line 3
    const-string v1, "com.bun.supplier.IdSupplier"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "com.bun.miitmdid.core.IIdentifierListener"

    .line 10
    .line 11
    const-string v2, "com.bun.miitmdid.supplier.IdSupplier"

    .line 12
    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v0, v1}, [[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/atq0;->o:[[Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/atq0;->a:Ljava/lang/Class;

    .line 6
    .line 7
    iput-object v0, p0, Ll/atq0;->b:Ljava/lang/Class;

    .line 8
    .line 9
    iput-object v0, p0, Ll/atq0;->c:Ljava/lang/reflect/Method;

    .line 10
    .line 11
    iput-object v0, p0, Ll/atq0;->d:Ljava/lang/reflect/Method;

    .line 12
    .line 13
    iput-object v0, p0, Ll/atq0;->e:Ljava/lang/reflect/Method;

    .line 14
    .line 15
    iput-object v0, p0, Ll/atq0;->f:Ljava/lang/reflect/Method;

    .line 16
    .line 17
    iput-object v0, p0, Ll/atq0;->g:Ljava/lang/reflect/Method;

    .line 18
    .line 19
    iput-object v0, p0, Ll/atq0;->h:Ljava/lang/reflect/Method;

    .line 20
    .line 21
    iput-object v0, p0, Ll/atq0;->i:Ljava/lang/reflect/Method;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput v1, p0, Ll/atq0;->l:I

    .line 32
    .line 33
    const-wide/16 v1, 0x0

    .line 34
    .line 35
    iput-wide v1, p0, Ll/atq0;->m:J

    .line 36
    .line 37
    iput-object v0, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/atq0;->j:Landroid/content/Context;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Ll/atq0;->e(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, p1}, Ll/atq0;->h(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 28
    :try_start_0
    invoke-static {p0, p1}, Ll/t5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static varargs b(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catchall_0
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private static varargs c(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method private d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p0
.end method

.method private e(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string v0, "com.bun.miitmdid.core.MdidSdk"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/atq0;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    move-object v3, v1

    .line 10
    move v4, v2

    .line 11
    :goto_0
    sget-object v5, Ll/atq0;->o:[[Ljava/lang/String;

    .line 12
    .line 13
    array-length v6, v5

    .line 14
    if-ge v4, v6, :cond_1

    .line 15
    .line 16
    aget-object v1, v5, v4

    .line 17
    .line 18
    aget-object v3, v1, v2

    .line 19
    .line 20
    invoke-static {p1, v3}, Ll/atq0;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v5, 0x1

    .line 25
    aget-object v1, v1, v5

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/atq0;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v3, :cond_0

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v5, "found class in index "

    .line 38
    .line 39
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ll/atq0;->i(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    move-object v7, v3

    .line 53
    move-object v3, v1

    .line 54
    move-object v1, v7

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 57
    .line 58
    move-object v7, v3

    .line 59
    move-object v3, v1

    .line 60
    move-object v1, v7

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :goto_1
    iput-object v0, p0, Ll/atq0;->a:Ljava/lang/Class;

    .line 63
    .line 64
    const-class p1, Landroid/content/Context;

    .line 65
    .line 66
    filled-new-array {p1, v1}, [Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const-string v4, "InitSdk"

    .line 71
    .line 72
    invoke-static {v0, v4, p1}, Ll/atq0;->c(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Ll/atq0;->c:Ljava/lang/reflect/Method;

    .line 77
    .line 78
    iput-object v1, p0, Ll/atq0;->b:Ljava/lang/Class;

    .line 79
    .line 80
    const-string p1, "getOAID"

    .line 81
    .line 82
    new-array v0, v2, [Ljava/lang/Class;

    .line 83
    .line 84
    invoke-static {v3, p1, v0}, Ll/atq0;->c(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Ll/atq0;->e:Ljava/lang/reflect/Method;

    .line 89
    .line 90
    const-string p1, "isSupported"

    .line 91
    .line 92
    new-array v0, v2, [Ljava/lang/Class;

    .line 93
    .line 94
    invoke-static {v3, p1, v0}, Ll/atq0;->c(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Ll/atq0;->h:Ljava/lang/reflect/Method;

    .line 99
    .line 100
    const-string p1, "shutDown"

    .line 101
    .line 102
    new-array v0, v2, [Ljava/lang/Class;

    .line 103
    .line 104
    invoke-static {v3, p1, v0}, Ll/atq0;->c(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Ll/atq0;->i:Ljava/lang/reflect/Method;

    .line 109
    .line 110
    return-void
.end method

.method private f(Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v0, "retry, current count is "

    .line 2
    .line 3
    iget-object v1, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_5

    .line 8
    .line 9
    :cond_0
    iget-wide v1, p0, Ll/atq0;->m:J

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v5

    .line 19
    sub-long/2addr v3, v5

    .line 20
    iget v5, p0, Ll/atq0;->l:I

    .line 21
    .line 22
    const-wide/16 v6, 0xbb8

    .line 23
    .line 24
    cmp-long v8, v3, v6

    .line 25
    .line 26
    if-lez v8, :cond_2

    .line 27
    .line 28
    const/4 v8, 0x3

    .line 29
    if-ge v5, v8, :cond_2

    .line 30
    .line 31
    iget-object v8, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter v8

    .line 34
    :try_start_0
    iget-wide v9, p0, Ll/atq0;->m:J

    .line 35
    .line 36
    cmp-long v9, v9, v1

    .line 37
    .line 38
    if-nez v9, :cond_1

    .line 39
    .line 40
    iget v9, p0, Ll/atq0;->l:I

    .line 41
    .line 42
    if-ne v9, v5, :cond_1

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Ll/atq0;->i(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Ll/atq0;->l:I

    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    iput v0, p0, Ll/atq0;->l:I

    .line 64
    .line 65
    iget-object v0, p0, Ll/atq0;->j:Landroid/content/Context;

    .line 66
    .line 67
    invoke-direct {p0, v0}, Ll/atq0;->h(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    iget-wide v1, p0, Ll/atq0;->m:J

    .line 71
    .line 72
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    .line 77
    .line 78
    .line 79
    move-result-wide v9

    .line 80
    sub-long/2addr v3, v9

    .line 81
    goto :goto_0

    .line 82
    :catchall_0
    move-exception p0

    .line 83
    goto :goto_1

    .line 84
    :cond_1
    :goto_0
    monitor-exit v8

    .line 85
    goto :goto_2

    .line 86
    :goto_1
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    throw p0

    .line 88
    :cond_2
    :goto_2
    iget-object v0, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 89
    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    const-wide/16 v8, 0x0

    .line 93
    .line 94
    cmp-long v0, v1, v8

    .line 95
    .line 96
    if-ltz v0, :cond_4

    .line 97
    .line 98
    cmp-long v0, v3, v6

    .line 99
    .line 100
    if-gtz v0, :cond_4

    .line 101
    .line 102
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    if-eq v0, v1, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 113
    .line 114
    monitor-enter v0

    .line 115
    :try_start_1
    iget-object v1, p0, Ll/atq0;->n:Ll/atq0$b;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 116
    .line 117
    if-nez v1, :cond_3

    .line 118
    .line 119
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string p1, " wait..."

    .line 128
    .line 129
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-static {p1}, Ll/atq0;->i(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Ll/atq0;->k:Ljava/lang/Object;

    .line 140
    .line 141
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :catchall_1
    move-exception p0

    .line 146
    goto :goto_4

    .line 147
    :catch_0
    :cond_3
    :goto_3
    :try_start_3
    monitor-exit v0

    .line 148
    goto :goto_5

    .line 149
    :goto_4
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 150
    throw p0

    .line 151
    :cond_4
    :goto_5
    return-void
.end method

.method private static g(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, Ljava/lang/Character;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p0, Ljava/lang/Byte;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    instance-of v0, p0, Ljava/lang/Short;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    instance-of v0, p0, Ljava/lang/Integer;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    instance-of v0, p0, Ljava/lang/Long;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    instance-of v0, p0, Ljava/lang/Float;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    instance-of p0, p0, Ljava/lang/Double;

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method private h(Landroid/content/Context;)V
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    neg-long v2, v0

    .line 6
    iget-object v4, p0, Ll/atq0;->b:Ljava/lang/Class;

    .line 7
    .line 8
    if-eqz v4, :cond_1

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    if-nez v4, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iget-object v5, p0, Ll/atq0;->b:Ljava/lang/Class;

    .line 24
    .line 25
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-static {v4, v5, p0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget-object v5, p0, Ll/atq0;->c:Ljava/lang/reflect/Method;

    .line 34
    .line 35
    iget-object v6, p0, Ll/atq0;->a:Ljava/lang/Class;

    .line 36
    .line 37
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array {p1, v4}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {v5, v6, p1}, Ll/atq0;->b(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v1, "call init sdk error:"

    .line 52
    .line 53
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ll/atq0;->i(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    move-wide v0, v2

    .line 67
    :goto_2
    iput-wide v0, p0, Ll/atq0;->m:J

    .line 68
    .line 69
    return-void
.end method

.method private static i(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "mdid:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .line 26
    const-string v0, "getOAID"

    invoke-direct {p0, v0}, Ll/atq0;->f(Ljava/lang/String;)V

    .line 27
    iget-object v0, p0, Ll/atq0;->n:Ll/atq0$b;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Ll/atq0;->n:Ll/atq0$b;

    iget-object p0, p0, Ll/atq0$b;->c:Ljava/lang/String;

    return-object p0
.end method

.method public a()Z
    .locals 1

    .line 1
    const-string v0, "isSupported"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/atq0;->f(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    iget-object p0, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 13
    .line 14
    iget-object p0, p0, Ll/atq0$b;->a:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iput-wide p1, p0, Ll/atq0;->m:J

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    if-eqz p3, :cond_4

    .line 9
    .line 10
    new-instance p2, Ll/atq0$b;

    .line 11
    .line 12
    invoke-direct {p2, p0, p1}, Ll/atq0$b;-><init>(Ll/atq0;Ll/atq0$a;)V

    .line 13
    .line 14
    .line 15
    array-length v0, p3

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    if-ge v2, v0, :cond_4

    .line 19
    .line 20
    aget-object v3, p3, v2

    .line 21
    .line 22
    if-eqz v3, :cond_3

    .line 23
    .line 24
    invoke-static {v3}, Ll/atq0;->g(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    goto :goto_3

    .line 31
    :cond_0
    iget-object v4, p0, Ll/atq0;->e:Ljava/lang/reflect/Method;

    .line 32
    .line 33
    new-array v5, v1, [Ljava/lang/Object;

    .line 34
    .line 35
    invoke-static {v4, v3, v5}, Ll/atq0;->b(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Ljava/lang/String;

    .line 40
    .line 41
    iput-object v4, p2, Ll/atq0$b;->c:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v4, p0, Ll/atq0;->h:Ljava/lang/reflect/Method;

    .line 44
    .line 45
    new-array v5, v1, [Ljava/lang/Object;

    .line 46
    .line 47
    invoke-static {v4, v3, v5}, Ll/atq0;->b(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ljava/lang/Boolean;

    .line 52
    .line 53
    iput-object v4, p2, Ll/atq0$b;->a:Ljava/lang/Boolean;

    .line 54
    .line 55
    iget-object v4, p0, Ll/atq0;->i:Ljava/lang/reflect/Method;

    .line 56
    .line 57
    new-array v5, v1, [Ljava/lang/Object;

    .line 58
    .line 59
    invoke-static {v4, v3, v5}, Ll/atq0;->b(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2}, Ll/atq0$b;->a()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_3

    .line 67
    .line 68
    new-instance p3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v0, "has get succ, check duplicate:"

    .line 71
    .line 72
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 76
    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    :cond_1
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    invoke-static {p3}, Ll/atq0;->i(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-class v3, Ll/atq0;

    .line 91
    .line 92
    monitor-enter v3

    .line 93
    :try_start_0
    iget-object p3, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 94
    .line 95
    if-nez p3, :cond_2

    .line 96
    .line 97
    iput-object p2, p0, Ll/atq0;->n:Ll/atq0$b;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catchall_0
    move-exception p0

    .line 101
    goto :goto_2

    .line 102
    :cond_2
    :goto_1
    monitor-exit v3

    .line 103
    goto :goto_4

    .line 104
    :goto_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    throw p0

    .line 106
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_4
    :goto_4
    invoke-direct {p0}, Ll/atq0;->d()V

    .line 110
    .line 111
    .line 112
    return-object p1
.end method
