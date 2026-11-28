.class public Le/e/a/d0;
.super Ljava/lang/Thread;
.source ""


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:Ljava/lang/String;

.field public G:Ljava/lang/String;

.field public H:Ljava/lang/Boolean;

.field public I:Lorg/apache/http/client/CookieStore;

.field public J:Ljava/lang/String;

.field public K:Landroid/content/Context;

.field public L:[Ljava/lang/String;

.field public M:Landroid/content/SharedPreferences;

.field public N:J

.field public O:Z

.field public P:Z

.field public Q:Ljava/lang/String;

.field public R:Z

.field public S:Z

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Ljava/lang/String;

.field public a:Z

.field public b:Le/e/a/v;

.field public c:Le/e/a/g0;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field public g:I

.field public i:Ljava/lang/String;

.field public j:Landroid/os/Handler;

.field public k:Le/e/a/l3/j;

.field public l:Landroid/os/Bundle;

.field public m:Landroid/os/Bundle;

.field public modernCommentsRequested:Z

.field public modernFallbackTried:Z

.field public modernWatch:Lorg/json/JSONObject;

.field public n:Ljava/lang/Boolean;

.field public o:Z

.field public p:Ljava/lang/Boolean;

.field public q:Ljava/lang/Boolean;

.field public r:Ljava/lang/Boolean;

.field public s:Z

.field public t:Z

.field public u:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-boolean v0, p0, Le/e/a/d0;->a:Z

    iput v0, p0, Le/e/a/d0;->e:I

    iput v0, p0, Le/e/a/d0;->f:I

    iput v0, p0, Le/e/a/d0;->g:I

    const-string v2, ""

    iput-object v2, p0, Le/e/a/d0;->i:Ljava/lang/String;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    iput-object v3, p0, Le/e/a/d0;->j:Landroid/os/Handler;

    const/4 v3, 0x0

    iput-object v3, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iput-boolean v0, p0, Le/e/a/d0;->o:Z

    iput-object v1, p0, Le/e/a/d0;->q:Ljava/lang/Boolean;

    iput-object v1, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    iput-boolean v0, p0, Le/e/a/d0;->s:Z

    iput-boolean v0, p0, Le/e/a/d0;->t:Z

    const/4 v3, 0x1

    iput-boolean v3, p0, Le/e/a/d0;->u:Z

    iput-boolean v0, p0, Le/e/a/d0;->w:Z

    iput-boolean v0, p0, Le/e/a/d0;->x:Z

    iput-boolean v0, p0, Le/e/a/d0;->y:Z

    iput-object v1, p0, Le/e/a/d0;->z:Ljava/lang/Boolean;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    aput-object v2, v1, v0

    aput-object v2, v1, v3

    const/4 v4, 0x2

    aput-object v2, v1, v4

    const/4 v5, 0x3

    aput-object v2, v1, v5

    const/4 v5, 0x4

    aput-object v2, v1, v5

    iput-object v1, p0, Le/e/a/d0;->L:[Ljava/lang/String;

    const-wide/16 v6, 0x0

    iput-wide v6, p0, Le/e/a/d0;->N:J

    iput-boolean v0, p0, Le/e/a/d0;->O:Z

    iput-boolean v0, p0, Le/e/a/d0;->P:Z

    const-string v1, "0-1:100"

    iput-object v1, p0, Le/e/a/d0;->Q:Ljava/lang/String;

    iput-boolean v3, p0, Le/e/a/d0;->R:Z

    iput-boolean v0, p0, Le/e/a/d0;->S:Z

    iput-object v2, p0, Le/e/a/d0;->T:Ljava/lang/String;

    iput-object p1, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "share_ng_level"

    const-string v6, "-4800"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->f:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "quality_mode"

    const-string v6, "0"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->e:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "mobile_low_quality_legacy_unused"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Le/e/a/v0;->g(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    iput v5, p0, Le/e/a/d0;->e:I

    :cond_0
    iget v1, p0, Le/e/a/d0;->e:I

    invoke-static {p1, v1}, Le/e/a/FeedbackFixes;->mobileQuality(Landroid/content/Context;I)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->e:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "comment_cast_min"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Le/e/a/d0;->u:Z

    const v0, 0x7f0f0161

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v1, "player_lang"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "-1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move-object p1, v0

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/d0;->g:I

    iget p1, p0, Le/e/a/d0;->g:I

    if-eqz p1, :cond_4

    if-eq p1, v3, :cond_3

    if-eq p1, v4, :cond_2

    goto :goto_2

    :cond_2
    const-string p1, "zh-tw"

    goto :goto_1

    :cond_3
    const-string p1, "en-us"

    goto :goto_1

    :cond_4
    const-string p1, "ja-jp"

    :goto_1
    iput-object p1, p0, Le/e/a/d0;->i:Ljava/lang/String;

    :goto_2
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;
    .registers 31

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p4

    const-string v5, "<thread thread=\""

    const-string v6, "threadkey"

    const-string v7, "user_id"

    const-string v8, "scores"

    const-string v9, "nicoru"

    const-string v10, "\""

    const-string v11, "thread"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v12, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "user_id=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const-string v15, "0"

    const-string v13, "http.cookie-store"

    move-object/from16 v16, v14

    const-string v14, "UTF-8"

    move-object/from16 v17, v5

    const-string v5, ""

    if-nez p3, :cond_1

    :try_start_1
    iget-object v4, v1, Le/e/a/d0;->d:Ljava/lang/String;

    move-object/from16 v19, v7

    const-string v7, "^[0-9]+$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v20, v6

    move-object/from16 v3, v16

    const/4 v4, 0x0

    const/4 v7, 0x0

    goto/16 :goto_4

    :catchall_0
    move-exception v0

    move-object v3, v0

    move-object v2, v12

    goto/16 :goto_11

    :catch_0
    move-exception v0

    move-object v3, v0

    move-object v2, v12

    goto/16 :goto_10

    :cond_1
    move-object/from16 v19, v7

    :goto_0
    :try_start_2
    new-instance v4, Lorg/apache/http/client/methods/HttpGet;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v6

    const-string v6, "http://flapi.nicovideo.jp/api/getthreadkey?thread="

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v7, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v6, v13, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v12, v4, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    const-string v6, "threadkey=([^&]+)&force_184=([0-9]+)"

    const/16 v7, 0x20

    invoke-static {v6, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    invoke-direct {v7, v4, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v21
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    if-eqz v21, :cond_4

    const/4 v6, 0x1

    :try_start_3
    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    const/4 v6, 0x2

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v21, v4

    iget-object v4, v1, Le/e/a/d0;->C:Ljava/lang/String;

    if-eqz v4, :cond_3

    iget-object v4, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    :cond_2
    move-object/from16 v4, v16

    goto :goto_3

    :cond_3
    :goto_2
    move-object v4, v5

    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " threadkey=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\" force_184=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object/from16 v3, p2

    move-object/from16 v4, v21

    move-object/from16 v25, v7

    move-object v7, v6

    move-object/from16 v6, v25

    goto :goto_1

    :cond_4
    move-object/from16 p3, v6

    move-object/from16 v4, p3

    move-object/from16 v3, v16

    :goto_4
    :try_start_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v3

    const-string v3, "user_id=\""

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v6, v1, Le/e/a/d0;->B:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-eqz v6, :cond_8

    :try_start_5
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 p3, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v4

    const-string v4, "http://flapi.nicovideo.jp/api/getthreadkey?thread="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance v3, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v4, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v3, v13, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v12, v6, v3}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    const-string v4, "threadkey=([^&]+)&force_184=([0-9]+)"

    const/16 v6, 0x20

    invoke-static {v4, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    new-instance v6, Ljava/lang/String;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v3

    invoke-direct {v6, v3, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    move-object/from16 v4, p3

    move-object/from16 v22, v5

    const/4 v6, 0x0

    :goto_5
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v23

    if-eqz v23, :cond_7

    move-object/from16 p3, v4

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v23, v3

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_6

    :cond_5
    move-object/from16 v3, p3

    goto :goto_7

    :cond_6
    :goto_6
    move-object v3, v5

    :goto_7
    move-object/from16 v24, v14

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " threadkey=\""

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" force_184=\""

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object/from16 v22, v6

    move-object/from16 v14, v24

    move-object v6, v4

    move-object v4, v3

    move-object/from16 v3, v23

    goto :goto_5

    :cond_7
    move-object/from16 p3, v4

    move-object/from16 v24, v14

    move-object/from16 v3, v22

    goto :goto_8

    :cond_8
    move-object/from16 p3, v3

    move-object/from16 v21, v4

    move-object/from16 v24, v14

    move-object/from16 v4, p3

    move-object v3, v5

    const/4 v6, 0x0

    :goto_8
    :try_start_6
    iget v14, v1, Le/e/a/d0;->g:I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v14, :cond_9

    :try_start_7
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v13

    const-string v13, "language=\""

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v13, v1, Le/e/a/d0;->g:I

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_9

    :cond_9
    move-object/from16 v22, v13

    move-object v10, v5

    :goto_9
    :try_start_8
    const-string v13, ".*?api\\.json.*?"

    invoke-virtual {v2, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz v13, :cond_12

    :try_start_9
    iget-object v4, v1, Le/e/a/d0;->C:Ljava/lang/String;

    if-eqz v4, :cond_a

    iget-object v4, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    :cond_a
    iput-object v5, v1, Le/e/a/d0;->C:Ljava/lang/String;

    :cond_b
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    const-string v10, "force_184"

    if-eqz v7, :cond_c

    :try_start_a
    invoke-virtual {v4, v10, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_c
    const/4 v13, 0x0

    invoke-virtual {v4, v9, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 v14, 0x1

    invoke-virtual {v4, v8, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-object/from16 v14, p2

    invoke-virtual {v4, v11, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v13, v20

    move-object/from16 v15, v21

    invoke-virtual {v4, v13, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-object/from16 v20, v12

    :try_start_b
    iget-object v12, v1, Le/e/a/d0;->C:Ljava/lang/String;

    move-object/from16 v2, v19

    invoke-virtual {v4, v2, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v12, "version"

    move-object/from16 v19, v5

    const-string v5, "20090904"

    invoke-virtual {v4, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "with_global"

    const/4 v12, 0x1

    invoke-virtual {v4, v5, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "content"

    move-object/from16 v18, v3

    move-object/from16 v16, v4

    const/4 v3, 0x1

    move-object/from16 v4, p4

    invoke-virtual {v5, v12, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v7, :cond_d

    invoke-virtual {v5, v10, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_d
    const/4 v7, 0x0

    invoke-virtual {v5, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v5, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v5, v11, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v5, v13, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v7, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v5, v2, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    iget-object v15, v1, Le/e/a/d0;->B:Ljava/lang/String;

    if-eqz v15, :cond_10

    if-eqz v6, :cond_e

    invoke-virtual {v7, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_e
    const/4 v15, 0x0

    invoke-virtual {v7, v9, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v7, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object v15, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v7, v11, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v15, v18

    invoke-virtual {v7, v13, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v7, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "version"

    move-object/from16 v17, v5

    const-string v5, "20090904"

    invoke-virtual {v7, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "with_global"

    const/4 v5, 0x1

    invoke-virtual {v7, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v3, "content"

    invoke-virtual {v12, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v6, :cond_f

    invoke-virtual {v12, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_f
    const/4 v3, 0x0

    invoke-virtual {v12, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 v3, 0x1

    invoke-virtual {v12, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v12, v11, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v12, v13, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v12, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_a

    :cond_10
    move-object/from16 v17, v5

    :goto_a
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "fork"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 v4, 0x0

    invoke-virtual {v3, v9, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v4, "res_from"

    const/16 v6, -0x3e8

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v3, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v5, v19

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v11, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v4, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "version"

    const-string v4, "20061206"

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "with_global"

    const/4 v4, 0x1

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    const-string v4, "rs:0"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "ps:0"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v6, v16

    invoke-virtual {v4, v11, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "pf:0"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "ps:1"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "thread_leaves"

    move-object/from16 v8, v17

    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "pf:1"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v4, "ps:2"

    invoke-virtual {v1, v4}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v4, v11, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v3, "pf:2"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    iget-object v3, v1, Le/e/a/d0;->B:Ljava/lang/String;

    if-eqz v3, :cond_11

    const-string v3, "ps:3"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v3, v11, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v3, "pf:3"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v3, "ps:4"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "thread_leaves"

    invoke-virtual {v3, v4, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v3, "pf:4"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_11
    const-string v3, "rf:0"

    invoke-virtual {v1, v3}, Le/e/a/d0;->i(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    goto/16 :goto_b

    :catchall_1
    move-exception v0

    move-object v3, v0

    move-object/from16 v2, v20

    goto/16 :goto_11

    :catch_1
    move-exception v0

    move-object v3, v0

    move-object/from16 v2, v20

    goto/16 :goto_10

    :cond_12
    move-object/from16 v14, p2

    move-object v2, v4

    move-object/from16 v20, v12

    move-object/from16 v4, p4

    :try_start_c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "<packet>"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v3, v17

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\" version=\"20090904\" "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v7, v16

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " scores=\"1\" with_global=\"1\" "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "/>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "<thread_leaves thread=\""

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\" "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " scores=\"1\" "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ">"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</thread_leaves>"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\" res_from=\"-1000\" version=\"20061206\" "

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " fork=\"1\" click_revision=\"-1\" scores=\"1\"/>"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Le/e/a/d0;->B:Ljava/lang/String;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    if-eqz v7, :cond_13

    :try_start_d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" version=\"20090904\" "

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " scores=\"1\" with_global=\"1\" "

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/>"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "<thread_leaves thread=\""

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " scores=\"1\" "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ">"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</thread_leaves>"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    :cond_13
    :try_start_e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</packet>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u30ea\u30af\u30a8\u30b9\u30c8\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u30b3\u30e1\u30f3\u30c8\u30ea\u30af\u30a8\u30b9\u30c8url\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v3, "https"

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    if-eqz v3, :cond_14

    :try_start_f
    move-object v3, v4
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    goto :goto_c

    :cond_14
    move-object v3, v4

    :goto_c
    :try_start_10
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v4, v3}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v6, "http.socket.timeout"

    const/16 v7, 0x4650

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v6, "http.connection.timeout"

    const/16 v7, 0x4650

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance v3, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v6, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    move-object/from16 v7, v22

    invoke-interface {v3, v7, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Lorg/apache/http/entity/StringEntity;

    move-object/from16 v7, v24

    invoke-direct {v6, v2, v7}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_3
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    move-object/from16 v2, v20

    :try_start_11
    invoke-static {v2, v4, v3}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v6, 0xc8

    if-ne v4, v6, :cond_15

    new-instance v13, Ljava/lang/String;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v3

    invoke-direct {v13, v3, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_d

    :cond_15
    const-string v3, "nicoid"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_2
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    const/4 v13, 0x0

    :goto_d
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    return-object v13

    :catch_2
    move-exception v0

    goto :goto_f

    :catchall_2
    move-exception v0

    move-object/from16 v2, v20

    goto :goto_e

    :catch_3
    move-exception v0

    move-object/from16 v2, v20

    goto :goto_f

    :catchall_3
    move-exception v0

    move-object v2, v12

    :goto_e
    move-object v3, v0

    goto :goto_11

    :catch_4
    move-exception v0

    move-object v2, v12

    :goto_f
    move-object v3, v0

    :goto_10
    :try_start_12
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    const/4 v2, 0x0

    return-object v2

    :catchall_4
    move-exception v0

    goto :goto_e

    :goto_11
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_13

    :goto_12
    throw v3

    :goto_13
    goto :goto_12
.end method

.method public final a(Ljava/lang/String;)V
    .registers 49

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    if-eqz v2, :cond_1

    invoke-static {v1, v2}, Lnicoid/network238/CommentPayload279;->isModernPlaylist(Le/e/a/d0;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "nicoid-comment116"

    const-string v4, "Modern HLS playlist is not a legacy comment payload; parser bypassed"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {v2}, Lnicoid/network238/CommentPayload279;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    return-void

    :cond_1
    move-object/16 p1, v2

    :try_start_0
    iget-object v3, v1, Le/e/a/d0;->c:Le/e/a/g0;

    invoke-virtual {v3}, Le/e/a/g0;->a()V

    iget-object v3, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f005d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    if-eqz v2, :cond_5c

    const-string v7, "["

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v8, "fork"

    const-string v9, "$2"

    const-string v10, "^(#|\uff03)(.+?)$"

    const-string v11, "\\s"

    const-string v12, "Anicoid"

    const-string v14, ""

    const-string v15, ".*?(@|\uff20).+?"

    const-string v13, "user_id"

    move-object/from16 v17, v4

    const-string v4, "mail"

    move-object/from16 v18, v3

    const-string v3, "last_res"

    move-object/from16 v19, v5

    const-string v5, "ticket"

    move-object/from16 v20, v10

    const-string v10, "score"

    move-object/from16 v21, v9

    const-string v9, " / "

    move-object/from16 v22, v6

    const/16 v23, 0x0

    const/16 v25, 0x0

    if-eqz v7, :cond_2e

    :try_start_1
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    :goto_0
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_2d

    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v30

    :goto_1
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_2c

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v31

    move-object/from16 v32, v7

    move-object/from16 v7, v31

    check-cast v7, Ljava/lang/String;

    move/from16 v31, v2

    const-string v2, "thread"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_5

    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v33

    :goto_2
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_4

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    move-object/from16 v35, v9

    move-object/from16 v9, v34

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-eqz v34, :cond_2

    move-object/from16 v34, v11

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v1, Le/e/a/d0;->D:Ljava/lang/String;

    goto :goto_3

    :cond_2
    move-object/from16 v34, v11

    :goto_3
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    const/4 v11, 0x1

    add-int/2addr v9, v11

    div-int/lit8 v9, v9, 0x64

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v1, Le/e/a/d0;->F:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "blockno:"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v1, Le/e/a/d0;->F:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_3
    move-object/from16 v11, v34

    move-object/from16 v9, v35

    goto :goto_2

    :cond_4
    move-object/from16 v35, v9

    move-object/from16 v34, v11

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u30c1\u30b1\u30c3\u30c8:"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Le/e/a/d0;->D:Ljava/lang/String;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " / blockno:"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Le/e/a/d0;->F:Ljava/lang/String;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_5
    move-object/from16 v35, v9

    move-object/from16 v34, v11

    :goto_4
    const-string v2, "chat"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    goto :goto_5

    :cond_6
    const/4 v7, 0x0

    :goto_5
    const-string v9, "content"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    const-string v9, "content"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_6

    :cond_7
    move-object/from16 v9, v23

    :goto_6
    if-nez v9, :cond_8

    move-object v11, v14

    const/4 v9, 0x1

    goto :goto_7

    :cond_8
    move-object v11, v9

    const/4 v9, 0x0

    :goto_7
    if-nez v9, :cond_2b

    iget v9, v1, Le/e/a/d0;->f:I

    if-lt v9, v7, :cond_9

    iget v7, v1, Le/e/a/d0;->f:I

    if-nez v7, :cond_2b

    :cond_9
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_8

    :cond_a
    move-object v7, v14

    :goto_8
    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v39, v9

    goto :goto_9

    :cond_b
    move-object/from16 v39, v14

    :goto_9
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    move-object/from16 p1, v6

    if-nez v7, :cond_c

    move-object v7, v14

    :cond_c
    const-string v6, "vpos"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v33, v13

    const-string v13, "date"

    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v36

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v40

    const-string v2, "(|184|null|iPhone|docomo|au|willcom|softbank)"

    invoke-virtual {v7, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_d

    const/4 v2, 0x3

    new-array v13, v2, [Ljava/lang/Integer;

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v13, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v29, 0x1

    aput-object v2, v13, v29

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v16, 0x2

    aput-object v2, v13, v16

    move-object/from16 v42, v4

    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    aput-object v14, v4, v25

    aput-object v14, v4, v29

    aput-object v14, v4, v16

    invoke-virtual {v1, v7, v13, v4}, Le/e/a/d0;->a(Ljava/lang/String;[Ljava/lang/Integer;[Ljava/lang/String;)V

    aget-object v2, v13, v25

    aget-object v36, v13, v29

    aget-object v13, v13, v16

    aget-object v4, v4, v16

    move-object/from16 v43, v10

    goto :goto_a

    :cond_d
    move-object/from16 v42, v4

    move-object/from16 v43, v10

    move-object/from16 v2, v23

    move-object v4, v2

    move-object v13, v4

    move-object/from16 v36, v13

    :goto_a
    const/4 v10, 0x1

    if-ne v9, v10, :cond_24

    const-string v10, "^/.+?"

    invoke-virtual {v11, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_f

    invoke-virtual {v11, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_e

    goto :goto_b

    :cond_e
    move-object/from16 v45, v3

    move-object/from16 v44, v15

    move-object/from16 v15, v22

    move-object/from16 v10, v34

    const/4 v3, 0x1

    move-object/from16 v46, v21

    move-object/from16 v21, v5

    move-object/from16 v5, v46

    goto/16 :goto_19

    :cond_f
    :goto_b
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    invoke-virtual {v11, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v38

    if-eqz v38, :cond_20

    move-object/from16 v38, v10

    move-object/from16 v10, v34

    move-object/from16 v34, v4

    invoke-virtual {v7, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v45, v3

    move-object/from16 v44, v15

    const/4 v15, 0x0

    :goto_c
    array-length v3, v4

    if-ge v15, v3, :cond_12

    aget-object v3, v4, v15

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v39

    if-nez v39, :cond_10

    move-object/from16 v39, v4

    const-string v4, "^(@|\uff20)[0-9]+$"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    const-string v4, "(@|\uff20)"

    invoke-virtual {v3, v4, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v34, v3

    goto :goto_d

    :cond_10
    move-object/from16 v39, v4

    :cond_11
    :goto_d
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v4, v39

    goto :goto_c

    :cond_12
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6295\u30b3\u30e1\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v15, v35

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v11, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    :goto_e
    array-length v7, v3

    if-ge v4, v7, :cond_1e

    aget-object v7, v3, v4

    invoke-virtual/range {v38 .. v38}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-nez v9, :cond_19

    const-string v9, "^(@|\uff20)\u30c7\u30d5\u30a9\u30eb\u30c8$"

    invoke-virtual {v7, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_13

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    add-int/lit8 v6, v6, 0x64

    goto :goto_f

    :cond_13
    const-string v9, "^(@|\uff20)\u9006$"

    invoke-virtual {v7, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_14

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_f

    :cond_14
    const-string v9, "^(@|\uff20)\u30b3\u30e1\u30f3\u30c8\u7981\u6b62$"

    invoke-virtual {v7, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_15

    const/4 v9, 0x3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_f

    :cond_15
    const-string v9, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7$"

    invoke-virtual {v7, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_16

    const/4 v9, 0x4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :goto_f
    move-object/from16 v35, v15

    move-object/from16 v11, v21

    move-object/from16 v9, v22

    move-object/from16 v22, v3

    move-object/from16 v21, v5

    move-object/from16 v3, v20

    goto/16 :goto_12

    :cond_16
    const-string v9, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7\u30de\u30fc\u30ab\u30fc(:|\uff1a).+?$"

    invoke-virtual {v7, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_18

    const/4 v9, 0x5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const-string v9, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7\u30de\u30fc\u30ab\u30fc(:|\uff1a)"

    invoke-virtual {v7, v9, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v9, v22

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    if-eqz v22, :cond_17

    const/16 v22, 0x4

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    move-object/from16 v22, v3

    move-object/from16 v37, v6

    move v6, v7

    goto :goto_10

    :cond_17
    move-object/from16 v22, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v9, v7, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_10
    move-object/from16 v38, v11

    goto/16 :goto_13

    :cond_18
    move-object/from16 v9, v22

    move-object/from16 v22, v3

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v35, v15

    move-object/from16 v3, v20

    move-object/from16 v11, v21

    move-object/from16 v21, v5

    move-object v15, v7

    goto :goto_11

    :cond_19
    move-object/from16 v9, v22

    move-object/from16 v22, v3

    invoke-virtual/range {v38 .. v38}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v11, 0x4

    if-ne v3, v11, :cond_1c

    const-string v3, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9]+)"

    invoke-virtual {v7, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const-string v3, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9]+)"

    move-object/from16 v11, v21

    invoke-virtual {v7, v3, v11}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v35, v15

    const-string v15, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9]+)"

    move-object/from16 v21, v5

    const-string v5, "$4"

    invoke-virtual {v7, v15, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    mul-int/lit8 v3, v3, 0x3c

    add-int/2addr v3, v5

    mul-int/lit8 v3, v3, 0x64

    add-int/lit8 v3, v3, -0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    move-object/from16 v3, v20

    goto :goto_14

    :cond_1a
    move-object/from16 v35, v15

    move-object/from16 v3, v20

    move-object/from16 v11, v21

    move-object/from16 v21, v5

    invoke-virtual {v7, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    invoke-virtual {v7, v3, v11}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v37, v5

    check-cast v37, Ljava/lang/Integer;

    if-nez v37, :cond_1d

    const/4 v5, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v7, v3, v11}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v9, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_11
    move-object/from16 v38, v15

    goto :goto_14

    :cond_1b
    const/4 v5, -0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :goto_12
    move-object/from16 v38, v7

    goto :goto_14

    :cond_1c
    :goto_13
    move-object/from16 v35, v15

    move-object/from16 v3, v20

    move-object/from16 v11, v21

    move-object/from16 v21, v5

    :cond_1d
    :goto_14
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v20, v3

    move-object/from16 v5, v21

    move-object/from16 v3, v22

    move-object/from16 v15, v35

    move-object/from16 v22, v9

    move-object/from16 v21, v11

    goto/16 :goto_e

    :cond_1e
    move-object/from16 v35, v15

    move-object/from16 v3, v20

    move-object/from16 v11, v21

    move-object/from16 v9, v22

    move-object/from16 v21, v5

    invoke-virtual/range {v38 .. v38}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_1f

    invoke-virtual/range {v37 .. v37}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sub-int/2addr v4, v5

    if-ge v6, v4, :cond_1f

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_15

    :cond_1f
    move-object/from16 v5, v38

    :goto_15
    move-object v7, v5

    move-object v5, v11

    goto :goto_16

    :cond_20
    move-object/from16 v45, v3

    move-object/from16 v38, v10

    move-object/from16 v44, v15

    move-object/from16 v3, v20

    move-object/from16 v9, v22

    move-object/from16 v10, v34

    move-object/from16 v34, v4

    move-object/from16 v46, v21

    move-object/from16 v21, v5

    move-object/from16 v5, v46

    const-string v4, "^/seek.+?"

    invoke-virtual {v11, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_21

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const-string v4, "^/seek\\(vpos:([0-9.]+).*?$"

    const-string v15, "$1"

    invoke-virtual {v11, v4, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/high16 v11, 0x42c80000    # 100.0f

    mul-float v4, v4, v11

    float-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v37

    goto :goto_16

    :cond_21
    move-object/from16 v7, v38

    :goto_16
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v11, 0x5

    if-ne v4, v11, :cond_23

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v11, -0x1

    if-eq v4, v11, :cond_22

    goto :goto_17

    :cond_22
    move-object/from16 v15, v19

    goto :goto_18

    :cond_23
    :goto_17
    const/16 v4, 0x8

    new-array v4, v4, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v25

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v11, 0x1

    aput-object v6, v4, v11

    const/4 v6, 0x2

    aput-object v13, v4, v6

    const/4 v6, 0x3

    aput-object v2, v4, v6

    const/4 v2, 0x4

    aput-object v36, v4, v2

    const/4 v2, 0x5

    aput-object v34, v4, v2

    const/4 v2, 0x6

    aput-object v7, v4, v2

    const/4 v2, 0x7

    aput-object v37, v4, v2

    new-instance v2, Le/e/a/q;

    invoke-direct {v2, v4}, Le/e/a/q;-><init>([Ljava/lang/Integer;)V

    move-object/from16 v15, v19

    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v28, v28, 0x1

    :goto_18
    move-object/from16 v20, v3

    move-object/from16 v22, v5

    move-object/from16 v34, v9

    move-object/from16 v19, v15

    move-object/from16 v5, v17

    move-object/from16 v3, v18

    goto/16 :goto_1e

    :cond_24
    move-object/from16 v45, v3

    move-object/from16 v44, v15

    move-object/from16 v15, v22

    move-object/from16 v10, v34

    move-object/from16 v46, v21

    move-object/from16 v21, v5

    move-object/from16 v5, v46

    const/4 v3, 0x1

    :goto_19
    if-ne v9, v3, :cond_2a

    const-string v3, "@"

    invoke-virtual {v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v9, -0x1

    if-ne v3, v9, :cond_26

    const-string v3, "\uff20"

    invoke-virtual {v7, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v9, :cond_25

    goto :goto_1a

    :cond_25
    move-object/from16 v22, v5

    move-object/from16 v34, v15

    move-object/from16 v5, v23

    goto :goto_1c

    :cond_26
    :goto_1a
    invoke-virtual {v7, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    move-object/from16 v22, v5

    move-object/from16 v34, v15

    move-object/from16 v5, v23

    const/4 v9, 0x0

    :goto_1b
    array-length v15, v3

    if-ge v9, v15, :cond_28

    aget-object v15, v3, v9

    move-object/from16 v37, v3

    const-string v3, "^(@|\uff20)[0-9]+$"

    invoke-virtual {v15, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_27

    const-string v3, "(@|\uff20)"

    invoke-virtual {v15, v3, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object v5, v3

    :cond_27
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v3, v37

    goto :goto_1b

    :cond_28
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u6709\u52b9\u6642\u9593:"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :goto_1c
    iget-boolean v3, v1, Le/e/a/d0;->t:Z

    if-eqz v3, :cond_29

    const/4 v3, 0x5

    new-array v5, v3, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v25

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x1

    aput-object v3, v5, v6

    const/4 v3, 0x2

    aput-object v13, v5, v3

    const/4 v3, 0x3

    aput-object v2, v5, v3

    const/4 v2, 0x4

    aput-object v36, v5, v2

    new-instance v2, Le/e/a/q;

    move-object/from16 v36, v2

    move-object/from16 v37, v11

    move-object/from16 v38, v7

    move-object/from16 v41, v5

    invoke-direct/range {v36 .. v41}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;[Ljava/lang/Integer;)V

    iput-object v4, v2, Le/e/a/q;->h:Ljava/lang/String;

    move-object/from16 v3, v18

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v26, v26, 0x1

    :goto_1d
    move-object/from16 v5, v17

    goto/16 :goto_1e

    :cond_29
    move-object/from16 v3, v18

    const/4 v9, 0x6

    new-array v9, v9, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v9, v25

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v15, 0x1

    aput-object v6, v9, v15

    const/4 v6, 0x2

    aput-object v13, v9, v6

    const/4 v6, 0x3

    aput-object v2, v9, v6

    const/4 v2, 0x4

    aput-object v36, v9, v2

    const/4 v2, 0x5

    aput-object v5, v9, v2

    new-instance v2, Le/e/a/q;

    invoke-direct {v2, v11, v7, v9}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Integer;)V

    iput-object v4, v2, Le/e/a/q;->h:Ljava/lang/String;

    move-object/from16 v5, v17

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v27, v27, 0x1

    goto :goto_1e

    :cond_2a
    move-object/from16 v22, v5

    move-object/from16 v34, v15

    move-object/from16 v5, v17

    move-object/from16 v3, v18

    const/4 v9, 0x5

    new-array v15, v9, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v15, v25

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v9, 0x1

    aput-object v6, v15, v9

    const/4 v6, 0x2

    aput-object v13, v15, v6

    const/4 v6, 0x3

    aput-object v2, v15, v6

    const/4 v2, 0x4

    aput-object v36, v15, v2

    new-instance v2, Le/e/a/q;

    move-object/from16 v36, v2

    move-object/from16 v37, v11

    move-object/from16 v38, v7

    move-object/from16 v41, v15

    invoke-direct/range {v36 .. v41}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;[Ljava/lang/Integer;)V

    iput-object v4, v2, Le/e/a/q;->h:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v26, v26, 0x1

    goto :goto_1e

    :cond_2b
    move-object/from16 v45, v3

    move-object/from16 v42, v4

    move-object/from16 p1, v6

    move-object/from16 v43, v10

    move-object/from16 v33, v13

    move-object/from16 v44, v15

    move-object/from16 v3, v18

    move-object/from16 v10, v34

    move-object/from16 v34, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v5

    goto :goto_1d

    :goto_1e
    move-object/from16 v6, p1

    move-object/from16 v18, v3

    move-object/from16 v17, v5

    move-object v11, v10

    move-object/from16 v5, v21

    move-object/from16 v21, v22

    move/from16 v2, v31

    move-object/from16 v7, v32

    move-object/from16 v13, v33

    move-object/from16 v22, v34

    move-object/from16 v9, v35

    move-object/from16 v4, v42

    move-object/from16 v10, v43

    move-object/from16 v15, v44

    move-object/from16 v3, v45

    goto/16 :goto_1

    :cond_2c
    move/from16 v31, v2

    move-object/from16 v45, v3

    move-object/from16 v42, v4

    move-object/from16 v32, v7

    move-object/from16 v35, v9

    move-object/from16 v43, v10

    move-object v10, v11

    move-object/from16 v33, v13

    move-object/from16 v44, v15

    move-object/from16 v3, v18

    move-object/from16 v34, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v5

    move-object/from16 v5, v17

    add-int/lit8 v2, v31, 0x1

    move-object/from16 v5, v21

    move-object/from16 v21, v22

    move-object/from16 v22, v34

    move-object/from16 v10, v43

    move-object/from16 v3, v45

    goto/16 :goto_0

    :cond_2d
    move-object/from16 v3, v17

    move-object/from16 v4, v18

    move-object/from16 v12, v19

    goto/16 :goto_41

    :cond_2e
    move-object/from16 v45, v3

    move-object/from16 v42, v4

    move-object/from16 v35, v9

    move-object/from16 v43, v10

    move-object v10, v11

    move-object/from16 v33, v13

    move-object/from16 v44, v15

    move-object/from16 v3, v18

    move-object/from16 v34, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v5

    move-object/from16 v5, v17

    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v4

    new-instance v6, Ljava/io/ByteArrayInputStream;

    const-string v7, "UTF-8"

    invoke-virtual {v2, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v6, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v4, v6}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u30ce\u30fc\u30c9\u540d\uff1a"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v12, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u5b50\u8981\u7d20\u306e\u6570\uff1a"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v12, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v1

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    :goto_1f
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v13

    if-ge v4, v13, :cond_5b

    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v13

    invoke-interface {v13}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    move-object/from16 p1, v2

    const/4 v2, 0x1

    if-ne v15, v2, :cond_5a

    check-cast v13, Lorg/w3c/dom/Element;

    invoke-interface {v13}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v15

    if-gtz v15, :cond_33

    invoke-interface {v13}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v2

    const-string v15, "thread"

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    invoke-interface {v13, v8}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-interface {v13, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v15, "1"

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2f

    goto :goto_20

    :cond_2f
    move-object/from16 v15, v21

    goto :goto_21

    :cond_30
    :goto_20
    move-object/from16 v15, v21

    invoke-interface {v13, v15}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-interface {v13, v15}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Le/e/a/d0;->D:Ljava/lang/String;

    :cond_31
    move-object/from16 v2, v45

    invoke-interface {v13, v2}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_32

    invoke-interface {v13, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    const/16 v17, 0x1

    add-int/lit8 v13, v13, 0x1

    div-int/lit8 v13, v13, 0x64

    move-object/from16 v45, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Le/e/a/d0;->F:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "blockno:"

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v6, Le/e/a/d0;->F:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_21

    :cond_32
    move-object/from16 v45, v2

    :goto_21
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u30c1\u30b1\u30c3\u30c8:"

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v6, Le/e/a/d0;->D:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, " / blockno:"

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v6, Le/e/a/d0;->F:Ljava/lang/String;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    move/from16 v18, v4

    move/from16 v30, v7

    move-object/from16 v26, v8

    move-object/from16 v31, v10

    move-object/from16 v21, v15

    :goto_22
    move-object/from16 v17, v45

    const/4 v8, 0x2

    const/4 v13, 0x3

    const/16 v24, 0x1

    move-object v4, v3

    move-object v3, v5

    move/from16 v45, v9

    const/4 v5, 0x4

    const/4 v9, 0x5

    goto/16 :goto_3e

    :cond_33
    move-object/from16 v17, v45

    invoke-interface {v13}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v15

    move/from16 v18, v4

    const-string v4, "chat"

    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_59

    move-object/from16 v4, v43

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_34

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v43, v4

    goto :goto_23

    :cond_34
    move-object/from16 v43, v4

    const/4 v15, 0x0

    :goto_23
    iget v4, v6, Le/e/a/d0;->f:I

    if-lt v4, v15, :cond_35

    iget v4, v6, Le/e/a/d0;->f:I

    if-nez v4, :cond_59

    :cond_35
    move-object/from16 v4, v42

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_36

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    goto :goto_24

    :cond_36
    move-object v15, v14

    :goto_24
    move-object/from16 v42, v4

    move-object/from16 v4, v33

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v26

    if-eqz v26, :cond_37

    invoke-interface {v13, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v39, v26

    goto :goto_25

    :cond_37
    move-object/from16 v39, v14

    :goto_25
    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v33, v4

    invoke-interface {v13, v8}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v4

    move-object/from16 v26, v8

    if-nez v15, :cond_38

    move-object v15, v14

    :cond_38
    const-string v8, "vpos"

    invoke-interface {v13, v8}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_39

    const-string v8, "vpos"

    invoke-interface {v13, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_26

    :cond_39
    const-string v8, "0"

    :goto_26
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v27, v5

    const-string v5, "date"

    invoke-interface {v13, v5}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3a

    const-string v5, "date"

    invoke-interface {v13, v5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_27

    :cond_3a
    const-string v5, "0"

    :goto_27
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v30

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v40

    const-string v5, "(|184|null|iPhone|docomo|au|willcom|softbank)"

    invoke-virtual {v15, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3b

    const/4 v5, 0x3

    new-array v13, v5, [Ljava/lang/Integer;

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v13, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v28, 0x1

    aput-object v5, v13, v28

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v16, 0x2

    aput-object v5, v13, v16

    move/from16 v30, v7

    const/4 v5, 0x3

    new-array v7, v5, [Ljava/lang/String;

    aput-object v14, v7, v25

    aput-object v14, v7, v28

    aput-object v14, v7, v16

    invoke-virtual {v6, v15, v13, v7}, Le/e/a/d0;->a(Ljava/lang/String;[Ljava/lang/Integer;[Ljava/lang/String;)V

    aget-object v5, v13, v25

    aget-object v6, v13, v28

    aget-object v13, v13, v16

    aget-object v7, v7, v16

    move-object/from16 v28, v3

    goto :goto_28

    :cond_3b
    move/from16 v30, v7

    move-object/from16 v28, v3

    move-object/from16 v5, v23

    move-object v6, v5

    move-object v7, v6

    move-object v13, v7

    :goto_28
    const/4 v3, 0x1

    if-ne v4, v3, :cond_52

    const-string v3, "^/.+?"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3d

    move-object/from16 v3, v44

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v31

    if-eqz v31, :cond_3c

    goto :goto_29

    :cond_3c
    move-object/from16 v44, v3

    move/from16 v45, v9

    move-object/from16 v9, v20

    const/4 v3, 0x1

    move-object/from16 v46, v22

    move-object/from16 v22, v12

    move-object/from16 v12, v19

    move-object/from16 v19, v46

    goto/16 :goto_39

    :cond_3d
    move-object/from16 v3, v44

    :goto_29
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v36

    move-object/from16 v44, v3

    if-eqz v36, :cond_4e

    invoke-virtual {v15, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    move-object/from16 v36, v7

    move/from16 v45, v9

    const/4 v7, 0x0

    :goto_2a
    array-length v9, v3

    if-ge v7, v9, :cond_40

    aget-object v9, v3, v7

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Integer;->intValue()I

    move-result v37

    if-nez v37, :cond_3e

    move-object/from16 v37, v3

    const-string v3, "^(@|\uff20)[0-9]+$"

    invoke-virtual {v9, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3f

    const-string v3, "(@|\uff20)"

    invoke-virtual {v9, v3, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v36, v3

    goto :goto_2b

    :cond_3e
    move-object/from16 v37, v3

    :cond_3f
    :goto_2b
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v3, v37

    goto :goto_2a

    :cond_40
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u6295\u30b3\u30e1\uff1a"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v9, v35

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v12, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    :goto_2c
    array-length v4, v2

    if-ge v3, v4, :cond_4c

    aget-object v4, v2, v3

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-nez v7, :cond_47

    const-string v7, "^(@|\uff20)\u30c7\u30d5\u30a9\u30eb\u30c8$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_41

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    add-int/lit8 v8, v8, 0x64

    :goto_2d
    move-object/from16 v31, v4

    goto :goto_2e

    :cond_41
    const-string v7, "^(@|\uff20)\u9006$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_42

    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2d

    :cond_42
    const-string v7, "^(@|\uff20)\u30b3\u30e1\u30f3\u30c8\u7981\u6b62$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_43

    const/4 v7, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2d

    :cond_43
    const-string v7, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_44

    const/4 v7, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2d

    :goto_2e
    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    move-object/from16 v7, v34

    move-object/from16 v34, v2

    goto/16 :goto_32

    :cond_44
    const-string v7, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7\u30de\u30fc\u30ab\u30fc(:|\uff1a).+?$"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_46

    const/4 v7, 0x5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const-string v7, "^(@|\uff20)\u30b8\u30e3\u30f3\u30d7\u30de\u30fc\u30ab\u30fc(:|\uff1a)"

    invoke-virtual {v4, v7, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v7, v34

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    if-eqz v31, :cond_45

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    move-object/from16 v34, v2

    move-object/from16 v32, v8

    move-object/from16 v35, v9

    move-object/from16 v31, v15

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    move-object/from16 v22, v12

    goto/16 :goto_30

    :cond_45
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    move-object/from16 v34, v2

    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v2, v31

    move-object/from16 v46, v22

    move-object/from16 v22, v12

    move-object v12, v15

    move-object/from16 v15, v46

    goto/16 :goto_2f

    :cond_46
    move-object/from16 v7, v34

    move-object/from16 v34, v2

    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    const/4 v2, -0x1

    move-object/from16 v22, v12

    goto/16 :goto_31

    :cond_47
    move-object/from16 v7, v34

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v15

    move-object/from16 v34, v2

    const/4 v2, 0x4

    if-ne v15, v2, :cond_4a

    const-string v2, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9.]+)"

    invoke-virtual {v4, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_48

    const-string v2, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9.]+)"

    move-object/from16 v15, v22

    invoke-virtual {v4, v2, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    move-object/from16 v35, v9

    const-string v9, "^(#|\uff03)([0-9]+)(:|\uff1a)([0-9.]+)"

    move-object/from16 v22, v12

    const-string v12, "$4"

    invoke-virtual {v4, v9, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    const/high16 v9, 0x42700000    # 60.0f

    mul-float v2, v2, v9

    add-float/2addr v2, v4

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float v2, v2, v4

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v32, v2

    move-object/from16 v9, v20

    goto :goto_33

    :cond_48
    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    move-object/from16 v22, v12

    invoke-virtual {v4, v9}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-virtual {v4, v9, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v32, v2

    check-cast v32, Ljava/lang/Integer;

    if-nez v32, :cond_4b

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v4, v9, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    move-object/from16 v2, v31

    :goto_2f
    invoke-virtual {v7, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v4, v8

    move-object/from16 v31, v12

    :goto_30
    move v8, v4

    goto :goto_33

    :cond_49
    const/4 v2, -0x1

    :goto_31
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    goto :goto_33

    :cond_4a
    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    :goto_32
    move-object/from16 v22, v12

    :cond_4b
    :goto_33
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v20, v9

    move-object/from16 v12, v22

    move-object/from16 v2, v34

    move-object/from16 v9, v35

    move-object/from16 v34, v7

    move-object/from16 v22, v15

    goto/16 :goto_2c

    :cond_4c
    move-object/from16 v35, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    move-object/from16 v7, v34

    move-object/from16 v22, v12

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_4d

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v2, v3

    if-ge v8, v2, :cond_4d

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v34, v7

    :goto_34
    move-object/from16 v7, v36

    goto :goto_35

    :cond_4d
    move-object/from16 v34, v7

    move-object/from16 v3, v31

    goto :goto_34

    :cond_4e
    move/from16 v45, v9

    move-object/from16 v9, v20

    move-object/from16 v15, v22

    move-object/from16 v3, v34

    move-object/from16 v22, v12

    const-string v4, "^/seek.+?"

    invoke-virtual {v2, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4f

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const-string v4, "^/seek\\(vpos:([0-9.]+).*?$"

    move-object/from16 v34, v3

    const-string v3, "$1"

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    move-object v3, v12

    goto :goto_35

    :cond_4f
    move-object/from16 v34, v3

    move-object/from16 v3, v31

    :goto_35
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v4, 0x5

    if-ne v2, v4, :cond_51

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_50

    goto :goto_36

    :cond_50
    move-object/from16 v12, v19

    goto :goto_37

    :cond_51
    :goto_36
    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Integer;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v25

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v8, 0x1

    aput-object v4, v2, v8

    const/4 v4, 0x2

    aput-object v13, v2, v4

    const/4 v4, 0x3

    aput-object v5, v2, v4

    const/4 v4, 0x4

    aput-object v6, v2, v4

    const/4 v4, 0x5

    aput-object v7, v2, v4

    const/4 v4, 0x6

    aput-object v3, v2, v4

    const/4 v3, 0x7

    aput-object v32, v2, v3

    new-instance v3, Le/e/a/q;

    invoke-direct {v3, v2}, Le/e/a/q;-><init>([Ljava/lang/Integer;)V

    move-object/from16 v12, v19

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    :goto_37
    move-object v6, v1

    move-object/from16 v20, v9

    move-object/from16 v31, v10

    move-object/from16 v19, v15

    move-object/from16 v3, v27

    move-object/from16 v4, v28

    :goto_38
    move/from16 v7, v30

    const/4 v5, 0x4

    const/4 v8, 0x2

    const/4 v9, 0x5

    const/4 v13, 0x3

    const/16 v24, 0x1

    goto/16 :goto_40

    :catch_0
    move-exception v0

    move-object v2, v0

    goto/16 :goto_43

    :cond_52
    move/from16 v45, v9

    move-object/from16 v9, v20

    move-object/from16 v3, v22

    move-object/from16 v22, v12

    move-object/from16 v12, v19

    move-object/from16 v19, v3

    const/4 v3, 0x1

    :goto_39
    if-ne v4, v3, :cond_58

    const-string v3, "@"

    invoke-virtual {v15, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_54

    const-string v3, "\uff20"

    invoke-virtual {v15, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-eq v3, v4, :cond_53

    goto :goto_3a

    :cond_53
    move-object/from16 v20, v9

    move-object/from16 v31, v10

    move-object/from16 v9, v23

    goto :goto_3c

    :cond_54
    :goto_3a
    invoke-virtual {v15, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    move-object/from16 v20, v9

    move-object/from16 v31, v10

    move-object/from16 v9, v23

    const/4 v4, 0x0

    :goto_3b
    array-length v10, v3

    if-ge v4, v10, :cond_56

    aget-object v10, v3, v4

    move-object/from16 v32, v3

    const-string v3, "^(@|\uff20)[0-9]+$"

    invoke-virtual {v10, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_55

    const-string v3, "(@|\uff20)"

    invoke-virtual {v10, v3, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object v9, v3

    :cond_55
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v3, v32

    goto :goto_3b

    :cond_56
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6709\u52b9\u6642\u9593:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :goto_3c
    iget-boolean v3, v1, Le/e/a/d0;->t:Z

    if-eqz v3, :cond_57

    const/4 v3, 0x5

    new-array v4, v3, [Ljava/lang/Integer;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v25

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v8, 0x1

    aput-object v3, v4, v8

    const/4 v3, 0x2

    aput-object v13, v4, v3

    const/4 v3, 0x3

    aput-object v5, v4, v3

    const/4 v3, 0x4

    aput-object v6, v4, v3

    new-instance v3, Le/e/a/q;

    move-object/from16 v36, v3

    move-object/from16 v37, v2

    move-object/from16 v38, v15

    move-object/from16 v41, v4

    invoke-direct/range {v36 .. v41}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;[Ljava/lang/Integer;)V

    iput-object v7, v3, Le/e/a/q;->h:Ljava/lang/String;

    move-object/from16 v4, v28

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v45, 0x1

    move/from16 v45, v9

    move-object/from16 v3, v27

    goto :goto_3d

    :cond_57
    move-object/from16 v4, v28

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Integer;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v3, v25

    invoke-static/range {v30 .. v30}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x1

    aput-object v8, v3, v10

    const/4 v8, 0x2

    aput-object v13, v3, v8

    const/4 v8, 0x3

    aput-object v5, v3, v8

    const/4 v5, 0x4

    aput-object v6, v3, v5

    const/4 v5, 0x5

    aput-object v9, v3, v5

    new-instance v5, Le/e/a/q;

    invoke-direct {v5, v2, v15, v3}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Integer;)V

    iput-object v7, v5, Le/e/a/q;->h:Ljava/lang/String;

    move-object/from16 v3, v27

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v30, 0x1

    move/from16 v30, v7

    :goto_3d
    move-object v6, v1

    goto/16 :goto_38

    :cond_58
    move-object/from16 v20, v9

    move-object/from16 v31, v10

    move-object/from16 v3, v27

    move-object/from16 v4, v28

    const/4 v9, 0x5

    new-array v10, v9, [Ljava/lang/Integer;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v10, v25

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v24, 0x1

    aput-object v8, v10, v24

    const/4 v8, 0x2

    aput-object v13, v10, v8

    const/4 v13, 0x3

    aput-object v5, v10, v13

    const/4 v5, 0x4

    aput-object v6, v10, v5

    new-instance v6, Le/e/a/q;

    move-object/from16 v36, v6

    move-object/from16 v37, v2

    move-object/from16 v38, v15

    move-object/from16 v41, v10

    invoke-direct/range {v36 .. v41}, Le/e/a/q;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;[Ljava/lang/Integer;)V

    iput-object v7, v6, Le/e/a/q;->h:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v45, 0x1

    move-object v6, v1

    move/from16 v45, v2

    goto :goto_3f

    :cond_59
    move-object v4, v3

    move-object v3, v5

    move/from16 v30, v7

    move-object/from16 v26, v8

    move/from16 v45, v9

    move-object/from16 v31, v10

    const/4 v5, 0x4

    const/4 v8, 0x2

    const/4 v9, 0x5

    const/4 v13, 0x3

    const/16 v24, 0x1

    :goto_3e
    move-object/from16 v46, v22

    move-object/from16 v22, v12

    move-object/from16 v12, v19

    move-object/from16 v19, v46

    goto :goto_3f

    :cond_5a
    move/from16 v18, v4

    move/from16 v30, v7

    move-object/from16 v26, v8

    move-object/from16 v31, v10

    goto/16 :goto_22

    :goto_3f
    move/from16 v7, v30

    :goto_40
    add-int/lit8 v2, v18, 0x1

    move-object v5, v3

    move-object v3, v4

    move-object/from16 v8, v26

    move-object/from16 v10, v31

    move/from16 v9, v45

    move v4, v2

    move-object/from16 v45, v17

    move-object/from16 v2, p1

    move-object/from16 v46, v19

    move-object/from16 v19, v12

    move-object/from16 v12, v22

    move-object/from16 v22, v46

    goto/16 :goto_1f

    :cond_5b
    move-object v4, v3

    move-object v3, v5

    move-object/from16 v12, v19

    goto :goto_42

    :cond_5c
    move-object v12, v5

    move-object/from16 v46, v4

    move-object v4, v3

    move-object/from16 v3, v46

    :goto_41
    move-object v6, v1

    :goto_42
    new-instance v2, Le/e/a/d0$b;

    invoke-direct {v2, v6}, Le/e/a/d0$b;-><init>(Le/e/a/d0;)V

    invoke-static {v4, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5d

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual {v2, v3}, Le/e/a/v;->c(Ljava/util/ArrayList;)V

    :cond_5d
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5e

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual {v2, v12}, Le/e/a/v;->b(Ljava/util/ArrayList;)V

    iget-object v2, v6, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v6, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0062

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_5e
    iget-object v2, v6, Le/e/a/d0;->c:Le/e/a/g0;

    invoke-virtual {v2, v4}, Le/e/a/g0;->a(Ljava/util/ArrayList;)V

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual {v2, v4}, Le/e/a/v;->a(Ljava/util/ArrayList;)V

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    iget-boolean v3, v6, Le/e/a/d0;->P:Z

    iput-boolean v3, v2, Le/e/a/v;->k:Z

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    iget-object v3, v6, Le/e/a/d0;->E:Ljava/lang/String;

    iput-object v3, v2, Le/e/a/v;->g:Ljava/lang/String;

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    iget-object v3, v6, Le/e/a/d0;->A:Ljava/lang/String;

    iput-object v3, v2, Le/e/a/v;->h:Ljava/lang/String;

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    iget-object v3, v6, Le/e/a/d0;->F:Ljava/lang/String;

    iput-object v3, v2, Le/e/a/v;->i:Ljava/lang/String;

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->b()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le/e/a/v;->f:Ljava/lang/String;

    iget-object v2, v6, Le/e/a/d0;->b:Le/e/a/v;

    iget-object v3, v6, Le/e/a/d0;->i:Ljava/lang/String;

    iput-object v3, v2, Le/e/a/v;->j:Ljava/lang/String;

    iget-boolean v2, v6, Le/e/a/d0;->t:Z

    if-eqz v2, :cond_5f

    invoke-virtual {v6, v4}, Le/e/a/d0;->a(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Le/e/a/d0;->J:Ljava/lang/String;

    :cond_5f
    const-string v2, "nicoid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u30b3\u30e1\u30f3\u30c8\u53d6\u5f97\uff1a"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_44

    :goto_43
    invoke-static {v2}, Lnicoid/network238/CommentPayload279;->report(Ljava/lang/Exception;)V

    :goto_44
    return-void
.end method

.method public final a(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 26

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    const-string v3, "movie"

    const-string v4, "signature"

    const-string v5, "token"

    const-string v6, "priority"

    const-string v7, "encryption"

    const-string v8, ""

    const-string v9, "content_uri"

    const-string v10, "session"

    :try_start_0
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    const/4 v12, 0x1

    iput-boolean v12, v1, Le/e/a/d0;->S:Z

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    goto :goto_0

    :cond_0
    const/4 v13, 0x0

    :goto_0
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    const-string v11, "recipeId"

    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "recipe_id"

    const-string v12, "recipeId"

    invoke-virtual {v13, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v14, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "playerId"

    invoke-virtual {v13, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    const-string v12, "player_id"

    const-string v2, "playerId"

    invoke-virtual {v13, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    const-string v2, "client_info"

    invoke-virtual {v14, v2, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v11

    invoke-virtual {v14, v6, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    :cond_3
    const-string v2, "contentId"

    invoke-virtual {v13, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "content_id"

    const-string v6, "contentId"

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v14, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4
    const-string v2, "content_type"

    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "timing_constraint"

    const-string v3, "unlimited"

    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v14, v9, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v11, "videos"

    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const-string v12, "nicoid"

    if-eqz v11, :cond_9

    :try_start_1
    const-string v11, "videos"

    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    move-object/from16 v18, v8

    move-object/from16 v19, v9

    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v20, v10

    const-string v10, "\u753b\u8cea : "

    if-ge v8, v9, :cond_5

    :try_start_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " / "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v12, v9}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v10, v20

    goto :goto_1

    :cond_5
    iget v8, v1, Le/e/a/d0;->e:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const/4 v9, 0x5

    move-object/from16 v21, v15

    const-string v15, "video_src_ids"

    if-ne v8, v9, :cond_7

    :try_start_3
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v9

    move-object/from16 v22, v4

    const/4 v4, 0x2

    if-le v9, v4, :cond_6

    const/4 v4, 0x1

    invoke-virtual {v11, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v6, v15, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v8, 0x1

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-static {v12, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_6
    invoke-virtual {v6, v15, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_3

    :cond_7
    move-object/from16 v22, v4

    iget v4, v1, Le/e/a/d0;->e:I

    const/4 v8, 0x4

    if-ne v4, v8, :cond_8

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_6

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    sub-int/2addr v8, v9

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v6, v15, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_8
    iget v4, v1, Le/e/a/d0;->e:I

    const/4 v8, 0x3

    if-ne v4, v8, :cond_6

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_6

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x2

    sub-int/2addr v8, v9

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-virtual {v6, v15, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/4 v9, 0x2

    sub-int/2addr v8, v9

    invoke-virtual {v11, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2

    :cond_9
    move-object/from16 v22, v4

    move-object/from16 v18, v8

    move-object/from16 v19, v9

    move-object/from16 v20, v10

    move-object/from16 v21, v15

    :goto_3
    const-string v4, "audios"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    const-string v4, "audio_src_ids"

    const-string v8, "audios"

    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    invoke-virtual {v6, v4, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_a
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "src_id_to_mux"

    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "content_src_ids"

    invoke-virtual {v4, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v3, "content_src_id_sets"

    invoke-virtual {v14, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "heartbeatLifetime"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    const-string v4, "lifetime"

    const-string v6, "heartbeatLifetime"

    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_b
    const-string v4, "heartbeat"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "keep_method"

    invoke-virtual {v14, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "no"

    const-string v3, "no"

    const-string v4, "urls"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "urls"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_d

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v6, "url"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v6, "isWellKnownPort"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    const-string v2, "yes"

    :cond_c
    const-string v6, "isSsl"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    const-string v3, "yes"

    goto :goto_4

    :cond_d
    move-object/from16 v8, v18

    :cond_e
    :goto_4
    const-string v4, "protocols"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    const-string v4, "protocols"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v6, 0x0

    :goto_5
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v6, v9, :cond_10

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v10, "http"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_f

    const/4 v9, 0x1

    iput-boolean v9, v1, Le/e/a/d0;->o:Z

    goto :goto_6

    :cond_f
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    :cond_10
    :goto_6
    const-string v4, "transferPresets"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    const-string v4, "transferPresets"

    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_11

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_7

    :cond_11
    move-object/from16 v4, v18

    :goto_7
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_12

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_12

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    goto :goto_8

    :cond_12
    const/4 v6, 0x0

    :goto_8
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v16, v8

    iget-boolean v8, v1, Le/e/a/d0;->o:Z

    if-eqz v8, :cond_13

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "use_well_known_port"

    invoke-virtual {v0, v7, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "use_ssl"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "transfer_preset"

    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "http_output_download_parameters"

    invoke-virtual {v11, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v17, v12

    goto :goto_9

    :cond_13
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v17, v12

    const-string v12, "use_well_known_port"

    invoke-virtual {v8, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "use_ssl"

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "transfer_preset"

    invoke-virtual {v8, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "segment_duration"

    const/16 v3, 0x1388

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v8, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "hls_parameters"

    invoke-virtual {v11, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "trackingId"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    :goto_9
    const-string v0, "parameters"

    invoke-virtual {v15, v0, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "http_parameters"

    invoke-virtual {v10, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "name"

    const-string v2, "http"

    invoke-virtual {v9, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "parameters"

    invoke-virtual {v9, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "protocol"

    invoke-virtual {v14, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_14
    move-object/from16 v3, v22

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_15
    const-string v3, "session_operation_auth_by_signature"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "session_operation_auth"

    invoke-virtual {v14, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "auth_type"

    const-string v3, "ht2"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "content_key_timeout"

    const-string v3, "ht2"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "contentKeyTimeout"

    invoke-virtual {v13, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    const-string v2, "content_key_timeout"

    const-string v3, "contentKeyTimeout"

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_16
    const-string v2, "service_id"

    const-string v3, "nicovideo"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "serviceUserId"

    invoke-virtual {v13, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    const-string v2, "service_user_id"

    const-string v3, "serviceUserId"

    invoke-virtual {v13, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_17
    const-string v2, "content_auth"

    invoke-virtual {v14, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v2, v20

    move-object/from16 v0, v21

    invoke-virtual {v0, v2, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->V:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sessionRequestJSON : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v3, v17

    invoke-static {v3, v0}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sessionresdata : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v8, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v4, "http.cookie-store"

    iget-object v5, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v0, v4, v5}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "?_format=json"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "firstSessionURL : "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "?_format=json"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    :try_start_4
    new-instance v5, Lorg/apache/http/entity/StringEntity;

    iget-object v7, v1, Le/e/a/d0;->V:Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-direct {v5, v7, v9}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v3, v4, v0}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    new-instance v4, Ljava/lang/String;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v0

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sessionresdata : "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_b

    :catch_0
    move-exception v0

    goto :goto_a

    :catch_1
    move-exception v0

    move-object/from16 v4, v18

    :goto_a
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_b
    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    if-eqz v6, :cond_18

    const-string v0, "hls_encryption_v1"

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v3, 0x1

    iput-boolean v3, v1, Le/e/a/d0;->x:Z

    :cond_18
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "data"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v3, v19

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?_format=json&_method=PUT"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Le/e/a/d0;->U:Ljava/lang/String;

    const-string v2, "data"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->V:Ljava/lang/String;

    const-string v0, "sessionURL"

    iget-object v2, v1, Le/e/a/d0;->U:Ljava/lang/String;

    move-object/from16 v5, p2

    invoke-virtual {v5, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "sessionRequest"

    iget-object v2, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v5, v0, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "isNewsaba"

    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    invoke-virtual {v5, v0, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sessionURL : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Le/e/a/d0;->U:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v5, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content_uri : "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v5, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_c

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->fillInStackTrace()Ljava/lang/Throwable;

    :goto_c
    return-void
.end method

.method public final b(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 23

    move-object/from16 v1, p0

    const-string v0, "smileInfo"

    const-string v2, "ranking"

    const-string v3, "video"

    const-string v4, "playlist"

    const-string v5, "owner"

    const-string v6, "genre"

    const-string v7, "tag"

    const-string v8, "comment"

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    move-object/from16 v11, p1

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v10, v9}, Le/e/a/VideoInfoUi;->captureStatistics(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_1

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_3

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    goto :goto_3

    :cond_3
    const/4 v11, 0x0

    :goto_3
    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_4

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_4

    :cond_4
    const/4 v2, 0x0

    :goto_4
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_5

    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "items"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    goto :goto_5

    :cond_5
    const/4 v13, 0x0

    :goto_5
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_6

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_6

    :cond_6
    const/4 v0, 0x0

    :goto_6
    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_7

    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    goto :goto_7

    :cond_7
    const/4 v14, 0x0

    :goto_7
    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_8

    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_8

    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    goto :goto_8

    :cond_8
    const/4 v15, 0x0

    :goto_8
    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_9

    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_9

    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    goto :goto_9

    :cond_9
    const/4 v12, 0x0

    :goto_9
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    :goto_a
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 p1, v10

    move-object/from16 v10, v16

    check-cast v10, Ljava/lang/String;

    move-object/from16 v16, v12

    const-string v12, "recipe"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    const-string v12, "recipe"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v12, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_a
    move-object/from16 v10, p1

    move-object/from16 v12, v16

    goto :goto_a

    :cond_b
    move-object/from16 v16, v12

    const-string v4, "id"

    const-string v10, ""

    if-eqz v5, :cond_f

    :try_start_1
    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    :goto_b
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 p1, v12

    move-object/from16 v12, v17

    check-cast v12, Ljava/lang/String;

    move-object/from16 v17, v15

    const-string v15, "nickname"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c

    const-string v15, "nickname"

    move-object/from16 v18, v7

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v15, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    :cond_c
    move-object/from16 v18, v7

    :goto_c
    const-string v7, "iconUrl"

    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    const-string v7, "icon_url"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v7, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    const-string v7, "videoUserId"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v7, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_e
    move-object/from16 v12, p1

    move-object/from16 v15, v17

    move-object/from16 v7, v18

    goto :goto_b

    :cond_f
    move-object/from16 v18, v7

    move-object/from16 v17, v15

    const-string v5, "thumbnail"

    const-string v7, "url"

    if-eqz v14, :cond_13

    :try_start_2
    invoke-virtual {v14}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    :goto_d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_13

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 p1, v12

    const-string v12, "name"

    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10

    const-string v12, "nickname"

    move-object/from16 v19, v13

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v12, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    :cond_10
    move-object/from16 v19, v13

    :goto_e
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_11

    const-string v12, "channelVideoURL"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v6

    const-string v6, "http://ch.nicovideo.jp/"

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v12, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    :cond_11
    move-object/from16 v20, v6

    :goto_f
    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    const-string v6, "icon_url"

    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v6, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12
    move-object/from16 v12, p1

    move-object/from16 v13, v19

    move-object/from16 v6, v20

    goto :goto_d

    :cond_13
    move-object/from16 v20, v6

    move-object/from16 v19, v13

    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    :goto_10
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_14

    const-string v13, "v"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14
    const-string v13, "description"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_15

    const-string v13, "description"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_17

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "middleUrl"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_16

    const-string v14, "middleUrl"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_16

    const-string v14, "thumbImage"

    const-string v15, "middleUrl"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :goto_11
    invoke-virtual {v9, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_12

    :cond_16
    const-string v14, "thumbImage"

    invoke-virtual {v13, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_11

    :cond_17
    :goto_12
    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_18

    const-string v13, "videoId"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_18
    const-string v13, "title"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_19

    const-string v13, "videoTitle"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_19
    const-string v13, "registeredAt"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    const-string v13, "first_retrieve"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1a
    const-string v13, "duration"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1b

    const-string v13, "length"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1b
    const-string v13, "count"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1c

    const-string v13, "count"

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "viewCount"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 p1, v5

    const-string v5, "view"

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v14, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "mylistCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mylist"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v5, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "commentCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v5, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "likeCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "like"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v5, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_13

    :cond_1c
    move-object/from16 p1, v5

    :goto_13
    const-string v5, "movieType"

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    const-string v5, "movie_type"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v5, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1d
    move-object/from16 v5, p1

    goto/16 :goto_10

    :cond_1e
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    :cond_1f
    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_20

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f

    const-string v6, "flvUrl"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v6, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "HTML5 flvUrl:"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Le/e/a/d0;->G:Ljava/lang/String;

    goto :goto_14

    :cond_20
    const/4 v0, 0x0

    if-eqz v11, :cond_25

    const-string v3, "threads"

    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x0

    :goto_15
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_25

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    const/4 v12, 0x0

    :cond_21
    :goto_16
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_24

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    const-string v14, "isDefaultPostTarget"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_22

    const-string v14, "isDefaultPostTarget"

    invoke-virtual {v6, v14, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_22

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_22
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_23

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    :cond_23
    const-string v14, "label"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_21

    const-string v14, "label"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_21

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "extra-community"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_21

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v1, Le/e/a/d0;->B:Ljava/lang/String;

    goto :goto_16

    :cond_24
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    :cond_25
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "extraCommunityThreadid:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v2, :cond_26

    move-object/from16 v3, v20

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_26

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_26

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v5, "genreName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v5, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "highestRank"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rank"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_26
    const/4 v2, 0x1

    if-eqz v19, :cond_29

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    :goto_17
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_28

    move-object/from16 v12, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "isNicodicArticleExists"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_27

    const-string v8, "dic"

    invoke-virtual {v6, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_27
    const-string v8, "name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v8, v18

    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v18, v8

    move-object/from16 v19, v12

    goto :goto_17

    :cond_28
    const-string v0, "tagList"

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_29
    if-eqz v17, :cond_2a

    iput-boolean v2, v1, Le/e/a/d0;->w:Z

    :cond_2a
    iget-boolean v0, v1, Le/e/a/d0;->w:Z

    if-eqz v0, :cond_2d

    const-string v0, "delivery"

    move-object/from16 v15, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const-string v0, "delivery"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    const-string v0, "delivery"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0, v9}, Le/e/a/d0;->a(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    move-object/from16 v12, v16

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->C:Ljava/lang/String;

    :cond_2b
    const-string v0, "isPremium"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string v0, "isPremium"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    :cond_2c
    const-string v0, "server"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "/api/"

    const-string v3, "/api.json/"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_18

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2d
    :goto_18
    return-object v9
.end method

.method public final b(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 13

    const-string v0, "cookie"

    const-string v1, "sessionRequest"

    const-string v2, "UTF-8"

    const-string v3, "sessionURL"

    const-string v4, "/nicoid/nicoid_cache/"

    iget-object v5, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v5}, Le/e/a/o;->a(Landroid/content/Context;)V

    const/4 v5, 0x0

    :try_start_0
    new-instance v6, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v8}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ".json"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    :cond_0
    iget-boolean v7, p0, Le/e/a/d0;->O:Z

    if-eqz v7, :cond_6

    :cond_1
    iget-boolean v7, p0, Le/e/a/d0;->O:Z

    if-nez v7, :cond_2

    iget-object v7, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0059

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p1}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_4
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_5
    new-instance v0, Le/e/a/CacheOutputStream;

    invoke-direct {v0, v6, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-static {p1}, Le/e/a/v0;->a(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_6
    :goto_0
    invoke-static {p0, p2}, Lnicoid/network238/CommentPayload279;->isModernPlaylist(Le/e/a/d0;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_1
    new-instance p1, Le/e/a/CacheFile;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".xml"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_8

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    iget-boolean v0, p0, Le/e/a/d0;->O:Z

    if-eqz v0, :cond_a

    :cond_9
    new-instance v0, Le/e/a/CacheOutputStream;

    invoke-direct {v0, p1, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance p1, Ljava/io/OutputStreamWriter;

    invoke-direct {p1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_a
    :goto_1
    return-void
.end method

.method public final c(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 13

    const-string v0, "([0-9]+):([0-9]+)"

    const-string v1, "length"

    const-string v2, "tag"

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    :try_start_0
    const-string v4, "addVideoToDeflist\\([0-9]+, \'([^\']+)\'\\);"

    const/16 v5, 0x20

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_0

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Le/e/a/v0;->f:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sput-wide v8, Le/e/a/v0;->e:J

    :cond_0
    const-string v4, "<link rel=\"canonical\" href=\"/watch/([^\"]+)\">"

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "v"

    invoke-virtual {p1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    iget-object v6, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-static {v6}, Lnicoid/network238/PublicThumb278;->get(Ljava/lang/String;)[B

    move-result-object v6

    new-instance v8, Ljava/lang/String;

    const-string v9, "UTF-8"

    invoke-direct {v8, v6, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v6, "<([a-zA-Z_]+?)(\\s[^>]+|)>([^<]+?)</[a-zA-Z_]+?>\n"

    invoke-static {v6, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_0
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x3

    if-eqz v8, :cond_2

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_2
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    const-string v8, "$1"

    invoke-virtual {v6, v0, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    mul-int/lit8 v6, v6, 0x3c

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "$2"

    invoke-virtual {v8, v0, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    add-int/2addr v6, v8

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v1, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v8, "code"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v1, 0x7f0f0068

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_4
    const-string v8, "video_id"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v10, "description"

    if-eqz v8, :cond_5

    :try_start_1
    const-string v6, "videoId"

    goto :goto_1

    :cond_5
    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    move-object v6, v10

    goto :goto_1

    :cond_6
    const-string v8, "thumbnail_url"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    const-string v6, "thumbImage"

    goto :goto_1

    :cond_7
    const-string v8, "title"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    const-string v6, "videoTitle"

    :cond_8
    :goto_1
    const-string v8, "view_counter"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    const-string v6, "viewCount"

    :cond_9
    const-string v8, "comment_num"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    const-string v6, "commentCount"

    :cond_a
    const-string v8, "mylist_counter"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    const-string v6, "mylistCount"

    :cond_b
    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v6, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_c
    const-string v0, "tagList"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    return-object v3
.end method

.method public d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .registers 6

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {p1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    iget-object v2, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    const-string v3, "http.cookie-store"

    invoke-interface {p1, v3, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    invoke-static {v0, v1, p1}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final d()V
    .registers 8

    invoke-static {p0}, Le/e/a/CachedPlayback;->offline(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UTF-8"

    const-string v1, "/nicoid/nicoid_cache/"

    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006d

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :try_start_0
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".json"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0073

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-static {v2}, Le/e/a/CacheInputStream;->readTextRC2(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v5, v6}, Le/e/a/LikeState219;->restoreCacheValueRC2(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_1
    :try_start_1
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0072

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    invoke-static {v2}, Le/e/a/CacheInputStream;->readTextRC2(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/d0;->b:Le/e/a/v;

    iput-object v0, v1, Le/e/a/v;->d:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/d0;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_3
    :goto_2
    iget-object v0, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    const-string v1, ""

    invoke-virtual {p0, v1, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    invoke-static {p0}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    return-void
.end method

.method public final f(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 12

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->info(Le/e/a/d0;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string v0, "nickname"

    iget-object v1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    if-eqz v1, :cond_2

    const-string p1, "isNewsaba"

    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/d0;->w:Z

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    const-string v0, "sessionURL"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/d0;->U:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    const-string v0, "sessionRequest"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/d0;->V:Ljava/lang/String;

    :cond_1
    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v1, 0x7f0f006c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    return-object p1

    :cond_2
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0065

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?watch_harmful=2"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Le/e/a/d0;->e:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x3

    const-string v6, ""

    if-eq p1, v5, :cond_4

    :try_start_1
    iget p1, p0, Le/e/a/d0;->e:I

    const/4 v5, 0x4

    if-ne p1, v5, :cond_3

    goto :goto_0

    :cond_3
    move-object p1, v6

    goto :goto_1

    :cond_4
    :goto_0
    const-string p1, "&eco=1"

    :goto_1
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {p1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v4, "http.cookie-store"

    iget-object v5, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {p1, v4, v5}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "Accept-Language"

    iget-object v5, p0, Le/e/a/d0;->i:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2, v3, p1}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p1

    new-instance v3, Ljava/lang/String;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Le/e/a/d0;->N:J

    const-string v4, "<h1>\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u60c5\u5831\u306e\u5165\u529b</h1>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_5

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u300c\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u767b\u9332\u300d\u3092\u5b8c\u4e86\u3055\u305b\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u30d6\u30e9\u30a6\u30b6\u304b\u3089\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u30a2\u30af\u30bb\u30b9\u3057"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u30a2\u30ab\u30a6\u30f3\u30c8\u60c5\u5831\u304c\u672a\u5165\u529b\u306e\u305f\u3081\u52d5\u753b\u3092\u518d\u751f\u3067\u304d\u307e\u305b\u3093"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    return-object v1

    :cond_5
    iget-object v4, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v5, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v7, 0x7f0f0064

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const-string v4, "\"js-initial-watch-data\" data-api-data=\"([^\"]+?)\" data-environment=\""

    const/16 v5, 0x20

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object v7, v1

    :goto_2
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_6

    invoke-virtual {v4, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    :cond_6
    const/4 v4, 0x0

    if-nez v7, :cond_7

    iput-boolean v4, p0, Le/e/a/d0;->R:Z

    const-string v8, "id=\"watchAPIDataContainer\"[^>]+?>([^<]+?)</div>"

    invoke-static {v8, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_3
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "database : HTML5"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v8, p0, Le/e/a/d0;->R:Z

    if-eqz v8, :cond_8

    const-string v8, "\u3060\u3088"

    goto :goto_4

    :cond_8
    const-string v8, "\u3058\u3083\u306a\u3044\u3088"

    :goto_4
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v7, :cond_9

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "database : "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_9
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "nicovideo_version"

    if-nez v7, :cond_f

    const/16 v7, 0xc8

    if-ne v5, v7, :cond_a

    :try_start_2
    invoke-virtual {p0, v3}, Le/e/a/d0;->c(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v8, v9}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_8

    :cond_a
    iget-object v0, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v2, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v3, 0x7f0f0068

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const/16 v0, 0x1f7

    if-ne v5, v0, :cond_b

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f006b

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_5
    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_6

    :cond_b
    const/16 v0, 0x194

    if-ne v5, v0, :cond_c

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f006a

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_c
    const/16 v0, 0x193

    if-ne v5, v0, :cond_d

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f0069

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_d
    iget-object v0, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :goto_6
    iget-object p1, p0, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_e

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {p1, v4}, Le/e/a/l3/j;->a(Z)V

    invoke-virtual {p0}, Le/e/a/d0;->d()V

    :cond_e
    return-object v1

    :cond_f
    iget-boolean p1, p0, Le/e/a/d0;->R:Z

    if-eqz p1, :cond_10

    invoke-virtual {p0, v7}, Le/e/a/d0;->b(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    :goto_7
    invoke-virtual {p1, v8, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_8

    :cond_10
    invoke-virtual {p0, v7}, Le/e/a/d0;->e(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    goto :goto_7

    :goto_8
    const-string v3, "description"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_11

    goto :goto_9

    :cond_11
    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0066

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_9
    const-string v5, "Anicoid"

    invoke-static {v5, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "<span id=\"deleted_message_default\">(.+?)</span>"

    const-string v7, "<font color=\'#ff0000\'>$1</font>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "href=\"(h?ttps?://)([^\"]+)\""

    const-string v7, "motoweblink\"$2\""

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, ">(h?ttps?://)([^<]+)</a>"

    const-string v7, "nakaweblink>$2</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "(h?ttps?)(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v7, "<a href=\'http$2\'>http$2</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "motoweblink\"([^\"]+)\""

    const-string v7, "href=\'http://$1\'"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "nakaweblink>([^<]+)</a>"

    const-string v7, ">http://$1</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v8, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v9, :cond_12

    const-string v4, "(http://com.nicovideo.jp/community/|)co([0-9]+)"

    const-string v5, "<a href=\'http://com.nicovideo.jp/community/co$2\'>$1co$2</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "(http://www.nicovideo.jp/|)(mylist|user|watch)/([0-9/]+)"

    const-string v5, "<a href=\'http://www.nicovideo.jp/$2/$3\'>$1$2/$3</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "(http://www.nicovideo.jp/watch/|)(sm|so|nm|ss)([0-9]+)"

    const-string v5, "<a href=\'http://www.nicovideo.jp/watch/$2$3\'>$1$2$3</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_12
    const-string v4, "\""

    const-string v5, "\'"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "description_original"

    invoke-virtual {p1, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "cookie"

    iget-object v4, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v4}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_13

    const-string v3, "name"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_13
    if-eqz v3, :cond_14

    const-string v4, "\\s\u3055\u3093"

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    invoke-virtual {p0, p1}, Le/e/a/d0;->a(Landroid/os/Bundle;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method public final g(Ljava/lang/String;)Ljava/lang/String;
    .registers 18

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-static/range {p0 .. p0}, Le/e/a/GuestWatch;->hasFailure(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    move-object/from16 v1, p0

    const-string v2, "flvUrl"

    iget-boolean v3, v1, Le/e/a/d0;->a:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    return-object v4

    :cond_2
    iget-object v3, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual/range {p0 .. p1}, Le/e/a/d0;->f(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    goto :goto_0

    :cond_3
    invoke-virtual/range {p0 .. p1}, Le/e/a/d0;->h(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    :goto_0
    if-nez v3, :cond_4

    return-object v4

    :cond_4
    iput-object v3, v1, Le/e/a/d0;->m:Landroid/os/Bundle;

    iget-object v5, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v5, v3}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V

    const-string v5, "v"

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "v"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v6, p1

    :goto_1
    const-string v7, "?watch_harmful=2"

    invoke-static {v5, v6, v7}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, v1, Le/e/a/d0;->a:Z

    if-eqz v6, :cond_6

    return-object v4

    :cond_6
    :try_start_0
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v7, "http.cookie-store"

    iget-object v8, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v6, v7, v8}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    const-string v8, "http.useragent"

    const-string v9, "Windows"

    invoke-interface {v7, v8, v9}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    const-string v7, "length"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    const/4 v8, 0x1

    if-eqz v7, :cond_14

    const-string v7, "length"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/16 v9, 0x64

    div-int/lit8 v10, v7, 0x3c

    const/16 v11, 0x3c

    rem-int/2addr v7, v11

    add-int/2addr v10, v8

    const/16 v12, 0x32

    if-le v7, v12, :cond_7

    add-int/lit8 v10, v10, 0x1

    :cond_7
    const/16 v7, 0xb

    const/4 v12, 0x6

    if-le v10, v8, :cond_8

    if-ge v10, v12, :cond_8

    const/16 v9, 0xfa

    goto :goto_2

    :cond_8
    if-lt v10, v12, :cond_9

    if-ge v10, v7, :cond_9

    const/16 v9, 0x1f4

    goto :goto_2

    :cond_9
    if-lt v10, v7, :cond_a

    const/16 v9, 0x3e8

    :cond_a
    :goto_2
    const/16 v13, 0x1e

    if-le v10, v13, :cond_b

    if-gt v10, v11, :cond_b

    const/16 v14, 0x32

    goto :goto_3

    :cond_b
    if-le v10, v11, :cond_c

    const/16 v14, 0x5a

    if-gt v10, v14, :cond_c

    const/16 v14, 0x1e

    goto :goto_3

    :cond_c
    const/16 v14, 0x5a

    if-le v10, v14, :cond_d

    const/16 v14, 0xa

    goto :goto_3

    :cond_d
    const/16 v14, 0x64

    :goto_3
    iget-boolean v15, v1, Le/e/a/d0;->t:Z

    if-eqz v15, :cond_13

    iget-boolean v15, v1, Le/e/a/d0;->u:Z

    if-eqz v15, :cond_13

    if-le v10, v8, :cond_e

    if-ge v10, v12, :cond_e

    const/16 v9, 0xfa

    goto :goto_4

    :cond_e
    if-lt v10, v12, :cond_f

    if-ge v10, v7, :cond_f

    const/16 v9, 0x1f4

    goto :goto_4

    :cond_f
    if-lt v10, v7, :cond_10

    const/16 v9, 0x15e

    :cond_10
    :goto_4
    const/4 v7, 0x5

    if-le v10, v7, :cond_11

    const/16 v7, 0x14

    if-gt v10, v7, :cond_11

    const/16 v13, 0x32

    goto :goto_5

    :cond_11
    const/16 v7, 0x14

    if-le v10, v7, :cond_12

    if-gt v10, v13, :cond_12

    goto :goto_5

    :cond_12
    if-le v10, v11, :cond_13

    const/16 v13, 0xa

    goto :goto_5

    :cond_13
    move v13, v14

    :goto_5
    iget-object v7, v1, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    invoke-static {v7, v13}, Le/e/a/Followup173;->legacyPerMinute(Landroid/content/SharedPreferences;I)I

    move-result v13

    invoke-static {v7, v9}, Le/e/a/Followup173;->legacyTotal(Landroid/content/SharedPreferences;I)I

    move-result v9

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "0-"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    :cond_14
    iget v7, v1, Le/e/a/d0;->e:I

    iget v9, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x4

    const/4 v11, 0x3

    if-ne v9, v10, :cond_15

    const/4 v7, 0x3

    :cond_15
    iget v9, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x5

    if-ne v9, v10, :cond_16

    const/4 v7, 0x0

    :cond_16
    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_17

    const-string v9, "movie_type"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_17

    const-string v9, "movie_type"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "fl"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_17

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_17

    const/4 v7, 0x3

    :cond_17
    const-string v9, "videoId"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_18

    const-string v9, "videoId"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "so"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_18

    iput-boolean v8, v1, Le/e/a/d0;->P:Z

    iget-object v9, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v10, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v12, 0x7f0f0071

    invoke-virtual {v10, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_18
    iget-object v9, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-nez v9, :cond_1a

    if-ne v7, v11, :cond_19

    const/4 v7, -0x2

    goto :goto_6

    :cond_19
    const/4 v7, -0x1

    :goto_6
    iget-boolean v9, v1, Le/e/a/d0;->w:Z

    if-eqz v9, :cond_1a

    const/4 v7, -0x3

    :cond_1a
    iget-boolean v9, v1, Le/e/a/d0;->a:Z

    if-eqz v9, :cond_1b

    const/4 v2, 0x0

    return-object v2

    :cond_1b
    if-eqz v7, :cond_1d

    if-ne v7, v11, :cond_1c

    goto :goto_7

    :cond_1c
    const/4 v9, 0x0

    goto :goto_8

    :cond_1d
    :goto_7
    const-string v9, "content_uri"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    :goto_8
    :try_start_1
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "isHTTPSupport"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v11, v1, Le/e/a/d0;->o:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-boolean v10, v1, Le/e/a/d0;->o:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    const-string v11, "Anicoid"

    const-string v12, "UTF-8"

    if-nez v10, :cond_40

    :try_start_2
    const/16 v13, 0x20

    iget-boolean v8, v1, Le/e/a/d0;->a:Z

    if-eqz v8, :cond_1e

    const/4 v2, 0x0

    return-object v2

    :cond_1e
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u30c7\u30d0\u30c3\u30b0 mode: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const-string v8, "&eco=1"

    const-string v10, ""

    if-eqz v7, :cond_20

    const/4 v13, 0x3

    if-ne v7, v13, :cond_1f

    goto :goto_9

    :cond_1f
    move-object/from16 p1, v8

    goto/16 :goto_10

    :cond_20
    :goto_9
    :try_start_3
    new-instance v13, Lorg/apache/http/client/methods/HttpGet;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v15, 0x3

    if-ne v7, v15, :cond_21

    move-object v15, v8

    goto :goto_a

    :cond_21
    move-object v15, v10

    :goto_a
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v13, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "HTML5 MODE"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v15, 0x3

    if-ne v7, v15, :cond_22

    move-object v15, v8

    goto :goto_b

    :cond_22
    move-object v15, v10

    :goto_b
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v14, "([^=]+)=([^&]*)\\&"

    const/16 v15, 0x20

    invoke-static {v14, v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 p1, v8

    new-instance v8, Ljava/lang/String;

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v13

    invoke-direct {v8, v13, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "&"

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-boolean v13, v1, Le/e/a/d0;->R:Z

    if-nez v13, :cond_23

    const-string v13, "flvInfo"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_23

    const-string v8, "flvInfo"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "isHTML5Player\u3058\u3083\u306a\u304f\u3066 data: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_23
    invoke-virtual {v14, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    :cond_24
    :goto_c
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_2c

    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    const-string v14, "error"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_25

    goto/16 :goto_f

    :cond_25
    const-string v14, "thread_id"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_26

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_26
    const-string v14, "ms"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_27

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_27
    const-string v14, "url"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_28

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_d

    :cond_28
    const/4 v14, 0x2

    :goto_d
    const-string v15, "fmst"

    invoke-virtual {v13, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_29

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    :cond_29
    iget-object v14, v1, Le/e/a/d0;->C:Ljava/lang/String;

    if-nez v14, :cond_2a

    const-string v14, "user_id"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2a

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->C:Ljava/lang/String;

    :cond_2a
    iget-object v14, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    if-nez v14, :cond_24

    const-string v14, "is_premium"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_24

    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    const-string v14, "1"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2b

    const/4 v13, 0x1

    goto :goto_e

    :cond_2b
    const/4 v13, 0x0

    :goto_e
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    iput-object v13, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    goto/16 :goto_c

    :cond_2c
    :goto_f
    iget-boolean v8, v1, Le/e/a/d0;->w:Z

    if-eqz v8, :cond_2d

    const-string v8, "content_uri"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    :cond_2d
    :goto_10
    iget-boolean v8, v1, Le/e/a/d0;->w:Z

    if-nez v8, :cond_2e

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_2e

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    :cond_2e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "flvurl\uff01"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v9, :cond_38

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v2

    const/16 v8, 0x18

    if-gt v2, v8, :cond_38

    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-nez v2, :cond_38

    const-string v2, "https"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    if-eqz v2, :cond_38

    :try_start_4
    invoke-static {v9}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v8

    check-cast v8, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    const/16 v13, 0x1bb

    invoke-virtual {v8, v2, v13}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_11

    :catch_0
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/d0;->y:Z

    const-string v2, "isSSLHandShakeERROR\uff01"

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_11
    iget-boolean v2, v1, Le/e/a/d0;->y:Z

    if-eqz v2, :cond_38

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://sp.nicovideo.jp/watch/"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v2, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    new-instance v8, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v8, v2}, Ljava/lang/String;-><init>([B)V

    const-string v2, "id=\"jsDataContainer\" data-context=\"([^\"]+)\""

    const/16 v13, 0x20

    invoke-static {v2, v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v8, 0x0

    :goto_12
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_2f

    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_12

    :cond_2f
    :try_start_6
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v8, "watch_api_url"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_13

    :catch_1
    move-exception v0

    move-object v2, v0

    :try_start_7
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x0

    :goto_13
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "SSLERROR SP LOAD "

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v8, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v8, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v8, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    new-instance v13, Ljava/lang/String;

    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v8

    invoke-direct {v13, v8, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v13, "watchAuthKey"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v13, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0068

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const/4 v2, 0x0

    return-object v2

    :cond_30
    invoke-static {v5}, Lnicoid/network238/PublicThumb278;->get(Ljava/lang/String;)[B

    move-result-object v2

    new-instance v13, Ljava/lang/String;

    invoke-direct {v13, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v2, "<([a-zA-Z_]+?)(\\s[^>]+|)>([^<]+?)</[a-zA-Z_]+?>\n"

    const/16 v14, 0x20

    invoke-static {v2, v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v13, 0x0

    :cond_31
    :goto_14
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_32

    const/4 v14, 0x1

    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, "movie_type"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_31

    const/4 v14, 0x3

    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, "flv"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_31

    const/4 v13, 0x1

    goto :goto_14

    :cond_32
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:"

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/4 v2, 0x3

    if-ne v7, v2, :cond_33

    const/4 v13, 0x1

    :cond_33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "&watch_auth_key="

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v13, :cond_34

    move-object/from16 v14, p1

    goto :goto_15

    :cond_34
    move-object v14, v10

    :goto_15
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "&watch_auth_key="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v13, :cond_35

    move-object/from16 v8, p1

    goto :goto_16

    :cond_35
    move-object v8, v10

    :goto_16
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v2, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    const-string v8, "([^=]+)=([^&]*)\\&"

    const/16 v13, 0x20

    invoke-static {v8, v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v14, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v14, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&"

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_36
    :goto_17
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_38

    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v13, "error"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_37

    goto :goto_18

    :cond_37
    const-string v13, "url"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    const/4 v2, 0x2

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_17

    :cond_38
    :goto_18
    const/4 v2, -0x1

    if-eq v7, v2, :cond_39

    const/4 v2, -0x2

    if-ne v7, v2, :cond_40

    :cond_39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http://ext.nicovideo.jp/thumb_watch/"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "&k="

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "thumbPlayKey"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v8, -0x2

    if-ne v7, v8, :cond_3a

    move-object/from16 v8, p1

    goto :goto_19

    :cond_3a
    move-object v8, v10

    :goto_19
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://ext.nicovideo.jp/thumb_watch/"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "&k="

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "thumbPlayKey"

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, -0x2

    if-ne v7, v5, :cond_3b

    move-object/from16 v10, p1

    :cond_3b
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v2, v6}, Lnicoid/network238/LegacyGet258;->executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    const-string v5, "([^=]+)=([^&]*)\\&"

    const/16 v6, 0x20

    invoke-static {v5, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v8, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v8, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http://ext.nicovideo.jp/thumb_watch/ / "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3c
    :goto_1a
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_40

    const/4 v2, 0x1

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v6, "error"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3d

    const/4 v2, 0x2

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v5, "invalid_play_key"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v5, "OperaMax\u7b49\u4f7f\u7528\u3057\u3066\u3044\u308b\u5834\u5408\u306f\u7121\u52b9\u306b\u3059\u308b\u3053\u3068\u3067\u8aad\u307f\u8fbc\u307f\u53ef\u80fd\u3067\u3059"

    invoke-interface {v2, v5}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_1b

    :cond_3d
    iget-object v6, v1, Le/e/a/d0;->A:Ljava/lang/String;

    if-nez v6, :cond_3e

    const-string v6, "thread_id"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3e

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_3e
    iget-object v6, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-nez v6, :cond_3f

    const-string v6, "ms"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3f

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_3f
    if-nez v9, :cond_3c

    const-string v6, "url"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3c

    const/4 v2, 0x2

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_1a

    :catch_2
    move-exception v0

    move-object v2, v0

    goto/16 :goto_1d

    :cond_40
    :goto_1b
    const/4 v2, -0x3

    if-ne v7, v2, :cond_41

    const-string v2, "content_uri"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    :cond_41
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "userid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " / "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " mode:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-eqz v2, :cond_42

    if-nez v9, :cond_44

    :cond_42
    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-eqz v2, :cond_4a

    iget-boolean v2, v1, Le/e/a/d0;->S:Z

    if-nez v2, :cond_4a

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_4a

    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-nez v2, :cond_43

    const-string v2, "http://"

    iput-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_43
    if-nez v9, :cond_44

    const-string v9, "http://"

    :cond_44
    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-static {v2, v12}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-static {v9, v12}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "http"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_48

    const-string v2, "rtmp"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_45

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0079

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_45

    const/4 v2, 0x0

    return-object v2

    :cond_45
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_46

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0070

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_46
    iget-boolean v2, v1, Le/e/a/d0;->P:Z

    if-eqz v2, :cond_47

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0074

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_47
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_48

    const/4 v2, 0x0

    return-object v2

    :cond_48
    iget-boolean v2, v1, Le/e/a/d0;->x:Z

    if-eqz v2, :cond_49

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0070

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_49

    const/4 v2, 0x0

    return-object v2

    :cond_49
    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_1e

    :cond_4a
    iget-boolean v2, v1, Le/e/a/d0;->P:Z

    if-eqz v2, :cond_4b

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0070

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0074

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1c

    :cond_4b
    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0068

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0075

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_1c
    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    const/4 v2, 0x0

    return-object v2

    :catch_3
    move-exception v0

    move-object v2, v0

    const/4 v9, 0x0

    :goto_1d
    iget-object v3, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0067

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1e
    iget-boolean v2, v1, Le/e/a/d0;->a:Z

    if-eqz v2, :cond_4c

    const/4 v2, 0x0

    return-object v2

    :cond_4c
    return-object v9
.end method

.method public final h(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 27

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->info(Le/e/a/d0;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    move-object/from16 v1, p0

    const-string v2, "session"

    const-string v3, "meta"

    const-string v4, "videoId"

    const-string v5, "content_uri"

    const-string v6, "data"

    const-string v7, "videoWatchId"

    const-string v8, "nicoid"

    const-string v9, "UTF-8"

    iget-object v10, v1, Le/e/a/d0;->l:Landroid/os/Bundle;

    if-eqz v10, :cond_1

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->l:Landroid/os/Bundle;

    return-object v2

    :cond_1
    :try_start_0
    iget-object v11, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v12, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v13, 0x7f0f0065

    invoke-virtual {v12, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const-string v11, "0"

    iput-object v11, v1, Le/e/a/d0;->C:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    iput-object v12, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://embed.nicovideo.jp/watch/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, p1

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    new-instance v13, Ljava/lang/String;

    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v12

    invoke-direct {v13, v12, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v12, "id=\"ext-player\" data-props=\"([^\"]+?)\""

    const/16 v14, 0x20

    invoke-static {v12, v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    const/4 v13, 0x0

    :goto_0
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    const/4 v15, 0x1

    if-eqz v14, :cond_2

    invoke-virtual {v12, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_0

    :cond_2
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_27

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "database : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "http://embed.nicovideo.jp/play/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "?forceSmile=1"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    new-instance v11, Ljava/lang/String;

    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-static {v10}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v10

    invoke-direct {v11, v10, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "loaddata : "

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    const-string v11, "description"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    const-string v11, "description"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "href=\"(h?ttps?://)([^\"]+)\""

    const-string v15, "motoweblink\"$2\""

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, ">(h?ttps?://)([^<]+)</a>"

    const-string v15, "nakaweblink>$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(h?ttps?)(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v15, "<a href=\'http$2\'>http$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "motoweblink\"([^\"]+)\""

    const-string v15, "href=\'http://$1\'"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "nakaweblink>([^<]+)</a>"

    const-string v15, ">http://$1</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://com.nicovideo.jp/community/|)co([0-9]+)"

    const-string v15, "<a href=\'http://com.nicovideo.jp/community/co$2\'>$1co$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://www.nicovideo.jp/|)(mylist|user|watch)/([0-9/]+)"

    const-string v15, "<a href=\'http://www.nicovideo.jp/$2/$3\'>$1$2/$3</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://www.nicovideo.jp/watch/|)(sm|so|nm|ss)([0-9]+)"

    const-string v15, "<a href=\'http://www.nicovideo.jp/watch/$2$3\'>$1$2$3</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "\""

    const-string v15, "\'"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "description_original"

    invoke-virtual {v10, v13, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const-string v11, "actionTrackId"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const-string v13, ""

    if-eqz v11, :cond_4

    :try_start_1
    const-string v11, "actionTrackId"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_1

    :cond_4
    move-object v11, v13

    :goto_1
    const-string v15, "thumbnailUrl"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_5

    const-string v15, "thumbImage"

    move-object/from16 v16, v5

    const-string v5, "thumbnailUrl"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v15, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    move-object/from16 v16, v5

    :goto_2
    const-string v5, "title"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "videoTitle"

    const-string v15, "title"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10, v5, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    const-string v4, "viewCounter"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    const-string v4, "viewCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "viewCounter"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    const-string v4, "mylistCounter"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    const-string v4, "mylistCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mylistCounter"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    const-string v4, "commentCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "thread"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v17, v2

    const-string v2, "commentCounter"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "lengthInSeconds"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    const-string v2, "length"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lengthInSeconds"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, "v"

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_b
    const-string v2, "tags"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    move-object/from16 v18, v6

    invoke-static {v14}, Lnicoid/network238/PublicThumb278;->get(Ljava/lang/String;)[B

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v5, v4, v13}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<([a-zA-Z_]+?)(\\s[^>]+|)>([^<]+?)</[a-zA-Z_]+?>\n"

    const/16 v6, 0x20

    invoke-static {v5, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    :goto_3
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    const/4 v6, 0x2

    const/4 v7, 0x3

    if-eqz v5, :cond_15

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ".*category.*"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c

    const-string v5, "category"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_c
    const-string v5, "tag"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "tag"

    move-object/from16 v19, v13

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v6, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_4

    :cond_d
    move-object/from16 v19, v13

    :goto_4
    const-string v5, "first_retrieve"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    const-string v5, "first_retrieve"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_e
    const-string v5, "user_nickname"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    const-string v5, "nickname"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_f
    const-string v5, "user_icon_url"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string v5, "icon_url"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_10
    const-string v5, "user_id"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    const-string v5, "videoUserId"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    const-string v5, "ch_name"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    const-string v5, "nickname"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12
    const-string v5, "ch_icon_url"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    const-string v5, "icon_url"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    const-string v5, "user_id"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    const-string v5, "videoUserId"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14
    const-string v5, "getthumbinfo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, " : "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v13, v19

    goto/16 :goto_3

    :cond_15
    move-object/from16 v19, v13

    const-string v4, "tagList"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/d0;->w:Z

    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-eqz v2, :cond_25

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://www.nicovideo.jp/api/watch/v3_guest/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "frontendId"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?_frontendId="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "frontendId"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_5
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    :cond_16
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?_frontendId=70"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    :goto_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&_frontendVersion=0&actionTrackId="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&skips=harmful"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "guestWatchURL : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    new-instance v4, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v4, v2, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "guestWatch : "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "status"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "status"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_17

    const/4 v3, 0x1

    goto :goto_7

    :cond_17
    const/4 v3, 0x0

    :goto_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getWatchSuccess : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_25

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v5, v18

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "media"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "delivery"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "movie"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    move-object/from16 v12, v17

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v13, "urls"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_18

    const-string v13, "urls"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_18

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "url"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_8

    :cond_18
    const/4 v13, 0x0

    :goto_8
    const-string v14, "playerId"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_19

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    const-string v15, "player_id"

    const-string v7, "playerId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v14, v15, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "client_info"

    invoke-virtual {v4, v7, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_19
    const-string v7, "serviceUserId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v14, "auth_type"

    const-string v15, "authTypes"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    const-string v6, "http"

    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v14, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "content_key_timeout"

    const-string v14, "contentKeyTimeout"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v6, "service_id"

    const-string v14, "nicovideo"

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "service_user_id"

    const-string v14, "serviceUserId"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "content_auth"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1a
    const-string v6, "content_id"

    const-string v7, "contentId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "videos"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1e

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v20, v2

    const-string v2, "videos"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move-object/from16 v21, v10

    iget v10, v1, Le/e/a/d0;->e:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v22, v5

    const/4 v5, 0x5

    move-object/from16 v23, v9

    const-string v9, "video_src_ids"

    if-ne v10, v5, :cond_1c

    :try_start_2
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    move-object/from16 v24, v13

    const/4 v13, 0x2

    if-le v10, v13, :cond_1b

    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_9
    invoke-virtual {v14, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_a

    :cond_1b
    invoke-virtual {v14, v9, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_a

    :cond_1c
    move-object/from16 v24, v13

    iget v5, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x4

    if-eq v5, v10, :cond_1d

    iget v5, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x3

    if-ne v5, v10, :cond_1b

    :cond_1d
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    const/4 v13, 0x1

    if-le v10, v13, :cond_1b

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    sub-int/2addr v10, v13

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_9

    :goto_a
    const-string v2, "audio_src_ids"

    const-string v5, "audios"

    invoke-virtual {v11, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v14, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "src_id_to_mux"

    invoke-virtual {v15, v2, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v7, v15}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "content_src_ids"

    invoke-virtual {v2, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v2, "content_src_id_sets"

    invoke-virtual {v4, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_b

    :cond_1e
    move-object/from16 v20, v2

    move-object/from16 v22, v5

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object/from16 v24, v13

    :goto_b
    const-string v2, "content_type"

    const-string v5, "movie"

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v2, v16

    move-object/from16 v5, v19

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "heartbeatLifetime"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1f

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "lifetime"

    const-string v10, "heartbeatLifetime"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v9, "heartbeat"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "keep_method"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1f
    const-string v6, "priority"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_20

    const-string v6, "priority"

    const-string v7, "priority"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    invoke-virtual {v4, v6, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    :cond_20
    const-string v6, "protocols"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_21

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "name"

    const-string v9, "http"

    invoke-virtual {v6, v7, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    const-string v14, "http_output_download_parameters"

    invoke-virtual {v10, v14, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v13, "parameters"

    invoke-virtual {v9, v13, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "http_parameters"

    invoke-virtual {v7, v10, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "parameters"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "protocol"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_21
    const-string v6, "recipeId"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_22

    const-string v6, "recipe_id"

    const-string v7, "recipeId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_22
    const-string v6, "signature"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_23

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "signature"

    const-string v10, "signature"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "token"

    const-string v10, "token"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "session_operation_auth_by_signature"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "session_operation_auth"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_23
    const-string v6, "timing_constraint"

    const-string v7, "unlimited"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3, v12, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->V:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sessionRequestJSON : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v4, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v4}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v6, "http.cookie-store"

    iget-object v7, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v4, v6, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Lorg/apache/http/client/methods/HttpPost;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v13, v24

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "?_format=json"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "firstSessionURL : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "?_format=json"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :try_start_3
    new-instance v7, Lorg/apache/http/entity/StringEntity;

    iget-object v8, v1, Le/e/a/d0;->V:Ljava/lang/String;

    move-object/from16 v9, v23

    invoke-direct {v7, v8, v9}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v3, v6, v4}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    new-instance v6, Ljava/lang/String;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    invoke-direct {v6, v4, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sessionresdata : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_d

    :catch_0
    move-exception v0

    move-object v4, v0

    goto :goto_c

    :catch_1
    move-exception v0

    move-object v4, v0

    move-object v6, v5

    :goto_c
    :try_start_5
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :goto_d
    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v4, v22

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "?_format=json&_method=PUT"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->V:Ljava/lang/String;

    const-string v3, "sessionURL"

    iget-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    move-object/from16 v7, v21

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "sessionRequest"

    iget-object v5, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "isNewsaba"

    iget-boolean v5, v1, Le/e/a/d0;->w:Z

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sessionURL : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v7, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "content_uri : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v7, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v2, v20

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "comment"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "server"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "threads"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v4, "url"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/api/"

    const-string v5, "/api.json/"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->E:Ljava/lang/String;

    const/4 v3, 0x0

    :goto_e
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_26

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "isDefaultPostTarget"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    :cond_25
    move-object v7, v10

    :cond_26
    const-string v2, "nicovideo_version"

    const/4 v3, 0x2

    invoke-virtual {v7, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "cookie"

    iget-object v3, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v3}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Le/e/a/d0;->a(Landroid/os/Bundle;)V

    return-object v7

    :cond_27
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_28

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Z)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->d()V

    :goto_f
    const/4 v2, 0x0

    goto :goto_11

    :cond_28
    const-string v2, "message"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_29

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v3, "message"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_10
    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_f

    :cond_29
    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v3, "\u3053\u306e\u52d5\u753b\u306f\u518d\u751f\u3067\u304d\u307e\u305b\u3093"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_10

    :goto_11
    return-object v2

    :catch_2
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x0

    return-object v2
.end method

.method public run()V
    .registers 19

    move-object/from16 v1, p0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->z:Ljava/lang/Boolean;

    iget-object v0, v1, Le/e/a/d0;->p:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_e

    .line 1
    iget-object v0, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    if-nez v0, :cond_0

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f005a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    :cond_0
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    if-nez v0, :cond_2

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006e

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f005b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto/16 :goto_6

    :cond_1
    new-instance v0, Lnicoid/network238/SessionStore258;

    invoke-direct {v0}, Lnicoid/network238/SessionStore258;-><init>()V

    iput-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    :cond_2
    const-string v0, "Anicoid"

    const-string v3, "\u901a\u308a\u307e\u3059 "

    invoke-static {v0, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, v1, Le/e/a/d0;->t:Z

    const-string v3, ""

    if-eqz v0, :cond_3

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->a()V

    if-eqz v3, :cond_d

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_d

    goto :goto_0

    :cond_3
    iget-boolean v0, v1, Le/e/a/d0;->s:Z

    if-eqz v0, :cond_4

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_d

    :goto_0
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    goto/16 :goto_5

    :cond_4
    iget-object v0, v1, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_8

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_8

    iget-object v3, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, v1, Le/e/a/d0;->L:[Ljava/lang/String;

    aget-object v5, v0, v2

    const/4 v4, 0x2

    aget-object v6, v0, v4

    iget-object v7, v1, Le/e/a/d0;->m:Landroid/os/Bundle;

    const/4 v4, 0x0

    .line 2
    :try_start_0
    iget-object v0, v1, Le/e/a/d0;->modernWatch:Lorg/json/JSONObject;

    if-eqz v0, :cond_5

    invoke-static {v1}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    move-object v8, v4

    goto :goto_2

    :cond_5
    iget-object v0, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v8, 0x7f0f005f

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    iget-object v8, v1, Le/e/a/d0;->A:Ljava/lang/String;

    iget-boolean v9, v1, Le/e/a/d0;->P:Z

    iget-object v11, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    invoke-virtual {v1, v0, v8, v9, v11}, Le/e/a/d0;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    iget-object v8, v1, Le/e/a/d0;->A:Ljava/lang/String;

    iget-boolean v9, v1, Le/e/a/d0;->P:Z

    iget-object v11, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    invoke-virtual {v1, v0, v8, v9, v11}, Le/e/a/d0;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_6
    move-object v8, v0

    goto :goto_2

    :cond_7
    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0061

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0060

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :goto_1
    move-object v8, v4

    .line 3
    :goto_2
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v0}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v9

    move-object v4, v10

    invoke-interface/range {v3 .. v9}, Le/e/a/l3/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_8
    iget-object v11, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-interface/range {v11 .. v17}, Le/e/a/l3/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    move-object v3, v10

    goto :goto_5

    :cond_9
    iget-object v0, v1, Le/e/a/d0;->b:Le/e/a/v;

    if-eqz v0, :cond_b

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_d

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_d

    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    iget-object v0, v1, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual {v0}, Le/e/a/v;->c()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->a()V

    :cond_a
    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f007a

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_5

    :cond_b
    iget-object v0, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->f(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_4

    :cond_c
    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->h(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_4
    iget-object v4, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v4}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    if-eqz v0, :cond_d

    iget-object v4, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v4, v0}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V

    :cond_d
    :goto_5
    if-nez v3, :cond_f

    iget-object v0, v1, Le/e/a/d0;->j:Landroid/os/Handler;

    new-instance v3, Le/e/a/c0;

    invoke-direct {v3, v1}, Le/e/a/c0;-><init>(Le/e/a/d0;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_6

    .line 4
    :cond_e
    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->d()V

    :cond_f
    :goto_6
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->z:Ljava/lang/Boolean;

    return-void
.end method

.method public declared-synchronized start()V
    .registers 2

    monitor-enter p0

    :try_start_0
    invoke-static {p0}, Le/e/a/PopupReturn244;->retainedLoader(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
