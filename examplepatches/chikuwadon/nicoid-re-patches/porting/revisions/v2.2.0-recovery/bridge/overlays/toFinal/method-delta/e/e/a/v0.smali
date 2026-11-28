.class public Le/e/a/v0;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/v0$l;
    }
.end annotation


# static fields
.field public static a:I = -0x1

.field public static b:Lorg/apache/http/client/CookieStore;

.field public static c:I

.field public static d:Ljava/lang/Boolean;

.field public static e:J

.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/Float;

.field public static h:Ljava/lang/Boolean;

.field public static i:Lcom/android/vending/billing/IInAppBillingService;

.field public static j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static a(ILorg/json/JSONArray;Landroid/content/Context;)I
    .registers 8

    invoke-static {p0, p1, p2}, Le/e/a/HistoryLimit120;->adjust(ILorg/json/JSONArray;Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object p1

    const-string v0, "/nicoid/"

    if-nez p0, :cond_0

    const-string p0, "bookmark.json"

    goto :goto_0

    :cond_0
    const-string p0, "history.json"

    :goto_0
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    :cond_1
    new-instance v2, Le/e/a/CacheOutputStream;

    new-instance v3, Le/e/a/CacheFile;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v3, p2, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v3, v1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance p0, Ljava/io/OutputStreamWriter;

    const-string p2, "UTF-8"

    invoke-direct {p0, v2, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance p2, Ljava/io/BufferedWriter;

    invoke-direct {p2, p0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {p2}, Ljava/io/BufferedWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return v1
.end method

.method public static a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;
    .registers 2

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-object p0
.end method

.method public static a(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/content/SharedPreferences;Z)Lcom/google/android/gms/ads/AdView;
    .registers 5

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;
    .registers 6

    if-nez p2, :cond_0

    invoke-static {p0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object p2

    :cond_0
    if-nez p2, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    invoke-static {p1, p2}, Lnicoid/network238/AuthenticatedGet240;->tryGet(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    return-object v0

    :cond_2
    new-instance p0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v1, "http.cookie-store"

    invoke-interface {v0, v1, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object p2

    const/16 v1, 0x2710

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http.socket.timeout"

    invoke-interface {p2, v2, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    invoke-virtual {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object p2

    const/16 v1, 0x32c8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "http.connection.timeout"

    invoke-interface {p2, v2, v1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance p2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {p2, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    const-string p1, "X-Frontend-Id"

    const-string v1, "6"

    invoke-virtual {p2, p1, v1}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-static {p0, p2, v0}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p1

    new-instance p2, Ljava/lang/String;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object p1

    const-string v0, "UTF-8"

    invoke-direct {p2, p1, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-string p2, ""

    :goto_0
    invoke-virtual {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object p0

    invoke-interface {p0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    return-object p2
.end method

.method public static a([ILjava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0, p1}, Le/e/a/SearchFilters;->url([ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lorg/apache/http/client/CookieStore;",
            ")",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    if-nez p3, :cond_0

    invoke-static {p0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object p3

    :cond_0
    const/4 p0, 0x0

    if-nez p3, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lnicoid/network238/AuthenticatedWrite241;->supports(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1, p2, p3}, Lnicoid/network238/AuthenticatedWrite241;->post(Ljava/lang/String;Ljava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(ILandroid/content/Context;)Lorg/json/JSONArray;
    .registers 6

    const-string v0, "/nicoid/"

    if-nez p0, :cond_0

    const-string p0, "bookmark.json"

    goto :goto_0

    :cond_0
    const-string p0, "history.json"

    :goto_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    :try_start_0
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    :cond_1
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Le/e/a/CacheInputStream;->readTextRC2(Ljava/io/File;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0
.end method

.method public static a(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    invoke-static {p0, p1}, Le/e/a/BackgroundEntry233;->start(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    :cond_1
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_0
    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;[I)V
    .registers 16

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const/4 v0, 0x4

    new-array v7, v0, [I

    const/4 v0, 0x0

    const-string v1, "search_Type"

    invoke-interface {v6, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    aput v1, v7, v0

    const-string v1, "search_Sort"

    invoke-interface {v6, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v8, 0x1

    aput v1, v7, v8

    const-string v1, "search_Time"

    invoke-interface {v6, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v9, 0x2

    aput v1, v7, v9

    const-string v1, "search_Date"

    invoke-interface {v6, v1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x3

    aput v1, v7, v2

    if-eqz p2, :cond_0

    aget v1, p2, v0

    aput v1, v7, v0

    aget v1, p2, v8

    aput v1, v7, v8

    aget v1, p2, v9

    aput v1, v7, v9

    aget p2, p2, v2

    aput p2, v7, v2

    :cond_0
    const-string p2, "layout_inflater"

    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/LayoutInflater;

    const v1, 0x7f0b002d

    const/4 v3, 0x0

    invoke-virtual {p2, v1, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const v1, 0x7f050088

    invoke-static {p2}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ArrayAdapter;

    const v3, 0x7f0b007a

    invoke-direct {v1, p0, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v4, 0x7f0b007a

    invoke-virtual {v1, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    const v5, 0x7f0f022c

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01ae

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f080187

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/v0$e;

    invoke-direct {v1, v7}, Le/e/a/v0$e;-><init>([I)V

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    aget v1, v7, v0

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setSelection(I)V

    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-direct {v1, p0, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    const v5, 0x7f0f01a4

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a8

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a2

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f019e

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a0

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f019c

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a1

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f019d

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01a9

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f019f

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f01aa

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v5, 0x7f0f019b

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    aget v5, v7, v8

    const/16 v10, 0xb

    if-le v5, v10, :cond_1

    aput v0, v7, v8

    :cond_1
    const v5, 0x7f080188

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Spinner;

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/v0$f;

    invoke-direct {v1, v7}, Le/e/a/v0$f;-><init>([I)V

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    aget v1, v7, v8

    invoke-virtual {v5, v1}, Landroid/widget/Spinner;->setSelection(I)V

    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-direct {v1, p0, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    const v5, 0x7f0f011c

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v10, 0x7f0f011f

    invoke-virtual {p0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v10, 0x7f0f011e

    invoke-virtual {p0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v10, 0x7f0f011d

    invoke-virtual {p0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    aget v10, v7, v9

    if-le v10, v2, :cond_2

    aput v0, v7, v9

    :cond_2
    const v10, 0x7f080189

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Spinner;

    invoke-virtual {v10, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/v0$g;

    invoke-direct {v1, v7}, Le/e/a/v0$g;-><init>([I)V

    invoke-virtual {v10, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    aget v1, v7, v9

    invoke-virtual {v10, v1}, Landroid/widget/Spinner;->setSelection(I)V

    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-direct {v1, p0, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v3, 0x7f0f011b

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v3, 0x7f0f011a

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    aget v3, v7, v2

    if-le v3, v9, :cond_3

    aput v0, v7, v2

    :cond_3
    const v0, 0x7f08018a

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/v0$h;

    invoke-direct {v1, v7}, Le/e/a/v0$h;-><init>([I)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    aget v1, v7, v2

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-static {p0, p2, v7}, Le/e/a/SearchFilters;->install(Landroid/content/Context;Landroid/view/View;[I)V

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const v0, 0x7f080086

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/widget/EditText;

    invoke-virtual {v11, v8}, Landroid/widget/EditText;->setInputType(I)V

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    const-string p1, ""

    :goto_0
    invoke-virtual {v11, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const p1, 0x7f0f0118

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/16 v0, 0x10

    invoke-virtual {v11, v0}, Landroid/widget/EditText;->setGravity(I)V

    new-instance v12, Le/e/a/v0$i;

    move-object v0, v12

    move-object v1, v11

    move-object v2, p0

    move-object v3, v10

    move-object v4, v7

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Le/e/a/v0$i;-><init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/content/SharedPreferences$Editor;[ILandroid/content/SharedPreferences;)V

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    const v0, 0x7f0800ca

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    const v1, 0x7f0701a8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    const v1, 0x7f0700c8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    new-instance v1, Le/e/a/v0$j;

    invoke-direct {v1, v6, p0, v11, v10}, Le/e/a/v0$j;-><init>(Landroid/content/SharedPreferences;Landroid/content/Context;Landroid/widget/EditText;Landroid/content/SharedPreferences$Editor;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v12, Le/e/a/v0$k;

    move-object v0, v12

    move-object v1, v11

    invoke-direct/range {v0 .. v5}, Le/e/a/v0$k;-><init>(Landroid/widget/EditText;Landroid/content/Context;Landroid/content/SharedPreferences$Editor;[ILandroid/content/SharedPreferences;)V

    invoke-virtual {p2, p1, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0, v8}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v9}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->compactDialogButtons(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static a(Ljava/lang/String;ILandroid/content/Context;)V
    .registers 3

    invoke-static {p2, p0, p1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    const/4 p1, 0x0

    const/16 p2, 0x10

    invoke-virtual {p0, p2, p1, p1}, Landroid/widget/Toast;->setGravity(III)V

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public static a(Landroid/content/SharedPreferences;)Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "nologin"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "save_cookie"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "user_session="

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const-string v1, "login_mail"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "login_pass"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    const-string v1, "nologin"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    xor-int/2addr p0, v0

    return p0

    :cond_3
    :goto_0
    return v2
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 7

    if-nez p2, :cond_0

    invoke-static {p0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object p2

    :cond_0
    const/4 p0, 0x0

    if-nez p2, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnicoid/network238/AuthenticatedWrite241;->supports(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1, p2}, Lnicoid/network238/AuthenticatedWrite241;->delete(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;
    .registers 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lnicoid/network238/SessionStore258;

    invoke-direct {v0}, Lnicoid/network238/SessionStore258;-><init>()V

    const/16 v1, 0x20

    const-string v2, "([^=]+)=([^;]*); "

    invoke-static {v2, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    :goto_0
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lorg/apache/http/impl/cookie/BasicClientCookie;

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, ".nicovideo.jp"

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static b()Z
    .registers 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Le/e/a/v0;->e:J

    sub-long/2addr v0, v2

    const/4 v2, 0x1

    const-wide/32 v3, 0x16e360

    cmp-long v5, v0, v3

    if-gtz v5, :cond_0

    const-string v0, "\u30c8\u30fc\u30af\u30f3\u3055\u3093\uff1a"

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sget-wide v5, Le/e/a/v0;->e:J

    sub-long/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    return v2

    :cond_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    sget-object v3, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    const-string v4, "http.cookie-store"

    invoke-interface {v1, v4, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    const-string v4, "https://www.nicovideo.jp/my"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    :try_start_0
    invoke-static {v0, v3, v1}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u30ed\u30b0\u30a4\u30f3\u51e6\u7406:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v5, v1, v3

    invoke-interface {v5}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    aget-object v4, v1, v3

    invoke-interface {v4}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".*niconico-id.*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v4, :cond_1

    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sput-wide v4, Le/e/a/v0;->e:J

    aget-object v1, v1, v3

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    :catch_1
    move-exception v1

    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    return v2
.end method

.method public static h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;
    .registers 12

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x1

    const-string v1, "nologin"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p0, Lnicoid/network238/SessionStore258;

    invoke-direct {p0}, Lnicoid/network238/SessionStore258;-><init>()V

    return-object p0

    :cond_0
    const/4 v0, 0x0

    const-string v1, "login_mail"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "login_pass"

    invoke-interface {p0, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "save_cookie"

    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    invoke-static {v4}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object v5

    sput-object v5, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    return-object v5

    :cond_1
    if-eqz v1, :cond_10

    if-nez v2, :cond_2

    goto/16 :goto_7

    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_f

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3

    goto/16 :goto_6

    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cooks"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v4, :cond_4

    invoke-static {v4}, Le/e/a/v0;->b(Ljava/lang/String;)Lorg/apache/http/client/CookieStore;

    move-result-object v4

    sput-object v4, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    :cond_4
    sget-object v4, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    const/4 v5, 0x0

    if-nez v4, :cond_5

    goto :goto_0

    :cond_5
    invoke-static {}, Le/e/a/v0;->b()Z

    move-result v4

    if-eqz v4, :cond_6

    const/4 v4, 0x0

    goto :goto_1

    :cond_6
    :goto_0
    const/4 v4, 0x1

    :goto_1
    if-eqz v4, :cond_d

    const-string v4, "\u30af\u30c3\u30ad\u30fcnicologin"

    invoke-static {v4}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v6, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    invoke-static {v6}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v4, "UTF-8"

    .line 1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_7

    goto/16 :goto_4

    :cond_7
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    sget-object v7, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    const-string v8, "http.cookie-store"

    invoke-interface {v6, v8, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v7

    new-instance v8, Le/e/a/w0;

    invoke-direct {v8}, Le/e/a/w0;-><init>()V

    const-string v9, "lenient"

    invoke-virtual {v7, v9, v8}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    const-string v8, "http.protocol.cookie-policy"

    invoke-interface {v7, v8, v9}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    const-string v8, "https://account.nicovideo.jp/api/v1/login?site=niconico"

    invoke-direct {v7, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    const-string v9, "http.useragent"

    const-string v10, "Windows"

    invoke-interface {v8, v9, v10}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    const-string v8, "Accept-Language"

    const-string v9, "ja-jp"

    invoke-virtual {v7, v8, v9}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Ljava/util/ArrayList;

    const/4 v9, 0x2

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v9, Lorg/apache/http/message/BasicNameValuePair;

    const-string v10, "mail_tel"

    invoke-direct {v9, v10, v1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v9, "password"

    invoke-direct {v1, v9, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :try_start_0
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v1, v8, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-static {v0, v7, v6}, Lnicoid/network238/LegacyGet258;->executeLogin(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v2

    new-instance v6, Ljava/lang/String;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v1

    invoke-direct {v6, v1, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v1, Lnicoid/network238/SessionStore258;

    invoke-direct {v1}, Lnicoid/network238/SessionStore258;-><init>()V

    const/4 v4, 0x0

    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_a

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u30ed\u30b0\u30a4\u30f3\u51e6\u7406:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v7}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "user_session"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v1, v4}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    const/4 v4, 0x1

    :cond_8
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "mfa_trusted_device_token"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v1, v4}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    const/4 v4, 0x1

    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_a
    if-eqz v4, :cond_b

    sput-object v1, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_b
    :goto_3
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    sget-object v0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    .line 2
    :cond_c
    :goto_4
    sput-object v0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    sget-object v0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    if-eqz v0, :cond_e

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    sget-object v0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    invoke-static {v0}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u30af\u30c3\u30ad\u30fc\u3092\u53d6\u5f97\u3057\u307e\u3057\u305f"

    goto :goto_5

    :cond_d
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u30af\u30c3\u30ad\u30fc\u53d6\u5f97\u6e08\u307f"

    :goto_5
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    invoke-static {v0}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_e
    sget-object p0, Le/e/a/v0;->b:Lorg/apache/http/client/CookieStore;

    return-object p0

    :cond_f
    :goto_6
    new-instance p0, Lnicoid/network238/SessionStore258;

    invoke-direct {p0}, Lnicoid/network238/SessionStore258;-><init>()V

    return-object p0

    :cond_10
    :goto_7
    new-instance p0, Lnicoid/network238/SessionStore258;

    invoke-direct {p0}, Lnicoid/network238/SessionStore258;-><init>()V

    return-object p0
.end method
