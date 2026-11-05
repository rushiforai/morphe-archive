.class public final Le/e/a/SearchSuggestions;
.super Ljava/lang/Object;
.source "SearchSuggestions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SearchSuggestions$CandidateAdapter;,
        Le/e/a/SearchSuggestions$Candidates;
    }
.end annotation


# static fields
.field static final attached:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/AutoCompleteTextView;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/SearchSuggestions$Candidates;",
            ">;>;"
        }
    .end annotation
.end field

.field static final forced:Ljava/util/WeakHashMap;
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

    .line 24
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    .line 25
    invoke-static {}, Le/e/a/SearchSuggestions;->workers()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/SearchSuggestions;->worker:Ljava/util/concurrent/ExecutorService;

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/SearchSuggestions;->forced:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/View;)V
    .registers 5

    .line 31
    instance-of v0, p0, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_49

    .line 32
    move-object v0, p0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    .line 33
    sget-object v1, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    if-nez v1, :cond_14

    move-object v1, v2

    goto :goto_1a

    :cond_14
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SearchSuggestions$Candidates;

    .line 34
    :goto_1a
    sget-object v3, Le/e/a/SearchSuggestions;->forced:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_38

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/Followup173;->suggestionsEnabled(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_38

    .line 35
    if-eqz v1, :cond_31

    invoke-virtual {v1}, Le/e/a/SearchSuggestions$Candidates;->dispose()V

    :cond_31
    invoke-virtual {v0, v2}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    .line 36
    goto :goto_49

    :cond_38
    if-nez v1, :cond_49

    new-instance v1, Le/e/a/SearchSuggestions$Candidates;

    invoke-direct {v1, v0}, Le/e/a/SearchSuggestions$Candidates;-><init>(Landroid/widget/AutoCompleteTextView;)V

    sget-object v2, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    :cond_49
    :goto_49
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_61

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_57

    goto :goto_61

    :cond_57
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SearchSuggestions;->attach(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_50

    .line 39
    :cond_61
    :goto_61
    return-void
.end method

.method public static attachTag(Landroid/view/View;)V
    .registers 4

    .line 40
    instance-of v0, p0, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_11

    sget-object v0, Le/e/a/SearchSuggestions;->forced:Ljava/util/WeakHashMap;

    move-object v1, p0

    check-cast v1, Landroid/widget/AutoCompleteTextView;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/SearchSuggestions;->attach(Landroid/view/View;)V

    :cond_11
    return-void
.end method

.method static background(Landroid/content/Context;)I
    .registers 2

    .line 41
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

.method static read(Ljava/net/HttpURLConnection;Le/e/a/NetworkTask;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/SearchSuggestions;->read(Ljava/net/HttpURLConnection;Le/e/a/NetworkTask;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static read(Ljava/net/HttpURLConnection;Le/e/a/NetworkTask;I)Ljava/util/List;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Le/e/a/NetworkTask;",
            "I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 53
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v0

    const-string v1, "Suggestion cancelled"

    if-eqz v0, :cond_159

    .line 55
    const/16 v0, 0x1770

    :try_start_a
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v2, "Accept"

    const-string v3, "application/json"

    invoke-virtual {p0, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 58
    const/16 v3, 0x12d

    const/4 v4, 0x0

    if-eq v2, v3, :cond_109

    const/16 v3, 0x12e

    if-eq v2, v3, :cond_109

    const/16 v3, 0x12f

    if-eq v2, v3, :cond_109

    const/16 v3, 0x133

    if-eq v2, v3, :cond_109

    const/16 v3, 0x134

    if-ne v2, v3, :cond_36

    goto/16 :goto_109

    .line 66
    :cond_36
    const/16 p2, 0xc8

    if-lt v2, p2, :cond_f4

    const/16 p2, 0x12c

    if-ge v2, p2, :cond_f4

    .line 67
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2
    :try_end_42
    .catchall {:try_start_a .. :try_end_42} :catchall_14f

    const-wide/16 v5, 0x2ee0

    add-long/2addr v2, v5

    .line 68
    :try_start_45
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_49
    .catchall {:try_start_45 .. :try_end_49} :catchall_ea

    :try_start_49
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_4e
    .catchall {:try_start_49 .. :try_end_4e} :catchall_da

    .line 69
    const/16 v6, 0x800

    :try_start_50
    new-array v6, v6, [B

    .line 70
    nop

    :goto_53
    invoke-virtual {p2, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_ab

    .line 75
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v2

    if-nez v2, :cond_a5

    .line 76
    new-instance v1, Lorg/json/JSONObject;

    const-string v2, "UTF-8"

    invoke-virtual {v5, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "candidates"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 77
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 78
    nop

    :goto_77
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v6, 0x8

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3
    :try_end_81
    .catchall {:try_start_50 .. :try_end_81} :catchall_d4

    if-lt v0, v3, :cond_95

    .line 79
    nop

    .line 80
    :try_start_84
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_87
    .catchall {:try_start_84 .. :try_end_87} :catchall_da

    if-eqz p2, :cond_8c

    :try_start_89
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_8c
    .catchall {:try_start_89 .. :try_end_8c} :catchall_ea

    .line 81
    :cond_8c
    if-eqz p0, :cond_94

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 79
    :cond_94
    return-object v2

    .line 78
    :cond_95
    :try_start_95
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_a2

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a2
    add-int/lit8 v0, v0, 0x1

    goto :goto_77

    .line 75
    :cond_a5
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_ab
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v8

    if-nez v8, :cond_ce

    .line 72
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v8

    add-int/2addr v8, v7

    const/high16 v9, 0x10000

    if-gt v8, v9, :cond_c6

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    cmp-long v8, v8, v2

    if-gtz v8, :cond_c6

    .line 73
    invoke-virtual {v5, v6, v0, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_53

    .line 72
    :cond_c6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Suggestion response limit"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_ce
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d4
    .catchall {:try_start_95 .. :try_end_d4} :catchall_d4

    .line 79
    :catchall_d4
    move-exception v0

    move-object v4, v0

    .line 80
    :try_start_d6
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v4
    :try_end_da
    .catchall {:try_start_d6 .. :try_end_da} :catchall_da

    :catchall_da
    move-exception v0

    if-nez v4, :cond_df

    move-object v4, v0

    goto :goto_e4

    :cond_df
    if-eq v4, v0, :cond_e4

    :try_start_e1
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_e4
    :goto_e4
    if-eqz p2, :cond_e9

    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_e9
    throw v4
    :try_end_ea
    .catchall {:try_start_e1 .. :try_end_ea} :catchall_ea

    :catchall_ea
    move-exception p2

    if-eqz v4, :cond_f3

    if-eq v4, p2, :cond_f2

    :try_start_ef
    invoke-virtual {v4, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_f2
    move-object p2, v4

    :cond_f3
    throw p2

    .line 66
    :cond_f4
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Suggestion HTTP "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 59
    :cond_109
    :goto_109
    const-string v0, "Location"

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    if-eqz v0, :cond_147

    const/4 v2, 0x5

    if-ge p2, v2, :cond_147

    .line 61
    new-instance v2, Ljava/net/URL;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SecurityPolicy240;->requireApi(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-nez v0, :cond_141

    .line 63
    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_130
    .catchall {:try_start_ef .. :try_end_130} :catchall_14f

    .line 64
    :try_start_130
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    add-int/lit8 p2, p2, 0x1

    invoke-static {p0, p1, p2}, Le/e/a/SearchSuggestions;->read(Ljava/net/HttpURLConnection;Le/e/a/NetworkTask;I)Ljava/util/List;

    move-result-object p0
    :try_end_13c
    .catchall {:try_start_130 .. :try_end_13c} :catchall_13e

    .line 81
    nop

    .line 64
    return-object p0

    .line 81
    :catchall_13e
    move-exception p2

    move-object p0, v4

    goto :goto_150

    .line 62
    :cond_141
    :try_start_141
    new-instance p2, Ljava/io/InterruptedIOException;

    invoke-direct {p2, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 60
    :cond_147
    new-instance p2, Ljava/io/IOException;

    const-string v0, "Invalid suggestion redirect"

    invoke-direct {p2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_14f
    .catchall {:try_start_141 .. :try_end_14f} :catchall_14f

    .line 81
    :catchall_14f
    move-exception p2

    :goto_150
    if-eqz p0, :cond_158

    invoke-virtual {p1, p0}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_158
    throw p2

    .line 53
    :cond_159
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static request(Ljava/lang/String;)Ljava/util/List;
    .registers 2
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

    .line 42
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    invoke-static {p0, v0}, Le/e/a/SearchSuggestions;->request(Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static request(Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 45
    :try_start_0
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 46
    :cond_b
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "+"

    const-string v1, "%20"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 47
    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://sug.search.nicovideo.jp/suggestion/complete/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 48
    invoke-static {p0, p1}, Le/e/a/SearchSuggestions;->read(Ljava/net/HttpURLConnection;Le/e/a/NetworkTask;)Ljava/util/List;

    move-result-object p0
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_37} :catch_3a
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_37} :catch_38

    return-object p0

    .line 49
    :catch_38
    move-exception p0

    goto :goto_3b

    :catch_3a
    move-exception p0

    :goto_3b
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static workers()Ljava/util/concurrent/ExecutorService;
    .registers 4

    .line 26
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v1, 0x1e

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    return-object v0
.end method
