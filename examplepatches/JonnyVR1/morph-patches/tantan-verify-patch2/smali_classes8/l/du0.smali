.class public Ll/du0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/ro0;Ljava/lang/ref/WeakReference;Ll/fye;)V
    .locals 0

    .line 1
    invoke-static {p0, p3}, Ll/hye;->a(Ljava/lang/String;Ll/fye;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Ll/ro0;->a:Ljava/util/List;

    .line 5
    .line 6
    iget-object p3, p3, Ll/fye;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/ro0;->b()V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/c7m;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-interface {p0, p1}, Ll/c7m;->f(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/du0;Ljava/lang/String;)Ll/fye;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/du0;->e(Ljava/lang/String;)Ll/fye;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public d(Landroid/content/Context;Ljava/lang/String;Ljava/lang/ref/WeakReference;)Ll/ro0;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Ll/c7m;",
            ">;)",
            "Ll/ro0;"
        }
    .end annotation

    .line 1
    new-instance p1, Ll/ro0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/ro0;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {p2}, Ll/hye;->b(Ljava/lang/String;)Ll/fye;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/au0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2}, Ll/au0;-><init>(Ll/du0;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/bu0;

    .line 35
    .line 36
    invoke-direct {v0, p2, p1, p3}, Ll/bu0;-><init>(Ljava/lang/String;Ll/ro0;Ljava/lang/ref/WeakReference;)V

    .line 37
    .line 38
    .line 39
    new-instance p2, Ll/cu0;

    .line 40
    .line 41
    invoke-direct {p2}, Ll/cu0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-object p1

    .line 52
    :catch_0
    move-exception p0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object p0, p1, Ll/ro0;->a:Ljava/util/List;

    .line 55
    .line 56
    iget-object p2, v0, Ll/fye;->a:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ll/ro0;->b()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    return-object p1

    .line 65
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-object p1
.end method

.method public final synthetic e(Ljava/lang/String;)Ll/fye;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/du0;->f(Ljava/lang/String;)Ll/fye;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/fye;
    .locals 9

    .line 1
    new-instance p0, Ll/o1g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/o1g0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/fye;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/fye;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    invoke-static {p1}, Ll/eu0;->b(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    new-instance v2, Ljava/io/FileInputStream;

    .line 19
    .line 20
    invoke-static {p1}, Ll/eu0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 25
    .line 26
    .line 27
    :try_start_1
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 30
    .line 31
    .line 32
    const/16 v1, 0x64

    .line 33
    .line 34
    :try_start_2
    new-array v3, v1, [B

    .line 35
    .line 36
    :goto_0
    const/4 v4, 0x0

    .line 37
    invoke-virtual {v2, v3, v4, v1}, Ljava/io/InputStream;->read([BII)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-lez v5, :cond_0

    .line 42
    .line 43
    invoke-virtual {p1, v3, v4, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    :goto_1
    move-object v1, v2

    .line 49
    goto/16 :goto_6

    .line 50
    .line 51
    :catch_0
    move-exception p0

    .line 52
    :goto_2
    move-object v1, v2

    .line 53
    goto :goto_5

    .line 54
    :cond_0
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p0, v1}, Ll/o1g0;->j([B)I

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/o1g0;->f()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p0}, Ll/o1g0;->k()V

    .line 66
    .line 67
    .line 68
    move v3, v4

    .line 69
    :goto_3
    if-ge v3, v1, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/o1g0;->b()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/o1g0;->i()Landroid/graphics/Bitmap;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    new-instance v6, Ll/qo0;

    .line 79
    .line 80
    invoke-direct {v6}, Ll/qo0;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v5, v6, Ll/qo0;->a:Landroid/graphics/Bitmap;

    .line 84
    .line 85
    new-instance v5, Landroid/graphics/Rect;

    .line 86
    .line 87
    iget-object v7, v6, Ll/qo0;->a:Landroid/graphics/Bitmap;

    .line 88
    .line 89
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    iget-object v8, v6, Ll/qo0;->a:Landroid/graphics/Bitmap;

    .line 94
    .line 95
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    invoke-direct {v5, v4, v4, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 100
    .line 101
    .line 102
    iput-object v5, v6, Ll/qo0;->b:Landroid/graphics/Rect;

    .line 103
    .line 104
    invoke-virtual {p0, v3}, Ll/o1g0;->e(I)I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    int-to-long v7, v5

    .line 109
    iput-wide v7, v6, Ll/qo0;->c:J

    .line 110
    .line 111
    invoke-virtual {v0, v6}, Ll/fye;->a(Ll/qo0;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 112
    .line 113
    .line 114
    add-int/lit8 v3, v3, 0x1

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_1
    move-object v1, v2

    .line 118
    goto :goto_4

    .line 119
    :catchall_1
    move-exception p0

    .line 120
    move-object p1, v1

    .line 121
    goto :goto_1

    .line 122
    :catch_1
    move-exception p0

    .line 123
    move-object p1, v1

    .line 124
    goto :goto_2

    .line 125
    :catchall_2
    move-exception p0

    .line 126
    move-object p1, v1

    .line 127
    goto :goto_6

    .line 128
    :catch_2
    move-exception p0

    .line 129
    move-object p1, v1

    .line 130
    goto :goto_5

    .line 131
    :cond_2
    move-object p1, v1

    .line 132
    :goto_4
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 133
    .line 134
    .line 135
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 136
    .line 137
    .line 138
    return-object v0

    .line 139
    :goto_5
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 140
    .line 141
    .line 142
    goto :goto_4

    .line 143
    :catchall_3
    move-exception p0

    .line 144
    :goto_6
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 145
    .line 146
    .line 147
    invoke-static {p1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 148
    .line 149
    .line 150
    throw p0
.end method
