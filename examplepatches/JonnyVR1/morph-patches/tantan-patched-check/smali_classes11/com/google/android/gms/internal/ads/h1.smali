.class public final Lcom/google/android/gms/internal/ads/h1;
.super Ll/m8x0;
.source "SourceFile"

# interfaces
.implements Ll/jsx0;


# static fields
.field public static final v:Ljava/util/regex/Pattern;


# instance fields
.field public final e:I

.field public final f:I

.field public final g:Ljava/lang/String;

.field public final h:Ll/esx0;

.field public i:Ll/akx0;

.field public j:Ljava/net/HttpURLConnection;

.field public final k:Ljava/util/Queue;

.field public l:Ljava/io/InputStream;

.field public m:Z

.field public n:I

.field public o:J

.field public p:J

.field public q:J

.field public r:J

.field public s:J

.field public final t:J

.field public final u:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "^bytes (\\d+)-(\\d+)/(\\d+)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/ads/h1;->v:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/btx0;IIJJ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/m8x0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/lev0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->g:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p1, Ll/esx0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/esx0;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->h:Ll/esx0;

    .line 16
    .line 17
    iput p3, p0, Lcom/google/android/gms/internal/ads/h1;->e:I

    .line 18
    .line 19
    iput p4, p0, Lcom/google/android/gms/internal/ads/h1;->f:I

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayDeque;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->k:Ljava/util/Queue;

    .line 27
    .line 28
    iput-wide p5, p0, Lcom/google/android/gms/internal/ads/h1;->t:J

    .line 29
    .line 30
    iput-wide p7, p0, Lcom/google/android/gms/internal/ads/h1;->u:J

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Ll/m8x0;->f(Ll/btx0;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v0, p3

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    return v0

    .line 9
    :cond_0
    :try_start_0
    iget-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->o:J

    .line 10
    .line 11
    iget-wide v4, v1, Lcom/google/android/gms/internal/ads/h1;->p:J

    .line 12
    .line 13
    sub-long/2addr v2, v4

    .line 14
    const-wide/16 v6, 0x0

    .line 15
    .line 16
    cmp-long v2, v2, v6

    .line 17
    .line 18
    const/4 v7, -0x1

    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    return v7

    .line 22
    :cond_1
    iget-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->q:J

    .line 23
    .line 24
    add-long/2addr v2, v4

    .line 25
    int-to-long v8, v0

    .line 26
    iget-wide v4, v1, Lcom/google/android/gms/internal/ads/h1;->u:J

    .line 27
    .line 28
    add-long/2addr v2, v8

    .line 29
    add-long/2addr v2, v4

    .line 30
    iget-wide v10, v1, Lcom/google/android/gms/internal/ads/h1;->s:J

    .line 31
    .line 32
    const-wide/16 v12, 0x1

    .line 33
    .line 34
    move-wide v14, v2

    .line 35
    add-long v2, v10, v12

    .line 36
    .line 37
    cmp-long v0, v14, v2

    .line 38
    .line 39
    if-lez v0, :cond_2

    .line 40
    .line 41
    iget-wide v14, v1, Lcom/google/android/gms/internal/ads/h1;->r:J

    .line 42
    .line 43
    cmp-long v0, v10, v14

    .line 44
    .line 45
    if-gez v0, :cond_2

    .line 46
    .line 47
    iget-wide v10, v1, Lcom/google/android/gms/internal/ads/h1;->t:J

    .line 48
    .line 49
    add-long/2addr v10, v2

    .line 50
    sub-long/2addr v10, v4

    .line 51
    const-wide/16 v4, -0x1

    .line 52
    .line 53
    add-long/2addr v10, v4

    .line 54
    add-long v16, v2, v8

    .line 55
    .line 56
    add-long v4, v16, v4

    .line 57
    .line 58
    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 59
    .line 60
    .line 61
    move-result-wide v4

    .line 62
    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    const/4 v6, 0x2

    .line 67
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/ads/h1;->m(JJI)Ljava/net/HttpURLConnection;

    .line 68
    .line 69
    .line 70
    iput-wide v4, v1, Lcom/google/android/gms/internal/ads/h1;->s:J

    .line 71
    .line 72
    move-wide v10, v4

    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    :goto_0
    add-long/2addr v10, v12

    .line 77
    iget-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->q:J

    .line 78
    .line 79
    sub-long/2addr v10, v2

    .line 80
    iget-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->p:J

    .line 81
    .line 82
    sub-long/2addr v10, v2

    .line 83
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    .line 84
    .line 85
    .line 86
    move-result-wide v2

    .line 87
    long-to-int v0, v2

    .line 88
    iget-object v2, v1, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;

    .line 89
    .line 90
    move-object/from16 v3, p1

    .line 91
    .line 92
    move/from16 v4, p2

    .line 93
    .line 94
    invoke-virtual {v2, v3, v4, v0}, Ljava/io/InputStream;->read([BII)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eq v0, v7, :cond_3

    .line 99
    .line 100
    iget-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->p:J

    .line 101
    .line 102
    int-to-long v4, v0

    .line 103
    add-long/2addr v2, v4

    .line 104
    iput-wide v2, v1, Lcom/google/android/gms/internal/ads/h1;->p:J

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ll/m8x0;->zzg(I)V

    .line 107
    .line 108
    .line 109
    return v0

    .line 110
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    .line 111
    .line 112
    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .line 113
    .line 114
    .line 115
    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :goto_1
    new-instance v2, Lcom/google/android/gms/internal/ads/zzhp;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 119
    .line 120
    const/16 v3, 0x7d0

    .line 121
    .line 122
    const/4 v4, 0x2

    .line 123
    invoke-direct {v2, v0, v1, v3, v4}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 124
    .line 125
    .line 126
    throw v2
.end method

.method public final e(Ll/akx0;)J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/google/android/gms/internal/ads/h1;->p:J

    .line 6
    .line 7
    iget-wide v3, p1, Ll/akx0;->f:J

    .line 8
    .line 9
    iget-wide v0, p1, Ll/akx0;->g:J

    .line 10
    .line 11
    const-wide/16 v8, -0x1

    .line 12
    .line 13
    cmp-long v2, v0, v8

    .line 14
    .line 15
    iget-wide v5, p0, Lcom/google/android/gms/internal/ads/h1;->t:J

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 21
    .line 22
    .line 23
    move-result-wide v5

    .line 24
    :goto_0
    add-long/2addr v5, v3

    .line 25
    add-long/2addr v5, v8

    .line 26
    iput-wide v3, p0, Lcom/google/android/gms/internal/ads/h1;->q:J

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    move-object v2, p0

    .line 30
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/internal/ads/h1;->m(JJI)Ljava/net/HttpURLConnection;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    iput-object p0, v2, Lcom/google/android/gms/internal/ads/h1;->j:Ljava/net/HttpURLConnection;

    .line 35
    .line 36
    const-string v0, "Content-Range"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    sget-object v0, Lcom/google/android/gms/internal/ads/h1;->v:Ljava/util/regex/Pattern;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    const/4 v1, 0x1

    .line 61
    :try_start_0
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 66
    .line 67
    .line 68
    const/4 v3, 0x2

    .line 69
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    const/4 v5, 0x3

    .line 78
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 83
    .line 84
    .line 85
    move-result-wide v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    iget-wide v10, p1, Ll/akx0;->g:J

    .line 87
    .line 88
    cmp-long p0, v10, v8

    .line 89
    .line 90
    if-eqz p0, :cond_1

    .line 91
    .line 92
    iput-wide v10, v2, Lcom/google/android/gms/internal/ads/h1;->o:J

    .line 93
    .line 94
    iget-wide v5, v2, Lcom/google/android/gms/internal/ads/h1;->q:J

    .line 95
    .line 96
    add-long/2addr v5, v10

    .line 97
    add-long/2addr v5, v8

    .line 98
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 99
    .line 100
    .line 101
    move-result-wide v5

    .line 102
    iput-wide v5, v2, Lcom/google/android/gms/internal/ads/h1;->r:J

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    iget-wide v10, v2, Lcom/google/android/gms/internal/ads/h1;->q:J

    .line 106
    .line 107
    sub-long v10, v5, v10

    .line 108
    .line 109
    iput-wide v10, v2, Lcom/google/android/gms/internal/ads/h1;->o:J

    .line 110
    .line 111
    add-long/2addr v5, v8

    .line 112
    iput-wide v5, v2, Lcom/google/android/gms/internal/ads/h1;->r:J

    .line 113
    .line 114
    :goto_1
    iput-wide v3, v2, Lcom/google/android/gms/internal/ads/h1;->s:J

    .line 115
    .line 116
    iput-boolean v1, v2, Lcom/google/android/gms/internal/ads/h1;->m:Z

    .line 117
    .line 118
    invoke-virtual {v2, p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 119
    .line 120
    .line 121
    iget-wide p0, v2, Lcom/google/android/gms/internal/ads/h1;->o:J

    .line 122
    .line 123
    return-wide p0

    .line 124
    :catch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string v1, "Unexpected Content-Range ["

    .line 127
    .line 128
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v1, "]"

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/ads/zzciy;

    .line 147
    .line 148
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/ads/zzciy;-><init>(Ljava/lang/String;Ll/akx0;)V

    .line 149
    .line 150
    .line 151
    throw v0
.end method

.method public final m(JJI)Ljava/net/HttpURLConnection;
    .locals 8
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    const-string v1, "Unable to connect to "

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/akx0;->a:Landroid/net/Uri;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 12
    .line 13
    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 21
    .line 22
    iget v3, p0, Lcom/google/android/gms/internal/ads/h1;->e:I

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 25
    .line 26
    .line 27
    iget v3, p0, Lcom/google/android/gms/internal/ads/h1;->f:I

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/google/android/gms/internal/ads/h1;->h:Ll/esx0;

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/esx0;->a()Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_0

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Ljava/util/Map$Entry;

    .line 57
    .line 58
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    check-cast v4, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v5, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p1, v0

    .line 76
    move-object p2, p1

    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v4, "bytes="

    .line 85
    .line 86
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string p1, "-"

    .line 93
    .line 94
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string p2, "Range"

    .line 105
    .line 106
    invoke-virtual {v0, p2, p1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const-string p1, "User-Agent"

    .line 110
    .line 111
    iget-object p2, p0, Lcom/google/android/gms/internal/ads/h1;->g:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, p1, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const-string p1, "Accept-Encoding"

    .line 117
    .line 118
    const-string p2, "identity"

    .line 119
    .line 120
    invoke-virtual {v0, p1, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    const-string p1, "GET"

    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->k:Ljava/util/Queue;

    .line 132
    .line 133
    invoke-interface {p1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 137
    .line 138
    iget-object p1, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 145
    .line 146
    .line 147
    move-result p2

    .line 148
    iput p2, p0, Lcom/google/android/gms/internal/ads/h1;->n:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 149
    .line 150
    const/16 p1, 0xc8

    .line 151
    .line 152
    if-lt p2, p1, :cond_2

    .line 153
    .line 154
    const/16 p1, 0x12b

    .line 155
    .line 156
    if-gt p2, p1, :cond_2

    .line 157
    .line 158
    :try_start_2
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iget-object p2, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;

    .line 163
    .line 164
    if-eqz p2, :cond_1

    .line 165
    .line 166
    new-instance p2, Ljava/io/SequenceInputStream;

    .line 167
    .line 168
    iget-object p3, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;

    .line 169
    .line 170
    invoke-direct {p2, p3, p1}, Ljava/io/SequenceInputStream;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    .line 171
    .line 172
    .line 173
    move-object p1, p2

    .line 174
    goto :goto_1

    .line 175
    :catch_1
    move-exception v0

    .line 176
    move-object p1, v0

    .line 177
    goto :goto_2

    .line 178
    :cond_1
    :goto_1
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 179
    .line 180
    return-object v0

    .line 181
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h1;->n()V

    .line 182
    .line 183
    .line 184
    new-instance p2, Lcom/google/android/gms/internal/ads/zzhp;

    .line 185
    .line 186
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 187
    .line 188
    const/16 p3, 0x7d0

    .line 189
    .line 190
    invoke-direct {p2, p1, p0, p3, p5}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 191
    .line 192
    .line 193
    throw p2

    .line 194
    :cond_2
    invoke-virtual {v0}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h1;->n()V

    .line 199
    .line 200
    .line 201
    new-instance p2, Lcom/google/android/gms/internal/ads/zzciz;

    .line 202
    .line 203
    iget p3, p0, Lcom/google/android/gms/internal/ads/h1;->n:I

    .line 204
    .line 205
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 206
    .line 207
    invoke-direct {p2, p3, p1, p0, p5}, Lcom/google/android/gms/internal/ads/zzciz;-><init>(ILjava/util/Map;Ll/akx0;I)V

    .line 208
    .line 209
    .line 210
    throw p2

    .line 211
    :catch_2
    move-exception v0

    .line 212
    move-object p2, v0

    .line 213
    move-object v4, p2

    .line 214
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h1;->n()V

    .line 215
    .line 216
    .line 217
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    new-instance v2, Lcom/google/android/gms/internal/ads/zzhp;

    .line 222
    .line 223
    iget-object v5, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 224
    .line 225
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    const/16 v6, 0x7d0

    .line 230
    .line 231
    move v7, p5

    .line 232
    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ljava/io/IOException;Ll/akx0;II)V

    .line 233
    .line 234
    .line 235
    throw v2

    .line 236
    :goto_3
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    move-object p3, p0

    .line 241
    new-instance p0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 242
    .line 243
    iget-object p3, p3, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 244
    .line 245
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    const/16 p4, 0x7d0

    .line 250
    .line 251
    invoke-direct/range {p0 .. p5}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ljava/io/IOException;Ll/akx0;II)V

    .line 252
    .line 253
    .line 254
    throw p0
.end method

.method public final n()V
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/h1;->k:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/h1;->k:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    const-string v1, "Unexpected error while disconnecting"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/h1;->j:Ljava/net/HttpURLConnection;

    .line 30
    .line 31
    return-void
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/h1;->j:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final zzd()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception v2

    .line 12
    goto :goto_1

    .line 13
    :catch_0
    move-exception v2

    .line 14
    :try_start_2
    new-instance v3, Lcom/google/android/gms/internal/ads/zzhp;

    .line 15
    .line 16
    iget-object v4, p0, Lcom/google/android/gms/internal/ads/h1;->i:Ll/akx0;

    .line 17
    .line 18
    const/16 v5, 0x7d0

    .line 19
    .line 20
    const/4 v6, 0x3

    .line 21
    invoke-direct {v3, v2, v4, v5, v6}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 22
    .line 23
    .line 24
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h1;->n()V

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/google/android/gms/internal/ads/h1;->m:Z

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/google/android/gms/internal/ads/h1;->m:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void

    .line 40
    :goto_1
    iput-object v1, p0, Lcom/google/android/gms/internal/ads/h1;->l:Ljava/io/InputStream;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h1;->n()V

    .line 43
    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/google/android/gms/internal/ads/h1;->m:Z

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iput-boolean v0, p0, Lcom/google/android/gms/internal/ads/h1;->m:Z

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 52
    .line 53
    .line 54
    :cond_2
    throw v2
.end method

.method public final zze()Ljava/util/Map;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/h1;->j:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
