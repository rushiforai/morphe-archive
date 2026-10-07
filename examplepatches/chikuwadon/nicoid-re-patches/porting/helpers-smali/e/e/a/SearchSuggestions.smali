.class public final Le/e/a/SearchSuggestions;
.super Ljava/lang/Object;
.source "SearchSuggestions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SearchSuggestions$Candidates;,
        Le/e/a/SearchSuggestions$CandidateAdapter;
    }
.end annotation


# static fields
.field static final attached:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/AutoCompleteTextView;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static final main:Landroid/os/Handler;

.field static final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/SearchSuggestions;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/View;)V
    .registers 4

    .line 5
    instance-of v0, p0, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_1e

    move-object v0, p0

    check-cast v0, Landroid/widget/AutoCompleteTextView;
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static {v1}, Le/e/a/Followup173;->suggestionsEnabled(Landroid/content/Context;)Z
    move-result v1
    if-nez v1, :suggestions_enabled
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V
    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V
    goto :cond_1e
    :suggestions_enabled

    sget-object v1, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    sget-object v1, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/SearchSuggestions$Candidates;

    invoke-direct {v1, v0}, Le/e/a/SearchSuggestions$Candidates;-><init>(Landroid/widget/AutoCompleteTextView;)V

    :cond_1e
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_35

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_35

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SearchSuggestions;->attach(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_35
    return-void
.end method

.method static background(Landroid/content/Context;)I
    .registers 2

    .line 12
    invoke-static {p0}, Le/e/a/FeedbackFixes;->amoled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    const p0, -0xe7e7e8

    goto :goto_17

    :cond_a
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_14

    const p0, -0xdbdbdc

    goto :goto_17

    :cond_14
    const p0, -0x50506

    :goto_17
    return p0
.end method

.method static request(Ljava/lang/String;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 18
    const-string v0, "UTF-8"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :try_start_8
    new-instance v3, Ljava/net/URL;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://sug.search.nicovideo.jp/suggestion/complete/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v5, "+"

    const-string v6, "%20"

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_32} :catch_d5
    .catchall {:try_start_8 .. :try_end_32} :catchall_ce

    const/16 v2, 0x1770

    :try_start_34
    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x2ee0

    add-long/2addr v2, v4

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_4c} :catch_cb
    .catchall {:try_start_34 .. :try_end_4c} :catchall_c8

    :try_start_4c
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_51
    .catchall {:try_start_4c .. :try_end_51} :catchall_bc

    const/16 v6, 0x800

    :try_start_53
    new-array v6, v6, [B

    :goto_55
    invoke-virtual {v4, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    const/4 v9, 0x0

    if-eq v7, v8, :cond_79

    invoke-virtual {v5, v6, v9, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    const/high16 v8, 0x10000

    if-gt v7, v8, :cond_71

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v7

    cmp-long v9, v7, v2

    if-gtz v9, :cond_71

    goto :goto_55

    :cond_71
    new-instance v0, Ljava/io/IOException;

    const-string v2, "candidate response limit"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_79
    new-instance v2, Lorg/json/JSONObject;

    invoke-virtual {v5, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "candidates"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    :goto_88
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0x8

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v9, v2, :cond_a4

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a1
    .catchall {:try_start_53 .. :try_end_a1} :catchall_b2

    :cond_a1
    add-int/lit8 v9, v9, 0x1

    goto :goto_88

    :cond_a4
    :try_start_a4
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a7
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_bc

    if-eqz v4, :cond_ac

    :try_start_a9
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_ac
    .catch Ljava/lang/Exception; {:try_start_a9 .. :try_end_ac} :catch_cb
    .catchall {:try_start_a9 .. :try_end_ac} :catchall_c8

    :cond_ac
    if-eqz p0, :cond_db

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_db

    :catchall_b2
    move-exception v0

    :try_start_b3
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_b6
    .catchall {:try_start_b3 .. :try_end_b6} :catchall_b7

    goto :goto_bb

    :catchall_b7
    move-exception v2

    :try_start_b8
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_bb
    throw v0
    :try_end_bc
    .catchall {:try_start_b8 .. :try_end_bc} :catchall_bc

    :catchall_bc
    move-exception v0

    if-eqz v4, :cond_c7

    :try_start_bf
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_c2
    .catchall {:try_start_bf .. :try_end_c2} :catchall_c3

    goto :goto_c7

    :catchall_c3
    move-exception v2

    :try_start_c4
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c7
    :goto_c7
    throw v0
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_c8} :catch_cb
    .catchall {:try_start_c4 .. :try_end_c8} :catchall_c8

    :catchall_c8
    move-exception v0

    move-object v2, p0

    goto :goto_cf

    :catch_cb
    move-exception v0

    move-object v2, p0

    goto :goto_d6

    :catchall_ce
    move-exception v0

    :goto_cf
    if-eqz v2, :cond_d4

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_d4
    throw v0

    :catch_d5
    move-exception p0

    :goto_d6
    if-eqz v2, :cond_db

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_db
    :goto_db
    return-object v1
.end method
