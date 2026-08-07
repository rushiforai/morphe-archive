.class public Ll/nwb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/cjm$a;

.field public static b:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static c:J

.field public static d:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static e:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static f:J

.field public static g:J

.field public static final h:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nwb;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    sput-wide v0, Ll/nwb;->c:J

    .line 11
    .line 12
    new-instance v0, Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 18
    .line 19
    new-instance v0, Ljava/util/LinkedList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 25
    .line 26
    const-wide/16 v0, 0x3e8

    .line 27
    .line 28
    sput-wide v0, Ll/nwb;->f:J

    .line 29
    .line 30
    const-wide/16 v0, 0x1f4

    .line 31
    .line 32
    sput-wide v0, Ll/nwb;->g:J

    .line 33
    .line 34
    const/16 v0, 0x438

    .line 35
    .line 36
    const/16 v1, 0x5a0

    .line 37
    .line 38
    const/16 v2, 0x2d0

    .line 39
    .line 40
    const/16 v3, 0x3c0

    .line 41
    .line 42
    filled-new-array {v2, v3, v0, v1}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/nwb;->h:[I

    .line 47
    .line 48
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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/cjm$a;)V
    .locals 0

    .line 1
    sput-object p0, Ll/nwb;->a:Ll/cjm$a;

    .line 2
    .line 3
    return-void
.end method

.method public static c(J)V
    .locals 3

    .line 1
    sget-object v0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 2
    .line 3
    const-wide/16 v1, 0x5

    .line 4
    .line 5
    invoke-static {v1, v2, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/LinkedList;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p1, 0x2

    .line 23
    if-le p0, p1, :cond_0

    .line 24
    .line 25
    sget-object p0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Ll/nwb;->q()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static d()D
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->C2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide v1, 0x3fe3333333333333L    # 0.6

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->H0()D

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(DD)D

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const-wide v2, 0x3fe999999999999aL    # 0.8

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    return-wide v0

    .line 30
    :cond_0
    return-wide v1
.end method

.method public static e(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 10

    .line 1
    invoke-static {}, Ll/gra;->y1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/nwb;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sget-object v1, Ll/nwb;->a:Ll/cjm$a;

    .line 17
    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/nwb;->k()V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object v1, Ll/nwb;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    sget-object p1, Ll/nwb;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Integer;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-static {p0, p1}, Ll/nwb;->j(Lcom/p1/mobile/putong/data/Media;I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    const/16 v1, 0x320

    .line 61
    .line 62
    const/4 v2, 0x3

    .line 63
    const/16 v3, 0x438

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    const/4 v5, 0x0

    .line 67
    if-le v0, v1, :cond_4

    .line 68
    .line 69
    if-ge v0, v3, :cond_4

    .line 70
    .line 71
    sget-wide v0, Ll/nwb;->g:J

    .line 72
    .line 73
    sget-wide v6, Ll/nwb;->f:J

    .line 74
    .line 75
    cmp-long v0, v0, v6

    .line 76
    .line 77
    if-lez v0, :cond_b

    .line 78
    .line 79
    :cond_3
    :goto_0
    move v4, v5

    .line 80
    goto :goto_1

    .line 81
    :cond_4
    const/high16 v1, 0x3fa00000    # 1.25f

    .line 82
    .line 83
    const/high16 v6, 0x3f800000    # 1.0f

    .line 84
    .line 85
    const/4 v7, 0x2

    .line 86
    const/16 v8, 0x5a0

    .line 87
    .line 88
    if-lt v0, v3, :cond_6

    .line 89
    .line 90
    if-ge v0, v8, :cond_6

    .line 91
    .line 92
    sget-wide v8, Ll/nwb;->f:J

    .line 93
    .line 94
    long-to-float v0, v8

    .line 95
    sget-wide v8, Ll/nwb;->g:J

    .line 96
    .line 97
    long-to-float v3, v8

    .line 98
    div-float/2addr v0, v3

    .line 99
    cmpg-float v3, v0, v6

    .line 100
    .line 101
    if-gez v3, :cond_5

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    cmpg-float v0, v0, v1

    .line 105
    .line 106
    if-gez v0, :cond_9

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_6
    if-lt v0, v8, :cond_3

    .line 110
    .line 111
    sget-wide v8, Ll/nwb;->f:J

    .line 112
    .line 113
    long-to-float v0, v8

    .line 114
    sget-wide v8, Ll/nwb;->g:J

    .line 115
    .line 116
    long-to-float v3, v8

    .line 117
    div-float/2addr v0, v3

    .line 118
    cmpg-float v3, v0, v6

    .line 119
    .line 120
    if-gez v3, :cond_7

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_7
    cmpg-float v1, v0, v1

    .line 124
    .line 125
    if-gez v1, :cond_8

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_8
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 129
    .line 130
    cmpg-float v0, v0, v1

    .line 131
    .line 132
    if-gez v0, :cond_a

    .line 133
    .line 134
    :cond_9
    move v4, v7

    .line 135
    goto :goto_1

    .line 136
    :cond_a
    move v4, v2

    .line 137
    :cond_b
    :goto_1
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    sget-object v1, Ll/nwb;->h:[I

    .line 146
    .line 147
    aget v2, v1, v0

    .line 148
    .line 149
    sget-object v3, Ll/nwb;->b:Ljava/util/concurrent/ConcurrentHashMap;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 156
    .line 157
    aget v1, v1, v0

    .line 158
    .line 159
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v3, v4, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    invoke-static {p0, v2}, Ll/nwb;->j(Lcom/p1/mobile/putong/data/Media;I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v2, v1, p1, p0, v0}, Ll/nwb;->p(ILcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ljava/lang/String;I)V

    .line 177
    .line 178
    .line 179
    return-object v1
.end method

.method public static f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const-string v0, "render"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/nwb;->g(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->y1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/nwb;->e(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/nwb;->i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth720()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static j(Lcom/p1/mobile/putong/data/Media;I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x3c0

    .line 2
    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0x438

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x5a0

    .line 10
    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth720()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth1440()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/nwb;->l(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public static k()V
    .locals 3

    .line 1
    invoke-static {}, Ll/cjm;->c()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lwb;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/lwb;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/mwb;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/mwb;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static l(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    invoke-static {}, Ll/kl40;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    const/16 v1, 0x3c0

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static m()V
    .locals 5

    .line 1
    sget-wide v0, Ll/nwb;->c:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sput-wide v0, Ll/nwb;->c:J

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    sget-wide v3, Ll/nwb;->c:J

    .line 23
    .line 24
    sub-long/2addr v1, v3

    .line 25
    const-wide/16 v3, 0xa

    .line 26
    .line 27
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    sput-wide v0, Ll/nwb;->c:J

    .line 43
    .line 44
    sget-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v1, 0x2

    .line 51
    if-le v0, v1, :cond_1

    .line 52
    .line 53
    sget-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-static {}, Ll/nwb;->r()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static n(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/nwb;->o(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static o(Lcom/p1/mobile/putong/data/Media;Z)V
    .locals 6

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    const-string v1, "switchPreload"

    .line 4
    .line 5
    invoke-static {p0, v1}, Ll/nwb;->e(Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 10
    .line 11
    new-instance v4, Ll/nwb$a;

    .line 12
    .line 13
    invoke-direct {v4}, Ll/nwb$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v3, ""

    .line 17
    .line 18
    move v5, p1

    .line 19
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->t0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;Z)Ll/i6c;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static p(ILcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1

    .line 1
    new-instance p1, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p2, "e_android_dynamic_resolution"

    .line 7
    .line 8
    iput-object p2, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 9
    .line 10
    sget-object p2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 11
    .line 12
    iput-object p2, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 13
    .line 14
    const-string p2, "p_suggest_users_home_view"

    .line 15
    .line 16
    iput-object p2, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    sget-object p3, Ll/nwb;->a:Ll/cjm$a;

    .line 21
    .line 22
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_0

    .line 27
    .line 28
    sget-object p3, Ll/nwb;->a:Ll/cjm$a;

    .line 29
    .line 30
    iget-object p3, p3, Ll/cjm$a;->c:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p3, "NA"

    .line 34
    .line 35
    :goto_0
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string p3, ", op:"

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    sget-wide p3, Ll/nwb;->f:J

    .line 44
    .line 45
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p3, ",cache:"

    .line 49
    .line 50
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget-wide p3, Ll/nwb;->g:J

    .line 54
    .line 55
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p3, "average_net_speed"

    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    sget-wide p3, Ll/nwb;->g:J

    .line 69
    .line 70
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const-string p4, "picture_download_time"

    .line 75
    .line 76
    invoke-static {p4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    sget-object p4, Ll/nwb;->a:Ll/cjm$a;

    .line 81
    .line 82
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p4

    .line 86
    if-eqz p4, :cond_1

    .line 87
    .line 88
    sget-object p4, Ll/nwb;->a:Ll/cjm$a;

    .line 89
    .line 90
    iget-object p4, p4, Ll/cjm$a;->b:Ljava/math/BigDecimal;

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    const/4 p4, -0x1

    .line 94
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p4

    .line 98
    :goto_1
    const-string v0, "picture_size"

    .line 99
    .line 100
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p4

    .line 104
    const-string v0, "screen_resolution"

    .line 105
    .line 106
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    filled-new-array {p2, p3, p4, p0}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p1, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static q()V
    .locals 5

    .line 1
    sget-object v0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-lt v0, v1, :cond_1

    .line 9
    .line 10
    sget-object v0, Ll/nwb;->e:Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    add-long/2addr v1, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-wide/16 v3, 0x2

    .line 37
    .line 38
    div-long/2addr v1, v3

    .line 39
    sput-wide v1, Ll/nwb;->g:J

    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public static r()V
    .locals 5

    .line 1
    sget-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-lt v0, v1, :cond_1

    .line 9
    .line 10
    sget-object v0, Ll/nwb;->d:Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    add-long/2addr v1, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-wide/16 v3, 0x2

    .line 37
    .line 38
    div-long/2addr v1, v3

    .line 39
    sput-wide v1, Ll/nwb;->f:J

    .line 40
    .line 41
    :cond_1
    return-void
.end method
