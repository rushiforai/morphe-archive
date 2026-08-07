.class public Ll/lao;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)Ll/xwr$a;
    .locals 3

    .line 1
    new-instance v0, Ll/xwr$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xwr$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerMedia:Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;->bannerUrl:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/xwr$a;->f(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->title:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/xwr$a;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerType:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/xwr$a;->i(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setType(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->jumpUrl:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoData(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/xwr$a;->e(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static synthetic b(Ll/r6s;Ll/r6s;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r6s;->localRowIndex:I

    .line 2
    .line 3
    iget p1, p1, Ll/r6s;->localRowIndex:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static c(Ll/p5u;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p5u;",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Ll/ubu;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Ll/ubu;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v4, "square-nearby"

    .line 30
    .line 31
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, 0x3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    const/16 v3, 0xbbf

    .line 39
    .line 40
    invoke-static {v3}, Ll/ybu;->a(I)Ll/r6s;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    new-instance v5, Ll/byu;

    .line 45
    .line 46
    invoke-direct {v5}, Ll/byu;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v2, v5, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v4, v5, v2}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {v5, v1, v2}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v5}, Ll/r6s;->v(Ll/byu;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    const/16 v3, 0xbbe

    .line 73
    .line 74
    invoke-static {v3}, Ll/ybu;->a(I)Ll/r6s;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    new-instance v5, Ll/byu;

    .line 79
    .line 80
    invoke-direct {v5}, Ll/byu;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v2, v5, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v4, v5, v2}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-static {v5, v1, v2}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, v5}, Ll/r6s;->v(Ll/byu;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/p5u;->c:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-eqz v2, :cond_3

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 128
    .line 129
    iget-object v3, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 130
    .line 131
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_2

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    const/4 v3, 0x1

    .line 139
    invoke-static {v3}, Ll/ybu;->a(I)Ll/r6s;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    new-instance v5, Ll/xwr;

    .line 144
    .line 145
    invoke-direct {v5}, Ll/xwr;-><init>()V

    .line 146
    .line 147
    .line 148
    iget-object v6, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->id:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v5, v6}, Ll/xwr;->d(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object v6, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->type:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v5, v6}, Ll/xwr;->c(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iput-boolean v3, v5, Ll/xwr;->localAutoScroll:Z

    .line 159
    .line 160
    iget-object v3, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 161
    .line 162
    new-instance v6, Ll/jao;

    .line 163
    .line 164
    invoke-direct {v6}, Ll/jao;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-static {v3, v6}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {v5, v3}, Ll/xwr;->e(Ljava/util/List;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v4, v5}, Ll/r6s;->q(Ll/xwr;)V

    .line 175
    .line 176
    .line 177
    iget v2, v2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->rowIndex:I

    .line 178
    .line 179
    iput v2, v4, Ll/r6s;->localRowIndex:I

    .line 180
    .line 181
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_3
    new-instance p0, Ll/kao;

    .line 186
    .line 187
    invoke-direct {p0}, Ll/kao;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {v0, v1, p0}, Ll/lao;->f(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    return-object v0
.end method

.method public static d(Ll/r6s;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/r6s;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xbbe

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/r6s;->d()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-ne p0, v0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x6

    .line 19
    return p0

    .line 20
    :cond_1
    return v2
.end method

.method public static e(Ll/r6s;IZLjava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/r6s;",
            "IZ",
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-interface {p3, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    move v1, v0

    .line 9
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v0, v2, :cond_2

    .line 14
    .line 15
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ll/r6s;

    .line 20
    .line 21
    invoke-static {v2}, Ll/lao;->d(Ll/r6s;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/2addr v1, v2

    .line 26
    mul-int/lit8 v2, p1, 0x6

    .line 27
    .line 28
    if-lt v1, v2, :cond_1

    .line 29
    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    invoke-interface {p3, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    if-eqz p2, :cond_4

    .line 40
    .line 41
    rem-int/lit8 p1, v1, 0x6

    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    add-int/lit8 p1, p1, -0x1

    .line 50
    .line 51
    :goto_1
    if-ltz p1, :cond_4

    .line 52
    .line 53
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Ll/r6s;

    .line 58
    .line 59
    invoke-static {p2}, Ll/lao;->d(Ll/r6s;)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    sub-int/2addr v1, p2

    .line 64
    invoke-interface {p3, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    rem-int/lit8 p2, v1, 0x6

    .line 68
    .line 69
    if-nez p2, :cond_3

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    add-int/lit8 p1, p1, -0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    :goto_2
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    add-int/lit8 p0, p0, -0x1

    .line 83
    .line 84
    return p0
.end method

.method public static f(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;",
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ll/r6s;

    .line 14
    .line 15
    iget v3, v2, Ll/r6s;->localRowIndex:I

    .line 16
    .line 17
    invoke-static {v2, v3, v0, p0}, Ll/lao;->e(Ll/r6s;IZLjava/util/List;)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v2}, Ll/r6s;->b()Ll/xwr;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    move v4, v0

    .line 28
    :goto_1
    invoke-virtual {v2}, Ll/xwr;->b()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ge v4, v5, :cond_0

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/xwr;->b()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    check-cast v5, Ll/xwr$a;

    .line 47
    .line 48
    new-instance v6, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 49
    .line 50
    invoke-direct {v6}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v7, "e_live_banner"

    .line 54
    .line 55
    invoke-virtual {v6, v7}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setModuleId(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v6, p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->setPageId(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v7, "banner_id"

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/xwr;->a()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    invoke-virtual {v6, v7, v8}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    const-string v7, "banner_type"

    .line 71
    .line 72
    invoke-virtual {v5}, Ll/xwr$a;->d()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    invoke-virtual {v6, v7, v8}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    add-int/lit8 v7, v3, 0x1

    .line 80
    .line 81
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    const-string v8, "index"

    .line 86
    .line 87
    invoke-virtual {v6, v8, v7}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    add-int/lit8 v4, v4, 0x1

    .line 91
    .line 92
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    const-string v8, "sub_index"

    .line 97
    .line 98
    invoke-virtual {v6, v8, v7}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v6}, Ll/xwr$a;->h(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_1
    return-void
.end method
