.class public Ll/doi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static e:Ll/doi;

.field public static f:I

.field public static g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/doi;->g:Ljava/util/List;

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
    iput-object v0, p0, Ll/doi;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/doi;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/doi;Landroid/content/Context;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/doi;->p(Landroid/content/Context;Ll/y20;)V

    return-void
.end method

.method public static synthetic b(Ll/doi;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/doi;->q(Ll/y20;)V

    return-void
.end method

.method public static synthetic c(Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/momo/mcamera/filtermanager/MMPresetFilter;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    iget-object p1, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr p0, p1

    .line 22
    return p0
.end method

.method public static synthetic e(Ll/y20;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()V
    .locals 1

    .line 1
    sget v0, Ll/doi;->f:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Ll/doi;->f:I

    .line 6
    .line 7
    return-void
.end method

.method public static j()Ll/doi;
    .locals 1

    .line 1
    sget-object v0, Ll/doi;->e:Ll/doi;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/doi;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/doi;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/doi;->e:Ll/doi;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/doi;->e:Ll/doi;

    .line 13
    .line 14
    return-object v0
.end method

.method public static u()V
    .locals 1

    .line 1
    sget v0, Ll/doi;->f:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    sput v0, Ll/doi;->f:I

    .line 8
    .line 9
    :cond_0
    return-void
.end method


# virtual methods
.method public final g(Ljava/util/List;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 16
    .line 17
    iget-object v0, p2, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/doi;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/doi;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final i(Landroid/content/Context;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/doi;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/rni;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Ll/rni;-><init>(Ll/doi;Landroid/content/Context;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final k(Landroid/content/Context;)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/uli;->e()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_0
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    array-length v2, v1

    .line 22
    const/4 v3, 0x0

    .line 23
    :goto_0
    if-ge v3, v2, :cond_5

    .line 24
    .line 25
    aget-object v4, v1, v3

    .line 26
    .line 27
    new-instance v5, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 28
    .line 29
    invoke-direct {v5, p1}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    const/4 v7, 0x1

    .line 41
    if-nez v6, :cond_1

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    const-string v8, "_"

    .line 48
    .line 49
    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    add-int/2addr v6, v7

    .line 54
    if-lez v6, :cond_1

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    if-ge v6, v8, :cond_1

    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    invoke-virtual {v8, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    iput-object v6, v5, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v6, v5, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 77
    .line 78
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    if-nez v6, :cond_2

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    invoke-static {p1, v4, v5}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 86
    .line 87
    .line 88
    new-instance v6, Ljava/io/File;

    .line 89
    .line 90
    new-instance v8, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v9, "/icon.jpg"

    .line 103
    .line 104
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 115
    .line 116
    .line 117
    move-result v8

    .line 118
    if-eqz v8, :cond_4

    .line 119
    .line 120
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 121
    .line 122
    .line 123
    move-result-wide v10

    .line 124
    const-wide/16 v12, 0x0

    .line 125
    .line 126
    cmp-long v6, v10, v12

    .line 127
    .line 128
    if-gtz v6, :cond_3

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    iput-boolean v7, v5, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isIconLocal:Z

    .line 132
    .line 133
    new-instance v6, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    iput-object v6, v5, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 153
    .line 154
    new-instance v6, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v4, "/Lookup.png"

    .line 167
    .line 168
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    iput-object v4, v5, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {p0, v5}, Ll/doi;->n(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    if-ltz v4, :cond_4

    .line 182
    .line 183
    invoke-virtual {p0, v0, v5}, Ll/doi;->g(Ljava/util/List;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)Z

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    if-nez v4, :cond_4

    .line 188
    .line 189
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :cond_5
    :goto_2
    return-object v0
.end method

.method public final l(Landroid/content/Context;[Ljava/io/File;)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    array-length v3, v1

    .line 14
    const/4 v4, 0x0

    .line 15
    move v5, v4

    .line 16
    :goto_0
    if-ge v5, v3, :cond_8

    .line 17
    .line 18
    new-instance v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 19
    .line 20
    invoke-direct {v6, v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    aget-object v7, v1, v5

    .line 24
    .line 25
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v8

    .line 29
    const-string v9, "_"

    .line 30
    .line 31
    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    array-length v9, v8

    .line 36
    const/4 v10, 0x1

    .line 37
    if-le v9, v10, :cond_0

    .line 38
    .line 39
    aget-object v9, v8, v4

    .line 40
    .line 41
    aget-object v8, v8, v10

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    const-string v9, ""

    .line 45
    .line 46
    move-object v8, v9

    .line 47
    :goto_1
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v11

    .line 51
    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v11

    .line 55
    const-string v12, "__macosx"

    .line 56
    .line 57
    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v11

    .line 61
    if-nez v11, :cond_6

    .line 62
    .line 63
    iput-object v8, v6, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v9, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v8, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v11, "/lookup.png"

    .line 80
    .line 81
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    iput-object v8, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 89
    .line 90
    new-instance v8, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v11

    .line 99
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v11, "/manifest.json"

    .line 103
    .line 104
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    iput-object v8, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->manifestUrl:Ljava/lang/String;

    .line 112
    .line 113
    new-instance v8, Ljava/io/File;

    .line 114
    .line 115
    iget-object v11, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 116
    .line 117
    invoke-direct {v8, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    new-instance v11, Ljava/io/File;

    .line 121
    .line 122
    iget-object v12, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->manifestUrl:Ljava/lang/String;

    .line 123
    .line 124
    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 128
    .line 129
    .line 130
    move-result v12

    .line 131
    const-wide/16 v13, 0x0

    .line 132
    .line 133
    if-eqz v12, :cond_1

    .line 134
    .line 135
    invoke-virtual {v8}, Ljava/io/File;->length()J

    .line 136
    .line 137
    .line 138
    move-result-wide v15

    .line 139
    cmp-long v8, v15, v13

    .line 140
    .line 141
    if-gtz v8, :cond_3

    .line 142
    .line 143
    :cond_1
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    if-eqz v8, :cond_2

    .line 148
    .line 149
    invoke-virtual {v11}, Ljava/io/File;->length()J

    .line 150
    .line 151
    .line 152
    move-result-wide v11

    .line 153
    cmp-long v8, v11, v13

    .line 154
    .line 155
    if-gtz v8, :cond_3

    .line 156
    .line 157
    :cond_2
    move-object/from16 v7, p0

    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_3
    iput-boolean v10, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 161
    .line 162
    invoke-static {v0, v7, v6}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 163
    .line 164
    .line 165
    sget-object v7, Ll/doi;->g:Ljava/util/List;

    .line 166
    .line 167
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    if-eqz v7, :cond_4

    .line 172
    .line 173
    sget-object v7, Ll/doi;->g:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result v7

    .line 179
    if-lez v7, :cond_4

    .line 180
    .line 181
    sget-object v7, Ll/doi;->g:Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 184
    .line 185
    .line 186
    move-result v7

    .line 187
    move v8, v4

    .line 188
    :goto_2
    if-ge v8, v7, :cond_4

    .line 189
    .line 190
    sget-object v10, Ll/doi;->g:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v10

    .line 196
    check-cast v10, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 197
    .line 198
    iget-object v11, v10, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v11

    .line 204
    if-eqz v11, :cond_5

    .line 205
    .line 206
    iput-boolean v4, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isIconLocal:Z

    .line 207
    .line 208
    invoke-virtual {v10}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getIconUrl()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    iput-object v7, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v10}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getTag()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v7

    .line 218
    invoke-virtual {v6, v7}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->setTag(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-boolean v7, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 222
    .line 223
    iput-boolean v7, v10, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 224
    .line 225
    :cond_4
    move-object/from16 v7, p0

    .line 226
    .line 227
    goto :goto_3

    .line 228
    :cond_5
    add-int/lit8 v8, v8, 0x1

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :goto_3
    invoke-virtual {v7, v6}, Ll/doi;->n(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)I

    .line 232
    .line 233
    .line 234
    move-result v8

    .line 235
    if-ltz v8, :cond_7

    .line 236
    .line 237
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    goto :goto_5

    .line 241
    :goto_4
    iput-boolean v4, v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_6
    move-object/from16 v7, p0

    .line 245
    .line 246
    :cond_7
    :goto_5
    add-int/lit8 v5, v5, 0x1

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_8
    new-instance v0, Ll/xni;

    .line 251
    .line 252
    invoke-direct {v0}, Ll/xni;-><init>()V

    .line 253
    .line 254
    .line 255
    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 256
    .line 257
    .line 258
    return-object v2
.end method

.method public m(Landroid/content/Context;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/doi;->a:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    new-instance p1, Ll/pni;

    .line 19
    .line 20
    invoke-direct {p1, p0, p2}, Ll/pni;-><init>(Ll/doi;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/doi;->i(Landroid/content/Context;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final n(Lcom/momo/mcamera/filtermanager/MMPresetFilter;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/doi;->b:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_3

    .line 9
    .line 10
    iget-object v1, p0, Ll/doi;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    iget-object v2, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    iget-object v2, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v2, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 39
    .line 40
    :cond_0
    iget-object v1, v1, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Ll/doi;->b:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p0, p1, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 59
    .line 60
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, p1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->postionInList:Ljava/lang/String;

    .line 65
    .line 66
    return v0

    .line 67
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    const/4 p0, -0x1

    .line 71
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/doi;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic p(Landroid/content/Context;Ll/y20;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/doi;->k(Landroid/content/Context;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/uli;->d()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iput-object v0, p0, Ll/doi;->a:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    new-instance p1, Ll/tni;

    .line 25
    .line 26
    invoke-direct {p1, p2, v0}, Ll/tni;-><init>(Ll/y20;Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Ll/doi;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    invoke-virtual {p0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0, p1, v1}, Ll/doi;->l(Landroid/content/Context;[Ljava/io/File;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-lez v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-interface {v0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 81
    .line 82
    iget-object v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1, v3, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Ll/doi;->a:Ljava/util/List;

    .line 98
    .line 99
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    new-instance p1, Ll/vni;

    .line 106
    .line 107
    invoke-direct {p1, p2, v0}, Ll/vni;-><init>(Ll/y20;Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    iget-object p0, p0, Ll/doi;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 114
    .line 115
    invoke-virtual {p0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic q(Ll/y20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/doi;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    sget v0, Ll/doi;->f:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/doi;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/doi;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/doi;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public t(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/doi;->b:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/doi;->a:Ljava/util/List;

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ll/doi;->c:Z

    .line 8
    .line 9
    return-void
.end method
