.class public Ll/yb5;
.super Ll/xi5;
.source "SourceFile"


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

.method public static synthetic A(ZLcom/p1/mobile/putong/data/DetectRequest;)Ll/x1d0;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    const-string v0, "/antispam/content/detect"

    .line 17
    .line 18
    invoke-static {v0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/DetectRequest;->toJson()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic B(ILcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "media"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic C(Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iput-wide v0, v2, Lcom/p1/mobile/putong/data/Media;->uploadStartTime:J

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Detect;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic E(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Ll/x1d0;
    .locals 3

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
    iput-object p2, v0, Ll/d3d0;->c:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    const-string v1, "X-Putong-Cloud-Module"

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-virtual {p4, v1, p3}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 23
    .line 24
    .line 25
    :cond_0
    const-string p3, "/upload/"

    .line 26
    .line 27
    const-class v1, Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    const-string v2, "video"

    .line 32
    .line 33
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    const-string p7, "X-Putong-Module"

    .line 40
    .line 41
    invoke-virtual {p4, p7, p1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, v0}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, v1, p5}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-eqz p6, :cond_1

    .line 54
    .line 55
    const-string p2, "/verification-video/upload"

    .line 56
    .line 57
    invoke-static {p2}, Ll/xi5;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p4, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {p2}, Ll/xi5;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    :goto_0
    invoke-virtual {p1, p2}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p6

    .line 95
    if-nez p6, :cond_3

    .line 96
    .line 97
    iput-object p1, v0, Ll/d3d0;->a:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    const-string p1, "moment"

    .line 101
    .line 102
    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    iput-object p7, v0, Ll/d3d0;->a:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    const-string p1, "unknown"

    .line 112
    .line 113
    iput-object p1, v0, Ll/d3d0;->a:Ljava/lang/String;

    .line 114
    .line 115
    :goto_1
    invoke-virtual {p4, v0}, Ll/x1d0$a;->p(Ljava/lang/Object;)Ll/x1d0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1, v1, p5}, Ll/x1d0$a;->o(Ljava/lang/Class;Ljava/lang/Object;)Ll/x1d0$a;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p4

    .line 127
    if-nez p4, :cond_5

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_5
    new-instance p4, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p4, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-static {p2}, Ll/xi5;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p8

    .line 146
    :goto_2
    invoke-virtual {p1, p8}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    return-object p0
.end method

.method public static synthetic F(Ljava/util/List;ZLjava/util/List;Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 10

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-ge v3, v4, :cond_6

    .line 22
    .line 23
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 30
    .line 31
    const-string v6, "preprocessed"

    .line 32
    .line 33
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    if-eqz v5, :cond_5

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_0
    new-instance v5, Ll/ub5;

    .line 49
    .line 50
    invoke-direct {v5, v3}, Ll/ub5;-><init>(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {p3, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 58
    .line 59
    :goto_1
    const/4 v6, 0x0

    .line 60
    if-eqz v5, :cond_4

    .line 61
    .line 62
    instance-of v7, v4, Lcom/p1/mobile/putong/data/Video;

    .line 63
    .line 64
    if-eqz v7, :cond_1

    .line 65
    .line 66
    new-instance v7, Ll/vb5;

    .line 67
    .line 68
    invoke-direct {v7, v3}, Ll/vb5;-><init>(I)V

    .line 69
    .line 70
    .line 71
    invoke-static {p3, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    check-cast v7, Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    if-eqz v7, :cond_1

    .line 78
    .line 79
    instance-of v8, v5, Lcom/p1/mobile/putong/data/Video;

    .line 80
    .line 81
    if-eqz v8, :cond_1

    .line 82
    .line 83
    move-object v8, v5

    .line 84
    check-cast v8, Lcom/p1/mobile/putong/data/Video;

    .line 85
    .line 86
    iput-object v7, v8, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 87
    .line 88
    :cond_1
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    if-eqz v7, :cond_3

    .line 93
    .line 94
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    if-eqz v7, :cond_3

    .line 99
    .line 100
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    iget-object v9, v8, Lcom/p1/mobile/putong/data/Media;->tempUrl:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    if-eqz v9, :cond_2

    .line 115
    .line 116
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 117
    .line 118
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v9, v7, v8}, Ll/fsb0;->G0(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_2
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 127
    .line 128
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Media;->tempUrl:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v9, v7, v8}, Ll/fsb0;->G0(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_3
    :goto_2
    invoke-static {v5, v4}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->m(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)V

    .line 136
    .line 137
    .line 138
    iput-wide v0, v5, Lcom/p1/mobile/putong/data/Media;->uploadEndTime:J

    .line 139
    .line 140
    invoke-interface {p2, v3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    iput-object v6, v5, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_4
    new-instance p0, Lcom/tantanapp/common/network/ApiExcep$UploadedMediaNotFound;

    .line 147
    .line 148
    invoke-direct {p0, v6}, Lcom/tantanapp/common/network/ApiExcep$UploadedMediaNotFound;-><init>(Ll/i5d0;)V

    .line 149
    .line 150
    .line 151
    throw p0

    .line 152
    :cond_5
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_6
    return-object p2
.end method

.method public static G(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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

.method public static H(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    :cond_0
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1, v0, p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception v1

    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 20
    .line 21
    mul-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    iput v1, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 24
    .line 25
    const/16 v2, 0x400

    .line 26
    .line 27
    if-lt v1, v2, :cond_0

    .line 28
    .line 29
    :goto_0
    return-object v0
.end method

.method public static I(Ljava/util/List;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/yb5;->J(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static J(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0, p3}, Ll/yb5;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v3, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/yb5;->N(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static M(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/yb5;->N(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static N(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/yb5;->O(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static O(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/UploadSource;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
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
    invoke-static/range {p4 .. p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/util/Map$Entry;

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v3, v2, v1}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x0

    .line 65
    move v2, v1

    .line 66
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-eqz v4, :cond_7

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 77
    .line 78
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 79
    .line 80
    const-string v6, "normal"

    .line 81
    .line 82
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-nez v5, :cond_6

    .line 87
    .line 88
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 89
    .line 90
    const-string v6, "raw"

    .line 91
    .line 92
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-nez v5, :cond_5

    .line 97
    .line 98
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 99
    .line 100
    const-string v6, "preprocessed"

    .line 101
    .line 102
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_6

    .line 107
    .line 108
    add-int/lit8 v1, v1, 0x1

    .line 109
    .line 110
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Video;

    .line 111
    .line 112
    if-eqz v5, :cond_1

    .line 113
    .line 114
    move-object v6, v4

    .line 115
    check-cast v6, Lcom/p1/mobile/putong/data/Video;

    .line 116
    .line 117
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 118
    .line 119
    if-eqz v6, :cond_1

    .line 120
    .line 121
    iget-object v7, v6, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v6}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    new-instance v8, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v9, "cover"

    .line 132
    .line 133
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v8

    .line 143
    invoke-static {v3, v7, v6, v8}, Ll/yb5;->G(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_1
    if-eqz v5, :cond_4

    .line 147
    .line 148
    move-object v5, v4

    .line 149
    check-cast v5, Lcom/p1/mobile/putong/data/Video;

    .line 150
    .line 151
    iget-boolean v6, v5, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 152
    .line 153
    if-eqz v6, :cond_4

    .line 154
    .line 155
    iget-boolean v6, v5, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 156
    .line 157
    if-nez v6, :cond_3

    .line 158
    .line 159
    iget-boolean v6, v5, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 160
    .line 161
    if-eqz v6, :cond_2

    .line 162
    .line 163
    iget-boolean v5, v5, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 164
    .line 165
    if-nez v5, :cond_2

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_2
    const-string v5, "gif"

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_3
    :goto_2
    const-string v5, "both"

    .line 172
    .line 173
    :goto_3
    const-string v6, "take_photo"

    .line 174
    .line 175
    invoke-virtual {v3, v6, v5}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 176
    .line 177
    .line 178
    :cond_4
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 179
    .line 180
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 181
    .line 182
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    new-instance v6, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    const-string v7, "media"

    .line 189
    .line 190
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    invoke-static {v3, v5, v4, v6}, Ll/yb5;->G(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_4

    .line 204
    :cond_5
    invoke-static {}, Ll/wpg0;->a()V

    .line 205
    .line 206
    .line 207
    const/4 p0, 0x0

    .line 208
    return-object p0

    .line 209
    :cond_6
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 210
    .line 211
    goto/16 :goto_1

    .line 212
    .line 213
    :cond_7
    if-nez v1, :cond_8

    .line 214
    .line 215
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    return-object p0

    .line 220
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    .line 221
    .line 222
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 223
    .line 224
    .line 225
    new-instance v1, Ll/pb5;

    .line 226
    .line 227
    invoke-direct {v1}, Ll/pb5;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    if-eqz v1, :cond_9

    .line 235
    .line 236
    const-string v1, "video"

    .line 237
    .line 238
    :goto_5
    move-object v5, v1

    .line 239
    goto :goto_6

    .line 240
    :cond_9
    new-instance v1, Ll/qb5;

    .line 241
    .line 242
    invoke-direct {v1}, Ll/qb5;-><init>()V

    .line 243
    .line 244
    .line 245
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    if-eqz v1, :cond_a

    .line 250
    .line 251
    const-string v1, "audio"

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_a
    const-string v1, "image"

    .line 255
    .line 256
    goto :goto_5

    .line 257
    :goto_6
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->n(Ljava/util/List;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v8

    .line 261
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 262
    .line 263
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 268
    .line 269
    invoke-interface {v2}, Ll/bn5;->D5()Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    if-eqz v2, :cond_c

    .line 274
    .line 275
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 276
    .line 277
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp()Ll/x1d0$a;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    :cond_b
    :goto_7
    move-object v7, v1

    .line 282
    goto :goto_8

    .line 283
    :cond_c
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 284
    .line 285
    invoke-interface {v2}, Ll/bn5;->signedIn_()Z

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    if-nez v2, :cond_b

    .line 290
    .line 291
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 292
    .line 293
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    goto :goto_7

    .line 298
    :goto_8
    new-instance v2, Ll/rb5;

    .line 299
    .line 300
    move-object v10, p1

    .line 301
    move-object v4, p2

    .line 302
    move v9, p3

    .line 303
    move-object/from16 v11, p5

    .line 304
    .line 305
    move-object/from16 v6, p6

    .line 306
    .line 307
    invoke-direct/range {v2 .. v11}, Ll/rb5;-><init>(Ll/ku10$a;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;Ll/x1d0$a;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    new-instance p1, Ll/ti20;

    .line 311
    .line 312
    const/4 p2, 0x1

    .line 313
    invoke-direct {p1, v2, p2}, Ll/ti20;-><init>(Ll/pcj;Z)V

    .line 314
    .line 315
    .line 316
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->g0(Ljava/util/List;)Lrx/c$d;

    .line 317
    .line 318
    .line 319
    move-result-object p2

    .line 320
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    new-instance p2, Ll/sb5;

    .line 325
    .line 326
    invoke-direct {p2, p0, p3, v0}, Ll/sb5;-><init>(Ljava/util/List;ZLjava/util/List;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    new-instance p2, Ll/tb5;

    .line 334
    .line 335
    invoke-direct {p2, p0}, Ll/tb5;-><init>(Ljava/util/List;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p1, p2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    return-object p0
.end method

.method public static P(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    int-to-float p1, p1

    .line 8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    div-float/2addr p1, v1

    .line 14
    int-to-float p2, p2

    .line 15
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    div-float/2addr p2, v1

    .line 21
    new-instance v1, Landroid/graphics/Matrix;

    .line 22
    .line 23
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, p1, p2, v2, v2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Landroid/graphics/Canvas;

    .line 31
    .line 32
    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 36
    .line 37
    .line 38
    new-instance p2, Landroid/graphics/Paint;

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    invoke-direct {p2, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p0, v2, v2, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 45
    .line 46
    .line 47
    return-object v0
.end method

.method public static Q(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/DetectRequest;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Detect;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ll/ti20;

    .line 8
    .line 9
    new-instance v2, Ll/wb5;

    .line 10
    .line 11
    invoke-direct {v2, v0, p0}, Ll/wb5;-><init>(ZLcom/p1/mobile/putong/data/DetectRequest;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v1, v2}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/xb5;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/xb5;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "audio"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic y(ILcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "cover"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "video"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
