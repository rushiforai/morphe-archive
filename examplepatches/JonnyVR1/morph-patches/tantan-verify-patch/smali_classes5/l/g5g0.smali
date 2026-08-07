.class public Ll/g5g0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/g5g0;


# instance fields
.field public a:Ll/dyd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dyd0<",
            "Lcom/p1/mobile/putong/core/data/EmojiCacheData;",
            ">;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/g5g0;->e()Ll/g5g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/g5g0;->d()Ll/dyd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static e()Ll/g5g0;
    .locals 2

    .line 1
    sget-object v0, Ll/g5g0;->b:Ll/g5g0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/g5g0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/g5g0;->b:Ll/g5g0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/g5g0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/g5g0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/g5g0;->b:Ll/g5g0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/g5g0;->b:Ll/g5g0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final b(Ljava/lang/String;)Ll/dyd0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/dyd0<",
            "Lcom/p1/mobile/putong/core/data/EmojiCacheData;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/g5g0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Ll/g5g0$a;-><init>(Ll/g5g0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public c(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/g5g0;->e()Ll/g5g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/g5g0;->d()Ll/dyd0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p1, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->useNumber:J

    .line 40
    .line 41
    new-instance v0, Ll/f5g0;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/f5g0;-><init>(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->dataList:Ljava/util/List;

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public d()Ll/dyd0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/dyd0<",
            "Lcom/p1/mobile/putong/core/data/EmojiCacheData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/g5g0;->a:Ll/dyd0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "emoji_cache_data_v3"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/g5g0;->b(Ljava/lang/String;)Ll/dyd0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/g5g0;->a:Ll/dyd0;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/g5g0;->a:Ll/dyd0;

    .line 14
    .line 15
    return-object p0
.end method

.method public declared-synchronized f(Ljava/lang/String;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_7

    .line 7
    .line 8
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/g5g0;->e()Ll/g5g0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/g5g0;->d()Ll/dyd0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x0

    .line 35
    const/16 v3, 0x8

    .line 36
    .line 37
    if-le v1, v3, :cond_1

    .line 38
    .line 39
    invoke-interface {p2, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    goto/16 :goto_4

    .line 46
    .line 47
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->new_()Lcom/p1/mobile/putong/core/data/EmojiCacheItem;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->dataList:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    iput-wide v3, v1, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->useNumber:J

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->new_()Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 66
    .line 67
    invoke-direct {p2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 71
    .line 72
    :cond_2
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const/16 v3, 0x14

    .line 79
    .line 80
    if-lt p2, v3, :cond_6

    .line 81
    .line 82
    new-array v3, p2, [J

    .line 83
    .line 84
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 85
    .line 86
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-eqz v5, :cond_3

    .line 99
    .line 100
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    check-cast v5, Ljava/util/Map$Entry;

    .line 105
    .line 106
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;

    .line 111
    .line 112
    iget-wide v5, v5, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->useNumber:J

    .line 113
    .line 114
    aput-wide v5, v3, v2

    .line 115
    .line 116
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_3
    invoke-static {v3}, Ljava/util/Arrays;->sort([J)V

    .line 120
    .line 121
    .line 122
    div-int/lit8 p2, p2, 0x2

    .line 123
    .line 124
    aget-wide v2, v3, p2

    .line 125
    .line 126
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 127
    .line 128
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-eqz v5, :cond_5

    .line 141
    .line 142
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Ljava/util/Map$Entry;

    .line 147
    .line 148
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    check-cast v5, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;

    .line 153
    .line 154
    iget-wide v5, v5, Lcom/p1/mobile/putong/core/data/EmojiCacheItem;->useNumber:J

    .line 155
    .line 156
    cmp-long v5, v5, v2

    .line 157
    .line 158
    if-gtz v5, :cond_4

    .line 159
    .line 160
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_5
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 165
    .line 166
    :cond_6
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->key:Ljava/util/Map;

    .line 167
    .line 168
    invoke-interface {p2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ll/g5g0;->e()Ll/g5g0;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Ll/g5g0;->d()Ll/dyd0;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    .line 181
    .line 182
    monitor-exit p0

    .line 183
    return-void

    .line 184
    :cond_7
    :goto_3
    monitor-exit p0

    .line 185
    return-void

    .line 186
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    throw p1
.end method
