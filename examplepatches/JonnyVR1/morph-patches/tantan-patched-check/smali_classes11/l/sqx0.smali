.class public abstract Ll/sqx0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final h:Ljava/lang/Object;

.field public static volatile i:Ll/ksx0;

.field public static j:Ll/ysx0;

.field public static final k:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field public final a:Ll/asx0;

.field public final b:Ljava/lang/String;

.field public c:Ljava/lang/Object;

.field public volatile d:I

.field public volatile e:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final f:Z

.field public volatile g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/sqx0;->h:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/ysx0;

    .line 14
    .line 15
    new-instance v1, Ll/qrx0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/qrx0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Ll/ysx0;-><init>(Ll/vsx0;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/sqx0;->j:Ll/ysx0;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v0, Ll/sqx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/asx0;",
            "Ljava/lang/String;",
            "TT;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/sqx0;->d:I

    .line 6
    .line 7
    iget-object v0, p1, Ll/asx0;->a:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v2, p1, Ll/asx0;->b:Landroid/net/Uri;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p0, "Must pass a valid SharedPreferences file name or ContentProvider URI"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw v1

    .line 23
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p1, Ll/asx0;->b:Landroid/net/Uri;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    const-string p0, "Must pass one of SharedPreferences file name or ContentProvider URI"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v1

    .line 36
    :cond_3
    :goto_1
    iput-object p1, p0, Ll/sqx0;->a:Ll/asx0;

    .line 37
    .line 38
    iput-object p2, p0, Ll/sqx0;->b:Ljava/lang/String;

    .line 39
    .line 40
    iput-object p3, p0, Ll/sqx0;->c:Ljava/lang/Object;

    .line 41
    .line 42
    iput-boolean p4, p0, Ll/sqx0;->f:Z

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Ll/sqx0;->g:Z

    .line 46
    .line 47
    return-void
.end method

.method public synthetic constructor <init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Object;ZLl/fsx0;)V
    .locals 0

    const/4 p4, 0x1

    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Ll/sqx0;-><init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Object;Z)V

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)Lcom/google/common/base/Optional;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/mox0$a;->a(Landroid/content/Context;)Lcom/google/common/base/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Ll/asx0;Ljava/lang/String;Ljava/lang/Boolean;Z)Ll/sqx0;
    .locals 1

    .line 1
    new-instance p3, Ll/xrx0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Ll/xrx0;-><init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Boolean;Z)V

    .line 5
    .line 6
    .line 7
    return-object p3
.end method

.method public static synthetic g(Ll/asx0;Ljava/lang/String;Ljava/lang/Double;Z)Ll/sqx0;
    .locals 1

    .line 1
    new-instance p3, Ll/urx0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Ll/urx0;-><init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Double;Z)V

    .line 5
    .line 6
    .line 7
    return-object p3
.end method

.method public static synthetic h(Ll/asx0;Ljava/lang/String;Ljava/lang/Long;Z)Ll/sqx0;
    .locals 1

    .line 1
    new-instance p3, Ll/mrx0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Ll/mrx0;-><init>(Ll/asx0;Ljava/lang/String;Ljava/lang/Long;Z)V

    .line 5
    .line 6
    .line 7
    return-object p3
.end method

.method public static synthetic i(Ll/asx0;Ljava/lang/String;Ljava/lang/String;Z)Ll/sqx0;
    .locals 1

    .line 1
    new-instance p3, Ll/bsx0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p3, p0, p1, p2, v0}, Ll/bsx0;-><init>(Ll/asx0;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-object p3
.end method

.method public static l(Landroid/content/Context;)V
    .locals 3

    .line 1
    sget-object v0, Ll/sqx0;->i:Ll/ksx0;

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_5

    .line 8
    :cond_0
    sget-object v0, Ll/sqx0;->h:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ll/sqx0;->i:Ll/ksx0;

    .line 12
    .line 13
    if-nez v1, :cond_5

    .line 14
    .line 15
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    :try_start_1
    sget-object v1, Ll/sqx0;->i:Ll/ksx0;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move-object p0, v2

    .line 26
    :goto_0
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    if-eq v2, p0, :cond_4

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 38
    .line 39
    invoke-static {}, Ll/kcx0;->d()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/ssx0;->c()V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/wkx0;->b()V

    .line 46
    .line 47
    .line 48
    :cond_3
    new-instance v1, Ll/drx0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/drx0;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Lcom/google/common/base/Suppliers;->a(Ll/b7h0;)Ll/b7h0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/gdx0;

    .line 58
    .line 59
    invoke-direct {v2, p0, v1}, Ll/gdx0;-><init>(Landroid/content/Context;Ll/b7h0;)V

    .line 60
    .line 61
    .line 62
    sput-object v2, Ll/sqx0;->i:Ll/ksx0;

    .line 63
    .line 64
    sget-object p0, Ll/sqx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 67
    .line 68
    .line 69
    :cond_4
    monitor-exit v0

    .line 70
    goto :goto_3

    .line 71
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    :try_start_2
    throw p0

    .line 73
    :catchall_1
    move-exception p0

    .line 74
    goto :goto_4

    .line 75
    :cond_5
    :goto_3
    monitor-exit v0

    .line 76
    return-void

    .line 77
    :goto_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 78
    throw p0

    .line 79
    :cond_6
    :goto_5
    return-void
.end method

.method public static m()V
    .locals 1

    .line 1
    sget-object v0, Ll/sqx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method


# virtual methods
.method public final b()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/sqx0;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/sqx0;->j:Ll/ysx0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/sqx0;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/ysx0;->a(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "Attempt to access PhenotypeFlag not via codegen. All new PhenotypeFlags must be accessed through codegen APIs. If you believe you are seeing this error by mistake, you can add your flag to the exemption list located at //java/com/google/android/libraries/phenotype/client/lockdown/flags.textproto. Send the addition CL to ph-reviews@. See go/phenotype-android-codegen for information about generated code. See go/ph-lockdown for more information about this error."

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/xn80;->w(ZLjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object v0, Ll/sqx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p0, Ll/sqx0;->d:I

    .line 25
    .line 26
    if-ge v1, v0, :cond_a

    .line 27
    .line 28
    monitor-enter p0

    .line 29
    :try_start_0
    iget v1, p0, Ll/sqx0;->d:I

    .line 30
    .line 31
    if-ge v1, v0, :cond_9

    .line 32
    .line 33
    sget-object v1, Ll/sqx0;->i:Ll/ksx0;

    .line 34
    .line 35
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const/4 v3, 0x0

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/ksx0;->b()Ll/b7h0;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v2}, Ll/b7h0;->get()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/google/common/base/Optional;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Ll/npx0;

    .line 63
    .line 64
    iget-object v4, p0, Ll/sqx0;->a:Ll/asx0;

    .line 65
    .line 66
    iget-object v5, v4, Ll/asx0;->b:Landroid/net/Uri;

    .line 67
    .line 68
    iget-object v6, v4, Ll/asx0;->a:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v4, v4, Ll/asx0;->d:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v7, p0, Ll/sqx0;->b:Ljava/lang/String;

    .line 73
    .line 74
    invoke-interface {v3, v5, v6, v4, v7}, Ll/npx0;->a(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    goto :goto_4

    .line 81
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 82
    .line 83
    const/4 v4, 0x1

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const/4 v4, 0x0

    .line 86
    :goto_1
    const-string v5, "Must call PhenotypeFlagInitializer.maybeInit() first"

    .line 87
    .line 88
    invoke-static {v4, v5}, Ll/xn80;->w(ZLjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object v4, p0, Ll/sqx0;->a:Ll/asx0;

    .line 92
    .line 93
    iget-boolean v4, v4, Ll/asx0;->f:Z

    .line 94
    .line 95
    if-eqz v4, :cond_4

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Ll/sqx0;->d(Ll/ksx0;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    if-eqz v4, :cond_3

    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    invoke-virtual {p0, v1}, Ll/sqx0;->j(Ll/ksx0;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    if-eqz v4, :cond_6

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    invoke-virtual {p0, v1}, Ll/sqx0;->j(Ll/ksx0;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    if-eqz v4, :cond_5

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    invoke-virtual {p0, v1}, Ll/sqx0;->d(Ll/ksx0;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    if-eqz v4, :cond_6

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_6
    invoke-virtual {p0}, Ll/sqx0;->o()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    :goto_2
    invoke-virtual {v2}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    if-nez v3, :cond_7

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/sqx0;->o()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    goto :goto_3

    .line 142
    :cond_7
    invoke-virtual {p0, v3}, Ll/sqx0;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    :cond_8
    :goto_3
    iput-object v4, p0, Ll/sqx0;->e:Ljava/lang/Object;

    .line 147
    .line 148
    iput v0, p0, Ll/sqx0;->d:I

    .line 149
    .line 150
    :cond_9
    monitor-exit p0

    .line 151
    goto :goto_5

    .line 152
    :goto_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    throw v0

    .line 154
    :cond_a
    :goto_5
    iget-object p0, p0, Ll/sqx0;->e:Ljava/lang/Object;

    .line 155
    .line 156
    return-object p0
.end method

.method public abstract c(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation
.end method

.method public final d(Ll/ksx0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ksx0;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/asx0;->e:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_2

    .line 7
    .line 8
    iget-object v0, v0, Ll/asx0;->i:Ll/adj;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ll/adj;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    :cond_0
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Ll/wkx0;->a(Landroid/content/Context;)Ll/wkx0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 37
    .line 38
    iget-boolean v1, v0, Ll/asx0;->e:Z

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    move-object v0, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v0, v0, Ll/asx0;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/sqx0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :goto_0
    invoke-interface {p1, v0}, Ll/wjx0;->zza(Ljava/lang/String;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/sqx0;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_2
    return-object v2
.end method

.method public final e(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/sqx0;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/sqx0;->b:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final j(Ll/ksx0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ksx0;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/asx0;->b:Landroid/net/Uri;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v2, p0, Ll/sqx0;->a:Ll/asx0;

    .line 13
    .line 14
    iget-object v2, v2, Ll/asx0;->b:Landroid/net/Uri;

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/nqx0;->b(Landroid/content/Context;Landroid/net/Uri;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 23
    .line 24
    iget-boolean v0, v0, Ll/asx0;->h:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v2, p0, Ll/sqx0;->a:Ll/asx0;

    .line 41
    .line 42
    iget-object v2, v2, Ll/asx0;->b:Landroid/net/Uri;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {p1, v2}, Ll/xqx0;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/xqx0;->a(Ljava/lang/String;)Landroid/net/Uri;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v2, Ll/erx0;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/erx0;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, p1, v2}, Ll/kcx0;->b(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/Runnable;)Ll/kcx0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 75
    .line 76
    iget-object v0, v0, Ll/asx0;->b:Landroid/net/Uri;

    .line 77
    .line 78
    new-instance v2, Ll/erx0;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/erx0;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {p1, v0, v2}, Ll/kcx0;->b(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/Runnable;)Ll/kcx0;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    goto :goto_0

    .line 88
    :cond_1
    move-object p1, v1

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    invoke-virtual {p1}, Ll/ksx0;->a()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 95
    .line 96
    iget-object v0, v0, Ll/asx0;->a:Ljava/lang/String;

    .line 97
    .line 98
    new-instance v2, Ll/erx0;

    .line 99
    .line 100
    invoke-direct {v2}, Ll/erx0;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-static {p1, v0, v2}, Ll/ssx0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Ll/ssx0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    :goto_0
    if-eqz p1, :cond_3

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/sqx0;->k()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-interface {p1, v0}, Ll/wjx0;->zza(Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Ll/sqx0;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :cond_3
    return-object v1
.end method

.method public final k()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sqx0;->a:Ll/asx0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/asx0;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/sqx0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final o()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sqx0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method
