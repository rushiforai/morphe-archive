.class public Ll/wd00;
.super Ll/xi5;
.source "SourceFile"


# static fields
.field public static final CLOUD_API_TAG:Ljava/lang/String; = "cloud_tag"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xi5;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ku10$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ku10$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/ku10;->j:Ll/e7y;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/util/Map$Entry;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v3, v1, v0}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 61
    .line 62
    const-string v0, "preprocessed"

    .line 63
    .line 64
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string v0, "image"

    .line 79
    .line 80
    invoke-static {v3, p2, p0, v0}, Ll/wd00;->z(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object p2, Ll/uqb0;->c0:Ll/bn5;

    .line 90
    .line 91
    invoke-interface {p2}, Ll/bn5;->D5()Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_2

    .line 96
    .line 97
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    :cond_1
    :goto_1
    move-object v6, p0

    .line 104
    goto :goto_2

    .line 105
    :cond_2
    sget-object p2, Ll/uqb0;->c0:Ll/bn5;

    .line 106
    .line 107
    invoke-interface {p2}, Ll/bn5;->signedIn_()Z

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-nez p2, :cond_1

    .line 112
    .line 113
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    goto :goto_1

    .line 120
    :goto_2
    new-instance v2, Ll/ud00;

    .line 121
    .line 122
    move-object v4, p1

    .line 123
    move-object v7, p3

    .line 124
    move-object v5, p4

    .line 125
    invoke-direct/range {v2 .. v7}, Ll/ud00;-><init>(Ll/ku10$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v2}, Ll/e9t;->a(Ll/pcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance p1, Ll/vd00;

    .line 133
    .line 134
    invoke-direct {p1}, Ll/vd00;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :cond_3
    new-instance p0, Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method public static B(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/UploadSource;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "mln"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v0, v1, p2, p1}, Ll/wd00;->A(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic y(Ll/ku10$a;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ku10$a;->e()Ll/ku10;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/d3d0;

    .line 6
    .line 7
    const-string v1, "cloud_tag"

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Ll/d3d0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p1, "image"

    .line 13
    .line 14
    iput-object p1, v0, Ll/d3d0;->c:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const-string p1, "X-Putong-Cloud-Module"

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p3, p1, p2}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p3, v0}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p4}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static z(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "form-data; name=\""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p3, "\"; filename=\"filename.cache\""

    .line 12
    .line 13
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    const-string v0, "Content-Transfer-Encoding"

    .line 21
    .line 22
    const-string v1, "binary"

    .line 23
    .line 24
    const-string v2, "Content-Disposition"

    .line 25
    .line 26
    filled-new-array {v2, p3, v0, v1}, [Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-static {p3}, Ll/e0l;->j([Ljava/lang/String;)Ll/e0l;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p1}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ljava/io/File;

    .line 39
    .line 40
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p3, p1}, Ll/ku10$a;->c(Ll/e0l;Ll/z1d0;)Ll/ku10$a;

    .line 48
    .line 49
    .line 50
    return-void
.end method
