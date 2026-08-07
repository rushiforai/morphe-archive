.class public Ll/cvx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/loader/app/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/loader/app/a$a<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# static fields
.field public static final j:[Ljava/lang/String;


# instance fields
.field public final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public final b:Landroid/content/Context;

.field public final c:Z

.field public final d:Z

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v5, "mime_type"

    .line 2
    .line 3
    const-string v6, "duration"

    .line 4
    .line 5
    const-string v0, "_id"

    .line 6
    .line 7
    const-string v1, "_data"

    .line 8
    .line 9
    const-string v2, "date_added"

    .line 10
    .line 11
    const-string v3, "_display_name"

    .line 12
    .line 13
    const-string v4, "media_type"

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/cvx;->j:[Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZZZI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/cvx;->f:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Ll/cvx;->g:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/cvx;->i:Z

    .line 17
    .line 18
    iput-object p1, p0, Ll/cvx;->b:Landroid/content/Context;

    .line 19
    .line 20
    iput-boolean p2, p0, Ll/cvx;->d:Z

    .line 21
    .line 22
    iput-boolean p3, p0, Ll/cvx;->c:Z

    .line 23
    .line 24
    iput p5, p0, Ll/cvx;->e:I

    .line 25
    .line 26
    iput-boolean p4, p0, Ll/cvx;->h:Z

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic d(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    new-instance v0, Ll/vux;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vux;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/yux;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/yux;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "image/"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f(Ll/cvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cvx;->p(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g(Ll/qcj;Ljava/util/List;)Ljava/util/List;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    sget-char v4, Ljava/io/File;->separatorChar:C

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(I)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    invoke-virtual {v3, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ljava/util/List;

    .line 40
    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    new-instance v3, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Ljava/util/Map$Entry;

    .line 83
    .line 84
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Ljava/util/List;

    .line 89
    .line 90
    new-instance v3, Ll/v2i0;

    .line 91
    .line 92
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 97
    .line 98
    invoke-interface {p0, v4}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-direct {v3, v4, v1}, Ll/v2i0;-><init>(Ljava/lang/Object;Ljava/util/Collection;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    return-object p1
.end method

.method public static synthetic h(Ljava/util/List;)Ljava/util/List;
    .locals 1

    .line 1
    new-instance v0, Ll/fux;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fux;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/jux;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/jux;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ll/cvx;Landroid/database/Cursor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cvx;->q(Landroid/database/Cursor;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "video/"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic m(Ll/qcj;Lrx/c;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/rux;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rux;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static n(Ll/qcj;)Lrx/c$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "E:",
            "Lcom/p1/mobile/putong/data/Media;",
            ">(",
            "Ll/qcj<",
            "TE;TT;>;)",
            "Lrx/c$d<",
            "Ljava/util/List<",
            "TE;>;",
            "Ljava/util/List<",
            "Ll/v2i0<",
            "TT;TE;>;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ttx;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ttx;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private o(Landroid/net/Uri;)Ll/utv;
    .locals 12

    .line 1
    iget-boolean v0, p0, Ll/cvx;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/cvx;->d:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v2, Ll/uym;

    .line 10
    .line 11
    iget-object v3, p0, Ll/cvx;->b:Landroid/content/Context;

    .line 12
    .line 13
    sget-object v5, Ll/cvx;->j:[Ljava/lang/String;

    .line 14
    .line 15
    iget v9, p0, Ll/cvx;->e:I

    .line 16
    .line 17
    iget p0, p0, Ll/cvx;->f:I

    .line 18
    .line 19
    mul-int v10, v9, p0

    .line 20
    .line 21
    const-string v6, "media_type=1 OR media_type=3"

    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    const-string v8, "date_modified DESC"

    .line 25
    .line 26
    move-object v4, p1

    .line 27
    invoke-direct/range {v2 .. v10}, Ll/uym;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    return-object v2

    .line 31
    :cond_0
    move-object v5, p1

    .line 32
    iget-object v4, p0, Ll/cvx;->b:Landroid/content/Context;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v3, Ll/uym;

    .line 37
    .line 38
    sget-object v6, Ll/cvx;->j:[Ljava/lang/String;

    .line 39
    .line 40
    iget v10, p0, Ll/cvx;->e:I

    .line 41
    .line 42
    iget p0, p0, Ll/cvx;->f:I

    .line 43
    .line 44
    mul-int v11, v10, p0

    .line 45
    .line 46
    const-string v7, "media_type=3"

    .line 47
    .line 48
    const/4 v8, 0x0

    .line 49
    const-string v9, "date_modified DESC"

    .line 50
    .line 51
    invoke-direct/range {v3 .. v11}, Ll/uym;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;II)V

    .line 52
    .line 53
    .line 54
    return-object v3

    .line 55
    :cond_1
    new-instance v3, Ll/uym;

    .line 56
    .line 57
    sget-object v6, Ll/cvx;->j:[Ljava/lang/String;

    .line 58
    .line 59
    iget v10, p0, Ll/cvx;->e:I

    .line 60
    .line 61
    iget p0, p0, Ll/cvx;->f:I

    .line 62
    .line 63
    mul-int v11, v10, p0

    .line 64
    .line 65
    const-string v7, "media_type=1"

    .line 66
    .line 67
    const/4 v8, 0x0

    .line 68
    const-string v9, "date_modified DESC"

    .line 69
    .line 70
    invoke-direct/range {v3 .. v11}, Ll/uym;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    return-object v3
.end method

.method private synthetic p(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q(Landroid/database/Cursor;)V
    .locals 12

    .line 1
    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x1

    .line 23
    if-eqz v1, :cond_7

    .line 24
    .line 25
    sget-object v1, Ll/cvx;->j:[Ljava/lang/String;

    .line 26
    .line 27
    aget-object v3, v1, v2

    .line 28
    .line 29
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v4, 0x4

    .line 38
    aget-object v4, v1, v4

    .line 39
    .line 40
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    const/4 v5, 0x5

    .line 49
    aget-object v5, v1, v5

    .line 50
    .line 51
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    const/4 v6, 0x6

    .line 60
    aget-object v1, v1, v6

    .line 61
    .line 62
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-long v6, v1

    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    const-string v1, "gif"

    .line 81
    .line 82
    invoke-virtual {v5, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_3

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catch_0
    move-exception p0

    .line 90
    goto/16 :goto_3

    .line 91
    .line 92
    :cond_3
    new-instance v1, Ljava/io/File;

    .line 93
    .line 94
    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    if-eqz v8, :cond_1

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/io/File;->length()J

    .line 104
    .line 105
    .line 106
    move-result-wide v8

    .line 107
    const-wide/16 v10, 0x0

    .line 108
    .line 109
    cmp-long v1, v8, v10

    .line 110
    .line 111
    if-nez v1, :cond_4

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    if-ne v4, v2, :cond_5

    .line 115
    .line 116
    new-instance v1, Lcom/p1/mobile/putong/data/Picture;

    .line 117
    .line 118
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string v2, "image/*"

    .line 122
    .line 123
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_5
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    const-string v2, "video/*"

    .line 137
    .line 138
    if-eqz v1, :cond_6

    .line 139
    .line 140
    :try_start_1
    const-string v1, "mp4"

    .line 141
    .line 142
    invoke-virtual {v5, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_6

    .line 147
    .line 148
    new-instance v1, Lcom/p1/mobile/putong/data/Video;

    .line 149
    .line 150
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 151
    .line 152
    .line 153
    long-to-float v4, v6

    .line 154
    iput v4, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 155
    .line 156
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_6
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_1

    .line 170
    .line 171
    const-string v1, "3gp"

    .line 172
    .line 173
    invoke-virtual {v5, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_1

    .line 178
    .line 179
    new-instance v1, Lcom/p1/mobile/putong/data/Video;

    .line 180
    .line 181
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 182
    .line 183
    .line 184
    long-to-float v4, v6

    .line 185
    iput v4, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 186
    .line 187
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 194
    .line 195
    :goto_1
    const-string v2, "raw"

    .line 196
    .line 197
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 202
    .line 203
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_7
    invoke-static {}, Ll/wzx;->k()Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    const/4 v3, 0x0

    .line 213
    if-eqz v1, :cond_8

    .line 214
    .line 215
    iput-boolean v2, p0, Ll/cvx;->i:Z

    .line 216
    .line 217
    iput-boolean v3, p0, Ll/cvx;->g:Z

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_9

    .line 225
    .line 226
    iget v1, p0, Ll/cvx;->f:I

    .line 227
    .line 228
    if-eqz v1, :cond_9

    .line 229
    .line 230
    iput v3, p0, Ll/cvx;->f:I

    .line 231
    .line 232
    iput-boolean v3, p0, Ll/cvx;->g:Z

    .line 233
    .line 234
    return-void

    .line 235
    :cond_9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-nez v1, :cond_a

    .line 240
    .line 241
    iget v1, p0, Ll/cvx;->f:I

    .line 242
    .line 243
    if-nez v1, :cond_a

    .line 244
    .line 245
    iput-boolean v2, p0, Ll/cvx;->i:Z

    .line 246
    .line 247
    :cond_a
    iget v1, p0, Ll/cvx;->f:I

    .line 248
    .line 249
    add-int/2addr v1, v2

    .line 250
    iput v1, p0, Ll/cvx;->f:I

    .line 251
    .line 252
    :goto_2
    new-instance v1, Ll/nux;

    .line 253
    .line 254
    invoke-direct {v1, p0, v0}, Ll/nux;-><init>(Ll/cvx;Ljava/util/List;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :goto_3
    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-nez p1, :cond_b

    .line 266
    .line 267
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 268
    .line 269
    .line 270
    :cond_b
    :goto_4
    return-void
.end method


# virtual methods
.method public a(ILandroid/os/Bundle;)Ll/utv;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Ll/utv<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p1, "external"

    .line 2
    .line 3
    invoke-static {p1}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-boolean p1, p0, Ll/cvx;->h:Z

    .line 8
    .line 9
    const-string p2, ""

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, " LIMIT "

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ll/cvx;->e:I

    .line 21
    .line 22
    iget v3, p0, Ll/cvx;->f:I

    .line 23
    .line 24
    mul-int/2addr v1, v3

    .line 25
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, ","

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v1, p0, Ll/cvx;->e:I

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget v1, p0, Ll/cvx;->f:I

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Ll/cvx;->e:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    move-object p1, p2

    .line 62
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/cvx;->i:Z

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    iput-boolean p1, p0, Ll/cvx;->g:Z

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move-object p2, p1

    .line 71
    :goto_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 72
    .line 73
    const/16 v0, 0x1e

    .line 74
    .line 75
    if-lt p1, v0, :cond_3

    .line 76
    .line 77
    invoke-direct {p0, v2}, Ll/cvx;->o(Landroid/net/Uri;)Ll/utv;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_3
    const-string p1, "date_modified DESC"

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    iget-boolean p1, p0, Ll/cvx;->c:Z

    .line 89
    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    iget-boolean p2, p0, Ll/cvx;->d:Z

    .line 93
    .line 94
    if-eqz p2, :cond_4

    .line 95
    .line 96
    new-instance v0, Ll/wyb;

    .line 97
    .line 98
    iget-object v1, p0, Ll/cvx;->b:Landroid/content/Context;

    .line 99
    .line 100
    sget-object v3, Ll/cvx;->j:[Ljava/lang/String;

    .line 101
    .line 102
    const-string v4, "media_type=1 OR media_type=3"

    .line 103
    .line 104
    const/4 v5, 0x0

    .line 105
    invoke-direct/range {v0 .. v6}, Ll/wyb;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-object v0

    .line 109
    :cond_4
    iget-object v1, p0, Ll/cvx;->b:Landroid/content/Context;

    .line 110
    .line 111
    if-eqz p1, :cond_5

    .line 112
    .line 113
    new-instance v0, Ll/wyb;

    .line 114
    .line 115
    sget-object v3, Ll/cvx;->j:[Ljava/lang/String;

    .line 116
    .line 117
    const-string v4, "media_type=3"

    .line 118
    .line 119
    const/4 v5, 0x0

    .line 120
    invoke-direct/range {v0 .. v6}, Ll/wyb;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-object v0

    .line 124
    :cond_5
    new-instance v0, Ll/wyb;

    .line 125
    .line 126
    sget-object v3, Ll/cvx;->j:[Ljava/lang/String;

    .line 127
    .line 128
    const-string v4, "media_type=1"

    .line 129
    .line 130
    const/4 v5, 0x0

    .line 131
    invoke-direct/range {v0 .. v6}, Ll/wyb;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-object v0
.end method

.method public bridge synthetic b(Ll/utv;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Landroid/database/Cursor;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cvx;->s(Ll/utv;Landroid/database/Cursor;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/utv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/utv<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public r()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ll/utv;Landroid/database/Cursor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/utv<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/cvx;->a:Lrx/subjects/a;

    .line 4
    .line 5
    new-instance p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p2}, Landroid/database/Cursor;->isClosed()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/4 p1, -0x1

    .line 22
    invoke-interface {p2, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/bux;

    .line 26
    .line 27
    invoke-direct {p1, p0, p2}, Ll/bux;-><init>(Ll/cvx;Landroid/database/Cursor;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public t()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cvx;->r()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/xtx;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/xtx;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public u()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Video;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cvx;->r()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/otx;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/otx;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
