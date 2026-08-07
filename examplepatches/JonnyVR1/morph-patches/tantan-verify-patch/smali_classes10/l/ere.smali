.class public Ll/ere;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qsl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ere$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/uqe;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ere;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ere;->b:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ll/uqe;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/uqe;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ere;->c:Ll/uqe;

    .line 24
    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Ll/fre;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ll/ere;-><init>()V

    return-void
.end method

.method public static synthetic b(Ljava/util/HashMap;)Landroid/util/Pair;
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Ll/zpe;->b()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "effect"

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public static synthetic c(Ljava/util/List;)Ljava/util/HashMap;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 21
    .line 22
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-object v0
.end method

.method public static synthetic d(Ll/ere;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ere;->k(Landroid/util/Pair;)V

    return-void
.end method

.method public static i()Ll/ere;
    .locals 1

    .line 1
    sget-object v0, Ll/ere$a;->a:Ll/ere;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Landroid/util/Pair;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/uqe;->a(Landroid/util/Pair;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ere;->b:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/ere;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ere;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;)V
    .locals 1

    .line 1
    const-string v0, "\u6e05\u7406\u8d44\u6e90"

    .line 2
    .line 3
    invoke-static {v0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;->liveResources:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string p0, "\u6e05\u7406\u8d44\u6e90\u5217\u8868\u4e3a\u7a7a"

    .line 15
    .line 16
    invoke-static {p0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;->liveResources:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Ll/are;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/are;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/bre;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/bre;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/cre;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/cre;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/dre;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/dre;-><init>(Ll/ere;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ere;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public j(Ljava/lang/String;)Z
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/ere;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final synthetic k(Landroid/util/Pair;)V
    .locals 12

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, [Ljava/io/File;

    .line 8
    .line 9
    array-length v1, p1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ge v3, v1, :cond_4

    .line 13
    .line 14
    aget-object v4, p1, v3

    .line 15
    .line 16
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v0, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    if-eqz v5, :cond_2

    .line 25
    .line 26
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 35
    .line 36
    if-nez v4, :cond_0

    .line 37
    .line 38
    goto/16 :goto_2

    .line 39
    .line 40
    :cond_0
    new-instance v5, Ljava/io/File;

    .line 41
    .line 42
    invoke-static {}, Ll/zpe;->b()Ljava/io/File;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    new-instance v7, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v8, "effect"

    .line 49
    .line 50
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v9, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v8, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_3

    .line 83
    .line 84
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    if-eqz v5, :cond_3

    .line 89
    .line 90
    array-length v6, v5

    .line 91
    move v7, v2

    .line 92
    :goto_1
    if-ge v7, v6, :cond_3

    .line 93
    .line 94
    aget-object v8, v5, v7

    .line 95
    .line 96
    iget-object v9, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v9}, Ll/w2t;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    if-nez v9, :cond_1

    .line 111
    .line 112
    iget-object v9, p0, Ll/ere;->b:Ljava/util/List;

    .line 113
    .line 114
    iget-object v10, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-interface {v9, v10}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    invoke-static {v8}, Ll/xgt;->c(Ljava/io/File;)Z

    .line 120
    .line 121
    .line 122
    move-result v9

    .line 123
    new-instance v10, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string v11, "\u6e05\u7406\u65e0\u6548md5\u8d44\u6e90 : "

    .line 126
    .line 127
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v8

    .line 137
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    invoke-static {v8}, Ll/muj;->u(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_2
    iget-object v5, p0, Ll/ere;->b:Ljava/util/List;

    .line 151
    .line 152
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    invoke-interface {v5, v6}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    invoke-static {v4}, Ll/xgt;->c(Ljava/io/File;)Z

    .line 160
    .line 161
    .line 162
    move-result v5

    .line 163
    new-instance v6, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v7, "\u6e05\u7406\u65e0\u6548effect\u8d44\u6e90 : "

    .line 166
    .line 167
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    invoke-static {v4}, Ll/muj;->u(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_4
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveEffect;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0, v0}, Ll/ere;->n(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/e4d0;Ll/w8e;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/data/Priority;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveEffect;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, v0}, Ll/ere;->n(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/e4d0;Ll/w8e;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/e4d0;Ll/w8e;)V
    .locals 8
    .param p2    # Lcom/p1/mobile/putong/live/base/data/Priority;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/e4d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/w8e;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/ere;->a:Ljava/util/Map;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->isDownloadNow()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    new-instance p0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "EffectManager loadEffect effect type empty id; "

    .line 37
    .line 38
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    if-nez p2, :cond_3

    .line 55
    .line 56
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->priority:Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 57
    .line 58
    :cond_3
    move-object v5, p2

    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/l4;->a()Ll/wpq0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 76
    .line 77
    move-object v7, p3

    .line 78
    move-object v6, p4

    .line 79
    invoke-virtual/range {v0 .. v7}, Ll/w5;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/w8e;Ll/e4d0;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    :goto_0
    return-void
.end method

.method public o(Ljava/util/List;)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "1000001"

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->download:I

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->loadTypes:Ljava/util/List;

    .line 16
    .line 17
    const-string v2, "appStart"

    .line 18
    .line 19
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->loadTypes:Ljava/util/List;

    .line 23
    .line 24
    const-string v2, "voiceRoom"

    .line 25
    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->downloadType:I

    .line 31
    .line 32
    const-string v1, "HD"

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 35
    .line 36
    const-string v1, "game"

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "IMMEDIATE"

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->priority:Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 47
    .line 48
    const-string v1, "https://auto.tancdn.com/v1/raw/5e432fe7-ad11-4307-a428-9c046bfeaa4311.zip"

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "9c5fb0eef628b45e249b38ccd0ec79c0"

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_0

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 74
    .line 75
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->downloadType:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/ere;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    return-void
.end method

.method public p(Landroid/util/Pair;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqe;->d(Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqe;->e(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uqe;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Landroid/util/Pair;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqe;->g(Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqe;->h(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uqe;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Landroid/util/Pair;)V
    .locals 0
    .param p1    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ere;->c:Ll/uqe;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqe;->j(Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, v0}, Ll/ere;->x(Ljava/lang/String;Ll/e4d0;Ll/w8e;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x(Ljava/lang/String;Ll/e4d0;Ll/w8e;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/aiv;->a1(Ljava/lang/String;Ll/e4d0;Ll/w8e;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    const-string p0, "app"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-static {v0, v0, p0}, Ll/aiv;->b1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V
    .locals 0

    .line 1
    invoke-static {p1, p2, p3}, Ll/aiv;->b1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
