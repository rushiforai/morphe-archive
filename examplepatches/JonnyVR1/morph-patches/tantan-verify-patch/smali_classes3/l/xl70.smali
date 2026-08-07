.class public Ll/xl70;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xl70$d;,
        Ll/xl70$e;,
        Ll/xl70$c;
    }
.end annotation


# static fields
.field public static a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Landroid/util/Pair<",
            "Ll/xc00;",
            "Ll/xl70$d;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xl70;->a:Ljava/util/Map;

    .line 7
    .line 8
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

.method public static synthetic a(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p4, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 9
    .line 10
    invoke-static {p4}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    const/4 p4, 0x0

    .line 14
    invoke-static {p1, p2, p3, p4}, Ll/xl70;->i(Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/xl70$e;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {p0, p1, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic b(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget p3, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 9
    .line 10
    invoke-static {p3}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    invoke-static {p1, p2, p3, p3}, Ll/xl70;->i(Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/xl70$e;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {p0, p1, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {p1, p2, p3, v0}, Ll/xl70;->i(Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/xl70$e;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p0, p1, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic d(Ll/xl70$d;Ll/xc00;Ljava/util/List;Ljava/util/List;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/xl70$d;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v0, "report"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v2, "profile"

    .line 13
    .line 14
    invoke-static {p3, v2, v1, v0}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/vl70;

    .line 27
    .line 28
    invoke-direct {v1, p1, p0, p2, p3}, Ll/vl70;-><init>(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/wl70;

    .line 32
    .line 33
    invoke-direct {v2, p1, p0, p2, p3}, Ll/wl70;-><init>(Ll/xc00;Ll/xl70$d;Ljava/util/List;Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 49
    .line 50
    .line 51
    invoke-static {p0, p2, p3, v1}, Ll/xl70;->i(Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/xl70$e;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {p1, p0, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static bridge synthetic f(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    return-void
.end method

.method public static bridge synthetic g(Ll/xc00;Ll/xl70$d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xl70;->m(Ll/xc00;Ll/xl70$d;)V

    return-void
.end method

.method public static h(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;Z)Ll/xl70$c;
    .locals 10

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    new-instance v0, Lcom/google/gson/Gson;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/sim;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    iget-object v1, p1, Ll/sim;->d:[I

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/io/File;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    :try_start_0
    new-instance p2, Ljava/io/FileInputStream;

    .line 39
    .line 40
    invoke-direct {p2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    .line 42
    .line 43
    :try_start_1
    invoke-virtual {p2}, Ljava/io/FileInputStream;->available()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    new-array p0, p0, [B

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Ljava/io/FileInputStream;->read([B)I

    .line 50
    .line 51
    .line 52
    const/4 v2, 0x2

    .line 53
    invoke-static {p0, v2}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    move-object v2, p0

    .line 61
    goto :goto_3

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    goto :goto_1

    .line 65
    :catch_0
    move-object p0, p2

    .line 66
    goto :goto_2

    .line 67
    :catchall_1
    move-exception v0

    .line 68
    move-object p1, v0

    .line 69
    move-object p2, p0

    .line 70
    move-object p0, p1

    .line 71
    :goto_1
    invoke-static {p2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 72
    .line 73
    .line 74
    throw p0

    .line 75
    :catch_1
    :goto_2
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    const-string p0, ""

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :goto_3
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 82
    .line 83
    .line 84
    move-result-wide v5

    .line 85
    iget v7, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 86
    .line 87
    iget v8, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 88
    .line 89
    iget-object v9, p1, Ll/sim;->i:Ljava/lang/String;

    .line 90
    .line 91
    new-instance v1, Ll/xl70$c;

    .line 92
    .line 93
    const-string v3, ""

    .line 94
    .line 95
    invoke-direct/range {v1 .. v9}, Ll/xl70$c;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-object v1
.end method

.method public static i(Ll/xl70$d;Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ll/xl70$e;
    .locals 7
    .param p0    # Ll/xl70$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xl70$d;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/xl70$e;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance p0, Ll/xl70$e;

    .line 9
    .line 10
    new-array p1, v1, [Ll/xl70$c;

    .line 11
    .line 12
    const/4 p2, 0x5

    .line 13
    invoke-direct {p0, p1, p2}, Ll/xl70$e;-><init>([Ll/xl70$c;I)V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    new-array v0, v0, [Ll/xl70$c;

    .line 22
    .line 23
    iget-boolean v2, p0, Ll/xl70$d;->d:Z

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eq v2, v3, :cond_2

    .line 42
    .line 43
    :cond_1
    const/4 v2, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move v2, v1

    .line 46
    :goto_0
    move v3, v1

    .line 47
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ge v3, v4, :cond_4

    .line 52
    .line 53
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 58
    .line 59
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    iget-boolean v6, p0, Ll/xl70$d;->e:Z

    .line 66
    .line 67
    invoke-static {v4, v5, v6}, Ll/xl70;->h(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;Z)Ll/xl70$c;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    iget-boolean v5, p0, Ll/xl70$d;->d:Z

    .line 72
    .line 73
    if-eqz v5, :cond_3

    .line 74
    .line 75
    if-nez v2, :cond_3

    .line 76
    .line 77
    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Ljava/lang/String;

    .line 82
    .line 83
    iput-object v5, v4, Ll/xl70$c;->b:Ljava/lang/String;

    .line 84
    .line 85
    :cond_3
    aput-object v4, v0, v3

    .line 86
    .line 87
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_4
    if-eqz v2, :cond_5

    .line 91
    .line 92
    const/4 v1, 0x4

    .line 93
    :cond_5
    new-instance p0, Ll/xl70$e;

    .line 94
    .line 95
    invoke-direct {p0, v0, v1}, Ll/xl70$e;-><init>([Ll/xl70$c;I)V

    .line 96
    .line 97
    .line 98
    return-object p0
.end method

.method public static j(JLjava/util/ArrayList;)V
    .locals 7
    .param p2    # Ljava/util/ArrayList;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/xl70;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/util/Pair;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ll/xc00;

    .line 23
    .line 24
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ll/xl70$d;

    .line 27
    .line 28
    new-instance v0, Ll/sl70;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/sl70;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p2, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    new-instance p2, Ll/xl70$e;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    new-array v0, v0, [Ll/xl70$c;

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-direct {p2, v0, v1}, Ll/xl70$e;-><init>([Ll/xl70$c;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p0, p2}, Ll/xl70;->k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {p1}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    sget v0, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 63
    .line 64
    .line 65
    new-instance v1, Ll/i1y;

    .line 66
    .line 67
    iget v3, p0, Ll/xl70$d;->b:I

    .line 68
    .line 69
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 70
    .line 71
    const/4 v6, 0x1

    .line 72
    const/4 v4, 0x1

    .line 73
    invoke-direct/range {v1 .. v6}, Ll/i1y;-><init>(Ljava/util/List;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {v1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    new-instance v0, Ll/tl70;

    .line 85
    .line 86
    invoke-direct {v0, p0, p1, v2}, Ll/tl70;-><init>(Ll/xl70$d;Ll/xc00;Ljava/util/List;)V

    .line 87
    .line 88
    .line 89
    new-instance v1, Ll/ul70;

    .line 90
    .line 91
    invoke-direct {v1, p1, p0, v2}, Ll/ul70;-><init>(Ll/xc00;Ll/xl70$d;Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static k(Ll/xc00;Ll/xl70$d;Ll/xl70$e;)V
    .locals 1
    .param p0    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/xl70$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/xl70$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget v0, p1, Ll/xl70$d;->g:I

    .line 2
    .line 3
    invoke-static {p2, v0}, Ll/xl70;->o(Ll/xl70$e;I)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    goto :goto_0

    .line 12
    :catch_0
    const-string p2, ""

    .line 13
    .line 14
    :goto_0
    iget-object p1, p1, Ll/xl70$d;->f:Ljava/lang/String;

    .line 15
    .line 16
    filled-new-array {p2}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Ll/xc00;->f(Ljava/lang/String;[Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static l(Lorg/json/JSONObject;)Ll/xl70$d;
    .locals 11
    .param p0    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "maxCount"

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const-string v0, "pixelLimit"

    .line 10
    .line 11
    const v1, 0x7fffffff

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v2, -0x1

    .line 19
    if-ne v0, v2, :cond_0

    .line 20
    .line 21
    move v4, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v4, v0

    .line 24
    :goto_0
    const-string v0, "needUpload"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "1"

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const-string v0, "needBase64"

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    const-string v0, "selected"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v5, ""

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    move v9, v8

    .line 60
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    if-ge v9, v10, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0, v9, v5}, Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v10

    .line 70
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    add-int/lit8 v9, v9, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    new-array v0, v8, [Ljava/lang/String;

    .line 77
    .line 78
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, [Ljava/lang/String;

    .line 83
    .line 84
    const-string v1, "callback"

    .line 85
    .line 86
    invoke-virtual {p0, v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    const-string v1, "sizeLimit"

    .line 91
    .line 92
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    new-instance v2, Ll/xl70$d;

    .line 97
    .line 98
    move-object v5, v0

    .line 99
    invoke-direct/range {v2 .. v9}, Ll/xl70$d;-><init>(II[Ljava/lang/String;ZZLjava/lang/String;I)V

    .line 100
    .line 101
    .line 102
    return-object v2
.end method

.method public static m(Ll/xc00;Ll/xl70$d;)V
    .locals 10
    .param p0    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/xl70$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Ll/xl70;->a:Ljava/util/Map;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    new-instance v4, Landroid/util/Pair;

    .line 12
    .line 13
    invoke-direct {v4, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    new-instance v2, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v3, p1, Ll/xl70$d;->c:[Ljava/lang/String;

    .line 25
    .line 26
    array-length v4, v3

    .line 27
    const/4 v5, 0x0

    .line 28
    move v6, v5

    .line 29
    :goto_0
    if-ge v6, v4, :cond_0

    .line 30
    .line 31
    aget-object v7, v3, v6

    .line 32
    .line 33
    new-instance v8, Lcom/google/gson/Gson;

    .line 34
    .line 35
    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 36
    .line 37
    .line 38
    const-class v9, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-virtual {v8, v7, v9}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    check-cast v7, Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v6, v6, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    iget p1, p1, Ll/xl70$d;->a:I

    .line 73
    .line 74
    invoke-virtual {v7, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v6, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withAlreadySelectedMedia(Ljava/util/List;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string v2, ""

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSelectedFolderPath(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const/16 v2, 0x8

    .line 97
    .line 98
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v2, "p_camera_album_picture_preview"

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withMediaPreviewPageId(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->jsBridgeTimestamp(J)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {v4, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const/16 v0, 0x42

    .line 125
    .line 126
    invoke-virtual {v3, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    sget p1, Ll/w7c0;->d:I

    .line 134
    .line 135
    invoke-virtual {p0, p1, v5}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public static n(Ll/xc00;Lorg/json/JSONObject;)V
    .locals 8
    .param p0    # Ll/xc00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/xl70;->l(Lorg/json/JSONObject;)Ll/xl70$d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v3, Ll/xl70$a;

    .line 6
    .line 7
    invoke-direct {v3, p0, p1}, Ll/xl70$a;-><init>(Ll/xc00;Ll/xl70$d;)V

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/xl70$b;

    .line 11
    .line 12
    invoke-direct {v4, p0, p1}, Ll/xl70$b;-><init>(Ll/xc00;Ll/xl70$d;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/wzx;->k()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/wzx;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/wzx;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v6, 0x0

    .line 31
    const/4 v7, 0x0

    .line 32
    const/4 v2, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-virtual/range {v0 .. v7}, Ll/wzx;->d(Landroid/app/Activity;Landroid/view/View;Ll/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 43
    .line 44
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 45
    .line 46
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, v3, v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0}, Ll/xc00;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static o(Ll/xl70$e;I)Lorg/json/JSONObject;
    .locals 12
    .param p0    # Ll/xl70$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONArray;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Ll/xl70$e;->a:[Ll/xl70$c;

    .line 12
    .line 13
    array-length v3, v2

    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    :goto_0
    if-ge v6, v3, :cond_0

    .line 18
    .line 19
    aget-object v7, v2, v6

    .line 20
    .line 21
    new-instance v8, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v9, "base64"

    .line 27
    .line 28
    iget-object v10, v7, Ll/xl70$c;->a:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    const-string v9, "url"

    .line 34
    .line 35
    iget-object v10, v7, Ll/xl70$c;->b:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    const-string v9, "path"

    .line 41
    .line 42
    iget-object v10, v7, Ll/xl70$c;->c:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v9, "size"

    .line 48
    .line 49
    iget-wide v10, v7, Ll/xl70$c;->d:J

    .line 50
    .line 51
    invoke-virtual {v8, v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    const-string v9, "pixelWidth"

    .line 55
    .line 56
    iget v10, v7, Ll/xl70$c;->e:I

    .line 57
    .line 58
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const-string v9, "pixelheight"

    .line 62
    .line 63
    iget v10, v7, Ll/xl70$c;->f:I

    .line 64
    .line 65
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    const-string v9, "mediaType"

    .line 69
    .line 70
    iget-object v10, v7, Ll/xl70$c;->g:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    iget-wide v9, v7, Ll/xl70$c;->d:J

    .line 76
    .line 77
    add-long/2addr v4, v9

    .line 78
    invoke-virtual {v1, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 79
    .line 80
    .line 81
    add-int/lit8 v6, v6, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const/4 v2, -0x1

    .line 85
    const-string v3, "code"

    .line 86
    .line 87
    if-eq p1, v2, :cond_1

    .line 88
    .line 89
    int-to-long v6, p1

    .line 90
    cmp-long p1, v4, v6

    .line 91
    .line 92
    if-ltz p1, :cond_1

    .line 93
    .line 94
    const/4 p0, 0x5

    .line 95
    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 96
    .line 97
    .line 98
    return-object v0

    .line 99
    :cond_1
    const-string p1, "data"

    .line 100
    .line 101
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    iget p0, p0, Ll/xl70$e;->b:I

    .line 105
    .line 106
    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    return-object v0
.end method
