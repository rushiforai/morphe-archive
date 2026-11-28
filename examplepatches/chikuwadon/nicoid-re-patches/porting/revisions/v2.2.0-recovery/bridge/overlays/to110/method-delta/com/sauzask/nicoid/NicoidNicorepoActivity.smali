.class public Lcom/sauzask/nicoid/NicoidNicorepoActivity;
.super Lcom/sauzask/nicoid/NicoidActivity;
.source ""


# instance fields
.field public A:Landroid/widget/ListView;

.field public B:Landroid/app/Activity;

.field public C:Le/e/a/m0;

.field public D:Landroid/view/LayoutInflater;

.field public E:Lorg/apache/http/client/CookieStore;

.field public F:Landroid/os/Handler;

.field public G:Le/e/a/y0;

.field public H:Z

.field public I:Z

.field public J:Ljava/lang/String;

.field public K:Landroid/content/SharedPreferences;

.field public L:I

.field public M:I

.field public N:[Ljava/lang/String;

.field public O:Landroidx/appcompat/app/ActionBar;

.field public P:Lcom/google/android/gms/ads/AdView;

.field public Q:Landroid/view/View;

.field public y:Landroid/view/View;

.field public z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 19

    move-object/from16 v1, p0

    const-string v2, "title"

    const-string v3, "url"

    const-string v4, "icon"

    const-string v5, "name"

    const-string v0, "meta"

    const-string v6, "data"

    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v10, p1

    invoke-direct {v9, v10}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance v10, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v10}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v11, "http.cookie-store"

    iget-object v12, v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->E:Lorg/apache/http/client/CookieStore;

    invoke-interface {v10, v11, v12}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v8, v9, v10}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u30b9\u30c6\u30fc\u30bf\u30b9\uff1a"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/16 v10, 0xc8

    if-ne v9, v10, :cond_5

    new-instance v9, Ljava/lang/String;

    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v8

    const-string v10, "UTF-8"

    invoke-direct {v9, v8, v10}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x0

    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    :cond_0
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v6, "hasNext"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "minId"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->J:Ljava/lang/String;

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->I:Z

    const-string v0, ""

    goto :goto_0

    :cond_2
    :goto_1
    if-nez v9, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    const/4 v6, 0x0

    :goto_2
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    if-ge v6, v0, :cond_5

    :try_start_1
    invoke-virtual {v9, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v8, "object"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v10, "actor"

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v14, "thumbnail"

    const-string v15, "image"

    invoke-virtual {v8, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v16, v5

    :try_start_2
    const-string v5, ".*?\u6295\u7a3f.*?"

    invoke-virtual {v15, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object/from16 p1, v9

    :try_start_3
    const-string v9, "<font color=red>"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "</font>"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    goto :goto_3

    :cond_4
    move-object/from16 p1, v9

    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<a href=\'"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "\'>"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "</a><br>"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v9, "Anicoid"

    invoke-static {v9, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v11, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "updated"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "time"

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v11, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "main"

    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    invoke-virtual {v11, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v11, v4, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "mainurl"

    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v11, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_4

    :catch_2
    move-exception v0

    move-object/from16 v16, v5

    :goto_4
    move-object/from16 p1, v9

    :goto_5
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_6
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v9, p1

    move-object/from16 v5, v16

    goto/16 :goto_2

    :cond_5
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->F:Landroid/os/Handler;

    new-instance v2, Lcom/sauzask/nicoid/NicoidNicorepoActivity$d;

    invoke-direct {v2, v1, v7}, Lcom/sauzask/nicoid/NicoidNicorepoActivity$d;-><init>(Lcom/sauzask/nicoid/NicoidNicorepoActivity;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_7

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 7

    invoke-static {p0}, Le/e/a/FeedbackFixes;->prepareTheme(Landroid/app/Activity;)V

    invoke-super {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Le/e/a/v0;->a()I

    const p1, 0x7f1000a2

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    invoke-static {p0}, Le/e/a/DynamicTheme;->apply(Landroid/app/Activity;)V

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    const-string v0, "main_rotation"

    const-string v1, "1"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/v0;->a(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setVolumeControlStream(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->K:Landroid/content/SharedPreferences;

    const-string v1, "videolist_tap"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    iput-object p0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    new-instance v0, Le/e/a/y0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    invoke-direct {v0, v1}, Le/e/a/y0;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->G:Le/e/a/y0;

    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->D:Landroid/view/LayoutInflater;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->D:Landroid/view/LayoutInflater;

    const v1, 0x7f0b006e

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    invoke-static {v0}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance v0, Le/e/a/m0;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    iget v2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->M:I

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->z:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->G:Le/e/a/y0;

    invoke-direct {v0, v1, v2, v3, v4}, Le/e/a/m0;-><init>(Landroid/content/Context;ILjava/util/ArrayList;Le/e/a/y0;)V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->C:Le/e/a/m0;

    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->n()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-static {v0}, Le/e/a/v0;->a(Landroidx/appcompat/app/ActionBar;)Landroidx/appcompat/app/ActionBar;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->O:Landroidx/appcompat/app/ActionBar;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->s()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->C:Le/e/a/m0;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity$a;-><init>(Lcom/sauzask/nicoid/NicoidNicorepoActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-static/range {v0 .. v0}, Le/e/a/PressFeedback;->list(Landroid/widget/AbsListView;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->A:Landroid/widget/ListView;

    new-instance v1, Lcom/sauzask/nicoid/NicoidNicorepoActivity$b;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity$b;-><init>(Lcom/sauzask/nicoid/NicoidNicorepoActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->L:I

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v3, 0x7f0f00a9

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00af

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00b2

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f00ab

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, p1

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->B:Landroid/app/Activity;

    const v0, 0x7f0f00ad

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x4

    aput-object p1, v1, v0

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->O:Landroidx/appcompat/app/ActionBar;

    iget v0, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->L:I

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->t()V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNicorepoActivity;->y:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    invoke-static {p0, p1}, Le/e/a/FollowFeed;->menu(Landroid/app/Activity;Landroid/view/Menu;)Z

    move-result v0

    invoke-static {p0, p1}, Le/e/a/TabRecovery244;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 3

    const/4 v0, 0x1

    return v0
.end method

.method public final t()V
    .registers 1

    invoke-static {p0}, Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V

    return-void
.end method
