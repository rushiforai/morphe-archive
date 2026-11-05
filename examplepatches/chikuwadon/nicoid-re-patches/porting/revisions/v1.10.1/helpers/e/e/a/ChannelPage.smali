.class public final Le/e/a/ChannelPage;
.super Ljava/lang/Object;
.source "ChannelPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ChannelPage$Listing;
    }
.end annotation


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 4
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/ChannelPage;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/ChannelPage;->WORK:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1()Landroid/os/Handler;
    .registers 1

    .line 4
    sget-object v0, Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method public static channelId(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 9
    invoke-static {p0}, Le/e/a/ChannelFeed;->channelId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static duration(Ljava/lang/String;)Landroid/text/SpannableString;
    .registers 5

    .line 8
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Landroid/text/style/StyleSpan;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v1

    const/16 v2, 0x21

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v3, v1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method

.method static synthetic lambda$0(Ljava/util/ArrayList;Landroid/app/Activity;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 7

    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lt p4, p2, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    const-string p2, "videourl"

    invoke-static {p0, p2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Landroid/content/Intent;

    const-string p3, "android.intent.action.VIEW"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-direct {p2, p3, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string p0, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {p2, p1, p0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/ChannelPage$Listing;Landroid/view/View;)V
    .registers 2

    .line 14
    invoke-virtual {p0}, Le/e/a/ChannelPage$Listing;->load()V

    return-void
.end method

.method public static launch(Landroid/content/Context;Lorg/json/JSONObject;)V
    .registers 4

    .line 11
    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ch[0-9]+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    :cond_f
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sauzask.nicoid.NicoidNicorepoActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "nicoid_channel_page"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static open(Landroid/app/Activity;)Z
    .registers 19

    .line 12
    move-object/from16 v9, p0

    const-string v0, "name"

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_channel_page"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v10, 0x0

    .line 13
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 12
    if-nez v1, :cond_16

    return v10

    :cond_16
    const/4 v11, 0x1

    :try_start_17
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "id"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "ch[0-9]+"

    invoke-virtual {v7, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_154

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v12

    invoke-static {v12}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    const-string v1, "y"

    invoke-static {v9, v1, v12}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "H"

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v9, v1, v4}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "I"

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v9, v1, v4}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "O"

    invoke-static {v9, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    new-array v6, v11, [Ljava/lang/Class;

    const-class v8, Ljava/lang/CharSequence;

    aput-object v8, v6, v10

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v11, [Ljava/lang/Object;

    invoke-virtual {v3, v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "c"

    new-array v6, v11, [Ljava/lang/Class;

    const-class v8, Ljava/lang/CharSequence;

    aput-object v8, v6, v10

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v11, [Ljava/lang/Object;

    const-string v6, ""

    aput-object v6, v5, v10

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    new-instance v1, Landroid/widget/ListView;

    invoke-direct {v1, v9}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    const-string v5, "Loading\u2026"

    const-string v6, "\u8f09\u5165\u4e2d\u2026"

    invoke-static {v9, v4, v5, v6}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v13

    invoke-virtual {v13, v10}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v4, 0x0

    invoke-virtual {v1, v13, v4, v10}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "e.e.a.y0"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    new-array v6, v11, [Ljava/lang/Class;

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v10

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    new-array v8, v11, [Ljava/lang/Object;

    aput-object v9, v8, v10

    invoke-virtual {v6, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string v8, "d"

    invoke-static {v6, v8, v2}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "G"

    invoke-static {v9, v8, v6}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v8, "e.e.a.b0"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v14, 0x4

    new-array v15, v14, [Ljava/lang/Class;

    const-class v16, Landroid/content/Context;

    aput-object v16, v15, v10

    const-class v16, Ljava/util/ArrayList;

    aput-object v16, v15, v11

    sget-object v16, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v17, 0x2

    aput-object v16, v15, v17

    const/16 v16, 0x3

    aput-object v4, v15, v16

    invoke-virtual {v8, v15}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    new-array v8, v14, [Ljava/lang/Object;

    aput-object v9, v8, v10

    aput-object v5, v8, v11

    aput-object v2, v8, v17

    aput-object v6, v8, v16

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/BaseAdapter;

    const-string v4, "l"

    const-string v6, "e.e.a.b1"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    new-array v8, v11, [Ljava/lang/Class;

    const-class v14, Landroid/app/Activity;

    aput-object v14, v8, v10

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    new-array v8, v11, [Ljava/lang/Object;

    aput-object v9, v8, v10

    invoke-virtual {v6, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v2, v4, v6}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Le/e/a/ChannelPage$1;

    invoke-direct {v6, v2, v5}, Le/e/a/ChannelPage$1;-><init>(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v2, v4, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/ChannelPage$$ExternalSyntheticLambda0;

    invoke-direct {v2, v5, v9}, Le/e/a/ChannelPage$$ExternalSyntheticLambda0;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 14
    new-instance v14, Le/e/a/ChannelPage$Listing;

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v1, v14

    move-object/from16 v2, p0

    move-object v3, v12

    move-object v4, v13

    invoke-direct/range {v1 .. v8}, Le/e/a/ChannelPage$Listing;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/widget/Button;Ljava/util/ArrayList;Landroid/widget/BaseAdapter;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Le/e/a/ChannelPage$$ExternalSyntheticLambda1;

    invoke-direct {v0, v14}, Le/e/a/ChannelPage$$ExternalSyntheticLambda1;-><init>(Le/e/a/ChannelPage$Listing;)V

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/ChannelPage$2;

    invoke-direct {v0, v14}, Le/e/a/ChannelPage$2;-><init>(Le/e/a/ChannelPage$Listing;)V

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Le/e/a/ChannelPage$$ExternalSyntheticLambda2;

    invoke-direct {v0, v14}, Le/e/a/ChannelPage$$ExternalSyntheticLambda2;-><init>(Le/e/a/ChannelPage$Listing;)V

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    return v11

    .line 12
    :cond_154
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid channel ID"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_15c
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_15c} :catch_15c

    .line 15
    :catch_15c
    move-exception v0

    const-string v1, "nicoid-channel"

    const-string v2, "Unable to prepare channel page"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v0, "Unable to open channel"

    const-string v1, "\u7121\u6cd5\u958b\u555f\u983b\u9053"

    const-string v2, "\u30c1\u30e3\u30f3\u30cd\u30eb\u3092\u8868\u793a\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {v9, v2, v0, v1}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0, v11}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return v10
.end method

.method static read(Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v2, 0x4

    if-ge v1, v2, :cond_e4

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-virtual {p1, v2}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v3

    if-eqz v3, :cond_de

    const/16 v3, 0x2710

    :try_start_18
    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "User-Agent"

    const-string v4, "Mozilla/5.0"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    const/16 v4, 0x12c

    if-lt v3, v4, :cond_6a

    const/16 v4, 0x190

    if-ge v3, v4, :cond_6a

    new-instance v3, Ljava/net/URL;

    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string p0, "Location"

    invoke-virtual {v2, p0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, v4, p0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v3, "https://ch.nicovideo.jp/"

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3
    :try_end_57
    .catchall {:try_start_18 .. :try_end_57} :catchall_d6

    if-eqz v3, :cond_62

    invoke-virtual {p1, v2}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_62
    :try_start_62
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Invalid channel redirect"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_69
    :goto_69
    throw p0

    :cond_6a
    const/16 p0, 0xc8

    if-ne v3, p0, :cond_c1

    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_73
    .catchall {:try_start_62 .. :try_end_73} :catchall_d6

    const/4 v1, 0x0

    :try_start_74
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_78
    .catchall {:try_start_74 .. :try_end_78} :catchall_b7

    const/16 v4, 0x2000

    :try_start_7a
    new-array v4, v4, [B

    :goto_7c
    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_80
    .catchall {:try_start_7a .. :try_end_80} :catchall_af

    if-gez v5, :cond_94

    if-eqz v3, :cond_87

    :try_start_84
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_87
    .catchall {:try_start_84 .. :try_end_87} :catchall_b7

    :cond_87
    :try_start_87
    const-string v0, "UTF-8"

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_8d
    .catchall {:try_start_87 .. :try_end_8d} :catchall_d6

    invoke-virtual {p1, v2}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0

    :cond_94
    :try_start_94
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v6

    if-nez v6, :cond_a7

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x200000

    if-gt v6, v7, :cond_a7

    invoke-virtual {p0, v4, v0, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_7c

    :cond_a7
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Cancelled or oversized"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_af
    .catchall {:try_start_94 .. :try_end_af} :catchall_af

    :catchall_af
    move-exception p0

    move-object v1, p0

    if-eqz v3, :cond_b6

    :try_start_b3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_b6
    throw v1
    :try_end_b7
    .catchall {:try_start_b3 .. :try_end_b7} :catchall_b7

    :catchall_b7
    move-exception p0

    if-eqz v1, :cond_69

    if-eq v1, p0, :cond_bf

    :try_start_bc
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_bf
    move-object p0, v1

    goto :goto_69

    :cond_c1
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HTTP "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_d5
    .catchall {:try_start_bc .. :try_end_d5} :catchall_d6

    goto :goto_69

    :catchall_d6
    move-exception p0

    invoke-virtual {p1, v2}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    :cond_de
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    :cond_e4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Too many redirects"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static record(Ljava/lang/String;)V
    .registers 7

    .line 7
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Channel list: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v5

    const/4 p0, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception p0

    :goto_2d
    return-void
.end method

.method public static redirect(Landroid/app/Activity;)Z
    .registers 7

    .line 10
    const-string v0, "id"

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ChannelPage;->channelId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_19

    invoke-static {p0}, Le/e/a/CreatorPage;->decorateUser(Landroid/app/Activity;)V

    return v3

    :cond_19
    :try_start_19
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v4, "name"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {}, Le/e/a/Review181;->latest()Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_33

    const/4 v4, 0x0

    goto :goto_39

    :cond_33
    const-string v5, "channel"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    :goto_39
    if-eqz v4, :cond_46

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    move-object v2, v4

    :cond_46
    invoke-static {p0, v2}, Le/e/a/ChannelPage;->launch(Landroid/content/Context;Lorg/json/JSONObject;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_4c} :catch_4e

    const/4 p0, 0x1

    return p0

    :catch_4e
    move-exception p0

    const-string v0, "nicoid-channel"

    const-string v1, "Unable to redirect channel listing"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v3
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
