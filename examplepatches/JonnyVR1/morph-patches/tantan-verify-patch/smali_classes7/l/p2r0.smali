.class public Ll/p2r0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p2r0$b;
    }
.end annotation


# static fields
.field private static a:Ll/vsq0;

.field private static volatile b:I

.field private static c:J

.field private static final d:Ljava/lang/Object;

.field private static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/p2r0$b;",
            ">;"
        }
    .end annotation
.end field

.field private static f:Ljava/lang/String;

.field private static g:Ll/csq0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/vsq0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ll/vsq0;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/p2r0;->a:Ll/vsq0;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    sput v0, Ll/p2r0;->b:I

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    sput-wide v0, Ll/p2r0;->c:J

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/p2r0;->d:Ljava/lang/Object;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Ll/p2r0;->e:Ljava/util/List;

    .line 35
    .line 36
    const-string v0, ""

    .line 37
    .line 38
    sput-object v0, Ll/p2r0;->f:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    sput-object v0, Ll/p2r0;->g:Ll/csq0;

    .line 42
    .line 43
    return-void
.end method

.method public static a(Landroid/content/Context;)I
    .locals 2

    .line 1
    sget v0, Ll/p2r0;->b:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {p0}, Ll/p2r0;->n(Landroid/content/Context;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    sput p0, Ll/p2r0;->b:I

    .line 11
    .line 12
    :cond_0
    sget p0, Ll/p2r0;->b:I

    .line 13
    .line 14
    return p0
.end method

.method public static b(Ljava/lang/String;)I
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "UTF-8"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length p0, v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    return p0

    .line 9
    :catch_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    array-length p0, p0

    .line 14
    return p0
.end method

.method private static c(IJZJZ)J
    .locals 2

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    if-eqz p6, :cond_0

    .line 4
    .line 5
    sget-wide v0, Ll/p2r0;->c:J

    .line 6
    .line 7
    sput-wide p4, Ll/p2r0;->c:J

    .line 8
    .line 9
    sub-long/2addr p4, v0

    .line 10
    const-wide/16 v0, 0x7530

    .line 11
    .line 12
    cmp-long p3, p4, v0

    .line 13
    .line 14
    if-lez p3, :cond_0

    .line 15
    .line 16
    const-wide/16 p3, 0x400

    .line 17
    .line 18
    cmp-long p3, p1, p3

    .line 19
    .line 20
    if-lez p3, :cond_0

    .line 21
    .line 22
    const-wide/16 p3, 0x2

    .line 23
    .line 24
    mul-long/2addr p1, p3

    .line 25
    return-wide p1

    .line 26
    :cond_0
    if-nez p0, :cond_1

    .line 27
    .line 28
    const/16 p0, 0xd

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/16 p0, 0xb

    .line 32
    .line 33
    :goto_0
    int-to-long p3, p0

    .line 34
    mul-long/2addr p1, p3

    .line 35
    const-wide/16 p3, 0xa

    .line 36
    .line 37
    div-long/2addr p1, p3

    .line 38
    return-wide p1
.end method

.method public static synthetic d()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Ll/p2r0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    return-object v0
.end method

.method private static declared-synchronized e(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    const-class p0, Ll/p2r0;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    sget-object v0, Ll/p2r0;->f:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/p2r0;->f:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-object v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    :try_start_1
    const-string v0, ""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-object v0

    .line 22
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 23
    throw v0
.end method

.method public static synthetic f()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Ll/p2r0;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method private static g(Landroid/content/Context;)Ll/csq0;
    .locals 1

    .line 1
    sget-object v0, Ll/p2r0;->g:Ll/csq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    new-instance v0, Ll/csq0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/csq0;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/p2r0;->g:Ll/csq0;

    .line 12
    .line 13
    return-object v0
.end method

.method public static h(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/p2r0;->n(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sput p0, Ll/p2r0;->b:I

    .line 6
    .line 7
    return-void
.end method

.method private static i(Landroid/content/Context;Ljava/lang/String;JZJ)V
    .locals 11

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    const-string v0, "com.xiaomi.xmsf"

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    const-string v0, "com.xiaomi.xmsf"

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_3

    .line 30
    :cond_0
    invoke-static {p0}, Ll/p2r0;->a(Landroid/content/Context;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/4 v0, -0x1

    .line 35
    if-ne v0, v5, :cond_1

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_1
    sget-object v10, Ll/p2r0;->d:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v10

    .line 41
    :try_start_0
    sget-object v0, Ll/p2r0;->e:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    new-instance v1, Ll/p2r0$b;

    .line 48
    .line 49
    if-nez v5, :cond_2

    .line 50
    .line 51
    invoke-static {p0}, Ll/p2r0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :goto_0
    move-wide v8, p2

    .line 56
    move v6, p4

    .line 57
    move-wide/from16 v3, p5

    .line 58
    .line 59
    move-object v7, v2

    .line 60
    move-object v2, p1

    .line 61
    goto :goto_1

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    const-string v2, ""

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :goto_1
    invoke-direct/range {v1 .. v9}, Ll/p2r0$b;-><init>(Ljava/lang/String;JIILjava/lang/String;J)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/p2r0;->m(Ll/p2r0$b;)V

    .line 72
    .line 73
    .line 74
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    sget-object p1, Ll/p2r0;->a:Ll/vsq0;

    .line 78
    .line 79
    new-instance p2, Ll/p2r0$a;

    .line 80
    .line 81
    invoke-direct {p2, p0}, Ll/p2r0$a;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    const-wide/16 v0, 0x1388

    .line 85
    .line 86
    invoke-virtual {p1, p2, v0, v1}, Ll/vsq0;->f(Ll/vsq0$d;J)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :goto_2
    :try_start_1
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    throw p0

    .line 92
    :cond_3
    :goto_3
    return-void
.end method

.method public static j(Landroid/content/Context;Ljava/lang/String;JZZJ)V
    .locals 7

    .line 1
    invoke-static {p0}, Ll/p2r0;->a(Landroid/content/Context;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    move-wide v1, p2

    .line 6
    move v3, p4

    .line 7
    move v6, p5

    .line 8
    move-wide v4, p6

    .line 9
    invoke-static/range {v0 .. v6}, Ll/p2r0;->c(IJZJZ)J

    .line 10
    .line 11
    .line 12
    move-result-wide p2

    .line 13
    move-wide p5, v4

    .line 14
    invoke-static/range {p0 .. p6}, Ll/p2r0;->i(Landroid/content/Context;Ljava/lang/String;JZJ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic k(Landroid/content/Context;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p2r0;->o(Landroid/content/Context;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized l(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-class v0, Ll/p2r0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {}, Ll/l4r0;->t()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    sput-object p0, Ll/p2r0;->f:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p0
.end method

.method private static m(Ll/p2r0$b;)V
    .locals 6

    .line 1
    sget-object v0, Ll/p2r0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/p2r0$b;

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ll/p2r0$b;->a(Ll/p2r0$b;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-wide v2, v1, Ll/p2r0$b;->f:J

    .line 26
    .line 27
    iget-wide v4, p0, Ll/p2r0$b;->f:J

    .line 28
    .line 29
    add-long/2addr v2, v4

    .line 30
    iput-wide v2, v1, Ll/p2r0$b;->f:J

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object v0, Ll/p2r0;->e:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private static n(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {}, Ll/mtq0;->p()Ll/ntq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/ntq0;->a()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private static o(Landroid/content/Context;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ll/p2r0$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object v0, Ll/csq0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 4
    :try_start_1
    invoke-static {p0}, Ll/p2r0;->g(Landroid/content/Context;)Ll/csq0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 13
    .line 14
    .line 15
    :try_start_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/p2r0$b;

    .line 30
    .line 31
    new-instance v2, Landroid/content/ContentValues;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 34
    .line 35
    .line 36
    const-string v3, "package_name"

    .line 37
    .line 38
    iget-object v4, v1, Ll/p2r0$b;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v3, "message_ts"

    .line 44
    .line 45
    iget-wide v4, v1, Ll/p2r0$b;->b:J

    .line 46
    .line 47
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 52
    .line 53
    .line 54
    const-string v3, "network_type"

    .line 55
    .line 56
    iget v4, v1, Ll/p2r0$b;->c:I

    .line 57
    .line 58
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 63
    .line 64
    .line 65
    const-string v3, "bytes"

    .line 66
    .line 67
    iget-wide v4, v1, Ll/p2r0$b;->f:J

    .line 68
    .line 69
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 74
    .line 75
    .line 76
    const-string v3, "rcv"

    .line 77
    .line 78
    iget v4, v1, Ll/p2r0$b;->d:I

    .line 79
    .line 80
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 85
    .line 86
    .line 87
    const-string v3, "imsi"

    .line 88
    .line 89
    iget-object v1, v1, Ll/p2r0$b;->e:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v1, "traffic"

    .line 95
    .line 96
    const/4 v3, 0x0

    .line 97
    invoke-virtual {p0, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception p1

    .line 102
    goto :goto_1

    .line 103
    :cond_0
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 104
    .line 105
    .line 106
    :try_start_3
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 107
    .line 108
    .line 109
    monitor-exit v0

    .line 110
    return-void

    .line 111
    :catchall_1
    move-exception p0

    .line 112
    goto :goto_2

    .line 113
    :goto_1
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 114
    .line 115
    .line 116
    throw p1

    .line 117
    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 118
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 119
    :catchall_2
    move-exception p0

    .line 120
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method
