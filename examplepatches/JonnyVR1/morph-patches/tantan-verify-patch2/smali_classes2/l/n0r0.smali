.class public final Ll/n0r0;
.super Ljava/lang/Object;


# static fields
.field private static a:Landroid/content/Context;

.field private static b:Landroid/app/Application;

.field private static c:J

.field private static d:Z

.field private static e:Ll/ayq0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field private static f:Ll/ow5;

.field private static g:Ll/rrq0;

.field private static volatile h:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static i:Ll/o5r0;

.field private static volatile j:Ljava/lang/String;

.field private static k:Ljava/lang/Object;

.field private static volatile l:I

.field private static volatile m:Ljava/lang/String;

.field private static n:I

.field private static o:Z

.field private static p:Z

.field private static q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ow5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ow5;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/n0r0;->f:Ll/ow5;

    .line 7
    .line 8
    new-instance v0, Ll/rrq0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/rrq0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/n0r0;->g:Ll/rrq0;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-object v0, Ll/n0r0;->i:Ll/o5r0;

    .line 17
    .line 18
    sput-object v0, Ll/n0r0;->j:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/n0r0;->k:Ljava/lang/Object;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    sput v0, Ll/n0r0;->l:I

    .line 29
    .line 30
    sput v0, Ll/n0r0;->n:I

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    sput-boolean v1, Ll/n0r0;->o:Z

    .line 34
    .line 35
    sput-boolean v0, Ll/n0r0;->p:Z

    .line 36
    .line 37
    sput-boolean v1, Ll/n0r0;->q:Z

    .line 38
    .line 39
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

.method public static a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "_"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/apm/lite/CrashType;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const/16 p0, 0x5f

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, "normal_"

    .line 37
    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    const-string p2, "oom_"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move-object p2, p1

    .line 44
    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/n0r0;->l()J

    .line 48
    .line 49
    .line 50
    move-result-wide p2

    .line 51
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    if-eqz p4, :cond_1

    .line 58
    .line 59
    const-string p1, "ignore_"

    .line 60
    .line 61
    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    new-instance p0, Ljava/util/Random;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/Random;->nextLong()J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    invoke-static {p0, p1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p0, "G"

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0
.end method

.method public static b()Ll/ayq0;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->e:Ll/ayq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/n0r0;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Ll/q3r0;->a(Landroid/content/Context;)Ll/ayq0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/n0r0;->e:Ll/ayq0;

    .line 12
    .line 13
    :cond_0
    sget-object v0, Ll/n0r0;->e:Ll/ayq0;

    .line 14
    .line 15
    return-object v0
.end method

.method public static c(Landroid/app/Application;Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Ll/n0r0;->b:Landroid/app/Application;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    sput-wide v0, Ll/n0r0;->c:J

    .line 10
    .line 11
    sput-object p1, Ll/n0r0;->a:Landroid/content/Context;

    .line 12
    .line 13
    sput-object p0, Ll/n0r0;->b:Landroid/app/Application;

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ljava/util/Random;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/util/Random;->nextLong()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, "G"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sput-object p0, Ll/n0r0;->j:Ljava/lang/String;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public static d()Ll/rrq0;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->g:Ll/rrq0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ll/o5r0;
    .locals 3

    .line 1
    sget-object v0, Ll/n0r0;->i:Ll/o5r0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-class v0, Ll/n0r0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    new-instance v1, Ll/o5r0;

    .line 9
    .line 10
    sget-object v2, Ll/n0r0;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ll/o5r0;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    sput-object v1, Ll/n0r0;->i:Ll/o5r0;

    .line 16
    .line 17
    monitor-exit v0

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v1

    .line 22
    :cond_0
    :goto_0
    sget-object v0, Ll/n0r0;->i:Ll/o5r0;

    .line 23
    .line 24
    return-object v0
.end method

.method public static f()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ow5;->l()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/n0r0;->p()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "local_test"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static g()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const/16 v1, 0x5f

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    new-instance v1, Ljava/util/Random;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, "G"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    return-object v0
.end method

.method public static h()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Ll/n0r0;->j:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/n0r0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/n0r0;->j:Ljava/lang/String;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/util/Random;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/util/Random;->nextLong()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, "U"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sput-object v1, Ll/n0r0;->j:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception v1

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    monitor-exit v0

    .line 48
    goto :goto_2

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw v1

    .line 51
    :cond_1
    :goto_2
    sget-object v0, Ll/n0r0;->j:Ljava/lang/String;

    .line 52
    .line 53
    return-object v0
.end method

.method public static i()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static j()Landroid/app/Application;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->b:Landroid/app/Application;

    .line 2
    .line 3
    return-object v0
.end method

.method public static k()Ll/ow5;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->f:Ll/ow5;

    .line 2
    .line 3
    return-object v0
.end method

.method public static l()J
    .locals 2

    .line 1
    sget-wide v0, Ll/n0r0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static m()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    return-object v0
.end method

.method public static n()I
    .locals 1

    .line 1
    sget v0, Ll/n0r0;->n:I

    .line 2
    .line 3
    return v0
.end method

.method public static o()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/n0r0;->d:Z

    .line 2
    .line 3
    return v0
.end method

.method public static p()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ayq0;->b()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "channel"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "unknown"

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static q()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/n0r0;->h:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object v0
.end method

.method public static r()I
    .locals 1

    .line 1
    sget v0, Ll/n0r0;->l:I

    .line 2
    .line 3
    return v0
.end method

.method public static s()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/n0r0;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static t()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/n0r0;->p:Z

    .line 2
    .line 3
    return v0
.end method

.method public static u()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/n0r0;->q:Z

    .line 2
    .line 3
    return v0
.end method

.method public static v()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/n0r0;->o:Z

    .line 2
    .line 3
    return v0
.end method
