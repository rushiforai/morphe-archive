.class public Ltech/sud/runtime/component/g/e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ltech/sud/runtime/component/g/b;

.field private b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ltech/sud/runtime/component/g/f;",
            "Ltech/sud/runtime/component/g/d;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/g/e;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ltech/sud/runtime/component/g/e;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ltech/sud/runtime/component/g/e;->e:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ltech/sud/runtime/component/g/e;->f:Ljava/util/Set;

    .line 18
    .line 19
    iput-object v0, p0, Ltech/sud/runtime/component/g/e;->g:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method

.method private a(Ltech/sud/runtime/component/g/b;Ltech/sud/runtime/component/g/f;J)Z
    .locals 2

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/g/e;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ltech/sud/runtime/component/g/d;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/d;->a()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    add-long/2addr v0, p3

    .line 18
    invoke-virtual {p1, v0, v1}, Ltech/sud/runtime/component/g/b;->a(J)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method private b()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ltech/sud/runtime/component/g/b;->c()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 7
    .line 8
    invoke-virtual {v0}, Ltech/sud/runtime/component/g/b;->f()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 13
    .line 14
    const-wide/16 v2, 0x6

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Ltech/sud/runtime/component/g/b;->b(J)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Ltech/sud/runtime/component/g/e;->b:Ljava/util/Map;

    .line 25
    .line 26
    new-array v1, v0, [Ltech/sud/runtime/component/g/d;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    :goto_0
    if-ge v2, v0, :cond_0

    .line 30
    .line 31
    new-instance v3, Ltech/sud/runtime/component/g/d;

    .line 32
    .line 33
    invoke-direct {v3}, Ltech/sud/runtime/component/g/d;-><init>()V

    .line 34
    .line 35
    .line 36
    aput-object v3, v1, v2

    .line 37
    .line 38
    iget-object v4, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 39
    .line 40
    invoke-virtual {v3, v4}, Ltech/sud/runtime/component/g/d;->a(Ltech/sud/runtime/component/g/b;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v4, p0, Ltech/sud/runtime/component/g/e;->b:Ljava/util/Map;

    .line 45
    .line 46
    invoke-static {v3}, Ltech/sud/runtime/component/g/f;->a(Ljava/lang/String;)Ltech/sud/runtime/component/g/f;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    aget-object v5, v1, v2

    .line 51
    .line 52
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/g/e;->b:Ljava/util/Map;

    .line 59
    .line 60
    sget-object v1, Ltech/sud/runtime/component/g/f;->a:Ltech/sud/runtime/component/g/f;

    .line 61
    .line 62
    new-instance v2, Ltech/sud/runtime/component/g/d;

    .line 63
    .line 64
    iget-object p0, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 65
    .line 66
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/b;->a()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-long v3, p0

    .line 71
    const-wide/16 v5, 0x0

    .line 72
    .line 73
    invoke-direct {v2, v5, v6, v3, v4}, Ltech/sud/runtime/component/g/d;-><init>(JJ)V

    .line 74
    .line 75
    .line 76
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private c()V
    .locals 15

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 2
    .line 3
    sget-object v1, Ltech/sud/runtime/component/g/f;->b:Ltech/sud/runtime/component/g/f;

    .line 4
    .line 5
    const-wide/16 v2, 0x2

    .line 6
    .line 7
    invoke-direct {p0, v0, v1, v2, v3}, Ltech/sud/runtime/component/g/e;->a(Ltech/sud/runtime/component/g/b;Ltech/sud/runtime/component/g/f;J)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 11
    .line 12
    invoke-virtual {v0}, Ltech/sud/runtime/component/g/b;->a()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 17
    .line 18
    invoke-virtual {v1}, Ltech/sud/runtime/component/g/b;->f()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 23
    .line 24
    invoke-virtual {v2}, Ltech/sud/runtime/component/g/b;->f()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v2, v0

    .line 29
    const/4 v3, 0x2

    .line 30
    sub-int/2addr v2, v3

    .line 31
    const/4 v4, 0x4

    .line 32
    add-int/2addr v0, v4

    .line 33
    :goto_0
    add-int/lit8 v5, v1, -0x1

    .line 34
    .line 35
    if-lez v1, :cond_a

    .line 36
    .line 37
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 38
    .line 39
    int-to-long v6, v0

    .line 40
    invoke-virtual {v1, v6, v7}, Ltech/sud/runtime/component/g/b;->a(J)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 44
    .line 45
    invoke-virtual {v1}, Ltech/sud/runtime/component/g/b;->f()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v6, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 50
    .line 51
    invoke-virtual {v6}, Ltech/sud/runtime/component/g/b;->f()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    iget-object v7, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 56
    .line 57
    invoke-virtual {v7}, Ltech/sud/runtime/component/g/b;->f()I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    iget-object v8, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 62
    .line 63
    invoke-virtual {v8}, Ltech/sud/runtime/component/g/b;->f()I

    .line 64
    .line 65
    .line 66
    move-result v8

    .line 67
    iget-object v9, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 68
    .line 69
    invoke-virtual {v9}, Ltech/sud/runtime/component/g/b;->f()I

    .line 70
    .line 71
    .line 72
    move-result v9

    .line 73
    const/4 v10, 0x3

    .line 74
    const/4 v11, 0x1

    .line 75
    if-eq v1, v11, :cond_0

    .line 76
    .line 77
    if-ne v1, v10, :cond_9

    .line 78
    .line 79
    :cond_0
    if-eqz v6, :cond_1

    .line 80
    .line 81
    if-ne v6, v11, :cond_9

    .line 82
    .line 83
    :cond_1
    iget-object v12, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 84
    .line 85
    invoke-virtual {v12}, Ltech/sud/runtime/component/g/b;->f()I

    .line 86
    .line 87
    .line 88
    move-result v13

    .line 89
    add-int/2addr v13, v2

    .line 90
    int-to-long v13, v13

    .line 91
    invoke-virtual {v12, v13, v14}, Ltech/sud/runtime/component/g/b;->a(J)V

    .line 92
    .line 93
    .line 94
    iget-object v12, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 95
    .line 96
    if-ne v1, v10, :cond_2

    .line 97
    .line 98
    invoke-virtual {v12, v9, v6}, Ltech/sud/runtime/component/g/b;->a(II)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    goto :goto_1

    .line 103
    :cond_2
    invoke-virtual {v12, v9}, Ltech/sud/runtime/component/g/b;->a(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    :goto_1
    if-eqz v8, :cond_8

    .line 108
    .line 109
    if-eq v8, v11, :cond_7

    .line 110
    .line 111
    if-eq v8, v3, :cond_6

    .line 112
    .line 113
    if-eq v8, v4, :cond_4

    .line 114
    .line 115
    const/4 v1, 0x6

    .line 116
    if-eq v8, v1, :cond_3

    .line 117
    .line 118
    const/16 v1, 0x10

    .line 119
    .line 120
    if-eq v8, v1, :cond_7

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->c:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-nez v1, :cond_9

    .line 130
    .line 131
    iput-object v6, p0, Ltech/sud/runtime/component/g/e;->c:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    iget-object v8, p0, Ltech/sud/runtime/component/g/e;->d:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    if-eqz v8, :cond_5

    .line 141
    .line 142
    if-ne v1, v10, :cond_9

    .line 143
    .line 144
    const/16 v1, 0x409

    .line 145
    .line 146
    if-ne v7, v1, :cond_9

    .line 147
    .line 148
    :cond_5
    iput-object v6, p0, Ltech/sud/runtime/component/g/e;->d:Ljava/lang/String;

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_6
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->g:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-nez v1, :cond_9

    .line 158
    .line 159
    iput-object v6, p0, Ltech/sud/runtime/component/g/e;->g:Ljava/lang/String;

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_7
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->f:Ljava/util/Set;

    .line 163
    .line 164
    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_8
    iget-object v1, p0, Ltech/sud/runtime/component/g/e;->e:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_9

    .line 175
    .line 176
    iput-object v6, p0, Ltech/sud/runtime/component/g/e;->e:Ljava/lang/String;

    .line 177
    .line 178
    :cond_9
    :goto_2
    add-int/lit8 v0, v0, 0xc

    .line 179
    .line 180
    move v1, v5

    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_a
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 26
    iget-object p0, p0, Ltech/sud/runtime/component/g/e;->c:Ljava/lang/String;

    return-object p0
.end method

.method public a(Ltech/sud/runtime/component/g/b;)V
    .locals 0

    .line 23
    iput-object p1, p0, Ltech/sud/runtime/component/g/e;->a:Ltech/sud/runtime/component/g/b;

    .line 24
    invoke-direct {p0}, Ltech/sud/runtime/component/g/e;->b()V

    .line 25
    invoke-direct {p0}, Ltech/sud/runtime/component/g/e;->c()V

    return-void
.end method
