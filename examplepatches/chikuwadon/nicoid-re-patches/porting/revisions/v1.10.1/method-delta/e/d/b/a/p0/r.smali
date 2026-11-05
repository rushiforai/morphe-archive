.class public Le/d/b/a/p0/r;
.super Le/d/b/a/p0/f;
.source ""

# interfaces
.implements Le/d/b/a/p0/v;


# static fields
.field public static final t:Ljava/util/regex/Pattern;

.field public static final u:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "[B>;"
        }
    .end annotation
.end field


# instance fields
.field public final e:Z

.field public final f:I

.field public final g:I

.field public final h:Ljava/lang/String;

.field public final i:Le/d/b/a/q0/t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Le/d/b/a/q0/t<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Le/d/b/a/p0/v$f;

.field public final k:Le/d/b/a/p0/v$f;

.field public l:Le/d/b/a/p0/m;

.field public m:Ljava/net/HttpURLConnection;

.field public n:Ljava/io/InputStream;

.field public o:Z

.field public p:J

.field public q:J

.field public r:J

.field public s:J


# virtual methods
.method public a(Le/d/b/a/p0/m;)J
    .registers 20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "Unable to connect to "

    iput-object v2, v1, Le/d/b/a/p0/r;->l:Le/d/b/a/p0/m;

    const-wide/16 v4, 0x0

    iput-wide v4, v1, Le/d/b/a/p0/r;->s:J

    iput-wide v4, v1, Le/d/b/a/p0/r;->r:J

    invoke-virtual/range {p0 .. p1}, Le/d/b/a/p0/f;->b(Le/d/b/a/p0/m;)V

    const/4 v6, 0x1

    :try_start_12
    invoke-virtual/range {p0 .. p1}, Le/d/b/a/p0/r;->d(Le/d/b/a/p0/m;)Ljava/net/HttpURLConnection;

    move-result-object v0

    iput-object v0, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_18} :catch_170

    :try_start_18
    iget-object v0, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    iget-object v7, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-static {v7, v0}, Le/e/a/ModernDebug;->http(Ljava/net/HttpURLConnection;I)V

    iget-object v7, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v3
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_29} :catch_155

    const/16 v7, 0xc8

    const/4 v8, 0x0

    if-lt v0, v7, :cond_13a

    const/16 v9, 0x12b

    if-le v0, v9, :cond_34

    goto/16 :goto_13a

    :cond_34
    iget-object v3, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v9, v1, Le/d/b/a/p0/r;->i:Le/d/b/a/q0/t;

    if-eqz v9, :cond_4e

    invoke-interface {v9, v3}, Le/d/b/a/q0/t;->a(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_45

    goto :goto_4e

    :cond_45
    invoke-virtual/range {p0 .. p0}, Le/d/b/a/p0/r;->d()V

    new-instance v0, Le/d/b/a/p0/v$d;

    invoke-direct {v0, v3, v2}, Le/d/b/a/p0/v$d;-><init>(Ljava/lang/String;Le/d/b/a/p0/m;)V

    throw v0

    :cond_4e
    :goto_4e
    if-ne v0, v7, :cond_57

    iget-wide v9, v2, Le/d/b/a/p0/m;->e:J

    cmp-long v0, v9, v4

    if-eqz v0, :cond_57

    goto :goto_58

    :cond_57
    move-wide v9, v4

    :goto_58
    iput-wide v9, v1, Le/d/b/a/p0/r;->p:J

    .line 1
    iget v0, v2, Le/d/b/a/p0/m;->h:I

    and-int/2addr v0, v6

    if-ne v0, v6, :cond_60

    const/4 v8, 0x1

    :cond_60
    if-nez v8, :cond_11c

    .line 2
    iget-wide v7, v2, Le/d/b/a/p0/m;->f:J

    const-wide/16 v9, -0x1

    cmp-long v0, v7, v9

    if-eqz v0, :cond_6e

    iput-wide v7, v1, Le/d/b/a/p0/r;->q:J

    goto/16 :goto_120

    :cond_6e
    iget-object v0, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    const-string v3, "Content-Length"

    .line 3
    invoke-virtual {v0, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    const-string v8, "]"

    const-string v11, "DefaultHttpDataSource"

    if-nez v7, :cond_9c

    :try_start_80
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12
    :try_end_84
    .catch Ljava/lang/NumberFormatException; {:try_start_80 .. :try_end_84} :catch_85

    goto :goto_9d

    :catch_85
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unexpected Content-Length ["

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7}, Le/d/b/a/q0/l;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9c
    move-wide v12, v9

    :goto_9d
    const-string v7, "Content-Range"

    invoke-virtual {v0, v7}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_111

    sget-object v7, Le/d/b/a/p0/r;->t:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_111

    const/4 v14, 0x2

    :try_start_b6
    invoke-virtual {v7, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    invoke-virtual {v7, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    sub-long v14, v14, v16

    const-wide/16 v16, 0x1

    add-long v14, v14, v16

    cmp-long v7, v12, v4

    if-gez v7, :cond_d2

    move-wide v12, v14

    goto :goto_111

    :cond_d2
    cmp-long v4, v12, v14

    if-eqz v4, :cond_111

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Inconsistent headers ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "] ["

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v11, v3}, Le/d/b/a/q0/l;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12
    :try_end_f9
    .catch Ljava/lang/NumberFormatException; {:try_start_b6 .. :try_end_f9} :catch_fa

    goto :goto_111

    :catch_fa
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected Content-Range ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Le/d/b/a/q0/l;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_111
    :goto_111
    cmp-long v0, v12, v9

    if-eqz v0, :cond_119

    .line 4
    iget-wide v3, v1, Le/d/b/a/p0/r;->p:J

    sub-long v9, v12, v3

    :cond_119
    iput-wide v9, v1, Le/d/b/a/p0/r;->q:J

    goto :goto_120

    :cond_11c
    iget-wide v3, v2, Le/d/b/a/p0/m;->f:J

    iput-wide v3, v1, Le/d/b/a/p0/r;->q:J

    :goto_120
    :try_start_120
    iget-object v0, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, v1, Le/d/b/a/p0/r;->n:Ljava/io/InputStream;
    :try_end_128
    .catch Ljava/io/IOException; {:try_start_120 .. :try_end_128} :catch_130

    iput-boolean v6, v1, Le/d/b/a/p0/r;->o:Z

    invoke-virtual/range {p0 .. p1}, Le/d/b/a/p0/f;->c(Le/d/b/a/p0/m;)V

    iget-wide v2, v1, Le/d/b/a/p0/r;->q:J

    return-wide v2

    :catch_130
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Le/d/b/a/p0/r;->d()V

    new-instance v3, Le/d/b/a/p0/v$c;

    invoke-direct {v3, v0, v2, v6}, Le/d/b/a/p0/v$c;-><init>(Ljava/io/IOException;Le/d/b/a/p0/m;I)V

    throw v3

    :cond_13a
    :goto_13a
    iget-object v4, v1, Le/d/b/a/p0/r;->m:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Le/d/b/a/p0/r;->d()V

    new-instance v5, Le/d/b/a/p0/v$e;

    invoke-direct {v5, v0, v3, v4, v2}, Le/d/b/a/p0/v$e;-><init>(ILjava/lang/String;Ljava/util/Map;Le/d/b/a/p0/m;)V

    const/16 v2, 0x1a0

    if-ne v0, v2, :cond_154

    new-instance v0, Le/d/b/a/p0/k;

    invoke-direct {v0, v8}, Le/d/b/a/p0/k;-><init>(I)V

    invoke-virtual {v5, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_154
    throw v5

    :catch_155
    move-exception v0

    invoke-virtual/range {p0 .. p0}, Le/d/b/a/p0/r;->d()V

    new-instance v4, Le/d/b/a/p0/v$c;

    invoke-static {v3}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v2, Le/d/b/a/p0/m;->a:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3, v0, v2, v6}, Le/d/b/a/p0/v$c;-><init>(Ljava/lang/String;Ljava/io/IOException;Le/d/b/a/p0/m;I)V

    throw v4

    :catch_170
    move-exception v0

    new-instance v4, Le/d/b/a/p0/v$c;

    invoke-static {v3}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v2, Le/d/b/a/p0/m;->a:Landroid/net/Uri;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3, v0, v2, v6}, Le/d/b/a/p0/v$c;-><init>(Ljava/lang/String;Ljava/io/IOException;Le/d/b/a/p0/m;I)V

    throw v4
.end method

.method public final a(Ljava/net/URL;I[BJJZZ)Ljava/net/HttpURLConnection;
    .registers 15

    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p1

    check-cast p1, Ljava/net/HttpURLConnection;

    iget v0, p0, Le/d/b/a/p0/r;->f:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    iget v0, p0, Le/d/b/a/p0/r;->g:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    iget-object v0, p0, Le/d/b/a/p0/r;->j:Le/d/b/a/p0/v$f;

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Le/d/b/a/p0/v$f;->a()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20

    :cond_3c
    iget-object v0, p0, Le/d/b/a/p0/r;->k:Le/d/b/a/p0/v$f;

    invoke-virtual {v0}, Le/d/b/a/p0/v$f;->a()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_66

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4a

    :cond_66
    const-wide/16 v0, 0x0

    const-wide/16 v2, -0x1

    cmp-long v4, p4, v0

    if-nez v4, :cond_72

    cmp-long v0, p6, v2

    if-eqz v0, :cond_a0

    :cond_72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    cmp-long v1, p6, v2

    if-eqz v1, :cond_9b

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-long/2addr p4, p6

    const-wide/16 p6, 0x1

    sub-long/2addr p4, p6

    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_9b
    const-string p4, "Range"

    invoke-virtual {p1, p4, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a0
    iget-object p4, p0, Le/d/b/a/p0/r;->h:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "delivery.domand.nicovideo.jp"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b4

    const-string p4, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    :cond_b4
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".domand.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_cd

    sget-object v0, Le/e/a/ModernPlayback;->domandCookie:Ljava/lang/String;

    if-eqz v0, :cond_cd

    const-string v1, "Cookie"

    invoke-virtual {p1, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_cd
    const-string p5, "User-Agent"

    invoke-virtual {p1, p5, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p4, "Referer"

    const-string p5, "https://www.nicovideo.jp/"

    invoke-virtual {p1, p4, p5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p4, "Origin"

    const-string p5, "https://www.nicovideo.jp"

    invoke-virtual {p1, p4, p5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p8, :cond_e9

    const-string p4, "Accept-Encoding"

    const-string p5, "identity"

    invoke-virtual {p1, p4, p5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_e9
    invoke-virtual {p1, p9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    if-eqz p3, :cond_f0

    const/4 p4, 0x1

    goto :goto_f1

    :cond_f0
    const/4 p4, 0x0

    :goto_f1
    invoke-virtual {p1, p4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    invoke-static {p2}, Le/d/b/a/p0/m;->a(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    if-eqz p3, :cond_10f

    array-length p2, p3

    invoke-virtual {p1, p2}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    goto :goto_112

    :cond_10f
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    :goto_112
    return-object p1
.end method
