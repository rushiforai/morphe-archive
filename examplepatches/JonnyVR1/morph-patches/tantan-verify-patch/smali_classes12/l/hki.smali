.class public Ll/hki;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hki$c;,
        Ll/hki$d;
    }
.end annotation


# static fields
.field private static d:Ll/hki;


# instance fields
.field private a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/hki$c;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hki;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hki;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/hki;->d:Ll/hki;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hki;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    const/16 v1, 0x3e8

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/hki;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/hki;->c:Ljava/lang/Object;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/hki;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hki;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d()Ll/hki;
    .locals 1

    .line 1
    sget-object v0, Ll/hki;->d:Ll/hki;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V
    .locals 12

    .line 1
    move-object/from16 v4, p4

    .line 2
    .line 3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1, p2, p3, v4}, Ll/u660;->b(ILjava/lang/String;Ljava/lang/String;[B)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x3

    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    sget v0, Ll/t0g0$a;->g:I

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    if-eqz v4, :cond_4

    .line 31
    .line 32
    if-eqz p2, :cond_4

    .line 33
    .line 34
    if-eqz p3, :cond_4

    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_4

    .line 41
    .line 42
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iget-object v6, p0, Ll/hki;->c:Ljava/lang/Object;

    .line 50
    .line 51
    monitor-enter v6

    .line 52
    :try_start_0
    iget-object v7, p0, Ll/hki;->a:Ljava/util/ArrayList;

    .line 53
    .line 54
    new-instance v0, Ll/hki$c;

    .line 55
    .line 56
    move v1, p1

    .line 57
    move-object v2, p2

    .line 58
    move-object v3, p3

    .line 59
    move-object/from16 v5, p5

    .line 60
    .line 61
    invoke-direct/range {v0 .. v5}, Ll/hki$c;-><init>(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    iget-object p2, p0, Ll/hki;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-le p1, p2, :cond_3

    .line 75
    .line 76
    iget-object p0, p0, Ll/hki;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    add-int/lit8 p1, p1, 0x1

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void

    .line 84
    :catchall_0
    move-exception v0

    .line 85
    move-object p0, v0

    .line 86
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    throw p0

    .line 88
    :cond_4
    :goto_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    sget-object v10, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 93
    .line 94
    const-string v11, "addUploadFile"

    .line 95
    .line 96
    const-string v0, "status"

    .line 97
    .line 98
    const-string v1, "error"

    .line 99
    .line 100
    const-string v2, "fileIdx"

    .line 101
    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    const-string v4, "bucketName"

    .line 107
    .line 108
    const-string v6, "fileName"

    .line 109
    .line 110
    const-string v8, "errMsg"

    .line 111
    .line 112
    const-string v9, "fileContent is null"

    .line 113
    .line 114
    move-object v5, p2

    .line 115
    move-object v7, p3

    .line 116
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, v10, v11, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public c()I
    .locals 1

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/u660;->c()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/hki;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public e(I)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Ll/u660;->e(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/hki;->c:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget-object p0, p0, Ll/hki;->a:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ll/hki$c;

    .line 40
    .line 41
    iget v2, v1, Ll/hki$c;->a:I

    .line 42
    .line 43
    if-ne v2, p1, :cond_1

    .line 44
    .line 45
    iget-object p0, v1, Ll/hki$c;->c:Ljava/lang/String;

    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-object p0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const-string p0, ""

    .line 52
    .line 53
    monitor-exit v0

    .line 54
    return-object p0

    .line 55
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/u660;->f()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/hki;->c:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v0

    .line 22
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/hki;->a:Ljava/util/ArrayList;

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public g()V
    .locals 1

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/u660;->h()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/hki;->f()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public h(Landroid/content/Context;Ll/hki$d;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->e0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/afm;->d0()Lcom/idv/identity/platform/config/OSSConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/u660;->d()Ll/u660;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v3, v0, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v4, v0, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v5, v0, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v6, v0, Lcom/idv/identity/platform/config/OSSConfig;->SecurityToken:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v7, Ll/hki$a;

    .line 32
    .line 33
    invoke-direct {v7, p0, p2}, Ll/hki$a;-><init>(Ll/hki;Ll/hki$d;)V

    .line 34
    .line 35
    .line 36
    move-object v2, p1

    .line 37
    invoke-virtual/range {v1 .. v7}, Ll/u660;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/u660$d;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    sget p1, Ll/t0g0$a;->h:I

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-static {p1, v0}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/hki;->c:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p1

    .line 50
    :try_start_0
    new-instance v0, Ll/hki$b;

    .line 51
    .line 52
    invoke-direct {v0, p0, p2}, Ll/hki$b;-><init>(Ll/hki;Ll/hki$d;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0}, Ll/jxi0;->h(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    monitor-exit p1

    .line 59
    return-void

    .line 60
    :catchall_0
    move-exception v0

    .line 61
    move-object p0, v0

    .line 62
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    throw p0
.end method
